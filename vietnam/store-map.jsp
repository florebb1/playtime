<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<style>
    /* Always set the map height explicitly to define the size of the div
    * element that contains the map. */
    #map {
        height: calc(100vh - 70px);
    }
    /* Optional: Makes the sample page fill the window. */
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
    }
    .qazxswedc {
        padding: 20px 8%;
        font-weight: 900;
        font-size: 20px;
        text-align: center;
        color: #808080;
    }
    .qazxswedc:after {
        content:'';
        display: block;
        clear: both;
    }
    .qazxswedc span {
        text-align: center;
        display: inline-block;
        color:#333333;
        font-weight:500;
        font-size:16px;
    }

</style>

<body>
    <header class="h-auto">
        <div class="qazxswedc d-flex">
            <div class="col align-self-center"><a href="javascript:history.back()"><i class="icon-left-arrow fs-20 font-weight-bold text-dark"></i></a></div>
            <div class="col-10">
                <span>Thông tin vị trí của cửa hàng</span>
            </div>
            <div class="col"></div>
        </div>
    </header>

    <div id="map"></div>

<%@include file="/vietnam/layout/base_script.jsp"%>
<script>
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
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5486vMV-_sUdBixlPgp1Ag6L0hwkAO9Q&callback=initMap"></script>

</body>
</fmt:bundle>
</html>
