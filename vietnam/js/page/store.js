$(document).ready(function(){
    // 전역변수
    var datas = $("#storeForm").serialize();

    // 위, 경도
    var latitude = "";
    var longitude = "";

    //slide tab1
    $.ajax({
        url: '/vietnam/api/mbl_ADM_0006.jsp?COMP_CD=011',
        type: 'POST',
        dataType: 'JSON',
        data: datas,
        success: function (response) {
            if (response.RET_CD == '0001') {
                if (response.RESULT[0].STORE_TYPE == "01") {
                    $('#newStoreType').html('Quản lý trực tiếp');
                } else {
                    $('#newStoreType').html('Không trực tiếp');
                }
                $('#newStoreName').html(response.RESULT[0].STORE_NAME);
                $('#newStoreAddr').html(response.RESULT[0].STORE_ADDR);
                if(response.RESULT[0].STORE_TEL != null && response.RESULT[0].STORE_TEL != "") {
                    $('#newStoreCall').attr("onclick", "location.href='tel:" + response.RESULT[0].STORE_TEL+"'");
                }else {
                    $('#newStoreCall').css("background-color", "#ddd");
                }
            }
        }
    });

    //slide tab2
    // 페이지 로딩시 기본 지역 매장 검색
    storeSearch();

    // 지역 선택시 이벤트
    $('.nav-link').click(function(){
        $('.nav-link').removeClass('active');
        $(this).addClass('active');
        $("#storeList").empty();

        var local = $(this).data("local");
        $('#SIDO_NM').val(local);
        storeSearch();
    });

    // selectbox 변경시
    var select = $("select.color");
    select.change(function () {
        var select_name = $(this).children("option:selected").text();
        $(this).siblings("label").text(select_name);
    });

    // slide tab3
    // 지역 리스트 셀렉트박스
    $.ajax({
        url: '/vietnam/api/mbl_0720.jsp',
        type: 'POST',
        dataType: 'JSON',
        data: datas,
        success: function (response) {
            var result = "";
            var BRAND_CD = $("#BRAND_CD").val();
            if (response.RESULT.length != 0) {
                for (var i = 0; i < response.RESULT.length; i++) {
                    if(BRAND_CD != "" && BRAND_CD != null) {
                        result += "<option value=" + response.RESULT[i].BRAND_CD + " selected>" + response.RESULT[i].BRAND_NM + "</option>"
                    }else {
                        if(i == 0) {
                            result += "<option value=" + response.RESULT[i].BRAND_CD + " selected>" + response.RESULT[i].BRAND_NM + "</option>"
                        }else {
                            result += "<option value=" + response.RESULT[i].BRAND_CD + " >" + response.RESULT[i].BRAND_NM + "</option>"
                        }
                    }
                }
                $("#brand").append(result);
                $("#select_brand").children("label").text($("#brand option:selected").text());
                $("#color").append(result);
                $("#select_sto").children("label").text($("#brand option:selected").text());
            }
        }
    });

    // 탭버튼 클릭시
    $("#find-store").click(function() {
        myFunction();
        var varUA = navigator.userAgent.toLowerCase();
        try {
            // 안드로이드
            if (varUA.match('android') != null) {
                window.HybridApp.getLocation();
                // IOS
            }else if (varUA.indexOf("iphone")>-1||varUA.indexOf("ipad")>-1||varUA.indexOf("ipod")>-1) {
                window.webkit.messageHandlers.scriptHandler.postMessage("location");
            }
        }catch(e) {
            console.log(e);
        }
    });

    // 매장찾기 새로고침
    $(".icon-refresh-button").unbind("click");
    $(".icon-refresh-button").bind("click", function(){
        var btn = $(".q_mark").find(".q_mark_spin");
        btn.addClass("spin_icon");
        setTimeout(function(){btn.removeClass('spin_icon');}, 1000);
        var varUA = navigator.userAgent.toLowerCase();
        try {
            // 안드로이드
            if (varUA.match('android') != null) {
                window.HybridApp.getLocation();
                // IOS
            }else if (varUA.indexOf("iphone")>-1||varUA.indexOf("ipad")>-1||varUA.indexOf("ipod")>-1) {
                window.webkit.messageHandlers.scriptHandler.postMessage("location");
            }
        }catch(e) {
            console.log(e);
        }

    });

    // km 변경 이벤트
    $(document).on('change', '#km', function(){
        var a =	$("#LOC_LAT").val();
        var b = $("#LOC_LNG").val();
        var km = $(this).val();
        $("#RADIUS").val(km);
        latitudeAndLongitude(a,b);
    });
});
function storeSearch() {
    var datas = $("#storeForm").serialize();
    $.ajax({
        url: '/vietnam/api/mbl_0700.jsp',
        type: 'POST',
        dataType: 'JSON',
        data: datas,
        success: function (response) {
            var result = "";
            var address = "";
            if (response.RESULT.length != 0) {
                for (var i = 0; i < response.RESULT.length; i++) {
                    if(response.RESULT[i].ADDR1 != "" && response.RESULT[i].ADDR1 != null) {
                        if(response.RESULT[i].ADDR2 != "" && response.RESULT[i].ADDR2 != null) {
                            address = response.RESULT[i].ADDR1 + response.RESULT[i].ADDR2;
                        }else {
                            address = response.RESULT[i].ADDR1;
                        }
                    }
                    if(response.RESULT[i].BRAND_CD != "999") {
                        result += "<li class='store'>"
                            + "<a class='d-block text-dark p-3' href='store-detail.jsp?SIDO_NM=" + response.RESULT[i].SIDO_NM + "&BRAND_CD=" + response.RESULT[i].BRAND_CD + "&STOR_CD=" + response.RESULT[i].STOR_CD + "'>"
                            // + "<span class='fs-10'>"+response.RESULT[i].STOR_TP_NM+"</span><br>"
                            + "<span class='fs-15 font-weight-bold'>"+response.RESULT[i].BRAND_NM+"-"+response.RESULT[i].STOR_NM+"</span><br>"
                            + "<span class='fs-10' style='line-height'>"+address+"</span>"
                            + "</a>"
                            + "</li>";
                    }
                }
            }
            $("#storeList").empty();
            $("#storeList").append(result);
        }
    });
}
// native에서 위,경도 리턴받을 함수
function latitudeAndLongitude(a,b) {
    $("#LOC_LAT").val(a);
    $("#LOC_LNG").val(b);
    $("#RADIUS").val($("#km").val());
    var lat = $("#LOC_LAT").val();
    var lng = $("#LOC_LNG").val();
    var radius = $("#RADIUS").val();
    var datas = $("#storeForm").serialize();
    var result = "";
    if(lat != "" && lng != "") {
        $.ajax({
            url: '/vietnam/api/mbl_0730.jsp',
            type: 'POST',
            dataType: 'JSON',
            data: datas,
            success: function(response) {
                if(response.RET_CD == "0001") {
                    if(response.RESULT.length != 0) {
                        $("#find-lengh").text(response.RESULT.length);
                        for (var i = 0; i < response.RESULT.length; i++) {
                            result += '<a href="store-detail.jsp?SIDO_NM='+response.RESULT[i].SIDO_NM+'&BRAND_CD='+response.RESULT[i].BRAND_CD+'&STOR_CD='+response.RESULT[i].STOR_CD+'">'
                                + '<div class="d-flex box-sh-gnt" style="min-height: 60px">'
                                + '<div class="col-9 text-left align-self-center">'
                                + '<span>'+response.RESULT[i].BRAND_NM+'</span><br><span class="fs-20">'+response.RESULT[i].STOR_NM+'</span>'
                                + '</div>'
                                + '<div class="col-3 font-weight-bold text-danger text-right align-self-center">'+response.RESULT[i].DISTANCE+' km</div>'
                                + '</div>'
                                + '</a>';
                        }
                        $("#find_list").empty();
                        $("#find_list").append(result);
                        $('#map-btn').attr('href', '/store-find-map.jsp?LOC_LAT='+lat+'&LOC_LNG='+lng+'&RADIUS='+radius);
                    }else {
                        $("#find-lengh").text("0");
                        $("#find_list").empty();
                        $("#find_list").append("<P class='nsB' style='padding:20px; font-size:18px; text-align:center;'>Hiện tại không có bất kỳ cửa hàng nào gần vị trí của bạn</p>");
                    }
                }
            }
        });
    }else {
        deny();
    }
}
// native 사용자 위치서비스 동의하지 않을경우 함수 실행
function deny() {
    $("#find_list").empty();
    $("#find_list").html("<P class='nsB animate-bottom' style='padding:20px; font-size:18px; text-align:center;'>Vui lòng kiểm tra trạng thái cập nhập của ứng dụng và  thông tin vị trí thiết bị có được phép hay không</p>");
}
var myVar;

function myFunction() {
    myVar = setTimeout(showPage, 5000);
}

function showPage() {
    document.getElementById("loader").style.display = "none";
    document.getElementById("myDiv").style.display = "block";
}