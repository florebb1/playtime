<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    if(session.getAttribute("id") == null || session.getAttribute("id") == "") {
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
            <b><fmt:message key="message.admin48"/></b>
        </h1>
        <ol class="breadcrumb"></ol>
    </section>
    <section class="content">
        <div class="box box-info">
            <div class="box-body">
                <form role="form" id="Aform" method="post">
                    <input type="hidden" name="faqId" value="" />
                    <% if(session.getAttribute("lang") != null) {%>
                        <% if(session.getAttribute("lang").equals("ko")){%>
                            <input type="hidden" id="COMP_CD" name="COMP_CD" value="010">
                        <%}else {%>
                            <input type="hidden" id="COMP_CD" name="COMP_CD" value="011">
                        <%}%>
                    <%}%>
                    <div class="form-group">
                        <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin49"/></b></label>
                        <input type="text" id="faqQ" name="faqQ" class="form-control">
                    </div>
                    <div class="form-group">
                        <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin50"/></b></label>
                        <div class="summernote"></div>
                        <%-- <textarea id="contsNote" name="contsNote" runat="server" class="summernote" clientIDMode="static"></textarea> --%>
                    </div>
                    <div class="form-group">
                        <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin20"/></b></label>
                        <div class="radio">
                            <label>
                                <input type="radio" name="useInfo" id="useInfoY" value="Y" checked>
                                <fmt:message key="message.admin11"/>
                            </label>
                            &nbsp;&nbsp;
                            <label>
                                <input type="radio" name="useInfo" id="useInfoN" value="N">
                                <fmt:message key="message.admin12"/>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin47"/></b></label>
                        <div class="radio">
                            <label><input type="radio" id="faqType1" name="faqType" value="01" checked><fmt:message key="message.admin51"/></label>&nbsp;&nbsp;
                            <label><input type="radio" id="faqType2" name="faqType" value="02"><fmt:message key="message.admin52"/></label>&nbsp;&nbsp;
                            <label><input type="radio" id="faqType3" name="faqType" value="03"><fmt:message key="message.admin53"/></label>&nbsp;&nbsp;
                            <label><input type="radio" id="faqType4" name="faqType" value="04"><fmt:message key="message.admin54"/></label>&nbsp;&nbsp;
                            <label><input type="radio" id="faqType5" name="faqType" value="05"><fmt:message key="message.admin55"/></label>&nbsp;&nbsp;
                        </div>
                    </div>
                    <div class="form-group" align="right">
                        <label>
                            <% if(request.getParameter("faqId") != "" && request.getParameter("faqId") != null){ %>
                                <button type="button" class="btn btn-block btn-default" onclick="newsModify()"><fmt:message key="message.admin25"/></button>
                            <% }else{ %>
                                <button type="button" class="btn btn-block btn-default" onclick="faqWrite()"><fmt:message key="message.admin13"/></button>
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

    // Javascript - request.getParameter
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
        <% if(request.getParameter("faqId") != "" && request.getParameter("faqId") != null){ %>
        // 공지 상세내용 출력
        $.ajax({
            url : "../../api/pta_faq_view.jsp",
            type : 'POST',
            dataType : 'JSON',
            data : { faqId : getParam("faqId") },
            success : function(data) {
                var result = data.RESULT;
                $("#faqQ").val(result.FAQ_Q);
                $('.summernote').summernote('code', result.FAQ_A);
                if(result.USE_INFO == 'N') $("#useInfoN").prop("checked", true);
                else $("#useInfoY").prop("checked", true);
                if(result.FAQ_TYPE == "01") {
                    $("#faqType1").prop("checked", true);
                }else if(result.FAQ_TYPE == "02") {
                    $("#faqType2").prop("checked", true);
                }else if(result.FAQ_TYPE == "03") {
                    $("#faqType3").prop("checked", true);
                }else if(result.FAQ_TYPE == "04") {
                    $("#faqType4").prop("checked", true);
                }else if(result.FAQ_TYPE == "05") {
                    $("#faqType5").prop("checked", true);
                }
            }
        });
        <% } %>
    });
    
    // 공지 수정처리
    function newsModify() {
        var datas = {
            faqId : getParam("faqId"),
            faqQ : $("#faqQ").val(),
            faqA : $('.summernote').summernote('code'),
            useInfo : $('input[name="useInfo"]:checked').val(),
            faqType : $('input[name="faqType"]:checked').val(),
            COMP_CD : $('input[name="COMP_CD"]').val()
        };
        $.ajax({
            url : "/admin/api/pta_faq_modify.jsp",
            type : 'POST',
            dataType : 'JSON',
            data : datas,
            success : function(data) {
                console.log(data);
                var result = data;
                if(result.RET_CD == '0001') {
                    location.href="faq_list.jsp";
                } else {
                    alert("fail");
                }
            }
        });
    }

    function faqWrite(){
        var datas = {
            faqQ : $("#faqQ").val(),
            faqA : $('.summernote').summernote('code'),
            useInfo : $('input[name="useInfo"]:checked').val(),
            faqType : $('input[name="faqType"]:checked').val(),
            COMP_CD : $('input[name="COMP_CD"]').val()
        };
        $.ajax({
            url : "../../api/pta_faq_write.jsp",
            type : 'POST',
            dataType : 'JSON',
            data : datas,
            success : function(response) {
                console.log(response);
                if(response.RET_CD == '0001') {
                    location.href = 'faq_list.jsp';
                } else {
                    alert("fail");
                }
            }
        });
    }
</script>
</body>
</fmt:bundle>
</html>