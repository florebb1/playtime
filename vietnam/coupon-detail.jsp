<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<style>
    .detail>div:last-child {
        font-size:18px !important;
    }

</style>
<body class="overflow-auto">
    <form id="couponForm" method="post">
        <input type="hidden" name="COMP_CD" value="011">
        <input type="hidden" id="CUST_ID" name="CUST_ID">
        <input type="hidden" id="COUPON_NO" name="COUPON_NO">
    </form>
    <%-- 쿠폰 이미지 --%>
    <div id="img"></div>

    <%-- coupon list --%>
    <div class="info-box text-center my-5">
        <p id="title" class="fs-18 font-weight-bolder"></p>
        <div class="mx-auto barcode_info detail py-4" style="zoom: 0.85"></div>
        <p class="fs-14 font-weight-bold"><fmt:message key="message.validity"/> : <span id="days"></span></p>
    </div>
    <div id="notice" class="mx-2 my-5 fs-12 text-danger mx-4"></div>
    <%-- 하단 버튼 --%>
    <button type="button" class="w-100 text-center bg-yellow-color border-0 text-white fs-22 bottom-btn position-relative" onclick="history.back()"><fmt:message key="message.confirm"/></button>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script>
        $(document).ready(function(){
            var user = getCookie('user');
            $('#CUST_ID').val(user);
            var coupon = get("COUPON_NO");
            $('#COUPON_NO').val(coupon);
            $(".barcode_info").barcode(coupon, "code128", {
                barWidth: 2,
                barHeight: 100,
                output: "css"
            });
            var datas = $('#couponForm').serialize();
            $.ajax({
                url: '/vietnam/api/mbl_0540.jsp',
                type: 'POST',
                dataType: 'JSON',
                data: datas,
                    success: function (response) {
                        console.log(response);
                        if(response.RET_CD == "0001") {
                            var strDt = response.RESULT[0].START_DT;
                            var endDt = response.RESULT[0].CLOSE_DT;
                            var strY = strDt.slice(0, 4);
                            var strM = strDt.slice(4, 6);
                            var strD = strDt.slice(6, 8);
                            var endY = endDt.slice(0, 4);
                            var endM = endDt.slice(4, 6);
                            var endD = endDt.slice(6, 8);
                            $('#title').html(response.RESULT[0].COUPON_NM);
                            $('#days').html(strD + "." + strM + "." + strY+" ~ "+endD + "." + endM + "." + endY);
                            // 쿠폰 이미지 선택 - 스탬프쿠폰(정기)
                            $('#img').append("<img src=/vietnam/images/coupon/6-2.png class='w-100'>");
                            // if(response.RESULT[0].COUPON_IMG_TYPE == "P0402") {
                            //     $('#coupon_img').attr("src",'/images/coupon/8-2.png');
                            //     // 쿠폰 이미지 선택 - 생일무료쿠폰(정기)
                            // }else if(response.RESULT[0].COUPON_IMG_TYPE == "P0403") {
                            //     $('#coupon_img').attr("src",'/images/coupon/4-2.jpg');
                            //     // 쿠폰 이미지 선택 - 가입축하쿠폰(정기)
                            // }else if(response.RESULT[0].COUPON_IMG_TYPE == "P0404") {
                            //     $('#coupon_img').attr("src",'/images/coupon/2-2.jpg');
                            //     // 쿠폰 이미지 선택 - 멤버십혜택쿠폰(정기)
                            // }else if(response.RESULT[0].COUPON_IMG_TYPE == "P0405") {
                            //     $('#coupon_img').attr("src",'/images/coupon/5-2.png');
                            //     // 쿠폰 이미지 선택 - 생일할인쿠폰(정기)
                            // }else if(response.RESULT[0].COUPON_IMG_TYPE == "P0406") {
                            //     $('#coupon_img').attr("src",'/images/coupon/3-2.jpg');
                            //     // 쿠폰 이미지 선택 - 비정기 쿠폰
                            // }else {
                            //     $('#coupon_img').attr("src",'/images/coupon/6-2.png');
                            // }
                            // 사용가능 불가능 체크
                            if(response.RESULT[0].COUPON_STAT != "P0303") {
                                $('#coupon_img').css('-webkit-filter', 'grayscale(100%)');
                            }
                            $(".barcode_info").html(response.RESULT[0].COUPON_NOTICE.replace(/(?:\r\n|\r|\n)/g,'<br />'));
                            $(".barcode_info").barcode(coupon, "code128", {
                                barWidth: 2,
                                barHeight: 100,
                                output: "css"
                            });
                            $("#notice").html(response.RESULT[0].COUPON_NOTICE.replace(/(?:\r\n|\r|\n)/g,'<br />'));
                        }else {
                            swal({
                                button: "Xác nhận",
                                title: "Hướng dẫn",
                                closeOnClickOutside: false,
                                text: response.RET_MSG
                            }).then(function() {
                                window.location = "coupon-list.jsp";
                            });
                        }
                }
            });

        });
    </script>
</body>
</fmt:bundle>
</html>
