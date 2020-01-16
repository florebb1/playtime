<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<body class="overflow-auto">
    <%-- 플레이타임 로고 --%>
    <header>
        <div class="d-flex justify-content-center align-items-center h-100 my-5">
            <img src="images/logo.png" class="login-img">
        </div>
    </header>

    <div class="container">
        <%-- 로그인 문구 --%>
        <div class="login-box info-box my-5 font-weight-bold text-center">
            Đăng nhập đơn giản và tận hưởng
            nhiều ưu đãi của Playtime
        </div>
        <%-- 로그인 입력창 --%>
        <form id="loginForm" method="post">
            <%-- 히든 정보 --%>
            <input type="hidden" name="COMP_CD" value="011">
            <input type="hidden" name="LOGIN_IP" value="">
            <input type="hidden" name="LOGIN_DIV" value="A">

            <div class="info-box mt-5">
                <input type="text" name="CUST_WEB_ID" class="w-100 login-input mt-4" placeholder="<fmt:message key="message.login4"/>">
                <input type="password" name="CUST_PW" class="w-100 login-input mt-4" placeholder="<fmt:message key="message.login5"/>">
            </div>
            <%-- 아이디/비밀번호 찾기 링크 --%>
            <div class="d-flex align-items-center justify-content-end info-box fs-11 font-weight-light fc-808080">
                <a href="find-id.jsp" class="p-2 text-secondary"><fmt:message key="message.login6"/></a>
                <a href="find-pw.jsp" class="p-2 text-secondary"><fmt:message key="message.login7"/></a>
            </div>
            <%-- 로그인 버튼 --%>
            <div class="info-box mt-5 pt-5">
                <button id="loginBtn" type="button" class="w-100 login-btn bg-yellow-color fs-15 font-weight-bold text-center text-white border-0"><fmt:message key="message.login8"/></button>
            </div>
            <%-- 회원가입 링크 --%>
            <div class="info-box my-4 text-center fs-15 sign-text">
                <span class="text-secondary"><fmt:message key="message.login9"/></span>
                <a class="px-2 text-dark font-weight-bold" href="sign-up1.jsp"><fmt:message key="message.login10"/></a>
            </div>
        </form>

    </div>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src='js/page/login.js'></script>
</body>
</fmt:bundle>
</html>
