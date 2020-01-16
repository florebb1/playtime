$(document).ready(function(){
    // 버튼 중복 이벤트 방지
    var able = "1";
    // 아이디 중복체크용 배열 생성
    var nmArr = [];
    // 오늘날짜
    var date = new Date();
    var toYear = date.getFullYear();
    var toMonth = new String(date.getMonth()+1);
    var toDay = new String(date.getDate());
    if(toMonth < 10){
        toMonth = "0"+toMonth;
    }
    if(toDay < 10){
        toDay = "0"+toDay;
    }
    var now = toYear+toMonth+toDay;

    // get url prameter
    var CUST_ID = get('CUST_ID');
    $("input[name=CUST_ID]").val(CUST_ID);
    var cf = get('Classification');

    // 아이 정보 검색
    var datas = $("#childForm").serialize();
    $.ajax({
        url: "/vietnam/api/mbl_0110.jsp",
        type: 'POST',
        dataType: 'JSON',
        data: datas,
            success: function (response) {
                // 등록가능 아이수 정보
                var APPEND_CNT = response.APPEND_CNT;
                if(APPEND_CNT == 5) {
                    $("#APPEND_CNT").val(APPEND_CNT - 1);
                }else {
                    $("#APPEND_CNT").val(APPEND_CNT);
                }
                var result = "";
                if(response.RET_CD == "0001") {
                    console.log(response);
                    for(var i = 0; i < response.RESULT.length; i++) {
                        nmArr.push(response.RESULT[i].CHILD_NM);
                        result += "<div class='existe'>"
                            + "<div class='info-box text-left font-weight-bold'><label class='px-1'></label>Tên trẻ em / Giới tính</label></div>"
                            + "<div class='info-box d-flex justify-content-center align-items-center mb-4'>"
                            + "<div class='w-100 col-8 mr-2 p-0'><input type='text' class='sign-input-box w-100 pl-2 info-bg-color' value='"+response.RESULT[i].CHILD_NM+"' readonly></div>"
                            + "<div class='col btn-group p-0' role='group'>";
                        if(response.RESULT[i].SEX_DIV == "M") {
                            result += "<button type='button' class='btn select-left-btn text-secondary col-6 ag-active'>M</button>"
                                + "<button type='button' class='btn select-right-btn text-secondary col-6'>F</button>";
                        }else if(response.RESULT[i].SEX_DIV == "F") {
                            result += "<button class='btn select-left-btn text-secondary col-6'>M</button>"
                                + "<button class='btn select-right-btn text-secondary col-6 ag-active'>F</button>";
                        }else {
                            result += "<button class='btn select-left-btn text-secondary col-6'>M</button>"
                                + "<button class='btn select-right-btn text-secondary col-6'>F</button>";
                        }
                        result += "</div>"
                            + "</div>"
                            + "<div class='info-box text-left font-weight-bold'>"
                            + "<label class='px-1'></label>Ngày sinh của con</label>"
                            + "</div>"
                        if(response.RESULT[i].BIRTH_DT != null) {
                            result += "<div class='info-box d-flex justify-content-center align-items-center mb-4'>"
                                + "<div class='w-100 col mr-2 p-0'>"
                                + "<input type='number' class='sign-input-box w-100 text-center info-bg-color day' value='"+response.RESULT[i].BIRTH_DT.substring(6,8)+"' readonly>"
                                + "</div>"
                                + "<div class='w-100 col mr-2 p-0'>"
                                + "<input type='number' class='sign-input-box w-100 text-center info-bg-color month' value='"+response.RESULT[i].BIRTH_DT.substring(4,6)+"' readonly>"
                                + "</div>"
                                + "<div class='w-100 col-6 p-0'>"
                                + "<input type='number' class='sign-input-box w-100 text-center info-bg-color year' value='"+response.RESULT[i].BIRTH_DT.substring(0,4)+"' readonly>"
                                + "</div>"
                                + "</div>"
                                + "</div>";
                        }else {
                            result += "<div class='info-box d-flex justify-content-center align-items-center mb-4'>"
                                + "<div class='w-100 col mr-2 p-0'>"
                                + "<input type='number' class='sign-input-box w-100 text-center info-bg-color day' readonly>"
                                + "</div>"
                                + "<div class='w-100 col mr-2 p-0'>"
                                + "<input type='number' class='sign-input-box w-100 text-center info-bg-color month' readonly>"
                                + "</div>"
                                + "<div class='w-100 col-6 p-0'>"
                                + "<input type='number' class='sign-input-box w-100 text-center info-bg-color year' readonly>"
                                + "</div>"
                                + "</div>"
                                + "</div>";
                        }
                    }
                $('#def_chi').empty();
                $('.divid').hide();
                $('#add-child-areas').append(result);
                }
            }
    });

    // 자녀 성별 클릭 이벤트
    $(document).on('click', '.child-m', function() {
        if(!$(this).hasClass('ag-active')) {
            $(this).addClass('ag-active');
            $(this).next().removeClass('ag-active');
        }
        $(this).parent().find($("input[name=C_SEX_DIV]")).val("M");
    });
    $(document).on('click', '.child-f', function() {
        if(!$(this).hasClass('ag-active')) {
            $(this).addClass('ag-active');
            $(this).prev().removeClass('ag-active');
        }
        $(this).parent().find($("input[name=C_SEX_DIV]")).val("F");
    });

    // 자녀 생년월일 변경 이벤트
    $(document).on("change",".year",function(){
        var pattern1 = /^\d{4}$/;
        var year = $(this).val();
        if(!pattern1.test(year)) {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: "Chỉ có 4 chữ số có thể được nhập",
                closeOnClickOutside: false
            });
            $(this).val("");
            $(this).focus();
        }else {
            var parent = $(this).parent().parent();
            var month = parent.find(".month").val();
            var day = parent.find(".day").val();
            var ymd = year + month + day;
            if(ymd.length === 8) {
                parent.parent().find($("input[name=C_BIRTH_DT]")).val(ymd);
            }
        }
    });
    $(document).on("change",".month",function(){
        var pattern1 = /^\d{2}$/;
        var month = $(this).val();
        if(!pattern1.test(month) || parseInt(month) > 12) {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: "Chỉ cho phép hai chữ số dưới 13\nMột số nhỏ hơn 10 phải được bắt đầu bằng '0'",
                closeOnClickOutside: false
            });
            $(this).val("");
            $(this).focus();
        }else {
            var parent = $(this).parent().parent();
            var year = parent.find(".year").val();
            var day = parent.find(".day").val();
            var ymd = year + month + day;
            if(ymd.length === 8) {
                parent.parent().find($("input[name=C_BIRTH_DT]")).val(ymd);
            }
        }
    });
    $(document).on("change",".day",function(){
        var pattern1 = /^\d{2}$/;
        var day = $(this).val();
        if(!pattern1.test(day) || parseInt(day) > 31) {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: "Chỉ cho phép hai chữ số dưới 13\nMột số nhỏ hơn 10 phải được bắt đầu bằng '0'",
                closeOnClickOutside: false
            });
            $(this).val("");
            $(this).focus();
        }else {
            var parent = $(this).parent().parent();
            var year = parent.find(".year").val();
            var month = parent.find(".month").val();
            var ymd = year + month + day;
            if(ymd.length === 8) {
                parent.parent().find($("input[name=C_BIRTH_DT]")).val(ymd);
            }
        }
    });


    // 자녀 추가 버튼
    $('#child-add').click(function(){
        var ac = $('#APPEND_CNT').val();
        if(ac != 0) {
            var nc = "";
            nc += "<div class='children'>"
                + "<div class='info-box text-left font-weight-bold'>"
                + "<label class='px-1'></label>Tên trẻ em / Giới tính</label>"
                + "</div>"
                + "<div class='info-box d-flex justify-content-center align-items-center mb-4'>"
                + "<div class='w-100 col-8 mr-2 p-0'>"
                + "<input type='text' name='C_CHILD_NM' class='sign-input-box w-100 pl-2 child_nm' placeholder='Tên trẻ em / Giới tính'>"
                + "</div>"
                + "<div class='col btn-group p-0' role='group'>"
                + "<button type='button' class='btn select-left-btn text-secondary col-6 child-m'>M</button>"
                + "<button type='button' class='btn select-right-btn text-secondary col-6 child-f'>F</button>"
                + "<input type='hidden' class='sex_div' name='C_SEX_DIV'>"
                + "<input type='hidden' class='birth_dt' name='C_BIRTH_DT'>"
                + "<input type='hidden' name='C_USE_YN' value='Y'>"
                + "<input type='hidden' name='C_CHILD_NO' value='0'>"
                + "</div>"
                + "</div>"
                + "<div class='info-box text-left font-weight-bold'>"
                + "<label class='px-1'></label>Ngày sinh của con</label>"
                + "</div>"
                + "<div class='info-box d-flex justify-content-center align-items-center mb-4'>"
                + "<div class='w-100 col mr-2 p-0'>"
                + "<input type='number' class='sign-input-box w-100 text-center day' placeholder='ex) 01'>"
                + "</div>"
                + "<div class='w-100 col mr-2 p-0'>"
                + "<input type='number' class='sign-input-box w-100 text-center month' placeholder='ex) 01'>"
                + "</div>"
                + "<div class='w-100 col-6 p-0'>"
                + "<input type='number' class='sign-input-box w-100 text-center year' placeholder='ex) 2002'>"
                + "</div>"
                + "</div>"
                + "</div>";
            $('#add-child-areas').append(nc);
            ac  = ac - 1;
            $('#APPEND_CNT').val(ac);
        }else {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: "Bạn đã đăng ký vượt quá số lượng được phép",
                closeOnClickOutside: false
            });
            return false;
        }
    });

    // 아이등록 버튼클릭
    $("#next-btn").click(function(){
        // 기본 아이등록 설정
        var childrenYn = true;
        var childrenDate = true;
        var childrenName = true;
        var blankChk = true;
        // 자녀 이름 배열 선언
        var nmArr2 = [];
        for(var i = 0; i < nmArr.length; i++) {
            nmArr2.push(nmArr[i]) ;
        }

        // 기본 등록 자녀
        var defaultSize = $(".children_default").length;
        // 기존 등록 자녀
        var existeSize = $(".existe").length;
        // 추가 등록 자녀
        var childrenSize = $(".children").length;


        if(able == "1") {
            if(defaultSize != 0) {
                $(".children_default").each(function() {
                    var d_child_nm = $(this).find(".child_nm").val();
                    var d_sex_div = $(this).find(".sex_div").val();
                    var d_year = $(this).find(".year").val();
                    var d_month = $(this).find(".month").val();
                    var d_day = $(this).find(".day").val();
                    var d_birth_dt = $(this).find(".birth_dt").val();
                    // validation
                    if(d_child_nm == ""  && d_year == "" && d_month == "" && d_day == ""){

                    }else if(d_child_nm != "" && d_year != "" && d_month != "" && d_day != "") {
                        blankChk = false;
                    }else {
                        blankChk = false;
                        childrenYn = false;
                    }
                    if(parseInt(now) - parseInt(d_birth_dt) < 0 ) {
                        childrenDate = false;
                    }
                    if(nmArr2.indexOf(d_child_nm) == -1) {
                        nmArr2.push(d_child_nm);
                    }else {
                        childrenName = false;
                    }
                });
                if(childrenSize != 0) {
                    $(".children").each(function() {
                        var child_nm = $(this).find(".child_nm").val();
                        var sex_div = $(this).find(".sex_div").val();
                        var year = $(this).find(".year").val();
                        var month = $(this).find(".month").val();
                        var day = $(this).find(".day").val();
                        var birth_dt = $(this).find(".birth_dt").val();

                        // validation
                        if(child_nm == ""  && year == "" && month == "" && day == ""){

                        }else if(child_nm != "" && year != "" && month != "" && day != "") {
                            blankChk = false;
                        }else {
                            blankChk = false;
                            childrenYn = false;
                        }
                        if(parseInt(now) - parseInt(birth_dt) < 0 ) {
                            childrenDate = false;
                        }
                        if(nmArr2.indexOf(child_nm) == -1) {
                            nmArr2.push(child_nm);
                        }else {
                            childrenName = false;
                        }
                    });
                }
                if(!blankChk) {
                    if (!childrenYn) {
                        swal({
                            button: "Xác nhận",
                            title: "Hướng dẫn",
                            text: "Tên, giới tính, ngày sinh của trẻ là những thông tin bắt buộc"
                        });
                        return false;
                    }
                    if (!childrenDate) {
                        swal({
                            button: "Xác nhận",
                            title: "Hướng dẫn",
                            text: "Vui lòng nhập ngày trước ngày hôm nay."
                        });
                        return false;
                    }
                    if (!childrenName) {
                        swal({
                            button: "Xác nhận",
                            title: "Hướng dẫn",
                            text: "Có một giá trị trùng lặp trong tên con."
                        });
                        return false;
                    }
                    able = false;
                    var datas = $("#childForm").serialize();
                    console.log(datas);
                    $.ajax({
                        url: "/vietnam/api/mbl_0210.jsp",
                        type: 'POST',
                        dataType: 'JSON',
                        data: datas,
                        success: function (response) {
                            console.log(response);
                            if (response.RET_CD == "0001") {
                                if (cf == 'edit') {
                                    swal({
                                        button: "Xác nhận",
                                        title: "Hướng dẫn",
                                        text: 'Đã hoàn thành thay đổi thông tin hội viên.'
                                    }).then(function () {
                                        document.location.href = "mypage.jsp";
                                    });
                                } else {
                                    swal({
                                        button: "Xác nhận",
                                        title: "Hướng dẫn",
                                        text: 'Hoàn tất việc đăng ký'
                                    }).then(function () {
                                        document.location.href = "sign-up3.jsp";
                                    });
                                }
                            } else {
                                able = true;
                                swal({
                                    button: "Xác nhận",
                                    title: "Hướng dẫn",
                                    text: response.RET_MSG
                                });
                                return false;
                            }
                        }, error: function (error) {
                            console.log(error)
                        }
                    });
                }
            }else {
                if(childrenSize != 0) {
                    // 추가 아이정보 validation
                    $(".children").each(function() {
                        var child_nm = $(this).find(".child_nm").val();
                        var sex_div = $(this).find(".sex_div").val();
                        var year = $(this).find(".year").val();
                        var month = $(this).find(".month").val();
                        var day = $(this).find(".day").val();
                        var birth_dt = $(this).find(".birth_dt").val();

                        // validation
                        if(child_nm == ""  && year == "" && month == "" && day == ""){

                        }else if(child_nm != "" && year != "" && month != "" && day != "") {
                            blankChk = false;
                        }else {
                            blankChk = false;
                            childrenYn = false;
                        }
                        if(parseInt(now) - parseInt(birth_dt) < 0 ) {
                            childrenDate = false;
                        }
                        if(nmArr2.indexOf(child_nm) == -1) {
                            nmArr2.push(child_nm);
                        }else {
                            childrenName = false;
                        }
                    });
                    if(!blankChk) {
                        if(!childrenYn){
                            swal({
                                button: "Xác nhận",
                                title: "Hướng dẫn",
                                text: "Tên, giới tính, ngày sinh của trẻ là những thông tin bắt buộc"
                            });
                            return false;
                        }
                        if(!childrenDate) {
                            swal({
                                button: "Xác nhận",
                                title: "Hướng dẫn",
                                text: "Vui lòng nhập ngày trước ngày hôm nay."
                            });
                            return false;
                        }
                        if(!childrenName) {
                            swal({
                                button: "Xác nhận",
                                title: "Hướng dẫn",
                                text: "Có một giá trị trùng lặp trong tên con."
                            });
                            return false;
                        }
                        able = false;
                        var datas = $("#childForm").serialize();
                        console.log(datas);
                        $.ajax({
                            url: "/vietnam/api/mbl_0210.jsp",
                            type: 'POST',
                            dataType: 'JSON',
                            data: datas,
                            success: function (response) {
                                console.log(response);
                                if(response.RET_CD == "0001") {
                                    if(cf == 'edit') {
                                        swal({
                                            button: "Xác nhận",
                                            title: "Hướng dẫn",
                                            text: 'Đã hoàn thành thay đổi thông tin hội viên.'
                                        }).then(function() {
                                            document.location.href="mypage.jsp";
                                        });
                                    }else {
                                        swal({
                                            button: "Xác nhận",
                                            title: "Hướng dẫn",
                                            text: 'Hoàn tất việc đăng ký'
                                        }).then(function() {
                                            document.location.href="sign-up3.jsp";
                                        });
                                    }
                                }else {
                                    able = "1";
                                    swal({
                                        button: "Xác nhận",
                                        title: "Hướng dẫn",
                                        text: response.RET_MSG
                                    });
                                    return false;
                                }
                            }, error : function(error){
                                console.log(error)
                            }
                        });
                    }else {
                        if(cf == "sign") {
                            swal({
                                button: "Xác nhận",
                                title: "Hướng dẫn",
                                text: 'Hoàn tất việc đăng ký'
                            }).then(function() {
                                document.location.href = "sign-up3.jsp";
                            });
                        }else {
                            swal({
                                button: "Xác nhận",
                                title: "Hướng dẫn",
                                text: 'Đã hoàn thành thay đổi thông tin hội viên.'
                            }).then(function() {
                                document.location.href = "mypage.jsp";
                            });
                        }
                    }
                }else {
                    if(existeSize != 0) {
                        if(cf == "sign") {
                            swal({
                                button: "Xác nhận",
                                title: "Hướng dẫn",
                                text: 'Hoàn tất việc đăng ký'
                            }).then(function() {
                                document.location.href = "sign-up3.jsp";
                            });
                        }else {
                            swal({
                                button: "Xác nhận",
                                title: "Hướng dẫn",
                                text: 'Đã hoàn thành thay đổi thông tin hội viên.'
                            }).then(function() {
                                document.location.href = "mypage.jsp";
                            });
                        }
                    } else {
                        able = "1";
                        swal({
                            button: "Xác nhận",
                            title: "Hướng dẫn",
                            text: "Vui lòng đăng ký theo yêu cầu bắt buộc về thông tin cho trẻ với số lượng 1 trẻ trở lên"
                        });
                        return false;
                    }
                }
            }
        }else {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Đang trong quá trình xử lý\nVui lòng đăng nhập lại sau vài phút'
            }).then(function() {
                document.location.reload();
            });
        }
    });
});