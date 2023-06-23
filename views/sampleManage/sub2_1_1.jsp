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
		<script type="text/javascript" src="/resources/js/sub2.js"></script>
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				$(".bxslider2_1_1").bxSlider({
					auto : false,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});
	
				$(".bxslider2_1_2").bxSlider({
					auto : false,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub2_1" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area clear">
						<h3>장바구니</h3>
	
						<div class="left_cart_list">
							<div class="all_chk_wrap clear">
								<div class="all_chk">
									<input id="chk1" type="checkbox" name="acc" class="all_chk_cb" disabled>
									<label for="chk1">전체선택<span></span></label>
								</div>
	
								<div class="chc_delete">
									<button>선택삭제</button>
								</div>
							</div>
	
							<div class="cart_zero">
								<h4>장바구니에 담긴 상품이 없습니다</h4>
							</div>
	
							<div class="all_chk_wrap clear">
								<div class="all_chk">
									<input id="chk1" type="checkbox" name="acc" class="all_chk_cb" disabled>
									<label for="chk1">전체선택<span></span></label>
								</div>
	
								<div class="chc_delete">
									<button>선택삭제</button>
								</div>
							</div>
						</div>
	
						<div class="right_summ">
							<div class="ship_info">
								<h4><img src="/resources/images/main/loc_icon.jpg" width="14" height="20" border="0" alt="" />배송지</h4>
								<p>서울 영등포구 여의도동 여의대로 108 파크원타워1 2층 파크원현대치과의원 1012동 3012호 서울 영등포구 여의도동 여의대로 108 파크원타워1 2층 파크원현대치과의원 1012동 3012호</p>
								<button class="ship_change">배송지 변경</button>
	
								<div class="ship_change_popup">
									<div class="sc_tit">
										<h4>배송지</h4>
										<button class="sc_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
									</div>
	
									<div class="sc_txt">
										<ul>
											<li class="sc_txt1 clear">
												<h5 class="sc_h5_1">선택</h5>
												<h5 class="sc_h5_2">배송정보</h5>
												<h5 class="sc_h5_3">수정</h5>
											</li>
	
											<li class="sc_txt2 clear">
												<div class="sc_rdo">
													<input id="scRdo1" type="radio" name="scRdo">
													<label for="scRdo1"></label>
												</div>
	
												<div class="sc_info">
													<div class="sc_info_wrap">
														<span class="sc_sp">기본배송지</span>
														<p class="sc_addr">서울 영등포구 당산동 5가 16-3</p>
														<p class="sc_tel"><span>이엘치과</span> 02-2671-2755</p>
													</div>
												</div>
	
												<div class="sc_modi">
													<button><img src="/resources/images/main/sc_modi.jpg" width="22" height="22" border="0" alt="" /></button>
												</div>
											</li>
	
											<li class="sc_txt2 clear">
												<div class="sc_rdo">
													<input id="scRdo2" type="radio" name="scRdo">
													<label for="scRdo2"></label>
												</div>
	
												<div class="sc_info">
													<div class="sc_info_wrap">
														<p class="sc_addr">대구 중구 공평로 12</p>
														<p class="sc_tel"><span>미르치과병원</span> 053-212-1000</p>
													</div>
												</div>
	
												<div class="sc_modi"><button><img src="/resources/images/main/sc_modi.jpg" width="22" height="22" border="0" alt="" /></button></div>
											</li>
										</ul>
									</div>
	
									<div class="sc_btn">
										<button>+ 새 배송지 추가</button>
									</div>
								</div>
	
								<div class="sc_modi_popup">
									<div class="sm_tit">
										<h4>배송지 수정</h4>
										<button class="sm_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
									</div>
	
									<div class="sm_txt">
										<div class="sm_txt_wrap">
											<span class="sc_sp">기본배송지</span>
											
											<ul>
												<li>
													<p>서울 영등포구 당산동 5가 16-3</p>
													<div class="form_cont">
														<label for="placeholder_sm1">상세주소를 입력해주세요</label>
														<input type="text" id="placeholder_sm1">
													</div>
												</li>
											
												<li>
													<p>받으실 분</p>
													<div class="form_cont">
														<label for="placeholder_sm2">이엘치과</label>
														<input type="text" id="placeholder_sm2">
													</div>
												</li>
											
												<li>
													<p>연락처</p>
													<div class="form_cont">
														<label for="placeholder_sm3">02-2671-2755</label>
														<input type="text" id="placeholder_sm3">
													</div>
												</li>
											</ul>
										</div>
									</div>
	
									<div class="sm_btn"><button>저장</button></div>
								</div>
							</div>
	
							<div class="pd_cost_result">
								<ul>
									<li class="pd_cost_1 clear">
										<h5>제품금액</h5>
										<p><strong>32,100</strong>원</p>
									</li>
	
									<li class="pd_cost_2 clear">
										<h5>배송비</h5>
										<p><strong>3,000</strong>원</p>
									</li>
	
									<li class="pd_cost_3 clear">
										<h5>할인금액</h5>
										<p><strong>-3,000</strong>원</p>
									</li>
	
									<li class="pd_cost_4 clear">
										<h5>결제예정금액</h5>
										<p>원</p>
										<strong>0,032,100</strong>
									</li>
								</ul>
							</div>
	
							<div class="order_btn order_zero">
								<button>제품을 담아주세요</button>
							</div>
	
							<div class="order_caution">
								<p>- 포인트는 주문결제에서 사용 가능합니다.</p>
								<p>- ‘입금확인’상태일 때는 주문 내역 상세내역에서 직접 주문<br><span>취소가 가능합니다.</span></p>
								<p>- ‘입금확인’이후 상태에는 고객센터로 문의해주세요.</p>
							</div>
						</div>
					</div>
				</div>
			</article>
	
			<article class="cnt2 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit clear">
							<h3>이런 제품들은 어떠세요?</h3>
							<p>MD PICK</p>
						</div>
						
						<div class="txt">
							<ul class="depth1 bxslider2_1_1">
								<li>
									<ul class="depth2 clear">
										<li>
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명</h4>
													<div class="price clear">
														<strong class="percent">10%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
						
										<li>
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">43%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
						
										<li>
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">60%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
						
										<li> 
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img4.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">81%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
									</ul>
								</li>
						
								<li>
									<ul class="depth2 clear">
										<li>
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">10%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
						
										<li>
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">43%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
						
										<li>
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">60%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
						
										<li> 
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img4.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">81%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</article>
	
			<article class="cnt3 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit clear">
							<h3>지금 많은 분들이 찾으시는 제품이에요.</h3>
						</div>
						
						<div class="txt">
							<ul class="depth1 bxslider2_1_2">
								<li>
									<ul class="depth2 clear">
										<li>
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명</h4>
													<div class="price clear">
														<strong class="percent">10%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
						
										<li>
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">43%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
						
										<li>
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">60%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
						
										<li> 
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img4.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">81%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
									</ul>
								</li>
						
								<li>
									<ul class="depth2 clear">
										<li>
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">10%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
						
										<li>
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">43%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
						
										<li>
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">60%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
						
										<li> 
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img4.jpg" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">81%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</article>
	
			<article class="my_history">
				<div class="area">
					<div class="real_area">
						<div class="tit clear">
							<h3>MY HISTORY</h3>
							<p>내가 본 제품과 다른 고객이 함께 본 제품을 확인해보세요!</p>
						</div>
	
						<div class="txt">
							<div class="tab_split">
								<ul class="tab_btn clear">
									<li class="tab_btn1 on"><button>최근 본 제품 (13)</button></li>
									<li class="tab_btn2"><button>장바구니 (0)</button></li>
									<li class="tab_btn3"><button>위시리스트 (0)</button></li>
								</ul>
	
								<div class="tab_cnt">
									<div class="tab_cnt1 clear">
										<div class="left">
											<div class="wrap">
												<div class="paging_wrap">
													<p><strong>1</strong> / 13</p>
												</div>
	
												<ul class="bxslider_his1">
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
																			
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
															
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
															
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												</ul>
											</div>
											<span class="line"></span>
										</div>
	
										<div class="right">
											<div class="right_tit clear">
												<h4>최근 본 제품의 추천제품</h4>
												<p><strong>1</strong> / 2</p>
											</div>
	
											<ul class="depth1 bxslider_his2">
												<li>
													<ul class="depth2 clear">
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명</h4>
																	<div class="price clear">
																		<strong class="percent">10%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">43%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">60%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
													</ul>
												</li>
										
												<li>
													<ul class="depth2 clear">
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">10%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">43%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">60%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
													</ul>
												</li>
											</ul>
										</div>
									</div>
	
									<div class="tab_cnt2 clear">
										<div class="left">
											<div class="wrap">
												<div class="paging_wrap">
													<p><strong>1</strong> / 13</p>
												</div>
	
												<ul class="bxslider_his3">
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
																			
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
															
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
															
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												</ul>
											</div>
											<span class="line"></span>
										</div>
	
										<div class="right">
											<div class="right_tit clear">
												<h4>장바구니 제품의 추천제품</h4>
												<p><strong>1</strong> / 2</p>
											</div>
	
											<ul class="depth1 bxslider_his4">
												<li>
													<ul class="depth2 clear">
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">10%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">43%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">60%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
													</ul>
												</li>
										
												<li>
													<ul class="depth2 clear">
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">10%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">43%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">60%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
													</ul>
												</li>
											</ul>
										</div>
									</div>
	
									<div class="tab_cnt3 clear">
										<div class="left">
											<div class="wrap">
												<div class="paging_wrap">
													<p><strong>1</strong> / 13</p>
												</div>
	
												<ul class="bxslider_his5">
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
																			
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
															
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
															
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												</ul>
											</div>
											<span class="line"></span>
										</div>
	
										<div class="right">
											<div class="right_tit clear">
												<h4>위시리스트</h4>
												<p><strong>1</strong> / 2</p>
											</div>
	
											<ul class="depth1 bxslider_his6">
												<li>
													<ul class="depth2 clear">
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">10%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">43%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">60%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
													</ul>
												</li>
										
												<li>
													<ul class="depth2 clear">
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">10%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">43%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">60%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
													</ul>
												</li>
											</ul>
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