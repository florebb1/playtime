<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<body class="bg-yellow-color overflow-auto">
    <header class="h-auto">
        <div class="d-flex py-5">
            <div class="col-4 align-self-center"><a href="javascript:history.back()"><i class="icon-left-arrow fs-20 font-weight-bold text-white"></i></a></div>
            <div class="col-4 text-center font-weight-bold fs-20"></div>
            <div class="col-4">
                <button class="coupon-button able"><fmt:message key="message.coupon1"/></button>
                <button class="coupon-button enable d-none"><fmt:message key="message.coupon2"/></button>
            </div>
        </div>
    </header>
    <%-- 쿠폰 검색 조건 폼 --%>
    <form id="couponListForm" method="post">
        <input type="hidden" name="COMP_CD" value="011">
        <input type="hidden" name="CUST_ID">
        <input type="hidden" name="INQ_DIV" value="1">
        <input type="hidden" name="FR_YMD">
        <input type="hidden" name="TO_YMD">
    </form>


    <%-- 쿠폰 안내 문구 --%>
    <div class="info-box">
        <p class="font-weight-bold text-white fs-20 coupon-title"><fmt:message key="message.coupon3"/></p>
        <p class="font-weight-bold text-white fs-20 coupon-title d-none"><fmt:message key="message.coupon4"/></p>
        <p class="fs-14 text-white"><fmt:message key="message.coupon5"/></p>
        <p class="text-danger fs-12"><fmt:message key="message.coupon6"/></p>
    </div>

    <%-- 기간별 nav --%>
    <div class="info-box filter-group-btn my-3">
        <button class="m_coupon p-0 filter-btn-active" id="1m_btn" type="button"><fmt:message key="message.coupon7"/></button>
        <button class="m_coupon p-0" id="3m_btn" type="button"><fmt:message key="message.coupon8"/></button>
        <button class="m_coupon p-0" id="6m_btn" type="button"><fmt:message key="message.coupon9"/></button>
        <button class="m_coupon p-0" id="12m_btn" type="button"><fmt:message key="message.coupon10"/></button>
    </div>

    <%-- coupon list --%>
    <div id="coupon-list" class="info-box my-4 coupon-card">

<%--        <div class="border-radius-10 bg-white">--%>
<%--            <a class="text-dark" href="coupon-detail.jsp">--%>
<%--                <img src="images/coupon/1-1.jpg" class="w-100">--%>
<%--                <div class="text-center p-3">--%>
<%--                    <p class="fs-18 font-weight-bold">[쿠폰]가입축하 20000동 할인</p>--%>
<%--                    <div class="mx-auto barcode my-2"></div>--%>
<%--                    <p class="fs-14 font-weight-bold"><fmt:message key="message.validity"/> : 2019.04.11 ~ 2019.04.10</p>--%>
<%--                </div>--%>
<%--            </a>--%>
<%--        </div>--%>

    </div>



<%@include file="/vietnam/layout/base_script.jsp"%>
<script src="js/page/coupon-list.js"></script>
</body>
</fmt:bundle>
</html>
