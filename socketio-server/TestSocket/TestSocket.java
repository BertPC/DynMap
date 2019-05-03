import java.net.*;
import java.io.*;

public class TestSocket
{
	
  public static void main(String[] args)
  {

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
        
        	byte[] data = "Hello World".getBytes();
        	byte[] buf = new byte[data.length];
			int bytes_read = 0;
         try {
             sockOutput.write(data, 0, data.length); 
             bytes_read = sockInput.read(buf, 0, buf.length);
         }
         catch (IOException e){
             e.printStackTrace(System.err);
         }
         if(bytes_read < data.length) {
             System.err.println("run: Sent "+data.length+" bytes, server should have sent them back, read "+bytes_read+" bytes, not the same number of bytes.");
         }
         else {
             System.err.println("Sent "+bytes_read+" bytes to server and received them back again, msg = "+(new String(data)));
         }

        	System.err.println("Done reading/writing to/from socket, closing socket.");
        	
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
