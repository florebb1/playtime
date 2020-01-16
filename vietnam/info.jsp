<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
    <%@include file="/vietnam/layout/base_style.jsp"%>
    <body>
    <div class="postion-fixed">
        <header>
            <div class="d-flex pt-4">
                <div class="col text-center align-self-center p-0"><a href="mypage.jsp"><i class="icon-playtime_icn_mypage fs-25 text-secondary"></i></a></div>
                <div class="col-8 text-center align-self-center p-0"><img src="images/logo.png" class="w-75"></div>
                <div class="col p-0"></div>
            </div>
        </header>

        <!-- swiper1 -->
        <div class="swiper-container swiper1">
            <div class="swiper-wrapper">
                <div class="swiper-slide selected"> <fmt:message key="message.main4Tab1"/></div>
                <div class="swiper-slide"><fmt:message key="message.main4Tab2"/></div>
                <div class="swiper-slide"><fmt:message key="message.main4Tab3"/></div>
                <div class="tabs__presentation-slider" role="presentation"></div>
            </div>
        </div>
    </div>

    <div class="postion-fixed">
        <!-- swiper2 -->
        <div class="swiper-container swiper2 box-sh-gnt">
            <div class="swiper-wrapper">
                <form id="mainForm" method="POST">
                    <input name="COMP_CD" type="hidden" value="011">
                    <input name="CUST_ID" type="hidden">
                </form>
                <div class="swiper-slide">
                    <div class="location">
                            <%-- 플레이타임그룹 소개 --%>
                        <div class="info-box my-4">
                            <p class="text-center fs-16"><fmt:message key="message.groupInfo1"/></p>
                            <p class="text-center fs-20"><fmt:message key="message.groupInfo2"/></p>
                        </div>
                        <img class="w-100" src="images/playtime_info.png">
                            <%-- 회사 소개 --%>
                        <div class="info-box my-4">
                            <p class="text-center fs-15"><fmt:message key="message.groupInfo3"/></p>
                            <p class="text-center fs-13 text-secondary"><fmt:message key="message.groupInfo4"/><br></p>
                        </div>
                            <%-- 경영철학 --%>
                        <div class="bg-gray-color">
                            <div class="info-box py-4">
                                <p class="text-center fs-15"><fmt:message key="message.groupInfo5"/></p>
                                <p class="text-center fs-13 text-secondary"><fmt:message key="message.groupInfo6"/><br><br></p>
                                <p class="text-center fs-13"><fmt:message key="message.groupInfo7"/><br></p>
                                <p class="text-center fs-13 text-secondary"><fmt:message key="message.groupInfo8"/><br></p>
                                <p class="text-center fs-13 text-secondary"><fmt:message key="message.groupInfo9"/><br><br></p>
                                <p class="text-center fs-13"><fmt:message key="message.groupInfo10"/><br></p>
                                <p class="text-center fs-13 text-secondary"><fmt:message key="message.groupInfo11"/><br></p>
                                <p class="text-center fs-13 text-secondary"><fmt:message key="message.groupInfo12"/><br></p>
                                <p class="text-center fs-13 text-secondary"><fmt:message key="message.groupInfo13"/><br><br></p>
                                <p class="text-center fs-13 text-secondary">Giám đốc, CHIN SANG BIN</p>
                            </div>
                        </div>
                        <img class="w-100" src="images/playtime_info2.png">
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="location">
                            <%-- 플레이타임그룹 역사 --%>
                        <div class="info-box my-4">
                            <p class="text-center fs-16"><fmt:message key="message.history1"/></p>
                            <p class="text-center fs-20"><fmt:message key="message.history2"/></p>
                        </div>
                            <%--  2016~2018 --%>
                        <div class="d-flex align-items-center info-box mt-5 border-bottom history-title">
                            <div class="fs-30 col-10">2016 ~ 2018</div>
                            <div class="fs-20 col-2 font-weight-bold"><i class="icon-down-arrow"></i></div>
                        </div>
                        <div class="history-content info-box">
                            <div class="my-3 text-left">
                                <div class="fs-18 text-warning font-weight-bold my-3">2018</div>
                                <div class="fs-13">
                                    Năm 2018 Playtime đã mở Chi Nhánh HUẾ ở Miền Trung<br>
                                    Năm 2018 Playtime đã mở Chi Nhánh TIMES CITY ở Hà Nội
                                </div>
                            </div>
                            <div class="my-3 text-left">
                                <div class="fs-18 text-warning font-weight-bold my-3">2017</div>
                                <div class="fs-13">
                                    Năm 2017 Playtime đã mở Chi Nhánh NHA TRANG ở Miền Nam Trung Bộ<br>
                                    Năm 2017 Playtime đã mở Chi Nhánh SHOPPING ở Hà Nội<br>
                                    Năm 2017 Playtime đã mở Chi Nhánh HẬU GIANG ở Miền Tây Nam Bộ<br>
                                    Năm 2017 Playtime đã mở Chi Nhánh KIÊN GIANG ở Miền Tây Nam Bộ<br>
                                    Năm 2017 Playtime đã mở Chi Nhánh VĨNH LONG ở Miền Tây Nam Bộ<br>
                                    Năm 2017 Playtime đã mở Chi Nhánh TRÀ VINH ở Miền Tây Nam Bộ
                                </div>
                            </div>
                            <div class="my-3 text-left">
                                <div class="fs-18 text-warning font-weight-bold my-3">2016</div>
                                <div class="fs-13">
                                    Năm 2016 Playtime đã mở Chi Nhánh BẮC TỪ LIÊM ở Hà Nội<br>
                                    Năm 2016 Playtime đã mở Chi Nhánh PHẠM NGỌC THẠCH ở Hà Nội<br>
                                    Năm 2016 Playtime đã mở Chi Nhánh CẦN THƠ ở Miền Tây Nam Bộ<br>
                                    Năm 2016 Playtime đã mở Chi Nhánh THÁI BÌNH ở Miền Bắc<br>
                                    Năm 2016 Playtime đã mở Chi Nhánh LOTTE GÒ VẤP ở Hồ Chí Minh
                                </div>
                            </div>
                        </div>
                            <%--  2009~2015 --%>
                        <div class="d-flex align-items-center info-box mt-3 border-bottom history-title">
                            <div class="fs-30 col-10">2012 ~ 2015</div>
                            <div class="fs-20 col-2 font-weight-bold"><i class="icon-down-arrow"></i></div>
                        </div>
                        <div class="history-content info-box">
                            <div class="my-3 text-left">
                                <div class="fs-18 text-warning font-weight-bold my-3">2015</div>
                                <div class="fs-13">Năm 2015 Playtime đã mở Chi Nhánh VIVO ở Hồ Chí Minh</div>
                            </div>
                            <div class="my-3 text-left">
                                <div class="fs-18 text-warning font-weight-bold my-3">2014</div>
                                <div class="fs-13">
                                    Năm 2014 Apple đã mở Chi Nhánh EMART ở Hồ Chí Minh<br>
                                    Năm 2014 Playtime đã mở Chi Nhánh VŨNG TÀU ở Miền Đông Nam Bộ<br>
                                    Năm 2014 Playtime đã mở Chi Nhánh AEON ở Hồ Chí Minh<br>
                                    Năm 2014 Playtime đã mở Chi Nhánh NAM SÀI GÒN ở Hồ Chí Minh<br>
                                    Năm 2012 Playtime đã mở Chi Nhánh ĐỐNG ĐA HÀ NỘI ở Hà Nội<br>
                                </div>
                            </div>
                            <div class="my-3 text-left">
                                <div class="fs-18 text-warning font-weight-bold my-3">2013</div>
                                <div class="fs-13">
                                    Năm 2013 Playtime đã mở Chi Nhánh PHAN THIẾT ở Miền Nam Trung Bộ<br>
                                    Năm 2013 Playtime đã mở Chi Nhánh BÌNH DƯƠNG ở Miền Đông Nam Bộ
                                </div>
                            </div>
                            <div class="my-3 text-left">
                                <div class="fs-18 text-warning font-weight-bold my-3">2012</div>
                                <div class="fs-13">
                                    Năm 2012 Playtime đã mở Chi Nhánh ĐÀ NẴNG ở Miền Nam Trung Bộ<br>
                                    Năm 2012 Playtime đã mở Chi Nhánh ĐỒNG NAI ở Miền Đông Nam Bộ
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="swiper-slide">
                    <div class="location">
                            <%-- 플레이타임그룹 소개 --%>
                        <div class="info-box my-4">
                            <p class="text-center fs-16"><fmt:message key="message.brand1"/></p>
                            <p class="text-center fs-20"><fmt:message key="message.brand2"/></p>
                        </div>
                            <%-- 브랜드 소개 이미지 슬라이드 --%>
                        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                        <%--                                    <img src="/images/brand/play.jpg" class="d-block w-100" onclick="location.href='brand-play.jsp'">--%>
                                    <img src="./images/brand/play.jpg" class="d-block w-100">
                                </div>
                                    <%--                                <div class="carousel-item">--%>
                                    <%--                                    <img src="/images/brand/block.jpg" class="d-block w-100" onclick="location.href='brand-block.jsp'">--%>
                                    <%--                                </div>--%>
                                    <%--                                <div class="carousel-item">--%>
                                    <%--                                    <img src="/images/brand/art.jpg" class="d-block w-100" onclick="location.href='brand-art.jsp'">--%>
                                    <%--                                </div>--%>
                                    <%--                                <div class="carousel-item">--%>
                                    <%--                                    <img src="/images/brand/baby.jpg" class="d-block w-100" onclick="location.href='brand-baby.jsp'">--%>
                                    <%--                                </div>--%>
                            </div>
                                <%--                            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">--%>
                                <%--                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>--%>
                                <%--                                <span class="sr-only">Previous</span>--%>
                                <%--                            </a>--%>
                                <%--                            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">--%>
                                <%--                                <span class="carousel-control-next-icon" aria-hidden="true"></span>--%>
                                <%--                                <span class="sr-only">Next</span>--%>
                                <%--                            </a>--%>
                        </div>
                            <%-- about playtime --%>
                        <div class="info-box my-4">
                            <p class="text-center fs-15">ABOUT PLAYTIME</p>
                            <p class="text-center fs-13 text-secondary"><fmt:message key="message.brand3"/><br><br></p>
                            <p class="text-center fs-13 text-secondary"><fmt:message key="message.brand4"/><br><br></p>
                            <p class="text-center fs-13 text-secondary"><fmt:message key="message.brand5"/><br><br></p>
                            <p class="text-center fs-13 text-secondary"><fmt:message key="message.brand6"/><br><br></p>
                            <p class="text-center fs-13 text-secondary"><fmt:message key="message.brand7"/><br><br></p>
                            <p class="text-center fs-13 text-secondary"><fmt:message key="message.brand8"/><br><br></p>
                        </div>
                        <div class="info-box my-4">
                            <p class="text-center fs-15">CONTENTS CONCEPT</p>
                        </div>
                        <img class="w-100" src="./images/playtime_info3.png">
                    </div>
                </div>

            </div>
                </div>
            </div>
        </div>
    </div>

    <div class="postion-fixed">
        <footer>
            <div class="d-flex h-100">
                <div class="col-3 align-self-center text-center"><a href="main.jsp"><i class="icon-playtime_icn_code fs-60 text-warning"></i></a> </div>
                <div class="col-3 align-self-center text-center"><a href="notice.jsp"><i class="icon-playtime_icn_home fs-40 text-black-50"></i></a></div>
                <div class="col-3 align-self-center text-center"><a href="store.html"><i class="icon-playtime_icn_store fs-40 text-black-50"></i></a></div>
                <div class="col-3 align-self-center text-center"><a href="info.jsp"><i class="icon-playtime_icn_play fs-40 text-black-50"></i></a></div>
            </div>
        </footer>
    </div>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src='js/page/info.js'></script>

    </body>
</fmt:bundle>
</html>
