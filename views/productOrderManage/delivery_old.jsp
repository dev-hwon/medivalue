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

			var alertPopup = {
				showMessage: function (msg) {
					$("#pop_alarm_msg").text(msg);
					$("#black").show();
					$(".popup_message_type_1").show();
				}
			};

			$(document).ready(function (){
				var $s33OitBtn=$("#sub3_3 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .order_info_txt .depth1 > li .box .down_btn");
				var $s33storeBtn=$("#sub3_3 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .order_info_txt .depth1 > li .box .store_btn");
				var $s33storeClose=$("#sub3_3 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .order_info_txt .depth1 > li .box .store_popup .store_pu_close");
	
				$s33storeBtn.on("click", function  () {
					$(this).next().css("display","block");
					$("#black").css("display","block");
				});
	
				$s33storeClose.on("click", function  () {
					$(this).parent().css("display","none");
					$("#black").css("display","none");
				});
	
				$("#sub3_3 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .order_info_txt .depth1 > li .box .store_popup .store_pu_ok").on("click", function  () {
					$s33storeClose.click()
				});
	
				$("#black").on("click", function  () {
					$s33storeClose.click()
				});
	
				$("#sub3_3 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .order_info_txt .depth1 > li .box .store_popup .spu_tab_split .spu_tab_btn > li button").on("click", function  () {
					var tgIdx=$(this).parent().index();
	
					$(this).parent().addClass("on").siblings().removeClass("on");
					$(this).closest(".spu_tab_split").find(">.spu_tab_cnt>div").eq(tgIdx).show().siblings().hide();
					
					return false;
				});
	
				$s33OitBtn.on("click", function  () {
					if ($(this).hasClass("on")) {
						$(this).removeClass("on").css("transform","scaleY(1)").parent().next(".box_detail").stop().slideUp();
					}else {
						$(this).addClass("on").css("transform","scaleY(-1)").parent().next(".box_detail").stop().slideDown();
					}
				});
				
				$.each($s33OitBtn, function(i, el){
					$(this).addClass("on").css("transform","scaleY(-1)").parent().next(".box_detail").stop().slideDown();
				});

				let login_check = '${login_check}';
				if (login_check === 'N') {
					location.replace("/access/login");
				}

				let rtn_code = '${rtn_code}';
				let rtn_msg = '${rtn_msg}';

				if (rtn_code != '200') {
					alert(rtn_code);
					//location.replace("/order/list");
				}

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
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub3_3" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<layout:leftMyFrame/>
							</div>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>배송 조회</h4>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<div class="order_info_tit clear">
											<h4>총 배송 : <c:out value="${productInfoList.size()}"/>건</h4>
										</div>
										<div class="order_info_txt">
											<ul class="depth1">
												<c:forEach var="item" items="${productInfoList}" varStatus="varStatus">													
													<c:set var="deliveryInfo" value="${item.productOrderDeliveryVO}"/>
												<li class="spe_offer">
													<%--
													<h5>배송 <c:out value="${productInfoList.size()}"/>건 중 ${varStatus.index + 1}</h5>
													 --%>
													<div class="box clear">
<%--														<h6><img src="/resources/images/main/sale_per.jpg" width="140" height="140" border="0" alt="" />특가제품</h6>--%>
														<h6>배송 <c:out value="${productInfoList.size()}"/>건 중 ${varStatus.index + 1}</h6>
														<c:choose>
															<c:when test="${productOrderInfo.fd_state_code eq 'PP0003'}"><strong>취소가 완료되었습니다.</strong></c:when>
															<c:when test="${productOrderInfo.fd_state_code eq 'PP0004'}"><strong>환불이 완료되었습니다.</strong></c:when>
															<c:when test="${productOrderInfo.fd_state_code eq 'PP0013'}"><strong>배송 완료되었습니다.</strong></c:when>
															<c:when test="${!empty deliveryInfo.delivery_company_name}">
																<strong>배송 중 입니다.</strong>
																<button type="button" onclick="javascript:window.open('https://www.ilogen.com/m/personal/trace.pop/${deliveryInfo.fd_delivery_no}','pop_delivery','width=700px,height=600px;,location=no,status=no,scrollbars=yes');"><c:out value="${deliveryInfo.fd_delivery_no}"/></button>
															</c:when>
															<c:otherwise>
																<strong>배송 준비중 입니다.</strong>
																<%-- <strong>${productOrderInfo.fd_date} 도착예정입니다.</strong> --%>
															</c:otherwise>
														</c:choose>
														<%--
														<button class="store_btn">판매자 : <span><c:out value="${shop.fd_shop_name}"/></span></button>
														<div class="store_popup">
															<button class="store_pu_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>
	
															<div class="spu_tab_split">
																<ul class="spu_tab_btn clear">
																	<li class="spu_tab_tab1 on"><button>판매점 정보</button></li>
																	<li class="spu_tab_tab3"><button>취소&middot;반품</button></li>
																</ul>
	
																<div class="spu_tab_cnt">
																	<div class="spu_tab_cnt1">
																		<ul>
																			<li class="clear">
																				<h6>판매점</h6>
																				<p><c:out value="${shop.fd_shop_name}"/></p>
																			</li>
	
																			<li class="clear">
																				<h6>영업시간</h6>
																				<p><c:out value="${shop.fd_corporate_open_time}"/></p>
																			</li>
	
																			<li class="clear">
																				<h6>이메일</h6>
< % --																				<p><c:out value="${shop.fd_email_info_desc}"/></p>-- % >
																				<p></p>
																			</li>
	
																			<li class="clear">
																				<h6>전화번호</h6>
																				<p><c:out value="${shop.fd_tel_nomal_desc}"/></p>
																			</li>
	
																			<li class="clear">
																				<h6>휴무일</h6>
																				<p><c:out value="${shop.fd_corporate_holiday_info}"/></p>
																			</li>
	
																			<li class="clear">
																				<h6>배송방법</h6>
																				<p>택배, 퀵서비스, 직접수령</p>
																			</li>
	
																			<li class="clear">
																				<h6>주소</h6>
																				<p><c:out value="${shop.fd_corporate_addr}"/>, <c:out value="${shop.fd_corporate_addr_detail}"/></p>
																			</li>
																		</ul>
																	</div>
	
																	<div class="spu_tab_cnt3">
																		<ul>
																			<li class="clear">
																				<h6>배송정책</h6>
																				<p>주문마감 11시 / 발송까지 주말 제외 최소 3일 이상</p>
																			</li>
	
																			<li class="li_h100 clear">
																				<h6>A/S 정책</h6>
																				<p>구매일로부터 15일 이내<br>무상 교체해드립니다.</p>
																			</li>
	
																			<li class="li_h100 clear">
																				<h6>취소/반품</h6>
																				<p>상품 외 문제의 경우<br>택배비 왕복 부담<br><br>교환 및 환불시에는 직접 환불 접수하여야 합니다.<br><br>소비자 변심에 의한 반품되는 경우<br>판매금액의 10% 제외 후 환불됩니다.</p>
																			</li>
	
																			<li class="clear">
																				<h6>이메일</h6>
< % --																				<p><c:out value="${shop.fd_email_info_desc}"/></p>-- % >
																				<p></p>
																			</li>
	
																			<li class="clear">
																				<h6>전화번호</h6>
																				<p><c:out value="${shop.fd_tel_nomal_desc}"/></p>
																			</li>
	
																			<li class="clear">
																				<h6>휴무일</h6>
																				<p><c:out value="${shop.fd_corporate_holiday_info}"/></p>
																			</li>
	
																			<li class="clear">
																				<h6>배송방법</h6>
																				<p>택배, 퀵서비스, 직접수령</p>
																			</li>
	
																			<li class="clear">
																				<h6>주소</h6>
																				<p><c:out value="${shop.fd_corporate_addr}"/>, <c:out value="${shop.fd_corporate_addr_detail}"/></p>
																			</li>
																		</ul>
																		< %--
																		<a href="/member/mypage/question/write" class="one_inq">1:1문의하기</a>
																		<p>판매점에 문의하시면 빠른 답변 가능합니다.</p>
																		 -- % >
																	</div>
																</div>
															</div>
															<button class="store_pu_ok">확인</button>
														</div>
														<button class="down_btn"><img src="/resources/images/main/sale_down.jpg" width="57" height="32" border="0" alt="" /></button>
														--%>
													</div>
													<%--
													<c:choose>
														<c:when test="${productOrderInfo.fd_state_code eq 'PP0003'}">
															<div class="box_detail"><ul><li class="clear"><h6>취소가 완료되었습니다.</h6></li></ul></div>
														</c:when>
														<c:when test="${productOrderInfo.fd_state_code eq 'PP0004'}">
															<div class="box_detail"><ul><li class="clear"><h6>환불이 완료되었습니다.</h6></li></ul></div>
														</c:when>
														<c:when test="${!empty item.delivery_company_name}">
															<div class="box_detail">
																<ul>
																	<li class="clear">
																		<h6>배송업체</h6>
																		<p><c:out value="${item.delivery_company_name}"/></p>
																	</li>
																	<li class="clear">
																		<h6>송장번호</h6>
																		<div class="p_wrap clear">
																			<c:choose>
																				<c:when test="${ item.fd_delivery_state_code eq 'PS0005'}">
																					<button type="button" onclick="javascript:window.open('https://www.ilogen.com/m/personal/trace.pop/${item.fd_delivery_no}','pop_delivery','width=700px,height=600px;,location=no,status=no,scrollbars=yes');"><c:out value="${item.fd_delivery_no}"/></button>
																				</c:when>
																				<c:otherwise>
																					<button type="button"><c:out value="${item.fd_delivery_no}"/></button>
																				</c:otherwise>
																			</c:choose>																			
																			< %--
																			<c:forEach var="delivery" items="${deliveryOrderList}" varStatus="varStatus">
																				<c:set var="deliveryInfo" value="${delivery.productOrderDeliveryVO}"/>																				
																				<c:choose>
																					<c:when test="${ item.fd_delivery_company eq 'PS0005'}">
																						<button type="button" onclick="javascript:window.open('https://www.ilogen.com/m/personal/trace.pop/${deliveryInfo.fd_delivery_no}','pop_delivery','width=700px,height=600px;,location=no,status=no,scrollbars=yes');"><c:out value="${deliveryInfo.fd_delivery_no}"/></button>
																					</c:when>
																					<c:otherwise>
																						<button type="button"><c:out value="${deliveryInfo.fd_delivery_no}"/></button>
																					</c:otherwise>
																				</c:choose>
																			</c:forEach>
																			 --% > 
																		</div>
																	</li>
																	< %--<li class="clear">
																		<h6>담당자</h6>
																		<p>한동운</p>
																	</li>
																	<li class="clear">
																		<h6>연락처</h6>
																		<p>010-5784-8754</p>
																	</li>--% >
																</ul>
															</div>
														</c:when>

														<c:otherwise>															
															<div class="box_detail">
																<ul>
																	<li class="clear">
																		<h6>
																		<c:if test="${productOrderInfo.fd_state_code eq 'PP0013'}">배송 완료되었습니다.</c:if>
																		<c:if test="${productOrderInfo.fd_state_code ne 'PP0013'}">배송 준비중 입니다.</c:if>
																		</h6>
																	</li>
																</ul>
															</div>
														</c:otherwise>
													</c:choose>
													 --%>
												</li>
												</c:forEach>
											</ul>
										</div>
									</div>
	
									<div class="rt_cnt2">
										<div class="order_info_tit clear">
											<h4>받는사람</h4>
										</div>
	
										<div class="order_info_txt">
											<ul class="">
												<li class="clear">
													<h5>받는사람</h5>
													<p><c:out value="${productOrderInfo.fd_addr_name}"/></p>
												</li>
	
												<li class="clear">
													<h5>받는주소</h5>
													<p>
														<c:out value="${productOrderInfo.fd_addr_desc}"/>, <c:out value="${productOrderInfo.fd_addr_detail_desc}"/>
													</p>
												</li>
	
												<li class="clear">
													<h5>배송요청사항</h5>
													<p><c:out value="${productOrderInfo.fd_ship_req}"/></p>
												</li>
	
												<li class="clear">
													<h5>연락처</h5>
													<p>
														<c:choose>
															<c:when test="${member.fd_tel_nomal_desc.length() == 8}">
																${fn:substring(member.fd_tel_nomal_desc, 0, 4)}-${fn:substring(member.fd_tel_nomal_desc, 4, 8)}
															</c:when>
															<c:when test="${member.fd_tel_nomal_desc.length() == 9}">
																${fn:substring(member.fd_tel_nomal_desc, 0, 2)}-${fn:substring(member.fd_tel_nomal_desc, 2, 5)}-${fn:substring(member.fd_tel_nomal_desc, 5, 9)}
															</c:when>
															<c:when test="${member.fd_tel_nomal_desc.length() == 10 && fn:startsWith(member.fd_tel_nomal_desc, '02')}">
																${fn:substring(member.fd_tel_nomal_desc, 0, 2)}-${fn:substring(member.fd_tel_nomal_desc, 2, 6)}-${fn:substring(member.fd_tel_nomal_desc, 6, 10)}
															</c:when>
															<c:when test="${member.fd_tel_nomal_desc.length() == 10}">
																${fn:substring(member.fd_tel_nomal_desc, 0, 3)}-${fn:substring(member.fd_tel_nomal_desc, 3, 6)}-${fn:substring(member.fd_tel_nomal_desc, 6, 10)}
															</c:when>
															<c:when test="${member.fd_tel_nomal_desc.length() == 11}">
																${fn:substring(member.fd_tel_nomal_desc, 0, 3)}-${fn:substring(member.fd_tel_nomal_desc, 3, 7)}-${fn:substring(member.fd_tel_nomal_desc, 7, 11)}
															</c:when>
															<c:otherwise>
																${member.fd_tel_nomal_desc}
															</c:otherwise>
														</c:choose>,
														<c:choose>
															<c:when test="${member.fd_tel_mobile_desc.length() == 8}">
																${fn:substring(member.fd_tel_mobile_desc, 0, 4)}-${fn:substring(member.fd_tel_mobile_desc, 4, 8)}
															</c:when>
															<c:when test="${member.fd_tel_mobile_desc.length() == 9}">
																${fn:substring(member.fd_tel_mobile_desc, 0, 2)}-${fn:substring(member.fd_tel_mobile_desc, 2, 5)}-${fn:substring(member.fd_tel_mobile_desc, 5, 9)}
															</c:when>
															<c:when test="${member.fd_tel_mobile_desc.length() == 10 && fn:startsWith(member.fd_tel_mobile_desc, '02')}">
																${fn:substring(member.fd_tel_mobile_desc, 0, 2)}-${fn:substring(member.fd_tel_mobile_desc, 2, 6)}-${fn:substring(member.fd_tel_mobile_desc, 6, 10)}
															</c:when>
															<c:when test="${member.fd_tel_mobile_desc.length() == 10}">
																${fn:substring(member.fd_tel_mobile_desc, 0, 3)}-${fn:substring(member.fd_tel_mobile_desc, 3, 6)}-${fn:substring(member.fd_tel_mobile_desc, 6, 10)}
															</c:when>
															<c:when test="${member.fd_tel_mobile_desc.length() == 11}">
																${fn:substring(member.fd_tel_mobile_desc, 0, 3)}-${fn:substring(member.fd_tel_mobile_desc, 3, 7)}-${fn:substring(member.fd_tel_mobile_desc, 7, 11)}
															</c:when>
															<c:otherwise>
																${member.fd_tel_mobile_desc}
															</c:otherwise>
														</c:choose>
													</p>
												</li>
											</ul>
										</div>
									</div>
									<div class="clear">
										<button class="order_list_go" type="button">주문목록으로</button>
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