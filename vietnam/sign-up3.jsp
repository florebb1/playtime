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
        .signUpCont {
            min-height: calc(100vh - 130px);
        }
    }
</style>
<body class="overflow-auto">
    <div class="signUpCont">
        <%-- 플레이타임 로고 --%>
        <header>
            <div class="d-flex justify-content-center align-items-center py-5">
                <img src="images/logo.png" class="login-img">
            </div>
        </header>

        <div>
            <%-- 회원가입 완료 문구 --%>
            <div class="login-box info-box my-5 font-weight-bold text-center">
                <fmt:message key="message.signComp1"/>
                <fmt:message key="message.signComp2"/>
            </div>

            <%-- 가입 축하 쿠폰 --%>
            <div class="info-box my-5 border-radius-10 text-center text-white bg-yellow-color">
                <div class="fs-20 p-3">Welcome Playmembers</div>
                <div class="fs-30 font-weight-bold p-3">Phiếu giảm giá 50%</div>
                <div class="p-3">
                    <span class="fs-12"><fmt:message key="message.signComp4"/> <span id="ymd"></span></span><br>
                    <span class="fs-15"><fmt:message key="message.signComp5"/></span>
                </div>
            </div>

            <%-- 가입 축하 문구 --%>
            <div class="info-box pb-5 text-secondary text-center fs-12">
                <fmt:message key="message.signComp6"/>
                <fmt:message key="message.signComp7"/>
                <fmt:message key="message.signComp8"/>
            </div>
        </div>
    </div>
    <%-- 하단 버튼 --%>
    <button type="button" class="position-relative w-100 text-center bg-yellow-color border-0 text-white fs-15 bottom-btn" onclick="location='login.jsp'">
        <fmt:message key="message.signComp9"/>
    </button>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src='js/page/sign3.js'></script>
</body>
</fmt:bundle>
</html>
