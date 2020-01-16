$(document).ready(function(){
    var cookie = getCookie('user');
    $('input[name=CUST_ID]').val(cookie);

    // 최초 페이지 로딩 쿠폰 리스트
    couponList(30);

    $("#1m_btn").click(function () {
        $(".m_coupon").removeClass("filter-btn-active");
        $(this).addClass("filter-btn-active");
        couponList(30);
    });

    $("#3m_btn").click(function () {
        $(".m_coupon").removeClass("filter-btn-active");
        $(this).addClass("filter-btn-active");
        couponList(90);
    });

    $("#6m_btn").click(function () {
        $(".m_coupon").removeClass("filter-btn-active");
        $(this).addClass("filter-btn-active");
        couponList(180);
    });

    $("#12m_btn").click(function () {
        $(".m_coupon").removeClass("filter-btn-active");
        $(this).addClass("filter-btn-active");
        couponList(360);
    });

    $(".coupon-button").click(function () {
        var id;
        if($(this).hasClass('able')) {
            $(".coupon-button").removeClass('d-none');
            $(this).addClass('d-none');
            $("input[name=INQ_DIV]").val("2");
            if($("#1m_btn").hasClass("filter-btn-active")) {
                id = 30;
            }else if($("#3m_btn").hasClass("filter-btn-active")) {
                id = 90;
            }else if($("#6m_btn").hasClass("filter-btn-active")) {
                id = 180;
            }else if($("#12m_btn").hasClass("filter-btn-active")) {
                id = 360;
            }
            couponList(id);
        }else {
            $(".coupon-button").removeClass('d-none');
            $(this).addClass('d-none');
            $("input[name=INQ_DIV]").val("1");
            if($("#1m_btn").hasClass("filter-btn-active")) {
                id = 30;
            }else if($("#3m_btn").hasClass("filter-btn-active")) {
                id = 90;
            }else if($("#6m_btn").hasClass("filter-btn-active")) {
                id = 180;
            }else if($("#12m_btn").hasClass("filter-btn-active")) {
                id = 360;
            }
            couponList(id);
        }

    });

});
function formatDate(date) {
    var mymonth = date.getMonth() + 1;
    var myweekday = date.getDate();
    return(date.getFullYear() + "-" + (
        (mymonth < 10)
            ? "0"
            : "") + mymonth + "-" + (
        (myweekday < 10)
            ? "0"
            : "") + myweekday);
}
function couponList(day) {
    var able = $("input[name=INQ_DIV]").val();
    var today = new Date();
    var end = formatDate(today);
    var end2 = end.split('-');
    var endDate = end2[0] + end2[1] + end2[2];
    today.setDate(today.getDate() - day);
    var start = formatDate(today);
    var start2 = start.split('-');
    var strDate = start2[0] + start2[1] + start2[2];
    $('input[name=FR_YMD]').val(strDate);
    $('input[name=TO_YMD]').val(endDate);

    // 최초 로딩 데이터 검색
    var datas = $("#couponListForm").serialize();
    $.ajax({
        url : '/vietnam/api/mbl_0550.jsp',
        type : 'POST',
        dataType : 'JSON',
        data : datas,
        success:function(response) {
            console.log(response);
            var result = "";
            if(response.RET_CD == '0001') {
                if(able == 1) {
                    for (var i = 0; i < response.RESULT.length; i++) {
                        var strDt = response.RESULT[i].START_DT;
                        var endDt = response.RESULT[i].CLOSE_DT;
                        var strY = strDt.slice(0, 4);
                        var strM = strDt.slice(4, 6);
                        var strD = strDt.slice(6, 8);
                        var endY = endDt.slice(0, 4);
                        var endM = endDt.slice(4, 6);
                        var endD = endDt.slice(6, 8);
                        result += '<div class="border-radius-10 bg-white">'
                            + '<a class="text-dark" href="coupon-detail.jsp?COUPON_NO='+response.RESULT[i].COUPON_NO+'">'
                            + '<img src="/vietnam/images/coupon/6-1.png" class="w-100">';
                        // if (response.RESULT[i].COUPON_IMG_TYPE == "P0402") {
                        //     result += '<img src="images/coupon/8-1.jpg" class="w-100">';
                        // } else if (response.RESULT[i].COUPON_IMG_TYPE == "P0403") {
                        //     result += '<img src="images/coupon/4-1.jpg" class="w-100">';
                        // } else if (response.RESULT[i].COUPON_IMG_TYPE == "P0404") {
                        //     result += '<img src="images/coupon/2-1.jpg" class="w-100">';
                        // } else if (response.RESULT[i].COUPON_IMG_TYPE == "P0405") {
                        //     result += '<img src="images/coupon/5-1.jpg" class="w-100">';
                        // } else if (response.RESULT[i].COUPON_IMG_TYPE == "P0406") {
                        //     result += '<img src="images/coupon/3-1.jpg" class="w-100">';
                        // } else {
                        //     result += '<img src="images/coupon/6-1.jpg" class="w-100">';
                        // }

                        result += '<div class="text-center p-3">'
                            + '<p class="fs-18 font-weight-bold">' + response.RESULT[i].COUPON_NM + '</p>'
                            + '<div class="barcode' + i + ' mx-auto barcode my-2"></div>'
                            + '<p class="fs-14 font-weight-bold">Ngày hết hạn : ' + strD + '.' + strM + '.' + strY + ' ~ ' + endD + '.' + endM + '.' + endY + '</p>'
                            + '</div>'
                            + '</a>'
                            + '</div>';
                    }
                    $("#coupon-list").empty();
                    $("#coupon-list").append(result);
                    for (var j = 0; j < response.RESULT.length; j++) {
                        $(".barcode" + j).barcode(response.RESULT[j].COUPON_NO, "code128", {
                            barWidth: 2,
                            barHeight: 100,
                            output: "css"
                        });
                    }
                }else {
                    for (var i = 0; i < response.RESULT.length; i++) {
                        var strDt = response.RESULT[i].START_DT;
                        var endDt = response.RESULT[i].CLOSE_DT;
                        var strY = strDt.slice(0, 4);
                        var strM = strDt.slice(4, 6);
                        var strD = strDt.slice(6, 8);
                        var endY = endDt.slice(0, 4);
                        var endM = endDt.slice(4, 6);
                        var endD = endDt.slice(6, 8);
                        result += '<div class="border-radius-10 bg-white">'
                            + '<a class="text-dark" href="coupon-detail.jsp?COUPON_NO='+response.RESULT[i].COUPON_NO+'">'
                            + '<div style="-webkit-filter: grayscale(100%); filter: grayscale(100%);"><img src="/vietnam/images/coupon/6-1.png" class="w-100"></div>';
                        // if (response.RESULT[i].COUPON_IMG_TYPE == "P0402") {
                        //     result += '<img src="images/coupon/8-1.jpg" class="w-100" style="-webkit-filter: grayscale(100%);">';
                        // } else if (response.RESULT[i].COUPON_IMG_TYPE == "P0403") {
                        //     result += '<img src="images/coupon/4-1.jpg" class="w-100" style="-webkit-filter: grayscale(100%);">';
                        // } else if (response.RESULT[i].COUPON_IMG_TYPE == "P0404") {
                        //     result += '<img src="images/coupon/2-1.jpg" class="w-100" style="-webkit-filter: grayscale(100%);">';
                        // } else if (response.RESULT[i].COUPON_IMG_TYPE == "P0405") {
                        //     result += '<img src="images/coupon/5-1.jpg" class="w-100" style="-webkit-filter: grayscale(100%);">';
                        // } else if (response.RESULT[i].COUPON_IMG_TYPE == "P0406") {
                        //     result += '<img src="images/coupon/3-1.jpg" class="w-100" style="-webkit-filter: grayscale(100%);">';
                        // } else {
                        //     result += '<img src="images/coupon/6-1.jpg" class="w-100" style="-webkit-filter: grayscale(100%);">';
                        // }
                        result += '<div class="text-center p-3">'
                            + '<p class="fs-18 font-weight-bold">' + response.RESULT[i].COUPON_NM + '</p>'
                            + '<div class="barcode' + i + ' mx-auto barcode my-2"></div>'
                            + '<p class="fs-14 font-weight-bold">Ngày hết hạn : ' + strY + '.' + strM + '.' + strD + ' ~ ' + endY + '.' + endM + '.' + endD + '</p>'
                            + '</div>'
                            + '</a>'
                            + '</div>';
                    }
                    $("#coupon-list").empty();
                    $("#coupon-list").html(result);
                    for (var j = 0; j < response.RESULT.length; j++) {
                        $(".barcode" + j).barcode(response.RESULT[j].COUPON_NO, "code128", {
                            barWidth: 2,
                            barHeight: 100,
                            output: "css"
                        });
                    }
                }
            }else {
                console.log('오류');
            }
        }
    });
}