<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:medicashFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript" src="/resources/js/sub2.js"></script>
		<script type="text/javascript">

			var signInPopup = {
				showMessage: function (msg) {
					$("#pop_alarm_msg").text(msg);
					$("#black").show();
					$(".popup_message_type_1").show();
				}
			};

			$(document).ready(function (){
				$(".order_view").on("click", function () {
					<%--location.replace("/order/detail/" + "${order_id}");--%>
					window.parent.open("/order/detail/" + "${order_id}");
				});

				$(".copy_btn").on("click", function () {
					var $temp = $("<input>");
					$("body").append($temp);
					$temp.val($("#bank_no").val()).select();
					let result = document.execCommand("copy");
					if (result) {
						signInPopup.showMessage("복사되었습니다.");
					}
					$temp.remove();
				});

				// $(".shopping_go").on("click", function () {
				// 	location.replace("/product/basket/list");
				// });
				$(".shopping_go").on("click", function () {
					window.close();
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub2_3" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<h3>주문완료</h3>
	
						<div class="order_pd">
							<div class="order_pd_txt">
								<h5><span>주문이 완료</span>되었으나 결제대기중입니다.</h5>
<%--								<p>주문은 <span>${productInfoMap.size()}번</span>에 나뉘어 배송됩니다.</p>--%>
							</div>
						</div>
					</div>
				</div>
			</article>
	
			<article class="cnt2">
				<div class="area">
					<div class="real_area">
						<div class="order_info_tit clear">
							<h4>상품 정보</h4>
						</div>

						<div class="order_info_txt">
							<ul class="depth1">

									<li class="spe_offer">
										<h5>주문 <c:out value="${medicashOrderProductList.size()}"/>건</h5>
										<div class="box clear">
												<%--											<h6><img src="/resources/images/main/sale_per.jpg" width="140" height="140" border="0" alt="" />특가제품</h6>--%>
											<h6>주문정보</h6>
<%--											<strong><c:out value="${productOrderResult.fd_date}"/> 도착예정입니다.</strong>--%>
<%--											<p>판매자 : <span><c:out value="${medicashOrderProductList.get(0).fd_shop_name}"/></span></p>--%>
											<button><img src="/resources/images/main/sale_down.jpg" width="57" height="32" border="0" alt="" /></button>
										</div>
										<div class="box_detail">
											<ul>
											<c:forEach var="item" items="${medicashOrderProductList}" varStatus="varStatus">
													<li class="clear">
														<div class="img">
															<c:choose>
																<c:when test="${!empty item.fd_img_path_thumbnail}">
																	<img src="<c:out value="${item.fd_img_path_thumbnail}"/>" width="250" height="321" border="0" alt="" />
																</c:when>
																<c:when test="${!empty shop.fd_img_path}">
																	<img src="<c:out value="${item.fd_img_path}"/>" width="250" height="321" border="0" alt="" />
																</c:when>
																<c:otherwise>
																	<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																</c:otherwise>
															</c:choose>
														</div>

														<div class="info">
															<div class="info_box">
																<h4 class="pd_tit">${item.fd_product_name}</h4>
<%--																<p class="standard">[규격] ${item.fd_product_standard}</p>--%>
<%--																<div class="mp_wrap clear">--%>
<%--																	<p class="manu">제조사ㅣ${item.fd_company_info}</p>--%>
<%--																	<p class="pack">포장단위ㅣ${item.fd_product_unit}</p>--%>
<%--																</div>--%>
															</div>
														</div>

														<div class="pack_p">
															<p>${item.fd_cnt}개</p>
														</div>

														<div class="price_p">
															<p><fmt:formatNumber value="${item.shop_sale_amount * item.fd_cnt}" pattern="#,###"/>원</p>
														</div>
													</li>

											</c:forEach>
											</ul>
										</div>
									</li>
							</ul>
						</div>
					</div>
				</div>
			</article>
	
			<article class="cnt4">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<div class="order_info_tit clear">
									<h4>결제정보</h4>
									<p>입금일은 주문일로 부터 3일</p>
								</div>

								<div class="order_info_txt">
									<ul class="depth1">
										<li class="oit_1 clear">
											<h5>입금기한</h5>
											<c:set var="time" value="<%=new java.util.Date(new java.util.Date().getTime() + 60*60*24*1000*3 )%>" />
											<p><fmt:formatDate value="${time}" pattern="yyyy년 MM월 dd일 00시 00분까지"/></p>
										</li>

										<li class="oit_2 clear">
											<h5>입금금액</h5>
											<p><fmt:formatNumber value="${medicashOrderResult.fd_total_payment}" pattern="#,###"/>원</p>
										</li>

										<li class="oit_3 clear">
											<h5>입금계좌</h5>
											<input id="bank_no" hidden value="547-910035-44104"/>
											<p class="copy_btn">하나은행 547-910035-44104</p>
										</li>

										<li class="oit_4 clear">
											<h5>입금주</h5>
											<p>주식회사 메디밸류</p>
										</li>
									</ul>
								</div>
							</div>
							<div class="right">
								<div class="order_info_tit clear">
									<h4>결제정보</h4>
								</div>
							
								<div class="order_info_txt">
									<ul class="depth1">
										<li class="oit_1 clear">
											<h5>결제수단</h5>
											<p>계좌이체</p>
										</li>
							
										<li class="oit_2 clear">
											<h5>결제금액</h5>
											<p><fmt:formatNumber value="${medicashOrderResult.fd_product_payment}" pattern="#,###"/>원</p>
										</li>
							
<%--										<li class="oit_3 clear">--%>
<%--											<h5>배송비</h5>--%>
<%--											<p><fmt:formatNumber value="${productOrderResult.fd_delivery_fee}" pattern="#,###"/>원</p>--%>
<%--										</li>--%>
							
										<li class="oit_4 clear">
											<h5>총 금액</h5>
											<p><fmt:formatNumber value="${medicashOrderResult.fd_total_payment}" pattern="#,###"/>원</p>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="clear">
						<div class="btn_wrap clear">
							<button class="order_view">주문 상세보기</button>
							<button class="shopping_go">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>
	</jsp:body>
</layout:medicashFrame>