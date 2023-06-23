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
    <link rel="stylesheet" type="text/css" href="/resources/css/gamex_survey.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/slick.css" />
    <script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/resources/js/slick.min.js"></script>
    <script type="text/javascript" src="/resources/js/gamex_survey.js"></script>
</head>
<body>
    <div id="wrap">
        <div id="container" class="main">
            <main>
                <section class="sec_intro">
                    <article>
                        <div class="inner">
                            <div class="img_wrap">
                                <a href="/survey/gamex/${req_type}/login"><img src="/resources/images/gamex_survey/ico_logo.png" alt="medivalue"></a>
                            </div>
                            <div class="ques_wrap">
                                <div class="img">
                                    <img src="/resources/images/gamex_survey/img_intro.png" alt="">
                                </div>
                                <div class="txt">
                                    안녕하세요!<br>
                                    <b>치과재료 커머스 플랫폼 메디밸류입니다.</b><br>
                                    치과재료에 대한 모든 이야기를<br>
                                    속 시원~하게 저와 함께 해볼까요?
                                </div>
                            </div>
                            <div class="btn_wrap">
                                <div class="desc">설문 참여하면 100% 당첨 이벤트에서 경품을 받을 수 있어요😊</div>
                                <a href="/survey/gamex/${req_type}/main" class="btn_start" >30초 만에 끝내는 설문 시작하기</a>
                            </div>
                            <div class="copyright">Copyright © MEDIVALUE Corp. All Rights Reserved</div>
                        </div>
                    </article>
                </section>
            </main>
        </div>
    </div>
</body>
</html>