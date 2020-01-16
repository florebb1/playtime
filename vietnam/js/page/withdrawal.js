$(document).ready(function(){
    var user = getCookie('user');
    userCheck(user);

    $("#dleBtn").click(function(){
        if($("input[name=LEAVE_RMK]").val() == "") {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                text: "Vui lòng nhập lý do rút tiền",
                closeOnClickOutside: false
            });
            return false;
        }

        var datas = $("#delForm").serialize();
        swal({
            title: "Hướng dẫn",
            text: "Sau khi xoá bỏ tài khoản 2 tháng thì không thể đăng ký lại.\nBạn có chắc chắn muốn xoá bỏ tài khoản hội viên không?",
            buttons: ["Huỷ bỏ", "Xác nhận"],
            dangerMode: true,
            closeOnClickOutside: false
        }).then((willDelete) => {
            if (willDelete) {
                $.ajax({
                    url : "/vietnam/api/mbl_0300.jsp",
                    type : 'POST',
                    data : datas,
                    dataType : 'JSON',
                    success:function(response){
                        console.log(response);
                        if(response.RET_CD == "0001") {
                            swal("Xoá bỏ tài khoản hội viên được hoàn tất ", {
                                icon: "success",
                                closeOnClickOutside: false,
                                buttons: "Xác nhận"
                            }).then(function() {
                                window.location = "logout.jsp";
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
            } else {
                window.location = "setting.jsp";
    }
    });
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
                    $("input[name=CUST_ID]").val(response.RESULT[0].CUST_ID);
                    $("input[name=CUST_WEB_ID]").val(response.RESULT[0].CUST_WEB_ID);
                }
            }else if(response.RET_CD == "0170"){
                document.location.href="logout.jsp";
            }
        }
    });
}