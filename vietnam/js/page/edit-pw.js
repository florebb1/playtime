$(document).ready(function(){
    var user = getCookie('user');
    userCheck(user);

    $("#editBtn").click(function(){
        if($("input[name=CUST_PW_BEF]").val() == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: "Vui lòng nhập mật khẩu hiện tại",
                closeOnClickOutside: false
            });
            return false;
        }else if($("input[name=CUST_PW_AFT]").val() == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: "Vui lòng nhập mật khẩu tạm thời",
                closeOnClickOutside: false
            });
            return false;
        }else if($("#CUST_PW_AFT").val() != $("#CUST_PW_AFT2").val()) {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: "Vui lòng xác nhận mật khẩu tạm thời",
                closeOnClickOutside: false
            });
            return false;
        }

        var datas = $("#editPwForm").serialize();
        console.log(datas);
        $.ajax({
            url : '/vietnam/api/mbl_0410.jsp',
            type : 'POST',
            dataType : 'JSON',
            data : datas,
                success:function(response) {
                    if(response.RET_CD == "0001") {
                        swal({
                            button: "Xác nhận",
                            title: "Hướng dẫn",
                            text: "Mật khẩu đã được thay đổi",
                            closeOnClickOutside: false
                        }).then(function() {
                            window.location = "mypage.jsp";
                        });
                    }else {
                        swal({
                            button: "Xác nhận",
                            title: "Hướng dẫn",
                            text: response.RET_MSG,
                            closeOnClickOutside: false
                        });
                    }
                }
        })
    });
});
function userCheck(userId){
    $.ajax({
        url : "/vietnam/api/mbl_0500.jsp?COMP_CD=011&CUST_ID="+userId,
        type : 'POST',
        dataType : 'JSON',
        success:function(response){
            if(response.RET_CD == "0001") {
                if (response.RESULT[0].CUST_STAT != null) {
                    $("input[name=CUST_WEB_ID]").val(response.RESULT[0].CUST_WEB_ID);
                }
            }else if(response.RET_CD == "0170"){
                document.location.href="logout.jsp";
            }
        }
    });
}