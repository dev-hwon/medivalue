<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<style type="text/css">
			.d-none {
				display: none;
			}
		</style>
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
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
				//var $s7subWish=$("#sub7 .cnt1 .area .real_area .txt .depth1 li a .img .wish_wrap .wish_btn");

				$s7imgA.on({
					"mouseenter":function  () {
						/* $(this).find(".wish_wrap").stop().animate({"bottom":"0"}, function  () { */
							//$(this).parents("a").removeAttr("onclick")
							$s7imgA.attr("onclick","return false");
						/* }); */
					},
					"mouseleave":function  () {
						/* $(this).find(".wish_wrap").stop().animate({"bottom":"-75px"}); */
					},
					"click":function  (e) {
						e.stopPropagation();
						var temp_loc_info = e.target.id;
						if(temp_loc_info == 'pd_img_info'){
							$s7imgA.removeAttr("onclick");	
						}else{
							$s7imgA.attr("onclick","return false");
						}
					}
				});
				
				/* 찜 버튼 */
				$(".wish_wrap .wish_btn").on("click", function(){
					var login_check = checkLogin();
					if(login_check){					
						const $obj = $(this);
						const pk_idx = $(this).parent().parent().find("#tpsm_idx").val();
						let onoff = "N";
						if ($(this).hasClass("on")) {
							onoff = "N";
						} else {
							onoff = "Y";
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
		    			   			if ($obj.hasClass("on")==false) {
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

				/* 장바구니 버튼 */
				$(".wish_wrap .cart_btn").on("click", function(){

					// $(this).parents("li.slick-slide").children("a").attr("onclick","return false");
					$(this).closest(".tpsm").children("a").attr("onclick","return false");

					if ("${loginInfo}" == "") return false;
					// const pk_idx = $(this).closest(".item_info").find(".pd_idx").text();
					const pk_idx = $(this).parent().parent().find("#tpsm_idx").val();
					const product_name = $(this).parent().parent().parent().find(".pd_tit").text();
					const product_price = $(this).parent().parent().parent().find("#product_amount").text();

					if ($(this).parents("li").hasClass("option")) {
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
						// const pk_idx = $(this).parent().parent().find("#tpsm_idx").val();
						// const product_name = $(this).parent().parent().parent().find(".pd_tit").text();
						// const product_price = $(this).parent().parent().parent().find("#product_amount").text();
						$("#cartPopup1").find("input[name=pk_idx]").text(pk_idx);
						$("#cartPopup1").find(".pk_idx").text(pk_idx);
						$("#cartPopup1").find(".pop_tit").text(product_name);
						$("#cartPopup1").find(".pop_price").text(product_price);
						$("#cartPopup1").find(".pop_tot_price").text(product_price.replace("원", ""));
						$("#cartPopup1").find(".pop_cnt").val(1);

						$(".cart_popup.on").css("display","block");
						$("#black3").css("display","block");
					}

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
					let pd_idx = $(this).closest(".tpsm").find("input[name='tpsm_idx']").val();
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
			});
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
			
			function scrollAnchor(id){
				var headHeight = $("#header .hd_wrap").height();
				var anchorTop = $("#"+id).offset().top;
				var thisTop = anchorTop - headHeight;
				$("html, body").stop().animate({
					scrollTop : thisTop
				}, 300);
				
			}
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub7" class="sub">
			<!-- req_munu_idx=13 일 때만 노출 START-->
			<c:if test="${req_munu_idx eq '13' }">
			<article class="banner_wrap">
				<div class="inner">
					<div class="img">
						<img src="/resources/images/sub/img_banner_package.jpg" />
						<a href="javascript:;" class="btn_01" onclick="scrollAnchor('cnt_anchor');"></a>
					</div>
				</div>
			</article>
			<!-- req_munu_idx=13 일 때만 노출 END-->
			</c:if>
			<article class="cnt1 noti2" id="cnt_anchor">
				<div class="area">
					<div class="real_area">
						<div class="txt">
							<h3>${menu_name}</h3>
							<ul id="listUp" class="depth1 clear">
								<c:if test="${!empty p_list }">
									<c:forEach var="item" items="${p_list}" varStatus="state">
										<li class="tpsm <c:if test="${item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
											<a href="/product/detail?req_view_idx=${item.fk_tpsm_idx }" target="_self">
												<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
													<input type="hidden" name="tpsm_idx" id="tpsm_idx" value="${item.fk_tpsm_idx}">
													<input type="hidden" name="shop_product_amount" id="shop_product_amount" value="${item.shop_product_amount }">
													<div class="icon_list">
														<div class="li li_option">
															<div>
																<div class="tit"><strong><c:out value="${item.fd_option_count + 1}"/></strong>개</div>
																<div class="desc">규격선택</div>
															</div>
														</div>
														<div class="li li_insure">
															<div>
																<div class="desc">보험<br>재료</div>
															</div>
														</div>
													</div>
													<img src="${item.view_image}" style="object-fit: contain;" onerror="this.src='/resources/images/dummy/340x339.png'" width="340" height="339" border="0" alt=" 제품이미지" id="pd_img_info"/>
													<div class="wish_wrap">
														<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name} ${item.fd_product_standard} ${item.fd_product_unit}</h4>
													<div class="price clear">
														<%--<strong class="percent">10%</strong> --%>
														<p id="product_amount"><fmt:formatNumber value="${item.shop_product_amount}" pattern="#,###" />원</p>
														<div class="option_list">
															<button class="btn_option">규격확인</button>
															<div class="sub">
																<div class="tit">규격정보</div>
																<ul>
																</ul>
															</div>
														</div>
													</div>
													<div class="cost"><%-- <p>0,000,000원</p>--%></div>
												</div>
											</a>
										</li>
									</c:forEach>
								</c:if>								
							</ul>
							<button class="more_view">제품리스트 더보기<img src="/resources/images/main/more_view.jpg" width="15" height="9" border="0" alt="" /></button>
						</div>
					</div>
				</div>
			</article>
			
			<c:if test="${req_munu_idx eq '13' }">
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
			</c:if>
			
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
			<%--  히스토리 영역 시작 --%>
			<layout:historyFrame/>
			<%--  히스토리 영역 끝 --%>
		</section>
	</jsp:body>
</layout:basicFrame>