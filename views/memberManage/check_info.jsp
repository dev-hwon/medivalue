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
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript">

			var signInPopup = {
				showMessage: function (msg) {
					$("#pop_alarm_msg").text(msg);
					$("#black").show();
					$(".popup_message_type_1").show();
				}
			}

			$(document).ready(function(){

				let login_check = '${login_check}';
				if (login_check === 'N') {
					// signInPopup.showMessage("로그인 후에 이용 가능합니다.");
					location.replace("/access/login");
				}

				let rtn_code = '${rtn_code}';
				let rtn_msg = '${rtn_msg}';

				if (rtn_code != '200') {
					signInPopup.showMessage(rtn_msg);
				}

				$("#btn_check").on("click",function(){
					var password = $("#password").val();
					if(typeof(password) =='undefined' || password.trim().length <=3){
						signInPopup.showMessage("비밀번호를 확인해주세요.");
					}else{
						$("#f_m_check").submit();
					}
				});

			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub3_6" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<layout:leftMyFrame/>
							
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
											<form id="f_m_check" name="f_m_check" action="/member/mypage/info" method="post">
											<div class="form_cont">
												<label for="password">비밀번호를 입력해주세요</label>
												<input type="password" id="password" name="password">
											</div>
											</form>
										</div>
									</div>
	
									<div class="clear">
										<button class="ok_btn" id="btn_check">확인</button>
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