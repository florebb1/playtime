<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<style>
    @media only screen and (-webkit-device-pixel-ratio: 3) and (max-device-height: 812px) and (min-device-width: 375px){
        header {
            margin-top: 80px;
        }
        .child-base-info {
            height: auto;
        }
    }
</style>
<body class="overflow-auto">
    <div class="child-base-info">
        <%-- 플레이타임 로고 --%>
        <header class="py-5">
            <div class="d-flex justify-content-center align-items-center h-100">
                <img src="images/logo.png" class="login-img">
            </div>
        </header>

        <%-- 회원가입 문구 --%>
        <div class="login-box info-box py-5 font-weight-bold text-center">
            <fmt:message key="message.signUp36"/>
        </div>

        <%-- 자녀등록 안내사항 --%>
        <div class="change-pw-info">
            <ul class="mr-4">
                <li><fmt:message key="message.signUp37"/></li>
                <li><fmt:message key="message.signUp38"/></li>
                <li><fmt:message key="message.signUp39"/></li>
            </ul>
        </div>
        <form method="post" id="childForm">
            <input type="hidden" id="APPEND_CNT" value="4">
            <input type="hidden" name="COMP_CD" value="011">
            <input type="hidden" name="USER_ID" value="MOBILE">
            <input type="hidden" name="CUST_ID">
            <!-- 가입브랜드 코드 -->
            <input type="hidden" name="BRAND_CD" value="101">
            <!-- 가입매장 코드 -->
            <input type="hidden" name="STOR_CD" value="1019999">

            <div id="def_chi">
                <div class="children_default">
                    <%-- 자녀 이름/성별 input --%>
                    <div class="info-box text-left font-weight-bold">
                        <label class="px-1"><fmt:message key="message.signUp40"/></label>
                    </div>
                    <div class="info-box d-flex justify-content-center align-items-center mb-4">
                        <div class="w-100 col-8 mr-2 p-0">
                            <input type="text" name="C_CHILD_NM" class="sign-input-box w-100 pl-2 child_nm" placeholder="<fmt:message key="message.signUp41"/>">
                        </div>
                        <div class="col btn-group p-0" role="group">
                            <button type="button" class="btn select-left-btn text-secondary col-6 child-sex child-m"><fmt:message key="message.signUp11"/></button>
                            <button type="button" class="btn select-right-btn text-secondary col-6 child-sex child-f"><fmt:message key="message.signUp12"/></button>
                            <input type='hidden' class='sex_div' name='C_SEX_DIV'>
                            <input type='hidden' class='birth_dt' name='C_BIRTH_DT'>
                            <input type='hidden' name='C_USE_YN' value='Y'>
                            <input type='hidden' name='C_CHILD_NO' value='0'>
                        </div>
                    </div>
                    <%-- 자녀 생년월일 input --%>
                    <div class="info-box text-left font-weight-bold">
                        <label class="px-1"><fmt:message key="message.signUp42"/></label>
                    </div>
                    <div class="info-box d-flex justify-content-center align-items-center mb-4">
                        <div class="w-100 col mr-2 p-0">
                            <input type="number" class="sign-input-box w-100 text-center day" placeholder="ex) 01">
                        </div>
                        <div class="w-100 col mr-2 p-0">
                            <input type="number" class="sign-input-box w-100 text-center month" placeholder="ex) 01">
                        </div>
                        <div class="w-100 col-6 p-0">
                            <input type="number" class="sign-input-box w-100 text-center year" placeholder="ex) 2002">
                        </div>

                    </div>
                </div>
            </div>
            <%-- 추가 자녀등록 구분선 --%>
            <div class="divid"><hr/></div>
            <%-- 추가 자녀등록 --%>
            <div id="add-child-areas">

            </div>
        </form>
    </div>


    <%-- 자녀 추가 버튼 --%>
    <button id="child-add" class="child-add-btn border-0 w-100 text-center bg-white">
        <fmt:message key="message.signUp43"/>
    </button>

    <%-- 하단 버튼 --%>
    <button id="next-btn" type="button" class="position-relative w-100 text-center bg-yellow-color border-0 text-white fs-20 bottom-btn">
        <fmt:message key="message.signUp44"/>
    </button>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src='js/page/sign2-b.js'></script>
</body>
</fmt:bundle>
</html>
