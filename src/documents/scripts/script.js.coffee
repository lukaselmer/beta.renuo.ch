$ ->
  $(document).ready ->
    if($("#map_canvas").length >= 1)
      myLatlng = new google.maps.LatLng(47.421761, 8.499641)

      map_styles = [
        {
          "featureType": "road",
          "elementType": "geometry",
          "stylers": [
            { "color": "#78b3ed" },
            { "weight": 0.6 }
          ]
        },{
    "featureType": "road.highway.controlled_access",
    "stylers": [
      { "visibility": "off" }
    ]
  },{
          "featureType": "administrative",
          "stylers": [
            { "color": "#0140c9" },
            { "weight": 0.1 }
          ]
        }
      ]

      mapOptions = {
        zoom: 11,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        draggable: false,
        zoomControl: false,
        scrollwheel: false,
        disableDoubleClickZoom: false,
        keyboardShortcuts: false,
        overviewMapControl: false,
        panControl: false,
        rotateControl: false,
        scaleControl: false,
        streetViewControl: false,
        mapTypeControl: false
        styles: map_styles
      }
      map = new google.maps.Map($('#map_canvas')[0], mapOptions)

      myLatlng = new google.maps.LatLng(47.4194, 8.499308);
      marker = new google.maps.Marker
        position: myLatlng,
        map: map,
        title: 'Renuo GmbH',
        clickable: true,

      google.maps.event.addListener marker, 'click', () ->
        window.open('https://maps.google.ch/maps?q=Renuo+GmbH,+Hungerbergstrasse+26,+Z%C3%BCrich&hl=de&ie=UTF8&hq=Renuo+GmbH,&hnear=Hungerbergstrasse+26,+Kreis+11,+8046+Z%C3%BCrich&t=m&z=16&iwloc=A');

  $(document).ready ->
    $('.carousel').carousel()
