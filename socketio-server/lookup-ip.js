var geoip = require('geoip-lite');

var ip = "216.146.45.243";
var geo = geoip.lookup(ip);

console.log(geo);

console.log('LAT: ' + geo['ll'][0]);
console.log('LNG: ' + geo['ll'][1]);

// Update this and all connected clients with new map point(s)
var io = require('socket.io');
io.sockets.emit('clicks', { { lat : geo['ll'][0],
							  lng : geo['ll'][1] } });

console.log('Broadcast complete!');

