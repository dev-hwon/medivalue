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
		<section id="sub4_8" class="sub">
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
										<h4><button>이용약관</button></h4>
										<h4><button>개인정보처리방침</button></h4>
										<h4 class="on"><button>법적고지</button></h4>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<p>주식회사 메디밸류(이하 "회사"라 함)은 링크, 다운로드, 광고 등을 포함하여 본 웹 사이트에 포함되어 있거나, 본 웹 사이트를 통해 배포,  전송되거나, 본 웹 사이트에 포함되어 있는 서비스로부터 접근되는 정보(이하 "자료")의 정확성이나 신뢰성에 대해 어떠한 보증도 하지 않으며,  서비스상의, 또는 서비스와 관련된 광고, 기타 정보 또는 제안의 결과로서 디스플레이, 구매 또는 취득하게 되는 상품 또는 기타 정보(이하 "상품")의 질에 대해서도 어떠한 보증도 하지 않습니다.</p>
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