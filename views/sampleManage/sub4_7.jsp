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
		<section id="sub4_7" class="sub">
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
										<h4 class="on"><button>개인정보처리방침</button></h4>
										<h4><button>법적고지</button></h4>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<p>주식회사 메디밸류(이하 “회사”라 함)에서 운영하는 서비스인 메디밸류는 이용자들의 개인정보보호를 매우 중요시하며, 정보통신서비스 제공자가 준수하여야 하는 관련 법령 및 규정을 준수하고 있습니다. 회사는 개인정보처리방침을 홈페이지 첫 화면에 공개함으로써 이용자들이 언제나 용이하게 보실 수 있도록 조치하고 있습니다.<br><br>회사의 개인정보처리방침은 정부의 법률 및 지침 변경이나 회사의 내부 방침 변경 등으로 인하여 수시로 변경될 수 있고, 이에 따른 개인정보처리방침의 지속적인 개선을 위하여 필요한 절차를 정하고 있습니다. 그리고 개인정보처리방침을 개정하는 경우 회사는 개인정보처리방침 변경 시행 7일 전부터 회사 공지사항을 통하여 공지하고 개정 일자 등을 부여하여 개정된 사항을 이용자들이 쉽게 알아볼 수 있도록 하고 있습니다. <br><br>회사의 개인정보처리방침은 아래와 같은 내용을 담고 있습니다. </p>
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