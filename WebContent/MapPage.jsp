<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Flight Map</title>
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
<body>
	<div id="map"></div>
	<script>
		// This example creates a 2-pixel-wide red polyline showing the path of William
		// Kingsford Smith's first trans-Pacific flight between Oakland, CA, and
		// Brisbane, Australia.

		function initMap() {

			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 4,
				center : {
					lat : 37.090,
					lng : -95.712
				},
				mapTypeId : 'terrain'
			});
			var chicago = {
				lat : 41.878,
				lng : -87.629
			}
			var iowacity = {
				lat : 41.661,
				lng : -91.53
			}
			var newyork = {
				lat : 40.712,
				lng : -74.005
			}
			var desmoines = {
				lat : 41.600,
				lng : -93.609
			}
			var sanfrancisco = {
				lat : 37.774,
				lng : -122.419
			}

			var flightPlanCoordinates = [];
			flightPlanCoordinates
					.push(
	<%out.print(request.getParameter("to").toLowerCase().replaceAll("\\s+", ""));%>
		)
			flightPlanCoordinates
					.push(
	<%out.print(request.getParameter("from").toLowerCase().replaceAll("\\s+", ""));%>
		)
	<%if (request.getParameter("from1") != null) {
				out.println("flightPlanCoordinates.push("
						+ request.getParameter("from1").toLowerCase().replaceAll("\\s+", "") + ")");
				out.println("flightPlanCoordinates.push("
						+ request.getParameter("to1").toLowerCase().replaceAll("\\s+", "") + ")");
			}%>
		flightPlanCoordinates
			var flightPath = new google.maps.Polyline({
				path : flightPlanCoordinates,
				geodesic : true,
				strokeColor : '#FF0000',
				strokeOpacity : 1.0,
				strokeWeight : 2
			});

			flightPath.setMap(map);
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu_mm2tAb8MUpj85pNXt7Y0AkgJ1N7IC8&callback=initMap">
		
	</script>
</body>
</html>