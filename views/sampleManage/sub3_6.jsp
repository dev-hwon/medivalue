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
			
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub3_6" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<h3>내 계정</h3>
							
								<ul>
									<li><button>주문배송 조회</button></li>
									<li><button>배송지관리</button></li>
									<li><button>포인트 쿠폰</button></li>
									<li class="on"><button>회원정보 수정</button></li>
								</ul>
							
								<div class="banner">
									<h4>주문/배송에<br>도움이 필요하신가요?</h4>
									<button>1:1 문의하기</button>
								</div>
							</div>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>회원정보</h4>
									</div>
								</div>
							
								<div class="right_txt">
									<p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요</p>
	
									<div class="pw_login_wrap">
										<div class="pw_login clear">
											<h5>비밀번호<span><img src="/resources/images/main/join_mark1.jpg" width="8" height="8" border="0" alt="" /></span></h5>
											
											<div class="form_cont">
												<label for="pwl">비밀번호를 입력해주세요</label>
												<input type="text" id="pwl">
											</div>
										</div>
									</div>
	
									<div class="clear">
										<button class="ok_btn">확인</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>