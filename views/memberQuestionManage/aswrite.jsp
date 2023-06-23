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
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/sub2.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				var rtn_code = '${rtn_code}';
				if(rtn_code != '200'){
					alert("${rtn_msg}");
					location.href = "/index";
				}
				
				$("#question_file1").on('change',function(){
				  var fileName = $("#question_file1").val();
				  fileName = fileName.substring(fileName.lastIndexOf("\\")+1, fileName.length);
				  $(".upload_name").val(fileName);
				  $("#sub0_2_1 .cnt1 .area .real_area .txt ul li.as_li5 .file_box .ip_file .input_file_button").text("첨부완료")
				});
				
				$("#inputImgFile").on('change',function(){
				  var fileName = $("#inputImgFile").val();
				  fileName = fileName.substring(fileName.lastIndexOf("\\")+1, fileName.length);
				  $(".upload_name").val(fileName);
				  $("#sub0_2_1 .cnt1 .area .real_area .txt ul li.as_li5 .file_box .ip_file .input_file_button").text("첨부완료")
				});
				
				$(".app_save_btn").on("click",function(){
					event.preventDefault();
					var title = $("#title").val();
					
					if(typeof(title) !='undefined' && title.trim().length >0){
						event.preventDefault();
					    
					    var form = $('#f_question')[0];
					    var data = new FormData(form);
					    
					    $.ajax({
					        type: "POST",
					        enctype: 'multipart/form-data',
					        url: "/member/rest/mypage/question/write_proc",
					        data: data,
					        processData: false,
					        contentType: false,
					        cache: false,
					        timeout: 600000,
					        success: function (data) {
					        	if(data.rtn_code == '200'){
					        		alert(data.rtn_msg);
					        		location.href = "/member/mypage/question/list";
					        	}else{
					        		alert(data.rtn_msg);
					        	}
					        },
					        error: function (e) {
					        	alert("처리 중 문제가 발생했습니다. 다시 시도해 주세요.");
					        }
					    });
					}
				});
				
				$("#view_answer_btn").on("click", function(){
					location.href('/member/mypage/question/list');
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub0_2_1" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>A/S 서비스 신청하기</h3>
							<p>빠른 시일 내로 A/S 조치와 관련된 안내를 드립니다.</p>
							<span class="icon"><img src="/resources/images/main/as_icon.jpg" width="27" height="18" border="0" alt="" /></span>
						</div>
	
						<form id="f_question" name="f_question" action="/member/mypage/question/list" method="post">
						<input type="hidden" id="fd_type_cd" name="fd_type_cd" value="BQT001"/>
						<div class="txt">
							<div class="clear">
								<button class="view_answer_btn">1:1 문의 전체 리스트 및 <span>답변보기</span></button>
							</div>
	
							<ul>
								<li class="as_li1">
									<div class="form_cont">
										<label for="title">제목을 작성해주세요.</label>
										<input type="text" id="title" name="title">
									</div>
								</li>
	
								<li class="as_li2">
									<div class="form_cont">
										<label for="question_info">보다 상세한 내용을 작성해주세요.<br><span>- 참고가 되는 사진을 같이 공유해주시면 더 좋은 답변을 얻을 수 있습니다.</span></label>
										<textarea id="question_info" name="question_info" cols="30" rows="10"></textarea>
									</div>
								</li>
	
								<li class="as_li3 clear">
									<div class="form_cont">
										<label for="email_info">이메일을 작성해주세요</label>
										<input type="text" id="email_info" name="email_info">
									</div>
	
									<div class="chk_wrap">
										<input id="email_receive_yn" name="email_receive_yn" value="Y" type="checkbox">
										<label for="email_receive_yn">답변수신을 이메일로 받겠습니다</label>
									</div>
								</li>
	
								<li class="as_li4 clear">
									<div class="form_cont">
										<label for="tel_sms_no">연락처를 작성해주세요</label>
										<input type="text" id="tel_sms_no" name="tel_sms_no">
									</div>
	
									<div class="chk_wrap">
										<input id="sms_receive_yn" name="sms_receive_yn" value="Y" type="checkbox">
										<label for="sms_receive_yn">답변수신을 문자메시지로 받겠습니다</label>
									</div>
								</li>
	
								<!-- 첨부완료는 .as_li5에 클래스on 추가 -->
								<li class="as_li5 clear">
									<div class="file_box clear">
										<div class="ip_file">
											<label for="question_file1" class="input_file_button">파일선택</label>
											<input type="file" class="file_add" id="question_file1" name="question_file"></button>
										</div>
										<input class="upload_name" value="선택된 파일 없음">
									</div>
	
									<div class="add_wrap clear">
										<label for="inputImgFile" class="input_img_file_button"></label>
										<input type="file" class="add_btn" id="inputImgFile" name="imgfilename" accept="image/gif, image/jpeg, image/png" />
										<p>클릭하여 이미지 첨부합니다.</p>
									</div>
								</li>
								<!-- 첨부완료는 .as_li5에 클래스on 추가 -->
							</ul>
	
							<button class="app_save_btn">신청 저장하기</button>
						</div>
						</form>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>