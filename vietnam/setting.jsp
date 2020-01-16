<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<style>
    @media only screen and (-webkit-device-pixel-ratio: 3) and (max-device-height: 812px) and (min-device-width: 375px) {
        header {
            margin-top: 80px;
        }
    }
</style>
<body class="overflow-auto">
    <header>
        <div class="d-flex my-5">
            <div class="col align-self-center"><a href="mypage.jsp"><i class="icon-left-arrow fs-20 font-weight-bold text-dark"></i></a></div>
            <div class="col-8 text-center font-weight-bold fs-20"><fmt:message key="message.setting1"/></div>
            <div class="col"></div>
        </div>
    </header>

    <form id="setForm" method="post">
        <input name="COMP_CD" type="hidden" value="011">
        <input name="CUST_ID" type="hidden">
        <input name="EMAIL_RCV_YN" type="hidden">
        <input name="SMS_RCV_YN" type="hidden">
        <input name="PUSH_RCV_YN" type="hidden">
        <!-- 디바이스 정보 -->
        <input name="DEVICE_DIV" type="hidden" value="1">
        <input name="DEVICE_NM" type="hidden" value="A1920">
        <input name="MOBILE_KIND" type="hidden" value="00">
        <input name="AUTH_TOKEN" type="hidden">
    </form>
    <%-- 계정관련 --%>
    <div class="info-box fs-15 my-3">
        <span class="d-block fs-18 font-weight-bold pb-4"><fmt:message key="message.setting2"/></span>
        <span id="CUST_WEB_ID" class="d-block pb-4"></span>
        <a class="d-block text-secondary pb-4" href="edit-pw.jsp"><fmt:message key="message.setting3"/></a>
        <a id="logout" class="d-block text-dark pb-4"><fmt:message key="message.setting4"/></a>
        <a class="d-block text-secondary pb-4" href="withdrawal.jsp"><fmt:message key="message.setting5"/></a>
    </div>
    <%-- 정보발송관련 --%>
    <div class="info-box fs-15 my-3 align-middle">
        <span class="d-block fs-18 font-weight-bold pb-4"><fmt:message key="message.setting6"/></span>
        <div class="row pb-4">
            <div class="col-9"><fmt:message key="message.setting7"/></div>
            <div class="col-3 text-right">
                <label class="switch">
                    <input id="push-slide" type="checkbox">
                    <div class="slider round"></div>
                </label>
            </div>
        </div>
        <div class="row pb-4">
            <div class="col-9">Đồng ý  nhận thông tin qua email</div>
            <div class="col-3 text-right">
                <label class="switch">
                    <input id="email-slide" type="checkbox">
                    <div class="slider round"></div>
                </label>
            </div>
        </div>
        <div class="row pb-4">
            <div class="col-9">Đồng ý nhận thông tin qua tin nhắn SMS</div>
            <div class="col-3 text-right">
                <label class="switch">
                    <input id="sms-slide" type="checkbox">
                    <div class="slider round"></div>
                </label>
            </div>
        </div>

    </div>
    <%-- 버전정보 --%>
    <div class="info-box fs-15 my-3 pb-5">
        <span class="d-block fs-18 font-weight-bold pb-4"><fmt:message key="message.setting10"/></span>
        <span class="">2.0.0</span>
    </div>

<%@include file="/vietnam/layout/base_script.jsp"%>
<script src="js/page/setting.js"></script>
</body>
</fmt:bundle>
</html>
