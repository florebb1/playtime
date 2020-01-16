<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<body class="overflow-auto">
    <%-- 플레이타임 로고 --%>
    <header>
        <div class="d-flex align-items-center justify-content-end my-4 info-box">
            <button type="button" class="close" aria-label="Close" onclick="history.back(-1); return false;">
                <span class="fs-35" aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="d-flex justify-content-center align-items-center h-100 my-4">
            <img src="images/logo.png" class="login-img">
        </div>
    </header>

    <%-- 로그인 문구 --%>
    <div class="login-box info-box mt-5 py-5 font-weight-bold text-center">
        <fmt:message key="message.agree1"/>
        <fmt:message key="message.agree2"/>
    </div>
    <p class="info-box font-weight-light text-center text-secondary fs-16"><fmt:message key="message.agree3"/></p>
    <p class="info-box text-center mt-4"><fmt:message key="message.agree4"/></p>

    <%-- 전체 동의 버튼 --%>
    <div class="info-box my-4">
        <button id="allAgree" type="button" class="w-100 login-btn fs-15 text-center text-white border-0 bg-darkgray-color"><fmt:message key="message.agree5"/></button>
    </div>

    <%-- 약관내용1 --%>
    <div class="info-box my-4">
        <div id="agContent1" class="d-flex align-items-center justify-content-between p-2 agree-t-box">
            <div class="fs-12"><fmt:message key="message.agree6"/></div>
            <div class="fs-20 pl-2 text-black-50"><i class="icon-checked"></i></div>
        </div>
        <div class="px-2 agree-b-box overflow-auto text-break">
            <p id="se_ag" class="py-2 fs-12"></p>
        </div>
    </div>
    <%-- 약관내용2 --%>
    <div class="info-box my-4">
        <div id="agContent2" class="d-flex align-items-center justify-content-between p-2 agree-t-box">
            <div class="fs-12"><fmt:message key="message.agree7"/></div>
            <div class="fs-20 pl-2 text-black-50"><i class="icon-checked"></i></div>
        </div>
        <div class="px-2 agree-b-box overflow-auto text-break">
            <p id="pe_in" class="py-2 fs-12"></p>
        </div>
    </div>
    <%-- 약관내용3 --%>
    <div class="info-box my-4">
        <div id="agContent3" class="d-flex align-items-center justify-content-between p-2 agree-t-box">
            <div class="fs-12"><fmt:message key="message.agree8"/></div>
            <div class="fs-20 pl-2 text-black-50"><i class="icon-checked"></i></div>
        </div>
        <div class="px-2 agree-b-box overflow-auto text-break">
            <p id="ma_ag" class="py-2 fs-12"></p>
        </div>
    </div>

    <%-- 하단 버튼 --%>
    <button id="agreeBtn" type="button" class="position-relative w-100 text-center bg-yellow-color border-0 text-white fs-15 bottom-btn">
        <fmt:message key="message.agree9"/>
    </button>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src='js/page/sign1.js'></script>
</body>
</fmt:bundle>
</html>
