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
		<script type="text/javascript" src="/resources/js/sub.js"></script>
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				$(".subbxslider1").bxSlider({
					auto : true,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});

				$(".subbxslider2").bxSlider({
					auto : true,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});

				$(".subbxslider3").bxSlider({
					auto : true,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});

				$(".subbxslider4").bxSlider({
					auto : true,
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
		<section id="sub10" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="location">
							<ul class="clear">
								<li><a href="">홈</a></li>
								<li><a href="">임플란트</a></li>
								<li><a href="">뼈이식제</a></li>
								<li><a href="">이종골</a></li>
							</ul>
						</div>
	
						<div class="wrap clear">
							<div class="left">
								<div class="img"><img src="/resources/images/sub/sub_c1_img.png" width="483" height="621" border="0" alt="" /></div>
							</div>
							
							<div class="right">
								<div class="name">
									<h3>TITAN X (타이탄엑스) TITAN X (타이탄엑스) TITAN X (타이탄엑스) TITAN X (타이탄엑스) TITAN X (타이탄엑스) TITAN X (타이탄엑스) TITAN X (타이탄엑스) TITAN X (타이탄엑스) TITAN X (타이탄엑스) TITAN X (타이탄엑스) TITAN X (타이탄엑스)</h3>
								</div>
	
								<div class="price clear">
									<h4>222,022,000원</h4>
									<strong>43%</strong>
								</div>
	
								<div class="spec">
									<ul>
										<li class="spec1 clear">
											<h5>판매단위</h5>
											<p>1팩</p>
										</li>
	
										<li class="spec1 clear">
											<h5>제조사</h5>
											<p>치예원 • 닥터다니엘</p>
										</li>
	
										<li class="spec2 clear">
											<h5>배송구분</h5>
											<p>일반배송</p>
										</li>
	
										<li class="spec2 clear">
											<h5>제조사</h5>
											<p>치예원 • 닥터다니엘</p>
										</li>
	
										<li class="spec2 clear">
											<h5>배송구분</h5>
											<p>일반배송</p>
										</li>
									</ul>
								</div>
	
								<div class="option_wrap">
									<h4>옵션선택</h4>
	
									<select name="" id="" class="ow1">
										<option value="">[필수] 옵션을 선택해주세요-</option>
										<option value="">[필수] 1</option>
										<option value="">[필수] 2</option>
										<option value="">[필수] 3</option>
										<option value="">[필수] 4</option>
									</select>
	
									<select name="" id="" class="ow2">
										<option value="">제품명_용량_규격</option>
										<option value="">1</option>
										<option value="">2</option>
										<option value="">3</option>
										<option value="">4</option>
									</select>
								</div>
	
								<div class="option_result">
									<ul>
										<li>
											<button class="delete_btn"><img src="/resources/images/main/sub_bundle_option_delete.png" width="22" height="22" border="0" alt="" /></button>
											
											<div class="total_name clear">
												<p>[치예원] TITAN X (타이탄엑스) 0.1g  Bone substitute 1팩 일반배송 123456789 [치예원] TITAN X (타이탄엑스) 0.1g  Bone substitute 1팩 일반배송 123456789 [치예원] TITAN X (타이탄엑스) 0.1g  Bone substitute 1팩 일반배송 123456789</p>
											</div>
											
											<div class="or_wrap clear">
												<div class="quan_box clear">
													<button class="minus">-</button>
													<p>1</p>
													<button class="plus">+</button>
												</div>
												
												<div class="total">
													<p><strong>22,000</strong>원</p>
												</div>
											</div>
										</li>
	
										<li>
											<button class="delete_btn"><img src="/resources/images/main/sub_bundle_option_delete.png" width="22" height="22" border="0" alt="" /></button>
											
											<div class="total_name clear">
												<p>[치예원] TITAN X (타이탄엑스) 0.1g  Bone substitute 1팩 일반배송 123456789 [치예원] TITAN X (타이탄엑스) 0.1g  Bone substitute 1팩 일반배송 123456789 [치예원] TITAN X (타이탄엑스) 0.1g  Bone substitute 1팩 일반배송 123456789</p>
											</div>
											
											<div class="or_wrap clear">
												<div class="quan_box clear">
													<button class="minus">-</button>
													<p>1</p>
													<button class="plus">+</button>
												</div>
												
												<div class="total">
													<p><strong>22,000</strong>원</p>
												</div>
											</div>
										</li>
									</ul>
								</div>
	
								<div class="result clear">
									<div class="total clear">
										<h5>총 상품금액</h5>
										<p><strong>123,123,000</strong>원</p>
									</div>
								</div>
	
								<div class="btn_wrap clear">
									<button class="buy_btn">바로 구매하기</button>
									<button class="cart_btn">장바구니 담기</button>
									<button class="wish_btn"></button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
	
			<article class="cnt2 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>Related Item</h3>
							<p>이 제품과 연관된 제품이에요!</p>
						</div>
	
						<div class="txt">
							<ul class="depth1 subbxslider1">
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
													<h4 class="pd_tit">[제조사] 제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명</h4>
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
	
			<article class="cnt3">
				<div class="area">
					<div class="real_area clear">
						<div class="left">
							<div class="detail_info">
								<div class="info_split" id="tab1">
									<div class="info_btn_area">
										<ul class="info_btn clear">
											<li class="first info_btn1 on"><button href="#tg1">제품설명</button></li>
											<li class="info_btn2"><button href="#tg2">제품영상</button></li>
											<li class="info_btn3"><button href="#tg3">제품정보</button></li>
										</ul>
									</div>
									
									<div class="info_cnt info_cnt_normal">
										<div class="info_cnt_top">
											<ul>
												<li class="clear">
													<h4>제품명</h4>
													<p>일이삼사오육칠팔구십일이삼사일이삼사오육칠팔구십일이삼사오일이삼사일이삼사오육칠팔구십일이삼사일이삼사오육칠팔구십일이삼사오일이삼사</p>
												</li>
	
												<li class="clear">
													<h4>제조사</h4>
													<p>일이삼사오육칠팔구십일이삼사일이삼사오육칠팔구십일이삼사오일이삼사일이삼사오육칠팔구십일이삼사일이삼사오육칠팔구십일이삼사오일이삼사</p>
												</li>
	
												<li class="clear">
													<h4>규격</h4>
													<p>일이삼사오육칠팔구십일이삼사일이삼사오육칠팔구십일이삼사오일이삼사일이삼사오육칠팔구십일이삼사일이삼사오육칠팔구십일이삼사오일이삼사</p>
												</li>
	
												<li class="clear">
													<h4>포장단위</h4>
													<p>일이삼사오육칠팔구십일이삼사일이삼사오육칠팔구십일이삼사오일이삼사일이삼사오육칠팔구십일이삼사일이삼사오육칠팔구십일이삼사오일이삼사</p>
												</li>
											</ul>
										</div>
	
										<div class="info_cnt_btm">
											<h4>전자상거래 등에서의 상품정보제공고시</h4>
	
											<ul>
												<li class="clear">
													<h5>제조사/수입사</h5>
													<p>내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 입력하세요</p>
												</li>
	
												<li class="clear">
													<h5>원산지</h5>
													<p>내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 입력하세요</p>
												</li>
	
												<li class="clear">
													<h5>중량/용량</h5>
													<p>내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 입력하세요</p>
												</li>
	
												<li class="clear">
													<h5>취급주의사항</h5>
													<p>내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 입력하세요</p>
												</li>
	
												<li class="clear">
													<h5>제조연월</h5>
													<p>내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 입력하세요</p>
												</li>
	
												<li class="clear">
													<h5>사용기한</h5>
													<p>내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 입력하세요</p>
												</li>
	
												<li class="clear">
													<h5>상품코드</h5>
													<p>내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 입력하세요</p>
												</li>
											</ul>
											
											<p class="caution">*본 내용은 공정거래위원회 ‘상품정보제공고시’에 따라 판매자가 직접 등록한 것으로 해당 정보에 대한 책임은 판매자에게 있습니다.</p>
										</div>
									</div>
								</div>
							</div>
	
							<div class="recom1 noti2">
								<h3>함께 구매하면 좋은 제품이에요</h3>
	
								<ul class="depth1 subbxslider2">
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
										</ul>
									</li>
								</ul>
							</div>
	
							<div class="recom2 noti2">
								<h3>다른분들이 함께 본 제품이에요</h3>
	
								<ul class="depth1 subbxslider3">
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
														<h4 class="pd_tit">[제조사] 제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명</h4>
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
										</ul>
									</li>
								</ul>
							</div>
						</div>
	
						<div class="right">
							<div class="floating_box">
								<div class="auto_wrap">
									<div class="option_wrap">
										<select name="" id="" class="ow1">
											<option value="">[필수] 옵션을 선택해주세요-</option>
											<option value="">[필수] 1</option>
											<option value="">[필수] 2</option>
											<option value="">[필수] 3</option>
											<option value="">[필수] 4</option>
										</select>
															
										<select name="" id="" class="ow2">
											<option value="">제품명_용량_규격</option>
											<option value="">1</option>
											<option value="">2</option>
											<option value="">3</option>
											<option value="">4</option>
										</select>
									</div>
															
									<div class="slt_box">
										<button class="delete_btn"><img src="/resources/images/main/sub_bundle_option_delete.png" width="22" height="22" border="0" alt="" /></button>
															
										<div class="total_name clear">
											<p>[치예원] TITAN X (타이탄엑스) 0.1g  Bone substitute 1팩 일반배송 123456789 [치예원] TITAN X (타이탄엑스) 0.1g  Bone substitute 1팩 일반배송 123456789 [치예원] TITAN X (타이탄엑스) 0.1g  Bone substitute 1팩 일반배송 123456789</p>
										</div>
															
										<div class="quan_box clear">
											<button class="minus">-</button>
											<p>1</p>
											<button class="plus">+</button>
										</div>
															
										<div class="total">
											<p><strong>22,000</strong>원</p>
										</div>
									</div>
									
									<div class="slt_box">
										<button class="delete_btn"><img src="/resources/images/main/sub_bundle_option_delete.png" width="22" height="22" border="0" alt="" /></button>
															
										<div class="total_name clear">
											<p>[치예원] TITAN X (타이탄엑스) 0.1g  Bone substitute 1팩 일반배송 123456789 [치예원] TITAN X (타이탄엑스) 0.1g  Bone substitute 1팩 일반배송 123456789 [치예원] TITAN X (타이탄엑스) 0.1g  Bone substitute 1팩 일반배송 123456789</p>
										</div>
															
										<div class="quan_box clear">
											<button class="minus">-</button>
											<p>1</p>
											<button class="plus">+</button>
										</div>
															
										<div class="total">
											<p><strong>22,000</strong>원</p>
										</div>
									</div>
	
									<div class="slt_box">
										<button class="delete_btn"><img src="/resources/images/main/sub_bundle_option_delete.png" width="22" height="22" border="0" alt="" /></button>
															
										<div class="total_name clear">
											<p>[치예원] TITAN X (타이탄엑스) 0.1g  Bone substitute 1팩 일반배송 123456789 [치예원] TITAN X (타이탄엑스) 0.1g  Bone substitute 1팩 일반배송 123456789 [치예원] TITAN X (타이탄엑스) 0.1g  Bone substitute 1팩 일반배송 123456789</p>
										</div>
															
										<div class="quan_box clear">
											<button class="minus">-</button>
											<p>1</p>
											<button class="plus">+</button>
										</div>
															
										<div class="total">
											<p><strong>22,000</strong>원</p>
										</div>
									</div>
								</div>
							
								<div class="fix_wrap">
									<div class="result_box">
										<ul>
											<li class="rb_price clear">
												<p>총 1개</p>
												<strong>22,000<span>원</span></strong>
											</li>
															
											<li class="rb_opap">
												<p><span>ㄴ</span> 17,000원 할인 적용</p>
											</li>
															
											<li class="rb_opap">
												<p><span>ㄴ</span> 10만원이상 무료배송</p>
											</li>
										</ul>
									</div>
															
									<div class="btn_wrap">
										<div class="btn_wrap_top clear">
											<button class="cart_btn">장바구니 담기</button>
											<button class="wish_btn"></button>
										</div>
										
										<button class="buy_btn">바로 구매하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
	
			<article class="cnt4 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>Recommended Item</h3>
							<p>이런 제품은 어떠세요?</p>
						</div>
	
						<div class="txt">
							<ul class="depth1 subbxslider4">
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
													<h4 class="pd_tit">[제조사] 제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명</h4>
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
	
						<div class="banner"><a href=""><img src="/resources/images/main/mn_c12_banner.jpg" width="1052" height="141" border="0" alt="" /></a></div>
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