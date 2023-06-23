<%@ tag import="org.springframework.web.context.WebApplicationContext" %>
<%@ tag import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ tag language="java" description="" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@attribute name="stylesheet" fragment="true" %>
<%@attribute name="javascript" fragment="true" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="robots" content="all" />
	    <meta name="format-detection" content="telephone=no">
		<meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
		<meta property="og:title" content="디지털 의료 인프라 혁신을 선도하는 메디밸류">
	    <meta property="og:description" content="치과재료 금액 비교 서비스 메디밸류">	    
	    <meta property="og:image" content="/resources/images/ico/ico_logo.png">
	    <meta name="robots" content="index,follow">
  		<title>Medivalue ${menu_name} </title>
  		<meta name="keywords" content="치과재료 가격비교, 치과의약품, 교정,기구,소장비,치과재료, 알지네이트, 소독용액, 교정재료, 기공재료, 기공용 재료, 치과재료, 최저가치과재료, 치과재료싼곳, 치과재료특판, 임플란트재료, 임플란트기구,임플란트장비, 치과장비, DENTAL,치과재료,치과재료전문업체,덴탈,치자재,인상재,레진,세멘트,근관치료,충전재,에칭,본드,임프레션,트레이,교정기구,치과위생용품판매,특판,치과치재료,미백,임플란트">

  		<link rel="shortcut icon" href="/resources/images/favicon/favicon.png" />
<%--		<link rel="shortcut icon" href="https://medivalue.co.kr/resources/images/dentex/favicon/favicon.png">--%>
		<link rel="apple-touch-icon-precomposed" href="/resources/images/favicon/favicon.png">
		<link rel="stylesheet" type="text/css" href="/resources/css/survey.css" />
		<link rel="stylesheet" type="text/css" href="/resources/css/slick.css" />
		<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
		<script type="text/javascript" src="/resources/js/slick.min.js"></script>
		<script type="text/javascript" src="/resources/js/survey.js"></script>
		<jsp:invoke fragment="javascript"/>
	</head>
	<body>
<%--		<div id="black"></div>--%>
<%--		<div id="black2"></div>--%>
<%--		<div id="black3"></div>--%>

		<jsp:doBody/>
		<!-- 팝업 -->

		<!-- Global site tag (gtag.js) - Google Analytics -->
<%--		<script async src="https://www.googletagmanager.com/gtag/js?id=G-8KQYG7PLBR"></script>--%>
<%--		<script>--%>
<%--		  window.dataLayer = window.dataLayer || [];--%>
<%--		  function gtag(){dataLayer.push(arguments);}--%>
<%--		  gtag('js', new Date());--%>
<%--		  gtag('config', 'G-8KQYG7PLBR');--%>
<%--		</script>--%>
	</body>
</html>