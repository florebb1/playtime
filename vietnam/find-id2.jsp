<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<body>
    <%-- 플레이타임 로고 --%>
    <header>
        <div class="d-flex justify-content-center align-items-center my-5">
            <img src="images/logo.png" class="login-img">
        </div>
    </header>

    <%-- 로그인 문구 --%>
    <div class="login-box info-box my-5 font-weight-bold text-center">
        <fmt:message key="message.findId8"/>
    </div>

    <%-- 아이디 안내 --%>
    <div class="info-box mt-5 pt-5 text-center">
        <p id="findId" class="fs-25 font-weight-bold"></p>
    </div>

    <%-- 하단 버튼 --%>
    <button id="agreeBtn" type="button" class="position-fixed w-100 text-center bg-yellow-color border-0 text-white fs-22 bottom-btn font-weight-bold" onclick="location.href='login.jsp'">
        <fmt:message key="message.findId9"/>
    </button>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src='js/page/find-id2.js'></script>
</body>
</fmt:bundle>
</html>
