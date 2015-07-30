function initialize() {
  navigator.geolocation.getCurrentPosition(function(position) {
    var latitude = position.coords.latitude.toFixed(2);
    var longitude = position.coords.longitude.toFixed(2);

    map = new Map(latitude, longitude);
    map.insertHiddens(latitude,longitude);
  });
};

function Map(latitude, longitude) {
  var myLatLng = new google.maps.LatLng(latitude, longitude);
      mapCanvas = document.getElementById('map-canvas');
      mapOptions = {
        center: myLatLng,
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      },
      map = new google.maps.Map(mapCanvas, mapOptions), 
      marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        animation: google.maps.Animation.DROP,
        draggable: true
      }); 

  google.maps.event.addListener(marker, 'dragend', function(){
        var newLatLng = marker.getPosition();
        map.changeCoords(newLatLng);
      });
  google.maps.event.trigger(marker, 'click');
  google.maps.event.addListener(marker, 'dragend', this.bounce);
};

Map.prototype.bounce = function() {
  marker.setAnimation(google.maps.Animation.BOUNCE);
  setTimeout(function(){ marker.setAnimation(null); }, 500);
};

Map.prototype.insertHiddens = function(latitude, longitude) {
  $('#search_lt').val(latitude);
  $('#search_lg').val(longitude);
};

Map.prototype.changeCoords = function(newLatLng) {
  map.insertHiddens(newLatLng.lat(), newLatLng.lng());
};


















