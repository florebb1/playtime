<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="com.properties.message">
<%@include file="/layout/base_style.jsp"%>
<body>
<form id="human" name="human" method="post">
    <input type="hidden"  name="COMP_CD"      value="011">
    <input type="hidden"  name="CUST_STAT"    value="02">
    <input type="hidden"  id="CUST_WEB_ID"    name="CUST_WEB_ID">
</form>
<%@include file="/layout/base_script.jsp"%>
<script>
    $(document).ready(function () {
        var id = get("CUST_WEB_ID");
        $("#CUST_WEB_ID").val(id);
        var datas = $('#human').serialize();
        $.ajax({
            url : "/api/mbl_0300.jsp",
            type : 'POST',
            data : datas,
            dataType : 'JSON',
            success:function(response){
                if(response.RET_CD == "0001") {
                    setCookie('user', response.RESULT[0].CUST_ID, 999);
                    setCookie('active', 'Y', 999);
                    document.location.href='main.jsp';
                }else {
                    swal({
                        button: "Xác nhận",
                        title: "Hướng dẫn",
                        closeOnClickOutside: false,
                        text: response.RET_MSG
                    }).then(function() {
                        setCookie('user', null, -1);
                        window.location = "/login.jsp";
                    });
                }
            }
        });
    });
</script>
</body>
</fmt:bundle>
</html>
