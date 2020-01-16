<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="./include/pta_top.jsp" %>
<jsp:include page="./include/pta_left.jsp"></jsp:include>

<% if(session.getAttribute("id") == null) { %>
<%    response.sendRedirect("login.jsp");   %>
<% }                                        %>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        <b>공지 관리</b>
    <%--
        <small>Notice Editer</small>
     --%>
    </h1>
    <ol class="breadcrumb">
    <%--     
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Layout</a></li>
        <li class="active">Boxed</li>
     --%>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title"></h3>
                    <div class="box-tools">
                        <div class="input-group input-group-sm" style="width: 150px;">
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
                                <th>번호</th>
                                <th>제목</th>
                                <th>사용여부</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody id="noti_body" name="noti_body"></tbody>
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer clearfix">
                    <ul class="pagination pagination-sm no-margin pull-right">
                        <li><a href="#">&laquo;</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul>
                </div>
            </div>
            <!-- /.box -->
        </div>
    </div>
</section>

<%@ include file="./include/pta_footer.jsp" %>

<script type="text/javascript">
$(function(){
    $.ajax({
        url : "./api/pta_notice_list.jsp",
        type : 'POST',
        dataType : 'JSON',
        data : {},
        success : function(data) {
            var result = data.RESULT;
            var html = "";
            $.each(result,function(index, item){
                var regDtm = item.REG_DTM;
                var regDtmValue = regDtm.substring(0, 16);
                html += "<tr>";
                html += "   <td>"+item.NOTI_ID+"</td>";
                html += "   <td>"+item.TITLE+"</td>";
                html += "   <td>"+item.USE_INFO+"</td>";
                html += "   <td>"+regDtmValue+"</td>";
                html += "</tr>";
            });
            $("#noti_body").append(html);
        }
    });
});
</script>