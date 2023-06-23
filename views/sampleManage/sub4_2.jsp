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
			function sel(option) {
				for(var i=0,len=option.length ; i<len ; i++) {
				option[i].style.color = "#bfbfbf";
				}
				option[option.selectedIndex].style.color = "#000";
			}
	
			$(document).ready(function(){
				var $item1Btn=$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li.item1 .add_btn");
				var $item2Btn=$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li.item2 .add_btn");
				var $item3Btn=$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li.item3 .add_btn");
				var $item4Btn=$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li.item4 .add_btn");
				var $item5Btn=$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li.item5 .add_btn");
				var $deleteBtn=$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li .delete_btn");
	
				$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right .add_btn").click(function(){
					var lastItemNo = $("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li:last").attr("class").replace("item", "");
					var newitem = $("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li:eq(0)").clone();
					
					if($("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li").length==6){
						alert("5개 이상 파일 추가 하실 수 없습니다.");
					}else{
						$("li.rt_cnt1_li7 .rc1_right ul").append(newitem);
					}
	
					$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li").each(function (index) {
						$(this).attr('class', 'item item'+index)
					})
	
					$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li .file_box .input_file_button").each(function (index) {
						$(this).attr('for', 'inputFile'+index)
					})
	
					$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li .file_box .ip_file .file_add").each(function (index) {
						$(this).attr('id', 'inputFile'+index)
					})
				});
	
				$deleteBtn.on("click", function  () {
					$(this).parent().remove();
	
					$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li").each(function (index) {
						$(this).attr('class', 'item item'+index)
					})
				});
	
				$(document).on("click",".delete_btn",function(){
					$(this).parent().remove();
					$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li").each(function (index) {
						$(this).attr('class', 'item item'+index)
					})
				}); 
	
				$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li .file_box .ip_file .file_add").on('change',function(){
					var fileName = $(this).val();
					$(this).parent().next(".upload_name2").val(fileName);
					$(this).prev().text("첨부완료")
				});
	
				$(document).on("change",".file_add",function(){
					var fileName = $(this).val();
					$(this).parent().next(".upload_name2").val(fileName);
					$(this).prev().text("첨부완료")
				}); 
	
				$('#titSlt').change(function(e) {
					$(this).css("color","#000")
				});
	
				$('#titSlt2').change(function(e) {
					$(this).css("color","#000")
				});
			}); 
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub4_2" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<h3>고객센터</h3>
							
								<ul>
									<li class="on"><button>1:1문의</button></li>
									<li><button>공지사항</button></li>
									<li><button>이용안내</button></li>
									<li><button>법적고지</button></li>
								</ul>
							
								<div class="banner">
									<h4>주문/배송에<br>도움이 필요하신가요?</h4>
									<button>1:1 문의하기</button>
								</div>
							</div>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>1:1문의</h4>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<ul>
											<li class="rt_cnt1_li1 clear">
												<div class="rc1_left">
													<h5>제목</h5>
												</div>
	
												<div class="rc1_right">
													<select name="" id="titSlt" onchange="sel(this.options)">
														<option value="">선택해주세요.</option>
														<option value="">배송지연/불만</option>
														<option value="">메디패스 (무료배송)</option>
														<option value="">반품문의</option>
														<option value="">A/S문의</option>
														<option value="">환불문의</option>
														<option value="">주문결제문의</option>
														<option value="">회원정보문의</option>
														<option value="">취소문의</option>
														<option value="">교환문의</option>
														<option value="">상품정보문의</option>
														<option value="">기타문의</option>
													</select>
	
													<div class="form_cont">
														<input type="text" id="titIp">
														<label for="titIp">제목을 입력해주세요</label>
													</div>
												</div>
											</li>
	
											<li class="rt_cnt1_li2 clear">
												<div class="rc1_left">
													<h5>주문내역</h5>
												</div>
	
												<div class="rc1_right">
<%--													<select name="" id="titSlt2" onchange="sel(this.options)">--%>
<%--														<option value="">주문내역을 선택해주세요.</option>--%>
<%--														<option value="">TITAN X 외 3건<span>2021.09.27</span></option>--%>
<%--														<option value="">메디컴 라텍스 글러브<span>2021.09.27</span></option>--%>
<%--														<option value="">25 type a plastic syringe tips<span>2021.09.27</span></option>--%>
<%--													</select>--%>
													<select name="" id="titSlt2">
														<option value="">주문내역을 선택해주세요.</option>

												</div>
											</li>
	
											<li class="rt_cnt1_li3 clear">
												<div class="rc1_left">
													<h5>이메일</h5>
												</div>
	
												<div class="rc1_right clear">
													<div class="form_cont">
														<input type="text" id="emailIp">
														<label for="emailIp">eldent@gmail.com</label>
													</div>
	
													<div class="chk_wrap">
														<input id="emailIn" type="checkbox">
														<label for="emailIn">답변수신을 이메일로 받겠습니다</label>
													</div>
												</div>
											</li>
	
											<li class="rt_cnt1_li4 clear">
												<div class="rc1_left">
													<h5>문자메세지</h5>
												</div>
	
												<div class="rc1_right clear">
													<div class="form_cont">
														<input type="text" id="telIp">
														<label for="telIp">010-7487-9362</label>
													</div>
	
													<div class="chk_wrap">
														<input id="telIn" type="checkbox">
														<label for="telIn">답변수신을 문자메세지로 받겠습니다</label>
													</div>
												</div>
											</li>
	
											<li class="rt_cnt1_li5 clear">
												<div class="rc1_left">
												</div>
	
												<div class="rc1_right">
													<p>1:1 문의 작성 전 확인해주세요!<br>배송일 및 배송시간 지정은 불가능합니다. (예약배송 포함)<br>전화번호, 이메일, 주소, 계좌번호 등의 상세 개인정보가 문의 내용에 저장되지 않도록 주의해 주시기 바랍니다.</p>
												</div>
											</li>
	
											<li class="rt_cnt1_li6 clear">
												<div class="rc1_left">
													<h5>내용</h5>
												</div>
	
												<div class="rc1_right">
													<textarea name="" id="" cols="30" rows="10"></textarea>
												</div>
											</li>
	
											<li class="rt_cnt1_li7 clear">
												<div class="rc1_left">
													<h5>이미지</h5>
												</div>
	
												<div class="rc1_right clear">
													<ul class="item_ul">
														<li class="item item0">
															<div class="file_box clear">
																<div class="ip_file">
																	<label for="inputFile0" class="input_file_button">파일선택</label>
																	<input type="file" class="file_add" id="inputFile0"></button>
																</div>
																<input class="upload_name2" value="선택된 파일 없음">
															</div>
	
															<button class="delete_btn"><img src="/resources/images/main/delete_file.jpg" width="28" height="28" border="0" alt="" /></button>
														</li>
	
														<li class="item item1 on">
															<div class="file_box clear">
																<div class="ip_file">
																	<label for="inputFile0" class="input_file_button">파일선택</label>
																	<input type="file" class="file_add" id="inputFile0"></button>
																</div>
																<input class="upload_name2" value="선택된 파일 없음">
															</div>
	
															<button class="delete_btn"><img src="/resources/images/main/delete_file.jpg" width="28" height="28" border="0" alt="" /></button>
														</li>
													</ul>
													<button class="add_btn"><img src="/resources/images/main/add_file.jpg" width="28" height="28" border="0" alt="" /></button>
													<p>-파일은 최대 5개까지 업로드가 지원됩니다.</p>
												</div>
											</li>
										</ul>
									</div>
	
									<div class="clear">
										<button class="save_btn">저장</button>
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