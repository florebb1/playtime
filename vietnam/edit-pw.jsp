<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<style>
    @media only screen and (-webkit-device-pixel-ratio: 3) and (max-device-height: 812px) and (min-device-width: 375px) {
        header {
            margin-top: 40px;
        }
    }
</style>
<body class="overflow-auto">
    <div class="pwEdit">
        <header>
            <div class="d-flex py-5">
                <div class="col align-self-center"><a href="setting.jsp" class="text-dark"><i class="icon-left-arrow fs-20 font-weight-bold"></i></a></div>
                <div class="col-8 text-center font-weight-bold fs-18"><fmt:message key="message.editPw1"/></div>
                <div class="col"></div>
            </div>
        </header>

        <%-- 비밀번호 변경 문구 --%>
        <div class="login-box info-box pt-5 font-weight-bold text-center"><fmt:message key="message.editPw2"/></div>

        <%-- 비밀번호 변경 안내2 --%>
        <div class="info-box my-5 font-weight-bold text-center"><fmt:message key="message.editPw3"/></div>
        <ul class="info-box px-0 fs-12 text-danger">
            <li><fmt:message key="message.editPw4"/></li>
            <li><fmt:message key="message.editPw5"/></li>
            <li><fmt:message key="message.editPw6"/></li>
        </ul>

        <%-- 비밀번호 변경 입력창 --%>
        <form id="editPwForm" method="post">
            <div class="info-box pb-5">
                <input type="hidden" name="COMP_CD" value="011">
                <input type="hidden" name="CUST_WEB_ID">
                <input type="password" name="CUST_PW_BEF" class="w-100 login-input mt-4" placeholder="<fmt:message key="message.editPw7"/>">
                <input type="password" id="CUST_PW_AFT" name="CUST_PW_AFT" class="w-100 login-input mt-4" placeholder="<fmt:message key="message.editPw8"/>">
                <input type="password" id="CUST_PW_AFT2" class="w-100 login-input mt-4" placeholder="<fmt:message key="message.editPw9"/>">
            </div>
        </form>
    </div>
    <%-- 하단 버튼 --%>
    <button id="editBtn" type="button" class="position-relative w-100 text-center bg-yellow-color border-0 text-white fs-20 bottom-btn"><fmt:message key="message.edit4"/></button>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src="js/page/edit-pw.js"></script>
</body>
</fmt:bundle>
</html>
