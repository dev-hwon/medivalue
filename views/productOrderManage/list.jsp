<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<link rel="stylesheet" href="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.standalone.min.css" type="text/css" />		
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.min.js"></script>
    	<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>
		<script type="text/javascript">
			var signInPopup = {
				showMessage: function (msg) {
					$("#pop_alarm_msg").text(msg);
					$("#black").show();
					$(".popup_message_type_1").show();
				}
			};

			$(document).ready(function (){
				var $rtBtn=$("#sub3_1 .cnt1 .area .real_area .wrap .right .right_tit .rt_tit button");
				$rtBtn.on("click", function  () {
					if ($(this).hasClass("on")) {
						$(this).removeClass("on").parent().next(".rt_filter").stop().slideUp()
					}else {
						$(this).addClass("on").parent().next(".rt_filter").stop().slideDown()
					}
				});

				let login_check = '${login_check}';
				if (login_check === 'N') {
					// alert("로그인 후에 이용 가능합니다.");
					location.replace("/access/login")
				}

				let searchString = '${pageHelper.searchString}';
				if (searchString != '') {
					$("#searchLabel").hide();
				}

				$(".detail_sch_btn").addClass("on");
				// $(".rt_filter").slideDown();
				// $(".rt_filter").open();

				$(".sch_icon").on("click", function () {
					$("#frm").submit();
				});

				$(".one_inq").on("click", function () {
					ChannelIO('showMessenger');
					//location.href="/member/mypage/question/write";
					//$(".popup_message_type_1").css("display","block");
					//$("div.popup_message_type_1 > div.tit > h4").text("1:1 문의");
					//$("#pop_alarm_msg").text("우측 하단 '채널톡'을 이용하시면 빠른 문의가 가능합니다. ");
					//$("#black").css("display","block");
				});

				$(".ship_check").on("click", function () {
					let orderId = $(this).attr("id");
					location.href="/order/delivery/" + orderId;
				});

				$(".order_list_go").on("click", function () {
					location.href = "/order/list";
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

				$(".input_date").datepicker({
					language: "ko",
					format: "yyyy-mm-dd"
				})

				// $(".input_date").each(function (index, value) {
				// 	$(value).focus();
				// });

				$(".cal_icon").on("click", function () {
					$(this).parent().children(".input_date").focus();
				});

				$("#inq_p1").on("change", function () {

					let startDate = $(this).val();
					let endDate = $("#endDate").val();

					if (new Date(startDate) >= new Date(endDate)) {
						signInPopup.showMessage("올바르지 않은 날짜 선택입니다.");
						console.log($("#startDate").val());

						// $("#inq_p1").val($("#startDate").val());

					}	else {
						$("#startDate").val(startDate);
					}

				});

				$("#inq_p2").on("change", function () {
					let endDate = $(this).val();
					$("#endDate").val(endDate);
				});

				$("#btn_order_search").on("click",function(){
					$("#frm").submit();
				});
			});
		</script>
		${pageNavi.script}
	</jsp:attribute>
	<jsp:body>
		<section id="sub3_1" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<layout:leftMyFrame/>

							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>주문배송 조회</h4>
										<button class="detail_sch_btn" type="button">상세검색</button>
									</div>
									<div class="rt_filter">
										<div class="inq_period clear">
											<h5>조회기간</h5>
											<div class="form_cont">
<%--												<label for="inq_p1">yyyy.mm.dd</label>--%>
												<input class="input_date" type="text" id="inq_p1" value="${startDate}">
												<button class="cal_icon" type="button"><img src="/resources/images/main/order_calen.jpg" width="11" height="11" border="0" alt="" /></button>
											</div>
											<p>~</p>
											<div class="form_cont">
<%--												<label for="inq_p2">yyyy.mm.dd</label>--%>
												<input class="input_date" type="text" id="inq_p2" value="${endDate}">
												<button class="cal_icon" type="button"><img src="/resources/images/main/order_calen.jpg" width="11" height="11" border="0" alt="" /></button>
											</div>
											 <button class="btn_search" type="button" id="btn_order_search"></button>
										</div>

										<div class="pd_sch clear">

											<h5>제품검색</h5>
											<div class="form_cont">
												<form id="frm" name="frm" action="/order/list" method="post">
												<input hidden type="text" name="startDate" id="startDate" value="${startDate}">
												<input hidden type="text" name="endDate" id="endDate" value="${endDate}">

												<label id="searchLabel" for="searchString2">주문 상품명을 입력하세요</label>
												<input type="text" id="searchString2" name="searchString" value="${pageHelper.searchString}">
												<button class="sch_icon btn_search"></button>
												</form>
											</div>
										</div>
									</div>
								</div>
								<div class="right_txt">
									<ul class="rt_depth1">
										<c:if test="${!empty list}">
										<c:forEach var="item" items="${list}" varStatus="varStatus">
<%--											<li class="<c:if test="${!empty item.fd_option_count && item.fd_option_count > 0}">option</c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">--%>
											<li>
												<h5>
													<fmt:formatDate value="${item.fd_reg_date}" pattern="yyyy.MM.dd (HH시 mm분)" />
												</h5>

												<div class="box" <c:if test="${member_paymentMethod eq 'PM0002'}">style="height: 180px;"</c:if>>
													<div class="box_pd_tit clear">
														<h5>
															<c:choose>
																<c:when test="${item.fd_cnt > 1}">
																	${item.fd_product_name} 외 ${item.fd_cnt - 1}건
																</c:when>
																<c:otherwise>
																	${item.fd_product_name}
																</c:otherwise>
															</c:choose>
														</h5>
														<a href="/order/detail/<c:out value="${item.fd_order_id}"/>">
															<button class="detail_view" type="button">상세보기</button>
														</a>
													</div>

													<div class="box_pd_info clear">
														<div class="img">
															<div class="icon_list">
																<div class="li li_option">
																	<div>
																		<div class="desc">규격<br>확인</div>
																	</div>
																</div>
																<div class="li li_insure">
																	<div>
																		<div class="desc">보험<br>재료</div>
																	</div>
																</div>
															</div>
															<c:choose>
																<c:when test="${!empty item.fd_img_path_thumbnail}">
																	<img src="<c:out value="${item.fd_img_path_thumbnail}"/>" width="250" height="321" border="0" alt="" />
																</c:when>
																<c:when test="${!empty item.fd_img_path}">
																	<img src="<c:out value="${item.fd_img_path}"/>" width="250" height="321" border="0" alt="" />
																</c:when>
																<c:otherwise>
																	<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																</c:otherwise>
															</c:choose>
														</div>
														<div class="order_info">
															<ul class="rt_depth2" <c:if test="${member_paymentMethod eq 'PM0002'}">style="padding-top: 15px;"</c:if>>
																<li class="clear">
																	<h6>주문번호</h6>
																	<p>
																		<c:out value="${item.fd_order_id}" />
																	</p>
																</li>
																<c:if test="${member_paymentMethod eq 'PM0002'}">
																	<li class="clear">
																		<h6>결제방식</h6>
																		<p>
																			<c:if test="${item.fd_payment_method eq 'PM0001'}" >선불</c:if>
																			<c:if test="${item.fd_payment_method eq 'PM0002'}" >후불</c:if>
																		</p>
																	</li>
																</c:if>
																<li class="clear">
																	<h6>결제금액</h6>
																	<p>
																		<fmt:formatNumber value="${item.fd_total_payment}" pattern="#,###" />원
																	</p>
																</li>

																<li class="clear">
																	<h6>주문상태</h6>
																	<p><c:out value="${item.fd_state_name}"/> <c:if test="${fn:contains(item.group_part_cancel_yn, 'Y') && item.fd_state_code ne 'PP0003'}">(부분 취소)</c:if></p>
																</li>
															</ul>
														</div>
														<div class="btn_wrap">
															<button type="button" class="ship_check" id="<c:out value="${item.fd_order_id}"/>">배송조회</button>
															<button type="button" class="one_inq">1:1 문의</button>
														</div>
													</div>
												</div>
											</li>
										</c:forEach>
										</c:if>
										<c:if test="${empty list}">
											<li>
												<div class="box">
													<div class="box_pd_tit clear">
														<h5 style="width: 100%; text-align:center">
															검색 결과가 없습니다.
														</h5>
													</div>
<%--													<h5>검색 결과가 없습니다.</h5>--%>
												</div>
											</li>
										</c:if>
									</ul>
							
									<div class="pd_list_paging">
										${pageNavi.navi}
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