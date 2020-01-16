$(document).ready(function(){
    // 이름 + 연락처 기존 정보 확인
    $("#findBtn").click(function () {
        var datas = $("#findIdForm").serialize();
        $.ajax({
            url : '/vietnam/api/mbl_0100.jsp',
            type : 'POST',
            dataType : 'JSON',
            data : datas,
                success:function(response){
                    console.log(response);
                    if(response.RET_CD == "0001") {
                        if(response.RESULT[0].MEMB_YN =="Y") {
                            swal({
                                button: "Xác nhận",
                                title: "Hướng dẫn",
                                closeOnClickOutside: false,
                                text: "ID đã được đăng ký"
                            });
                        }else {
                            swal({
                                button: "Xác nhận",
                                title: "Hướng dẫn",
                                closeOnClickOutside: false,
                                text: "Chúng tôi sẽ tiến hành đăng ký với thông tin thành viên đã được phê duyệt"
                            }).then(function() {
                                var BRAND_CD = response.RESULT[0].BRAND_CD;
                                var BRAND_NM = response.RESULT[0].BRAND_NM;
                                var CUST_ID = response.RESULT[0].CUST_ID;
                                var STOR_CD = response.RESULT[0].STOR_CD;
                                var STOR_NM = response.RESULT[0].STOR_NM;
                                var CUST_NM = response.RESULT[0].CUST_NM;
                                var MOBILE = response.RESULT[0].MOBILE;
                                window.location = "sign-up2-a.jsp?BRAND_CD="+BRAND_CD+"&BRAND_NM="+BRAND_NM+"&CUST_ID="+CUST_ID+"&STOR_CD="+STOR_CD+"&STOR_NM="+STOR_NM+"&CUST_NM="+CUST_NM+"&MOBILE="+MOBILE;
                            });
                        }
                    }else {
                        swal({
                            button: "Xác nhận",
                            title: "Hướng dẫn",
                            text: response.RET_MSG,
                            closeOnClickOutside: false
                        });
                    }
                }
        });
    });
});