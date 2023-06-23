<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				${scriptMsg}
				$("#btn_find").on("click", function(event){
					event.preventDefault();
					if($("#accountName").val().trim() ==''){
						$("#pop_alarm_msg").text("가입시 등록하신 이름을 입력해주세요.");
						$("#black").show();
						$(".popup_message_type_1").show();
					}else if($("#accountId").val().trim() ==''){
						$("#pop_alarm_msg").text("가입시 등록하신 아이디를 입력해주세요.");
						$("#black").show();
						$(".popup_message_type_1").show();
					}else if($("#accountEmail").val().trim() ==''){
						$("#pop_alarm_msg").text("가입시 등록하신 메일주소를 입력해주세요.");
						$("#black").show();
						$(".popup_message_type_1").show();
					}else{
						$("#f_find_pw").submit();
					}
				});

				$("#btn_ok").on("click",function(){
					$(".popup_message_type_2").css("display","none");
					$("#black").css("display","none");
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub0_1_2" class="sub">
		<article class="cnt1">
			<div class="area">
				<div class="real_area">
					<form id="f_find_pw" name="f_find_pw" action="/member/find/pw_check_step" method="post">
						<div class="find_pw_wrap">
							<h3>비밀번호 찾기</h3>
							<ul>
								<li class="find_pw_li1">
									<h4>이름</h4>
									<div class="form_cont">
										<input type="text" id="accountName" name="member_name">
										<label for="accountName">고객님의 이름을 입력해주세요.</label>
									</div>
								</li>

								<li class="find_pw_li2">
									<h4>아이디</h4>
									<div class="form_cont">
										<input type="text" id="accountId" name="member_id">
										<label for="accountId">아이디를 입력해주세요.</label>
									</div>
								</li>

								<li class="find_pw_li3">
									<h4>이메일</h4>
									<div class="form_cont">
										<input type="text" id="accountEmail" name="member_email">
										<label for="accountEmail">이메일 주소를 입력해주세요.</label>
									</div>
								</li>

								<li class="find_pw_li4">
									<a href="#">
										<p id="btn_find">찾기</p>
									</a>
								</li>
							</ul>
						</div>
					</form>
				</div>
			</div>
		</article>
	</section>

	</jsp:body>
</layout:basicFrame>