<%@ tag import="org.springframework.web.context.WebApplicationContext" %>
<%@ tag import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ tag language="java" description="" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@attribute name="stylesheet" fragment="true" %>
<%@attribute name="javascript" fragment="true" %>
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
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="robots" content="all" />
	    <meta name="format-detection" content="telephone=no">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, target-densityDpi=medium-dpi"/>
		<meta property="og:title" content="디지털 의료 인프라 혁신을 선도하는 메디밸류">
	    <meta property="og:description" content="치과재료 금액 비교 서비스 메디밸류">	    
	    <meta property="og:image" content="/resources/images/ico/ico_logo.png">
	    <meta name="robots" content="index,follow">
  		<title>Medivalue ${menu_name} </title>
  		<meta name="keywords" content="치과재료 가격비교, 치과의약품, 교정,기구,소장비,치과재료, 알지네이트, 소독용액, 교정재료, 기공재료, 기공용 재료, 치과재료, 최저가치과재료, 치과재료싼곳, 치과재료특판, 임플란트재료, 임플란트기구,임플란트장비, 치과장비, DENTAL,치과재료,치과재료전문업체,덴탈,치자재,인상재,레진,세멘트,근관치료,충전재,에칭,본드,임프레션,트레이,교정기구,치과위생용품판매,특판,치과치재료,미백,임플란트">
  		<%--
  		<link rel="apple-touch-icon" sizes="" href="#" />
  		--%>
  		<link rel="shortcut icon" href="/resources/images/favicon/favicon.png" />
  		
  		<jsp:invoke fragment="stylesheet"/>
  		<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
  		<script>
  			var g_check_login = "";
  			$(document).ready(function (){
  				$("#btn_main_login, #btn_main_top_login").on("click",function(){
  					location.replace('/access/login');
  				});
  				
  				$("#btn_main_logout").on("click",function(){
  					location.replace('/access/logout');
  				});
  				
  				$("#btn_main_top_join").on("click",function(){
  					location.replace('/member/join');
  				});
  				$("button.le_close").on("click",function(){
  					$(".popup_message_type_1").hide();
  					$("#black").hide();
  				});
  				
  				$("#btn_main_top_logout").on("click",function(){
  					location.replace('/access/logout');
  				});
  				
  				$("#btn_top_search").on("click",function(){
  					if($("#searchString").val() !='' && $("#searchString").val().trim().length>2){
  						$("#frm_search").submit();	
  					}
  				});
  				g_check_login = "${loginInfo.fd_member_id}";
  			});
  		</script>
  		<jsp:invoke fragment="javascript"/>  		
  		<!-- 조건부주석 : html5, 미디어쿼리를 해석하지 못하는 하위브라우저를 위한 스크립트 추가, 
  		스타일 아래쪽에 respond.min.js위치 해야 해석된다, local에서는 동작하지 않고 서버에서 확인함 -->
  		<!--[if lt IE 9]>
		<script type="text/javascript" src="/resources/js/html5.js"></script>
		<script type="text/javascript" src="/resources/js/respond.min.js"></script>
		<script type="text/javascript" src="/resources/js/modernizr.custom.js"></script>
  		<![endif]-->
 	</head>
	<body>
		<div id="black"></div>
		<div id="black2"></div>
		<div id="black3"></div>

		<jsp:doBody/>
		<!-- 팝업 -->
		<div class="popup_message_type_1">
			<button class="le_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>
			<div class="tit">
				<h4>메시지</h4>
			</div>
			<div class="txt">
				<p id="pop_alarm_msg" style="width:100%;">사용자정보가<br>존재하지 않습니다.</p>
			</div>
			<div class="le_btn_wrap">
				<button type="button" class="one_btn" id="btn_ok">확인</button>
				<%--
				<button class="le_ok">확인</button>
				<button class="le_cancel">취소</button>
				 --%>
			</div>
		</div>
		<!-- 팝업 -->
		<div class="popup_message_type_2">
<%--			<button class="le_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>--%>
			<div class="tit">
				<h4>알림메시지</h4>
			</div>
			<div class="txt">
				<p id="pop_alarm_msg_2" style="width:100%;">사용자정보가<br>존재하지 않습니다.</p>
			</div>
			<div class="le_btn_wrap">
				<button class="le_ok">확인</button>
				<button class="le_cancel">취소</button>
			</div>
		</div>

		<div id="cartPopup1" class="cart_popup on"> <!-- 옵션없음 -->
			<ul class="pop_item">
				<li class="cart_pu_li1">
					<div class="pk_idx d-none" style="display: none;"></div>
					<h3 class="pop_tit">장바구니 제품</h3>
				</li>

				<li class="cart_pu_li2 clear">
					<div class="price clear">
						<strong class="pop_price">0원</strong>
						<p></p><%-- 이전금액 --%>
					</div>

					<div class="quan_box clear">
						<button type="button" class="minus">-</button>
						<div class="form_cont">
							<label for="cartP1"></label>
							<input type="text" id="cartP1" class="num pop_cnt" value="1">
						</div>
						<button type="button" class="plus">+</button>
					</div>
				</li>

				<li class="cart_pu_li3 clear">
					<div class="cau clear">
						<%--
                        <span>한정</span>
                        <p>최대 3개까지 구매가능</p>
                        --%>
					</div>

					<div class="total_price clear">
						<h6>합계</h6>
						<strong class="pop_tot_price">0</strong>
						<span>원</span>
					</div>
				</li>

				<li class="cart_pu_li4 clar">
					<button type="button" class="buy_btn">구매하기</button>
<%--					<button type="button" class="cart_go_btn">구매하기</button>--%>
					<button type="button" class="cancel_btn">취소</button>
				</li>
			</ul>
		</div>

		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=G-8KQYG7PLBR"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		  gtag('config', 'G-8KQYG7PLBR');
		</script>	
	</body>
</html>