$(document).ready(function(){
    // 마케팅 수신 동의 결과에 따른 수신동의
    var sms = getCookie('sms');
    if(sms == null || sms == "N" || sms == "") {
        $("#SMS_RCV_YN").val("N");
    }else {
        $("#SMS_RCV_YN").val(sms);
    }

    // 이전 데이터 get & input
    var BRAND_CD = get('BRAND_CD');
    $("input[name=BRAND_CD]").val(BRAND_CD);
    var BRAND_NM = get('BRAND_NM');
    $("input[name=BRAND_NM]").val(BRAND_NM);
    var CUST_ID = get('CUST_ID');
    $("input[name=CUST_ID]").val(CUST_ID);
    var STOR_CD = get('STOR_CD');
    $("input[name=STOR_CD]").val(STOR_CD);
    var STOR_NM = get('STOR_NM');
    $("input[name=STOR_NM]").val(STOR_NM);
    var CUST_NM = get('CUST_NM');
    if(CUST_NM != "" || CUST_NM != null) {
        $("input[name=CUST_NM]").val(CUST_NM);
        $("input[name=CUST_NM]").attr("readonly", true);
    }else {
        $("input[name=CUST_NM]").attr("readonly", false);
    }
    var MOBILE = get('MOBILE');
    if(MOBILE != "" || MOBILE != null) {
        $("input[name=MOBILE]").val(MOBILE);
        $("input[name=MOBILE]").attr("readonly", true);
    }else {
        $("input[name=MOBILE]").attr("readonly", false);
    }

    // 이메일 선택
    var regExp = /^[\w\-\.]+@(?:(?:[\w\-]{2,}\.)+[a-zA-Z]{2,})$/;
    $('#email1').change(function(){
        var id = $(this).val();
        var domain = $("#email2").val();
        var email = id + "@" + domain;
        if(regExp.test(email)) {
            $('input[name=CUST_WEB_ID]').val(email);
            $('input[name=EMAIL]').val(email);
        }
        var btn = $("#idCheck");
        if(btn.hasClass("bg-yellow-color")) {
            btn.removeClass("bg-yellow-color");
            btn.addClass("bg-darkgray-color");
        }
    });
    $('#email2').change(function(){
        var id = $("#email1").val();
        var domain = $(this).val();
        var email = id + "@" + domain;
        if(regExp.test(email)) {
            $('input[name=CUST_WEB_ID]').val(email);
            $('input[name=EMAIL]').val(email);
        }
        if(btn.hasClass("bg-yellow-color")) {
            btn.removeClass("bg-yellow-color");
            btn.addClass("bg-darkgray-color");
        }
    });
    $('#select_email').change(function(){
        var domain = $(this).val();
        if(domain == "etc") {
            $("#email2").attr("readonly", false);
            $("#email2").css("background-color", "#fff");
            $("#email2").val("");
        }else {
            $("#email2").attr("readonly", true);
            $("#email2").css("background-color", "#f3f3f3");
            $("#email2").val(domain);
            var id = $("#email1").val();
            var email = id + "@" + domain;
            if(regExp.test(email)) {
                $('input[name=CUST_WEB_ID]').val(email);
                $('input[name=EMAIL]').val(email);
            }
        }
        if(btn.hasClass("bg-yellow-color")) {
            btn.removeClass("bg-yellow-color");
            btn.addClass("bg-darkgray-color");
        }
    });

    // 중복확인
    $("#idCheck").click(function () {
        var email1 = $("#email1").val();
        var email2 = $("#email2").val();
        var email3 = $('input[name=CUST_WEB_ID]').val();
        if($(this).hasClass('bg-yellow-color')) {
            $(this).removeClass("bg-yellow-color");
        }
        if(email1 == null || email1 == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                closeOnClickOutside: false,
                text: "Vui lòng nhập ID"
            });
            return false;
        }
        if(email2 == null || email2 == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                closeOnClickOutside: false,
                text: "Chưa nhập ID hoặc định dang email không chính xác"
            });
            return false;
        }
        if(email3 == null || email3 == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                closeOnClickOutside: false,
                text: "Chưa nhập ID hoặc định dang email không chính xác"
            });
            return false;
        }
        var datas = $('#signForm').serialize();
        $.ajax({
            url: '/vietnam/api/mbl_0120.jsp',
            type: 'POST',
            dataType: 'JSON',
            data: datas,
            success: function (response) {
                if(response.RET_CD == '0001' && response.RESULT[0].USE_POSS_YN == "Y") {
                    var btn = $("#idCheck");
                    btn.removeClass("bg-darkgray-color");
                    btn.addClass("bg-yellow-color");
                    $("#CUST_WEB_ID2").val(response.RESULT[0].CUST_WEB_ID);
                    $("#EMAIL").val(response.RESULT[0].CUST_WEB_ID);
                    swal({
                        button: "được rồi",
                        title: "Hướng dẫn",
                        text: "ID có sẵn",
                        closeOnClickOutside: false
                    });
                }else {
                    swal({
                        button: "được rồi",
                        title: "Hướng dẫn",
                        text: response.RET_MSG,
                        closeOnClickOutside: false
                    });
                }
            }
        });
    });

    // 부모 성별 클릭 이벤트
    $('#parents-m').click(function(){
        $("#SEX_DIV").val("M");
        if(!$(this).hasClass('ag-active')) {
            $(this).addClass('ag-active');
            $('#parents-f').removeClass('ag-active');
        }
    });
    $('#parents-f').click(function(){
        $("#SEX_DIV").val("F");
        if(!$(this).hasClass('ag-active')) {
            $(this).addClass('ag-active');
            $('#parents-m').removeClass('ag-active');
        }
    });

    // 공통코드 api 조회
    $.ajax({
        url : "/vietnam/api/mbl_0710.jsp",
        type : 'POST',
        dataType : 'JSON',
        success:function(response){
            if(response.RET_CD == "0001") {
                var result = "<option class='d-none' disabled selected>\n" +
                    "Hãy chọn mối quan hệ con của bạn</option>";
                for(var i = 0; i < response.RESULT.length; i++) {
                    result += "<option value='"+response.RESULT[i].CODE_CD+"' data-text='"+response.RESULT[i].CODE_NM+"'>"+response.RESULT[i].CODE_NM+"</option>";
                }
                $("select[name=CHILD_REL_CD]").append(result);
            }
        }
    });

    // 자녀와의 관계 선택 이벤트
    $('#relation').change(function(){
        if($('#relation').val() == '99') {
            $('#relation-input').removeClass('d-none');
            $('#relation-input').addClass('d-flex');
        } else {
            if($('#relation-input').hasClass('d-flex')) {
                $('#relation-input').val('');
                $('#relation-input').removeClass('d-flex');
                $('#relation-input').addClass('d-none');
            }
        }
    });

    // 가입 완료 버튼 클릭 이벤트
    var able = true;
    $('#signUpBtn').click(function() {
        // 오늘날짜
        var today = new Date();
        var to_y = today.getFullYear();
        var to_m = today.getMonth()+1;
        var to_d = today.getDate();
        if(to_m < 10) {
            to_m = "0" + to_m;
        }
        if (to_d < 10) {
            to_d = "0" + to_d;
        }
        var to_ymd = String(to_y) + String(to_m) + String(to_d);

        // 선택된 생년월일
        var select_year = $("#year").val();
        var select_month = leadingZeros($("#month").val(), 2);
        var select_day = leadingZeros($("#day").val(), 2);
        var select_ymd = String(select_year) + String(select_month) + String(select_day);

        $("#BIRTH_DT").val(select_ymd);

        var id = $("#CUST_WEB_ID").val();
        var id2 = $("#CUST_WEB_ID2").val();
        var pw = $("input[name=CUST_PW]").val();
        var pw2 = $("input[name=CUST_PW2]").val();
        var name = $("input[name=CUST_NM]").val();
        var sex = $("input[name=SEX_DIV]").val();
        var email = $("input[name=EMAIL]").val();
        var phone = $("input[name=MOBILE]").val();


        if (id == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Vui lòng nhập ID'
            });
            return false;
        }else if (!regExp.test(id)) {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Chưa nhập ID hoặc định dang email không chính xác'
            });
            return false;
        }else if (id2 == "" || id != id2) {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Kiểm tra ID trùng lặp.'
            });
            return false;
        }else if (pw == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Vui lòng nhập mật khẩu'
            });
            return false;
        }else if (pw2 == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Vui lòng nhập mật khẩu'
            });
            return false;
        }else if (!/^[a-zA-Z0-9]{8,20}$/.test(pw)) {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Mật khẩu phải là 8 ~ 20 ký tự được sử dụng hỗn hợp'
            });
            return false;
        }
        var chk_num = pw.search(/[0-9]/g);
        var chk_eng = pw.search(/[a-z]/ig);
        if(chk_num < 0 || chk_eng < 0){
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Định dạng mật khẩu: lại sự kết hợp tiếng Anh + số '
            });
            return false;
        }else if(pw != pw2) {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Mật khẩu không khớp'
            });
            return false;
        }else if(sex == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Chọn giới tính'
            });
            return false;
        }else if(name == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Nhập họ tên'
            });
            return false;
        }else if(parseInt(to_ymd) - parseInt(select_ymd) < 0) {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Chọn và nhập ngày tháng năm sinh'
            });
            return false;
        }else if(phone == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Vui lòng nhập số điện thoại di động của bạn'
            });
            return false;
        }else if(String(phone).length != 10) {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Số điện thoại di động không hợp lệ'
            });
            return false;
        }else if(email == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Chưa nhập ID hoặc định dang email không chính xác'
            });
            return false;
        }else if(!regExp.test(email)) {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Chưa nhập ID hoặc định dang email không chính xác'
            });
        }
        if(able) {
            able = false;
            var datas = $('#signForm').serialize();
            $.ajax({
                url: "/vietnam/api/mbl_0200.jsp",
                type: 'POST',
                dataType: 'JSON',
                data: datas,
                success: function (response) {
                    console.log(response);
                    if (response.RET_CD == "0001") {
                        document.location.href = "sign-up2-b.jsp?CUST_ID=" + response.RESULT[0].CUST_ID + "&Classification=sign";
                    } else {
                        able = true;
                        swal({
                            button: "Xác nhận",
                            title: "Hướng dẫn",
                            text: response.RET_MSG
                        });
                        return false;
                    }
                }
            });
        }else {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Đang trong quá trình xử lý\nVui lòng đăng nhập lại sau vài phút'
            });
            return false;
        }

    });

});
var leadingZeros = function (date, num) {
    var zero = '';
    date = date.toString();

    if (date.length < num) {
        for (i = 0; i < num - date.length; i++)
            zero += '0';
    }
    return zero + date;
};