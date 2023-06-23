<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){

			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub4_6" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<h3>고객센터</h3>
							
								<ul>
									<li><button>1:1문의</button></li>
									<li><button>공지사항</button></li>
									<li><button>이용안내</button></li>
									<li class="on"><button>법적고지</button></li>
								</ul>
							
								<div class="banner">
									<h4>주문/배송에<br>도움이 필요하신가요?</h4>
									<button>1:1 문의하기</button>
								</div>
							</div>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4 class="on"><button>이용약관</button></h4>
										<h4><button>개인정보처리방침</button></h4>
										<h4><button>법적고지</button></h4>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<p>메디밸류의 회원약관은 다음과 같습니다.<br><br>제1조 (목적)<br><br>이 약관은 주식회사 메디밸류가 운영하는 인터넷사이트 및/또는 모바일웹에서 제공하는 메디밸류가격비교, 광고/마케팅 관련 서비스 등</p>
									</div>
	
									<select name="" id="">
										<option value="">12차 이용약관(2021년 12월 22일)</option>
										<option value="">12차 이용약관(2021년 12월 22일)</option>
										<option value="">12차 이용약관(2021년 12월 22일)</option>
										<option value="">12차 이용약관(2021년 12월 22일)</option>
										<option value="">12차 이용약관(2021년 12월 22일)</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>