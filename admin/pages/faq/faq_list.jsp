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
            <b><fmt:message key="message.admin5"/></b>
        </h1>
        <ol class="breadcrumb"></ol>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title"></h3>
                        <div class="box-tools">
                            <div class="input-group input-group-sm" style="width: 150px;">
                                <% if(session.getAttribute("lang") != null) {%>
                                    <% if(session.getAttribute("lang").equals("ko")){%>
                                        <input type="hidden" id="COMP_CD" name="COMP_CD" value="010">
                                    <%}else {%>
                                        <input type="hidden" id="COMP_CD" name="COMP_CD" value="011">
                                    <%}%>
                                <%}%>
                                <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                                <div class="input-group-btn">
                                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th><fmt:message key="message.admin7"/></th>
                                    <th><fmt:message key="message.admin47"/></th>
                                    <th><fmt:message key="message.admin40"/></th>
                                    <th><fmt:message key="message.admin41"/></th>
                                    <th><fmt:message key="message.admin10"/></th>
                                </tr>
                            </thead>
                            <tbody id="faq_body" name="faq_body"></tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer clearfix">
                        <div class="pull-left no-padding" id="page">

                        </div>
                        <button class="btn btn-primary pull-right" type="button" onclick="document.location.href='faq_view.jsp'">등록</button>
                    </div>
                </div>
                <!-- /.box -->
            </div>
        </div>
    </section>

<%@ include file="../../include/pta_footer.jsp" %>

<script type="text/javascript">
$(function(){
    getList(1,true);
});

function faqView(faqId) {
    location.href = "faq_view.jsp?faqId="+faqId;
}

function getList(num, refresh) {
    var start = (num-1)*5;
    if(start > 0){
        start = start +1;
    }
    var end = num*5;
    var COMP_CD = $("#COMP_CD").val();
    $.ajax({
        url : "../../api/pta_faq_list.jsp",
        type : 'POST',
        dataType : 'JSON',
        data : {
            startNum : start,
            endNum : end,
            COMP_CD : COMP_CD
        },
        success : function(data) {
            var result = data.RESULT;
            var html = "";
            var total = 0;
            $.each(result,function(index, item){
                var regDtm = item.REG_DTM;
                var regDtmValue = regDtm.substring(0, 16);
                html += "<tr onclick='faqView("+item.FAQ_ID+")'>";
                html += "   <td>"+item.FAQ_ID+"</td>";
                if(item.FAQ_TYPE == "01") {
                    html += "   <td><fmt:message key="message.admin51"/></td>";
                } else if(item.FAQ_TYPE == "02") {
                    html += "   <td><fmt:message key="message.admin52"/></td>";
                }  else if(item.FAQ_TYPE == "03") {
                    html += "   <td><fmt:message key="message.admin53"/></td>";
                } else if(item.FAQ_TYPE == "04") {
                    html += "   <td><fmt:message key="message.admin54"/></td>";
                } else if(item.FAQ_TYPE == "05") {
                    html += "   <td><fmt:message key="message.admin55"/></td>";
                } else {
                    html += "   <td>unknown</td>";
                }
                html += "   <td>"+item.FAQ_Q+"</td>";
                html += "   <td>"+item.USE_INFO+"</td>";
                html += "   <td>"+regDtmValue+"</td>";
                html += "</tr>";
                total = item.TOTAL_ROWS;
            });
            $("#faq_body").html(html);
            if(refresh){
                $('#page').bootpag({
                    total: Math.ceil(total/5),          // total pages
                    page: num,            // default page
                    maxVisible: 5,     // visible pagination
                }).on("page", function(event, num2){
                    getList(num2,false);
                });
            }
        }
    });
}
</script>
</body>
</fmt:bundle>
</html>