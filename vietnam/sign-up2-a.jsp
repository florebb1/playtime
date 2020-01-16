<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
    <%@include file="/vietnam/layout/base_style.jsp"%>
    <body class="overflow-auto">
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
    <div class="login-box info-box mt-5 py-5 font-weight-bold text-center">
        <fmt:message key="message.signUp1"/>
    </div>
    <form id="signForm" method="post">
        <input type="hidden" name="COMP_CD" value="011">
        <input type="hidden" id="REG_DIV" name="REG_DIV" value="N">
        <input type="hidden" id="CUST_ID" name="CUST_ID">
        <input type="hidden" name="PUSH_RCV_YN" value="Y">
        <input type="hidden" name="EMAIL_RCV_YN" value="Y">
        <input type="hidden" name="LOGIN_DIV" value="A">
        <input type="hidden" id="SEX_DIV" name="SEX_DIV">
        <input type="hidden" id="BIRTH_DT" name="BIRTH_DT">
        <input type="hidden" name="SMS_RCV_YN" id="SMS_RCV_YN" value="N">
        <input type="hidden" name="BRAND_CD" value="101">
        <input type="hidden" name="STOR_CD" value="1019999">
        <input type="hidden" id="CUST_WEB_ID" name="CUST_WEB_ID">
        <input type="hidden" id="CUST_WEB_ID2">

            <%-- 필수 항목 --%>
        <div class="section-box-a">
                <%-- 아이디 input --%>
            <div class="text-left font-weight-bold">
                <label class="px-1"></label><fmt:message key="message.signUp2"/></label>
            </div>
            <div class="d-flex justify-content-center align-items-center">
                <div class="w-100 col-4 p-0">
                    <input id="email1" type="text" class="w-100 sign-input-box pl-2">
                </div>@
                <div class="w-100 col mr-2 p-0">
                    <input id="email2" type="text" class="sign-input-box w-100 pl-2 bg-gray-color" readonly>
                </div>
                <div class="w-100 col p-0">
                    <select id="select_email" class="sign-input-box w-100 text-center-last text-secondary">
                        <option class="d-none" disabled selected><fmt:message key="message.signUp3"/></option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="yahoo.com">yahoo.com</option>
                        <option value="icoul.com">icoul.com</option>
                        <option value="coccoc.com">coccoc.com</option>
                        <option value="etc"><fmt:message key="message.signUp3-1"/></option>
                    </select>
                </div>
            </div>
                <%-- 중복확인 버튼 --%>
            <div class="my-4">
                <button id="idCheck" type="button" class="w-100 login-btn fs-15 text-center text-white border-0 bg-darkgray-color"><fmt:message key="message.signUp4"/></button>
            </div>
                <%-- 비밀번호 input --%>
            <div class="text-left font-weight-bold">
                <label class="px-1"></label><fmt:message key="message.signUp5"/></label>
            </div>
            <div class="d-flex justify-content-center align-items-center mb-4">
                <input type="password" name="CUST_PW" class="w-100 sign-input-box pl-2" placeholder="<fmt:message key="message.signUp6"/>">
            </div>
                <%-- 비밀번호 확인 input --%>
            <div class="text-left font-weight-bold">
                <label class="px-1"></label><fmt:message key="message.signUp7"/></label>
            </div>
            <div class="d-flex justify-content-center align-items-center mb-4">
                <input type="password" name="CUST_PW2" class="w-100 sign-input-box pl-2" placeholder="<fmt:message key="message.signUp8"/>">
            </div>
                <%-- 이름/성별 input --%>
            <div class="text-left font-weight-bold">
                <label class="px-1"></label><fmt:message key="message.signUp9"/></label>
            </div>
            <div class="d-flex justify-content-center align-items-center mb-4">
                <div class="w-100 col-8 mr-2 p-0">
                    <input type="text" id="CUST_NM" name="CUST_NM" class="sign-input-box w-100 pl-2 info-bg-color" placeholder="<fmt:message key="message.signUp10"/>">
                </div>
                <div class="col btn-group p-0" role="group">
                    <button type="button" id="parents-m" class="btn select-left-btn text-secondary col-6"><fmt:message key="message.signUp11"/></button>
                    <button type="button" id="parents-f" class="btn select-right-btn text-secondary col-6"><fmt:message key="message.signUp12"/></button>
                </div>
            </div>
                <%-- 생년월일 input --%>
            <div class="text-left font-weight-bold">
                <label class="px-1"></label><fmt:message key="message.signUp13"/></label>
            </div>
            <div class="d-flex justify-content-center align-items-center mb-4">
                <div class="w-100 col mr-2 p-0">
                    <select id="day" class="sign-input-box w-100 text-center-last">
                        <c:forEach var="i" begin="1" end="31" step="1">
                            <option value="${i}"><c:out value="${i}" /></option>
                        </c:forEach>
                    </select>
                </div>
                <div class="w-100 col mr-2 p-0">
                    <select id="month" class="sign-input-box w-100 text-center-last">
                        <c:forEach var="i" begin="1" end="12" step="1">
                            <option value="${i}"><c:out value="${i}" /></option>
                        </c:forEach>
                    </select>
                </div>
                <div class="w-100 col-6 p-0">
                    <select id="year" class="sign-input-box w-100 text-center-last">
                        <c:set var="now" value="<%=new java.util.Date()%>" />
                        <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
                        <c:forEach var="i" begin="1900" end="${sysYear}" step="1">
                            <option value="${sysYear - i + 1900}">${sysYear - i + 1900}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
                <%-- 휴대전화 번호 input --%>
            <div class="text-left font-weight-bold">
                <label class="px-1"></label><fmt:message key="message.signUp17"/></label>
            </div>
            <div class="d-flex justify-content-center align-items-center mb-4">
                <input type="number" name="MOBILE" class="w-100 sign-input-box pl-2 info-bg-color" placeholder="<fmt:message key="message.signUp18"/>">
            </div>
                <%-- 이메일 input --%>
            <div class="text-left font-weight-bold">
                <label class="px-1"></label><fmt:message key="message.signUp19"/></label>
            </div>
            <div class="d-flex justify-content-center align-items-center mb-4">
                <input type="text" name="EMAIL" class="w-100 sign-input-box pl-2" placeholder="<fmt:message key="message.signUp20"/>">
            </div>
        </div>

        <%-- 선택 항목 --%>
        <div class="section-box-b">
            <%-- 우편번호 및 주소 input --%>
            <div class="text-left font-weight-bold">
                <label class="px-1"></label><fmt:message key="message.signUp21"/></label>
            </div>
            <div class="d-flex justify-content-center align-items-center mb-4">
                <div class="w-100 col-4 mr-2 p-0">
                    <input type="number" name="ZIP_CD" class="sign-input-box w-100 text-center" placeholder="<fmt:message key="message.signUp22"/>">
                </div>
                <div class="w-100 col p-0">
                    <input type="text" name="ADDR1" class="sign-input-box w-100 pl-2" placeholder="<fmt:message key="message.signUp23"/>">
                </div>
            </div>

            <%-- 상세주소 input --%>
            <div class="text-left font-weight-bold">
                <label class="px-1"></label><fmt:message key="message.signUp24"/></label>
            </div>
            <div class="d-flex justify-content-center align-items-center mb-4">
                <input type="text" name="ADDR2" class="w-100 sign-input-box pl-2" placeholder="<fmt:message key="message.signUp25"/>">
            </div>

            <%-- 자녀수 input --%>
            <div class="text-left font-weight-bold">
                <label class="px-1"></label><fmt:message key="message.signUp26"/></label>
            </div>
            <div class="d-flex justify-content-center align-items-center mb-4">
                <input type="number" name="CHILD_CNT" max="99" maxlength="2" class="w-100 sign-input-box pl-2" placeholder="<fmt:message key="message.signUp27"/>" oninput="maxLengthCheck(this);">
            </div>

                <%-- 자녀와의 관계 input --%>
            <div class="text-left font-weight-bold">
                <label class="px-1"></label><fmt:message key="message.signUp28"/></label>
            </div>
            <div class="d-flex justify-content-center align-items-center mb-4">
                <select id="relation" name="CHILD_REL_CD" class="w-100 sign-input-box pl-2 text-secondary"></select>
            </div>
            <div id="relation-input" class="justify-content-center align-items-center mb-4 d-none">
                <input type="text" name="CHILD_REL_NM" class="w-100 sign-input-box pl-2" placeholder="<fmt:message key="message.signUp34"/>" oninput="maxLengthCheck(this);">
            </div>
        </div>

    </form>
        <%-- 하단 버튼 --%>
    <button id="signUpBtn" type="button" class="position-relative w-100 text-center bg-yellow-color border-0 text-white fs-20 bottom-btn">
        <fmt:message key="message.signUp35"/>
    </button>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src='js/page/sign2-a.js'></script>
    </body>
</fmt:bundle>
</html>
