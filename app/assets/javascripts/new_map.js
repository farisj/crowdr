function initialize() {
  navigator.geolocation.getCurrentPosition(function(position) {
    var latitude = position.coords.latitude.toFixed(2);
    var longitude = position.coords.longitude.toFixed(2);

    map = new Map(latitude, longitude);
    map.insertHiddens(latitude,longitude);
  });
};

function Map(latitude, longitude) {
  var myLatLng = new google.maps.LatLng(latitude, longitude), 
      mapCanvas = document.getElementById('map-canvas'),
      mapOptions = {
        center: myLatLng,
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      },
      map = new google.maps.Map(mapCanvas, mapOptions); 
      marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        animation: google.maps.Animation.DROP,
        draggable: true
      }); 

  google.maps.event.trigger(marker, 'click');
  google.maps.event.addListener(marker, 'click', toggleBounce);
};

Map.prototype.markerDrag = function() {
  google.maps.event.addListener(marker, 'dragend', function(){
        var newLatLng = marker.getPosition();
        map.changeCoords(newLatLng);
      });
};

Map.prototype.changeCoords = function(newLatLng) {
  insertHiddens(newLatLng.lat(), newLatLng.lng());
};

Map.prototype.insertHiddens = function(latitude, longitude) {
    $('#search_lt').val(latitude);
    $('#search_lg').val(longitude);
};


function toggleBounce() {
  if (marker.getAnimation() != null) {
    marker.setAnimation(null);
  } else {
    marker.setAnimation(google.maps.Animation.BOUNCE);
  }
}