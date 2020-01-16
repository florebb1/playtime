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
        <b><fmt:message key="message.admin2"/></b>
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
                            <input type="text" id="table_search" name="table_search" class="form-control pull-right" placeholder="Search">

                            <div class="input-group-btn">
                                <button type="button" class="btn btn-default" onclick="getList(1, true)"><i class="fa fa-search"></i></button>
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
                                <th><fmt:message key="message.admin8"/></th>
                                <th><fmt:message key="message.admin9"/></th>
                                <th><fmt:message key="message.admin10"/></th>
                            </tr>
                        </thead>
                        <tbody id="event_body" name="event_body"></tbody>
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer clearfix">
                    <div class="pull-left no-padding" id="page">
                        
                    </div>
                    <button class="btn btn-primary pull-right" type="button" onclick="document.location.href='event_view.jsp'"><fmt:message key="message.admin13"/></button>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../../include/pta_footer.jsp" %>

<script type="text/javascript">
$(function(){
    getList(1,true);
});

function eventView(eventId) {
    location.href = "event_view.jsp?eventId="+eventId;
}

function getList(num,refresh){
    var start = (num-1)*5;
    if(start > 0){
        start = start +1;
    }
    var end = num*5;
    var searchValue = $("#table_search").val();
    var COMP_CD = $("#COMP_CD").val();
    $.ajax({
        url : "../../api/pta_event_list.jsp",
        type : 'POST',
        dataType : 'JSON',
        data : {
            startNum : start,
            endNum : end,
            searchValue : searchValue,
            COMP_CD : COMP_CD
        },
        success : function(data) {
            console.log(data);
            var result = data.RESULT;
            var html = "";
            var total = 0;
            $.each(result,function(index, item){
                var regDtm = item.REG_DTM;
                var regDtmValue = regDtm.substring(0, 16);
                html += "<tr onclick='eventView("+item.EVENT_ID+")'>";
                html += "   <td>"+item.EVENT_ID+"</td>";
                if(item.THUMB_PATH != "" && item.THUMB_PATH != null){
                    html += "   <td><img src='"+item.THUMB_PATH+"' style='width:50px;height:50px' align=absmiddle> "+item.TITLE+"</td>";
                }else{
                    html += "   <td>"+item.TITLE+"</td>";
                }
                html += "   <td>"+(item.USE_INFO == "Y" ? "<fmt:message key="message.admin11"/>":"<fmt:message key="message.admin12"/>")+"</td>";
                html += "   <td>"+regDtmValue+"</td>";
                html += "</tr>";
                total = item.TOTAL_ROWS;
            });
            $("#event_body").html(html);

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