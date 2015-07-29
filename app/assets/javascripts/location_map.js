$(document).ready(function(){
  function getLocation() {
      navigator.geolocation.getCurrentPosition(function(position) {
        var latitude = position.coords.latitude.toFixed(2);
        var longitude = position.coords.longitude.toFixed(2);

        $('#longitude').text(longitude);
        $('#latitude').text(latitude);
        insertMap(latitude, longitude);
      });
  }
  var coords =  getLocation();
});

function insertMap(latitude, longitude) {
      var mapCanvas = document.getElementById('map-canvas');
      var mapOptions = {
        center: new google.maps.LatLng(latitude, longitude),
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      var map = new google.maps.Map(mapCanvas, mapOptions);  
    }