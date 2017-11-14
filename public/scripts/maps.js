 (function($){
    "use strict";


    // Marker
    // ----------------------------------------------- //
    var markerIcon = {
        path: 'M19.9,0c-0.2,0-1.6,0-1.8,0C8.8,0.6,1.4,8.2,1.4,17.8c0,1.4,0.2,3.1,0.5,4.2c-0.1-0.1,0.5,1.9,0.8,2.6c0.4,1,0.7,2.1,1.2,3 c2,3.6,6.2,9.7,14.6,18.5c0.2,0.2,0.4,0.5,0.6,0.7c0,0,0,0,0,0c0,0,0,0,0,0c0.2-0.2,0.4-0.5,0.6-0.7c8.4-8.7,12.5-14.8,14.6-18.5 c0.5-0.9,0.9-2,1.3-3c0.3-0.7,0.9-2.6,0.8-2.5c0.3-1.1,0.5-2.7,0.5-4.1C36.7,8.4,29.3,0.6,19.9,0z M2.2,22.9 C2.2,22.9,2.2,22.9,2.2,22.9C2.2,22.9,2.2,22.9,2.2,22.9C2.2,22.9,3,25.2,2.2,22.9z M19.1,26.8c-5.2,0-9.4-4.2-9.4-9.4 s4.2-9.4,9.4-9.4c5.2,0,9.4,4.2,9.4,9.4S24.3,26.8,19.1,26.8z M36,22.9C35.2,25.2,36,22.9,36,22.9C36,22.9,36,22.9,36,22.9 C36,22.9,36,22.9,36,22.9z M13.8,17.3a5.3,5.3 0 1,0 10.6,0a5.3,5.3 0 1,0 -10.6,0',
        strokeOpacity: 0,
        strokeWeight: 1,
        fillColor: '#00BA75',
        fillOpacity: 1,
        rotation: 0,
        scale: 1,
        anchor: new google.maps.Point(19,50)
    }

    /* Half Map Adjustments */
    $(window).on('load resize', function() {

      var topbarHeight = $("#top-bar").height();
      var headerHeight = $("#header").innerHeight() + topbarHeight;

      $(".fs-container").css('height', '' + $(window).height() - headerHeight +'px');
    });


    // Main Main
    // ----------------------------------------------- //
    function mainMap() {

      function locationData(locationURL,locationPrice,locationPriceDetails,locationImg,locationTitle,locationAddress) {
          return('<a href="'+ locationURL +'" class="listing-img-container"><div class="infoBox-close"><i class="fa fa-times"></i></div><div class="listing-img-content"><span class="listing-price">'+ locationPrice +'<i>' + locationPriceDetails +'</i></span></div><img src="'+locationImg+'" alt=""></a><div class="listing-content"><div class="listing-title"><h4><a href="#">'+locationTitle+'</a></h4><p>'+locationAddress+'</p></div></div>')
      }

      var locations = [
        [ locationData('#','$1.99','$0.38/oz','/images/9ripe.jpg','Cermak Produce',"2701 W North Ave, Chicago, IL 60647, USA"), 41.90995, -87.694909, 1, markerIcon ],
        [ locationData('#','$2.50','$0.48/0z','/images/9ripe.jpg','Jewel-Osco',"7525 W Lake St, River Forest, IL 60305, USA"), 41.887978, -87.8133962, 2, markerIcon ],
        [ locationData('#','$1.49','$0.29/oz','/images/9ripe.jpg','Whole Foods Market',"1550 N Kingsbury St, Chicago, IL 60642, USA"), 41.9086926, -87.6529275, 3, markerIcon ],
        [ locationData('#','$2.99','$0.25/oz','/images/9ripe.jpg','Marianos Bucktown',"2112 N Ashland Ave, Chicago, IL 60614, USA"), 41.9209798, -87.6691063, 4, markerIcon ],

        [ locationData('#','$3.00','$0.58/oz','/images/9ripe.jpg','Foxtrot Market',"1019 W Lake St, Chicago, IL 60654, USA"), 41.8853531, -87.6529272, 5, markerIcon ],
        [ locationData('#','$500','monthly','/images/9ripe.jpg','Old Town Manchester',"7843 Durham Avenue, MD"), 41.76967281691741, -87.9510498046875, 6, markerIcon ],

        [ locationData('#','$1.65','$0.32/oz','/images/9ripe.jpg','Trader Joes',"1147 S Wabash Ave, Chicago, IL 60605, USA"), 41.867799, -87.625482, 7, markerIcon]
      ];


      var mapZoomAttr = $('#map').attr('data-map-zoom');
      var mapScrollAttr = $('#map').attr('data-map-scroll');

      if (typeof mapZoomAttr !== typeof undefined && mapZoomAttr !== false) {
          var zoomLevel = parseInt(mapZoomAttr);
      } else {
          var zoomLevel = 12;
      }

      if (typeof mapScrollAttr !== typeof undefined && mapScrollAttr !== false) {
         var scrollEnabled = parseInt(mapScrollAttr);
      } else {
        var scrollEnabled = false;
      }

      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: zoomLevel,
        scrollwheel: scrollEnabled,
        center: new google.maps.LatLng(41.878974, -87.635846),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        zoomControl: false,
        mapTypeControl: false,
        scaleControl: false,
        panControl: false,
        navigationControl: false,
        streetViewControl: false,
        gestureHandling: 'cooperative',

        // Google Map Style
        styles: [{"featureType":"water","elementType":"geometry","stylers":[{"visibility":"on"},{"color":"#aee2e0"}]},{"featureType":"landscape","elementType":"geometry.fill","stylers":[{"color":"#abce83"}]},{"featureType":"poi","elementType":"geometry.fill","stylers":[{"color":"#769E72"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#7B8758"}]},{"featureType":"poi","elementType":"labels.text.stroke","stylers":[{"color":"#EBF4A4"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"visibility":"simplified"},{"color":"#8dab68"}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#5B5B3F"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#ABCE83"}]},{"featureType":"road","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#A4C67D"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#9BBF72"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#EBF4A4"}]},{"featureType":"transit","stylers":[{"visibility":"off"}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"visibility":"on"},{"color":"#87ae79"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#7f2200"},{"visibility":"off"}]},{"featureType":"administrative","elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"},{"visibility":"on"},{"weight":4.1}]},{"featureType":"administrative","elementType":"labels.text.fill","stylers":[{"color":"#495421"}]},{"featureType":"administrative.neighborhood","elementType":"labels","stylers":[{"visibility":"off"}]}]

      });


      var boxText = document.createElement("div");
      boxText.className = 'map-box'

      var currentInfobox;
       
      var boxOptions = {
              content: boxText,
              disableAutoPan: true,
              alignBottom : true,
              maxWidth: 0,
              pixelOffset: new google.maps.Size(-60, -55),
              zIndex: null,
              boxStyle: { 
                width: "260px"
              },
              closeBoxMargin: "0",
              closeBoxURL: "",
              infoBoxClearance: new google.maps.Size(1, 1),
              isHidden: false,
              pane: "floatPane",
              enableEventPropagation: false,
      };


      var markerCluster, marker, i;
      var allMarkers = [];
      
      var clusterStyles = [
      {
        textColor: 'white',
        url: '',
        height: 50,
        width: 50
      }
      ];



        // Custom zoom buttons
        var zoomControlDiv = document.createElement('div');
        var zoomControl = new ZoomControl(zoomControlDiv, map);

        function ZoomControl(controlDiv, map) {

          zoomControlDiv.index = 1;
          map.controls[google.maps.ControlPosition.RIGHT_CENTER].push(zoomControlDiv);
          // Creating divs & styles for custom zoom control
          controlDiv.style.padding = '5px';

          // Set CSS for the control wrapper
          var controlWrapper = document.createElement('div');
          controlDiv.appendChild(controlWrapper);
          
          // Set CSS for the zoomIn
          var zoomInButton = document.createElement('div');
          zoomInButton.className = "custom-zoom-in";
          controlWrapper.appendChild(zoomInButton);
            
          // Set CSS for the zoomOut
          var zoomOutButton = document.createElement('div');
          zoomOutButton.className = "custom-zoom-out";
          controlWrapper.appendChild(zoomOutButton);

          // Setup the click event listener - zoomIn
          google.maps.event.addDomListener(zoomInButton, 'click', function() {
            map.setZoom(map.getZoom() + 1);
          });
            
          // Setup the click event listener - zoomOut
          google.maps.event.addDomListener(zoomOutButton, 'click', function() {
            map.setZoom(map.getZoom() - 1);
          });  
          
      }


      for (i = 0; i < locations.length; i++) {  
        marker = new google.maps.Marker({
          position: new google.maps.LatLng(locations[i][1], locations[i][2]),
         
          icon: locations[i][4],
          id : i
        });
        allMarkers.push(marker);

        var ib = new InfoBox();

        google.maps.event.addListener(marker, 'click', (function(marker, i) {
          return function() {
             ib.setOptions(boxOptions);
             boxText.innerHTML = locations[i][0];
             ib.open(map, marker);
             currentInfobox = marker.id;
             var latLng = new google.maps.LatLng(locations[i][1], locations[i][2]);
             map.panTo(latLng);
             map.panBy(0,-180);


            google.maps.event.addListener(ib,'domready',function(){
              $('.infoBox-close').click(function(e) {
            e.preventDefault();
                  ib.close();
              });
            });

          }
        })(marker, i));

      } //eof for

      var options = {
          imagePath: 'images/',
          styles : clusterStyles,
          minClusterSize : 2

      };

      markerCluster = new MarkerClusterer(map, allMarkers, options); 

      google.maps.event.addDomListener(window, "resize", function() {
          var center = map.getCenter();
          google.maps.event.trigger(map, "resize");
          map.setCenter(center); 
      });


      // Scroll enabling button
      var scrollEnabling = $('#scrollEnabling');

      $(scrollEnabling).click(function(e){
          e.preventDefault();
          $(this).toggleClass("enabled");

          if ( $(this).is(".enabled") ) {
             map.setOptions({'scrollwheel': true});
          } else {
             map.setOptions({'scrollwheel': false});
          }
      })


      // Geo location button
      $("#geoLocation").click(function(e){
          e.preventDefault();
          geolocate();
      });

      function geolocate() {

          if (navigator.geolocation) {
              navigator.geolocation.getCurrentPosition(function (position) {
                  var pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                  map.setCenter(pos);
                  map.setZoom(12);
              });
          }
      }

      
      // Next / Prev buttons
        $('#nextpoint').click(function(e){
            e.preventDefault();
            
             map.setZoom(15);

            var index = currentInfobox;
            if (index+1 < allMarkers.length ) {
                google.maps.event.trigger(allMarkers[index+1],'click');
                
            } else {
                google.maps.event.trigger(allMarkers[0],'click');
            }
        });


        $('#prevpoint').click(function(e){
            e.preventDefault();

             map.setZoom(15);

            if ( typeof(currentInfobox) == "undefined" ) {
                 google.maps.event.trigger(allMarkers[allMarkers.length-1],'click');
            } else {
                 var index = currentInfobox;
                 if(index-1 < 0) {
                    //if index is less than zero than open last marker from array
                   google.maps.event.trigger(allMarkers[allMarkers.length-1],'click');
                 } else {
                    google.maps.event.trigger(allMarkers[index-1],'click');
                 }
            }
      });

    }


    // Map Init
    var map =  document.getElementById('map');
    if (typeof(map) != 'undefined' && map != null) {
      google.maps.event.addDomListener(window, 'load',  mainMap);
      google.maps.event.addDomListener(window, 'resize',  mainMap);
    }
      

    // ---------------- Main Map / End ---------------- //




})(this.jQuery);