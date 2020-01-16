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
        <ol class="breadcrumb"> </ol>
    </section>
    <section class="content">
        <div class="box box-info">
            <div class="box-body">
                <form role="form" id="Aform" method="post">
                    <div class="form-group">
                        <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin42"/></b></label>
                        <input type="text" id="termsType" name="termsType" class="form-control" placeholder="" readonly>
                        <% if(session.getAttribute("lang") != null) { %>
                            <% if(session.getAttribute("lang").equals("ko")){%>
                                <input type="hidden" id="COMP_CD" name="COMP_CD" value="010">
                            <%}else {%>
                                <input type="hidden" id="COMP_CD" name="COMP_CD" value="011">
                            <%}%>
                        <%}%>
                    </div>
                    <div class="form-group">
                        <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin44"/></b></label>
                        <div class="summernote"></div>
                        <%-- <textarea id="contsNote" name="contsNote" runat="server" class="summernote" clientIDMode="static"></textarea> --%>
                    </div>

                    <div class="form-group" align="right">
                        <label>
                            <% if(request.getParameter("termsId") != "" && request.getParameter("termsId") != null){ %>
                                <button type="button" class="btn btn-block btn-default" onclick="termsModify()"><fmt:message key="message.admin25"/></button>
                            <% }else{ %>
                                <button type="button" class="btn btn-block btn-default" onclick="termsWrite()"><fmt:message key="message.admin13"/></button>
                            <% } %>
                        </label>
                        <label>
                            <button type="button" class="btn btn-block btn-default" onclick="history.back();"><fmt:message key="message.admin26"/></button>
                        </label>
                    </div>
                </form>
            </div>
        </div>
    </section>

<%@ include file="../../include/pta_footer.jsp" %>

<script type="text/javascript">

    var getParam = function(key) {
        var _parammap = {};
        document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function () {
            function decode(s) {
                return decodeURIComponent(s.split("+").join(" "));
            }
            _parammap[decode(arguments[1])] = decode(arguments[2]);
        });
        return _parammap[key];
    };

    $(function(){
        // 써머노트 설정
        $('.summernote').summernote({
            height: 430,                 
            minHeight: null,            
            maxHeight: null,             
            focus: false,                  
            lang: 'ko-KR',
            placeholder: 'Contents',
            hint: {
                match: /:([\-+\w]+)$/,
                search: function (keyword, callback) {
                    callback($.grep(emojis, function (item) {
                        return item.indexOf(keyword) === 0;
                    }));
                },
                template: function (item) {
                    var content = emojiUrls[item];
                    return '<img src="' + content + '" width="20" /> :' + item + ':';
                },
                content: function (item) {
                    var url = emojiUrls[item];
                    if (url) {
                        return $('<img />').attr('src', url).css('width', 20)[0];
                    }
                    return '';
                }
            }
        });
        <% if(request.getParameter("termsId") != "" && request.getParameter("termsId") != null){ %>
        $.ajax({
            url : "../../api/pta_terms_view.jsp",
            type : 'POST',
            dataType : 'JSON',
            data : { termsId : getParam("termsId") },
            success : function(data) {
                var result = data.RESULT;
                if(result.TERMS_TYPE == "01") {
                    $("#termsType").val("서비스 이용");
                }else if(result.TERMS_TYPE == "02") {
                    $("#termsType").val("개인정보 수집");
                }else if(result.TERMS_TYPE == "03") {
                    $("#termsType").val("마케팅/광고 수신");
                }else if(result.TERMS_TYPE == "04") {
                    $("#termsType").val("개인정보처리방침");
                }else if(result.TERMS_TYPE == "05") {
                    $("#termsType").val("이용약관");
                }
                $('.summernote').summernote('code', result.TERMS_CONTS);
            }
        });
        <% } %>
    });
    
    // 약관 내용 수정처리
    function termsModify() {
        var datas = {
            termsId : getParam("termsId"),
            termsConts : $('.summernote').summernote('code')
        };
        // console.log(datas);
        $.ajax({
            url : "/admin/api/pta_terms_modify.jsp",
            type : 'POST',
            dataType : 'JSON',
            data : datas,
            success : function(data) {
                console.log(data);
                var result = data;
                if(result.RET_CD == '0001') {
                    alert("수정 완료!");
                    location.href="terms_list.jsp";
                } else {
                    alert("수정 실패!");
                }
            }, error : function(error){
                console.log(error)
            }
        });
    }

</script>
</body>
</fmt:bundle>
</html>