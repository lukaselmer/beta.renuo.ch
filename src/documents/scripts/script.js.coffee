$ ->
  $(document).ready ->
    if($("#map_canvas").length >= 1)
      myLatlng = new google.maps.LatLng(47.421761, 8.499641)

      map_styles = [
        {
          featureType: "road.local"
          stylers: [visibility: "off"]
        }
        {
          featureType: "road.arterial"
          stylers: [
            {
              color: "#d2e7f9"
            }
            {
              visibility: "simplified"
            }
          ]
        }
        {
          featureType: "road.highway"
          elementType: "geometry"
          stylers: [
            {
              weight: 0.8
            }
            {
              color: "#78b3ed"
            }
          ]
        }
        {
          featureType: "road.highway"
          elementType: "geometry.stroke"
          stylers: [
            {
              color: "#78b3ed"
            }
            {
              hue: "#0077ff"
            }
          ]
        }
        {
          featureType: "poi"
          stylers: [visibility: "off"]
        }
        {
          featureType: "road.highway.controlled_access"
          elementType: "labels.icon"
          stylers: [visibility: "off"]
        }
        {
          elementType: "labels.icon"
          stylers: [visibility: "off"]
        }
        {
          featureType: "water"
          elementType: "geometry"
          stylers: [color: "#9ed8f6"]
        }
        {
          featureType: "water"
          elementType: "labels"
          stylers: [visibility: "off"]
        }
        {
          featureType: "transit"
          stylers: [visibility: "off"]
        }
        {
          featureType: "landscape.natural"
          stylers: [lightness: 69]
        }
        {
          featureType: "road"
          elementType: "labels"
          stylers: [visibility: "off"]
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
