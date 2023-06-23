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
    <link rel="stylesheet" type="text/css" href="/resources/css/sidex_survey.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/slick.css" />
    <script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/resources/js/slick.min.js"></script>
    <script type="text/javascript" src="/resources/js/sidex_survey.js"></script>
</head>
<body>
    <div id="wrap">
        <div id="container" class="main">
            <main>
                <div class="comm_bg">
                    <img src="/resources/images/sidex_survey/bg_sidex_survey_shape_01_b.png" alt="" class="img_bg_shape_01">
                    <img src="/resources/images/sidex_survey/bg_sidex_survey_shape_02_b.png" alt="" class="img_bg_shape_02">
                    <img src="/resources/images/sidex_survey/bg_sidex_survey_shape_03_b.png" alt="" class="img_bg_shape_03">
                </div>
                <section class="sec_intro">
                    <article>
                        <div class="inner">
                            <div class="img_wrap">
                                <a href="/survey/login"><img src="/resources/images/sidex_survey/ico_logo.png" alt="medivalue"></a>
                            </div>
                            <div class="btn_wrap">
                                <div class="desc">설문 참여하고 100% 당첨 이벤트에서 경품 받아 가세요!</div>
                                <a href="/survey/main" class="btn_start" >30초 설문 시작하기</a>
                                <div class="copyright">Copyright © MEDIVALUE Corp. All Rights Reserved</div>
                            </div>
                        </div>
                    </article>
                </section>
            </main>
        </div>
    </div>
</body>
</html>