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
			$(document).ready(function (){
				var $rtBtn=$("#sub3_1 .cnt1 .area .real_area .wrap .right .right_tit .rt_tit button");
	
				$rtBtn.on("click", function  () {
					if ($(this).hasClass("on")) {
						$(this).removeClass("on").parent().next(".rt_filter").stop().slideUp()
					}else {
						$(this).addClass("on").parent().next(".rt_filter").stop().slideDown()
					}
					
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub3_1" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<h3>내 계정</h3>
							
								<ul>
									<li class="on"><button>주문배송 조회</button></li>
									<li><button>배송지관리</button></li>
									<li><button>포인트 쿠폰</button></li>
									<li><button>회원정보 수정</button></li>
								</ul>
							
								<div class="banner">
									<h4>주문/배송에<br>도움이 필요하신가요?</h4>
									<button>1:1 문의하기</button>
								</div>
							</div>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>주문배송 조회</h4>
										<button class="detail_sch_btn">상세검색</button>
									</div>
	
									<div class="rt_filter">
										<div class="inq_period clear">
											<h5>조회기간</h5>
											<div class="form_cont">
												<label for="inq_p1">2021.08.07</label>
												<input type="text" id="inq_p1">
												<button class="cal_icon"><img src="/resources/images/main/order_calen.jpg" width="11" height="11" border="0" alt="" /></button>
											</div>
											<p>~</p>
											<div class="form_cont">
												<label for="inq_p2">2021.08.07</label>
												<input type="text" id="inq_p2">
												<button class="cal_icon"><img src="/resources/images/main/order_calen.jpg" width="11" height="11" border="0" alt="" /></button>
											</div>
										</div>
	
										<div class="pd_sch clear">
											<h5>제품검색</h5>
		
											<div class="form_cont">
												<label for="pd_sch_ip">주문 상품명을 입력하세요</label>
												<input type="text" id="pd_sch_ip">
												<button class="sch_icon"><img src="/resources/images/main/order_sch.jpg" width="13" height="13" border="0" alt="" /></button>
											</div>
										</div>
									</div>
								</div>
							
								<div class="right_txt">
									<ul class="rt_depth1">
										<li>
											<h5>2021.09.30 (11시 15분)</h5>
							
											<div class="box">
												<div class="box_pd_tit clear">
													<h5>[굿덴트] 덴탈 니들 외 2건</h5>
													<button class="detail_view">상세보기</button>
												</div>
							
												<div class="box_pd_info clear">
													<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
													<div class="order_info">
														<ul class="rt_depth2">
															<li class="clear">
																<h6>주문번호</h6>
																<p>1610504112596</p>
															</li>
							
															<li class="clear">
																<h6>결제금액</h6>
																<p>128,470원</p>
															</li>
							
															<li class="clear">
																<h6>주문상태</h6>
																<p>배송완료</p>
															</li>
														</ul>
													</div>
													<div class="btn_wrap">
														<button class="ship_check">배송조회</button>
														<button class="one_inq">1:1 문의</button>
													</div>
												</div>
											</div>
										</li>
							
										<li>
											<h5>2021.09.30 (11시 15분)</h5>
							
											<div class="box">
												<div class="box_pd_tit clear">
													<h5>[굿덴트] 덴탈 니들 외 2건</h5>
													<button class="detail_view">상세보기</button>
												</div>
							
												<div class="box_pd_info clear">
													<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
													<div class="order_info">
														<ul class="rt_depth2">
															<li class="clear">
																<h6>주문번호</h6>
																<p>1610504112596</p>
															</li>
							
															<li class="clear">
																<h6>결제금액</h6>
																<p>128,470원</p>
															</li>
							
															<li class="clear">
																<h6>주문상태</h6>
																<p>배송완료</p>
															</li>
														</ul>
													</div>
													<div class="btn_wrap">
														<button class="ship_check">배송조회</button>
														<button class="one_inq">1:1 문의</button>
													</div>
												</div>
											</div>
										</li>
							
										<li>
											<h5>2021.09.30 (11시 15분)</h5>
							
											<div class="box">
												<div class="box_pd_tit clear">
													<h5>[굿덴트] 덴탈 니들 외 2건</h5>
													<button class="detail_view">상세보기</button>
												</div>
							
												<div class="box_pd_info clear">
													<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
													<div class="order_info">
														<ul class="rt_depth2">
															<li class="clear">
																<h6>주문번호</h6>
																<p>1610504112596</p>
															</li>
							
															<li class="clear">
																<h6>결제금액</h6>
																<p>128,470원</p>
															</li>
							
															<li class="clear">
																<h6>주문상태</h6>
																<p>배송완료</p>
															</li>
														</ul>
													</div>
													<div class="btn_wrap">
														<button class="ship_check">배송조회</button>
														<button class="one_inq">1:1 문의</button>
													</div>
												</div>
											</div>
										</li>
							
										<li>
											<h5>2021.09.30 (11시 15분)</h5>
							
											<div class="box">
												<div class="box_pd_tit clear">
													<h5>[굿덴트] 덴탈 니들 외 2건</h5>
													<button class="detail_view">상세보기</button>
												</div>
							
												<div class="box_pd_info clear">
													<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
													<div class="order_info">
														<ul class="rt_depth2">
															<li class="clear">
																<h6>주문번호</h6>
																<p>1610504112596</p>
															</li>
							
															<li class="clear">
																<h6>결제금액</h6>
																<p>128,470원</p>
															</li>
							
															<li class="clear">
																<h6>주문상태</h6>
																<p>배송완료</p>
															</li>
														</ul>
													</div>
													<div class="btn_wrap">
														<button class="ship_check">배송조회</button>
														<button class="one_inq">1:1 문의</button>
													</div>
												</div>
											</div>
										</li>
							
										<li>
											<h5>2021.09.30 (11시 15분)</h5>
							
											<div class="box">
												<div class="box_pd_tit clear">
													<h5>[굿덴트] 덴탈 니들 외 2건</h5>
													<button class="detail_view">상세보기</button>
												</div>
							
												<div class="box_pd_info clear">
													<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
													<div class="order_info">
														<ul class="rt_depth2">
															<li class="clear">
																<h6>주문번호</h6>
																<p>1610504112596</p>
															</li>
							
															<li class="clear">
																<h6>결제금액</h6>
																<p>128,470원</p>
															</li>
							
															<li class="clear">
																<h6>주문상태</h6>
																<p>배송완료</p>
															</li>
														</ul>
													</div>
													<div class="btn_wrap">
														<button class="ship_check">배송조회</button>
														<button class="one_inq">1:1 문의</button>
													</div>
												</div>
											</div>
										</li>
									</ul>
							
									<div class="pd_list_paging">
										<ul class="clear">
											<li class="prev2"><button><img src="/resources/images/main/prev_icon2.png" width="10" height="9" border="0" alt="" /></button></li>
											<li class="prev1"><button><img src="/resources/images/main/prev_icon1.png" width="10" height="9" border="0" alt="" /></button></li>
											<li class="on"><button>1</button></li>
											<li><button>2</button></li>
											<li><button>3</button></li>
											<li><button>4</button></li>
											<li><button>5</button></li>
											<li><button>6</button></li>
											<li><button>7</button></li>
											<li><button>8</button></li>
											<li><button>9</button></li>
											<li class="next1"><button><img src="/resources/images/main/next_icon1.png" width="10" height="9" border="0" alt="" /></button></li>
											<li class="next2"><button><img src="/resources/images/main/next_icon2.png" width="10" height="9" border="0" alt="" /></button></li>
										</ul>
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