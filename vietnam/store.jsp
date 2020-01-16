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

        <!-- 탭메뉴 -->
        <div class="swiper-container swiper1">
            <div class="swiper-wrapper">
                <div class="swiper-slide selected"> <fmt:message key="message.main3Tab1"/></div>
                <div class="swiper-slide">Tìm cửa hàng</div>
                <div id="find-store" class="swiper-slide"><fmt:message key="message.main3Tab3"/></div>
                <div class="tabs__presentation-slider" role="presentation"></div>
            </div>
        </div>
    </div>

    <div class="postion-fixed">
        <!-- 탭 컨텐츠 -->
        <div class="swiper-container swiper2 box-sh-gnt">
            <form id="storeForm" method="POST">
                <input id="COMP_CD" name="COMP_CD" type="hidden" value="011">
                <input id="CUST_ID" name="CUST_ID" type="hidden">
                <input id="SIDO_NM" name="SIDO_NM" type="hidden" value="Tây Bắc">
                <input id="BRAND_NM" name="BRAND_NM" type="hidden">
                <input id="STOR_CD" name="STOR_CD" type="hidden">

                <input id="LOC_LAT" name="LOC_LAT" type="hidden">
                <input id="LOC_LNG" name="LOC_LNG" type="hidden">
                <input id="RADIUS" name="RADIUS" type="hidden">
            </form>
            <div class="swiper-wrapper">
                <%-- 신규매장 안내 --%>
                <div class="swiper-slide">
                    <div class="location">
                        <img id="newStoreImg" src="images/store/pl.png" class="w-100">
                        <div class="mx-4 my-4">
                            <div class="non-retail-store text-white fs-13 text-center pt-1"><span id="newStoreType">chi nhánh trực tiếp</span></div>
                            <div id="newStoreName" class="font-weight-bold fs-18 my-3">Store Name</div>
                            <div id="newStoreAddr" class="fs-13 my-4">Store Address</div>
                            <div id="newStoreCall" class="text-white new-store-btn text-center w-100 border-0 fs-18 bg-yellow-color border-radius-10">Điện thoại để được tư vấn</div>
                        </div>
                    </div>
                </div>

                <%-- 지역별 매장 안내 --%>
                <div class="swiper-slide">
                    <div id="select_sto" class="select_box" style="text-align:center; color:#000;">
                        <label for="color"></label>
                        <select class="color" id="color" name="BRAND_CD" title="select color"></select>
                    </div>
                    <div class="location-store d-flex">
                        <%-- 지역선택--%>
                        <div class="col-4 px-0 left-box h-100 text-center font-weight-bold">
                            <ul class="nav flex-column nav-pills font-weight-bold">
                                <li class="nav-link active" data-local="Tây Bắc"><a>Tây Bắc</a></li>
                                <li class="nav-link" data-local="Đông Bắc"><a>Đông Bắc</a></li>
                                <li class="nav-link" data-local="Đồng bằng sông Hồng"><a>Đồng bằng sông Hồng</a></li>
                                <li class="nav-link" data-local="Bắc Trung Bộ"><a>Bắc Trung Bộ</a></li>
                                <li class="nav-link" data-local="Nam trung bộ"><a>Nam trung bộ</a></li>
                                <li class="nav-link" data-local="Cao nguyên miền trung"><a>Cao nguyên miền trung</a></li>
                                <li class="nav-link" data-local="Đông nam bộ"><a>Đông nam bộ</a></li>
                                <li class="nav-link" data-local="Đồng bằng sông Cửu Long"><a>Đồng bằng sông Cửu Long</a></li>
                            </ul>
                        </div>
                        <%-- 지역내 매장 리스트 --%>
                        <div class="col-8 px-0 right-box h-100">
                            <div class="tab-content" id="v-pills-tabContent">
                                <ul class="list-style-none" id="storeList"></ul>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- 매장 검색 --%>
                <div class="swiper-slide">
                    <div class="d-flex py-2 align-items-center">
                        <div class="col text-left">Cửa hàng gần nhất với bạn(<span id="find-lengh">0</span>)</div>
                        <div class="col text-right q_mark"><span class="q_mark_spin"><i class="icon-refresh-button fs-22"></i></span></div>
                    </div>
                    <div class="d-flex bg-f5f5f5-color py-2 font-weight-bold align-items-center">
                        <div class="box-flex">
                            <a id="map-btn" href="javascript:deny();"><i class="icon-address fs-22"></i> <fmt:message key="message.storeDetail6"/></a>
                        </div>
                        <div class="box-flex">
                            <div id="select_km">
                                <label for="km">5km</label>
                                <select id="km" class="color">
                                    <option value="5" selected="selected">5km</option>
                                    <option value="10">10km</option>
                                    <option value="15">15km</option>
                                    <option value="20">20km</option>
                                </select>
                            </div>
                        </div>
                        <div class="box-flex">
                            <div id="select_brand">
                                <label for="brand"></label>
                                <select id="brand" class="color"></select>
                            </div>

                        </div>
                    </div>
                    <div id="find_list" class="location-find">
                        <div id="loader"></div>
                        <div id="myDiv" class="animate-bottom">
                            <P class='nsB' style='padding:20px; font-size:18px; text-align:center;'><fmt:message key="message.storeAlert"/></p>
                        </div>
                    </div>

            </div>
        </div>
    </div>

    <div class="postion-fixed">
        <footer>
            <div class="d-flex h-100">
                <div class="col-3 align-self-center text-center"><a href="main.jsp"><i class="icon-playtime_icn_code fs-60 text-black-50"></i></a> </div>
                <div class="col-3 align-self-center text-center"><a href="notice.jsp"><i class="icon-playtime_icn_home fs-40 text-black-50"></i></a></div>
                <div class="col-3 align-self-center text-center"><a href="store.jsp"><i class="icon-playtime_icn_store fs-40 text-warning"></i></a></div>
                <div class="col-3 align-self-center text-center"><a href="info.jsp"><i class="icon-playtime_icn_play fs-40 text-black-50"></i></a></div>
            </div>
        </footer>
    </div>

    <%@include file="/vietnam/layout/base_script.jsp"%>
    <script src='js/page/store.js'></script>

    </body>
</fmt:bundle>
</html>
