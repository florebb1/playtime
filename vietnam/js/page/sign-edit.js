$(document).ready(function(){
    // 이메일 정규표현식
    var regExp = /^[\w\-]+@(?:(?:[\w\-]{2,}\.)+[a-zA-Z]{2,})$/;
    // 유저 id get
    var user = getCookie("user");
    $("#CUST_ID").val(user);
    userSearch();

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


    // 아이와의 관계 기타 toggle
    $("#relation").change(function(){
        var code = $(this).val();
        var selected = $(this).find('option:selected');
        var name = selected.data('text');
        $(this).prev().text(name);
        if(code == "99") {
            $("input[name=CHILD_REL_NM]").attr("type", "text");
            $("input[name=CHILD_REL_NM]").val("");
        }else {
            $("input[name=CHILD_REL_NM]").attr("type", "hidden");
            $("input[name=CHILD_REL_NM]").val(name);
        }
    });

    // 수정 버튼 클릭
    var able = true;
    $("#signUpBtn").click(function(){
        //validation 추가
        if($('input[name=EMAIL]').val() == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Chưa nhập ID hoặc định dang email không chính xác'
            });
            return false;
        }else if(!regExp.test($('input[name=EMAIL]').val())) {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Chưa nhập ID hoặc định dang email không chính xác'
            });
            return false;
        }else if($('input[name=ZIP_CD]').val() == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: "Nhập mã số bưu điện"
            });
            return false;
        }else if($('input[name=ADDR1]').val() == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: "Vui lòng nhập địa chỉ của bạn."
            });
            return false;
        }else if($('input[name=ADDR2]').val() == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: "Vui lòng nhập địa chỉ của bạn."
            });
            return false;
        }else if($('input[name=CHILD_CNT]').val() == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: "Vui lòng nhập số lượng trẻ em"
            });
            return false;
        }else if($('input[name=CHILD_REL_CD]').val() == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: "Hãy chọn mối quan hệ của bạn với bạn."
            });
            return false;
        }else if($('input[name=CHILD_REL_CD]').val() == "99") {
            if($('input[name=CHILD_REL_NM]').val() == "") {
                swal({
                    button: "Xác nhận",
                    title: "Hướng dẫn",
                    text: "Nhập mối quan hệ của bạn với bạn."
                });
                return false;
            }
        }

        if(able == true) {
            var datas = $("#editForm").serialize();
            able = false;
            $.ajax({
                url : "/vietnam/api/mbl_0200.jsp",
                type : 'POST',
                dataType : 'JSON',
                data : datas,
                success:function(response){
                    console.log(response);
                    if(response.RET_CD == "0001") {
                        document.location.href="sign-up2-b.jsp?CUST_ID="+response.RESULT[0].CUST_ID+"&Classification=edit";
                    }else {
                        swal({
                            button: "Xác nhận",
                            title: "Hướng dẫn",
                            text: response.RET_MSG
                        }).then(function() {
                            able = true;
                            return false;
                        });
                    }
                }
            });
        }else {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: 'Đang trong quá trình xử lý\nVui lòng đăng nhập lại sau vài phút'
            });
        }
    });


});
function userSearch() {
    var datas = $("#editForm").serialize();
    $.ajax({
        url: '/vietnam/api/mbl_0500.jsp',
        type: 'POST',
        dataType: 'JSON',
        data: datas,
        success: function (response) {
            $("#CUST_WEB_ID").val(response.RESULT[0].CUST_WEB_ID);
            $("#CUST_NM").val(response.RESULT[0].CUST_NM);
            if(response.RESULT[0].SEX_DIV == "M") {
                $("#parents-m").addClass("ag-active");
                $("#SEX_DIV").val("M");
            }else {
                $("#parents-f").addClass("ag-active");
                $("#SEX_DIV").val("F");
            }
            $("#BIRTH_DT").val(response.RESULT[0].BIRTH_DT);
            $("#day").val(parseInt(response.RESULT[0].BIRTH_DT.substring(6,8)));
            $("#month").val(parseInt(response.RESULT[0].BIRTH_DT.substring(4,6)));
            $("#year").val(parseInt(response.RESULT[0].BIRTH_DT.substring(0,4)));
            $("input[name=MOBILE]").val(response.RESULT[0].MOBILE);
            $("input[name=ZIP_CD]").val(response.RESULT[0].ZIP_CD);
            $("input[name=ADDR1]").val(response.RESULT[0].ADDR1);
            $("input[name=ADDR2]").val(response.RESULT[0].ADDR2);
            $("input[name=EMAIL]").val(response.RESULT[0].EMAIL);
            $("input[name=EMAIL_RCV_YN]").val(response.RESULT[0].EMAIL_RCV_YN);
            $("input[name=SMS_RCV_YN]").val(response.RESULT[0].SMS_RCV_YN);
            $("input[name=PUSH_RCV_YN]").val(response.RESULT[0].PUSH_RCV_YN);
            $("input[name=CHILD_CNT]").val(response.RESULT[0].CHILD_CNT);
            $("#relation").val(response.RESULT[0].CHILD_REL_CD);
            $("input[name=CHILD_REL_NM]").val(response.RESULT[0].CHILD_REL_NM);
            $("input[name=BRAND_CD]").val(response.RESULT[0].BRAND_CD);
            $("input[name=STOR_CD]").val(response.RESULT[0].STOR_CD);
        }
    });
}