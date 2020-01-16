$(document).ready(function(){
    var sido = 	get('SIDO_NM');
    $('#SIDO_NM').val(sido);
    var brand = get('BRAND_CD');
    $('#BRAND_CD').val(brand);
    var sto = get('STOR_CD');
    $('#STOR_CD').val(sto);

    if(sido == "" || sido == null) {
        var url = '/vietnam/api/mbl_0701.jsp';
    }else {
        var url = '/vietnam/api/mbl_0700.jsp';
    }
    var datas = $('#store_frm').serialize();

    $.ajax({
        url: url,
        type: 'POST',
        dataType: 'JSON',
        data: datas,
        success: function (response) {
            console.log(response);
            var addr = "";
            if (response.RET_CD == '0001' && response.RESULT.length > 0) {
                for(var i = 0; i < response.RESULT.length; i++) {
                    if(response.RESULT[i].STOR_CD == sto) {
                        // $('#STOR_TP_NM').text(response.RESULT[i].STOR_TP_NM);
                        $('#BRAND').text(response.RESULT[i].BRAND_NM);
                        $('#STOR').text(response.RESULT[i].STOR_NM);

                        if(response.RESULT[i].ADDR1 != null && response.RESULT[i].ADDR1 != '') {
                            if(response.RESULT[i].ADDR2 != null && response.RESULT[i].ADDR2 != '') {
                                addr = response.RESULT[i].ADDR1 + response.RESULT[i].ADDR2;
                            }else {
                                addr = response.RESULT[i].ADDR1
                            }
                        }
                        $('#ADDR').text(addr);
                        if(response.RESULT[i].TEL_NO != null && response.RESULT[i].TEL_NO != "") {
                            $('#call').attr("onclick", "location.href='tel:" + response.RESULT[i].TEL_NO+"'");
                        }else {
                            $('#call').css("background-color", "#ddd");
                        }
                        $('#map').attr("onclick", "location.href='store-map.jsp?LOC_LAT="+response.RESULT[i].LOC_LAT+"&LOC_LNG="+response.RESULT[i].LOC_LNG+"&STOR_NM="+response.RESULT[i].STOR_NM+"&BRAND_NM="+response.RESULT[i].BRAND_NM+"'");
                        $("#share").attr('onclick','share('+response.RESULT[i].LOC_LAT+','+response.RESULT[i].LOC_LNG+',"'+response.RESULT[i].STOR_NM+'","'+addr+'","'+response.RESULT[i].TEL_NO+'")');
                        if(response.RESULT[i].NOR_STR_HM != null || response.RESULT[i].NOR_STR_HM != '' && response.RESULT[i].NOR_END_HM != null || response.RESULT[i].NOR_END_HM != '') {
                            var workStart = response.RESULT[i].NOR_STR_HM;
                            var workEnd = response.RESULT[i].NOR_END_HM;
                            $('#workDay').html('Ngày thường : ' + workStart.substr(0, 2) + ':' + workStart.substr(2, 4) + ' ~ ' + workEnd.substr(0, 2) + ':' + workEnd.substr(2, 4));
                        }
                        if(response.RESULT[i].HOL_STR_HM != null || response.RESULT[i].HOL_STR_HM != '' && response.RESULT[i].HOL_END_HM != null || response.RESULT[i].HOL_END_HM != '') {
                            var restStart = response.RESULT[i].HOL_STR_HM;
                            var restEnd = response.RESULT[i].HOL_END_HM;
                            $('#restDay').html('Ngày lễ và cuối tuần : ' + restStart.substr(0, 2) + ':' + restStart.substr(2, 4) + ' ~ ' + restEnd.substr(0, 2) + ':' + restEnd.substr(2, 4));
                        }
                    }
                }
            }else {
                swal({
                    button: "Xác nhận",
                    title: "Hướng dẫn",
                    closeOnClickOutside: false,
                    text: 'Không tìm thấy kết quả'
                }).then(function() {
                    // window.location = "store.jsp";
                });
            }
        }
    });
});
// a 위도, b 경도, c 매장명, d 매장주소, e 매장연락처
function share(a,b,c,d,e) {
    var varUA = navigator.userAgent.toLowerCase();
    try {
        // 안드로이드
        if (varUA.match('android') != null) {
            window.HybridApp.share(a,b,c,d,e);
            // IOS
        }else if (varUA.indexOf("iphone")>-1||varUA.indexOf("ipad")>-1||varUA.indexOf("ipod")>-1) {
            var mess = "share|"+a+"|"+b+"|"+c+"|"+d+"|"+e;
            window.webkit.messageHandlers.scriptHandler.postMessage(mess);
        }
    }catch(e) {
        console.log(e);
    }
}
