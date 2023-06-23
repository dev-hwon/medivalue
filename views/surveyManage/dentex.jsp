<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Medivalue</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
    <link rel="shortcut icon" href="/resources/images/favicon/favicon.png" />
    <%--		<link rel="shortcut icon" href="https://medivalue.co.kr/resources/images/dentex/favicon/favicon.png">--%>
    <link rel="apple-touch-icon-precomposed" href="/resources/images/favicon/favicon.png">
    <link rel="stylesheet" type="text/css" href="/resources/css/dentex.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pagePiling.js/1.5.6/jquery.pagepiling.min.css" integrity="sha512-W9OWS8dgpQBw5Hb+tbMto1BMsHvYOXT/AFBGvASCPUJleaEdpOAN5lzgj9RrTbo3YrlR+m9xdOBccp8F+SFyQg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- <script type="text/javascript" src="/resources/js/dentex/jquery.pagepiling.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pagePiling.js/1.5.6/jquery.pagepiling.min.js" integrity="sha512-FcXc9c211aHVJEHxoj2fNFeT8+wUESf/4mUDIR7c31ccLF3Y6m+n+Wsoq4dp2sCnEEDVmjhuXX6TfYNJO6AG6A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script type="text/javascript" src="/resources/js/dentex.js"></script>
</head>
<body>
    <div id="wrap">
        <div id="container" class="main">
            <main>
                <section>
                    <article class="atc_aside">
                        <div class="inner">
                            <div class="head">
                                <div class="title">스마트한 원장님들의 선택</div>
                                <div class="logo">
                                    <a href="/survey/dentex" id="img_logo"><img src="/resources/images/dentex/img_logo.png" alt="medivalue logo"></a>
                                </div>
                            </div>
                            <div class="body">
                                <div class="select_name_wrap" id="survey_complete_list">
                                    <select class="sel_name">
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
                                                    <img src="/resources/images/dentex/img_giveaway_01.png" alt="">
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
                                                    <img src="/resources/images/dentex/img_giveaway_02.png" alt="">
                                                    <div class="badge">10명</div>
                                                </div>
                                                <div class="txt">
                                                    <div class="tit">신세계</div>
                                                    <div class="desc">신세계 상품권 5만원권</div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="img">
                                                    <img src="/resources/images/dentex/img_giveaway_03.png" alt="">
                                                    <div class="badge">300명</div>
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
                    </article>
                    <article class="atc_content">
                        <div class="inner"></div>
                        <div class="nav">
                            <button type="button" class="btn_prev off"></button>
                            <button type="button" class="btn_next"></button>
                        </div>
<%--                        <div class="reset">--%>
<%--                            <button type="button" class="btn_reset" onclick="resetAll();">RS</button>--%>
<%--                        </div>--%>
                    </article>
                </section>
                <div class="layer_popup">
                    <div class="layer_popup_bg"></div>
                    <div class="layer_popup_cont">
                        <div class="inner">
                            <div class="bg">
                                <div class="bg_01">
                                    <img src="/resources/images/dentex/giveaway_01_01_01.png" alt="" class="bg_step_01">
                                    <img src="/resources/images/dentex/giveaway_01_01_02.png" alt="" class="bg_step_02">
                                    <img src="/resources/images/dentex/giveaway_01_01_03.png" alt="" class="bg_step_03">
                                    <img src="/resources/images/dentex/giveaway_01_01_04.png" alt="" class="bg_step_04">
                                    <img src="/resources/images/dentex/giveaway_01_01_05.png" alt="" class="bg_step_05">
                                    <img src="/resources/images/dentex/giveaway_01_02_01.png" alt="" class="bg_step_06">
                                    <img src="/resources/images/dentex/giveaway_01_02_02.png" alt="" class="bg_step_07">
                                    <img src="/resources/images/dentex/giveaway_01_02_03.png" alt="" class="bg_step_08">
                                    <img src="/resources/images/dentex/giveaway_01_02_04.png" alt="" class="bg_step_09">
                                    <img src="/resources/images/dentex/giveaway_01_02_05.png" alt="" class="bg_step_10">
                                    <img src="/resources/images/dentex/giveaway_01_02_06.png" alt="" class="bg_step_11">
                                    <img src="/resources/images/dentex/giveaway_01_03_01.png" alt="" class="bg_step_12">
                                    <img src="/resources/images/dentex/giveaway_01_03_02.png" alt="" class="bg_step_13">
                                    <img src="/resources/images/dentex/giveaway_01_03_03.png" alt="" class="bg_step_14">
                                    <img src="/resources/images/dentex/giveaway_01_03_04.png" alt="" class="bg_step_15">

                                </div>
                                <div class="bg_02">
                                    <img src="/resources/images/dentex/giveaway_02_01_01.png" alt="" class="bg_step_01">
                                    <img src="/resources/images/dentex/giveaway_02_01_02.png" alt="" class="bg_step_02">
                                    <img src="/resources/images/dentex/giveaway_02_02_01.png" alt="" class="bg_step_03">
                                    <img src="/resources/images/dentex/giveaway_02_02_02.png" alt="" class="bg_step_04">
                                    <img src="/resources/images/dentex/giveaway_02_02_03.png" alt="" class="bg_step_05">
                                    <img src="/resources/images/dentex/giveaway_02_02_04.png" alt="" class="bg_step_06">
                                    <img src="/resources/images/dentex/giveaway_02_02_05.png" alt="" class="bg_step_07">
                                    <img src="/resources/images/dentex/giveaway_02_02_06.png" alt="" class="bg_step_08">
                                    <img src="/resources/images/dentex/giveaway_02_02_07.png" alt="" class="bg_step_09">
                                    <img src="/resources/images/dentex/giveaway_02_03_01.png" alt="" class="bg_step_10">
                                    <img src="/resources/images/dentex/giveaway_02_03_02.png" alt="" class="bg_step_11">
                                    <img src="/resources/images/dentex/giveaway_02_03_03.png" alt="" class="bg_step_12">
                                </div>
                                <div class="bg_03">
                                    <img src="/resources/images/dentex/giveaway_03_01_01.png" alt="" class="bg_step_01">
                                    <img src="/resources/images/dentex/giveaway_03_01_02.png" alt="" class="bg_step_02">
                                    <img src="/resources/images/dentex/giveaway_03_02_01.png" alt="" class="bg_step_03">
                                    <img src="/resources/images/dentex/giveaway_03_02_02.png" alt="" class="bg_step_04">
                                </div>
                            </div>
                            <div class="img">
                                <img src="/resources/images/dentex/img_giveaway_01_b.png" alt="" class="img_01">
                                <img src="/resources/images/dentex/img_giveaway_02_b.png" alt="" class="img_02">
                                <img src="/resources/images/dentex/img_giveaway_03_b.png" alt="" class="img_03">
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
                                    <div class="desc">신세계 상품권 5만원권</div>
                                </div>
                                <div class="txt_03">
                                    <div class="title">축하합니다!</div> 
                                    <div class="tit">스타벅스</div>
                                    <div class="desc">아메리카노 Tall</div>
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