<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
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

    <%-- 회원가입 문구 --%>
    <div class="login-box info-box my-5 py-5 font-weight-bold text-center">
        <fmt:message key="message.signUp1"/>
    </div>
    <form id="" method="post">

    </form>
    <%-- 아이디 input --%>
    <div class="info-box text-left font-weight-bold">
        <label class="px-1"></label><fmt:message key="message.signUp2"/></label>
    </div>
    <div class="info-box d-flex justify-content-center align-items-center">
        <input type="text" class="w-100 sign-input-box pl-2" placeholder="<fmt:message key="message.signUp3"/>">
    </div>
    <%-- 중복확인 버튼 --%>
    <div class="info-box my-4">
        <button id="allAgree" type="button" class="w-100 login-btn fs-15 text-center text-white border-0 bg-darkgray-color"><fmt:message key="message.signUp4"/></button>
    </div>

    <%-- 비밀번호 input --%>
    <div class="info-box text-left font-weight-bold">
        <label class="px-1"></label><fmt:message key="message.signUp5"/></label>
    </div>
    <div class="info-box d-flex justify-content-center align-items-center mb-4">
        <input type="password" class="w-100 sign-input-box pl-2" placeholder="<fmt:message key="message.signUp6"/>">
    </div>

    <%-- 비밀번호 확인 input --%>
    <div class="info-box text-left font-weight-bold">
        <label class="px-1"></label><fmt:message key="message.signUp7"/></label>
    </div>
    <div class="info-box d-flex justify-content-center align-items-center mb-4">
        <input type="password" class="w-100 sign-input-box pl-2" placeholder="<fmt:message key="message.signUp8"/>">
    </div>

    <%-- 이름/성별 input --%>
    <div class="info-box text-left font-weight-bold">
        <label class="px-1"></label><fmt:message key="message.signUp9"/></label>
    </div>
    <div class="info-box d-flex justify-content-center align-items-center mb-4">
        <div class="w-100 col-8 mr-2 p-0">
            <input type="text" class="sign-input-box w-100 pl-2" placeholder="<fmt:message key="message.signUp10"/>">
        </div>
        <div class="col btn-group p-0" role="group">
            <button id="parents-m" class="btn select-left-btn text-secondary col-6"><fmt:message key="message.signUp11"/></button>
            <button id="parents-f" class="btn select-right-btn text-secondary col-6"><fmt:message key="message.signUp12"/></button>
        </div>
    </div>

    <%-- 생년월일 input --%>
    <div class="info-box text-left font-weight-bold">
        <label class="px-1"></label><fmt:message key="message.signUp13"/></label>
    </div>
    <div class="info-box d-flex justify-content-center align-items-center mb-4">
        <div class="w-100 col-6 mr-2 p-0">
<%--            <input max="9999" maxlength="4" type="number" class="sign-input-box w-100 text-center" placeholder="<fmt:message key="message.signUp14"/>" oninput="maxLengthCheck(this);">--%>
            <select class="sign-input-box w-100 text-center-last">
                <c:set var="now" value="<%=new java.util.Date()%>" />
                <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
                <c:forEach var="i" begin="1900" end="${sysYear}" step="1">
                    <option value="${sysYear - i + 1900}">${sysYear - i + 1900}</option>
                </c:forEach>
            </select>
        </div>
        <div class="w-100 col mr-2 p-0">
<%--            <input max="12" maxlength="2" type="number" class="sign-input-box w-100 text-center" placeholder="<fmt:message key="message.signUp15"/>" oninput="maxLengthCheck(this);">--%>
            <select class="sign-input-box w-100 text-center-last">
                <c:forEach var="i" begin="1" end="12" step="1">
                    <option value="${i}"><c:out value="${i}" /></option>
                </c:forEach>
            </select>
        </div>
        <div class="w-100 col p-0">
