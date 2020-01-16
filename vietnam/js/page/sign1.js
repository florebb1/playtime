$(document).ready(function(){
    // 관리자 약관동의 내역
    $.ajax({
        url : '/api/mbl_ADM_0007.jsp?COMP_CD=011',
        type : 'POST',
        dataType : 'JSON',
        success:function(response){
            console.log(response);
            if(response.RESULT.length != 0) {
                for (var i = 0; i < response.RESULT.length; i++) {
                    if(response.RESULT[i].TERMS_TYPE == "01") {
                        $('#se_ag').html(response.RESULT[i].TERMS_CONTS);
                    }else if(response.RESULT[i].TERMS_TYPE == "02") {
                        $('#pe_in').html(response.RESULT[i].TERMS_CONTS);
                    }else if(response.RESULT[i].TERMS_TYPE == "03") {
                        $('#ma_ag').html(response.RESULT[i].TERMS_CONTS);
                    }
                }
            }
        }
    });

    //전체 동의 버튼 클릭시
    $('#allAgree').click(function(){
        $(this).toggleClass('ag-active');
        $('.agree-t-box').toggleClass('ag-active');
        $('.icon-checked').toggleClass('text-white')
    });
    //각 항목별 동의 클릭시
    $('.agree-t-box').click(function(){
        $(this).toggleClass('ag-active');
        $(this).find('i').toggleClass('text-white');
        if($('#agContent1').hasClass('ag-active') && $('#agContent2').hasClass('ag-active') && $('#agContent3').hasClass('ag-active')) {
            $('#allAgree').toggleClass('ag-active');
        }else if ($('#allAgree').hasClass('ag-active')){
            $('#allAgree').removeClass('ag-active');
        }
    });
    //확인버튼 클릭시
    $('#agreeBtn').click(function() {
        if($('#agContent1').hasClass('ag-active') && $('#agContent2').hasClass('ag-active') && $('#agContent3').hasClass('ag-active')) {
            setCookie('sms', 'Y');
            document.location.href='sign-search.jsp';
        }else if($('#agContent1').hasClass('ag-active') && $('#agContent2').hasClass('ag-active')) {
            setCookie('sms', 'N');
            document.location.href='sign-search.jsp';
        }else {
            swal({
                button: "Xác nhận",
                title: "Hướng dẫn",
                closeOnClickOutside: false,
                text: "Vui lòng đồng ý các điều khoản sau đó đăng ký hội viên!"
            });
        }
    });
});