<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi"/>
<fmt:bundle basename="/com.properties.message">
    <%@include file="/vietnam/layout/base_style.jsp"%>
    <style>
        #carouselExampleControls {
            display : none;
        }
    </style>
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
                <div class="swiper-slide selected">Thành viên<br>của tôi</div>
                <div class="swiper-slide">Thông tin thành viên</div>
                <div class="swiper-slide">Chương trình thành viên</div>
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
                            <%-- 나의 멤버십 --%>
                        <div class="myMembership-body">
                            <div class="myMembership-qrcode">
                                <div class="qrcode">
                                    <div class="qrNumber  d-flex flex-column justify-content-center bg-white">
                                        <div id="img_form_url" class="d-flex justify-content-center pt-2 h-100"></div>
                                        <div id="img_form_num" class="text-dark text-center"></div>
                                    </div>
                                    <div class="qrContent">
                                        <div class="fs-30">
                                            <p class="fs-20"><fmt:message key="message.qrcodeTitle"/></p>
                                            <p class="fs-14">Đảm bảo quét mã QR khi vào cửa</p>
                                            <button type="button" class="qr_btn font-weight-bold" onclick="location.href='coupon-list.jsp'"><fmt:message key="message.qrcodeButton"/></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="carouselExampleControls" class="carousel slide" data-interval="false" data-ride="carousel" data-wrap="false">
                            <div id="carousel" class="carousel-inner"></div>
                            <a class="carousel-control-prev justify-content-start" href="#carouselExampleControls" role="button" data-slide="prev">
                                <span aria-hidden="true"><i class="icon-left-arrow text-dark fs-20 font-weight-bolder"></i></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next justify-content-end" href="#carouselExampleControls" role="button" data-slide="next">
                                <span aria-hidden="true"><i class="icon-right-arrow text-dark fs-20 font-weight-bolder"></i></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="location">
                            <%-- 포인트제도 소개 --%>
                        <div class="info-box my-4">
                            <p class="text-center fs-16">Giới thiệu chương trình giảm giá cho thành viên</p>
                            <p class="text-center fs-20">Chương trình giảm giá cho thành
                                viên là chương trình chỉ giảm giá
                                cho khách hàng là thành viên
                                Playmembers khi vào gian hàng Playtime</p>
                        </div>
                        <img class="w-100" src="images/member_info.png">
                            <%-- 포인트적립 소개 --%>
                        <div class="info-box my-4">
                            <p class="text-center fs-18">Giảm giá vào cửa cho khách hàng là thành viên</p>
                            <p class="text-center fs-13">Hội viên đã đăng ký thẻ hội viên thì sẽ nhận được giảm giá khi mua vé vào cửa tại các gian hàng Playtime.<br>
                                <span class="pt-3">
                                    <a href="notice-info.jsp?NOTI_ID=152" style="color: red !important;">Kiểm tra số tiền giảm giá vào cửa cho thẻ hội viên</a>
                                </span>
                            </p>
                        </div>
                            <%-- 포인트 사용방법 --%>
                        <div class="info-bg-color py-4">
                            <div class="info-box text-center">
                                <p class="text-center fs-18">Phương thức áp dụng giảm giá cho vé vào cửa của thẻ hội viên</p>
                                <p class="text-center fs-13">
                                    Phương thức áp dụng giảm giá cho vé vào cửa của thẻ hội viên<br>
                                    Sau khi xác nhận hội viên và cấp bậc của hội viên tại gian hàng của Playtime (quét mã QR), giá trị được chiết khấu chỉ dành cho hội viên có thẻ hội viên vào cửa<br>
                                    Chỉ áp dụng giảm giá cho mua vé vào cửa thông thường<br>
                                    Không áp dụng cho vé nhiều lượt và vào cửa Không áp dụng cho phiếu ưu đãi và phiếu giảm giá khác<br>
                                </p>
                            </div>
                        </div>
                            <%-- 자주하는 질문 --%>
                        <div class="p-3 fs-18 text-center">
                            <fmt:message key="message.infoTitle4"/>
                        </div>
                        <div class="select_box font-weight-bold text-center fs-15">
                            <label id="faq" for="color"><fmt:message key="message.selectboxItem1"/></label>
                            <select id="faq_select" class="color" title="select color">
                                <option value="0" data-content="<fmt:message key="message.selectboxItem1"/>" selected><fmt:message key="message.selectboxItem1"/></option>
                                <option value="1" data-content="<fmt:message key="message.selectboxItem2"/>"><fmt:message key="message.selectboxItem2"/></option>
                                <option value="2" data-content="<fmt:message key="message.selectboxItem3"/>"><fmt:message key="message.selectboxItem3"/></option>
                                <option value="3" data-content="<fmt:message key="message.selectboxItem4"/>"><fmt:message key="message.selectboxItem4"/></option>
                                <option value="4" data-content="<fmt:message key="message.selectboxItem5"/>"><fmt:message key="message.selectboxItem5"/></option>
                                <option value="5" data-content="<fmt:message key="message.selectboxItem6"/>"><fmt:message key="message.selectboxItem6"/></option>
                            </select>
                        </div>
                        <section id="memberS"></section>
                        <section id="levelS"></section>
                        <section id="stempS"></section>
                        <section id="couponS"></section>
                        <section id="cardS"></section>
                    </div>
                </div>

                <div class="swiper-slide">
                    <div class="location">
                            <%-- 플레이멤버스 소개 --%>
                        <div class="info-box my-4">
                            <p class="text-center fs-16">Giới thiệu về thành viên tham gia</p>
                            <p class="text-center fs-20"><fmt:message key="message.programContent1"/></p>
                        </div>
                        <img class="w-100" src="images/member_program.png">
                            <%-- 포인트적립 소개 --%>
                        <div class="info-box my-4">
                            <p class="text-center fs-18">Hướng dẫn cấp độ thành viên</p>
                            <p class="text-center fs-13 text-secondary">
                                Những ưu đãi hấp dẫn theo 4 cấp độ thành viên khác nhau cho mỗi cấp độ<br>
                                <fmt:message key="message.programContent3"/>
                            </p>
                        </div>
                            <%-- 등급별 혜택 안내 --%>
                        <div class="d-flex">
                            <div id="wel" class="flex-fill d-flex justify-content-end align-items-center pt-level">
                                <img class="w-75" src="images/welcome.png">
                            </div>
                            <div id="fri" class="flex-fill d-flex justify-content-end align-items-center pt-level">
                                <img class="w-75" src="images/friend.png">
                            </div>
                            <div id="fam" class="flex-fill d-flex justify-content-end align-items-center pt-level">
                                <img class="w-75" src="images/famiy.png">
                            </div>
                            <div id="vip" class="flex-fill d-flex justify-content-end align-items-center pt-level">
                                <img class="w-75" src="images/vip.png">
                            </div>
                        </div>
                        <div class="mt-3 d-flex">
                            <div class="flex-fill d-flex justify-content-center align-items-center"><div id="welAppoint" class="wel_tri pt-level-icon"></div></div>
                            <div class="flex-fill d-flex justify-content-center align-items-center"><div id="friAppoint" class="fri_tri pt-level-icon"></div></div>
                            <div class="flex-fill d-flex justify-content-center align-items-center"><div id="famAppoint" class="fam_tri pt-level-icon"></div></div>
                            <div class="flex-fill d-flex justify-content-center align-items-center"><div id="vipAppoint" class="vip_tri pt-level-icon"></div></div>
                        </div>
                        <div id="welContent" class="text-white bg-yellow-color py-4 px-4 pt-level-content">
                            <div class="fs-15 font-weight-bold">Welcome<br>Hoan nghênh đến với Playmembers</div><br>
                            <div class="fs-13"><span class="font-weight-bold">Giới thiệu ưu đãi</span><br>
                                - Tặng phiếu giảm giá 20,000 kỉ niệm việc gia nhập<br>
                                - Nâng cấp sau 15 lần sử dụng
                            </div>
                        </div>
                        <div id="friContent" class="text-white bg-rating-blue py-4 px-4 pt-level-content">
                            <div class="fs-15 font-weight-bold">Silver<br>Thẻ hội viên Playmembers đã đạt cấp Silver</div><br>
                            <div class="fs-13"><span class="font-weight-bold">Giới thiệu ưu đãi</span><br>
                                - Tặng phiếu ưu đãi 50% dịp sinh nhật (sinh nhật người vào)<br>
                                - Tuỳ mỗi gian hang mà Hạng bạc được áp dụng ưu đãi giảm giá<br>
                                - Nâng cấp sau 25 lần sử dụng
                            </div>
                        </div>
                        <div id="famContent" class="text-white bg-rating-red py-4 px-4 pt-level-content">
                            <div class="fs-15 font-weight-bold">Gold<br>Thẻ hội viên Playmembers đã đạt cấp Gold</div><br>
                            <div class="fs-13"><span class="font-weight-bold">Giới thiệu ưu đãi</span><br>
                                - Tặng vé miễn phí 1 lần nhân dịp sinh nhật ( sinh nhật người vào)<br>
                                - Tuỳ mỗi gian hang mà Hạng vàng được áp dụng ưu đãi giảm giá<br>
                                - Nâng cấp sau 50 lần sử dụng
                            </div>
                        </div>
                        <div id="vipContent" class="text-white bg-dark py-4 px-4 pt-level-content">
                            <div class="fs-15 font-weight-bold">VIP<br>Thẻ hội viên Playmembers đã đạt cấp VIP</div><br>
                            <div class="fs-13"><span class="font-weight-bold">Giới thiệu ưu đãi</span><br>
                                - Tặng vé miễn phí 1 lần nhân dịp sinh nhật ( sinh nhật người vào)<br>
                                - Tuỳ mỗi gian hang mà Hạng VIP được áp dụng ưu đãi giảm giá
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
    <script src='js/page/main.js'></script>

    </body>
</fmt:bundle>
</html>

