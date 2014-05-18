var map;

$(document).ready(function () {
  map = new GMaps({ el: '#map', size: [300, 300], lat: 37.472189, lng: -122.190191, panControl: false, zoomControl: false, scaleControl: false, streetViewControl: false, zoom: 16, mapTypeId: google.maps.MapTypeId.ROADMAP });
  map.addMarker({ lat: 37.472189, lng: -122.190191, infoWindow: { content: '<p><a href="http://en.wikipedia.org/wiki/File:Invitation_to_First_Homebrew_Computer_Club_meeting.jpg" target="_blank">Homebrew Computer Club</a></p><p>circa 1975</p>' } });
  $('#use-original-address').click(function () {
    $('#confirm-address').modal('hide');
  });

  $('#use-formatted-address').click(function () {
    $('#user_group_venues_locations_full_street_address').val(formattedAddress);
    $('#confirm-address').modal('hide');
  });

  $('#user_group_venues_locations_full_street_address').blur(function(e){
    e.preventDefault();
    var originalAddress = $.trim($('#user_group_venues_locations_full_street_address').val());
    GMaps.geocode({
      address: originalAddress,
      callback: function(results, status) {
        if (status == 'OK') {
          var latlng = results[0].geometry.location;
          map.setCenter(latlng.lat(), latlng.lng());
          map.addMarker({ lat: latlng.lat(), lng: latlng.lng() });
          $('#confirm-address').modal('show');
          formattedAddress = results[0].formatted_address;
          // hidden-field for the form
          $('#formatted_address').val(formattedAddress);
          $('#user_group_venues_locations_latitude').val(latlng.lat());
          $('#user_group_venues_locations_longitude').val(latlng.lng());
          // display on modal
          $("#formatted-address").text(formattedAddress);
          $("#original-address").text(originalAddress);
        }
      }
    });
  });
});
