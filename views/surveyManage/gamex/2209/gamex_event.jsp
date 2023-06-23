<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>메디밸류</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
    <link rel="shortcut icon" href="/resources/images/favicon/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="/resources/images/favicon/favicon.png">
    <link rel="stylesheet" type="text/css" href="/resources/css/gamex_event.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pagePiling.js/1.5.6/jquery.pagepiling.min.css" integrity="sha512-W9OWS8dgpQBw5Hb+tbMto1BMsHvYOXT/AFBGvASCPUJleaEdpOAN5lzgj9RrTbo3YrlR+m9xdOBccp8F+SFyQg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pagePiling.js/1.5.6/jquery.pagepiling.min.js" integrity="sha512-FcXc9c211aHVJEHxoj2fNFeT8+wUESf/4mUDIR7c31ccLF3Y6m+n+Wsoq4dp2sCnEEDVmjhuXX6TfYNJO6AG6A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script type="text/javascript" src="/resources/js/gamex_event.js"></script>
    <script type="text/javascript">
        $(function () {
            let version = '${version}';
            let req_type = '${req_type}';
            let productList = ${productList};
            setEventProduct(version, productList,req_type);

            let pathname = window.location.pathname;
            console.log(pathname);
            if (pathname.indexOf("FR") > 0) {
                $(".FR").addClass("on");
                $(".version-title").text("FR.1")
            } else if (pathname.indexOf("SA1") > 0) {
                $(".SA1").addClass("on");
                $(".version-title").text("SA.1")
            } else if (pathname.indexOf("SA2") > 0) {
                $(".SA2").addClass("on");
                $(".version-title").text("SA.2")
            } else if (pathname.indexOf("SU1") > 0) {
                $(".SU1").addClass("on");
                $(".version-title").text("SU.1")
            } else if (pathname.indexOf("SU2") > 0) {
                $(".SU2").addClass("on");
                $(".version-title").text("SU.2")
            }

            // $(".version-list").css("display", "none");

            $(".version-title").on("click", function () {
                if ($(".version-list").hasClass("on")) {
                    $(".version-list").css("display", "none");
                    $(".version-list").removeClass("on");
                } else {
                    $(".version-list").css("display", "block");
                    $(".version-list").addClass("on");
                }
            });
        });
    </script>
