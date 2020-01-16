$(document).ready(function(){
    var COMP_CD = $("input[name=COMP_CD]").val();

    // slide1 tab
    getEvent(COMP_CD);
    // slide2 tab
    getNotice(COMP_CD);
    // slide3 tab
    getNews(COMP_CD);

    // 이벤트 비동기 api 함수
    function getEvent(comp){
        $.ajax({
            url: "/vietnam/api/mbl_ADM_0002.jsp?COMP_CD="+comp,
            type: 'POST',
            dataType: 'JSON',
            success: function (response) {
                console.log(response);
                if (response.RESULT.length != 0) {
                    $("#evant").find('.location').empty();
                    var res = "";
                    for (var i = 0; i < response.RESULT.length; i++) {
                        if (response.RESULT[i].USE_INFO == "Y") {
                            res += "<div class='m-4'>";
                                if(response.RESULT[i].LINK_TYPE == "01") {
                                    res += "<a href='notice-event.jsp?EVENT_ID="+response.RESULT[i].EVENT_ID+"'>";
                                }else {
                                    res += "<a href='"+response.RESULT[i].LINK_URL+"' target='_blank'>";
                                }
                            res += "<div class='notice-list' style='background-image: url("+ response.RESULT[i].THUMB_PATH +"); background-size: contain;'></div>"
                                + "<div class='d-flex flex-column align-items-center justify-content-center m-3'>"
                                + "<span class='fs-15 ellipsis text-center'>" + response.RESULT[i].TITLE + "</span>"
                                + "<span class='fs-13 text-black-50'>" +response.RESULT[i].REG_DTM.substr(0, 10)+ "</span>"
                                + "<span class='fs-13 text-black-50'>"
                            if(response.RESULT[i].EVENT_TAG_01 != null) {
                                res += "#" + response.RESULT[i].EVENT_TAG_01;
                            }
                            if(response.RESULT[i].EVENT_TAG_02 != null) {
                                res += " #" + response.RESULT[i].EVENT_TAG_02;
                            }
                            if(response.RESULT[i].EVENT_TAG_03 != null) {
                                res += " #" + response.RESULT[i].EVENT_TAG_03;
                            }
                            res += "</span>"
                                + "</div>"
                                + "</a>"
                                + "</div>";
                        }
                    }
                    $("#evant").find('.location').append(res);
                }else {
                    var res = "";
                    res += "<div class='m-4 text-center'>"
                        + "<p class='fs-20 font-weight-bold'>Sự kiện không tồn tại.</p>"
                        + "</div>";
                    $("#evant").find('.location').append(res);
                }
            }
        });
    }

    // 공지사항 비동기 api 함수
    function getNotice(comp){
        $.ajax({
            url: "/vietnam/api/mbl_ADM_0005.jsp?COMP_CD="+comp,
            type: 'POST',
            dataType: 'JSON',
            success: function (response) {
                if (response.RESULT.length != 0) {
                    $("#notice").find('.location').empty();
                    var res = "";
                    for (var i = 0; i < response.RESULT.length; i++) {
                        if (response.RESULT[i].USE_INFO == "Y") {
                            res += "<div class='m-4'>";
                            if(response.RESULT[i].LINK_TYPE == "01") {
                                res += "<a href='notice-info.jsp?NOTI_ID="+response.RESULT[i].NOTI_ID+"'>";
                            }else {
                                res += "<a href='"+response.RESULT[i].LINK_URL+"' target='_blank'>";
                            }
                            res += "<div class='notice-list' style='background-image: url("+ response.RESULT[i].THUMB_PATH +"); background-size: contain;'></div>"
                                + "<div class='d-flex flex-column align-items-center justify-content-center m-3'>"
                                + "<span class='fs-15 ellipsis text-center'>" + response.RESULT[i].TITLE + "</span>"
                                + "<span class='fs-13 text-black-50'>" +response.RESULT[i].REG_DTM.substr(0, 10)+ "</span>"
                                + "<span class='fs-13 text-black-50'>"
                            if(response.RESULT[i].NOTI_TAG_01 != null) {
                                res += "#" + response.RESULT[i].NOTI_TAG_01;
                            }
                            if(response.RESULT[i].NOTI_TAG_02 != null) {
                                res += " #" + response.RESULT[i].NOTI_TAG_02;
                            }
                            if(response.RESULT[i].NOTI_TAG_03 != null) {
                                res += " #" + response.RESULT[i].NOTI_TAG_03;
                            }
                            res += "</span>"
                                + "</div>"
                                + "</a>"
                                + "</div>";
                        }
                    }
                    $("#notice").find('.location').append(res);
                }else {
                    var res = "";
                    res += "<div class='m-4 text-center'>"
                        + "<p class='fs-20 font-weight-bold'>thông báo này không tồn tại</p>"
                        + "</div>";
                    $("#notice").find('.location').append(res);
                }
            }
        });
    }

    // 뉴스 비동기 api 함수
    function getNews(comp){
        $.ajax({
            url: "/vietnam/api/mbl_ADM_0001.jsp?COMP_CD=" + comp,
            type: 'POST',
            dataType: 'JSON',
            success: function (response) {
                if (response.RESULT.length != 0) {
                    $("#news").find('.location').empty();
                    var res = "";
                    for (var i = 0; i < response.RESULT.length; i++) {
                        if (response.RESULT[i].USE_INFO == "Y") {
                            res += "<div class='m-4'>";
                            if(response.RESULT[i].LINK_TYPE == "01") {
                                res += "<a href='notice-news.jsp?NEWS_ID="+response.RESULT[i].NEWS_ID+"'>";
                            }else {
                                res += "<a href='"+response.RESULT[i].LINK_URL+"' target='_blank'>";
                            }
                            res += "<div class='notice-list' style='background-image: url("+ response.RESULT[i].THUMB_PATH +"); background-size: contain; border-radius: 0px;'></div>"
                                + "<div class='d-flex flex-column align-items-center justify-content-center m-3'>"
                                + "<span class='fs-15 ellipsis text-center'>" + response.RESULT[i].TITLE + "</span>"
                                + "<span class='fs-13 text-black-50'>" +response.RESULT[i].REG_DTM.substr(0, 10)+ "</span>"
                                + "<span class='fs-13 text-black-50'>"
                            if(response.RESULT[i].NEWS_TAG_01 != null) {
                                res += "#" + response.RESULT[i].NEWS_TAG_01;
                            }
                            if(response.RESULT[i].NEWS_TAG_02 != null) {
                                res += " #" + response.RESULT[i].NEWS_TAG_02;
                            }
                            if(response.RESULT[i].NEWS_TAG_03 != null) {
                                res += " #" + response.RESULT[i].NEWS_TAG_03;
                            }
                            res += "</span>"
                                + "</div>"
                                + "</a>"
                                + "</div>";
                        }
                    }
                    $("#news").find('.location').append(res);
                }else {
                    var res = "";
                    res += "<div class='m-4 text-center'>"
                        + "<p class='fs-20 font-weight-bold'>Không có tin tức</p>"
                        + "</div>";
                    $("#news").find('.location').append(res);
                }
            }
        });
    }

});