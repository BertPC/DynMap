
var mapServer = require('http').createServer(mapHandler)
  , dnode = require('dnode')
  , io = require('socket.io').listen(mapServer)
  , fs = require('fs')
  , avro = require('avro')
  , geoip = require('geoip-lite')
  , activeClients = 0;

////////////////////////////////////////////////////////////////////
// DynMap Server
////////////////////////////////////////////////////////////////////

mapServer.listen(8075);

function mapHandler (req, res) {

  // Why do we read index.html?
  fs.readFile(__dirname + '/index.html',
  function (err, data) {
    if (err) {
      res.writeHead(500);
      return res.end('Error loading index.html');
    }

    res.writeHead(200);
    res.end(data);
  });
}


io.sockets.on('connection', function (client) {

  // Increment connected client count
  activeClients +=1;

  // Send event
  //client.emit('news', "Hello there!");
  //client.emit('news', { hello: 'world' });

  // Bind the disconnect event for this client so we update client count if/when they disconnect
  client.on('disconnect', function(){clientDisconnect(client)});

  // Update this and all connected clients with new client total
  io.sockets.emit('count', { clients:activeClients });
  //client.emit('count', { clients:activeClients });  // emit just to the curret client
  //client.broadcast.emit('count', { clients:activeClients });  // emit to all clients except current one

});


function clientDisconnect(client) {

  // Decrement connected client count
  activeClients -=1;

  // Send all remaining connected clients an update ("broadcast" emits to all except the current client)
  client.broadcast.emit('count', { clients:activeClients })

}


////////////////////////////////////////////////////////////////////
// RPC server to receive Flume events via Avro sink batches
////////////////////////////////////////////////////////////////////

//var rpcServer = dnode({
//  transform : function (s, cb) {
//    console.log(s);
//    //cb(s.replace(/[aeiou]{2,}/, 'oo').toUpperCase())
//  }
    
  //var schema = avro.prepareSchema("string");
  //var buffer = schema.encode("foo");
  //var value = schema.decode(buffer);
var sinkServer = require('net').createServer(function (socket) {
  console.log('Got one!');

//Add a 'data' event handler to this instance of socket
  socket.on('data', function(data) {
	  console.log('DATA ' + socket.remoteAddress + ': ' + data);
	  // Write the data back to the socket, the client will receive it as data from the server
	  socket.write('You said "' + data + '"');
  });
  
  // Add a 'close' event handler to this instance of socket
  socket.on('close', function(data) {
      console.log('CLOSED.');
  });

  // Update this and all connected clients with new map point(s)
  var ip = "216.146.45.243";
  var geo = geoip.lookup(ip);
  io.sockets.emit('clicks', [ { lat : geo['ll'][0],
	  						    lng : geo['ll'][1] } ]);

});

sinkServer.listen(4242, '127.0.0.1');
