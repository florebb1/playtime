<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/slick.css">
<style>
    .image-background1 {
        width: 100%;
        height:100vh;
        background-position: 50% 50%;
        background-size: cover;
        background-image: url("/vietnam/images/start1.jpg");
    }
    .image-background2 {
        width: 100%;
        height:100vh;
        background-position: 50% 50%;
        background-size: cover;
        background-image: url("/vietnam/images/start2.jpg");
    }
    .image-background3 {
        width: 100%;
        height:100vh;
        background-position: 50% 50%;
        background-size: cover;
        background-image: url("/vietnam/images/start4.jpg");
    }
    .login-move {
        position: absolute;
        width: 28%;
        height: 50px;
        right: 30px;
        bottom: 37px;
        text-align: center;
        color: #fff;
        font-size: 2rem;
        border-radius: 10px;
        border: 1px solid #fff;

    }
    .slick-list {
        height: 100vh !important;
    }
</style>
<body>
<section class="slick">
    <div class="image-background1"></div>
    <div class="image-background2"></div>
    <div class="image-background3">
        <div class="login-move" onclick="document.location.href='login.jsp'"><fmt:message key="message.login8"/></div>
    </div>
</section>


<%@include file="/vietnam/layout/base_script.jsp"%>
<script>
    $(document).on('ready', function() {
        var item_length = $('.slick > div').length - 1;
        var slider = $('.slick').slick({
            arrows: false,
            autoplay: true,
            autoplaySpeed: 700,
            infinite: false,
            slide: 'div',
            cssEase: 'linear',
        });
        slider.on('afterChange', function(event, slick, currentSlide, nextSlide){
            if( item_length === slider.slick('slickCurrentSlide') ){
                slider.slick("slickSetOption","autoplay",false,false);
            }
        });
        return false;
    });
</script>
<script src="js/slick.js"></script>
</body>
</fmt:bundle>
</html>