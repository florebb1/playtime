<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="com.properties.message">
<%@include file="/layout/base_style.jsp"%>
<body class="bg-yellow-color">
    <header class="h-100">
        <div class="d-flex info-box py-5">
            <div class="col align-self-center px-0"><a href="mypage.jsp" class="text-white"><i class="icon-left-arrow fs-20 font-weight-bold"></i></a></div>
        </div>
    </header>
    <%-- 스탬프 안내 문구 --%>
    <div class="info-box">
        <span class="font-weight-bold text-white fs-20"><fmt:message key="message.stamp1"/></span><br>
        <span class="fs-14 text-white"><fmt:message key="message.stamp2"/></span>
    </div>

    <%-- 스탬프 --%>
    <div class="info-box bg-white border-radius-10 my-5 py-3">
        <div class="row text-center mx-0">
            <div class="col-5"><i class="icon-stamp fs-80 font-weight-bolder text-warning"></i></div>
            <div class="col-7 my-auto font-weight-bold">
                <p class="fs-16">asdfasdjflkdajf</p>
                <p class="fs-14">yyyy-mm-dd</p>
            </div>
        </div>
    </div>

    <%@include file="/layout/base_script.jsp"%>
</body>
</fmt:bundle>
</html>
