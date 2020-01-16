$(document).ready(function(){
    // 이름 공백문자 방지
    $("input[name=CUST_NM]").keyup(function(){
        userName = $(this).val().trim();
        $("input[name=CUST_NM]").val(userName);
    });
    // api 연결
    $("#findPwBtn").click(function(){
        var url = "/vietnam/api/mbl_0100.jsp";
        var datas = $("#findPwForm").serialize();
        $.ajax({
            url : url,
            type : 'POST',
            dataType : 'JSON',
            data : datas,
            success : function(response) {
                if (response.RET_CD == "0001") {
                    document.location.href="find-pw2.jsp?name="+response.RESULT[0].CUST_NM+"&mobile="+response.RESULT[0].MOBILE;
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
        return false;
    });
});