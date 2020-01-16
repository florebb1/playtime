<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<body>
<%@include file="/vietnam/layout/base_script.jsp"%>
<script>
    $(document).ready(function () {
        setCookie('user', null, -1);
        setCookie('web_id', null, -1);
        document.location.href='login.jsp';
    });
</script>
</body>
</fmt:bundle>
</html>
