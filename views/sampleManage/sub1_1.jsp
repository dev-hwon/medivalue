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
		<script type="text/javascript" src="/resources/js/sub1.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				$(".bxslider1_1_1").bxSlider({
					auto : false,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});
	
				$(".bxslider1_1_2").bxSlider({
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
		<section id="sub1_1" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<h3><span>타탄</span>에 대한 검색결과가 없습니다.</h3>
	
						<div class="result_sch">
							<ul>
								<li class="clear">
									<h4>결과 내 검색</h4>
									
									<div class="form_cont">
										<label for="placeholder2">검색어를 입력하세요</label>
										<input type="text" id="placeholder2">
										<button class="sch_btn"><img src="/resources/images/main/search_btn4.png" width="13" height="13" border="0" alt="" /></button>
									</div>
	
									<div class="checks">
										<input type="radio" id="ex_rd" name="ex_rds" checked>
										<label for="ex_rd">포함</label>
									</div>
							
									<div class="checks">
										<input type="radio" id="ex_rd2" name="ex_rds">
										<label for="ex_rd2">제외</label>
									</div>
								</li>
	
								<li class="clear">
									<h4>결과 내 카테고리</h4>
									
									<select name="" id="" class="nis">
										<option value="">전체목록보기</option>
										<option value="">전체목록보기</option>
										<option value="">전체목록보기</option>
										<option value="">전체목록보기</option>
									</select>
								</li>
							</ul>
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
							<button class="comments"><img src="/resources/images/main/comment_icon.png" width="13" height="13" border="0" alt="" />검색결과에 의견 남기기</button>
							<div class="comm_popup">
								<div class="cp_tit">
									<h4>검색결과 설문조사</h4>
									<button class="cp_close"><img src="/resources/images/main/cp_close.png" width="32" height="32" border="0" alt="" /></button>
								</div>
	
								<div class="cp_txt">
									<ul>
										<li class="cp_txt1">
											<h5>메디밸류 스토어 고객의 여러분의 소중한 의견을 듣습니다.</h5>
											<p>더 좋은 검색서비스를 위해, 고객님의 소중한 의견을 듣고 반영하고자 합니다.<br>불편사항이나 바라시는 요청 사항이 있으시면 남겨주세요.</p>
										</li>
	
										<li class="cp_txt2">
											<h5>검색 서비스 및 검색어</h5>
											<div class="clear">
												<div class="cp_sch_1">
													<select name="" id="">
														<option value="">가격비교</option>
														<option value="">가격비교</option>
														<option value="">가격비교</option>
														<option value="">가격비교</option>
													</select>
												</div>
												
												<div class="cp_sch_2">
													<select name="" id="">
														<option value="">타이탄엑스</option>
														<option value="">타이탄엑스</option>
														<option value="">타이탄엑스</option>
														<option value="">타이탄엑스</option>
													</select>
												</div>
											</div>
										</li>
	
										<li class="cp_txt3">
											<h5>불편사항 및 요청사항</h5>
											<textarea name="" id="" cols="30" rows="10"></textarea>
										</li>
									</ul>
								</div>
	
								<div class="cp_btn">
									<button>제출하기</button>
								</div>
							</div>
						</div>
						
						<div class="txt">
							<ul class="depth1 bxslider1_1_1">
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
													<h4 class="pd_tit">[제조사] 1</h4>
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
													<h4 class="pd_tit">[제조사] 2</h4>
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
													<h4 class="pd_tit">[제조사] 3</h4>
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
													<h4 class="pd_tit">[제조사] 4</h4>
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
							<ul class="depth1 bxslider1_1_2">
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