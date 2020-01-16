$(document).ready(function(){
    // 아이디 공백문자 방지
    $("input[name=CUST_WEB_ID]").keyup(function(){
        var cust = $("input[name=CUST_WEB_ID]").val().trim();
        $("input[name=CUST_WEB_ID]").val(cust);
    });
    // 로그인 api 연결
    $("#loginBtn").click(function(){
        var url = "/vietnam/api/mbl_0400.jsp";
        var datas = $("#loginForm").serialize();
        $.ajax({
            url : url,
            type : 'POST',
            dataType : 'JSON',
            data : datas,
            success:function(response){
                console.log(response);
                if(response.RET_CD == "0001") {
                    var web_id = $("input[name=CUST_WEB_ID]").val();
                    var today = new Date();
                    var pwDate = response.RESULT[0].LAST_CHG_PW;
                    var year = pwDate.substring(0, 4);
                    var month = pwDate.substring(4, 6);
                    var day = pwDate.substring(6, 8);
                    var pwDateFormat = year + '-' + month + '-' + day;
                    var dateArray = pwDateFormat.split("-");
                    var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);
                    var betweenDay = (today.getTime() - dateObj.getTime())/1000/60/60/24;
                    if(response.RESULT[0].REST_YN == "Y") {
                        swal({
                            title: "Hướng dẫn",
                            text: "Tài khoản bạn đăng nhập là đang không hoạt động.\nBạn có tiếp tục sử dụng tài khoản không?",
                            confirmButtonText: "Di chuyển",
                            cancelButtonText: "Huỷ bỏ",
                            dangerMode: true,
                            closeOnClickOutside: false
                        },function(isConfirm){
                            // .then((willDelete) => {
                            if (isConfirm) {
                                swal("Chuyển đến trang chủ", {
                                    icon: "success",
                                    closeOnClickOutside: false,
                                    button: "Xác nhận",
                                }).then(function() {
                                    window.location = "human.jsp?CUST_WEB_ID="+response.RESULT[0].CUST_WEB_ID;
                                });
                            } else {
                                location.reload();
                            }
                        });
                    }else if(response.RESULT[0].PW_DIV == "Y") {
                        swal({
                            button: "Xác nhận",
                            title: "Hướng dẫn",
                            closeOnClickOutside: false,
                            text: 'Tài khoản của bạn đang sử dụng mật khẩu tạm thời.\nHãy thay đổi mật khẩu của bạn.'
                        }).then(function() {
                            setCookie('user', response.RESULT[0].CUST_ID, 999);
                            setCookie('active', 'Y', 999);
                            window.location = "edit-pw.jsp";
                        });
                    }else if(response.RESULT[0].LEAVE_YN == "Y") {
                        swal({
                            button: "Xác nhận",
                            title: "Hướng dẫn",
                            closeOnClickOutside: false,
                            text: 'Tài khoản đã xoá.'
                        }).then(function() {
                            location.reload();
                        });
                    }else if(betweenDay > 90) {
                        swal({
                            button: "Xác nhận",
                            title: "Hướng dẫn",
                            closeOnClickOutside: false,
                            text: 'Đã hơn 90 ngày kể từ khi mật khẩu được thay đổi.\nVui lòng thay đổi mật khẩu của bạn tại MyPage.'
                        }).then(function() {
                            setCookie('user', response.RESULT[0].CUST_ID, 999);
                            setCookie('active', 'Y', 999);
                            window.location = "main.jsp";
                        });
                    }else {
                        window.location = "main.jsp";
                        setCookie('user', response.RESULT[0].CUST_ID, 999);
                        setCookie('active', 'Y', 999);
                    }
                }else {
                    swal({
                        button: "được rồi",
                        title: "Hướng dẫn",
                        closeOnClickOutside: false,
                        text: response.RET_MSG
                    });
                }
            }
        });
        return false;
    })
});