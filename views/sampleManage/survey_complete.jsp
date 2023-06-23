<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
    <link rel="shortcut icon" href="https://medivalue.co.kr/resources/images/dentex/favicon/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="https://medivalue.co.kr/resources/images/dentex/favicon/favicon.png">
    <link rel="stylesheet" type="text/css" href="/resources/css/survey.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/slick.css" />
    <script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/resources/js/slick.min.js"></script>
    <script type="text/javascript" src="/resources/js/survey.js"></script>
</head>
<body>
    <div id="wrap">
        <div id="container" class="main">
            <main>
                <nav>
                    <div class="home">
                        <a href="/sample/survey_login">
                            <img src="/resources/images/survey/ico_home.png" alt="">
                        </a>
                    </div>
<%--                    <div class="inner">--%>
<%--                        <div class="progress">--%>
<%--                            <div class="progress_bar"></div>--%>
<%--                        </div>--%>
<%--                        <div class="percent">0%</div>--%>
<%--                    </div>--%>
                </nav>
                <section class="sec_intro">
                    <article>
                        <div class="inner">
                            <div class="img_wrap">
                            	<a href="/sample/survey_login"><img src="/resources/images/survey/ico_logo.png" alt="medivalue"></a>
                            </div>
                            <div class="txt_wrap">
                                설문 완료 후 직원에게 말씀해주시면<br>100% 경품 당첨 이벤트 안내를 받으실 수 있습니다.
                            </div>
                            <div class="ques_wrap">
                                <div class="img">
                                    <img src="/resources/images/survey/img_intro.png" alt="">
                                </div>
                                <div class="txt">
                                    설문에 응답해 주셔 감사합니다 :)<br>
                                    대박 치과가 될 수 있도록 응원하겠습니다!<br>
                                    지금까지 스마트한 원장님들의 선택 도우미<br>
                                    <span>메디</span>였습니다~!!
                                </div>
                            </div>
                        </div>
                    </article>
                </section>
            </main>
        </div>
    </div>
</body>
</html>