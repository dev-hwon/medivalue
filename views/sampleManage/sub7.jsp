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
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				var limit = 15;
				var per_page = 15;
				jQuery('#listUp > li:gt('+(limit-1)+')').hide();
				if (jQuery('#listUp > li').length <= limit) {
					jQuery('#sub7 .cnt1 .area .real_area .txt .more_view').hide();
				};
				jQuery('#sub7 .cnt1 .area .real_area .txt .more_view').bind('click', function(event){
					event.preventDefault();
					limit += per_page;
					jQuery('#listUp > li:lt('+(limit)+')').show();
					if (jQuery('#listUp > li').length <= limit) {
						jQuery(this).hide();
					}
				});
	
				var $s7imgA=$("#sub7 .cnt1 .area .real_area .txt .depth1 li a");
				var $s7subWish=$("#sub7 .cnt1 .area .real_area .txt .depth1 li a .img .wish_wrap .wish_btn");
				$s7imgA.attr("onclick","return false");
				
	
				$s7imgA.on({
					"mouseenter":function  () {
						$(this).find(".wish_wrap").stop().animate({"bottom":"0"}, function  () {
							$(this).parents("a").removeAttr("onclick")
						});
					},
					"mouseleave":function  () {
						$(this).find(".wish_wrap").stop().animate({"bottom":"-75px"});
					}
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub7" class="sub">
			<article class="cnt1 noti2">
				<div class="area">
					<div class="real_area">
						<div class="txt">
							<h3>특가</h3>
							<ul id="listUp" class="depth1 clear">
								<li>
									<a href="">
										<div class="img">
											<img src="/resources/images/main/mn_c4_img1.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img2.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img3.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img1.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img2.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img3.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img1.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img2.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img3.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img1.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img2.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img3.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img1.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img2.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img3.png" width="340" height="339" border="0" alt="" />
				
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
	
								<!--  -->
	
								<li>
									<a href="">
										<div class="img">
											<img src="/resources/images/main/mn_c4_img1.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img2.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img3.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img1.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img2.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img3.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img1.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img2.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img2.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img1.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img2.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img3.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img1.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img2.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img3.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img1.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img2.png" width="340" height="339" border="0" alt="" />
				
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
											<img src="/resources/images/main/mn_c4_img2.png" width="340" height="339" border="0" alt="" />
				
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
							</ul>
							<button class="more_view">제품리스트 더보기<img src="/resources/images/main/more_view.jpg" width="15" height="9" border="0" alt="" /></button>
						</div>
					</div>
				</div>
			</article>
	
			<article class="cnt2">
				<div class="area">
					<div class="real_area">
						<div class="txt">
							<div class="banner">
								<a href=""><img src="/resources/images/main/mn_c12_banner.jpg" width="1051" height="139" border="0" alt="" /></a>
							</div>
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