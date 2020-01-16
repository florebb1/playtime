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
                height: calc(100vh - 130px);
            }
        }
    </style>
<body class="overflow-auto">
    <div class="signUpCont">
        <%-- 플레이타임 로고 --%>
        <header class="h-auto">
            <div class="d-flex align-items-center justify-content-end py-4 info-box">
                <button type="button" class="close" aria-label="Close" onclick="history.back(); return false;">
                    <span class="fs-35" aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="d-flex justify-content-center align-items-center h-100 my-4">
                <img src="images/logo.png" class="login-img">
            </div>
        </header>


        <%-- 비밀번호 찾기 문구 --%>
        <div class="login-box info-box pb-5 font-weight-bold text-center">
            <fmt:message key="message.findPw10"/>
        </div>
        <%-- 비밀번호 찾기 입력창 --%>
        <form id="findPwForm" method="post">
            <input type="hidden" name="COMP_CD" value="011">
            <input type="hidden" name="F_TYPE" value="PW">
            <input type="hidden" name="CUST_NM">
            <input type="hidden" name="MOBILE">

            <%-- 아이디 --%>
           <div class="info-box mt-4">
                <input name="CUST_WEB_ID" type="text" class="w-100 sign-input-box pl-2" placeholder="Vui lòng nhập ID">
            </div>
            <div class="info-box d-flex justify-content-center align-items-center my-4">
                <div class="col-9 w-100 mr-2 p-0">
                    <input name="EMAIL" type="text" class="w-100 sign-input-box pl-2 bg-ddd-color" placeholder="<fmt:message key="message.findPw4"/>" readonly>
                </div>
                <div class="col w-100 p-0">
                    <button id="editBtn" type="button" class="custom-btn bg-yellow-color text-center text-white w-100 border-0"><fmt:message key="message.findPw5"/></button>
                </div>
            </div>
        </form>

        <%-- 비밀번호 찾기 안내 문구 --%>
        <div class="info-box my-5">
            <div class="text-center">
                <p class="fs-14"><fmt:message key="message.findPw6"/></p>
            </div>
        </div>
        <ul class="fs-12 text-danger py-5 mb-0">
            <li class="pr-8p"><fmt:message key="message.findPw7"/></li>
            <li class="pr-8p"><fmt:message key="message.findPw8"/></li>
            <li class="pr-8p"><fmt:message key="message.findPw9"/></li>
        </ul>
    </div>
        <%-- 하단 버튼 --%>
    <button id="findPwBtn" type="button" class="position-relative w-100 text-center bg-yellow-color border-0 text-white fs-22 bottom-btn font-weight-bold">
        <fmt:message key="message.confirm"/>
    </button>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src='js/page/find-pw2.js'></script>

</body>
</fmt:bundle>
</html>
