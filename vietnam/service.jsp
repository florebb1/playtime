<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<body class="overflow-auto">
    <header class="h-auto">
        <div class="d-flex py-5">
            <div class="col align-self-center"><a href="mypage.jsp"><i class="icon-left-arrow fs-20 font-weight-bold text-dark"></i></a></div>
            <div class="col-8 text-center font-weight-bold fs-20"><fmt:message key="message.policy1"/></div>
            <div class="col"></div>
        </div>
    </header>

    <%-- 회사명칭 --%>
    <div class="text-center fs-20 my-5"><fmt:message key="message.policy2"/></div>

    <%-- 내용 --%>
    <div id="contents" class="info-box"></div>

<%@include file="/vietnam/layout/base_script.jsp"%>
<script>
    $(document).ready(function(){
        // 관리자 약관동의 내역
        $.ajax({
            url : '/vietnam/api/mbl_ADM_0007.jsp?COMP_CD=011',
            type : 'POST',
            dataType : 'JSON',
            success:function(response){
                if(response.RET_CD == "0001") {
                    for (var i = 0; i < response.RESULT.length; i++) {
                        if(response.RESULT[i].TERMS_TYPE == "05") {
                            $('#contents').html(response.RESULT[i].TERMS_CONTS);
                        }
                    }
                }
            }
        });
    });
</script>
</body>
</fmt:bundle>
</html>
