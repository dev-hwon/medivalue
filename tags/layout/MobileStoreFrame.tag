<%@ tag import="org.springframework.web.context.WebApplicationContext" %>
<%@ tag import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ tag language="java" description="" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@attribute name="stylesheet" fragment="true" %>
<%@attribute name="javascript" fragment="true" %>
<%@attribute name="structure" fragment="true" %>

<%
	ServletContext sc = request.getSession().getServletContext();
	WebApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(sc);
	String profile = applicationContext.getEnvironment().getProperty("spring.profiles.active");

	if(request.getCookies() != null){
		for(Cookie c : request.getCookies()){
			if(c.getName().equals("medivalue_web")){
				String encryptAuth = c.getValue();
				int authExpire = Integer.parseInt(request.getSession().getServletContext().getInitParameter("authExpire")) * 60 * 8;
				Cookie cookie = new Cookie("medivalue_web", encryptAuth);
				cookie.setMaxAge(authExpire);
				cookie.setPath("/");
				if(profile.equals("dev")){
					cookie.setDomain(".devmedi.com");
				}else if(profile.equals("real")){
					cookie.setDomain(".medivalue.co.kr");
				}
				response.addCookie(cookie);
			}
		}
	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="robots" content="all">
    <title>Medivalue ${requestScope.view_title} ${menu_name}</title>
    <meta name="description" content="최초의 의료재료 직거래 커머스 플랫폼">
    <meta name="keywords" content="치과재료 가격비교, 치과의약품, 교정,기구,소장비,치과재료, 알지네이트, 소독용액, 교정재료, 기공재료, 기공용 재료, 치과재료, 최저가치과재료, 치과재료싼곳, 치과재료특판, 임플란트재료, 임플란트기구,임플란트장비, 치과장비, DENTAL,치과재료,치과재료전문업체,덴탈,치자재,인상재,레진,세멘트,근관치료,충전재,에칭,본드,임프레션,트레이,교정기구,치과위생용품판매,특판,치과치재료,미백,임플란트">
    <!-- og -->
    <meta property="og:title" content="의료 인프라 혁신 기업">
    <meta property="og:description" content="최초의 의료재료 직거래 커머스 플랫폼">
    <%-- <meta property="og:image" content="/resources/images/main_renew/img_og_image.jpg">--%>

	<link rel="shortcut icon" href="/resources/images/favicon/favicon.png" />

    <!-- css -->
    <link href="/resources/css/swiper-bundle.min.css" rel="stylesheet" >
    <link href="/resources/css/mobile/common.css" rel="stylesheet" >
    <link href="/resources/css/mobile/headfoot.css" rel="stylesheet" >
    <jsp:invoke fragment="stylesheet"/>

    <!-- js -->
    <script src="/resources/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="/resources/js/swiper-bundle.min.js" type="text/javascript"></script>
    <script src="/resources/js/mobile/common.js" type="text/javascript" defer></script>
    <jsp:invoke fragment="javascript"/>
</head>
<body>
    <div class="page_bg_default">
        <layout:MobileStoreHeaderFrame/>
        <jsp:doBody/>
    </div>
</body>
</html>