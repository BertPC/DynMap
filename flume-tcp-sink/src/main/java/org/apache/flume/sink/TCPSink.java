package org.apache.flume.sink;

import org.apache.flume.Channel;
import org.apache.flume.ChannelException;
import org.apache.flume.Event;
import org.apache.flume.EventDeliveryException;
import org.apache.flume.Sink;
import org.apache.flume.Transaction;
import org.apache.flume.CounterGroup;
import org.apache.flume.Context;
import org.apache.flume.conf.Configurable;
import org.apache.flume.event.EventHelper;

import java.io.*;
import java.net.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <p>
 * A {@link Sink} implementation that sends all events to the
 * <tt>org.apache.flume.sink.LoggerSink</tt> logger.
 * </p>
 * <p>
 * <b>WARNING:</b> Logging events can potentially introduce performance
 * degradation.
 * </p>
 * <p>
 * <b>Configuration options</b>
 * </p>
 * <p>
 * <i>This sink has no configuration parameters.</i>
 * </p>
 */
public class TCPSink extends AbstractSink implements Configurable {

	private static final int DEFAULT_PORT = 4242;
	private String hostname;
	private int port;

	private CounterGroup counterGroup;
	private static final Logger logger = LoggerFactory
			.getLogger(LoggerSink.class);

	public TCPSink() {
		counterGroup = new CounterGroup();
	}

	@Override
	public void configure(Context context) {
		String host = context.getString("host", "127.0.0.1");
		String portStr = context.getString("port");

		// Store hostname and port for later retrieval by process() method
		this.hostname = host;
		if (portStr != null) {
			this.port = Integer.parseInt(portStr);
		} else {
			this.port = DEFAULT_PORT;
		}
	}

	@Override
	public void start() {
		// Initialize the connection to the external repository (e.g. HDFS) that
		// this Sink will forward Events to ..
		logger.info("TCPSink {} starting!", this.getName());
	}

	@Override
	public void stop() {
		// Disconnect from the external respository and do any additional
		// cleanup (e.g. releasing resources or nulling-out field values)

		logger.info("TCP sink {} stopping", this.getName());
		// super.stop();
		logger.debug("TCP sink {} stopped. Metrics:{}", this.getName(),
				counterGroup);
	}

	@Override
	public Status process() throws EventDeliveryException {
		Status status = Status.READY;
		Channel channel = getChannel();
		Transaction transaction = channel.getTransaction();

		try {
			transaction.begin();
			// createConnection();

			// Grab an event from the channel
			Event event = channel.take();

			if (event == null) {
				counterGroup.incrementAndGet("event.empty");
				status = Status.BACKOFF;
			} else {
				sendData(event);
				counterGroup.incrementAndGet("event.tcp");
			}

			transaction.commit();

		} catch (ChannelException e) {
			transaction.rollback();
			logger.error(
					"Unable to get event from channel. Exception follows.", e);
			status = Status.BACKOFF;
		} catch (Exception e) {
			transaction.rollback();
			logger.error(
					"Unable to communicate with IRC server. Exception follows.",
					e);
			status = Status.BACKOFF;
			// destroyConnection();
		} finally {
			transaction.close();
		}

		return status;
	}

	private void sendData(Event event) {

		// Open TCP connection to configured hostname/port
		try {

			// Create input and output streams to socket
			Socket sock = null;
			OutputStream sockOutput = null;
			InputStream sockInput = null;

			try {
				// Create a connection to server (will eventually do this just once)
				sock = new Socket("127.0.0.1", 4242);
				sockOutput = sock.getOutputStream();
				sockInput = sock.getInputStream();
			} catch (UnknownHostException e) {
				System.err.println("Cannot find host.");
				System.exit(1);
			} catch (IOException e) {
				System.err.println("Unable to open I/O connection to host.");
				System.exit(1);
			}

			byte[] data = event.getBody();
			byte[] buf = new byte[data.length];
			int bytes_read = 0;
			try {
				sockOutput.write(data, 0, data.length);
				bytes_read = sockInput.read(buf, 0, buf.length);
			} catch (IOException e) {
				e.printStackTrace(System.err);
			}
			if (bytes_read < data.length) {
				System.err.println("run: Sent " + data.length
					+ " bytes, server should have sent them back, read "
					+ bytes_read + " bytes, not the same number of bytes.");
			} else {
				System.err.println("Sent "
					+ bytes_read
					+ " bytes to server and received them back again, msg = "
					+ (new String(data)));
			}

			System.err.println("Done reading/writing to/from socket,"
					+ " closing socket.");

			// Terminate connections
			sockOutput.close();
			sockInput.close();
			sock.close();

		} catch (SocketException e) {
			System.err.println("Socket error : " + e);
		} catch (UnknownHostException e) {
			System.err.println("Invalid hostname/port!");
		} catch (IOException e) {
			System.err.println("I/O error : " + e);
		}
	}

}