<%--            <input max="31" maxlength="2" type="number" class="sign-input-box w-100 text-center" placeholder="<fmt:message key="message.signUp16"/>" oninput="maxLengthCheck(this);">--%>
            <select class="sign-input-box w-100 text-center-last">
                <c:forEach var="i" begin="1" end="31" step="1">
                    <option value="${i}"><c:out value="${i}" /></option>
                </c:forEach>
            </select>
        </div>
    </div>

    <%-- 휴대전화 번호 input --%>
    <div class="info-box text-left font-weight-bold">
        <label class="px-1"></label><fmt:message key="message.signUp17"/></label>
    </div>
    <div class="info-box d-flex justify-content-center align-items-center mb-4">
        <input type="number" class="w-100 sign-input-box pl-2" placeholder="<fmt:message key="message.signUp18"/>">
    </div>

    <%-- 이메일 input --%>
    <div class="info-box text-left font-weight-bold">
        <label class="px-1"></label><fmt:message key="message.signUp19"/></label>
    </div>
    <div class="info-box d-flex justify-content-center align-items-center mb-4">
        <input type="text" class="w-100 sign-input-box pl-2" placeholder="<fmt:message key="message.signUp20"/>">
    </div>

    <%-- 우편번호 및 주소 input --%>
    <div class="info-box text-left font-weight-bold">
        <label class="px-1"></label><fmt:message key="message.signUp21"/></label>
    </div>
    <div class="info-box d-flex justify-content-center align-items-center mb-4">
        <div class="w-100 col-4 mr-2 p-0">
            <input type="number" max="999999" maxlength="6" class="sign-input-box w-100 text-center" placeholder="<fmt:message key="message.signUp22"/>" oninput="maxLengthCheck(this);">
        </div>
        <div class="w-100 col p-0">
            <input type="text" class="sign-input-box w-100 pl-2" placeholder="<fmt:message key="message.signUp23"/>">
        </div>
    </div>

    <%-- 상세주소 input --%>
    <div class="info-box text-left font-weight-bold">
        <label class="px-1"></label><fmt:message key="message.signUp24"/></label>
    </div>
    <div class="info-box d-flex justify-content-center align-items-center mb-4">
        <input type="text" class="w-100 sign-input-box pl-2" placeholder="<fmt:message key="message.signUp25"/>">
    </div>

    <%-- 자녀수 input --%>
    <div class="info-box text-left font-weight-bold">
        <label class="px-1"></label><fmt:message key="message.signUp26"/></label>
    </div>
    <div class="info-box d-flex justify-content-center align-items-center mb-4">
        <input type="number" max="99" maxlength="2" class="w-100 sign-input-box pl-2" placeholder="<fmt:message key="message.signUp27"/>" oninput="maxLengthCheck(this);">
    </div>

    <%-- 자녀와의 관계 input --%>
    <div class="info-box text-left font-weight-bold">
        <label class="px-1"></label><fmt:message key="message.signUp28"/></label>
    </div>
    <div class="info-box d-flex justify-content-center align-items-center mb-4">
        <select id="relation" class="w-100 sign-input-box pl-2 text-secondary">
            <option class="d-none" value="0" disabled selected><fmt:message key="message.signUp29"/></option>
            <option data-text="부모" value="10"><fmt:message key="message.signUp30"/></option>
            <option data-text="조부모" value="20"><fmt:message key="message.signUp31"/></option>
            <option data-text="친척" value="30"><fmt:message key="message.signUp32"/></option>
            <option data-text="기타" value="40"><fmt:message key="message.signUp33"/></option>
        </select>
    </div>
    <div id="relation-input" class="info-box justify-content-center align-items-center mb-4 d-none">
        <input type="text" class="w-100 sign-input-box pl-2" placeholder="<fmt:message key="message.signUp34"/>" oninput="maxLengthCheck(this);">
    </div>

    <div class="info-box fs-15 pt-5"><fmt:message key="message.signUp35"/></div>
    <%-- 자녀 이름/성별 input --%>
    <div class="info-box text-left font-weight-bold">
        <label class="px-1"></label><fmt:message key="message.signUp36"/></label>
    </div>
    <div class="info-box d-flex justify-content-center align-items-center mb-4">
        <div class="w-100 col-8 mr-2 p-0">
            <input type="text" class="sign-input-box w-100 pl-2" placeholder="<fmt:message key="message.signUp37"/>">
        </div>
        <div class="col btn-group p-0" role="group">
            <button class="btn select-left-btn text-secondary col-6 child-m"><fmt:message key="message.signUp11"/></button>
            <button class="btn select-right-btn text-secondary col-6 child-f"><fmt:message key="message.signUp12"/></button>
        </div>
    </div>

    <%-- 자녀 생년월일 input --%>
    <div class="info-box text-left font-weight-bold">
        <label class="px-1"></label><fmt:message key="message.signUp38"/></label>
    </div>
    <div class="info-box d-flex justify-content-center align-items-center mb-4">
        <div class="w-100 col-6 mr-2 p-0">
            <input max="9999" maxlength="4" type="number" class="sign-input-box w-100 text-center" placeholder="<fmt:message key="message.signUp14"/>" oninput="maxLengthCheck(this);">
        </div>
        <div class="w-100 col mr-2 p-0">
            <input max="12" maxlength="2" type="number" class="sign-input-box w-100 text-center" placeholder="<fmt:message key="message.signUp15"/>" oninput="maxLengthCheck(this);">
        </div>
        <div class="w-100 col p-0">
            <input max="31" maxlength="2" type="number" class="sign-input-box w-100 text-center" placeholder="<fmt:message key="message.signUp16"/>" oninput="maxLengthCheck(this);">
        </div>
    </div>
    <div id="add-child-areas"></div>



    <%-- 자녀 추가 버튼 --%>
    <button id="child-add" class="child-add-btn border-0 w-100 text-center bg-white">
        <fmt:message key="message.signUp39"/>
    </button>

    <%-- 하단 버튼 --%>
    <button id="" type="button" class="position-relative w-100 text-center bg-yellow-color border-0 text-white fs-20 bottom-btn">
        <fmt:message key="message.signUp40"/>
    </button>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src='js/page/sign2.js'></script>
</body>
</fmt:bundle>
</html>
