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
<fmt:bundle basename="com.properties.message">
<%@ include file="../../include/pta_top.jsp" %>

    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <b><fmt:message key="message.admin31"/></b>
        </h1>
        <ol class="breadcrumb"></ol>
    </section>
    <section class="content">
        <div class="box box-info">
            <div class="box-body">
                <form role="form" id="Aform" name="Aform" method="post" enctype="multipart/form-data" onsubmit="return mySubmit()">
                    <input type="hidden" id="newsId" name="newsId" value="" />
                    <% if(session.getAttribute("lang") != null) { %>
                        <% if(session.getAttribute("lang").equals("ko")){%>
                            <input type="hidden" id="COMP_CD" name="COMP_CD" value="010">
                        <%}else {%>
                            <input type="hidden" id="COMP_CD" name="COMP_CD" value="011">
                        <%}%>
                    <%}%>
                    <div class="form-group">
                        <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin32"/></b></label>
                        <input type="text" id="newsTitle" name="newsTitle" class="form-control" placeholder="Title">
                    </div>
                    <div class="form-group">
                        <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin16"/></b></label>
                        <div class="radio">
                            <label>
                                <% if(request.getParameter("newsId") != "" && request.getParameter("newsId") != null){ %>
                                    <input type="radio" name="linkType" id="linkType01" value="01">
                                    <fmt:message key="message.admin17"/>
                                <% }else{ %>
                                    <input type="radio" name="linkType" id="linkType01" value="01" checked>
                                    <fmt:message key="message.admin17"/>
                                <% } %>
                            </label>
                            &nbsp;&nbsp;
                            <label>
                                <input type="radio" name="linkType" id="linkType02" value="02">
                                    <fmt:message key="message.admin18"/>
                            </label>
                            <div id="linkUrlInput">
                                <input type="text" id="linkUrl" name="linkUrl" class="form-control" value="" placeholder="https:// 'Link Address' .com">
                            </div>
                        </div>
                    </div>
                    <div id="conts">
                        <div class="form-group">
                            <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin33"/></b></label>
                            <div class="summernote"></div>
                            <input type="hidden" id="contsNote" name="contsNote" value="" />
                            <%-- <textarea id="contsNote" name="contsNote" runat="server" class="summernote" clientIDMode="static"></textarea> --%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin34"/></b></label>
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
                        <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin21"/></b></label>
                        <div class="radio">
                            <label>
                                <input type="file" id="file" name="file" accept="image/*"/>
                                <% if(request.getParameter("newsId") != "" && request.getParameter("newsId") != null) { %>
                                <input type="text" id="thumbPath" name="thumbPath" class="form-control" value="" readonly />
                                <img src="" style="display:none;width:100px;height:100px" id="thumbimg">
                                <% } %>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="fa  fa-check-circle-o">&nbsp;<b><fmt:message key="message.admin24"/></b></label>
                        <div>
                            <input type="text" id="news_tag_01" name="news_tag_01" class="form-control" placeholder="# Hashtag - 01">
                        </div>
                        <div>
                            <input type="text" id="news_tag_02" name="news_tag_02" class="form-control" placeholder="# Hashtag - 02">
                        </div>
                        <div>
                            <input type="text" id="news_tag_03" name="news_tag_03" class="form-control" placeholder="# Hashtag - 03">
                        </div>
                    </div>
                    <div class="form-group" align="right">
                        <label>
                            <% if(request.getParameter("newsId") != "" && request.getParameter("newsId") != null){ %>
                                <%-- <button type="button" class="btn btn-block btn-default" onclick="newsModify()">수정</button> --%>
                                <button type="submit" class="btn btn-block btn-default" ><fmt:message key="message.admin25"/></button>
                            <% }else{ %>
                                <%-- <button type="button" class="btn btn-block btn-default" onclick="newsWrite()">등록</button> --%>
                                <button type="submit" class="btn btn-block btn-default" ><fmt:message key="message.admin13"/></button>
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

    $( document ).ready(function() {
        // 라디오 박스 value 체크 > input text enable / disable 처리
        linkChk();
        $("input[name=linkType]").change(function() {
            var linkTypeValue = $(":input:radio[name=linkType]:checked").val();
            if(linkTypeValue == "01") {
                $("#linkUrl").val("");
                $("#linkUrl").prop('disabled', true);
                $("#conts").show();
                $("#linkUrlInput").hide();
            } else {
                $("#linkUrl").prop('disabled', false);
                $("#linkUrlInput").show();
                $("#conts").hide();
            }
		});
    });

    function linkChk() {
        var linkTypeValue = $(':radio[name="linkType"]:checked').val();
        if(linkTypeValue == '01') {
            $("#linkUrl").prop('disabled', true);
            $("#conts").show();
            $("#linkUrlInput").hide();
        } else {
            $("#linkUrlInput").show();
            $("#conts").hide();
        }
    }

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

        <% if(request.getParameter("newsId") != "" && request.getParameter("newsId") != null){ %>
        // 뉴스 상세내용 출력
        $.ajax({
            url : "../../api/pta_news_view.jsp",
            type : 'POST',
            dataType : 'JSON',
            data : { newsId : getParam("newsId") },
            success : function(data) {
                var result = data.RESULT;
                console.log(data);
                $("#newsTitle").val(result.TITLE);
                $('.summernote').summernote('code', result.CONTS_NOTE);
                if(result.USE_INFO == 'N') $("#useInfoN").prop("checked", true);
                else $("#useInfoY").prop("checked", true);
                if(result.LINK_TYPE == '02') $("#linkType02").prop("checked", true);
                else $("#linkType01").prop("checked", true);
                linkChk();
                if(result.LINK_URL != null && result.LINK_URL != 'null') {
                    $("#linkUrl").val(result.LINK_URL);
                }
                if(result.THUMB_PATH != null && result.THUMB_PATH != ""){
                    $("#thumbimg").attr("src",result.THUMB_PATH);
                    $("#thumbimg").show();
                }
                $("#news_tag_01").val(result.NEWS_TAG_01);
                $("#news_tag_02").val(result.NEWS_TAG_02);
                $("#news_tag_03").val(result.NEWS_TAG_03);
                var thumbPath = result.THUMB_PATH;
                var thumbPathValue = thumbPath.substring(18);
                if(thumbPathValue != null && thumbPathValue != 'null') {
                    $("#thumbPath").val(thumbPathValue);
                }
            }
        });
        <% } %>
    });

    function mySubmit() {
        var newsTitleChk = $("#newsTitle").val();
        if(newsTitleChk == null || newsTitleChk == '') {
            alert("뉴스 제목을 입력해야 합니다!");
            $("#newsTitle").focus();
            return false;
        }

        if(getParam("newsId") == null || getParam("newsId") == "") {
            var fileChk = $("#file").val();
            if(fileChk == null || fileChk == '') {
                alert("섬네일 이미지를 등록해야 합니다!");
                $("#file").focus();
                return false;
            }
        }

        var contsNote = $('.summernote').summernote('code');
        $("#contsNote").val(contsNote);
        <% if(request.getParameter("newsId") != "" && request.getParameter("newsId") != null){ %>
            var newsId = getParam("newsId");
            $("#newsId").val(newsId);
            $("#Aform").attr("action", "/admin/api/pta_news_modify.jsp");
        <% }else{ %>
            $("#Aform").attr("action", "/admin/api/pta_news_write.jsp");
        <% } %>
        return true;
    }

    // 공지 수정처리
    function newsModify() {
        if(confirm("뉴스를 수정하시겠습니까?") == true) {
            var newsTitleChk = $("#newsTitle").val();
            if(newsTitleChk == null || newsTitleChk == '') {
                alert("You must enter a news title!");
                $("#eventTitle").focus();
                return false;
            }
            //var datas = $("#Aform").serialize();
            var datas = {
                newsId : getParam("newsId"),
                newsTitle : $("#news_title").val(),
                contsNote : $('.summernote').summernote('code'),
                useInfo : $('input[name="useInfo"]:checked').val(),
                linkType : $('input[name="linkType"]:checked').val(),
                linkUrl : $("#linkUrl").val(),
                news_tag_01 : $("#news_tag_01").val(),
                news_tag_02 : $("#news_tag_02").val(),
                news_tag_03 : $("#news_tag_03").val()
            };
            $.ajax({
                url : "/admin/api/pta_news_modify.jsp",
                type : 'POST',
                dataType : 'JSON',
                data : datas,
                success : function(data) {
                    console.log(data);
                    var result = data;
                    if(result.RET_CD == '0001') {
                        alert("completed");
                        location.reload();
                    } else {
                        alert("fail");
                    }
                }
            });
        } else {
            return false;
        }
    }

    function newsWrite(){
        if(confirm("Do you want to register the news?") == true) {
            //var datas = $("#Aform").serialize();
            var datas = {
                newsTitle : $("#news_title").val(),
                contsNote : $('.summernote').summernote('code'),
                useInfo : $('input[name="useInfo"]:checked').val(),
                linkType : $('input[name="linkType"]:checked').val(),
                linkUrl : $("#linkUrl").val(),
                news_tag_01 : $("#news_tag_01").val(),
                news_tag_02 : $("#news_tag_02").val(),
                news_tag_03 : $("#news_tag_03").val()
            };
            $.ajax({
                url : "/admin/api/pta_news_write.jsp",
                type : 'POST',
                dataType : 'JSON',
                data : datas,
                success : function(data) {
                    console.log(data);
                    var result = data;
                    if(result.RET_CD == '0001') {
                        alert("completed");
                        location.href = 'news_list.jsp';
                    } else {
                        alert("fail");
                    }
                }
            });
        } else {
            return false;
        }
    }
</script>
</body>
</fmt:bundle>
</html>