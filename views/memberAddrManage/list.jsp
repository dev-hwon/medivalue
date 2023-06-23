<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<style>
		.d-done {
			display: none;
		}
		</style>
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">

			var phoneNumber = {
				formatter: function (value) {
					let joinTel = value;
					joinTel = joinTel.replaceAll(/[^0-9]/g, "");
					if (joinTel != null || joinTel != '') {

						if (joinTel.length > 11) {
							joinTel = joinTel.slice(0, 11);
						}

						if (joinTel.length == 8) {
							joinTel = joinTel.slice(0, 4) + "-" + joinTel.slice(4, 8);
						} else if (joinTel.length == 9) {
							joinTel = joinTel.slice(0, 2) + "-" + joinTel.slice(2, 5) + "-" + joinTel.slice(5, 9);
						} else if(joinTel.length == 10 && joinTel.startsWith("02")) {
							joinTel = joinTel.slice(0, 2) + "-" + joinTel.slice(2, 6) + "-" + joinTel.slice(6, 10);
						} else if (joinTel.length == 10) {
							joinTel = joinTel.slice(0, 3) + "-" + joinTel.slice(3, 6) + "-" + joinTel.slice(6, 10);
						} else if (joinTel.length == 11) {
							joinTel = joinTel.slice(0, 3) + "-" + joinTel.slice(3, 7) + "-" + joinTel.slice(7, 11);
						}
						return joinTel;
					}
				}
			}

			var alertPopup = {
				showMessage: function (msg) {
					$("#pop_alarm_msg").text(msg);
					$("#black").show();
					$(".popup_message_type_1").show();
				}
			};

			$(document).ready(function (){
				var $sTd5=$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 table tbody tr td.ship_td5 button");
				var $s34Smclose=$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .sc_modi_popup .sm_tit .sm_close");
				var $depBtn=$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 table tbody tr td.ship_td6 button");
				var $depClose=$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup .dep_close");
				var $okBtn=$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup .btn_wrap .ok_btn");
				var $tableTr=$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 table tbody tr");
	
				$depBtn.on("click", function  () {
					let addrIdx = $(this).attr("id");
					$("#delete_addr_idx").val(addrIdx);
					var $bnbn=$(this).parents("tr").index();
	
					$okBtn.on("click", function  () {
						$tableTr.eq($bnbn).css("display","none");
						$depClose.click();
					});
					
				});
	
				$depBtn.on("click", function  () {
					$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup").css("display","block");
					$("#black").css("display","block");
				});
	
				$depClose.on("click", function  () {
					$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup").css("display","none");
					$("#black").css("display","none");
				});
	
				$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup .btn_wrap .cancel_btn").on("click", function  () {
					$depClose.click()
				});
	
				$sTd5.on("click", function  () {

					$("#sc_md_ip2").val("");
					$("#sc_md_ip3").val("");

					let id = $(this).attr("id");
					$("#addr_idx").val(id);
					$("#address_btn").removeClass("btn_save btn_modify");

					let t = this;
					
					$("#sm_addr").text($(t).parent().siblings(".ship_td2").find(".span_addr").text());
					$("#sc_md_ip1").val($(t).parent().siblings(".ship_td2").find(".span_addr_detail").text());
					
					$("#address_btn").addClass("btn_modify");
					$(".sm_tit > h4").text("배송지 수정");
					if ($(t).parent().hasClass("on")) {
						$(t).closest("table").next(".sc_modi_popup").css("display","block").find(".sc_sp").css("display","none").next().find("input[type='checkbox']").prop("checked", true);
						$("#black").css("display","block");
					}else {
						$(t).closest("table").next(".sc_modi_popup").css("display","block").find(".sc_sp").css("display","inline-block").next().find("input[type='checkbox']").prop("checked", false);
						$("#black").css("display","block");
					}
					
					/*
					new daum.Postcode({
						oncomplete: function(data) {
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수
							var jibunAddress = data.jibunAddress;
							if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
								extraRoadAddr += data.bname;
							}
							if(data.buildingName !== '' && data.apartment === 'Y'){
								extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							}
							if(extraRoadAddr !== ''){
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// $(".form_cont input[type=text]").siblings("label").hide();
							$("#sc_md_ip4").val(data.zonecode);
							if(roadAddr != ''){
								$("#sm_addr").text(roadAddr + ' ' + extraRoadAddr);
							}else if(jibunAddress != ''){
								$("#sm_addr").text(roadAddr + ' ' + extraRoadAddr);
							}

							$("#address_btn").addClass("btn_modify");
							$(".sm_tit > h4").text("배송지 수정");
							if ($(t).parent().hasClass("on")) {
								$(t).closest("table").next(".sc_modi_popup").css("display","block").find(".sc_sp").css("display","none").next().find("input[type='checkbox']").prop("checked", true);
								$("#black").css("display","block");
							}else {
								$(t).closest("table").next(".sc_modi_popup").css("display","block").find(".sc_sp").css("display","inline-block").next().find("input[type='checkbox']").prop("checked", false);
								$("#black").css("display","block");
							}
						},
						onclose: function(state) {
							if(state === 'FORCE_CLOSE'){
								// $("#alarm_msg").text('확인된 주소를 등록해주세요.');
								// $("#notice_view").addClass('on');
								// alert("확인된 주소를 등록해주세요.");
							} else if(state === 'COMPLETE_CLOSE'){
								self.close();
								// $("#addr_detail").focus();
							}
						}
					}).open();
					*/
				});
				
				$(".btn_add_mod").on("click", function(){
					$("#sc_md_ip2").val("");
					$("#sc_md_ip3").val("");

// 					let id = $(this).attr("id");
// 					$("#addr_idx").val(id);
					$("#address_btn").addClass("btn_modify");

					let t = this;
					new daum.Postcode({
						oncomplete: function(data) {
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수
							var jibunAddress = data.jibunAddress;
							if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
								extraRoadAddr += data.bname;
							}
							if(data.buildingName !== '' && data.apartment === 'Y'){
								extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							}
							if(extraRoadAddr !== ''){
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// $(".form_cont input[type=text]").siblings("label").hide();
							$("#sc_md_ip4").val(data.zonecode);
							if(roadAddr != ''){
								$("#sm_addr").text(roadAddr + ' ' + extraRoadAddr);
							}else if(jibunAddress != ''){
								$("#sm_addr").text(roadAddr + ' ' + extraRoadAddr);
							}

							$("#address_btn").addClass("btn_modify");
							$(".sm_tit > h4").text("배송지 수정");
							if ($(t).parent().hasClass("on")) {
								$(t).closest("table").next(".sc_modi_popup").css("display","block").find(".sc_sp").css("display","none").next().find("input[type='checkbox']").prop("checked", true);
								$("#black").css("display","block");
							}else {
								$(t).closest("table").next(".sc_modi_popup").css("display","block").find(".sc_sp").css("display","inline-block").next().find("input[type='checkbox']").prop("checked", false);
								$("#black").css("display","block");
							}
						},
						onclose: function(state) {
							if(state === 'FORCE_CLOSE'){
								// $("#alarm_msg").text('확인된 주소를 등록해주세요.');
								// $("#notice_view").addClass('on');
								// alert("확인된 주소를 등록해주세요.");
							} else if(state === 'COMPLETE_CLOSE'){
								self.close();
								// $("#addr_detail").focus();
							}
						}
					}).open();
				});

				$(".ship_add").on("click", function () {

					$("#address_btn").removeClass("btn_save btn_modify");

					$("#sc_md_ip1").val("");
					$("#sc_md_ip2").val("");
					$("#sc_md_ip3").val("");

					new daum.Postcode({
						oncomplete: function(data) {
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수
							var jibunAddress = data.jibunAddress;
							if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
								extraRoadAddr += data.bname;
							}
							if(data.buildingName !== '' && data.apartment === 'Y'){
								extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							}
							if(extraRoadAddr !== ''){
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// $("#form_ba > .form_cont input[type=text]").siblings("label").hide();
							$("#sc_md_ip4").val(data.zonecode);
							if(roadAddr != ''){
								$("#sm_addr").text(roadAddr + ' ' + extraRoadAddr);
							}else if(jibunAddress != ''){
								$("#sm_addr").text(roadAddr + ' ' + extraRoadAddr);
							}

							$("#address_btn").addClass("btn_save");
							$(".sm_tit > h4").text("배송지 추가");
							$(".sc_modi_popup").css("display","block").find(".sc_sp").css("display","inline-block").next().find("input[type='checkbox']").prop("checked", false);
							$("#black").css("display","block");
						},
						onclose: function(state) {
							if(state === 'FORCE_CLOSE'){
								// $("#alarm_msg").text('확인된 주소를 등록해주세요.');
								// $("#notice_view").addClass('on');
								// alert("확인된 주소를 등록해주세요.");
							} else if(state === 'COMPLETE_CLOSE'){
								self.close();
								// $("#addr_detail").focus();
							}
						}
					}).open();
				});

				$s34Smclose.on("click", function  () {
					$(this).closest(".sc_modi_popup").css("display","none");
					$("#black").css("display","none");
				});
	
				$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .sc_modi_popup .sm_btn button").on("click", function  () {
					$s34Smclose.click()
				});
	
				$("#black").on("click", function  () {
					$s34Smclose.click()
					$depClose.click()
				});

				let login_check = '${login_check}';
				if (login_check === 'N') {
					// alert("로그인 후에 이용 가능합니다.");
					location.replace("/access/login");
				}

				let rtn_code = '${rtn_code}';
				let rtn_msg = '${rtn_msg}';

				if (rtn_code != '200') {
					alertPopup.showMessage(rtn_msg);
				}

				$("#sc_md_ip3").on("keyup", function () {
					let value = $(this).val();
					$(this).val(phoneNumber.formatter(value));
				});

				$("#address_btn").on("click", function () {

					let addr = $("#sm_addr").text();
					let addr_detail = $("#sc_md_ip1").val();
					let addr_post = $("#sc_md_ip4").val();
					let addr_name = $("#sc_md_ip2").val();
					let tel_info = $("#sc_md_ip3").val();
					tel_info = tel_info.replaceAll(/[^0-9]/g, "");

					let addr_idx = "";
					if ($(this).hasClass("btn_modify")) {
						addr_idx = $("#addr_idx").val();
					}

					$.ajax({
						url: "/member/addr/manage",
						method: "POST",
						contentType: "application/json",
						data: JSON.stringify({
							pk_idx: addr_idx,
							addr: addr,
							addr_detail: addr_detail,
							addr_post: addr_post,
							addr_name: addr_name,
							tel_info: tel_info
						}),
						success: function (data) {
							let rtn_msg = data["rtn_msg"];
							if (data["rtn_code"] == "200") {
								location.reload();
							} else {
								alertPopup.showMessage(rtn_msg);
							}
						}
					})
				});

				$(".save_ship").on("click", function () {
					let check = $(".ship_td1 >.chk_wrap > input[name='ship']").is(":checked");
					if (check) {
						$("#pop_alarm_msg_2").text("기본배송지로 바꾸시겠습니까?");
						$(".popup_message_type_2").show();
						$("#black").show();
					} else {
						alertPopup.showMessage("변경하려는 배송지를 선택해주세요.");
					}
				});

				$(".ok_btn").on("click", function () {
					let addrIdx = $("#delete_addr_idx").val();
					$.ajax({
						url: "/member/addr/delete/" + addrIdx,
						method: "POST",
						contentType: "application/json",
						success: function (data) {
							let rtn_msg = data["rtn_msg"];
							if (data["rtn_code"] == "200") {
								location.reload();
							} else {
								alertPopup.showMessage(rtn_msg);
							}
						}
					});
				});

				$(".delivery").on("click", function () {
					location.href = "/order/list";
				});

				$(".addr").on("click", function () {
					location.href = "/member/addr/list";
				});

				$(".coupon").on("click", function () {
					location.href = "/coupon/list";
				});

				$(".member").on("click", function () {
					location.href = "/member/mypage/check";
				});

				$(".le_cancel").on("click",function(){
					$(".popup_message_type_2").css("display","none");
					$("#black").css("display","none");
				});

				$(".le_close").on("click",function(){
					$(".popup_message_type_2").css("display","none");
					$("#black").css("display","none");
				});

				$(".le_ok").on("click", function(){

					let addrIdx = $(".ship_td1 >.chk_wrap > input[name='ship']:checked").val();

					$.ajax({
						url: "/member/addr/default/" + addrIdx,
						method: "POST",
						contentType: "application/json",
						success: function (data) {
							let rtn_msg = data["rtn_msg"];
							if (data["rtn_code"] == "200") {
								location.reload();
							} else {
								alertPopup.showMessage(rtn_msg);
							}
						}
					});
				});
			});
		</script>
		${pageNavi.script}
	</jsp:attribute>
	<jsp:body>
		<section id="sub3_4" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<layout:leftMyFrame/>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>배송지 관리</h4>
										<button class="ship_add"><span>+</span> 배송지 추가</button>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<table>
											<thead>
												<tr>
													<th class="ship_th1">선택</th>
													<th class="ship_th2">주소</th>
													<th class="ship_th3">받으실분</th>
													<th class="ship_th4">연락처</th>
													<th class="ship_th5">수정</th>
													<th class="ship_th6"></th>
												</tr>
											</thead>
	
											<tbody>
												<c:if test="${!empty memberAddrList }">
													<c:forEach var="item" items="${memberAddrList}">
													<tr>
														<td class="ship_td1">
															<div class="chk_wrap">
																<input id="${item.pk_idx}" type="radio" name="ship" value="${item.pk_idx}">
																<label for="${item.pk_idx}"> </label>
															</div>
														</td>

														<td class="ship_td2">
															<div class="p_wrap on">
																<p>
																	<span class="span_addr d-done">${item.fd_addr_desc}</span>
																	<span class="span_addr_detail d-done">${item.fd_addr_detail_desc}</span>
																	${item.fd_addr_desc} ${item.fd_addr_detail_desc}
																	<c:if test="${item.fd_basic_yn eq 'Y'}">
																		<span class="mark">기본배송지</span>
																	</c:if>
																</p>
															</div>
														</td>

														<td class="ship_td3">
															<p>${item.fd_addr_name}</p>
														</td>

														<td class="ship_td4">
															<c:choose>
																<c:when test="${item.fd_tel_info_desc.length() == 8}">
																	${fn:substring(item.fd_tel_info_desc, 0, 4)}-${fn:substring(item.fd_tel_info_desc, 4, 8)}
																</c:when>
																<c:when test="${item.fd_tel_info_desc.length() == 9}">
																	${fn:substring(item.fd_tel_info_desc, 0, 2)}-${fn:substring(item.fd_tel_info_desc, 2, 5)}-${fn:substring(item.fd_tel_info_desc, 5, 9)}
																</c:when>
																<c:when test="${item.fd_tel_info_desc.length() == 10 && fn:startsWith(item.fd_tel_info_desc, '02')}">
																	${fn:substring(item.fd_tel_info_desc, 0, 2)}-${fn:substring(item.fd_tel_info_desc, 2, 6)}-${fn:substring(item.fd_tel_info_desc, 6, 10)}
																</c:when>
																<c:when test="${item.fd_tel_info_desc.length() == 10}">
																	${fn:substring(item.fd_tel_info_desc, 0, 3)}-${fn:substring(item.fd_tel_info_desc, 3, 6)}-${fn:substring(item.fd_tel_info_desc, 6, 10)}
																</c:when>
																<c:when test="${item.fd_tel_info_desc.length() == 11}">
																	${fn:substring(item.fd_tel_info_desc, 0, 3)}-${fn:substring(item.fd_tel_info_desc, 3, 7)}-${fn:substring(item.fd_tel_info_desc, 7, 11)}
																</c:when>
																<c:otherwise>
																	${item.fd_tel_info_desc}
																</c:otherwise>
															</c:choose>
														</td>

														<td class="ship_td5 on">
															<button id="${item.pk_idx}"><img src="/resources/images/main/ship_change.jpg" width="23" height="18" border="0" alt="" /></button>
														</td>

														<td class="ship_td6 <c:if test="${item.fd_basic_yn eq 'Y'}">on</c:if>">
															<button id="${item.pk_idx}"><img src="/resources/images/main/ship_delete.jpg" width="19" height="19" border="0" alt="" /></button>
														</td>
													</tr>
													</c:forEach>
												</c:if>
											</tbody>
										</table>
	
										<div class="sc_modi_popup">
											<div class="sm_tit">
												<h4>배송지 수정</h4>
												<button class="sm_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
											</div>
	
											<div class="sm_txt">
												<div class="sm_txt_wrap">
													<div class="sm_txt_top">
														<span class="sc_sp">기본배송지</span>
														<!-- 배송지 수정 버튼 추가 START -->
														<button class="btn_add_mod">배송지 수정</button>
														<!-- 배송지 수정 버튼 추가 END -->
													</div>
													<ul>
														<li>
															<p id="sm_addr"></p>
															<div class="form_cont">
																<label for="sc_md_ip1"></label>
																<input type="text" id="sc_md_ip1" placeholder="상세 주소 입력해주세요.">
																<input type="hidden" id="sc_md_ip4">
															</div>
														</li>
													
														<li>
															<p>받으실 분</p>
															<div class="form_cont">
																<label for="sc_md_ip2"></label>
																<input type="text" id="sc_md_ip2">
															</div>
														</li>
													
														<li>
															<p>연락처</p>
															<div class="form_cont">
																<label for="sc_md_ip3"></label>
																<input type="text" id="sc_md_ip3">
															</div>
														</li>
	
<%--														<li>--%>
<%--															<div class="chk_wrap">--%>
<%--																<input id="ship_save1" type="checkbox">--%>
<%--																<label for="ship_save1">기본배송지로 저장</label>--%>
<%--															</div>--%>
<%--														</li>--%>
													</ul>
												</div>
											</div>
											<input hidden id="addr_idx" value=""/>
											<div id="address_btn" class="sm_btn btn_save btn_modify"><button>저장</button></div>
										</div>
	
										<div class="delete_popup">
											<input hidden id="delete_addr_idx" value=""/>
											<button class="dep_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>
											<h5>배송지를 삭제하시겠습니까?</h5>
											<div class="btn_wrap">
												<button class="cancel_btn">취소</button>
												<button class="ok_btn">확인</button>
											</div>
										</div>
	
										<div class="pd_list_paging">
											${pageNavi.navi}
										</div>

									</div>
	
									<div class="clear">
										<button class="save_ship">기본배송지로 저장</button>
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