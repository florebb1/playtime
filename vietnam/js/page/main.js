$(document).ready(function(){
    var CUST_ID = getCookie('user');
    $('#img_form_num').text(CUST_ID);
    $('input[name=CUST_ID]').val(CUST_ID);
    // slide1 tab
    // 다회권 정보
    var datas = $("#mainForm").serialize();
    $.ajax({
        url: "/vietnam/api/mbl_0560.jsp",
        type: 'POST',
        dataType: 'JSON',
        data: datas,
        success: function (response) {
            console.log(response);
            var res = "";
            if(response.RET_CD == "0001" && response.RESULT.length > 0) {
                for (var i = 0; i < response.RESULT.length; i++) {
                    if(i == 0) {
                        // console.log("1")
                        res += '<div class="carousel-item active">'
                            + '<a href="ticket.jsp?CUST_ID='+response.RESULT[i].CUST_ID+'&PROGRAM_ID='+response.RESULT[i].PROGRAM_ID+'&MUSE_NO='+response.RESULT[i].MUSE_NO+'&MUSE_CERT_NO='+response.RESULT[i].MUSE_CERT_NO+'">'
                            + '<div class="voucher-box">'
                            + '<div class="flex-grow-1 text-center">'
                            + '<img src="images/store/pt_logo.png" class="object-fit-cover w-50" style="background-color: transparent !important;">'
                            + '</div>'
                            + '<div class="flex-grow-1">'
                            + ' <div class="d-flex px-3">'
                            + '<div class="flex-grow-1 font-weight-bold">'
                            + '<div class="fs-14">'+response.RESULT[i].STOR_NM+'</div>'
                            + '<div class="fs-18">'+response.RESULT[i].BRAND_NM+'</div>'
                            + '</div>'
                            + '<div class="align-self-center fs-25">'+response.RESULT[i].MUSE_REM_CNT+' / '+response.RESULT[i].MUSE_OFR_CNT+'</div>'
                            + '</div>'
                            + '</div>'
                            + '</div>'
                            + '</a>'
                            + '</div>';
                    }else {
                        res += '<div class="carousel-item">'
                            + '<a href="ticket.jsp?CUST_ID='+response.RESULT[i].CUST_ID+'&PROGRAM_ID='+response.RESULT[i].PROGRAM_ID+'&MUSE_NO='+response.RESULT[i].MUSE_NO+'&MUSE_CERT_NO='+response.RESULT[i].MUSE_CERT_NO+'">'
                            + '<div class="voucher-box">'
                            + '<div class="flex-grow-1 text-center">'
                            + '<img src="images/store/pt_logo.png" class="object-fit-cover w-50" style="background-color: transparent !important;">'
                            + '</div>'
                            + '<div class="flex-grow-1">'
                            + ' <div class="d-flex px-3">'
                            + '<div class="flex-grow-1 font-weight-bold">]'
                            + '<div class="fs-14">'+response.RESULT[i].STOR_NM+'</div>'
                            + '<div class="fs-18">'+response.RESULT[i].BRAND_NM+'</div>'
                            + '</div>'
                            + '<div class="align-self-center fs-25">'+response.RESULT[i].MUSE_REM_CNT+' / '+response.RESULT[i].MUSE_OFR_CNT+'</div>'
                            + '</div>'
                            + '</div>'
                            + '</div>'
                            + '</a>'
                            + '</div>';
                    }
                    // console.log(res);
                    $("#carouselExampleControls").show();
                    $("#carousel").empty();
                    $("#carousel").append(res);
                }

            }else {
                $("#carouselExampleControls").hide();
            }
        }
    });

    // 바코드 설정
    var width = $("#img_form_url").width() - 20;
    var height = $("#img_form_url").height()-20;
    new QRCode(document.getElementById("img_form_url"), {
        text : CUST_ID,
        width: width,
        height: height
    });

    // slide2 tab
    // 전체 FAQ 불러오기
    $.ajax({
        url: "/vietnam/api/mbl_ADM_0003.jsp",
        type: 'POST',
        dataType: 'JSON',
        data: datas,
        success: function (response) {
            if (response.RESULT.length != 0) {
                for (var i = 0; i < response.RESULT.length; i++) {
                    if (response.RESULT[i].USE_INFO == "Y") {
                        if(response.RESULT[i].FAQ_TYPE == "01") {
                            var res = "";
                            res += "<div class='my-3 d-flex h-100 faq_q'>"
                                + "<div class='d-flex justify-content-center align-items-center fs-35 font-weight-bold q_mark'><div>Q</div></div>"
                                + "<div class='d-flex justify-content-center align-items-center fs-15 q_content'><div class='text-break'>"+response.RESULT[i].FAQ_Q+"</div></div>"
                                + "<div class='d-flex justify-content-center align-items-center fs-15 q_mark'><i class='icon-down-arrow'></i></div>"
                                + "</div>"
                                + "<div class='my-3 h-100 faq_a d-none'>"
                                + "<div class='d-flex justify-content-center align-items-center fs-35 font-weight-bold q_mark'><div>A</div></div>"
                                + "<div class='d-flex align-items-left fs-15 a_content'><div class='text-break align-self-center'>"+response.RESULT[i].FAQ_A+"</div></div>"
                                + "</div>";
                            $("#memberS").append(res);
                        }else if(response.RESULT[i].FAQ_TYPE == "02") {
                            var res = "";
                            res += "<div class='my-3 d-flex h-100 faq_q'>"
                                + "<div class='d-flex justify-content-center align-items-center fs-35 font-weight-bold q_mark'><div>Q</div></div>"
                                + "<div class='d-flex justify-content-center align-items-center fs-15 q_content'><div class='text-break'>"+response.RESULT[i].FAQ_Q+"</div></div>"
                                + "<div class='d-flex justify-content-center align-items-center fs-15 q_mark'><i class='icon-down-arrow'></i></div>"
                                + "</div>"
                                + "<div class='my-3 h-100 faq_a d-none'>"
                                + "<div class='d-flex justify-content-center align-items-center fs-35 font-weight-bold q_mark'><div>A</div></div>"
                                + "<div class='d-flex align-items-left fs-15 a_content'><div class='text-break align-self-center'>"+response.RESULT[i].FAQ_A+"</div></div>"
                                + "</div>";
                            $("#levelS").append(res);
                        }else if(response.RESULT[i].FAQ_TYPE == "03") {
                            var res = "";
                            res += "<div class='my-3 d-flex h-100 faq_q'>"
                                + "<div class='d-flex justify-content-center align-items-center fs-35 font-weight-bold q_mark'><div>Q</div></div>"
                                + "<div class='d-flex justify-content-center align-items-center fs-15 q_content'><div class='text-break'>"+response.RESULT[i].FAQ_Q+"</div></div>"
                                + "<div class='d-flex justify-content-center align-items-center fs-15 q_mark'><i class='icon-down-arrow'></i></div>"
                                + "</div>"
                                + "<div class='my-3 h-100 faq_a d-none'>"
                                + "<div class='d-flex justify-content-center align-items-center fs-35 font-weight-bold q_mark'><div>A</div></div>"
                                + "<div class='d-flex align-items-left fs-15 a_content'><div class='text-break align-self-center'>"+response.RESULT[i].FAQ_A+"</div></div>"
                                + "</div>";
                            $("#stempS").append(res);
                        }else if(response.RESULT[i].FAQ_TYPE == "04") {
                            var res = "";
                            res += "<div class='my-3 d-flex h-100 faq_q'>"
                                + "<div class='d-flex justify-content-center align-items-center fs-35 font-weight-bold q_mark'><div>Q</div></div>"
                                + "<div class='d-flex justify-content-center align-items-center fs-15 q_content'><div class='text-break'>"+response.RESULT[i].FAQ_Q+"</div></div>"
                                + "<div class='d-flex justify-content-center align-items-center fs-15 q_mark'><i class='icon-down-arrow'></i></div>"
                                + "</div>"
                                + "<div class='my-3 h-100 faq_a d-none'>"
                                + "<div class='d-flex justify-content-center align-items-center fs-35 font-weight-bold q_mark'><div>A</div></div>"
                                + "<div class='d-flex align-items-left fs-15 a_content'><div class='text-break align-self-center'>"+response.RESULT[i].FAQ_A+"</div></div>"
                                + "</div>";
                            $("#couponS").append(res);
                        }else if(response.RESULT[i].FAQ_TYPE == "05") {
                            var res = "";
                            res += "<div class='my-3 d-flex h-100 faq_q'>"
                                + "<div class='d-flex justify-content-center align-items-center fs-35 font-weight-bold q_mark'><div>Q</div></div>"
                                + "<div class='d-flex justify-content-center align-items-center fs-15 q_content'><div class='text-break'>"+response.RESULT[i].FAQ_Q+"</div></div>"
                                + "<div class='d-flex justify-content-center align-items-center fs-15 q_mark'><i class='icon-down-arrow'></i></div>"
                                + "</div>"
                                + "<div class='my-3 h-100 faq_a d-none'>"
                                + "<div class='d-flex justify-content-center align-items-center fs-35 font-weight-bold q_mark'><div>A</div></div>"
                                + "<div class='d-flex align-items-left fs-15 a_content'><div class='text-break align-self-center'>"+response.RESULT[i].FAQ_A+"</div></div>"
                                + "</div>";
                            $("#cardS").append(res);
                        }
                    }
                }
            }
        }
    });
    $(document).on("find", ".faq_a", function(){
        $(this).hide();
    });

    // faq selectbox 값 변경시
    $(document).on("change", "#faq_select", function() {
        var selected = $(this).find('option:selected');
        var extra = selected.data('content');
        $('#faq').text(extra);
        if($(this).val() == "0") {
            $("section").show();
        }else if($(this).val() == "1") {
            $("section").hide();
            $("#memberS").show();
        }else if($(this).val() == "2") {
            $("section").hide();
            $("#levelS").show();
        }else if($(this).val() == "3") {
            $("section").hide();
            $("#stempS").show();
        }else if($(this).val() == "4") {
            $("section").hide();
            $("#couponS").show();
        }else if($(this).val() == "5") {
            $("section").hide();
            $("#cardS").show();
        }
    });
    $(document).on("click", ".faq_q", function () {
        if($(this).next().hasClass("d-none")) {
            $(this).next().removeClass("d-none");
            $(this).next().addClass("d-flex");
        }else {
            $(this).next().removeClass("d-flex");
            $(this).next().addClass("d-none");
        }
        $(this).find("i").toggleClass("rotate");
    });

    // slide3 tab
    // 기본 welcome 등급표기
    $('.pt-level-icon').hide();
    $('.pt-level-content').hide();
    $('#welAppoint').show();
    $('#welContent').show();

    $('.pt-level').click(function(){
        var id = $(this).attr('id');
        if(id == "wel") {
            $('.pt-level-icon').hide();
            $('.pt-level-content').hide();
            $('#welAppoint').show();
            $('#welContent').show();
        }else if(id == "fri") {
            $('.pt-level-icon').hide();
            $('.pt-level-content').hide();
            $('#friAppoint').show();
            $('#friContent').show();
        }else if(id == "fam") {
            $('.pt-level-icon').hide();
            $('.pt-level-content').hide();
            $('#famAppoint').show();
            $('#famContent').show();
        }else if(id == "vip") {
            $('.pt-level-icon').hide();
            $('.pt-level-content').hide();
            $('#vipAppoint').show();
            $('#vipContent').show();
        }
    });
});