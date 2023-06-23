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
			$(document).ready(function(){
				${scriptMsg}

				var check_code = '${rtn_code}';

				if(check_code !='200'){
					$("#pop_alarm_msg").text('${rtn_msg}');

					// $("#black").show();
					$(".popup_message_type_1").show();
					$("#btn_confirm").removeClass("check_prev");
					// $("#btn_cancel").removeClass("check_prev");
				}
				$(document).on("click", ".check_prev", function(){
					location.href = '/member/find/password';
				});

				$("#btn_find").on("click", function(){
					if($("#member_check_num").val().trim() == ''){
						$("#pop_alarm_msg").text('메일 확인 후 전송된 인증번호를 입력해주세요.');
						// $("#black").show();
						$(".popup_message_type_1").show();

					}else if(proc_state == false){
						proc_state = true;
						var formData = $("#f_find_pw_step").serialize();

						$.ajax({
							url : '/member/find/rest/pw_check_step_cert',
							type : 'post',
							cache : false,
							data : formData,
							dataType : 'json',
							success:function(data){
								$("#pop_alarm_msg").text(data["rtn_msg"]);
								$("#black").show();
								$(".popup_message_type_1").show();

								$("#alarm_msg").text(data["rtn_msg"]);
								$("#notice_view").addClass('on');
								if(data["rtn_code"] =='200'){
									$("#member_cert_check").val('Y');
									$(".one_btn").addClass("check_next");
								}else{
									$("#member_cert_check").val('N');
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

				$(document).on("click", ".check_next", function(){
					$("#f_find_pw_step").submit();
				});

				// $(".le_ok").on("click",function(){
				// 	$(".popup_message_type_2").css("display","none");
				// 	$("#black").css("display","none");
				// });
				//
				// $(".le_cancel").on("click",function(){
				// 	$(".popup_message_type_2").css("display","none");
				// 	$("#black").css("display","none");
				// });
				//
				// $(".le_close").on("click",function(){
				// 	$(".popup_message_type_2").css("display","none");
				// 	$("#black").css("display","none");
				// });
			});
		</script>

	</jsp:attribute>
	<jsp:body>
		<section id="sub0_1_4" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<form id="f_find_pw_step" name="f_find_pw_step" action="/member/find/pw_check_step_change" method="post">
							<input type="hidden" name="member_name" id="member_name" value="${member_name}"/>
							<input type="hidden" name="member_id" id="member_id" value="${member_id}"/>
							<input type="hidden" name="member_email" id="member_email" value="${email_info}"/>
							<input type="hidden" name="member_cert_check" id="member_cert_check" value=""/>
							<div class="find_id_wrap">
								<h3>비밀번호 찾기</h3>

								<ul>
									<li class="find_id_li1">
										<div class="form_cont">
<%--											<label for="member_check_num">이메일 주소 인증</label>--%>
											<input id="member_check_num" name="member_check_num" type="text" placeholder="전송된 인증번호를 입력해주세요.">
										</div>
									</li>

									<li class="find_id_li3">
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

<%--		<div class="popup_message_type_2">--%>
<%--&lt;%&ndash;			<button class="le_close" hidden ><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>&ndash;%&gt;--%>
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