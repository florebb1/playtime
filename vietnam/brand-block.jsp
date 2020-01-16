<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="com.properties.message">
<%@include file="/layout/base_style.jsp"%>
<body>
    <header class="h-100">
        <div class="d-flex py-5">
            <div class="col align-self-center"><a href="javascript:history.back()"><i class="icon-left-arrow fs-20 font-weight-bold text-dark"></i></a></div>
            <div class="col-8 text-center font-weight-bold fs-20">BLOCK</div>
            <div class="col"></div>
        </div>
    </header>

    <div class="container">
        <%-- 브랜드 사진 --%>
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="/images/brand/block.jpg" class="d-block w-100">
                </div>
            </div>
        </div>
        <%-- 브랜드 설명 --%>
        <div class="info-box text-center fs-14 my-5">
            <div class="fs-18 my-4"><fmt:message key="message.brandInfo"/></div>
            <div class="fs-25 font-weight-bold"><fmt:message key="message.brandBlock1"/></div>
            <div class="my-4"><fmt:message key="message.brandBlock2"/></div>
            <img src="/images/brand/block/block1.png" class="d-block w-100">
            <hr class="text-secondary my-4">
            <div class="font-weight-bold pb-4"><fmt:message key="message.brandInfo2"/></div>
            <img src="/images/brand/block/block2.png" class="d-block w-100">
        </div>
        <img src="/images/brand/block/block3.jpg" class="d-block w-100 my-">
    </div>

    <%@include file="/layout/base_script.jsp"%>

</body>
</fmt:bundle>
</html>
