<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/slick.css"/>
		<link rel="stylesheet" href="/resources/css/main.css" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<link rel="stylesheet" href="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.standalone.min.css" type="text/css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/slick.min.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
		<script type="text/javascript" src="/resources/js/sub.js"></script>
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.min.js"></script>
		<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>
		
		<script type="text/javascript">
			window.onload = function(){
				var parm = document.location.href.split("?");
				var cate_number = parm[1];
				scrollAnchor(cate_number);
			}
			
			$(function(){
				$(".option_list .sub").click(function(){
					$(this).parents("li.option").children("a").attr("onclick","return false");
				});				
			});
			
			$(function(){
				// var $status = $('.pagingInfo');
				var $stat_current = $('.pagingInfo .current');
				var $stat_total = $('.pagingInfo .total');
				var $slickElement = $('.slick01');
				$slickElement.on('init reInit afterChange', function (event, slick, currentSlide, nextSlide) {
					var i = (currentSlide ? currentSlide : 0) + 1;
					// $status.text(i + '/' + slick.slideCount);
					$stat_current.text(i);
					$stat_total.text(slick.slideCount);
				});
				/* slick slider */
				$(".slick01").slick({
					slidesToShow: 1,
					slidesToScroll: 1,
					infinite: true,
					autoplay: false,
					autoplaySpeed: 4000,
					swipe: false
				});
			});
			
			<%-- 메뉴 폰트 컬러 적용 --%>
			$(function(){
				$("#header .btm .area .real_area #gnb ul li:nth-child(3)").addClass("color_blue");
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub7_1" class="sub">
			<article class="payback_visual">
				<div class="inner">
					<div class="visual_slide">
						<ul class="slick01">
							<li>
								<a href="javascript:;">
									<div class="img"><img src="/resources/images/sub/img_payback_slide01.jpg?v20211122" /></div>
								</a>
							</li>
							<li>
								<a href="javascript:;">
									<div class="img"><img src="/resources/images/sub/img_payback_slide02.jpg?v20211122" /></div>
								</a>
							</li>
							<li>
								<a href="javascript:;">
									<div class="img"><img src="/resources/images/sub/img_payback_slide03.jpg?v20211122" /></div>
								</a>
							</li>
							<li>
								<a href="javascript:;">
									<div class="img"><img src="/resources/images/sub/img_payback_slide04.jpg?v20211122" /></div>
								</a>
							</li>
						</ul>
						<p class="pagingInfo">
						    <span class="current"></span> / <span class="total"></span>
						</p>
					</div>
				</div>
			</article>
			<!-- <article class="banner_wrap">
				<div class="inner">
					<div class="img">
						<img src="/resources/images/sub/img_banner_package.jpg" />
						<a href="javascript:;" class="btn_01" onclick="scrollAnchor('cnt_anchor');"></a>
					</div>
				</div>
			</article> -->
			<article class="cnt_payback" id="cnt_anchor">
				<div class="hd_txt">
					<p class="tit">연말 소장비 패키지</p>
					<p class="desc">더 많은 제품들을 만나보세요.</p>
				</div>
				<!-- <div class="tab_cate col5">
					<ul>
						<li>
							<div>
								<a href="javascript:;" onclick="scrollAnchor('cnt_anchor01')">인상재</a>
							</div>
						</li>
						<li>
							<div>
								<a href="javascript:;" onclick="scrollAnchor('cnt_anchor02')">시멘트</a>
							</div>
						</li>
						<li>
							<div>
								<a href="javascript:;" onclick="scrollAnchor('cnt_anchor03')">근관재</a>
							</div>
						</li>
						<li>
							<div>
								<a href="javascript:;" onclick="scrollAnchor('cnt_anchor04')">레진/본딩/에칭</a>
							</div>
						</li>
						<li>
							<div>
								<a href="javascript:;" onclick="scrollAnchor('cnt_anchor05')">템포관련/덴쳐</a>
							</div>
						</li>
						<li>
							<div>
								<a href="javascript:;" onclick="scrollAnchor('cnt_anchor06')">수술재료/마취</a>
							</div>
						</li>
						<li>
							<div>
								<a href="javascript:;" onclick="scrollAnchor('cnt_anchor07')">방사선재/교합관련</a>
							</div>
						</li>
						<li>
							<div>
								<a href="javascript:;" onclick="scrollAnchor('cnt_anchor08')">마스크/글러브/석션</a>
							</div>
						</li>
						<li>
							<div>
								<a href="javascript:;" onclick="scrollAnchor('cnt_anchor09')">트레이/스케일러팁</a>
							</div>
						</li>
						<li>
							<div>
								<a href="javascript:;" onclick="scrollAnchor('cnt_anchor10')">기타 치과 재료</a>
							</div>
						</li>
					</ul>
				</div> -->
				<div class="cnt_cate_wrap">
					<div class="cnt_cate" id="cnt_anchor01">
						<!-- <p class="subtit">인상재</p> -->
						<div class="cnt_list col4">
							<ul>
								<li class="option">
									<a href="#">
										<div class="img mileage" data-text="20만 마일리지 사용가능">
											<div class="icon_list">
												<div class="li li_option">
													<div>
														<div class="tit"><strong>9</strong>개</div>
														<div class="desc">규격선택</div>
													</div>
												</div>
												<div class="li li_insure">
													<div>
														<div class="desc">보험<br>재료</div>
													</div>
												</div>
											</div>
											<img src="" onerror="this.src='/resources/images/dummy/340x339.png'" />
											<div class="wish_wrap">
												<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" /></button>
												<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" /></button>
											</div>
										</div>
										<div class="info">
											<h4 class="pd_tit">[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890</h4>
											<div class="price clear">
												<p id="product_amount">1,000,000원</p>
												<div class="option_list">
													<button class="btn_option">규격확인</button>
													<div class="sub">
														<div class="tit">규격정보</div>
														<ul>
															<li><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li class="sold"><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li class="sold"><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</a>
								</li>
								<li class="option insure">
									<a href="#">
										<div class="img payback soldout">
											<div class="icon_list">
												<div class="li li_option">
													<div>
														<div class="tit"><strong>0</strong>개</div>
														<div class="desc">규격선택</div>
													</div>
												</div>
												<div class="li li_insure">
													<div>
														<div class="desc">보험<br>재료</div>
													</div>
												</div>
											</div>
											<img src="" onerror="this.src='/resources/images/dummy/340x339.png'" />
											<div class="wish_wrap">
												<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" /></button>
												<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" /></button>
											</div>
										</div>
										<div class="info">
											<h4 class="pd_tit">[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890</h4>
											<div class="price clear">
												<p id="product_amount">1,000,000원</p>
												<div class="option_list">
													<button class="btn_option">규격확인</button>
													<div class="sub">
														<div class="tit">규격정보</div>
														<ul>
															<li><div><p>규격확인</p></div></li>
															<li class="sold"><div><p>규격정보</p></div></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="#">
										<div class="img payback">
											<img src="" onerror="this.src='/resources/images/dummy/340x339.png'" />
											<div class="wish_wrap">
												<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" /></button>
												<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" /></button>
											</div>
										</div>
										<div class="info">
											<h4 class="pd_tit">[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890</h4>
											<div class="price clear">
												<p id="product_amount">1,000,000원</p>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="#">
										<div class="img payback">
											<img src="" onerror="this.src='/resources/images/dummy/340x339.png'" />
											<div class="wish_wrap">
												<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" /></button>
												<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" /></button>
											</div>
										</div>
										<div class="info">
											<h4 class="pd_tit">[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890</h4>
											<div class="price clear">
												<p id="product_amount">1,000,000원</p>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="#">
										<div class="img payback">
											<img src="" onerror="this.src='/resources/images/dummy/340x339.png'" />
											<div class="wish_wrap">
												<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" /></button>
												<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" /></button>
											</div>
										</div>
										<div class="info">
											<h4 class="pd_tit">[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890</h4>
											<div class="price clear">
												<p id="product_amount">1,000,000원</p>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="#">
										<div class="img payback">
											<img src="" onerror="this.src='/resources/images/dummy/340x339.png'" />
											<div class="wish_wrap">
												<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" /></button>
												<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" /></button>
											</div>
										</div>
										<div class="info">
											<h4 class="pd_tit">[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890</h4>
											<div class="price clear">
												<p id="product_amount">1,000,000원</p>
											</div>
										</div>
									</a>
								</li>
								<li>
									<a href="#">
										<div class="img payback">
											<img src="" onerror="this.src='/resources/images/dummy/340x339.png'" />
											<div class="wish_wrap">
												<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" /></button>
												<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" /></button>
											</div>
										</div>
										<div class="info">
											<h4 class="pd_tit">[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890</h4>
											<div class="price clear">
												<p id="product_amount">1,000,000원</p>
											</div>
										</div>
									</a>
								</li>
								<li class="option">
									<a href="#">
										<div class="img payback">
											<div class="icon_list">
												<div class="li li_option">
													<div>
														<div class="tit"><strong>9</strong>개</div>
														<div class="desc">규격선택</div>
													</div>
												</div>
											</div>
											<img src="" onerror="this.src='/resources/images/dummy/340x339.png'" />
											<div class="wish_wrap">
												<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" /></button>
												<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" /></button>
											</div>
										</div>
										<div class="info">
											<h4 class="pd_tit">[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890[제조사]제품명1234567890</h4>
											<div class="price clear">
												<p id="product_amount">1,000,000원</p>
												<div class="option_list">
													<button class="btn_option">규격확인</button>
													<div class="sub">
														<div class="tit">규격정보</div>
														<ul>
															<li><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li class="sold"><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li class="sold"><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li class="sold"><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li class="sold"><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li class="sold"><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li class="sold"><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
															<li class="sold"><div><p>1ea/254cm acbdefghijklmnopqrstuvwxyz</p></div></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</article>
			<article class="cnt_notice">
				<div class="area">
					<div class="real_area">
						<div class="notice">
							<div class="tit">꼭 확인해주세요!</div>
							<div class="txt">
								<ul>
									<li>‘메디밸류 포인트’는 메디밸류 내 상품등의 구입, 이벤트 참여 등을 통하여 적립된 비현금성 포인트입니다. ‘쿠폰’은 메디밸류에서 발행하는 비현금성 쿠폰입니다.</li>
									<li>‘메디밸류 포인트’ 및 ‘쿠폰’은 회원탈퇴, 메디밸류의 폐업 등 포인트를 사용할 수 없는 사정이 발생한 경우 자동적으로 소멸되며, 소멸되는 포인트에 대해 보상이 되지 않습니다.</li>
									<li>회원 탈퇴 후 재가입으로 포인트 및 쿠폰은 복원되지 않습니다.</li>
									<li>단, 폐업의 경우에는 회원이 잔여 포인트 및 쿠폰을 사용할 수 있도록 회사가 폐업 전 2개월 이상의 기간전에 미리 고지합니다.</li>
									<li>‘메디밸류 포인트’의 사용은 구매 금액의 5% 이내에서 사용가능합니다.</li>
									<li>‘메디밸류 포인트’는 구매 시 구매 금액의 1%가 적립됩니다.</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>
