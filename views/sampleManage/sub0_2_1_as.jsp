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
		<script type="text/javascript" src="/resources/js/common.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/sub2.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				$("#inputFile").on('change',function(){
				  var fileName = $("#inputFile").val();
				  $(".upload_name").val(fileName);
				  $("#sub0_2_1 .cnt1 .area .real_area .txt ul li.as_li5 .file_box .ip_file .input_file_button").text("첨부완료")
				});
	
				$("#inputImgFile").on('change',function(){
				  var fileName = $("#inputImgFile").val();
				  $(".upload_name").val(fileName);
				  $("#sub0_2_1 .cnt1 .area .real_area .txt ul li.as_li5 .file_box .ip_file .input_file_button").text("첨부완료")
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
	
						<div class="txt">
							<div class="clear">
								<button class="view_answer_btn">1:1 문의 전체 리스트 및 <span>답변보기</span></button>
							</div>
	
							<ul>
								<li class="as_li1">
									<div class="form_cont">
										<label for="as_wr1">제목을 작성해주세요.</label>
										<input type="text" id="as_wr1">
									</div>
								</li>
	
								<li class="as_li2">
									<div class="form_cont">
										<label for="as_wr2">보다 상세한 내용을 작성해주세요.<br><span>- 참고가 되는 사진을 같이 공유해주시면 더 좋은 답변을 얻을 수 있습니다.</span></label>
										<textarea name="" id="as_wr2" cols="30" rows="10"></textarea>
									</div>
								</li>
	
								<li class="as_li3 clear">
									<div class="form_cont">
										<label for="as_wr3">이메일을 작성해주세요</label>
										<input type="text" id="as_wr3">
									</div>
	
									<div class="chk_wrap">
										<input id="as_chk1" type="checkbox">
										<label for="as_chk1">답변수신을 이메일로 받겠습니다</label>
									</div>
								</li>
	
								<li class="as_li4 clear">
									<div class="form_cont">
										<label for="as_wr4">연락처를 작성해주세요</label>
										<input type="text" id="as_wr4">
									</div>
	
									<div class="chk_wrap">
										<input id="as_chk2" type="checkbox">
										<label for="as_chk2">답변수신을 문자메시지로 받겠습니다</label>
									</div>
								</li>
	
								<!-- 첨부완료는 .as_li5에 클래스on 추가 -->
								<li class="as_li5 clear">
									<div class="file_box clear">
										<div class="ip_file">
											<label for="inputFile" class="input_file_button">파일선택</label>
											<input type="file" class="file_add" id="inputFile"></button>
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
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>