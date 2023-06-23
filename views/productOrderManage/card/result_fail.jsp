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
		<script type="text/javascript" src="/resources/js/sub2.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){

			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub2_3" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<h3>주문실패</h3>
	
						<div class="order_pd">
							<div class="order_pd_txt">
								<h5>주문실패</h5>
								<p>주문을 완료하지 못했습니다.</p>
							</div>
						</div>
					</div>
				</div>
			</article>
	
<%--			<article class="cnt2">
				<div class="area">
					<div class="real_area">
						<div class="order_info_tit clear">
							<h4>상품배송 정보</h4>
							<p>상품배송 정보입니다.</p>
						</div>

						<div class="order_info_txt">
							<ul class="depth1">
								<li class="spe_offer">
									<h5>배송 2건 중 1</h5>
									<div class="box clear">
										<h6><img src="/resources/images/main/sale_per.jpg" width="140" height="140" border="0" alt="" />특가제품</h6>
										<strong>9월 28일(화) 도착예정입니다.</strong>
										<p>판매자 : <span>오라피트</span></p>
										<button><img src="/resources/images/main/sale_down.jpg" width="57" height="32" border="0" alt="" /></button>
									</div>

									<div class="box_detail">
										<ul>
											<li class="clear">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
												</div>

												<div class="info">
													<div class="info_box">
														<h4 class="pd_tit">TITAN X (타이탄엑스) 0.1g Bone substitu Regenerating bone Ren Regenerating bone, Renewing lives Regenerating bone, Renewing lives</h4>
														<p class="standard">[규격] 0.5g  /  0.8cc (05-0210)</p>
														<div class="mp_wrap clear">
															<p class="manu">제조사ㅣ리뉴메디칼</p>
															<p class="pack">포장단위ㅣea</p>
														</div>
													</div>
												</div>

												<div class="pack_p">
													<p>1개</p>
												</div>

												<div class="price_p">
													<p>0,000,000원</p>
												</div>
											</li>

											<li class="clear">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
												</div>

												<div class="info">
													<div class="info_box">
														<h4 class="pd_tit">TITAN X (타이탄엑스) 0.1g Bone substitu Regenerating bone Ren Regenerating bone, Renewing lives Regenerating bone, Renewing lives</h4>
														<p class="standard">[규격] 0.5g  /  0.8cc (05-0210)</p>
														<div class="mp_wrap clear">
															<p class="manu">제조사ㅣ리뉴메디칼</p>
															<p class="pack">포장단위ㅣea</p>
														</div>
													</div>
												</div>

												<div class="pack_p">
													<p>1개</p>
												</div>

												<div class="price_p">
													<p>0,000,000원</p>
												</div>
											</li>
										</ul>
									</div>
								</li>

								<li class="norm_offer">
									<h5>배송 2건 중 2</h5>
									<div class="box clear">
										<h6><img src="/resources/images/main/normal_per.jpg" width="140" height="140" border="0" alt="" />일반제품</h6>
										<strong>9월 29일(수) 도착예정입니다.</strong>
										<p>판매자 : <span>메디밸류</span></p>
										<button><img src="/resources/images/main/sale_down.jpg" width="57" height="32" border="0" alt="" /></button>
									</div>

									<div class="box_detail">
										<ul>
											<li class="clear">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
												</div>

												<div class="info">
													<div class="info_box">
														<h4 class="pd_tit">TITAN X (타이탄엑스) 0.1g Bone substitu Regenerating bone Ren Regenerating bone, Renewing lives Regenerating bone, Renewing lives</h4>
														<p class="standard">[규격] 0.5g  /  0.8cc (05-0210)</p>
														<div class="mp_wrap clear">
															<p class="manu">제조사ㅣ리뉴메디칼</p>
															<p class="pack">포장단위ㅣea</p>
														</div>
													</div>
												</div>

												<div class="pack_p">
													<p>1개</p>
												</div>

												<div class="price_p">
													<p>0,000,000원</p>
												</div>
											</li>

											<li class="clear">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
												</div>

												<div class="info">
													<div class="info_box">
														<h4 class="pd_tit">TITAN X (타이탄엑스) 0.1g Bone substitu Regenerating bone Ren Regenerating bone, Renewing lives Regenerating bone, Renewing lives</h4>
														<p class="standard">[규격] 0.5g  /  0.8cc (05-0210)</p>
														<div class="mp_wrap clear">
															<p class="manu">제조사ㅣ리뉴메디칼</p>
															<p class="pack">포장단위ㅣea</p>
														</div>
													</div>
												</div>

												<div class="pack_p">
													<p>1개</p>
												</div>

												<div class="price_p">
													<p>0,000,000원</p>
												</div>
											</li>
										</ul>
									</div>
								</li>
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
									<p>입금일은 주문일로 부터 3일</p>
								</div>

								<div class="order_info_txt">
									<ul class="depth1">
										<li class="oit_1 clear">
											<h5>입금기한</h5>
											<p>2021년 2월 5일 00:12분 까지 미입금시 취소</p>
										</li>

										<li class="oit_2 clear">
											<h5>입금금액</h5>
											<p>21,800원</p>
										</li>

										<li class="oit_3 clear">
											<h5>입금계좌</h5>
											<p>국민은행 1234567891012345</p>
										</li>

										<li class="oit_4 clear">
											<h5>입금주</h5>
											<p>메디밸류</p>
										</li>
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
											<p>오라피트  /  메디밸류</p>
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
											<p>이엘치과</p>
										</li>

										<li class="oit_2 clear">
											<h5>받은주소</h5>
											<p>서울 영등포구 당산동 5가 16-31 명화빌딩 3층</p>
										</li>

										<li class="oit_3 clear">
											<h5>배송요청사항</h5>
											<p>직접 받고 부재 시 문 앞</p>
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
											<p>무통장입금</p>
										</li>

										<li class="oit_2 clear">
											<h5>결제금액</h5>
											<p>0원</p>
										</li>

										<li class="oit_3 clear">
											<h5>배송비</h5>
											<p>0원</p>
										</li>

										<li class="oit_4 clear">
											<h5>총 금액</h5>
											<p>21,800원</p>
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
		</article>--%>
	</section>
	</jsp:body>
</layout:basicFrame>