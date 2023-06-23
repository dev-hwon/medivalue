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
			$(document).ready(function (){
				var proc_state = false;
				${scriptMsg}
				var state_code = '${rtn_code}';
				var msg = '${rtn_msg}';
				if(state_code !='200'){
					$("#pop_alarm_msg").text(msg);
					$("#black").show();
					$(".popup_message_type_1").show();
				}

				$("#btn_login").on("click", function(){
					location.href = '/access/login';
				});

				$("#btn_password").on("click", function(){
					location.href = '/member/find/password';
				});
				$("#btn_id_check").on("click", function(){
					location.href = '/member/find/id';
				});
				$("#btn_send_email").on("click", function(){
					if(proc_state == false){
						proc_state = true;
						var formData = $("#f_find_pw_step").serialize();

						$.ajax({
							url : '/member/find/rest/pw_check_step_mail_send_proc',
							type : 'post',
							cache : false,
							data : formData,
							dataType : 'json',
							success:function(data){
								$("#pop_alarm_msg").text(data["rtn_msg"]);
								$("#black").show();
								$(".popup_message_type_1").show();

								if(data["rtn_code"] =='200'){
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
						$("#pop_alarm_msg").text("처리중입니다. 잠시만 기다려주세요.");
						$("#black").show();
						$(".popup_message_type_1").show();
					}

				});
				$(document).on("click", ".check_next", function(){
					$("#f_find_pw_step").submit();
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
		<section id="sub0_1_3" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="find_pw_wrap">
						<c:choose>
							<c:when test="${rtn_code eq '200'}">
							<form id="f_find_pw_step" name="f_find_pw_step" action="/member/find/pw_check_step_mail_send" method="post">
								<input type="hidden" name="member_name" id="member_name" value="${member_name}"/>
								<input type="hidden" name="member_id" id="member_id" value="${member_id}"/>
								<input type="hidden" name="member_email" id="member_email" value="${email_info}"/>
							</form>
							<h3>비밀번호 찾기</h3>
							<span class="icon"><img src="/resources/images/main/find_pw_icon.jpg" width="70" height="53" border="0" alt="" /></span>
							<h4>이메일로 인증 완료 후<br>비밀번호를 재발급 받으세요!</h4>
<%--							<p>입력하신 el***@gmail.com으로 인증번호가 발송되며<br>인증 후 비밀번호가 재발급됩니다.<br>전송량이 많은 경우 이메일 전송이 지연될 수 있습니다.</p>--%>
							<p>입력하신 <c:out value="${email_info_desc}"/>으로 인증번호가 발송되며<br>인증 후 비밀번호가 재발급됩니다.<br>전송량이 많은 경우 이메일 전송이 지연될 수 있습니다.</p>
							<button id="btn_send_email">인증번호 받기</button>
							</c:when>
							<c:otherwise>
							<h4>고객님의 <br>비밀번호 찾기 입력 정보를 확인해주세요.!</h4>
							<p>${rtn_msg}</p>
							<button type="button" id="btn_password" style="width: 100%;">비밀번호 찾기</button><br/>
							<button type="button" id="btn_login">로그인하기</button>
							</c:otherwise>
						</c:choose>
						</div>
					</div>
				</div>
			</article>
		</section>

<%--		<div class="popup_message_type_2">--%>
<%--&lt;%&ndash;			<button class="le_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>&ndash;%&gt;--%>
<%--			<div class="tit">--%>
<%--				<h4>메시지</h4>--%>
<%--			</div>--%>
<%--			<div class="txt">--%>
<%--				<p id="pop_alarm_msg_2">사용자정보가<br>존재하지 않습니다.</p>--%>
<%--			</div>--%>
<%--			<div class="le_btn_wrap">--%>
<%--				<button type="button" class="one_btn" id="btn_confirm">확인</button>--%>
<%--			</div>--%>
<%--		</div>--%>

	</jsp:body>
</layout:basicFrame>