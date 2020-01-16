<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="com.properties.message">
<%@include file="/layout/base_style.jsp"%>
<body>
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

    <div class="container">
        <%-- 아이디 찾기 문구 --%>
        <div class="login-box info-box mt-5 py-5 font-weight-bold text-center">
            <fmt:message key="message.findId1"/>
            <fmt:message key="message.findId2"/>
        </div>
        <%-- 아이디 찾기 입력창 --%>
        <form id="findIdForm" method="post">
            <input type="hidden" name="COMP_CD" value="011">
            <input type="hidden" name="F_TYPE" value="ID">
            <div class="info-box">
                <input type="text" name="CUST_NM" class="w-100 sign-input-box pl-2 mt-4" placeholder="<fmt:message key="message.findId3"/>">
                <input type="number" name="MOBILE" class="w-100 sign-input-box pl-2 mt-4" placeholder="<fmt:message key="message.findId4"/>">
            </div>
            <%-- 로그인 버튼 --%>
            <div class="info-box mt-5 pt-3">
                <button id="findIdBtn" type="button" class="w-100 login-btn bg-yellow-color fs-15 font-weight-bold text-center text-white border-0"><fmt:message key="message.findId5"/></button>
            </div>
            <%-- 비밀번호찾기 링크 --%>
            <div class="info-box my-4 text-center fs-15">
                <span class="text-secondary"><fmt:message key="message.findId6"/></span>
                <a class="px-2 text-dark font-weight-bold" href="find-pw-b.jsp"><fmt:message key="message.findId7"/></a>
            </div>
        </form>
    </div>

    <%@include file="/layout/base_script.jsp"%>
    <script src='js/page/find-id.js'></script>
</body>
</fmt:bundle>
</html>
