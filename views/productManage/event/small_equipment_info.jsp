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
		<style type="text/css">
			.d-none {
				display: none;
			}
		</style>
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/slick.min.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript" src="/resources/js/sub.js"></script>
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>		
		<script type="text/javascript">
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

			$(document).ready(function (){
				/* 장바구니 버튼 */
				$(".wish_wrap .cart_btn").on("click", function(){
					$(this).parent().parent().parent().parent().children("a").attr("onclick","return false");
					let login_check = checkLogin();
					if (login_check) {
						const pk_idx = $(this).closest(".item_info").find(".pd_idx").text();
						let product_name = $(this).closest(".item_info").find(".pd_tit").text();
						const product_price = $(this).closest(".item_info").find(".pd_price").text();
						
						if ($(this).parents("li").hasClass("option")) {
							product_name = $(this).closest(".item_info").find(".pd_tit_hidden").val();
							$("#cartPopup3").find(".pop_tot_price").text(0);
							$("#cartPopup3 > .depth1").empty();
							$("#cartPopup3").find("h2").text(product_name);

							$.ajax({
								url: "/product/rest/group/info/" + pk_idx,
								method: "POST",
								content: "application/json",
								accept: "*/*",
								success: function (data) {
									if (data["rtn_code"] === "200") {
										let productInfo = data["productInfo"];
										let li_first =
												"<li class='pop_item'>" +
												"<div class='pk_idx d-none'>"+ productInfo["pk_idx"] +"</div>" +
												"<div class='pop_tit_wrap'>" +
												"<div class='comm_check_only'>" +
												"<label class='label_check'>" +
												"<input type='checkbox'><span></span>" +
												"</label>" +
												"</div>" +
												"<h3 class='pop_tit'>" + productInfo["fd_product_name"] + " " + productInfo["fd_product_standard"] + " " + productInfo["fd_product_unit"] + "</h3>" +
												"</div>" +
												"<div class='price_wrap'>" +
												"<div class='price'>" +
												"<strong class='pop_price'>" + productInfo["fd_product_amount"].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")  + "원</strong>" +
												"</div>" +
												"<div class='quan_box'>" +
												"<button class='minus'>" + "-" + "</button>" +
												"<div class='form_cont'>" +
												"<label for='cartP1'></label>" +
												"<input type='text' class='num pop_cnt' value='1'>" +
												"</div>" +
												"<button class='plus'>" + "+" + "</button>" +
												"</div>" +
												"</div>" +
												"</li>";
										$("#cartPopup3 > .depth1").append(li_first);


										let productDetailGroupList = data["productDetailGroupList"];
										for (let idx = 0; idx < productDetailGroupList.length; idx++) {
											let productDetailGroup = productDetailGroupList[idx];
											let li =
													"<li class='pop_item'>" +
													"<div class='pk_idx d-none'>"+ productDetailGroup["fk_tpsm_group_idx"] +"</div>" +
													"<div class='pop_tit_wrap'>" +
													"<div class='comm_check_only'>" +
													"<label class='label_check'>" +
													"<input type='checkbox'><span></span>" +
													"</label>" +
													"</div>" +
													"<h3 class='pop_tit'>" + productDetailGroup["master_product_name"] + " " + productDetailGroup["fd_product_standard"] + " " + productDetailGroup["fd_product_unit"] + "</h3>" +
													"</div>" +
													"<div class='price_wrap'>" +
													"<div class='price'>" +
													"<strong class='pop_price'>" + productDetailGroup["fd_product_amount"].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원</strong>" +
													"</div>" +
													"<div class='quan_box'>" +
													"<button class='minus'>" + "-" + "</button>" +
													"<div class='form_cont'>" +
													"<label for='cartP1'></label>" +
													"<input type='text' class='num pop_cnt' value='1'>" +
													"</div>" +
													"<button class='plus'>" + "+" + "</button>" +
													"</div>" +
													"</div>" +
													"</li>"
											$("#cartPopup3 > .depth1").append(li);
										}
									}else{
										alert(data["rtn_msg"]);
									}

									$("#cartPopup3").css("display","block");
									$("#black3").css("display","block");
								},
								error: function (data) {

								}
							});

						} else {
							$("#cartPopup1").find("input[name=pk_idx]").text(pk_idx);
							$("#cartPopup1").find(".pk_idx").text(pk_idx);
							$("#cartPopup1").find(".pop_tit").text(product_name);
							$("#cartPopup1").find(".pop_price").text(product_price);
							$("#cartPopup1").find(".pop_tot_price").text(product_price.replace("원", ""));
							$("#cartPopup1").find(".pop_cnt").val(1);
							$(".cart_popup.on").css("display","block");
							$("#black3").css("display","block");
						}
					}
				});
				
				$(".item_info").on("click", function () {
					$(this).children("a").removeAttr("onclick");
				});

				$(".buy_btn").on("click", function  () {
					let result = addCart2($(this));
					if (!result) {
						alert("수량을 체크 해주세요.");
					} else {
						$(this).closest(".cart_popup").css("display","none");
						$("#black3").css("display","none");

						let pop_id = $(this).parent().parent().parent().attr("id");	// cartPopup1
						if (pop_id == undefined) {
							pop_id = $(this).parent().parent().attr("id"); // cartPopup2
						}
					}
				});

				$(".btn_option").hover(function () {
					let ul = $(this).siblings(".sub").children("ul");
					let pd_idx = $(this).closest(".item_info").find(".pd_idx").text();
					if (!$(ul).hasClass("on")) {
						$.ajax({
							url: "/product/rest/group/info/" + pd_idx,
							method: "POST",
							content: "application/json",
							accept: "*/*",
							success: function (data) {
								if (data["rtn_code"] === "200") {
									$(ul).empty();
									$(ul).addClass("on");
									let html = "";
									let productInfo = data["productInfo"];
									let li_first = "";
									if (productInfo["fd_stock_sell_yn"] === 'Y') {
										li_first = "<li><div><p>";
									} else {
										li_first = "<li class='sold'><div><p>";
									}
										li_first = li_first
											+ productInfo["fd_product_standard"] + " "
											+ productInfo["fd_product_unit"] +
											"</p></div></li>";

									$(ul).append(li_first);

									let productDetailGroupList = data["productDetailGroupList"];
									for (let idx = 0; idx < productDetailGroupList.length; idx++) {
										let productDetailGroup = productDetailGroupList[idx];
										let li = "";
										if (productDetailGroup["fd_stock_sell_yn"] === 'Y') {
											li = "<li><div><p>";
										} else {
											li = "<li class='sold'><div><p>";
										}
											li = li
												+ productDetailGroup["fd_product_standard"] + " "
												+ productDetailGroup["fd_product_unit"] +
												"</p></div></li>";
										html += li;
									}
									$(ul).append(html);

								} else {
									alert(data["rtn_msg"]);
								}
							},
							error: function (data) {

							}
						});
					}
				});
			});

			/* 장바구니 담기 버튼 클릭 시 */
			function addCart(obj) {
				let pop_id = obj.parent().parent().parent().attr("id");	// cartPopup1
				if (pop_id == undefined) {
					pop_id = obj.parent().parent().attr("id"); // cartPopup2
				}

				let formData = {};
				let pd_title = $("#" + pop_id).find(".pop_tit").eq(0).text();
				let pd_cnt = $("#" + pop_id).find(".pop_item").length;

				if (pop_id === "cartPopup3") {
					pd_cnt = 0;
					$.each($("#" + pop_id).find(".pop_item"), function(i){
						if ($(this).find(".label_check").children().prop("checked")) {
							const pk_idx = $(this).find(".pk_idx").text();
							const cnt = $(this).find(".pop_cnt").val();
							formData['list['+i+'].fk_tpsm_idx'] = pk_idx;
							formData['list['+i+'].cnt'] = cnt;
							pd_cnt+=1;
						}
					});
				} else {
					$.each($("#" + pop_id).find(".pop_item"), function(i){
						const pk_idx = $(this).find(".pk_idx").text();
						const cnt = $(this).find(".pop_cnt").val();
						formData['list['+i+'].fk_tpsm_idx'] = pk_idx;
						formData['list['+i+'].cnt'] = cnt;
					});
				}

				if (JSON.stringify(formData) === JSON.stringify({})) {
					return false;
				}

				//google tag manager
				$.ajax({
					url : '/basket/rest/save',
					type : 'post',
					cache : false,
					data : formData,
					dataType : 'json',
					success:function(data){
						if(data.rtn_code == '200'){
							popAlarm(pd_title, pd_cnt);
							ad_log_naver("3", "1");
							labbit_add_to_cart(data.productInfoList);
						}else{
							alert(data.rtn_msg);
						}
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});

				return true;
			}
			
			/* 장바구니 담기 버튼 클릭 시 */
			function addCart2(obj) {
				let pop_id = obj.parent().parent().parent().attr("id");	// cartPopup1
				if (pop_id == undefined) {
					pop_id = obj.parent().parent().attr("id"); // cartPopup2
				}
				let formData = {};
				let pkList = "";
				let pd_cnt = $("#" + pop_id).find(".pop_item").length;
				if (pop_id === "cartPopup3") {
					pd_cnt = 0;
					$.each($("#" + pop_id).find(".pop_item"), function(i){
						if ($(this).find(".label_check").children().prop("checked")) {
							const pk_idx = $(this).find(".pk_idx").text();
							const cnt = $(this).find(".pop_cnt").val();
							formData['list['+i+'].fk_tpsm_idx'] = pk_idx;
							formData['list['+i+'].cnt'] = cnt;
							pd_cnt+=1;
							if (i == 0) {
								pkList += "pk_idx=" + pk_idx;
							} else {
								pkList += "&pk_idx=" + pk_idx;
							}
						}
					});
				} else {
					$.each($("#" + pop_id).find(".pop_item"), function(i){
						const pk_idx = $(this).find(".pk_idx").text();
						const cnt = $(this).find(".pop_cnt").val();
						formData['list['+i+'].fk_tpsm_idx'] = pk_idx;
						formData['list['+i+'].cnt'] = cnt;
						if (i == 0) {
							pkList += "pk_idx=" + pk_idx;
						} else {
							pkList += "&pk_idx=" + pk_idx;
						}
					});
				}
				if (JSON.stringify(formData) === JSON.stringify({})) {
					return false;
				}
				//google tag manager
				$.ajax({
					url : '/basket/rest/save',
					type : 'post',
					cache : false,
					data : formData,
					dataType : 'json',
					success:function(data){
						if(data.rtn_code == '200'){
							let pd_title = $("#" + pop_id).find(".pop_tit").eq(0).text();
							popAlarm(pd_title, pd_cnt);
							ad_log_naver("3", "1");
							labbit_add_to_cart(data.productInfoList);
							location.href='/product/basket/list?' + pkList;
						}else{
							alert(data.rtn_msg);
						}
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
				return true;
			}
			
			$(function(){
				$(".option_list .sub").click(function(){
					$(this).parents("li.option").children("a").attr("onclick","return false");
				});				
			});

			<%-- 메뉴 폰트 컬러 적용 --%>
			$(function(){
				$("#header .btm .area .real_area #gnb ul li:nth-child(4)").addClass("color_blue");
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
									<div class="img"><img src="/resources/images/sub/img_smallequipment_slide01.jpg?v20211228" /></div>
								</a>
							</li>
							<li>
								<a href="javascript:;">
									<div class="img"><img src="/resources/images/sub/img_smallequipment_slide03.jpg?v20211122" /></div>
								</a>
							</li>
						</ul>
						<p class="pagingInfo">
						    <span class="current"></span> / <span class="total"></span>
						</p>
					</div>
				</div>
			</article>
			<%--
				상위 li clsss 
				option : 규격
				/*
				보험 및 규격은 추가 해야 확인 가능함
				페이백과 마일리지 이벤트 같이 사용 못함

				*/				
				div class img
				이미지 상단 
				insure : 보험
				
				
				이미지 하단				 
				mileage : 마일리지
				payback : 페이백 이벤트
				soldout : sold out
			 --%>
			<article class="cnt_payback" id="cnt_anchor">
				<div class="hd_txt">
					<p class="tit">소장비 패키지 최저가 구매</p>
					<p class="desc">최대 60만원 더 저렴하게!</p>
				</div>
				<div class="cnt_cate_wrap">
					<div class="cnt_cate" id="cnt_anchor01">
						<div class="cnt_list col4">
							<ul>
								<c:if test="${!empty list }">
									<c:forEach var="item" items="${list}" varStatus="status">
										<c:set var="li_class" value=""/>
										<c:set var="div_class" value=""/>
										<c:set var="mileage_info" value=""/>
										<c:if test="${item.fd_stock_sell_yn eq 'N' }">
											<c:set var="div_class" value="soldout"/>
										</c:if>
										<c:if test="${item.fd_custom_use_point_yn eq 'Y' }">
											<c:set var="div_class" value="${div_class} mileage"/>
											<c:set var="mileage_info" value="data-text=\"${item.convertMoneyToHangul} 마일리지 사용가능\"" />
										</c:if>
										<c:if test="${item.tpsm_product_group_cnt > 0}">
											<c:set var="li_class" value="option"/>
										</c:if>
										<c:if test="${item.fd_product_insure_code ne '' }">
											<c:set var="li_class" value="${li_class} insure"/>
										</c:if>
										
										<li class="item_info ${li_class}">
											<div class="pd_idx d-none">${item.fk_tpsm_idx}</div>
											<a href="/product/detail?req_view_idx=${item.fk_tpsm_idx}">
												<div class="img ${div_class}" ${mileage_info}>
													<div class="icon_list">
														<div class="li li_option">
															<div>
																<div class="tit"><strong>${item.tpsm_product_group_cnt}</strong>개</div>
																<div class="desc">규격선택</div>
															</div>
														</div>
														<div class="li li_insure">
															<div>
																<div class="desc">보험<br>재료</div>
															</div>
														</div>
													</div>
													<img src="${item.view_image}" onerror="this.src='/resources/images/dummy/340x339.png'" />
													<div class="wish_wrap">
														<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" /></button>
														<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" /></button>
													</div>
												</div>
												<div class="info">
													<input class="pd_tit_hidden" type="hidden" value="[${item.fd_company_info}] ${item.fd_product_name}"/>
													<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name} ${item.fd_product_standard} ${item.fd_product_unit}</h4>
													<div class="price clear">
														<p id="product_amount" class="pd_price">
															<c:if test="${loginInfo == null}">
																로그인 후 확인 가능
															</c:if>
															<c:if test="${loginInfo != null}">
																<fmt:formatNumber value="${item.shop_product_amount}" pattern="#,###" />원
															</c:if>
														</p>
														<div class="option_list">
															<button type="button" class="btn_option">규격확인</button>
															<div class="sub">
																<div class="tit">규격정보</div>
																<ul></ul>
															</div>
														</div>
													</div>
												</div>
											</a>
										</li>
									</c:forEach>
								</c:if>
								
								<%--
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
								 --%>
								
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
