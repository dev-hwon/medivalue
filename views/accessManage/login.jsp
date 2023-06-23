<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">		
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script src="/resources/js/jquery/plugin/cookie/jquery.cookie.js"></script>
		<script type="text/javascript">

			let url = '${url}';

			let urlParams = new URLSearchParams(window.location.search);			
			let url_req_tyep_check_yn = 'N';
			if(typeof(urlParams.get("req_page")) !='undefined'  && urlParams.get("req_page") !=''  && urlParams.get("req_page") != null ){
				url_req_tyep_check_yn = 'Y';
			}
			
			var login = {
				doLogin: function () {
					var temp_id = $("#user_id").val();
					var temp_pw = $("#user_pw").val();

					if( typeof(temp_id) =='undefined' || temp_id.trim() =='' || temp_id.trim().length <=5){
						$("#pop_alarm_msg").text("아이디를 확인해주세요.");
						$("#black").show();
						$(".popup_message_type_1").show();
						return;
					}else if( typeof(temp_pw) =='undefined' || temp_pw.trim() =='' || temp_pw.trim().length <=5){
						$("#pop_alarm_msg").text("비밀번호를 확인해주세요.");
						$("#black").show();
						$(".popup_message_type_1").show();
						return;
					}else{
						var formData = $("#frm_login").serializeArray();
						// if (url != null && url !== '') {
						// 	formData.push({name: 'url', value: url});
						// }

						$.ajax({
							url : '/access/rest/loginProc',
							type : 'post',
							cache : false,
							data : formData,
							dataType : 'json',
							success:function(data){
								if(data.rtn_code =='200'){
									var temp_id = $("#user_id").val();
									if(typeof(temp_id) !='undefined' && temp_id !=''){
										$.cookie('medivalue_web_id', temp_id, { expires: 15, path: "/"});
									}
									
									if (urlParams.has("dentistry") && urlParams.get("dentistry")) {
										location.href = "https://dt.medivalue.co.kr";
									} else if (urlParams.has("eventPage") && urlParams.get("eventPage")) {
										
										location.href = "/event/special_price";
									}else if (url_req_tyep_check_yn == 'Y' ){
										location.replace(urlParams.get("req_page"));
									}else if (url != null && url !== '') {
										location.replace(url);
									} else {
										location.replace('/index');
									}
								}else{
									$("#pop_alarm_msg").text(data.rtn_msg);
									$("#black").show();
									$(".popup_message_type_1").show();
								}
							},
							error:function(request,status,error){
								alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						});
					}
				}
			};

			$(document).ready(function (){
				var chk_id = $.cookie('medivalue_web_id');
				if(typeof(chk_id)!='undefined' && chk_id!=''){
					$("#user_id").siblings("label").hide();
					$("#user_id").val(chk_id);
					$("#chk_save_id").attr("checked", true);
				}
				
				$("#chk_save_id").on("click",function(){
					var temp_id = $("#user_id").val();
					if(typeof(temp_id) !='undefined' && temp_id !=''){
						$.cookie('medivalue_web_id', temp_id, { expires: 15, path: "/"});
					}
				});
				
				$("#btn_login").on("click",function(){					
					login.doLogin();
				});

				$("#frm_login").on("keyup",function(key){
					if(key.keyCode==13) {
						login.doLogin();
					}
				});

				$(".find_id").on("click", function () {
					location.href = "/member/find/id";
				});

				$(".find_pw").on("click", function () {
					location.href = "/member/find/pw";
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
							<form id="frm_login" name="frm_login" action="/access/login" method="post">
							<ul>
								<li class="login_li1">
									<div class="form_cont">
										<input type="text" id="user_id" name="user_id" value=""/>
										<label for="user_id">아이디를 입력해주세요</label>
									</div>
								</li>
											
								<li class="login_li2">
									<div class="form_cont">
										<input type="password" id="user_pw" name="user_pw" value=""/>
										<label for="user_pw">비밀번호를 입력해주세요</label>
									</div>
								</li>
											
								<li class="login_li3 clear">
									<div class="left">
										<input type="checkbox" id="chk_save_id" name="chk_save_id" />
										<label for="chk_save_id">아이디 기억하기</label>
									</div>
											
									<div class="right clear">
										<a href="/member/find/id" class="find_id">아이디 찾기</a>
										<a href="/member/find/password" class="find_pw">비밀번호 찾기</a>
									</div>
								</li>
											
								<li class="login_li5">									
									<button type="button" id="btn_login"><p>로그인</p></button>
								</li>									
								<li class="login_li6">
									<a href="/member/join"><p>회원가입</p></a>
								</li>
							</ul>
							</form>
						</div>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>