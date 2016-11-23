$ ->

  $(document).ready ->
    document.documentElement.setAttribute('data-useragent', navigator.userAgent)

  $(document).ready ->
    jQuery(document.links).filter(->
      is_external_host = @hostname != window.location.hostname
      is_pdf = @href.match(/\.pdf$/)
      is_email = @href.match(/^mailto/)

      is_external_host || is_pdf || is_email
    ).attr('target', '_blank')

  $(document).ready ->
    $(document).trigger('google-maps-loaded') if document.google and document.google.maps

  $(document).on 'google-maps-loaded', ->
    if($("#map_canvas").length >= 1)
      return if $("#map_canvas").data('maps_loaded') == 'yes'
      $("#map_canvas").data('maps_loaded', 'yes')

      myLatlng = new google.maps.LatLng(47.410898, 8.590679)

      map_styles = [
        {
          featureType: "road.local"
          stylers: [
            visibility: "off"
          ]
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
          stylers: [
            visibility: "off"
          ]
        }
        {
          featureType: "road.highway.controlled_access"
          elementType: "labels.icon"
          stylers: [
            visibility: "off"
          ]
        }
        {
          elementType: "labels.icon"
          stylers: [
            visibility: "off"
          ]
        }
        {
          featureType: "water"
          elementType: "geometry"
          stylers: [
            color: "#9ed8f6"
          ]
        }
        {
          featureType: "water"
          elementType: "labels"
          stylers: [
            visibility: "off"
          ]
        }
        {
          featureType: "transit"
          stylers: [
            visibility: "off"
          ]
        }
        {
          featureType: "landscape.natural"
          stylers: [
            lightness: 69
          ]
        }
        {
          featureType: "road"
          elementType: "labels"
          stylers: [
            visibility: "off"
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

      marker = new google.maps.Marker
        position: myLatlng,
        map: map,
        title: 'Renuo AG',
        clickable: true,

      google.maps.event.addListener marker, 'click', () ->
        window.open('https://maps.google.ch/maps?q=Renuo+AG,+Industriestrasse+44,+Wallisellen&hl=de&ie=UTF8&t=m&z=16&iwloc=A')

  $(document).ready ->
    $('.carousel').carousel()

  $(document).ready ->
    $(".btn-navbar").on "click", (e) ->
      e.preventDefault()
      $(".nav-big ul").removeClass("nav pull-right")
      $(".nav-big").toggle
        duration: 400
        queue: false
        complete: () ->
          if $(".nav-big").css("display") == "none"
            $(".nav-big ul").addClass("nav pull-right")
          else
            $(".nav-big ul").removeClass("nav pull-right")

  $(window).resize ->
    if($(window).width() > 660)
      $(".nav-big ul").addClass("nav pull-right")
      $(".nav-big").show()
    else
      $(".nav-big ul").removeClass("nav pull-right")
      $(".nav-big").hide()


  $(document).ready ->
    $('a').on 'mouseover', ->
      href = $(this).attr('href')
      if href.length > 2 && href[0] == '/' && href[1] != '/'
        genLink = (type) ->
          $('<link>').attr('rel', type).attr('href', href)
        genLink('prefetch').appendTo('body')
        genLink('prerender').appendTo('body')

    # References
    isMobile = ->
      $(document).width() < 767

    toggleMilkyEffect = ->
      if(isMobile())
        $('.project-box').removeClass('milky')
      else
        $('.project-box:not(:first)').addClass('milky')

    $(window).resize ->
      toggleMilkyEffect()

    (->
      animation = null

      $('.project-box.milky').mouseenter ->
        unless isMobile()
          animation = $(this).children('img').animate
            opacity: 1

      $('.project-box.milky').mouseleave ->
        unless isMobile()
          animation.stop() if animation
          $(this).children('img').removeAttr('style')
    )()

    toggleMilkyEffect()