</head>
<body>
<%--	<style>--%>
<%--		.atc_content .event_list li > div.airpod a{background-color: #F63D3A !important;}--%>
<%--		.atc_content .event_list li > div.ssg a{background-color: #FDA543 !important;}--%>
<%--		.atc_content .event_list li > div.donut a{background-color: #68fd43 !important;}--%>
<%--	</style>--%>
    <div id="wrap">
        <div id="container" class="main">
            <main>
                <section>
                    <article class="atc_aside">
                        <div class="inner">
                            <div class="head">
                                <div class="logo">
                                    <img src="/resources/images/gamex_event/img_logo.png" alt="medivalue logo">
                                </div>
                                <div class="title">치과 흑자의 떡상은<br>가격비교부터</div>
                            </div>
                            <div class="body">
                                <div class="select_name_wrap">
                                	<input type="hidden" name="req_type" id="req_type" value="${req_type}" />
                                	<input type="hidden" name="version" id="version" value="${version}" />
                                	
                                    <select name="" id="survey_user_list" class="sel_name">
                                        <option value="" selected>-</option>
                                        <c:forEach var="item" items="${surveyCompleteList}">
                                            <option value="${item.pk_idx}"><c:out value="${item.fd_username_desc}"/>(<c:out value="${item.fd_tel_desc}"/>)</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="giveaway">
                                    <ul>
                                        <li>
                                            <div>
                                                <div class="img">
                                                    <img src="/resources/images/gamex_event/img_giveaway_01.png" alt="">
                                                    <div class="badge">3명</div>
                                                </div>
                                                <div class="txt">
                                                    <div class="tit">Apple</div>
                                                    <div class="desc">AirPods 3세대</div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="img">
                                                    <img src="/resources/images/gamex_event/img_giveaway_02.png" alt="">
                                                    <div class="badge">15명</div>
                                                </div>
                                                <div class="txt">
                                                    <div class="tit">신세계</div>
                                                    <div class="desc">신세계 상품권 3만원권</div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="img">
                                                    <img src="/resources/images/gamex_event/img_giveaway_04.png" alt="">
                                                    <div class="badge">600명</div>
                                                </div>
                                                <div class="txt">
                                                    <div class="tit">베스킨라빈스</div>
                                                    <div class="desc">싱글킹 아이스크림</div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="img">
                                                    <img src="/resources/images/gamex_event/img_giveaway_03.png" alt="">
                                                    <div class="badge">1000명</div>
                                                </div>
                                                <div class="txt">
                                                    <div class="tit">스타벅스</div>
                                                    <div class="desc">아메리카노 Tall</div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="tab_wrap">
                            <div class="title"><span><a class="version-title" href="javascript:void(0)">SA.1</a></span></div>
                            <ul class="version-list" style="display:none">
                                <li class="SA1"><a href="/survey/gamex/event/2209/SA1">SA.1</a></li>
                                <li class="SA2"><a href="/survey/gamex/event/2209/SA2">SA.2</a></li>
                                <li class="SU1"><a href="/survey/gamex/event/2209/SU1">SU.1</a></li>
                                <li class="SU2"><a href="/survey/gamex/event/2209/SU2">SU.2</a></li>
                            </ul>
                        </div>
                        <div class="btn_wrap">
                            <a href="javascript:location.reload(true);" class="btn_refresh">
                                <img src="/resources/images/gamex_event/ico_refresh.png" alt="">
                            </a>
                        </div>
                    </article>
                    <article class="atc_content">
                        <div class="inner"></div>
                        <!-- <div class="nav">
                            <button type="button" class="btn_prev off"></button>
                            <button type="button" class="btn_next"></button>
                        </div> -->
                        <div class="menu">
                            <ul>
                                <li data-menuanchor="page_1" class="active"><a href="#page_1"><span>1</span></a></li>
                                <li data-menuanchor="page_2"><a href="#page_2"><span>2</span></a></li>
                                <li data-menuanchor="page_3"><a href="#page_3"><span>3</span></a></li>
                                <li data-menuanchor="page_4"><a href="#page_4"><span>4</span></a></li>
                                <li data-menuanchor="page_5"><a href="#page_5"><span>5</span></a></li>
                                <li data-menuanchor="page_6"><a href="#page_6"><span>6</span></a></li>
                            </ul>
                        </div>
                    </article>
                </section>
                <div class="layer_popup">
                    <div class="layer_popup_bg"></div>
                    <div class="layer_popup_cont">
                        <div class="inner">
                            <div class="bg">
                                <div class="bg_01">
                                    <img src="/resources/images/gamex_event/giveaway_01_01_01.png" alt="" class="bg_step_01">
                                    <img src="/resources/images/gamex_event/giveaway_01_01_02.png" alt="" class="bg_step_02">
                                    <img src="/resources/images/gamex_event/giveaway_01_01_03.png" alt="" class="bg_step_03">
                                    <img src="/resources/images/gamex_event/giveaway_01_01_04.png" alt="" class="bg_step_04">
                                    <img src="/resources/images/gamex_event/giveaway_01_01_05.png" alt="" class="bg_step_05">
                                    <img src="/resources/images/gamex_event/giveaway_01_02_01.png" alt="" class="bg_step_06">
                                    <img src="/resources/images/gamex_event/giveaway_01_02_02.png" alt="" class="bg_step_07">
                                    <img src="/resources/images/gamex_event/giveaway_01_02_03.png" alt="" class="bg_step_08">
                                    <img src="/resources/images/gamex_event/giveaway_01_02_04.png" alt="" class="bg_step_09">
                                    <img src="/resources/images/gamex_event/giveaway_01_02_05.png" alt="" class="bg_step_10">
                                    <img src="/resources/images/gamex_event/giveaway_01_02_06.png" alt="" class="bg_step_11">
                                    <img src="/resources/images/gamex_event/giveaway_01_03_01.png" alt="" class="bg_step_12">
                                    <img src="/resources/images/gamex_event/giveaway_01_03_02.png" alt="" class="bg_step_13">
                                    <img src="/resources/images/gamex_event/giveaway_01_03_03.png" alt="" class="bg_step_14">
                                    <img src="/resources/images/gamex_event/giveaway_01_03_04.png" alt="" class="bg_step_15">

                                </div>
                                <div class="bg_02">
                                    <img src="/resources/images/gamex_event/giveaway_02_01_01.png" alt="" class="bg_step_01">
                                    <img src="/resources/images/gamex_event/giveaway_02_01_02.png" alt="" class="bg_step_02">
                                    <img src="/resources/images/gamex_event/giveaway_02_02_01.png" alt="" class="bg_step_03">
                                    <img src="/resources/images/gamex_event/giveaway_02_02_02.png" alt="" class="bg_step_04">
                                    <img src="/resources/images/gamex_event/giveaway_02_02_03.png" alt="" class="bg_step_05">
                                    <img src="/resources/images/gamex_event/giveaway_02_02_04.png" alt="" class="bg_step_06">
                                    <img src="/resources/images/gamex_event/giveaway_02_02_05.png" alt="" class="bg_step_07">
                                    <img src="/resources/images/gamex_event/giveaway_02_02_06.png" alt="" class="bg_step_08">
                                    <img src="/resources/images/gamex_event/giveaway_02_02_07.png" alt="" class="bg_step_09">
                                    <img src="/resources/images/gamex_event/giveaway_02_03_01.png" alt="" class="bg_step_10">
                                    <img src="/resources/images/gamex_event/giveaway_02_03_02.png" alt="" class="bg_step_11">
                                    <img src="/resources/images/gamex_event/giveaway_02_03_03.png" alt="" class="bg_step_12">
                                </div>
                                <div class="bg_03">
                                    <img src="/resources/images/gamex_event/giveaway_03_01_01.png" alt="" class="bg_step_01">
                                    <img src="/resources/images/gamex_event/giveaway_03_01_02.png" alt="" class="bg_step_02">
                                    <img src="/resources/images/gamex_event/giveaway_03_02_01.png" alt="" class="bg_step_03">
                                    <img src="/resources/images/gamex_event/giveaway_03_02_02.png" alt="" class="bg_step_04">
                                </div>
                            </div>
                            <div class="img">
                                <img src="/resources/images/gamex_event/img_giveaway_01_b.png" alt="" class="img_01">
                                <img src="/resources/images/gamex_event/img_giveaway_02_b.png" alt="" class="img_02">
                                <img src="/resources/images/gamex_event/img_giveaway_03_b.png" alt="" class="img_03">
                                <img src="/resources/images/gamex_event/img_giveaway_04_b.png" alt="" class="img_04">
                                <div class="btn_close" onclick="hidePopup();"></div>
                            </div>
                            <div class="txt">
                                <div class="txt_01">
                                    <div class="title">축하합니다!</div>
                                    <div class="tit">Apple</div>
                                    <div class="desc">AirPods 3세대</div>
                                </div>
                                <div class="txt_02">
                                    <div class="title">축하합니다!</div>
                                    <div class="tit">신세계</div>
                                    <div class="desc">신세계 상품권 3만원권</div>
                                </div>
                                <div class="txt_03">
                                    <div class="title">축하합니다!</div>
                                    <div class="tit">스타벅스</div>
                                    <div class="desc">아메리카노 Tall</div>
                                </div>
                                <div class="txt_04">
                                    <div class="title">축하합니다!</div>
                                    <div class="tit">베스킨라빈스</div>
                                    <div class="desc">싱글킹 아이스크림</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>