<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    if(session.getAttribute("id") == null) {
        if(request.getParameter("id") == null) {
            response.sendRedirect("../../login.jsp");
        }else {
            session.setAttribute("id", request.getParameter("id"));
            session.setAttribute("lang", request.getParameter("lang"));
        }
    }
%>
<% if(session.getAttribute("lang") != null) {%>
    <% if(session.getAttribute("lang").equals("ko")){%>
        <fmt:setLocale value="ko"/>
    <%}else {%>
        <fmt:setLocale value="vi"/>
    <%}%>
<%}%>
<fmt:bundle basename="/com.properties.message">
<%@ include file="../../include/pta_top.jsp" %>

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <b><fmt:message key="message.admin4"/></b>
        </h1>
        <ol class="breadcrumb"></ol>
    </section>
    <section class="content">
        <div class="box box-info">
            <div class="box-body">
                <form role="form" id="Aform" method="post">
                    <% if(session.getAttribute("lang") != null) { %>
                        <% if(session.getAttribute("lang").equals("ko")){%>
                            <input type="hidden" id="COMP_CD" name="COMP_CD" value="010">
                        <%}else {%>
                            <input type="hidden" id="COMP_CD" name="COMP_CD" value="011">
                        <%}%>
                    <%}%>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin35"/></b></label>
                                <select id="storeType" name="storeType" class="form-control select2" style="width: 100%;">
                                    <option value="01"><fmt:message key="message.admin45"/></option>
                                    <option value="02"><fmt:message key="message.admin46"/></option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin36"/></b></label>
                                <select id="storeInputBrand" name="storeInputBrand" class="form-control select2" style="width: 100%;"></select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin37"/></b></label>
                                <input type="text" id="storeName" name="storeName" class="form-control" placeholder="Store Name">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin38"/></b></label>
                        <input type="text" id="storeAddr" name="storeAddr" class="form-control" placeholder="Store address">
                    </div>
                    <div class="form-group">
                        <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin39"/></b></label>
                        <input type="text" id="storeTel" name="storeTel" class="form-control" placeholder="Store phone number">
                    </div>
                    <div class="form-group" align="right">
                        <label>
                            <button type="button" id="storeBtn" class="btn btn-block btn-default"><fmt:message key="message.admin13"/></button>
                        </label>
                    </div>
                </form>
            </div>
        </div>
    </section>

<%@ include file="../../include/pta_footer.jsp" %>

<script type="text/javascript">
    $(function() {
        var COMP_CD = $("input[name=COMP_CD]").val();
        // 신규 매장 정보 출력
        $.ajax({
            url: "/admin/api/pta_store_view.jsp?COMP_CD="+COMP_CD,
            type: 'POST',
            dataType: 'JSON',
            success: function (response) {
                if(Object.keys(response.RESULT).length != 0) {
                    $("#storeType").val(response.RESULT.STORE_TYPE).select2();
                    $("#storeName").val(response.RESULT.STORE_NAME);
                    $("#storeAddr").val(response.RESULT.STORE_ADDR);
                    $("#storeTel").val(response.RESULT.STORE_TEL);
                    $("#storeInputBrand").val(response.RESULT.STORE_INPUT_BRAND).trigger("change");
                }
            }
        });
        // 브랜드 검색
        var datas = $('#Aform').serialize();
        $.ajax({
            url: '/vietnam/api/mbl_0720.jsp',
            type: 'POST',
            dataType: 'JSON',
            data: datas,
            success: function (response) {
                var result = "";
                if (response.RET_CD == '0001') {
                    for (var i = 0; i < response.RESULT.length; i++) {
                        if (response.RESULT[i].BRAND_CD != "999")
                            result += "<option value=" + response.RESULT[i].BRAND_CD + ">" + response.RESULT[i].BRAND_NM + "</option>"
                    }
                    $("#storeInputBrand").append(result);
                    $("#storeInputBrand").children("label").text($("#storeInputBrand option:selected").text());
                }
            }
        });

        // 매장 정보 저장
        $("#storeBtn").click(function () {
            var datas = $('#Aform').serialize();
            $.ajax({
                url: "/admin/api/pta_store_modify.jsp",
                type: 'POST',
                dataType: 'JSON',
                data: datas,
                success: function (response) {
                    if (response.RET_CD == '0001') {
                        alert("complete");
                        location.reload();
                    } else {
                        alert("fail");
                    }
                }
            });
        });

    });
</script>
</body>
</fmt:bundle>
</html>