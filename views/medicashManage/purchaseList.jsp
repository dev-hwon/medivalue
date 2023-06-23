<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<link rel="stylesheet" href="/resources/css/medicash.css?20230418" />
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


			const popupShow = () => {
				$(".btn_info_wrap .terms_popup").show();
			}
			const popupHide = () => {
				$(".btn_info_wrap .terms_popup").hide();
			}
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
										<h4 class="tab_off" onclick="location.href='/medicashMng/info'">메디캐시</h4>
										<h4>충전 / 취소 내역</h4>
										<div class="btn_info_wrap btn_tooltip">
											<a href="javascript:;">메디캐시 이용안내 ⓘ</a>
											<div class="terms_tooltip">
												<p class="tx_info">선불충전하고, 무료 포인트와 추가 적립 받으세요!</p>
											</div>
											<div class="terms_popup">
												<div class="bg" onclick="popupHide();"></div>
												<div class="cont">
													<button class="terms_close" onclick="popupHide();"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
													<div class="terms_tit"><h5>메디캐시 이용안내</h5></div>
													<div class="terms_txt">
														<p>‘메디밸류 메디캐시’는 메디밸류 내 선불충전 캐시입니다.</p>
														<p>메디캐시</p>
														<p>메디캐시</p>
														<p>메디캐시</p>
														<p>메디캐시</p>
														<p>메디캐시</p>
													</div>
													<button class="terms_btn" onclick="popupHide();">확인</button>
												</div>
											</div>
										</div>

									</div>
								</div>

								<div class="right_txt">
									<div class="rt_cnt1">
										<table style="text-align: center;">
											<thead>
											<tr>
												<th>주문번호</th>
												<th>일시</th>
												<th>결제상품</th>
												<th>결제금액(원)</th>
												<th>지급혜택</th>
												<th>비고</th>
											</tr>
											</thead>
											<tbody>
												<c:if test="${empty medicashPurchaseList}">
													<tr>
														<td colspan="6" style="text-align: center;">충전/취소 내역이 없습니다.</td>
													</tr>
												</c:if>
												<c:if test="${!empty medicashPurchaseList}">
													<c:forEach var="item" items="${medicashPurchaseList}">
														<tr>
															<td>${item.fd_order_id}</td>
															<td>${item.fd_reg_date}</td>
															<td>${item.fd_product_name}</td>
															<td>${item.pt_fd_amount}</td>
															<td>${item.pt_fd_point}</td>
															<td>
																${item.fd_code_name}
																<c:if test="${item.fd_payment_proc_code == 'PP0006'}">
																	<p style="color: #273791;">${accountInfo.fd_bank_name} ${accountInfo.fd_account_number_format}<br>(예금주:메디밸류)</p>
																</c:if>
															</td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
										</table>

										<div class="pd_list_paging">
												${pageNavi.navi}
										</div>
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
