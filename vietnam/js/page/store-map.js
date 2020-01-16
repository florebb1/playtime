function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	results = regex.exec(location.search);
	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
function initMap(a) {
	var LOC_LAT = parseFloat(get('LOC_LAT'));
	var LOC_LNG = parseFloat(get('LOC_LNG'));
	var STOR_NM = get('STOR_NM');
	var BRAND_NM = get('BRAND_NM');
					
	var myLatlng = {lat: LOC_LAT, lng: LOC_LNG};
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: 16,
		center: myLatlng
	});
	
	var contentString = '<div id="content">'+
        '<div id="siteNotice">'+
        '</div>'+
        '<h3 id="firstHeading" class="firstHeading">'+BRAND_NM+'</h3>'+
        '<div id="bodyContent">'+
        '<p>'+STOR_NM+'</p>';
	
	var infowindow = new google.maps.InfoWindow({
		content: contentString
	});
	
	var marker = new google.maps.Marker({
	  position: myLatlng,
	  map: map,
	  title: STOR_NM
	});
	
	marker.addListener('click', function() {
		infowindow.open(map, marker);
	});
}
$(document).ready(function(){

});
