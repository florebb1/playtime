$(document).ready(function(){
    var name = get('name');
    var mobile = get('mobile');
    $('input[name=CUST_NM]').val(name);
    $('input[name=MOBILE]').val(mobile);

    // 이메일 수정버튼 클릭시 이벤트
    $('#editBtn').click(function(){
        var email = $('input[name=EMAIL]');
        if(email.hasClass('bg-ddd-color')) {
            email.removeClass('bg-ddd-color');
            email.attr('readonly', false);
        }else {
            email.val('');
            email.addClass('bg-ddd-color');
            email.attr('readonly', true);
        }
    });

    // 아이디 입력시 이메일 자동추가 이벤트
    $('input[name=CUST_WEB_ID]').change(function(){
        var id = $(this).val();
        if(validateEmail(id)) {
            $('input[name=EMAIL]').val(id);
        }
    });

    // 확인버튼 클릭시 이벤트
    $("#findPwBtn").click(function(){
        var url = "/vietnam/api/mbl_0420.jsp";
        var datas = $("#findPwForm").serialize();
        $.ajax({
            url : url,
            type : 'POST',
            dataType : 'JSON',
            data : datas,
            success : function (response) {
                console.log(response);
                if(response.RET_CD == "0001") {
                    swal({
                        button: "Xác nhận",
                        title: "Hướng dẫn",
                        text: 'Mật khẩu tạm thời đã được gửi đến email của bạn',
                        closeOnClickOutside: false
                    }).then(function() {
                        window.location = "login.jsp";
                    });
                }else {
                    swal({
                        button: "Xác nhận",
                        title: "Hướng dẫn",
                        text: response.RET_MSG,
                        closeOnClickOutside: false
                    });
                }
            },error: function(error){
                swal({
                    button: "Xác nhận",
                    title: "Hướng dẫn",
                    text: 'Xảy ra lỗi khi tạo mật khẩu\nNếu lỗi vẫn còn vui lòng liên hệ với người phụ trách.',
                    closeOnClickOutside: false
                });
            }
        });
    });

});
