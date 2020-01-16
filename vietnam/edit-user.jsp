<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<style>
    .signUpCont {
        min-height: calc(100vh - 130px);
    }
    @media only screen and (-webkit-device-pixel-ratio: 3) and (max-device-height: 812px) and (min-device-width: 375px) {
        header {
            margin-top: 80px;
        }
        .signUpCont {
            min-height: calc(100vh - 170px);
        }
    }
</style>
<body>

    <div class="signUpCont">
        <header>
            <div class="d-flex my-5">
                <div class="col align-self-center"><a href="mypage.jsp" class="text-dark"><i class="icon-left-arrow fs-20 font-weight-bold"></i></a></div>
                <div class="col-8 text-center font-weight-bold fs-18"><fmt:message key="message.edit1"/></div>
                <div class="col"></div>
            </div>
        </header>

        <form id="editForm" method="post">
            <input type="hidden" name="COMP_CD" value="011">
            <input type="hidden" name="CUST_ID">
            <input type="hidden" name="CUST_STAT" value="02">
            <input type="hidden" name="LOGIN_DIV" value="A">
            <input type="hidden" name="CUST_WEB_ID">

            <%-- 회원 수정 문구 --%>
            <div class="login-box info-box py-5 font-weight-bold text-center"><fmt:message key="message.edit2"/></div>
            <%-- 회원 인증 입력창 --%>
            <div class="info-box pt-3"><input type="password" name="CUST_PW" class="w-100 login-input mt-4" placeholder="<fmt:message key="message.edit3"/>"></div>
        </form>
    </div>

    <%-- 하단 버튼 --%>
    <button id="editBtn" type="button" class="position-relative w-100 text-center bg-yellow-color border-0 text-white fs-15 bottom-btn"><fmt:message key="message.edit4"/></button>

<%@include file="/vietnam/layout/base_script.jsp"%>
<script>
    $(document).ready(function(){
        var user = getCookie('user');
        $("input[name=CUST_ID]").val(user);
        userCheck(user);

        $("#editBtn").click(function(){
            if($("#CUST_PW").val() == "") {
                swal({
                    button: "Xác nhận",
                    title: "Hướng dẫn",
                    text: "Vui lòng nhập mật khẩu",
                    closeOnClickOutside: false
                });
                return false;
            }
            var datas = $("#editForm").serialize();
            $.ajax({
                url : '/vietnam/api/mbl_0400.jsp',
                type : 'POST',
                dataType : 'JSON',
                data : datas,
                success:function(response) {
                    console.log(response);
                    if(response.RET_CD == "0001") {
                        document.location.href='sign-edit.jsp';
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
    function userCheck(user){
        var datas = $("#editForm").serialize();
        console.log(datas);
        $.ajax({
            url : "/vietnam/api/mbl_0500.jsp",
            type : 'POST',
            dataType : 'JSON',
            data : datas,
                success:function(response){
                console.log(response);
                    if(response.RET_CD != "0001" || response.RESULT[0].CUST_STAT != 2) {
                        // document.location.href="logout.jsp";
                    }else {
                        $("input[name=CUST_WEB_ID]").val(response.RESULT[0].CUST_WEB_ID);
                    }
                }
        });
    }
</script>
</body>
</fmt:bundle>
</html>
