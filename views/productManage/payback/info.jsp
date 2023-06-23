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
		<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.min.js"></script>
		<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>
		<script type="text/javascript">

			var all_cate_1_idx_list = [
				<c:forEach var="cate" items="${cate_list}" varStatus="varStatus">
				${cate.fk_tpcm_idx}<c:if test="${varStatus.index < cate_list.size()}">,</c:if>
				</c:forEach>
			];

			var all_cate_1_idx = 0;

			var scrollEvent = true;
			var categoryScrollEvent = false;
			var categoryCurrentPage = 1;
			var categoryCurrentSelected = all_cate_1_idx_list[0];
			var categoryCurrentTotalCount = 0;
			var bottomLoad = true;

			// var all_cate_1_idx_list = [1, 2, 3, 4, 8, 9, 10, 15, 6, 13];


			// 1, 2, 3, 4, 8, 9, 10, 15, 6, 13
			function parseAmountFmt(value) {
				return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}

			function displayPaybackProductList(data, fk_cate_1_idx, anchor) {

				let loginInfo = '${loginInfo}';

				let p_list = data['p_list'];
				let cate_list = data['cate_list'];
				let subtit = '전체 제품';
				let subtit_idx = '';

				for (let cdx = 0; cdx < cate_list.length; cdx ++) {
					let category = cate_list[cdx];
					if (category['fk_tpcm_idx'] == fk_cate_1_idx) {
						subtit = category['fd_name'];
						subtit_idx = "subtit_" + category['fk_tpcm_idx'];
						break;
					}
				}

				let p_html = '';
				p_html += "<div class='cnt_cate' id='cnt_anchor01'>";

				if (!anchor) {
					p_html +=		"<p class='subtit' id='" + subtit_idx + "'>" + subtit + "</p>";
				}

				p_html +=		"<div class='cnt_list col5'>";

				if (p_list != null && p_list.length > 0) {

					p_html += 		"<ul>";

					for (let idx = 0; idx < p_list.length; idx++) {

						let p = p_list[idx];
						let img_class = 'img';
						let patch_class = 'item_info';
						let option_count = 0;
						let on_error = "this.src='/resources/images/dummy/340x339.png'";

						if (p['fd_event_yn'] === 'Y') {
							img_class += ' payback';
						}

						if (p['fd_stock_sell_yn'] === 'N') {
							img_class += ' soldout';
						}

						if (parseInt(p['fd_option_count']) > 0) {
							patch_class += ' option';
							option_count = p['fd_option_count'] + 1;
						}

						if (p['fd_product_insure_code'] != null && p['fd_product_insure_code'] != '') {
							patch_class += ' insure';
						}

						let li = '';
						li += "<li class='" + patch_class + "'>";
						li += 		"<div class='pd_idx d-none'>" + p['fk_tpsm_idx'] + "</div>"
						li +=	"<a href='/product/detail?req_view_idx=" + p['fk_tpsm_idx'] + "'>";
						li +=		"<div class='" + img_class + "'>";
						li +=			"<div class='icon_list'>";
						li +=				"<div class='li li_option'>";
						li +=					"<div>";
						li +=						"<div class='tit'><strong>"+ option_count +"</strong>개</div>";
						li +=						"<div class='desc'>규격선택</div>";
						li +=					"</div>";
						li +=				"</div>";
						li +=				"<div class='li li_insure'>";
						li +=					"<div>";
						li +=						"<div class='desc'>보험<br>재료</div>";
						li +=					"</div>";
						li +=				"</div>";
						li +=			"</div>";
						li +=			"<img src='" + p['fd_img_path_thumbnail'] + "' onerror=" + on_error + " />";
						li +=			"<div class='wish_wrap'>";
						li +=				"<button type='button' class='wish_btn'><img src='/resources/images/main/sub_like_icon.png' /></button>";
						li +=				"<button type='button' class='cart_btn'><img src='/resources/images/main/sub_cart_icon.png' /></button>";
						li +=			"</div>";
						li +=		"</div>";
						li +=		"<div class='info'>";
						li +=			"<input class='pd_tit_hidden' hidden value='" + "[" + p['fd_company_info'] + "]" + " " + p['fd_product_name'] + "'/>";
						li +=			"<h4 class='pd_tit'>" + "[" + p['fd_company_info'] + "]" + " " + p['fd_product_name'] + " " + p['fd_product_standard'] + " " + p['fd_product_unit'] + "</h4>";
						li +=			"<div class='price clear'>";

						if (loginInfo === '') {
							li +=				"<p class='pd_price' id='product_amount'>로그인 후 확인 가능</p>";
						} else {
							li +=				"<p class='pd_price' id='product_amount'>" + parseAmountFmt(p['shop_product_amount']) + "원</p>";
						}


						li +=				"<div class='option_list'>";
						li +=					"<button class='btn_option'>규격확인</button>";
						li +=					"<div class='sub'>";
						li +=						"<div class='tit'>규격정보</div>";
						li +=						"<ul>";
						// li +=							"<li><div><p>-규격 옵션-</p></div></li>";
						// li +=							"<li class='sold'><div><p>-규격 옵션-</p></div></li>";
						li +=						"</ul>";
						li +=					"</div>";
						li +=				"</div>";
						li +=			"</div>";
						li +=		"</div>";
						li +=	"</a>";
						li += "</li>";

						p_html += li;
					}

					p_html +=			"</ul>"

				} else {
					//현재 행사중인 제품이 없습니다.
					// let li = '';
					// li += "<li>";
					// li += "</li>";
					p_html += "<div> 현재 행사중인 제품이 없습니다. </div>";
				}

				p_html +=		"</div>";
				p_html += "</div>";
				$(".cnt_cate_wrap").append(p_html);

				if (!anchor) {
					if (scrollEvent) {
						if(all_cate_1_idx == 0) {
							scrollAnchor('cnt_anchor');
						}
					} else {
						scrollAnchor('cnt_anchor');
					}
				}

				bottomLoad = true;
				all_cate_1_idx = all_cate_1_idx + 1;

				$(".wish_wrap .wish_btn").off("click");
				$(".wish_wrap .cart_btn").off("click");
				$(".item_info").off("click");
				$(".buy_btn").off("click");
				$(".btn_option").off("hover");

				/* 찜 버튼 */
				$(".wish_wrap .wish_btn").on("click", function(){
					$(this).parent().parent().parent().parent().children("a").attr("onclick","return false");
					let login_check = checkLogin();
					if (login_check) {
						const $obj = $(this);
						const pk_idx = $(this).closest(".item_info").find(".pd_idx").text();
						let onoff = "N";
						if ($(this).hasClass("on")) {
							onoff = "Y";
						} else {
							onoff = "N";
						}

						let formData = {
							wish_state: onoff,
							tpsm_idx: pk_idx
						};
						$.ajax({
							url : '/wish/rest/save',
							type : 'post',
							cache : false,
							data : formData,
							dataType : 'json',
							success:function(data){
								if(data.rtn_code == '200'){
									if ($obj.hasClass("on")) {
										$obj.removeClass("on").find("img").attr("src","/resources/images/main/sub_like_icon.png")
									}else {
										$obj.addClass("on").find("img").attr("src","/resources/images/main/sub_like_icon_on.png")
									}
								}else{
									alert(data.rtn_msg);
								}
							},
							error:function(request,status,error){
								alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						});
					}
				});

				//$(this).parent().parent().parent().parent().children("a").attr("onclick","return false");
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

									} else {
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
					// let pd_idx = $(this).parent().parent().parent().parent().siblings(".pd_idx").text();
					let pd_idx = $(this).closest(".item_info").find(".pd_idx").text();
					if (!$(ul).hasClass("on")) {
						// $(ul).append("<li><div><p>불러오는중...</p></div></li>");
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
			}

			function getPaybackProductList(fk_cate_1_idx, page, anchor) {

				let req = JSON.stringify({
					fk_cate_1_idx: fk_cate_1_idx,
					page: page
				});

				$.ajax({
					url: '/product/rest/payback',
					type: 'post',
					data: req,
					async: false,
					dataType: 'json',
					contentType: 'application/json',
					success: function (data) {
						categoryCurrentTotalCount = data["total_count"];
						displayPaybackProductList(data, fk_cate_1_idx, anchor);
					},
					error: function (data) {
						console.log(data);
					}
				});
			}

			function getCategoryPaybackProductList(t, fk_cate_1_idx, page) {
				$(".cnt_cate_wrap").empty();
				if ($(t).parent().parent().hasClass("on")) {
					$(t).parent().parent().removeClass("on")
					scrollEvent = true;
					categoryScrollEvent = false;
					all_cate_1_idx = 0;
					getPaybackProductList(all_cate_1_idx_list[all_cate_1_idx], 0, false);
				} else {
					$(".p_cate").removeClass("on");
					$(t).parent().parent().addClass("on");
					scrollEvent = false;
					categoryScrollEvent = true;
					categoryCurrentPage = page;
					categoryCurrentSelected = fk_cate_1_idx;
					getPaybackProductList(fk_cate_1_idx, page, false);
				}
			}

			$(function () {
				let cate_idx = '${cate_idx}';
				if (cate_idx > 0) {
					getCategoryPaybackProductList($(".p_cate_" + cate_idx).children("div").children("a"), cate_idx, 0);
				} else {
					getPaybackProductList(all_cate_1_idx_list[all_cate_1_idx], 0, true);
				}

			});


			$(document).scroll(function () {
				let scrollT = $(this).scrollTop();
				let bottomHeight = $(".cnt_payback").height() + $(".cnt_payback").offset().top;
				if (scrollEvent) {
					// if (bottomHeight <= ($(window).height() + scrollT + 100) && bottomLoad) {
					if (bottomHeight <= ($(window).height() + scrollT + 100)) {
					// if (bottomHeight <= ($(window).height() + scrollT)) {
						bottomLoad = false;
						if (all_cate_1_idx < all_cate_1_idx_list.length && all_cate_1_idx > 0) {
							getPaybackProductList(all_cate_1_idx_list[all_cate_1_idx], 0, false);
						}
					}
				}

				if (categoryScrollEvent) {
					if (bottomHeight <= ($(window).height() + scrollT + 100)) {
						let pageSize = 5;
						let lastPage = Math.ceil(categoryCurrentTotalCount / pageSize);

						let anchor = false;
						if (categoryCurrentPage < lastPage) {
							categoryCurrentPage = categoryCurrentPage + 1;
							if(categoryCurrentPage > 1) { anchor = true; }
							getPaybackProductList(categoryCurrentSelected, categoryCurrentPage, anchor);
						}
					}
				}
			});

			// $(document).on('scroll touchmove mousewheel', function(event) {
			// 	console.log('scroll');
			// 	event.preventDefault();
			// 	event.stopPropagation();
			// 	return false;
			// });

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
							ad_log_naver("3", "1");
							labbit_add_to_cart(data.productInfoList);
							popAlarm(pd_title, pd_cnt);
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
			<%--<article class="payback_visual">
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
			</article>--%>
			<%-- <article class="banner_wrap">
				<div class="inner">
					<div class="img">
						<img src="/resources/images/sub/img_banner_package.jpg?v20211109" />
						<a href="javascript:;" class="btn_01" onclick="scrollAnchor('cnt_anchor');"></a>
						<a href="javascript:;" class="btn_02" onclick="scrollAnchor('cnt_anchor');"></a>
					</div>
				</div>
			</article> --%>
			<article class="cnt_payback" id="cnt_anchor">
				<div class="hd_txt">
					<p class="tit">많은 치과에서 선택한 인기상품을 만나보세요.</p>
<%--					<p class="desc">보조설명 영역입니다.</p>--%>
				</div>
				<div class="tab_cate col5">
					<ul>

							<c:forEach var="cate" items="${cate_list}" varStatus="varStatus">
								<li class="p_cate p_cate_<c:out value="${cate.fk_tpcm_idx}"/>">
									<div>
										<a onclick="getCategoryPaybackProductList(this, <c:out value="${cate.fk_tpcm_idx}"/>, 1)"><c:out value="${cate.fd_name}"/></a>
									</div>
								</li>
							</c:forEach>

<%--							<li class="p_cate p_cate_2">--%>
<%--								<div>--%>
<%--									<a href="#cnt_anchor" onclick="getCategoryPaybackProductList(this, 2, 0)">시멘트</a>--%>
<%--								</div>--%>
<%--							</li>--%>
<%--							<li class="p_cate p_cate_3">--%>
<%--								<div>--%>
<%--									<a href="#cnt_anchor" onclick="getCategoryPaybackProductList(this, 3, 0)">근관재</a>--%>
<%--								</div>--%>
<%--							</li>--%>
<%--							<li class="p_cate p_cate_4">--%>
<%--								<div>--%>
<%--									<a href="#cnt_anchor" onclick="getCategoryPaybackProductList(this, 4, 0)">레진/본딩/에칭</a>--%>
<%--								</div>--%>
<%--							</li>--%>
<%--							<li class="p_cate p_cate_8">--%>
<%--								<div>--%>
<%--									<a href="#cnt_anchor" onclick="getCategoryPaybackProductList(this, 8, 0)">템포관련/덴쳐</a>--%>
<%--								</div>--%>
<%--							</li>--%>
<%--							<li class="p_cate p_cate_9">--%>
<%--								<div>--%>
<%--									<a href="#cnt_anchor" onclick="getCategoryPaybackProductList(this, 9, 0)">수술재료/마취</a>--%>
<%--								</div>--%>
<%--							</li>--%>
<%--							<li class="p_cate p_cate_10">--%>
<%--								<div>--%>
<%--									<a href="#cnt_anchor" onclick="getCategoryPaybackProductList(this, 10, 0)">방사선재/교합관련</a>--%>
<%--								</div>--%>
<%--							</li>--%>
<%--							<li class="p_cate p_cate_15">--%>
<%--								<div>--%>
<%--									<a href="#cnt_anchor" onclick="getCategoryPaybackProductList(this, 15, 0)">마스크/글러브/석션</a>--%>
<%--								</div>--%>
<%--							</li>--%>
<%--							<li class="p_cate p_cate_6">--%>
<%--								<div>--%>
<%--									<a href="#cnt_anchor" onclick="getCategoryPaybackProductList(this, 6, 0)">트레이/스케일러팁</a>--%>
<%--								</div>--%>
<%--							</li>--%>
<%--							<li class="p_cate p_cate_13">--%>
<%--								<div>--%>
<%--									<a href="#cnt_anchor" onclick="getCategoryPaybackProductList(this, 13, 0)">기타 치과 재료</a>--%>
<%--								</div>--%>
<%--							</li>--%>
					</ul>
				</div>

				<div class="cnt_cate_wrap">
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
