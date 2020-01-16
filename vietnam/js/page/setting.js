$(document).ready(function(){
    var user = getCookie('user');
    $('input[name=CUST_ID]').val(user);
    if(user != "" && user != null) {
        device_info(user);
        user_info(user);
    }else {
        swal({
            button: "Xác nhận",
            title: "Hướng dẫn",
            closeOnClickOutside: false,
            text: 'ID hội viên không tồn tại'
        })
    }

    $('#logout').click(function(){
        swal({
            title: "Hướng dẫn",
            text: "Bạn chắc chắn muốn đăng xuất?",
            buttons: ["Huỷ bỏ", "Đăng xuất"],
            dangerMode: true,
            closeOnClickOutside: false
        }).then((willDelete) => {
            if (willDelete) {
                $('input[name=AUTH_TOKEN]').val("");
                var datas = $("#setForm").serialize();
                console.log(datas);
                $.ajax({
                    url : "/vietnam/api/mbl_0600.jsp",
                    type : 'POST',
                    dataType : 'JSON',
                    data : datas,
                        success:function(response){
                            if(response.RET_CD == "0001") {
                                swal("Bạn đã đăng xuất thành công", {
                                    icon: "success",
                                    closeOnClickOutside: false,
                                    button: "Xác nhận",
                                }).then(function() {
                                    setCookie('user', null, -1);
                                    setCookie('web_id', null, -1);
                                    window.location = "login.jsp";
                                });
                            }else {
                                swal({
                                    button: "Xác nhận",
                                    title: "Hướng dẫn",
                                    closeOnClickOutside: false,
                                    text: response.RET_MSG
                                });
                            }
                        }
                });
            }else {
                return false;
            }
        });
    });

    $('#push-slide').change(function(){
        if($(this).is(":checked")) {
            $("input[name=PUSH_RCV_YN]").val('Y');
        }else {
            $("input[name=PUSH_RCV_YN]").val('N');
        }
        check_chage();
    });

    $('#email-slide').change(function(){
        if($(this).is(":checked")) {
            $("input[name=EMAIL_RCV_YN]").val('Y');
        }else {
            $("input[name=EMAIL_RCV_YN]").val('N');
        }
        check_chage();
    });

    $('#sms-slide').change(function(){
        if($(this).is(":checked")) {
            $("input[name=SMS_RCV_YN]").val('Y');
        }else {
            $("input[name=SMS_RCV_YN]").val('N');
        }
        check_chage();
    });
});
function device_info(user) {
    $.ajax({
        url: "/vietnam/api/mbl_0610.jsp?COMP_CD=011&CUST_ID="+user,
        type: 'POST',
        dataType: 'JSON',
        success: function (response) {
            if(response.RET_CD == "0001" && response.RESULT.length > 0) {
                $('input[name=DEVICE_DIV]').val(response.RESULT[0].DEVICE_DIV);
                $('input[name=DEVICE_NM]').val(response.RESULT[0].DEVICE_NM);
                $('input[name=MOBILE_KIND]').val(response.RESULT[0].MOBILE_KIND);
                $('input[name=AUTH_TOKEN]').val(response.RESULT[0].AUTH_TOKEN);
            }
        }
    });
}
function user_info(user) {
    $.ajax({
        url : "/vietnam/api/mbl_0500.jsp?COMP_CD=011&CUST_ID="+user,
        type : 'POST',
        dataType : 'JSON',
        success:function(response){
            if(response.RET_CD == "0001"){
                if(response.RESULT[0].CUST_STAT == "2"){
                    var CUST_WEB_ID = response.RESULT[0].CUST_WEB_ID;
                    $("#CUST_WEB_ID").text(CUST_WEB_ID);
                    if(response.RESULT[0].PUSH_RCV_YN == 'Y') {
                        $('input:checkbox[id="push-slide"]').attr("checked", true);
                        $('input[name=PUSH_RCV_YN]').val('Y');
                    }else {
                        $('input:checkbox[id="push-slide"]').attr("checked", false);
                        $('input[name=PUSH_RCV_YN]').val('N');
                    }
                    if(response.RESULT[0].EMAIL_RCV_YN == 'Y') {
                        $('input:checkbox[id="email-slide"]').attr("checked", true);
                        $('input[name=EMAIL_RCV_YN]').val('Y');
                    }else {
                        $('input:checkbox[id="email-slide"]').attr("checked", false);
                        $('input[name=EMAIL_RCV_YN]').val('N');
                    }
                    if(response.RESULT[0].SMS_RCV_YN == 'Y') {
                        $('input:checkbox[id="sms-slide"]').attr("checked", true);
                        $('input[name=SMS_RCV_YN]').val('Y');
                    }else {
                        $('input:checkbox[id="sms-slide"]').attr("checked", false);
                        $('input[name=SMS_RCV_YN]').val('N');
                    }
                }else{
                    document.location.href="logout.jsp";
                }
            }else {
                document.location.href="logout.jsp";
            }
        }
    });
}
function check_chage() {
    var datas = $("#setForm").serialize();
    $.ajax({
        url : "/vietnam/api/mbl_0220.jsp",
        type : 'POST',
        dataType : 'JSON',
        data : datas,
        success:function(response){
            console.log(response);
            if(response.RET_CD != "0001") {
                swal({
                    button: "Xác nhận",
                    title: "Hướng dẫn",
                    closeOnClickOutside: false,
                    text: response.RET_MSG
                });
            }
        }
    });
}