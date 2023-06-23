<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<style type="text/css">
			.d-none {
				display: none;
			}
		</style>
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript">
			let del_keys = [];

			var signInPopup = {
				showMessage: function (msg) {
					$("#pop_alarm_msg").text(msg);
					$("#black").show();
					$(".popup_message_type_1").show();
				}
			};

			function sel(option) {
				for(var i=0,len=option.length ; i<len ; i++) {
				option[i].style.color = "#bfbfbf";
				}
				option[option.selectedIndex].style.color = "#000";
			}
	
			$(document).ready(function(){
				var rtn_code = '${rtn_code}';
				if(rtn_code != '200'){
					signInPopup.showMessage("${rtn_msg}");
					location.href = "/index";
				}
				
				var $item1Btn=$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li.item1 .add_btn");
				var $item2Btn=$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li.item2 .add_btn");
				var $item3Btn=$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li.item3 .add_btn");
				var $item4Btn=$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li.item4 .add_btn");
				var $item5Btn=$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li.item5 .add_btn");
				var $deleteBtn=$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li .delete_btn");
	
				$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right .add_btn").click(function(){
					event.preventDefault();
					var lastItemNo = $("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li:last").attr("class").replace("item", "");
					var newitem = $("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li:eq(0)").clone();
					
					if($("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li").length==5){
						signInPopup.showMessage("5개 이상 파일 추가 하실 수 없습니다.");
					}else{
						$("li.rt_cnt1_li7 .rc1_right ul").append(newitem);
					}
					
					$("li.rt_cnt1_li7 .rc1_right ul li:last-child .f_pk_idx").text("");
					$("li.rt_cnt1_li7 .rc1_right ul li:last-child .input_file_button").text("파일선택");
					$("li.rt_cnt1_li7 .rc1_right ul li:last-child .upload_name2").val("선택된 파일 없음");
	
					$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li").each(function (index) {
						$(this).attr('class', 'item item'+(index+1))
					})
	
					$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li .file_box .input_file_button").each(function (index) {
						$(this).attr('for', 'question_file'+(index+1))
					})
	
					$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li .file_box .ip_file .file_add").each(function (index) {
						$(this).attr('id', 'question_file'+(index+1))
					})
				});
				
				$(document).on("click",".delete_btn",function(){
					const f_pk_idx = $(this).parent().find(".f_pk_idx").text();
					if (f_pk_idx != "") {
						del_keys.push(f_pk_idx);
					}
					
					$(this).parent().remove();
					$("#sub4_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 ul li.rt_cnt1_li7 .rc1_right ul li").each(function (index) {
						$(this).attr('class', 'item item'+(index+1))
					})
				}); 
				
				$(document).on("change",".file_add",function(){
					var fileName = $(this).val();
					fileName = fileName.substring(fileName.lastIndexOf("\\")+1, fileName.length);
					$(this).parent().next(".upload_name2").val(fileName);
					$(this).prev().text("첨부완료")
				}); 
	
				$('#titSlt').change(function(e) {
					$(this).css("color","#000")
				});
	
				$('#titSlt2').change(function(e) {
					$(this).css("color","#000")
				});
				
				$(".save_btn").on("click",function(){
					event.preventDefault();
					var title = $("#title").val();
					var typeCd = $("select[name=typeCd]").val();
					var question_info = $("#question_info").val();

					if (typeCd == null || typeCd == '') {
						signInPopup.showMessage("문의종류를 선택해주세요.");
						return false;
					}

					if (question_info == null || question_info == '') {
						signInPopup.showMessage("문의하실 내용을 입력해주세요");
						return false;
					}

					$("#fd_type_cd").val(typeCd);

					$("#del_keys").val(del_keys.join(","));
					
					if(typeof(title) !='undefined' && title.trim().length >0){
						event.preventDefault();
					    
					    var form = $('#f_question')[0];
					    var data = new FormData(form);

					    let url = "";
					    if ($("#pk_idx").val() != "") {
					    	url = "/member/rest/mypage/question/update_proc";
					    } else {
					    	url = "/member/rest/mypage/question/write_proc";
					    }

					    $.ajax({
					        type: "POST",
					        enctype: 'multipart/form-data',
					        url: url,
					        data: data,
					        processData: false,
					        contentType: false,
					        cache: false,
					        timeout: 600000,
					        success: function (data) {
					        	if(data.rtn_code == '200'){
					        		location.href = "/member/mypage/question/list";
					        	}else{
					        		signInPopup.showMessage(data.rtn_msg);
					        	}
					        },
					        error: function (e) {
								signInPopup.showMessage("처리 중 문제가 발생했습니다. 다시 시도해 주세요.");
					        }
					    });
					} else {
						signInPopup.showMessage("제목을 입력해주세요.");
					}
				});
				
				if ("${q_item.pk_idx}" != "") {
					
					if ("${q_item.fd_type_cd}" != "") {
						$("#titSlt").val("${q_item.fd_type_cd}");
						$('#titSlt').change();
					}
					
					if ("${q_item.fd_email_receive_yn}" == "Y") {
						$("#email_receive_yn").attr("checked", true);
					} else {
						$("#email_receive_yn").attr("checked", false);
					}
					
					if ("${q_item.fd_sms_receive_yn}" == "Y") {
						$("#sms_receive_yn").attr("checked", true);
					} else {
						$("#sms_receive_yn").attr("checked", false);
					}
					
					if ("${q_f_list_size}" == 5) {
						$(".item_ul li:last-child .delete_btn").css("display", "block");
					}
				}
			}); 
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub4_2" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<layout:leftFrame/>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>1:1문의</h4>
									</div>
								</div>
								
								<form id="f_question" name="f_question" action="/member/mypage/question/list" method="post">
								<input type="hidden" id="pk_idx" name="pk_idx" value="${q_item.pk_idx}" />
								<input type="hidden" id="fd_type_cd" name="fd_type_cd" value=""/>
								<input type="hidden" id="del_keys" name="del_keys" value=""/>
								<div class="right_txt">
									<div class="rt_cnt1">
										<ul>
											<li class="rt_cnt1_li1 clear">
												<div class="rc1_left">
													<h5>제목</h5>
												</div>
	
												<div class="rc1_right">
													<select name="typeCd" id="titSlt" onchange="sel(this.options)">
														<option value="">선택해주세요.</option>
														<c:if test="${!empty type_code_list}">
															<c:forEach var="item" items="${type_code_list}" varStatus="status">
															<option value="${item.pk_code}" <c:if test="${q_item.fd_type_cd eq item.pk_code}">selected</c:if>>${item.fd_code_name}</option>
															</c:forEach>
														</c:if>
													</select>
	
													<div class="form_cont">
														<input type="text" id="title" name="title" value="${q_item.fd_title}" placeholder="제목을 입력해주세요">
														<label for="title"></label>
													</div>
												</div>
											</li>
	
											<li class="rt_cnt1_li2 clear">
												<div class="rc1_left">
													<h5>주문내역</h5>
												</div>
	
												<div class="rc1_right">
													<select name="order_id" id="titSlt2" onchange="sel(this.options)">
														<option value="">주문내역을 선택해주세요.</option>
														<c:forEach var="item" items="${p_o_list}">
															<c:choose>
																<c:when test="${item.fd_cnt > 1}">
																	<option <c:if test="${item.fd_order_id == q_item.fd_order_id}">selected</c:if> value="${item.fd_order_id}">${item.fd_product_name} 외 ${item.fd_cnt} 건 / <fmt:formatDate value="${item.fd_reg_date}" pattern="yyyy.MM.dd" /></option>
																</c:when>
																<c:otherwise>
																	<option <c:if test="${item.fd_order_id == q_item.fd_order_id}">selected</c:if>value="${item.fd_order_id}">${item.fd_product_name} / <fmt:formatDate value="${item.fd_reg_date}" pattern="yyyy.MM.dd" /></option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												</div>
											</li>
	
											<li class="rt_cnt1_li3 clear">
												<div class="rc1_left">
													<h5>이메일</h5>
												</div>
	
												<div class="rc1_right clear">
													<div class="form_cont">
														<c:choose>
															<c:when test="${empty q_item}">
																<input type="text" id="email_info" name="email_info" value="${m_item.fd_email_info_desc}" placeholder="anyprice@gmail.com">
															</c:when>
															<c:otherwise>
																<input type="text" id="email_info" name="email_info" value="${q_item.fd_email_info}" placeholder="anyprice@gmail.com">
															</c:otherwise>
														</c:choose>
														<label for="email_info"></label>
													</div>
	
													<div class="chk_wrap">
														<input id="email_receive_yn" name="email_receive_yn" value="Y" type="checkbox">
														<label for="email_receive_yn">답변수신을 이메일로 받겠습니다</label>
													</div>
												</div>
											</li>
	
											<li class="rt_cnt1_li4 clear">
												<div class="rc1_left">
													<h5>문자메시지</h5>
												</div>
	
												<div class="rc1_right clear">
													<div class="form_cont">
														<c:choose>
															<c:when test="${empty q_item}">
																<input type="text" id="tel_sms_no" name="tel_sms_no" value="${m_item.fd_tel_mobile_desc}" placeholder="010-0000-0000">
															</c:when>
															<c:otherwise>
																<input type="text" id="tel_sms_no" name="tel_sms_no" value="${q_item.fd_sms_tel_info}" placeholder="010-0000-0000">
															</c:otherwise>
														</c:choose>
														<label for="tel_sms_no"></label>
													</div>
	
													<div class="chk_wrap">
														<input id="sms_receive_yn" name="sms_receive_yn" value="Y" type="checkbox">
														<label for="sms_receive_yn">답변수신을 문자메시지로 받겠습니다</label>
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
													<textarea id="question_info" name="question_info" cols="30" rows="10" placeholder="문의하실 내용을 입력해주세요">${q_item.fd_contents_question}</textarea>
												</div>
											</li>
	
											<li class="rt_cnt1_li7 clear">
												<div class="rc1_left">
													<h5>이미지</h5>
												</div>
												
												<div class="rc1_right clear">
													<ul class="item_ul">
														<c:if test="${!empty q_f_list }">
														<c:forEach var="f_item" items="${q_f_list}" varStatus="status">
															<c:set var="length" value="${fn:length(f_item.fd_file_info)}"/>
															<c:set var="tmp" value="${fn:split(f_item.fd_file_info, '/')}"/>
															<c:set var="filename" value="${tmp[fn:length(tmp)-1]}"/>
															<li class="item item${status.index+1} on">
																<span class="f_pk_idx d-none">${f_item.pk_idx}</span>
																<div class="file_box clear">
																	<div class="ip_file">
																		<label for="question_file${status.index+1}" class="input_file_button">첨부완료</label>
																		<input type="file" class="file_add" id="question_file${status.index+1}" name="question_file" accept=".jpg, .gif, .png"></button>
																	</div>
																	<input class="upload_name2" value="${filename}">
																</div>
		
																<button class="delete_btn"><img src="/resources/images/main/delete_file.jpg" width="28" height="28" border="0" alt="" /></button>
															</li>
														</c:forEach>
														</c:if>
														<c:if test="${(5-q_f_list_size) !=0 }">
															<c:set var="tnum" value="${q_f_list_size+1}"/>
															<li class="item item${tnum} on">
																<span class="f_pk_idx d-none"></span>
																<div class="file_box clear">
																	<div class="ip_file">
																		<label for="question_file${tnum}" class="input_file_button">파일선택</label>
																		<input type="file" class="file_add" id="question_file${tnum}" name="question_file" accept=".jpg, .gif, .png"></button>
																	</div>
																	<input class="upload_name2" value="선택된 파일 없음">
																</div>
		
																<button class="delete_btn"><img src="/resources/images/main/delete_file.jpg" width="28" height="28" border="0" alt="" /></button>
															</li>
														</c:if>
													</ul>
													<c:if test="${(5-q_f_list_size) !=0 }">
													<button class="add_btn"><img src="/resources/images/main/add_file.jpg" width="28" height="28" border="0" alt="" /></button>
													<p>-파일은 최대 5개까지 업로드가 지원됩니다.</p>
													</c:if>
												</div>
											</li>
										</ul>
									</div>
	
									<div class="clear">
										<button class="save_btn">저장</button>
									</div>
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>