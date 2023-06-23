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
	<meta property="og:description" content="최초의 의료재료 직거래 커머스 플랫폼">
	<meta name="description" content="최초의 의료재료 직거래 커머스 플랫폼">
	<meta property="og:image" content="/resources/images/main_renew/img_og_image.jpg">
	<meta name="robots" content="index,follow">
	<title>Medivalue ${requestScope.view_title} ${menu_name}</title>
	<meta name="keywords" content="치과재료 가격비교, 치과의약품, 교정,기구,소장비,치과재료, 알지네이트, 소독용액, 교정재료, 기공재료, 기공용 재료, 치과재료, 최저가치과재료, 치과재료싼곳, 치과재료특판, 임플란트재료, 임플란트기구,임플란트장비, 치과장비, DENTAL,치과재료,치과재료전문업체,덴탈,치자재,인상재,레진,세멘트,근관치료,충전재,에칭,본드,임프레션,트레이,교정기구,치과위생용품판매,특판,치과치재료,미백,임플란트">
	<meta name="facebook-domain-verification" content="y897sddoemjy5t70g34rjvlv1jenxo" />
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-LXDZ7MY47C"></script>
	<c:choose>
		<c:when test="${requestScope.g_user_info !=null and requestScope.g_user_info  ne ''}">
			<script>
			  window.dataLayer = window.dataLayer || [];
			  function gtag(){dataLayer.push(arguments);}			  
			  gtag('set','user_properties',{
				  	'user_info':'medivalue_${loginInfo.fk_tmi_idx}',
				  	'user_order_yn':'${requestScope.g_user_order_yn}',
					'user_order_cnt':'${requestScope.g_user_order_cnt}'
			  });
			  gtag('js', new Date());
			  gtag('config', 'G-LXDZ7MY47C');
			</script>
		</c:when>
		<c:otherwise>
			<script>
				window.dataLayer = window.dataLayer || [];
			  	function gtag(){dataLayer.push(arguments);}
			  	gtag('js', new Date());
			  	gtag('config', 'G-LXDZ7MY47C');
			</script>
		</c:otherwise>
	</c:choose>
	<!-- Google Tag Manager -->
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-5RNFZSC');</script>
	<!-- End Google Tag Manager -->
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-198897613-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-198897613-1');
	</script>
	
	<%--
    <link rel="apple-touch-icon" sizes="" href="#" />
    --%>
	<link rel="shortcut icon" href="/resources/images/favicon/favicon.png" />

	<jsp:invoke fragment="stylesheet"/>
	<link rel="stylesheet" href="/resources/css/layout.css?v=20230320" />
	<link rel="stylesheet" href="/resources/css/main_renew.css?v=20230410" />
	<link rel="stylesheet" href="/resources/css/sub_renew.css?v=20230320" />
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

		function logOut(){
			location.replace('/access/logout');
		}
	</script>
	<jsp:invoke fragment="javascript"/>
	<!-- 조건부주석 : html5, 미디어쿼리를 해석하지 못하는 하위브라우저를 위한 스크립트 추가,
    스타일 아래쪽에 respond.min.js위치 해야 해석된다, local에서는 동작하지 않고 서버에서 확인함 -->
	<!--[if lt IE 9]>
	<script type="text/javascript" src="/resources/js/html5.js"></script>
	<script type="text/javascript" src="/resources/js/respond.min.js"></script>
	<script type="text/javascript" src="/resources/js/modernizr.custom.js"></script>
	<![endif]-->
	
	<!-- Meta Pixel Code -->
	<script>
	    ! function (f, b, e, v, n, t, s) {
	        if (f.fbq) return;
	        n = f.fbq = function () {
	            n.callMethod ? n.callMethod.apply(n, arguments) : n.queue.push(arguments)
	        };
	        if (!f._fbq) f._fbq = n;
	        n.push = n;
	        n.loaded = !0;
	        n.version = '2.0';
	        n.queue = [];
	        t = b.createElement(e);
	        t.async = !0;
	        t.src = v;
	        s = b.getElementsByTagName(e)[0];
	        s.parentNode.insertBefore(t, s)
	    }(window, document, 'script', 'https://connect.facebook.net/en_US/fbevents.js');
	    fbq('init', '1429311067582739');
	    fbq('track', 'PageView');
	</script>
	<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=1429311067582739&ev=PageView&noscript=1" /></noscript>
	<!-- End Meta Pixel Code -->
</head>
<body>
	<!-- Google Tag Manager (noscript) -->
	<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WT6XQX6"
					  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->
	
	<!-- Google Tag Manager (noscript) -->
	<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5RNFZSC"
	height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->
