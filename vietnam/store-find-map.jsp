<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="com.properties.message">
<%@include file="/layout/base_style.jsp"%>
<style>
    a:focus, a:hover, a:visited, a:link {
        text-decoration:none;
        color: #000;
        font-weight: 800;
    }
    /* Always set the map height explicitly to define the size of the div
    * element that contains the map. */
    #map {
        height: calc(100% - 70px);
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
    .map-btn {
        text-align: center;
        background-color: gold;
        border-radius: 5px;
        color: #fff;
        border: none;
        padding: 3px;
        display: block;
        margin-block-start: 1em;
        margin-block-end: 1em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
    }
</style>
</head>
<body>
    <header>
        <div class="qazxswedc d-flex">
            <div class="col align-self-center"><a href="javascript:history.back()"><i class="icon-left-arrow fs-20 font-weight-bold text-dark"></i></a></div>
            <div class="col-10">
                <span>매장위치정보 ( <span id="title">0</span>km )</span>
            </div>
            <div class="col"></div>
        </div>
    </header>
    <form id="mapForm">
        <input type="hidden" name="COMP_CD" value="011">
        <input type="hidden" name="USER_ID" value="MOBILE">
        <input type="hidden" name="BRAND_CD">
        <input type="hidden" name="LOC_LAT">
        <input type="hidden" name="LOC_LNG">
        <input type="hidden" name="RADIUS">
    </form>

    <div id="map"></div>

<%@include file="/layout/base_script.jsp"%>
<script>
    function initMap(a) {
        var LOC_LAT = parseFloat(get('LOC_LAT'));
        $("input[name=LOC_LAT]").val(LOC_LAT);
        var LOC_LNG = parseFloat(get('LOC_LNG'));
        $("input[name=LOC_LNG]").val(LOC_LNG);
        var RADIUS = get('RADIUS');
        $("input[name=RADIUS]").val(RADIUS);
        $("#title").text(RADIUS);
        var zoomin;
        if(RADIUS == 10) {
            zoomin = 11;
        }else if(RADIUS == 15 || RADIUS == 20) {
            zoomin = 10;
        }else {
            zoomin = 12;
        }
        var datas = $("#mapForm").serialize();
        $.ajax({
            url: '/api/mbl_0730.jsp',
            type: 'POST',
            dataType: 'JSON',
            data: datas,
            success: function(response) {
                var myLatlng = {lat: LOC_LAT, lng: LOC_LNG};
                var locations = [];
                for (var i = 0; i < response.RESULT.length; i++) {
                    locations.push(['<p style="font-size:1.17em; font-weight:bold;">'+response.RESULT[i].BRAND_NM+'</p><p>'+response.RESULT[i].STOR_NM+'</p><a href="/store_detail.jsp?SIDO_NM='+response.RESULT[i].SIDO_NM+'&BRAND_CD='+response.RESULT[i].BRAND_CD+'&STOR_CD='+response.RESULT[i].STOR_CD+'"><div class="map-btn">매장상세보기</div></a>', response.RESULT[i].LOC_LAT, response.RESULT[i].LOC_LNG]);
                }

                var infowindow =  new google.maps.InfoWindow({});

                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: zoomin,
                    center: myLatlng
                });

                var marker, count;

                for (count = 0; count < locations.length; count++) {
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(locations[count][1], locations[count][2]),
                        map: map,
                        title: locations[count][0]
                    });
                    google.maps.event.addListener(marker, 'click', (function (marker, count) {
                        return function () {
                            infowindow.setContent(locations[count][0]);
                            infowindow.open(map, marker);
                        }
                    })(marker, count));

                    marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        icon: '/images/icon/me.png'
                    });
                }

            }
        });
        return false;
    }
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5486vMV-_sUdBixlPgp1Ag6L0hwkAO9Q&callback=initMap"></script>

</body>
</fmt:bundle>
</html>