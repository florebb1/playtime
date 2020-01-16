<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
<%@include file="/vietnam/layout/base_style.jsp"%>
<style>
    img {
        width: 100% !important;
    }
</style>
<body class="overflow-auto">
    <header class="h-auto">
        <div class="d-flex pt-5 pb-3">
            <div class="col align-self-center"><a href="javascript:history.back()"><i class="icon-left-arrow fs-20 font-weight-bold text-dark"></i></a></div>
            <div class="col-8 text-center font-weight-bold fs-20"><fmt:message key="message.admin31"/></div>
            <div class="col"></div>
        </div>
    </header>

    <div class="container">
        <%-- 홍보 사진 --%>
        <div class="info-box">
            <%-- 나의 메뉴 리스트 --%>
            <div class="row">
                <div class="col-6 text-secondary text-left fs-16"><span>NEWS</span></div>
                <div class="col-6 text-secondary text-right fs-16"><span id="news_date"></span></div>
            </div>
            <div class="text-center my-3">
                <p id="title" class="text-dark fs-24 font-weight-bold"></p>
            </div>
        </div>
        <div class="text-body fs-14 mx-2">
            <div id="content" style="margin:35px 5%;"></div>
        </div>
        <div class="m-4">
            <span id="tag1" class="text-secondary px-2"></span>
            <span id="tag2" class="text-secondary px-2"></span>
            <span id="tag3" class="text-secondary px-2"></span>
        </div>
        </div>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script>
        $(document).ready(function(){
            var tags;
            var NEWS_ID = get("NEWS_ID");
            var COMP_CD = "011";
            var datas = {
                NEWS_ID : NEWS_ID,
                COMP_CD : COMP_CD
            };
            $.ajax({
                url : "/api/mbl_ADM_0001.jsp",
                type : 'POST',
                dataType : 'JSON',
                data : datas,
                    success:function(response){
                        for(var i = 0; i < response.RESULT.length; i++) {
                            if(response.RESULT[i].NEWS_ID == NEWS_ID) {
                                if(response.RESULT[i].UDT_DTM != null) {
                                    var date = response.RESULT[i].UDT_DTM.substr(0,10);
                                }else {
                                    var date = response.RESULT[i].REG_DTM.substr(0,10);
                                }
                                $('#news_date').html(date);
                                $('#title').html(response.RESULT[i].TITLE);
                                $('#content').html(response.RESULT[i].CONTS_NOTE);
                                if(response.RESULT[0].NOTI_TAG_01 != "" && response.RESULT[0].NOTI_TAG_01 != null) {
                                    $("#tag1").text("#"+response.RESULT[0].NOTI_TAG_01);
                                }else {
                                    $("#tag1").hide();
                                }
                                if(response.RESULT[0].NOTI_TAG_02 != "" && response.RESULT[0].NOTI_TAG_02 != null) {
                                    $("#tag2").text("#"+response.RESULT[0].NOTI_TAG_02);
                                }else {
                                    $("#tag2").hide();
                                }
                                if(response.RESULT[0].NOTI_TAG_03 != "" && response.RESULT[0].NOTI_TAG_03 != null) {
                                    $("#tag3").text("#"+response.RESULT[0].NOTI_TAG_03);
                                }else {
                                    $("#tag3").hide();
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
