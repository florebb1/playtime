<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<body class="overflow-auto">
    <form id="ticketForm" method="post">
        <input type="hidden" name="COMP_CD" value="011">
        <input type="hidden" name="CUST_ID">
        <input type="hidden" name="PROGRAM_ID">
        <input type="hidden" name="MUSE_NO">
        <input type="hidden" name="MUSE_CERT_NO">
    </form>
    <header class="h-auto">
        <div class="d-flex py-5">
            <div class="col align-self-center"><a href="javascript:history.back()"><i class="icon-left-arrow fs-20 font-weight-bold text-dark"></i></a></div>
            <div class="col-8 text-center font-weight-bold fs-20"></div>
            <div class="col"></div>
        </div>
    </header>
    <%-- 다회권 이미지 --%>
    <img src="images/store/pt_logo.png" class="w-75 d-block mx-auto">

    <div class="my-5 text-center font-weight-bold">
        <%-- 다회권 상세 정보 --%>
        <div class="playtime_etc_coupon">
            <div class="my-3">
                <div id="memCard2" class="fs-15"></div>
                <div id="memCard3" class="fs-20"></div>
            </div>

            <p id="memCard" class="fs-24"></p>

            <div class="my-3">
                <div id="memCard5"></div>
                <div id="memCard6"></div>
                <div id="memCard7"></div>
                <div id="memCard4"></div>
            </div>
        </div>
        <%-- 사용 내역 조회 --%>
        <p id="flip" class="fs-18 my-4">Xem lịch sử của bạn <i class="icon-down-arrow"></i></p>
        <div id="panel" class="bg-gray-color py-3">
        <%-- 해당 다회권의 사용내역이 존재하지 않습니다.--%>
        </div>
    </div>
    <div class="my-5 text-center font-weight-bold">
        <p class="fs-16 info-box my-3">Trình bày mã QR khi sử dụng</p>
        <div class="text-black-50 fs-12 info-box">
            Không thể được sử dụng với các sự kiện khác.<br>
            Không tích điểm khi mua và sử dụng Phiếu vào cửa nhiều lần.<br>
            Nó không thể được sử dụng sau ngày hết hạn.
        </div>
    </div>
    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script>
        $(document).ready(function(){
            var user = get('CUST_ID');
            $("input[name=CUST_ID]").val(user);
            var PROGRAM_ID = get('PROGRAM_ID');
            $("input[name=PROGRAM_ID]").val(PROGRAM_ID);
            var MUSE_NO = get('MUSE_NO');
            $("input[name=MUSE_NO]").val(MUSE_NO);
            var MUSE_CERT_NO = get('MUSE_CERT_NO');
            $("input[name=MUSE_CERT_NO]").val(MUSE_CERT_NO);

            $("#panel").hide();
            $("#flip").click(function () {
                $(this).next().toggle();
            });

            var datas = $("#ticketForm").serialize();
            $.ajax({
                url: "/vietnam/api/mbl_0570.jsp",
                type: 'POST',
                dataType: 'JSON',
                data: datas,
                    success: function (response) {
                        if (response.RET_CD == "0001" && response.RESULT.length > 0) {
                            var result = "";
                            for (var i = 0; i < response.RESULT.length; i++) {
                                $('#memCard').text(response.RESULT[0].MUSE_NM);
                                $('#memCard2').text(response.RESULT[0].BRAND_NM);
                                $('#memCard3').text(response.RESULT[0].STOR_NM);
                                $('#memCard4').text("Có sẵn : "+response.RESULT[i].MUSE_REM_CNT+" lần");
                                $('#memCard5').text("Số chứng nhận : "+response.RESULT[0].MUSE_CERT_NO);
                                $('#memCard6').text("Ngày mua : "+response.RESULT[0].CERT_FDT.substr(6,2)+"-"+response.RESULT[0].CERT_FDT.substr(4,2)+"-"+response.RESULT[0].CERT_FDT.substr(0,4));
                                $('#memCard7').text("Ngày hết hạn : "+response.RESULT[0].CERT_TDT.substr(6,2)+"-"+response.RESULT[0].CERT_TDT.substr(4,2)+"-"+response.RESULT[0].CERT_TDT.substr(0,4));
                                result += "<div class='usage_history'>"
                                    +"<span class='px-2'>"+response.RESULT[i].USE_DT.substr(4,2)+"-"+response.RESULT[i].USE_DT.substr(2,2)+"-20"+response.RESULT[i].USE_DT.substr(0,2)+" "+response.RESULT[i].USE_DT.substr(6,2)+":"+response.RESULT[i].USE_DT.substr(8,2)+"</span>"
                                    +"<span class='px-2'>Sử dụng "+response.RESULT[i].USE_CNT+" lần</span>"
                                    +"<span class='px-2'>Có sẵn "+response.RESULT[i].REM_CNT+" lần</span>"
                                    +"</div>"
                            }
                            $("#panel").append(result);
                        }else {
                            swal({
                                button: "Xác nhận",
                                title: "Hướng dẫn",
                                closeOnClickOutside: false,
                                text: response.RET_MSG
                            }).then(function() {
                                window.location = "main.jsp";
                            });
                        }
                    }
            });

        });
    </script>
</body>
</fmt:bundle>
</html>