<layout:headerCommonFrame/>
<layout:headerFrameRenew/>
<jsp:doBody/>
<layout:footerFrameRenew/>
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
		<button class="le_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>
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
	
	<div class="ai_simple_popup_wrap">

	<!--AI 기공수가 확인 팝업 (진행전)-->
	<c:if test="${loginInfo != null}">
	<div class="comm_popup ai_simple_ready_popup pop_small" style="opacity: 0; visibility: hidden;">
	  <div class="bg" onclick="closePopup(this);"></div>
	  <div class="content">
		<div class="popup_inner">
		  <div class="head">
			<div class="title"><span class="txt_primary">AI</span> 기공수가 간편확인</div>
			<div class="descript"></div>
			<div class="util">
			  <div class="comm_button"><button type="button" class="btn_close" onclick="closePopup(this);"></button></div>
			</div>
		  </div>
		  <div class="body">
			<div class="cont">
			  <div class="txt_pop_text_ai_1">
				<b>메디밸류 AI</b>가 <b id="aiPopupName" class="primary_color" style="color: #4876EF;">${loginInfo.fd_medical_name}</b>만을 위해<br>
				꼭 맞는 기공소를 선별예정입니다.
			  </div>
			  <div class="loading">
				<img src="/resources/images/main_renew/ico_loading_ai.gif" alt="">
			  </div>
			  <div class="txt_pop_text_ai_1">계속 진행할까요?</div>
			</div>
			<div class="form">
			  <a href="javascript:;" class="btn_dropdown txt_pop_text_ai_2 toggleAiPopup" onclick="toggleAiPopupAcc(this)">요청사항 입력하기</a>
			  <div class="input">
				<div class="txt_pop_text_ai_2"><b>문의 내용 (선택)</b></div>
				<textarea id="simpleFeeMemo" placeholder="주 거래 품목, 희망가격, 작업기간, 평균 거래량, 기타 요청사항등을 적어주세요."></textarea>
			  </div>
			</div>
		  </div>
		</div>
		<div class="foot">
		  <div class="comm_button">
			<button type="button" id="aiPopupBtn" class="btn_primary" onclick="simpleFeeRegister(${loginInfo.fk_tmi_idx})">계속 진행</button>
		  </div>
		</div>
	  </div>
	</div>
	</c:if>
	
	 <!--AI 기공수가 확인 팝업 (선별완료)-->
	<c:if test="${loginInfo != null}">
    <div class="comm_popup ai_simple_check_popup pop_small" style="opacity: 0; visibility: hidden;">
      <div class="bg" onclick="closePopup(this);"></div>
      <div class="content">
        <div class="popup_inner">
          <div class="head">
            <div class="title"><span class="txt_primary">AI</span> 기공수가 간편확인</div>
            <div class="descript"></div>
            <div class="util">
              <div class="comm_button"><button type="button" class="btn_close" onclick="closePopup(this);"></button></div>
            </div>
          </div>
          <div class="body">
            <div class="cont">
              <div class="txt_pop_text_ai_1">
                <b>메디밸류 AI</b>가<br><b><span id="main_sub_title_1" class="primary_color" style="color: #4876EF;">10곳</span>의 기공소</b>를 선별했어요.
              </div>
              <div class="loading">
                <img src="/resources/images/main_renew/ico_loading_ai.gif" alt="">
              </div>
              <div class="txt_pop_text_ai_1">선별된 기공소에게 기공수가표를 요청했어요.<br>기공소측의 담당자가 답변을 준비중이에요.</div>
            </div>
            <div class="info">
              <div class="txt_pop_text_ai_2 primary_color weight_medium" style="color: #4876EF;">참고하세요</div>
              <div class="txt_pop_text_ai_3">
                - 문의하신 내용의 답변은 [나의 견적 상담 내역]을 통해 확인할 수 있습니다.<br>
                - 기공소 담당자 사정에 따라 답변이 지연될 수 있습니다.
              </div>
            </div>
          </div>
        </div>
        <div class="foot">
          <div class="comm_button">
            <button type="button" class="btn_primary" onclick="btn_hrefLink('${dt_info}','/estimate/list')">나의 문의내역</button>
          </div>
        </div>
      </div>
    </div>
	</c:if>

	<!--AI 기공수가 확인 팝업 (이미완료)-->
	<c:if test="${loginInfo != null}">
    <div class="comm_popup ai_simple_complete_popup pop_small" style="opacity: 0; visibility: hidden;">
      <div class="bg" onclick="closePopup(this);"></div>
      <div class="content">
        <div class="popup_inner">
          <div class="head">
            <div class="title"><span class="txt_primary">AI</span> 기공수가 간편확인</div>
            <div class="descript"></div>
            <div class="util">
              <div class="comm_button"><button type="button" class="btn_close" onclick="closePopup(this);"></button></div>
            </div>
          </div>
          <div class="body">
            <div class="cont">
              <div class="txt_pop_text_ai_1">이미 요청하신 내용이 있습니다.</div>
              <div class="loading">
                <img src="/resources/images/main_renew/ico_loading_ai.gif" alt="">
              </div>
              <div id="main_sub_title_2" class="txt_pop_text_ai_1"></div>
            </div>
          </div>
        </div>
        <div class="foot">
          <div class="comm_button">
            <button type="button" class="btn_primary" onclick="btn_hrefLink('${dt_info}','/estimate/list')">나의 문의내역</button>
          </div>
        </div>
      </div>
    </div>
	</c:if>
	</div>
	
	<div class="notification_wrap">
    <div class="content">
      <div class="noti_inner">
        <div class="head">
          <div class="title">
            <span class="color">하마치과님</span>의 알림함<a href="javascript:;" class="bubble_alert">i<i class="bubble_text">알림은 최대 30일간 보관됩니다.</i></a>
          </div>
          <div class="util">
            <button type="button" class="btn_close"  onclick="notiSideHide();"></button>
          </div>
        </div>
        <div class="body">
          <div class="noti_tab">
            <ul>
              <li class="on">
                <div>
                  <button type="button" onclick="notiSideTabHandler(this)">전체</button>
                </div>
              </li>
              <li>
                <div>
                  <button type="button" onclick="notiSideTabHandler(this)">간편수가</button>
                </div>
              </li>
              <li>
                <div>
                  <button type="button" onclick="notiSideTabHandler(this)">MV재료</button>
                </div>
              </li>
              <li>
                <div>
                  <button type="button" onclick="notiSideTabHandler(this)">MV기공</button>
                </div>
              </li>
              <li>
                <div>
                  <button type="button" onclick="notiSideTabHandler(this)">공지</button>
                </div>
              </li>
            </ul>
          </div>
          <div class="noti_list">
            <ul>
              <li class="on">
                <div>
                  <div class="hd">
                    <div class="tit">MV재료</div>
                    <div class="date">2023-09-30</div>
                  </div>
                  <div class="bd">
                    <div class="txt">주문하신 상품이 배송중입니다. 주문하신 상품이 배송중입니다. 주문하신 상품이 배송중입니다.주문하신 상품이 배송중입니다. 주문하신 상품이 배송중입니다. 주문하신 상품이 배송중입니다.주문하신 상품이 배송중입니다. 주문하신 상품이 배송중입니다. 주문하신 상품이 배송중입니다.</div>
                  </div>
                  <div class="ft">
                    <a href="#" class="btn_more">더보기 ></a>
                  </div>
                </div>
              </li>
              <li class="on">
                <div>
                  <div class="hd">
                    <div class="tit">MV재료</div>
                    <div class="date">2023-09-30</div>
                  </div>
                  <div class="bd">
                    <div class="txt">주문하신 상품이 배송중입니다.<br>주문하신 상품이 배송중입니다.</div>
                  </div>
                  <div class="ft">
                    <a href="#" class="btn_more">더보기 ></a>
                  </div>
                </div>
              </li>
              <li>
                <div>
                  <div class="hd">
                    <div class="tit">MV재료</div>
                    <div class="date">2023-09-30</div>
                  </div>
                  <div class="bd">
                    <div class="txt">주문하신 상품이 배송중입니다.</div>
                  </div>
                </div>
              </li>
              <li>
                <div>
                  <div class="hd">
                    <div class="tit">MV재료</div>
                    <div class="date">2023-09-30</div>
                  </div>
                  <div class="bd">
                    <div class="txt">주문하신 상품이 배송중입니다.</div>
                  </div>
                  <div class="ft">
                    <a href="#" class="btn_more">더보기 ></a>
                  </div>
                </div>
              </li>
              <li>
                <div>
                  <div class="hd">
                    <div class="tit">MV재료</div>
                    <div class="date">2023-09-30</div>
                  </div>
                  <div class="bd">
                    <div class="txt">주문하신 상품이 배송중입니다.</div>
                  </div>
                  <div class="ft">
                    <a href="#" class="btn_more">더보기 ></a>
                  </div>
                </div>
              </li>
              <li>
                <div>
                  <div class="hd">
                    <div class="tit">MV재료</div>
                    <div class="date">2023-09-30</div>
                  </div>
                  <div class="bd">
                    <div class="txt">주문하신 상품이 배송중입니다.</div>
                  </div>
                  <div class="ft">
                    <a href="#" class="btn_more">더보기 ></a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  
</body>
</html>