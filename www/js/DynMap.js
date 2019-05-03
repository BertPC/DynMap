var map;
var markers = [];

// Marker sizes are expressed as a Size of X,Y where the origin
// of the image (0,0) is located in the top left of the image.
// Origins, anchor positions and coordinates of the marker increase
// in the X direction to the right and in the Y direction down.
var image = new google.maps.MarkerImage('images/envelope-24x24.png',
  // This marker is 24 pixels wide by 24 pixels tall.
  new google.maps.Size(24, 24),
  // The origin for this image is 0,0.
  new google.maps.Point(0, 0),
  // The anchor for this image is set so the image is centered on the point
  new google.maps.Point(12, 12));
var goldStar = {
  path: 'M 125,5 155,90 245,90 175,145 200,230 125,180 50,230 75,145 5,90 95,90 z',
  fillColor: "yellow",
  fillOpacity: 0.8,
  scale: 1,
  strokeColor: "gold",
  strokeWeight: 14
};
//      var shadow = new google.maps.MarkerImage('beachflag_shadow.png',
//        // The shadow image is larger in the horizontal dimension
//        // while the position and offset are the same as for the main image.
//        new google.maps.Size(37, 32),
//        new google.maps.Point(0,0),
//        new google.maps.Point(0,32));
//        // Shapes define the clickable region of the icon.
//        // The type defines an HTML &lt;area&gt; element 'poly' which
//        // traces out a polygon as a series of X,Y points. The final
//        // coordinate closes the poly by connecting to the first coordinate.
var shape = {
  coord: [1, 1, 1, 20, 18, 20, 18 , 1],
  type: 'poly'
};
 
function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(20,-10),
    zoom: 2,
    draggable: false,
    mapTypeId: google.maps.MapTypeId.HYBRID,
    disableDoubleClickZoom: true
  };
  map = new google.maps.Map(document.getElementById("map_canvas"),
    mapOptions);

  google.maps.event.addListener(map, 'click', function(event) {
    addMarkerToMap('', event.latLng.lat(), event.latLng.lng());
  });
}

function addMarkerToMap(markerType, lat, lng) {
  marker = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lng),
    map: map,
    icon: image,
    shape: shape,
    title: markerType
  });
  markers.push(marker);
  // Set end-of-life for marker (need closure for this to retain pointer to each marker)
  (function(markerToDelete) {
    window.setTimeout(function() { clearMarker(markerToDelete); }, 1000);
  }(marker));
}

function addMarkerSetToMap(markerType, markerSet) {
  for (var i=0; i < markerSet.length; i++) {
    addMarkerToMap(markerType, markerSet[i].lat, markerSet[i].lng);
  }
}

function setAllMap(map) {
  for (var i=0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

function clearMarker(marker) {
  marker.setMap(null);
  delete marker;
}

function clearOverlays() { setAllMap(null); }
function showOverlays() { setAllMap(map); }
function deleteOverlays() { clearOverlays(); markers=[]; }

function sprinklePoints() {
  var markerSet = [];
  // Create random set of points
  for(p=0; p<10; p++) {
    var rLatD=Math.floor(Math.random()*111);
    rLatD=rLatD%2==0 ? rLatD : rLatD*-1;
    var rLonD=Math.floor(Math.random()*111);
    rLonD=rLonD%2==0 ? rLonD : rLonD*-1;
    markerSet.push( { lat : rLatD, lng : rLonD } );
  }
  addMarkerSetToMap('', markerSet);
}

google.maps.event.addDomListener(window, 'load', initialize);

function debug() {
  for(i=0;i<markers.length;i++) {
    console.log(markers[i]);
  }
}
