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
        .signUpCont {
            min-height: calc(100vh - 130px);
        }
    }
</style>
<body>
    <div class="signUpCont">
        <header class="h-auto">
            <div class="d-flex py-5">
                <div class="col align-self-center"><a href="setting.jsp" class="text-dark"><i class="icon-left-arrow fs-20 font-weight-bold"></i></a></div>
                <div class="col-8 text-center font-weight-bold fs-18"><fmt:message key="message.withdrawal1"/></div>
                <div class="col"></div>
            </div>
        </header>
        <%-- 회원탈퇴 안내 문구 --%>
        <div class="login-box info-box pt-5 pb-5 font-weight-bold text-center"><fmt:message key="message.withdrawal2"/></div>

        <form id="delForm" method="post">
            <%-- 탈퇴 사유 입력창 --%>
            <div class="info-box">
                <input type="hidden" name="COMP_CD" value="011">
                <input type="hidden" name="CUST_ID">
                <input type="hidden" name="CUST_WEB_ID">
                <input type="hidden" name="CUST_STAT" value="01">
                <textarea name="LEAVE_RMK" class="w-100 border p-2" cols="30" rows="5" maxlength="100" placeholder="<fmt:message key="message.withdrawal3"/>"></textarea>
            </div>
        </form>

        <%-- 탈퇴시 경고 문구 --%>
        <div class="info-box fs-12 text-center text-danger py-5">
            <span><fmt:message key="message.withdrawal4"/></span><br>
            <span><fmt:message key="message.withdrawal5"/></span><br>
            <span><fmt:message key="message.withdrawal6"/></span>
        </div>
    </div>
    <%-- 하단 버튼 --%>
    <button id="dleBtn" type="button" class="position-relative w-100 text-center bg-yellow-color border-0 text-white fs-20 bottom-btn"><fmt:message key="message.edit4"/></button>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src="js/page/withdrawal.js"></script>
</body>
</fmt:bundle>
</html>
