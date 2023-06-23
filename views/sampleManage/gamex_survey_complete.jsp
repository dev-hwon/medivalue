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
                <section class="sec_complete">
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">수고하셨습니다~! 설문이 완료되었어요.<br>100% 당첨 이벤트 참여하시고 경품 꼭 받아가세요.</div>
                            </div>
                            <div class="img_wrap">
                                <a href="/sample/gamex_survey_login"><img src="/resources/images/gamex_survey/img_complete.png" alt="medivalue"></a>
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