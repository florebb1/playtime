$(document).ready(function(){
    var cookie = getCookie('user');
    $('input[name=CUST_ID]').val(cookie);
    var datas = $("#ratingForm").serialize();
    $.ajax({
        url : '/vietnam/api/mbl_0500.jsp',
        type : 'POST',
        dataType : 'JSON',
        data : datas,
        success:function(response){
            console.log(response);
            if(response.RET_CD == "0001") {
                if(response.RESULT[0].LVL_CD == "101") {
                    $('#welcome').removeClass("d-none");
                }else if(response.RESULT[0].LVL_CD == "102") {
                    $('#friend').removeClass("d-none");
                }else if(response.RESULT[0].LVL_CD == "103") {
                    $('#family').removeClass("d-none");
                }else if(response.RESULT[0].LVL_CD == "104") {
                    $('#vip').removeClass("d-none");
                }
            }else {
                swal({
                    button: "Xác nhận",
                    title: "Hướng dẫn",
                    closeOnClickOutside: false,
                    text: response.RET_MSG
                }).then(function() {
                    window.location = "mypage.jsp";
                });
            }
        }
    });
});