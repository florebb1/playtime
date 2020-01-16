<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="com.properties.message">
<%@include file="/layout/base_style.jsp"%>
<body class="bg-yellow-color">
    <header class="h-100">
        <div class="d-flex info-box py-5">
            <div class="col align-self-center px-0" onclick="history.back()"><i class="icon-left-arrow fs-20 font-weight-bold"></i></div>
        </div>
    </header>

    <%-- 포인트 안내 문구 --%>
    <div class="info-box">
        <span class="font-weight-bold text-white fs-20"><fmt:message key="message.point1"/></span><br>
        <span class="fs-14 text-white"><fmt:message key="message.point2"/></span>
    </div>

    <%-- 기간별 nav --%>
    <div class="info-box filter-group-btn my-3">
        <button class="m_coupon p-0 filter-btn-active" id="1m_btn" type="button"><fmt:message key="message.coupon7"/></button>
        <button class="m_coupon p-0" id="3m_btn" type="button"><fmt:message key="message.coupon8"/></button>
        <button class="m_coupon p-0" id="6m_btn" type="button"><fmt:message key="message.coupon9"/></button>
        <button class="m_coupon p-0" id="12m_btn" type="button"><fmt:message key="message.coupon10"/></button>
    </div>

    <%-- 포인트 --%>
    <div class="row info-box my-4">
        <div class="col bg-white border-top-radius-10" style="min-height: 130px;">col</div>
        <div class="w-100"></div>
        <div class="col bg-f5f5f5-color border-bottom-radius-10" style="min-height: 200px;">col</div>
    </div>

    <%@include file="/layout/base_script.jsp"%>
</body>
</fmt:bundle>
</html>
