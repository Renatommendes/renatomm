<!DOCTYPE html >
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <title>Using MySQL and PHP with Google Maps</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>

  <body onload="initMap()">
  <div>
        <label for="coordinates">Insira as coordenadas (latitude, longitude):</label>
        <input type="text" id="coordinates" placeholder="Ex: 40.7128, -74.0060">
        <button onclick="markOnMap()">Marcar no Mapa</button>
    </div>
    <div id="map"></div>


    <script>
 
      var customLabel = {
        restaurant: {
          label: 'R'
        },
        bar: {
          label: 'B'
        }
      };

    //    function initMap() {
 ///         const myLatLng = { lat: -20.52822471910791, lng: -54.59902227264733};
 // const map = new google.maps.Map(document.getElementById("map"), {
  //  zoom: 4,
   // center: myLatLng,
 // });

 // new google.maps.Marker({
 //   position: myLatLng,
  //  map,
   // title: "Hello World!",
 // });

 function initMap() {
            var mapOptions = {
                center: { lat: 0, lng: 0 },
                zoom: 2
            };
            map = new google.maps.Map(document.getElementById("map"),
             mapOptions);
        



        var infoWindow = new google.maps.InfoWindow;

          // Change this depending on the name of your PHP or XML file
          downloadUrl('resultado.php', function(data) {
            var xml = data.responseXML;
            var markers = xml.documentElement.getElementsByTagName('marker');
            Array.prototype.forEach.call(markers, function(markerElem) {
              var name = markerElem.getAttribute('name');
              var address = markerElem.getAttribute('address');
              var type = markerElem.getAttribute('type');
              var point = new google.maps.LatLng(
                  parseFloat(markerElem.getAttribute('lat')),
                  parseFloat(markerElem.getAttribute('lng')));

              var infowincontent = document.createElement('div');
              var strong = document.createElement('strong');
              strong.textContent = name
              infowincontent.appendChild(strong);
              infowincontent.appendChild(document.createElement('br'));

              var text = document.createElement('text');
              text.textContent = address
              infowincontent.appendChild(text);
              var icon = customLabel[type] || {};
              var marker = new google.maps.Marker({
                map: map,
                position: point,
                label: icon.label
              });
              marker.addListener('click', function() {
                infoWindow.setContent(infowincontent);
                infoWindow.open(map, marker);
                window.initMap = initMap;
              });
            });
          });
        }
//--------------------------------------------------------------------------

//var vlat
//var vlng

//function verifica() {

 // let campo = (document.getElementById("lugar").value)
//document.getElementById("resultado").innerHTML = campo;

   //  vlat = campo.split(',');
   //  vlng = campo.split(' ');
   // document.getElementById("split").innerHTML = vlat[0];
   // document.getElementById("split2").innerHTML = vlng[1];
    //}

        function markOnMap() {
            var latLngStr = document.getElementById('coordinates').value;
            var latLngArr = latLngStr.split(',');
            var lat = parseFloat(latLngArr[0]);
            var lng = parseFloat(latLngArr[1]);
            
            if (isNaN(lat) || isNaN(lng)) {
                alert('Por favor, insira coordenadas válidas.');
                return;
            }
            
            var marker = new google.maps.Marker({
                position: { lat: lat, lng: lng },
                map: map
            });

            map.setCenter({ lat: lat, lng: lng });
            map.setZoom(15);
        }
//-----------------------------------------------------------------

      function downloadUrl(url, callback) {
        var request = window.ActiveXObject ?
            new ActiveXObject('Microsoft.XMLHTTP') :
            new XMLHttpRequest;

        request.onreadystatechange = function() {
          if (request.readyState == 4) {
            request.onreadystatechange = doNothing;
            callback(request, request.status);
          }
        };

        request.open('GET', url, true);
        request.send(null);
      }

      function doNothing() {}
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=YOUAPIKEY&callback=initMap">
    </script>
  </body>
</html>