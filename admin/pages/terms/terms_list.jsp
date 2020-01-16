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
            <b><fmt:message key="message.admin6"/></b>
        </h1>
        <ol class="breadcrumb"></ol>
    </section>
    <section class="content">
        <% if(session.getAttribute("lang") != null) { %>
            <% if(session.getAttribute("lang").equals("ko")){%>
                <input type="hidden" id="COMP_CD" name="COMP_CD" value="010">
            <%}else {%>
                <input type="hidden" id="COMP_CD" name="COMP_CD" value="011">
            <%}%>
        <%}%>
        <div class="row">
            <div class="col-xs-12">
                <div class="box box-info">
                    <div class="box-header with-border"></div>
                    <!-- /.box-header -->
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th><fmt:message key="message.admin7"/></th>
                                    <th><fmt:message key="message.admin42"/></th>
                                    <th><fmt:message key="message.admin43"/></th>
                                </tr>
                            </thead>
                            <tbody id="terms_body" name="terms_body"></tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer clearfix">
                        <%-- <div class="pull-left no-padding" id="page"></div> --%>
                        <%-- <button class="btn btn-primary pull-right" type="button" onclick="document.location.href='terms_view.jsp'">등록</button> --%>
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

function termsView(termsId) {
    location.href = "terms_view.jsp?termsId="+termsId;
}

function getList(num, refresh) {
    var start = (num-1)*5;
    if(start > 0){
        start = start +1;
    }
    var end = num*5;
    var COMP_CD = $("#COMP_CD").val();
    $.ajax({
        url : "../../api/pta_terms_list.jsp",
        type : 'POST',
        dataType : 'JSON',
        data : {
            startNum : start,
            endNum : end,
            COMP_CD : COMP_CD
        },
        success : function(response) {
            var nation = "<%=session.getAttribute("lang")%>";
            var html = "";
            var total = 0;
            if (response.RESULT.length != 0){
                console.log(response);
                for (var i = 0; i < response.RESULT.length; i++) {
                    var udtDtm = response.RESULT[i].UDT_DTM;
                    if(udtDtm != null) {
                        var udtDtmValue = udtDtm.substring(0, 16);
                    }else {
                        var udtDtmValue = response.RESULT[i].REG_DTM.substring(0, 16);
                    }
                    html += "<tr onclick='termsView("+response.RESULT[i].TERMS_ID+")'>";
                    html += "   <td>"+response.RESULT[i].TERMS_ID+"</td>";
                    if(nation == "ko") {
                        if(response.RESULT[i].TERMS_TYPE == "01") {
                            html += "   <td>서비스 이용(회원가입)</td>";
                        }else if(response.RESULT[i].TERMS_TYPE == "02") {
                            html += "   <td>개인정보 수집(회원가입)</td>";
                        }else if(response.RESULT[i].TERMS_TYPE == "03") {
                            html += "   <td>마케팅/광고 수신(회원가입)</td>";
                        }else if(response.RESULT[i].TERMS_TYPE == "04") {
                            html += "   <td>개인정보처리방침(마이페이지)</td>";
                        }else if(response.RESULT[i].TERMS_TYPE == "05") {
                            html += "   <td>이용약관(마이페이지)</td>";
                        }
                    }else {
                        if(response.RESULT[i].TERMS_TYPE == "01") {
                            html += "   <td>Chấp nhận điều khoản dịch vụ(sign)</td>";
                        }else if(response.RESULT[i].TERMS_TYPE == "02") {
                            html += "   <td>Cho phép thu thập và sử dụng thông tin cá nhân(sign)</td>";
                        }else if(response.RESULT[i].TERMS_TYPE == "03") {
                            html += "   <td>Đồng ý nhận tiếp thị và thông tin quảng cáo(sign)</td>";
                        }else if(response.RESULT[i].TERMS_TYPE == "04") {
                            html += "   <td>Chính sách bảo mật thông tin cá nhân(mypage)</td>";
                        }else if(response.RESULT[i].TERMS_TYPE == "05") {
                            html += "   <td>Điều khoản sử dụng(mypage)</td>";
                        }
                    }
                        html += "   <td>"+udtDtmValue+"</td>";
                        html += "</tr>";
                        total = response.RESULT[i].TOTAL_ROWS;
                }
                $("#terms_body").html(html);
                if(refresh) {
                    $('#page').bootpag({
                        total: Math.ceil(total/5),          // total pages
                        page: num,            // default page
                        maxVisible: 5,     // visible pagination
                    }).on("page", function(event, num2){
                        getList(num2,false);
                    });
                }
            }
        }
    });
}
</script>
</body>
</fmt:bundle>
</html>