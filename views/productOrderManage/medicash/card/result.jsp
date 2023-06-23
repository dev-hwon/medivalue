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
			$(document).ready(function (){
				$(".order_view").on("click", function () {
					window.parent.open("/order/detail/" + "${order_id}");
				});

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
								<h5><span>주문이 완료</span> 후 결제되었습니다.</h5>
<%--								<p>주문은 <span>${medicashOrderProductList.size()}번</span>에 나뉘어 배송될 예정입니다.</p>--%>
							</div>
						</div>
					</div>
				</div>
			</article>
	
			<article class="cnt2">
				<div class="area">
					<div class="real_area">
<%--						<div class="order_info_tit clear">--%>
<%--							<h4>상품배송 정보</h4>--%>
<%--						</div>--%>
						<div class="order_info_txt">
							<ul class="depth1">
								<li class="spe_offer">
									<h5>주문 <c:out value="${medicashOrderProductList.size()}"/>건</h5>
									<div class="box clear">
											<%--											<h6><img src="/resources/images/main/sale_per.jpg" width="140" height="140" border="0" alt="" />특가제품</h6>--%>
										<h6>주문정보</h6>
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
																<c:when test="${!empty item.fd_img_path}">
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
								</div>
							
								<div class="order_info_txt">
									<ul class="depth1">
										<li class="oit_1 clear">
											<h5>결제방법</h5>
											<p>카드결제</p>
										</li>
							
										<li class="oit_2 clear">
											<h5>결제금액</h5>
											<p><fmt:formatNumber value="${medicashOrderResult.fd_total_payment}" pattern="#,###"/>원</p>
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
											<p>카드결제</p>
										</li>

										<li class="oit_2 clear">
											<h5>결제금액</h5>
											<p><fmt:formatNumber value="${medicashOrderResult.fd_product_payment}" pattern="#,###"/>원</p>
										</li>

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
	
			<article class="cnt4">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">

						</div>
					</div>


				</div>
			</div>
		</article>
	</section>
	</jsp:body>
</layout:medicashFrame>