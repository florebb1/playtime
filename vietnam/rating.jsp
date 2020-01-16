<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<body class="bg-yellow-color overflow-auto">
    <header class="h-auto">
        <div class="d-flex info-box py-5">
            <div class="col align-self-center px-0 text-white" onclick="document.location.href='mypage.jsp'"><i class="icon-left-arrow fs-20 font-weight-bold"></i></div>
        </div>
    </header>
    <form id="ratingForm" method="post">
        <input name="COMP_CD" type="hidden" value="011">
        <input name="CUST_ID" type="hidden">
    </form>
    <%-- 회원 등급 문구 --%>
    <div class="info-box">
        <span class="font-weight-bold text-white fs-20"><fmt:message key="message.edit5"/></span><br>
        <span class="fs-14 text-white"><fmt:message key="message.edit6"/></span>
    </div>

    <%-- Welcome --%>
    <section id="welcome" class="d-none">
        <div class="d-flex flex-column info-box event-list bg-white my-5 text-white">
            <div class="d-flex align-items-center justify-content-center m-3 h-50">
                <img src="images/welcome.png" class="w-75">
            </div>
            <div class="m-3 p-3 h-50 border-radius-10 fs-13 bg-yellow-color">
                <span class="fs-20 font-weight-bold">Welcome</span><br>
                Hoan nghênh đến với Playmember<br><br>
                <span class="fs-15 font-weight-bold">Giới thiệu ưu đãi</span><br>
                Giới thiệu ưu đãi<br>
                Tặng phiếu giảm giá 20,000 kỉ niệm việc gia nhập<br>
                Nâng cấp sau 15 lần sử dụng
            </div>
        </div>
    </section>

    <%-- Friend --%>
    <section id="friend" class="d-none">
        <div class="d-flex flex-column info-box event-list bg-white my-5 text-white">
            <div class="d-flex align-items-center justify-content-center m-3 h-50">
                <img src="images/friend.png" class="w-75">
            </div>
            <div class="m-3 p-3 h-50 border-radius-10 fs-13 bg-rating-blue">
                <span class="fs-20 font-weight-bold">Silver</span><br>
                Thẻ hội viên Playmembers đã đạt cấp Silver<br><br>
                <span class="fs-15 font-weight-bold">Giới thiệu ưu đãi</span><br>
                Tặng phiếu ưu đãi 50% dịp sinh nhật (sinh nhật người vào)<br>
                Tuỳ mỗi gian hang mà Hạng bạc được áp dụng ưu đãi giảm giá<br>
                Nâng cấp sau 25 lần sử dụng
            </div>
        </div>
    </section>

    <%-- Family --%>
    <section id="family" class="d-none">
        <div class="d-flex flex-column info-box event-list bg-white my-5 text-white">
            <div class="d-flex align-items-center justify-content-center m-3 h-50">
                <img src="images/famiy.png" class="w-75">
            </div>
            <div class="m-3 p-3 h-50 border-radius-10 fs-13 bg-rating-red">
                <span class="fs-20 font-weight-bold">Gold</span><br>
                Thẻ hội viên Playmembers đã đạt cấp Gold<br><br>
                <span class="fs-15 font-weight-bold">Giới thiệu ưu đãi</span><br>
                Tặng vé miễn phí 1 lần nhân dịp sinh nhật ( sinh nhật người vào)<br>
                Tuỳ mỗi gian hang mà Hạng vàng được áp dụng ưu đãi giảm giá<br>
                Nâng cấp sau 50 lần sử dụng
            </div>
        </div>
    </section>

    <%-- V.I.P --%>
    <section id="vip" class="d-none">
        <div class="d-flex flex-column info-box event-list bg-white my-5 text-white">
            <div class="d-flex align-items-center justify-content-center m-3 h-50">
                <img src="images/vip.png" class="w-75">
            </div>
            <div class="m-3 p-3 h-50 border-radius-10 fs-13 bg-dark">
                <span class="fs-20 font-weight-bold">VIP</span><br>
                Thẻ hội viên Playmembers đã đạt cấp VIP<br><br>
                <span class="fs-15 font-weight-bold">Giới thiệu ưu đãi</span><br>
                Tặng vé miễn phí 1 lần nhân dịp sinh nhật ( sinh nhật người vào)<br>
                Tuỳ mỗi gian hang mà Hạng VIP được áp dụng ưu đãi giảm giá
            </div>
        </div>
    </section>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src='js/page/rating.js'></script>
</body>
</fmt:bundle>
</html>
