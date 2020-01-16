$(document).ready(function(){
    // 이름 공백문자 방지
    $("input[name=CUST_NM]").keyup(function(){
        userName = $(this).val().trim();
        $("input[name=CUST_NM]").val(userName);
    });
    // api 연결
    $("#findIdBtn").click(function(){
        var url = "/vietnam/api/mbl_0420.jsp";
        var datas = $("#findIdForm").serialize();
        $.ajax({
            url : url,
            type : 'POST',
            dataType : 'JSON',
            data : datas,
            success : function(response) {
                console.log(response);
                if (response.RET_CD == "0001") {
                    document.location.href="find-id2.jsp?id="+response.RESULT[0].CUST_WEB_ID;
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