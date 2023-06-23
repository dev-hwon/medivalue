<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.5, user-scalable=yes">
    <meta name="robots" content="all">
    <title>Medivalue | 상품명나와야함 | 이미지 확대보기</title>
    <meta name="description" content="최초의 의료재료 직거래 커머스 플랫폼">
    <meta name="keywords" content="치과재료 가격비교, 치과의약품, 교정,기구,소장비,치과재료, 알지네이트, 소독용액, 교정재료, 기공재료, 기공용 재료, 치과재료, 최저가치과재료, 치과재료싼곳, 치과재료특판, 임플란트재료, 임플란트기구,임플란트장비, 치과장비, DENTAL,치과재료,치과재료전문업체,덴탈,치자재,인상재,레진,세멘트,근관치료,충전재,에칭,본드,임프레션,트레이,교정기구,치과위생용품판매,특판,치과치재료,미백,임플란트">
    <!-- og -->
    <meta property="og:title" content="의료 인프라 혁신 기업">
    <meta property="og:description" content="최초의 의료재료 직거래 커머스 플랫폼">
    <%-- <meta property="og:image" content="/resources/images/main_renew/img_og_image.jpg">--%>

    <link rel="shortcut icon" href="/resources/images/favicon/favicon.png" />

    <!-- css -->
    <link href="/resources/css/mobile/common.css" rel="stylesheet" >
    <link href="/resources/css/mobile/headfoot.css" rel="stylesheet" >
    <link href="/resources/css/mobile/view.css" rel="stylesheet" >

    <!-- js -->
    <script src="/resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="/resources/js/mobile/common.js" type="text/javascript" defer></script>
</head>
<body>
<div class="m_contents m_view">
    <section class="zoom_img">
        <div class="container container_full">
            <div class="tx_tit">상세보기
                <button type="button" class="btn_close"><i class="ic_svg icon_close"></i></button>
            </div>
            <div class="img_wrap">
                <img src="/resources/images/sample/sample_img.png" alt="" class="fit_contain"/>
                <div class="tx_notice">
                    <img src="/resources/images/mobile/icon_zoom.svg" alt="" />
                    이미지 확대해서<br />볼 수 있습니다.
                </div>
            </div>
        </div>
    </section>
</div>
<script>
    setTimeout(function(){
        $('.tx_notice').fadeOut(800, function(){
            $(this).remove();
        })
    },1500)
</script>
</body>
</html>
