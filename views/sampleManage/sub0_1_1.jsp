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
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				$("#sub0_1_1 .cnt1 .area .real_area .login_error .le_close, #sub0_1_1 .cnt1 .area .real_area .login_error .le_btn_wrap .le_cancel").on("click", function  () {
					$(".login_error").css("display","none");
					$("#black").css("display","none");
				});
	
				$("#black").on("click", function  () {
					$(".login_error").css("display","none");
					$(this).css("display","none");
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub0_1_1" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="login_wrap">
							<h3>로그인</h3>
							
							<ul>
								<li class="login_li1">
									<div class="form_cont">
										<input type="text" id="joinId">
										<label for="joinId">아이디를 입력해주세요</label>
									</div>
								</li>
											
								<li class="login_li2">
									<div class="form_cont">
										<input type="password" id="joinPw">
										<label for="joinPw">비밀번호를 입력해주세요</label>
									</div>
								</li>
											
								<li class="login_li3 clear">
									<div class="left">
										<input id="joinChk" type="checkbox">
										<label for="joinChk">아이디 기억하기</label>
									</div>
											
									<div class="right clear">
										<a href="" class="find_id">아이디 찾기</a>
										<a href="" class="find_pw">비밀번호 찾기</a>
									</div>
								</li>
											
								<li class="login_li5">
									<a href="">
										<p>로그인</p>
									</a>
								</li>
											
								<li class="login_li6">
									<a href="">
										<p>회원가입</p>
									</a>
								</li>
							</ul>
						</div>
						
						<!-- 팝업 -->
						<div class="login_error">
							<button class="le_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>
							<div class="tit">
								<h4>알림메세지</h4>
							</div>
							<div class="txt">
								<p>사용자정보가<br>존재하지 않습니다.</p>
							</div>
							<div class="le_btn_wrap">
								<button class="le_ok">확인</button>
								<button class="le_cancel">취소</button>
							</div>
						</div>
						<!-- 팝업 -->
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>