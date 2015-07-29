$(document).ready(function(){
  function getLocation() {
      navigator.geolocation.getCurrentPosition(function(position) {
        var latitude = position.coords.latitude.toFixed(2);
        var longitude = position.coords.longitude.toFixed(2);

        insertMap(latitude, longitude);
      });
  }
  var coords =  getLocation();
});

function insertMap(latitude, longitude) {
      var myLatLng = new google.maps.LatLng(latitude, longitude);
      var mapCanvas = document.getElementById('map-canvas');
      var mapOptions = {
        center: myLatLng,
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      var map = new google.maps.Map(mapCanvas, mapOptions); 

      var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        animation: google.maps.Animation.DROP,
        draggable: true
      }); 
      google.maps.event.addListener(marker, 'click', toggleBounce);
    }

    function toggleBounce() {
      if (marker.getAnimation() != null) {
        marker.setAnimation(null);
      } else {
        marker.setAnimation(google.maps.Animation.BOUNCE);
      }
    }