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
		<script type="text/javascript" src="/resources/js/common.js?20220203"></script>
		<script type="text/javascript" src="/resources/js/sub2.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				purchase_log();
				$(".order_view").on("click", function () {
					location.replace("/order/detail/" + "${order_id}");
				});
				$(".shopping_go").on("click", function () {
					location.replace("/product/basket/list");
				});
			});
			function purchase_log() {
				let productOrderResultJson = ${productOrderResultJson};
				let productInfoListJson = ${productInfoListJson};
				labbit_purchase(productOrderResultJson, productInfoListJson);
			}
		</script>
		<script type="text/javascript">
			var _nasa={};
			if (window.wcs) _nasa["cnv"] = wcs.cnv("1","${productOrderResult.fd_total_payment}");
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
								<h5><span>주문이 완료</span> 후 결제되었습니다.</h5>
								<p>주문은 <span>${productInfoMap.size()}번</span>에 나뉘어 배송될 예정입니다.</p>
							</div>
						</div>
					</div>
				</div>
			</article>
	
			<article class="cnt2">
				<div class="area">
					<div class="real_area">
						<div class="order_info_tit clear">
							<h4>상품배송 정보</h4>
<%--							<p>상품배송 정보입니다.</p>--%>
						</div>

						<div class="order_info_txt">
							<ul class="depth1">

								<c:forEach var="item" items="${productInfoMap}" varStatus="varStatus">
									<li class="spe_offer">
										<h5>배송 <c:out value="${productInfoMap.size()}"/>건 중 ${varStatus.index + 1}</h5>
										<div class="box clear">
												<%--											<h6><img src="/resources/images/main/sale_per.jpg" width="140" height="140" border="0" alt="" />특가제품</h6>--%>
											<h6>주문정보</h6>
											<strong><c:out value="${productOrderResult.fd_date}"/> 도착예정입니다.</strong>
											<p>판매자 : <span><c:out value="${item.key}"/></span></p>
											<button><img src="/resources/images/main/sale_down.jpg" width="57" height="32" border="0" alt="" /></button>
										</div>
										<div class="box_detail">
											<ul>
											<c:forEach var="shop" items="${item.value}" varStatus="shopStatus">

														<li class="clear">
															<div class="img">
																<c:choose>
																	<c:when test="${!empty shop.fd_img_path_thumbnail}">
																		<img src="<c:out value="${shop.fd_img_path_thumbnail}"/>" width="250" height="321" border="0" alt="" />
																	</c:when>
																	<c:when test="${!empty shop.fd_img_path}">
																		<img src="<c:out value="${shop.fd_img_path}"/>" width="250" height="321" border="0" alt="" />
																	</c:when>
																	<c:otherwise>
																		<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																	</c:otherwise>
																</c:choose>
															</div>

															<div class="info">
																<div class="info_box">
																	<h4 class="pd_tit">${shop.fd_product_name}</h4>
																	<p class="standard">[규격] ${shop.fd_product_standard}</p>
																	<div class="mp_wrap clear">
																		<p class="manu">제조사ㅣ${shop.fd_company_info}</p>
																		<p class="pack">포장단위ㅣ${shop.fd_product_unit}</p>
																	</div>
																</div>
															</div>

															<div class="pack_p">
																<p>${shop.fd_cnt}개</p>
															</div>

															<div class="price_p">
																<p><fmt:formatNumber value="${shop.shop_sale_amount * shop.fd_cnt}" pattern="#,###"/>원</p>
															</div>
														</li>

											</c:forEach>
											</ul>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</article>
	
			<article class="cnt3">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<div class="order_info_tit clear">
									<h4>결제정보</h4>
<%--									<p>입금일은 주문일로 부터 3일</p>--%>
								</div>
							
								<div class="order_info_txt">
									<ul class="depth1">
										<li class="oit_1 clear">
											<h5>결제방법</h5>
											<p>카드결제</p>
										</li>
							
										<li class="oit_2 clear">
											<h5>결제금액</h5>
											<p><fmt:formatNumber value="${productOrderResult.fd_total_payment}" pattern="#,###"/>원</p>
										</li>
							
<%--										<li class="oit_3 clear">--%>
<%--											<h5>입금계좌</h5>--%>
<%--											<p>국민은행 1234567891012345</p>--%>
<%--										</li>--%>
<%--							--%>
<%--										<li class="oit_4 clear">--%>
<%--											<h5>입금주</h5>--%>
<%--											<p>메디밸류</p>--%>
<%--										</li>--%>
									</ul>
								</div>
							</div>
							
							<div class="right">
								<div class="order_info_tit clear">
									<h4>상품배송 정보</h4>
								</div>
							
								<div class="order_info_txt">
									<ul class="depth1">
										<li class="oit_1 clear">
											<h5>배송정보</h5>
											<p>자체배송</p>
										</li>

										<li class="oit_2 clear">
											<h5>판매업체</h5>
											<p><c:out value="${productShopNameList}"/></p>
										</li>
									</ul>
								</div>
							</div>
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
									<h4>받는사람 정보</h4>
								</div>
							
								<div class="order_info_txt">
									<ul class="depth1">
										<li class="oit_1 clear">
											<h5>받는사람</h5>
											<p>${productOrderResult.fd_addr_name}</p>
										</li>
							
										<li class="oit_2 clear">
											<h5>받은주소</h5>
											<p>${productOrderResult.fd_addr_desc} ${productOrderResult.fd_addr_detail_desc} ${productOrderResult.fd_addr_post_desc}</p>
										</li>

										<c:if test="${!empty productOrderResult.fd_ship_req}">
										<li class="oit_3 clear">
											<h5>배송요청사항</h5>
											<p>${productOrderResult.fd_ship_req}</p>
										</li>
										</c:if>
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
											<p>카드결제</p>
										</li>
							
										<li class="oit_2 clear">
											<h5>결제금액</h5>
											<p><fmt:formatNumber value="${productOrderResult.fd_product_payment}" pattern="#,###"/>원</p>
										</li>
							
										<li class="oit_3 clear">
											<h5>배송비</h5>
											<p><fmt:formatNumber value="${productOrderResult.fd_delivery_fee}" pattern="#,###"/>원</p>
										</li>
							
										<li class="oit_4 clear">
											<h5>총 금액</h5>
											<p><fmt:formatNumber value="${productOrderResult.fd_total_payment}" pattern="#,###"/>원</p>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="clear">
						<div class="btn_wrap clear">
							<button class="order_view">주문 상세보기</button>
							<button class="shopping_go">쇼핑 계속하기</button>
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>
	</jsp:body>
</layout:basicFrame>