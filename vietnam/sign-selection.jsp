<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="ko"/>
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
        <div class="d-flex justify-content-center align-items-center my-4">
            <img src="images/logo.png" class="login-img">
        </div>
    </header>

    <%-- 회원가입 문구 --%>
    <div class="login-box info-box my-5 font-weight-bold text-center">
        기존 플레이타임<br>회원이신가요?
    </div>

    <%-- 전체 동의 버튼 --%>
    <div class="my-5 py-5">
        <div class="info-box my-3">
            <button type="button" class="w-100 login-btn fs-15 text-center text-white border-0 bg-yellow-color" onclick="location='sign-up2-a.jsp'">신규 가입하기</button>
        </div>
        <div class="info-box my-3">
            <button type="button" class="w-100 login-btn fs-15 text-center text-white border-0 bg-blue-color">이름과 연락처로 찾기</button>
        </div>
        <div class="info-box my-3">
            <button type="button" class="w-100 login-btn fs-15 text-center text-white border-0 bg-pink-color">다회권 인증번호와 연락처로 찾기</button>
        </div>
    </div>

    <script src='js/jquery-2.2.4.min.js'></script>
    <script src='js/popper.min.js'></script>
    <script src='js/bootstrap.min.js'></script>
    <script>
        $(document).ready(function(){
        });
    </script>
</body>
</fmt:bundle>
</html>
