<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<style>
    @media only screen and (-webkit-device-pixel-ratio: 3) and (max-device-height: 812px) and (min-device-width: 375px){
        header {
            margin-top: 40px;
        }
    }
</style>
<body class="overflow-auto">
    <header class="h-auto">
        <div class="d-flex py-5">
            <div class="col align-self-center"><a href="javascript:history.back()"><i class="icon-left-arrow fs-20 font-weight-bold text-dark"></i></a></div>
            <div class="col-8 text-center font-weight-bold fs-20"><fmt:message key="message.storeDetail1"/></div>
            <div class="col"></div>
        </div>
    </header>
    <form id="store_frm" method="POST">
        <input name="COMP_CD" type="hidden" value="011">
        <input id="SIDO_NM" name="SIDO_NM" type="hidden">
        <input id="BRAND_CD" name="BRAND_CD" type="hidden">
        <input id="BRAND_NM" name="BRAND_NM" type="hidden">
        <input id="STOR_CD" name="STOR_CD" type="hidden">
        <input id="STOR_NM" name="STOR_NM" type="hidden">
        <input id="ADDR1" name="ADDR1" type="hidden">
        <input id="ADDR2" name="ADDR2" type="hidden">
    </form>

    <div class="container">
            <%-- 스토어 사진 --%>
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/store/pt.png" class="d-block w-100">
                </div>
            </div>
        </div>
            <%-- 스토어 상세 --%>
        <div class="fs-14 text-center info-box my-4">
<%--            <span id="STOR_TP_NM" class="py-2"></span>--%>
            <p class="fs-24 font-weight-bolder"><span id="BRAND"></span><br>-<br><span id="STOR"></span></p>
            <p id="ADDR"></p>
            <p>
                <fmt:message key="message.storeDetail2"/><br>
                <span id="workDay"></span><br>
                <span id="restDay"></span>
            </p>
            <div class="fs-18 text-center font-weight-bold text-white ">
                <div id="call" class="new-store-btn bg-yellow-color border-0 border-radius-10 my-2">Điện thoại để được tư</div>
                <div id="map" class="new-store-btn bg-yellow-color border-0 border-radius-10 my-2"><fmt:message key="message.storeDetail6"/></div>
                <div id="share" class="new-store-btn bg-yellow-color border-0 border-radius-10 my-2"><fmt:message key="message.storeDetail7"/></div>
            </div>
        </div>

    </div>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src="js/page/store-detail.js"></script>

    </body>
</fmt:bundle>
</html>
