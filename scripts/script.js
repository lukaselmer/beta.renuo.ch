(function() {
  $(function() {
    $(document).ready(function() {
      return document.documentElement.setAttribute('data-useragent', navigator.userAgent);
    });
    $(document).ready(function() {
      return jQuery(document.links).filter(function() {
        var is_email, is_external_host, is_pdf;
        is_external_host = this.hostname !== window.location.hostname;
        is_pdf = this.href.match(/\.pdf$/);
        is_email = this.href.match(/^mailto/);
        return is_external_host || is_pdf || is_email;
      }).attr('target', '_blank');
    });
    $(document).ready(function() {
      if (document.google && document.google.maps) {
        return $(document).trigger('google-maps-loaded');
      }
    });
    $(document).on('google-maps-loaded', function() {
      var map, mapOptions, map_styles, marker, myLatlng;
      if ($("#map_canvas").length >= 1) {
        if ($("#map_canvas").data('maps_loaded') === 'yes') {
          return;
        }
        $("#map_canvas").data('maps_loaded', 'yes');
        myLatlng = new google.maps.LatLng(47.410898, 8.590679);
        map_styles = [
          {
            featureType: "road.local",
            stylers: [
              {
                visibility: "off"
              }
            ]
          }, {
            featureType: "road.arterial",
            stylers: [
              {
                color: "#d2e7f9"
              }, {
                visibility: "simplified"
              }
            ]
          }, {
            featureType: "road.highway",
            elementType: "geometry",
            stylers: [
              {
                weight: 0.8
              }, {
                color: "#78b3ed"
              }
            ]
          }, {
            featureType: "road.highway",
            elementType: "geometry.stroke",
            stylers: [
              {
                color: "#78b3ed"
              }, {
                hue: "#0077ff"
              }
            ]
          }, {
            featureType: "poi",
            stylers: [
              {
                visibility: "off"
              }
            ]
          }, {
            featureType: "road.highway.controlled_access",
            elementType: "labels.icon",
            stylers: [
              {
                visibility: "off"
              }
            ]
          }, {
            elementType: "labels.icon",
            stylers: [
              {
                visibility: "off"
              }
            ]
          }, {
            featureType: "water",
            elementType: "geometry",
            stylers: [
              {
                color: "#9ed8f6"
              }
            ]
          }, {
            featureType: "water",
            elementType: "labels",
            stylers: [
              {
                visibility: "off"
              }
            ]
          }, {
            featureType: "transit",
            stylers: [
              {
                visibility: "off"
              }
            ]
          }, {
            featureType: "landscape.natural",
            stylers: [
              {
                lightness: 69
              }
            ]
          }, {
            featureType: "road",
            elementType: "labels",
            stylers: [
              {
                visibility: "off"
              }
            ]
          }
        ];
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
          mapTypeControl: false,
          styles: map_styles
        };
        map = new google.maps.Map($('#map_canvas')[0], mapOptions);
        marker = new google.maps.Marker({
          position: myLatlng,
          map: map,
          title: 'Renuo AG',
          clickable: true
        });
        return google.maps.event.addListener(marker, 'click', function() {
          return window.open('https://maps.google.ch/maps?q=Renuo+AG,+Industriestrasse+44,+Wallisellen&hl=de&ie=UTF8&t=m&z=16&iwloc=A');
        });
      }
    });
    $(document).ready(function() {
      return $('.carousel').carousel();
    });
    $(document).ready(function() {
      return $(".btn-navbar").on("click", function(e) {
        e.preventDefault();
        $(".nav-big ul").removeClass("nav pull-right");
        return $(".nav-big").toggle({
          duration: 400,
          queue: false,
          complete: function() {
            if ($(".nav-big").css("display") === "none") {
              return $(".nav-big ul").addClass("nav pull-right");
            } else {
              return $(".nav-big ul").removeClass("nav pull-right");
            }
          }
        });
      });
    });
    $(window).resize(function() {
      if ($(window).width() > 660) {
        $(".nav-big ul").addClass("nav pull-right");
        return $(".nav-big").show();
      } else {
        $(".nav-big ul").removeClass("nav pull-right");
        return $(".nav-big").hide();
      }
    });
    return $(document).ready(function() {
      var isMobile, toggleMilkyEffect;
      $('a').on('mouseover', function() {
        var genLink, href;
        href = $(this).attr('href');
        if (href.length > 2 && href[0] === '/' && href[1] !== '/') {
          genLink = function(type) {
            return $('<link>').attr('rel', type).attr('href', href);
          };
          genLink('prefetch').appendTo('body');
          return genLink('prerender').appendTo('body');
        }
      });
      isMobile = function() {
        return $(document).width() < 767;
      };
      toggleMilkyEffect = function() {
        if (isMobile()) {
          return $('.project-box').removeClass('milky');
        } else {
          return $('.project-box:not(:first)').addClass('milky');
        }
      };
      $(window).resize(function() {
        return toggleMilkyEffect();
      });
      (function() {
        var animation;
        animation = null;
        $('.project-box.milky').mouseenter(function() {
          if (!isMobile()) {
            return animation = $(this).children('img').animate({
              opacity: 1
            });
          }
        });
        return $('.project-box.milky').mouseleave(function() {
          if (!isMobile()) {
            if (animation) {
              animation.stop();
            }
            return $(this).children('img').removeAttr('style');
          }
        });
      })();
      return toggleMilkyEffect();
    });
  });

}).call(this);
