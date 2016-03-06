function initialize() {

google.maps.event.addListener(marker, 'click', function() {
       infoWindow.open(map, marker);
   });
 }
