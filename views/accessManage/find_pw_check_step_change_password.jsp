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
			var proc_state = false;
			$(document).ready(function (){
				${scriptMsg}

				var check_code = '${rtn_code}';

				if(check_code !='200'){
					$("#pop_alarm_msg").text('${rtn_msg}');
					$("#black").show();
					$(".popup_message_type_1").show();
					$(".one_btn").addClass("check_prev");
				}

				$(document).on("click", ".check_prev", function(){
					location.href = '/member/find/password';
				});

				$(document).on("click", ".check_next", function(){
					location.href = '/access/login';
				});

				$("#btn_find").on("click", function(){
					var pw_new = $("#member_pw").val();
					var pw_chk = $("#member_pw_check").val();
					var num = pw_new.search(/[0-9]/g);
					var eng = pw_new.search(/[a-z]/ig);
					//var spe = pw_new.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

					if(pw_new.length < 6 || pw_new.length > 23){
						$("#pop_alarm_msg").text("6자리 ~ 23자리 이내로 입력해주세요.");
						$("#black").show();
						$(".popup_message_type_1").show();
						return false;
					}else if(pw_new.search(/\s/) != -1){
						$("#pop_alarm_msg").text("비밀번호는 공백 없이 입력해주세요.");
						$("#black").show();
						$(".popup_message_type_1").show();
						return false;
					}else if(num < 0 || eng < 0){
						$("#pop_alarm_msg").text("영문,숫자를 혼합하여 입력해주세요.");
						$("#black").show();
						$(".popup_message_type_1").show();
						return false;
					}else if(pw_new != pw_chk){
						$("#pop_alarm_msg").text("비밀번호가 다릅니다. 확인부탁드립니다.");
						$("#black").show();
						$(".popup_message_type_1").show();
						return false;
					}else if(proc_state == false){
						proc_state = true;
						var formData = $("#f_find_pw_step").serialize();

						$.ajax({
							url : '/member/find/rest/change_password',
							type : 'post',
							cache : false,
							data : formData,
							dataType : 'json',
							success:function(data){
								$("#pop_alarm_msg").text(data["rtn_msg"]);
								$("#black").show();
								$(".popup_message_type_1").show();
								if(data.rtn_code =='200'){
									$(".one_btn").removeClass("check_prev");
									$(".one_btn").addClass("check_next");
								}else{
									$(".one_btn").removeClass("check_next");
								}
								proc_state = false;
							},
							error:function(request,status,error){
								alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								proc_state = false;
							}
						});
					}else{
						$("#pop_alarm_msg").text('처리중입니다. 잠시만 기다려주세요.');
						$("#black").show();
						$(".popup_message_type_1").show();
					}
				});

				$(".le_ok").on("click",function(){
					$(".popup_message_type_2").css("display","none");
					$("#black").css("display","none");
				});

				$(".le_cancel").on("click",function(){
					$(".popup_message_type_2").css("display","none");
					$("#black").css("display","none");
				});

				$(".le_close").on("click",function(){
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
					<div class="find_pw_wrap">
						<h3>비밀번호 찾기</h3>
						<form id="f_find_pw_step" name="f_find_pw_step" action="/member/find/pw_check_change_pass_check" method="post">
							<input type="hidden" name="member_name" id="member_name" value="${member_name}"/>
							<input type="hidden" name="member_id" id="member_id" value="${member_id}"/>
							<input type="hidden" name="member_email" id="member_email" value="${email_info}"/>
							<input type="hidden" name=member_check_num id="member_check_num" value="${member_check_num}"/>
							<input type="hidden" name=member_cert_check id="member_cert_check" value="${member_cert_check}"/>

							<ul>
								<li class="find_pw_li2">
									<h4>새 비밀번호 등록</h4>
									<div class="form_cont">
										<input id="member_pw" name="member_pw" type="password" min="6" maxlength="23">
										<label for="member_pw">비밀번호를 입력해주세요.</label>
									</div>
								</li>

								<li class="find_pw_li3">
									<h4>새 비밀번호 확인</h4>
									<div class="form_cont">
										<input id="member_pw_check" name="member_pw_check" type="password" min="6" maxlength="23">
										<label for="member_pw_check">비밀번호를 한번 더 입력해주세요.</label>
									</div>
								</li>

								<li class="find_pw_li4">
									<a href="#">
										<p id="btn_find">찾기</p>
									</a>
								</li>
							</ul>
						</form>
					</div>
				</div>
			</div>
		</article>
	</section>

<%--	<div class="popup_message_type_2">--%>
<%--&lt;%&ndash;		<button class="le_close" hidden id="check_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>&ndash;%&gt;--%>
<%--		<div class="tit">--%>
<%--			<h4>알림메시지</h4>--%>
<%--		</div>--%>
<%--		<div class="txt">--%>
<%--			<p id="pop_alarm_msg_2">사용자정보가<br>존재하지 않습니다.</p>--%>
<%--		</div>--%>
<%--		<div class="le_btn_wrap">--%>
<%--			<button type="button" class="one_btn" id="btn_confirm">확인</button>--%>
<%--&lt;%&ndash;			<button class="le_ok" id="btn_confirm">확인</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;			<button class="le_cancel" id="btn_cancel">취소</button>&ndash;%&gt;--%>
<%--		</div>--%>
<%--	</div>--%>
	</jsp:body>
</layout:basicFrame>