<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<body>
    <div class="postion-fixed">
        <header>
            <div class="d-flex pt-4">
                <div class="col text-center align-self-center p-0"><a href="mypage.jsp"><i class="icon-playtime_icn_mypage fs-25 text-secondary"></i></a></div>
                <div class="col-8 text-center align-self-center p-0"><img src="images/logo.png" class="w-75"></div>
                <div class="col p-0"></div>
            </div>
        </header>
        <input type="hidden" name="COMP_CD" value="011">
        <!-- swiper1 -->
        <div class="swiper-container swiper1">
            <div class="swiper-wrapper">
                <div class="swiper-slide selected">Thay đổi</div>
                <div class="swiper-slide">Lưu ý</div>
                <div class="swiper-slide"><fmt:message key="message.main2Tab3"/></div>
                <div class="tabs__presentation-slider" role="presentation"></div>
            </div>
        </div>
    </div>
    <div class="postion-fixed">
        <!-- swiper2 -->
        <div class="swiper-container swiper2 box-sh-gnt">
            <div class="swiper-wrapper">

                <div id="evant" class="swiper-slide location"><div class="location"></div></div>

                <div id="notice" class="swiper-slide"><div class="location"></div></div>

                <div id="news" class="swiper-slide"><div class="location"></div></div>

            </div>
        </div>
    </div>
    <div class="postion-fixed">
        <footer>
            <div class="d-flex h-100">
                <div class="col-3 align-self-center text-center"><a href="main.jsp"><i class="icon-playtime_icn_code fs-60 text-black-50"></i></a> </div>
                <div class="col-3 align-self-center text-center"><a href="notice.jsp"><i class="icon-playtime_icn_home fs-40 text-warning"></i></a></div>
                <div class="col-3 align-self-center text-center"><a href="store.html"><i class="icon-playtime_icn_store fs-40 text-black-50"></i></a></div>
                <div class="col-3 align-self-center text-center"><a href="info.jsp"><i class="icon-playtime_icn_play fs-40 text-black-50"></i></a></div>
            </div>
        </footer>
    </div>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src='js/page/notice.js'></script>

</body>
</fmt:bundle>
</html>
