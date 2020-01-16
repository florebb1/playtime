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
    <%-- 플레이타임 로고 --%>
    <header>
        <div class="d-flex align-items-center justify-content-end my-4 info-box">
            <button type="button" class="close" aria-label="Close" onclick="history.back(); return false;">
                <span class="fs-35" aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="d-flex justify-content-center align-items-center h-100 my-4">
            <img src="images/logo.png" class="login-img">
        </div>
    </header>

    <div class="">
        <%-- 비밀번호 찾기 문구 --%>
        <div class="login-box info-box mt-5 py-5 font-weight-bold text-center">
            <fmt:message key="message.findPw1"/>
            <fmt:message key="message.findPw2"/>
        </div>
        <%-- 비밀번호 찾기 본인인증 --%>
        <form id="findPwForm" method="post">
            <input type="hidden" name="COMP_CD" value="011">
            <div class="info-box">
                <input type="text" name="CUST_NM" class="w-100 sign-input-box pl-2 mt-4" placeholder="<fmt:message key="message.certification2"/>">
                <input type="number" name="MOBILE" class="w-100 sign-input-box pl-2 mt-4" placeholder="<fmt:message key="message.certification3"/>">
            </div>
            <%-- 정보찾기 버튼 --%>
            <div class="info-box my-5">
                <button id="findPwBtn" type="button" class="w-100 login-btn bg-yellow-color fs-15 font-weight-bold text-center text-white border-0"><fmt:message key="message.find"/></button>
            </div>
        </form>
    </div>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src='js/page/find-pw.js'></script>
</body>
</fmt:bundle>
</html>
