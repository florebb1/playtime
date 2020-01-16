<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<style>
    @media only screen and (-webkit-device-pixel-ratio: 3) and (max-device-height: 812px) and (min-device-width: 375px){
        header {
            margin-top: 80px;
        }
    }
</style>
<body class="overflow-auto">
    <header>
        <div class="d-flex my-5">
            <div class="col align-self-center" onclick="document.location.href='main.jsp'"><i class="icon-left-arrow fs-20 font-weight-bold text-dark"></i></div>
            <div class="col-8 text-center font-weight-bold fs-20">Danh mục</div>
            <div class="col"></div>
        </div>
    </header>

    <%-- 홍보 사진 --%>
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" data-interval>
                <img src="images/mypage1.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-interval>
                <img src="images/mypage2.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-interval>
                <img src="images/mypage3.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
    </div>
    <div class="info-box my-5">
        <%-- 나의 메뉴 리스트 --%>
        <div class="row">
            <a class="col-4 text-center text-secondary" href="edit-user.jsp"><i class="icon-playtime_icn_edit fs-50"></i><br><p>Thay đổi thông tin thành viên</p></a>
            <a class="col-4 text-center text-secondary" href="rating.jsp"><i class="icon-playtime_icn_membership fs-50"></i><br><fmt:message key="message.mypage3"/></a>
            <a class="col-4 text-center text-secondary" href="coupon-list.jsp"><i class="icon-playtime_icn_coupon fs-50"></i><br><fmt:message key="message.mypage4"/></a>
            <!-- Force next columns to break to new line -->
            <div class="w-100"></div>
<%--                <a class="col-4 text-center text-secondary" href="point.jsp"><i class="icon-playtime_icn_point fs-50"></i><br><fmt:message key="message.mypage5"/></a>--%>
<%--                <a class="col-4 text-center text-secondary" href="stamp.jsp"><i class="icon-stamp fs-50"></i><br><fmt:message key="message.mypage6"/></a>--%>
            <a class="col-4 text-center text-secondary" href="setting.jsp"><i class="icon-playtime_icn_setting fs-50"></i><br><fmt:message key="message.mypage7"/></a>
        </div>
    </div>
    <div class="info-box my-5 text-center font-weight-bold">
            <%-- 개인정보 처리 방침 --%>
        <p><a href="policy.jsp" class="text-dark"><fmt:message key="message.mypage8"/></a></p>
            <%-- 이용약관 --%>
        <p><a href="service.jsp" class="text-dark"><fmt:message key="message.mypage9"/></a></p>
    </div>

<%@include file="/vietnam/layout/base_script.jsp"%>
</body>
</fmt:bundle>
</html>
