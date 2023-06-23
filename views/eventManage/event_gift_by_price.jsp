<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<c:set var="check_version_info" value="2023061901"/>
        <link rel="stylesheet" href="/resources/css/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="/resources/css/common.css?v=${check_version_info}"/>
		<link rel="stylesheet" href="/resources/css/headfoot.css?v=${check_version_info}"/>
		<link rel="stylesheet" href="/resources/css/popup.css?v=${check_version_info}"/>
	    <link rel="stylesheet" href="/resources/css/event/2023/evt_gift_by_price.css?v=${check_version_info}" />

	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/swiper-bundle.min.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
		<!--
    	<script type="text/javascript" src="/resources/js/event_limit_purchase.js"></script>
    	-->
    	<script type="text/javascript">
	        $(document).ready(function (){
	                /* 장바구니 버튼 */
					$(".btn_cart").on("click", function(){
	                    var idx = $(this).val();
						var login_check = js_login_check_cart_btn();
	                    var product_name = "#tit_" + idx;
	                    var tpsm_idx = "#tpsm_idx_" + idx;
	                    var tpmm_idx = "#tpmm_idx_" + idx;
	
						var pd_cnt = 1;
						var pd_title =  $.trim($(product_name).html()); // 상품명
						let formData = {};
						let cart_list = [];
	
						if(login_check){
	
							let cart_obj = {
	                            cnt : 1,
	                            tpsm_idx : $(tpsm_idx).val(), // tpsm_idx,
	                            tpmm_idx : $(tpmm_idx).val(), // tpmm_idx
	                            eventType : "Special"
	                        };
	
	                        cart_list.push(cart_obj);
	                        formData["cart_list"] = cart_list;
	
							$.ajax({
								url: '/quickOrder/rest/cart/event/save',
								type: 'post',
								cache: false,
								data: JSON.stringify(formData),
								contentType: 'application/json',
								dataType: 'json',
								success: function (data) {
									if(data['rtn_cd'] != '200'){
										alert(data['rtn_msg']);
									}else{
										popAlarm_renew(pd_title, pd_cnt, data['basket_list_size']);
										labbit_add_to_cart(data.basket_save_list);
									}
								}
							});
						}
					});
	
	                // 차후 common.js로 옮기던, btm을 바꾸던 해야할 듯 _ads
					function popAlarm_renew(pd_title, pd_cnt, basketSize) {
						const $cartAlarm=$("#header .btm .area .real_area .right > ul > li.hd_r_btn3 .cart_alarm"); // .btm 으로 변경
						const $cartNum=$("#header .btm .area .real_area .right > ul > li.hd_r_btn3 > a .cart_num");
						if (pd_cnt > 1) {
							pd_title = pd_title + " 외";
						}
	
						$cartAlarm.find(".pd_tit").text(ConvertTag(pd_title));
						$cartAlarm.find(".pd_desc").text(pd_cnt + "개 제품을 장바구니에 담았습니다");
	
						let count = basketSize;
						$cartNum.text(count);
	
						$cartAlarm.css("display","block");
						$cartNum.css("display","block");
	
						setTimeout(function() {
							$cartAlarm.css("display","none");
						}, 3000);
					}
	
	                function ConvertTag(str){
	                    str = str.replace("&lt;","<");
	                    str = str.replace("&gt;",">");
	                    str = str.replace("&quot;","\"");
	                    str = str.replace("&#39;","\'");
	                    str = str.replace("&amp;","&");
	                    str = str.replace("&nbsp;", "");
	                    return str;
	                }
	
	                function js_login_check_cart_btn(){
						let location_search = location.search;
						let location_pathname = location.pathname;
						let url = location_pathname + location_search;
	
						url = encodeURIComponent(url);
						var rtn_login_check = true;
	
						if ("${loginInfo}" == null){
							$("#pop_alarm_msg").text("로그인 후 이용해 주세요.");
							$(".popup_message_type_1").css("display","block");
							$("#black").css("display","block");
							$(".one_btn").on("click", function () {
								location.href="/access/login?url=" + url;
							});
							rtn_login_check = false;
						}
						return rtn_login_check;
					}
	    	});
        </script>
	</jsp:attribute>
	<jsp:body>
		<div class="evt_container">
            <section class="area_visual">
				<!--
					배경컬러값 관리자에서 지정한 값이 등록되게 없으면 안나옴
					배경이미지값 관리자에서 지정한 이미지가 등록되게 없으면 안나옴
					배경컬러, 배경이미지가 동시에 존재가능

					하단 area_caution 영역도 동일하게 처리
				-->
                <div class="img_wrap" style="background-color: #0C52A0; background-image: url('/resources/images/event/gift_by_price/bg_visual1.jpg');">
                    <img src="/resources/images/event/gift_by_price/img_visual1.jpg?v=${check_version_info}" alt="주문금액별 사은품증정" />
                </div>
				<div class="img_wrap" style="background-color: #0C52A0; background-image: url('/resources/images/event/gift_by_price/bg_visual2.jpg');">
					<img src="/resources/images/event/gift_by_price/img_visual2.jpg?v=${check_version_info}" alt="6월 한달동안만 받을수 있는 혜택! 2%추가적립, luminous zircon prophy paste 1개증정, 킹글러브 1박스 증정, ASA 석션팁 3박스 증정, 믹싱팁 7박스 증정" />
				</div>
            </section>
			<!--
				배경컬러값 관리자에서 지정한 값이 등록되게 ( 컬러는 한개만 등록됨 )
			-->
			<section class="area_tab_menu" style="background-color: #ddd; ">
				<div class="inner">
					<div class="swiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide"><button type="button" class="btn_tab">전체</button></div>
							<div class="swiper-slide"><button type="button" class="btn_tab">지크로니아 블랙</button></div>
							<div class="swiper-slide"><button type="button" class="btn_tab">카테고리명1</button></div>
							<div class="swiper-slide"><button type="button" class="btn_tab">카테고리명2</button></div>
						</div>
					</div>
					<button type="button" class="tab_menu_prev"></button>
					<button type="button" class="tab_menu_next"></button>
				</div>
			</section>
            <section class="area_main">
                <div class="inner">
					<div class="evt_goods_list">
						<ul class="row row_gap_20 row_align_stretch" style="justify-content: ${fn:length(event_list) lt 4 ? "center" : "flex-start" }">
							<!-- sample -->
							<li class="col col_xs_6 col_sm_4 col_lg_3">
								<div class="item_wrap">
									<div class="item_img g_e_b1_p_img_">
										<img src="/resources/images/sample/sample_img.png" alt="">
									</div>
									<div class="item_info g_e_b1_p_info_">
										<div class="tx_goodsName tx_shortening_2" id="tit_${item.pk_idx}">상품명 상품명 상품명 상품명 상품명 상품명 상품명 상품명 상품명 상품명 상품명 </div>
										<div class="tx_addinfo">
											<span>포장단위</span>
											<span>제조사</span>
										</div>
										<div class="tx_price">
											<div class="tx_price_discountPer"><em>40</em>%</div>
											<div class="tx_price_origin"><em>999,999,999</em>원</div>
											<div class="tx_price_discount"><em>999,999,999</em>원</div>
										</div>
										<div class="tx_hashtag">
											<span>#태그영역</span>
											<span>#태그영역</span>
											<span>#태그영역</span>
										</div>
									</div>
									<div class="item_btnCart g_e_b1_p_cart">
										<button type="button" class="btn_cart" >장바구니 담기</button>
									</div>
								</div>
							</li>
							<c:if test="${!empty event_list }">
								<c:forEach var="item" items="${event_list}" varStatus="status">
									<li class="col col_xs_6 col_sm_4 col_lg_3 <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>" >
										<div class="item_wrap">
											<div class="item_img g_e_b1_p_img_${item.fk_tpmm_idx}">
												<img src="${item.fd_img_path ne '' ? item.fd_img_path : "/resources/images/no_img.jpg"}" alt=""></div>
											<div class="item_info g_e_b1_p_info_${item.fk_tpmm_idx}">
												<div class="tx_goodsName" id="tit_${item.pk_idx}">${item.fd_product_name }</div>
												<div class="tx_addinfo">
													<span>${item.fd_product_unit}</span>
													<span>${item.fd_company_name}</span>
												</div>
												<div class="tx_price">
													<div class="tx_price_discountPer">40%</div>
													<c:if test="${item.tpmm_product_amount ne '' and tpmm_product_amount ne '0'}">
														<div class="tx_price_origin"><em><fmt:formatNumber value="${item.tpmm_product_amount}" pattern="#,###" /></em>원</div>
													</c:if>
													<div class="tx_price_discount">
														<em> <fmt:formatNumber value="${item.tpsm_product_amount-(item.tpsm_product_amount*0.05)}" pattern="#,###" /></em>원
													</div>
												</div>
												<div class="tx_hashtag">
													<span>#태그영역</span>
													<span>#태그영역</span>
													<span>#태그영역</span>
												</div>
											</div>
											<div class="item_btnCart g_e_b1_p_cart_${item.fk_tpmm_idx}">
												<button type="button" class="btn_cart"  value="${item.pk_idx}">장바구니 담기</button>
												<input type="hidden" id="tpsm_idx_${item.pk_idx}" name="tpsm_idx" value="${item.fk_tpsm_idx}">
	                                			<input type="hidden" id="tpmm_idx_${item.pk_idx}" name="tpmm_idx" value="${item.fk_tpmm_idx}">
											</div>
										</div>
									</li>
								</c:forEach>
							</c:if>
						</ul>
					</div>
                </div>
            </section>

			<section class="area_caution">
				<div class="img_wrap" style="background-image: url('/resources/images/event/gift_by_price/bg_caution.jpg');">
					<img src="/resources/images/event/gift_by_price/img_caution.jpg?v=${check_version_info}" alt="주문금액별 사은품증정" />
				</div>
			</section>

			<!-- 장바구니 레이어 -->
			<div class="layer_add_cart">
				<div class="dimm"></div>
				<div class="inner_wrap">
					<div class="lay_header">
						<div class="tx_maker">제조사</div>
						<div class="tx_tit">제품명</div>
					</div>
					<div class="lay_body">
						<div class="select_list">
							<div class="select_box">
								<div class="selected">옵션입리다~1</div>
								<ul>
									<li><button type="button" value="옵션입리다~1">옵션입리다~1</button></li>
									<li><button type="button" value="옵션입리다~2">옵션입리다~2</button></li>
									<li><button type="button" value="옵션입리다~3">옵션입리다~3</button></li>
									<li><button type="button" value="옵션입리다~4">옵션입리다~4</button></li>
									<li><button type="button" value="옵션입리다~5">옵션입리다~5</button></li>
									<li><button type="button" value="옵션입리다~6">옵션입리다~6</button></li>
								</ul>
							</div>
							<div class="select_box">
								<div class="selected">옵션입리다~1</div>
								<ul>
									<li><button type="button" value="옵션입리다~1">옵션입리다~1</button></li>
									<li><button type="button" value="옵션입리다~2">옵션입리다~2</button></li>
									<li><button type="button" value="옵션입리다~3">옵션입리다~3</button></li>
									<li><button type="button" value="옵션입리다~4">옵션입리다~4</button></li>
									<li><button type="button" value="옵션입리다~5">옵션입리다~5</button></li>
									<li><button type="button" value="옵션입리다~6">옵션입리다~6</button></li>
								</ul>
							</div>
							<div class="select_box">
								<div class="selected">옵션입리다~1</div>
								<ul>
									<li><button type="button" value="옵션입리다~1">옵션입리다~1</button></li>
									<li><button type="button" value="옵션입리다~2">옵션입리다~2</button></li>
									<li><button type="button" value="옵션입리다~3">옵션입리다~3</button></li>
									<li><button type="button" value="옵션입리다~4">옵션입리다~4</button></li>
									<li><button type="button" value="옵션입리다~5">옵션입리다~5</button></li>
									<li><button type="button" value="옵션입리다~6">옵션입리다~6</button></li>
								</ul>
							</div>
						</div>

						<div class="selected_options">
							<div class="selected_option">
								<div class="row row_align_end">
									<div class="col col_6">
										<div class="selected_option_name tx_shortening_1">선택한 옵션명선택한 옵션명선택한 옵션명선택한 옵션명선택한 옵션명</div>
										<div class="select">
											<div class="set_amount">
												<button type="button" class="amount_down"><img src="/resources/images/event/icon_minus.svg" alt="" /></button>
												<input type="number" class="input_number" name="amount" value="0" min="1" max="999" />
												<button type="button" class="amount_up"><img src="/resources/images/event/icon_plus.svg" alt="" /></button>
											</div>
										</div>
									</div>
									<div class="col col_6">
										<div class="tx_price"><em>37,000</em>원</div>
									</div>
								</div>
								<button type="button" class="btn_selected_option_delete"><img src="/resources/images/event/icon_close.jpg" /></button>
							</div>
							<div class="selected_option">
								<div class="row row_align_end">
									<div class="col col_6">
										<div class="selected_option_name tx_shortening_1">선택한 옵션명선택한 옵션명선택한 옵션명선택한 옵션명선택한 옵션명</div>
										<div class="select">
											<div class="set_amount">
												<button type="button" class="amount_down"><img src="/resources/images/event/icon_minus.svg" alt="" /></button>
												<input type="number" class="input_number" name="amount" value="0" min="1" max="999" />
												<button type="button" class="amount_up"><img src="/resources/images/event/icon_plus.svg" alt="" /></button>
											</div>
										</div>
									</div>
									<div class="col col_6">
										<div class="tx_price"><em>37,000</em>원</div>
									</div>
								</div>
								<button type="button" class="btn_selected_option_delete"><img src="/resources/images/event/icon_close.jpg" /></button>
							</div>
							<div class="selected_option">
								<div class="row row_align_end">
									<div class="col col_6">
										<div class="selected_option_name tx_shortening_1">선택한 옵션명선택한 옵션명선택한 옵션명선택한 옵션명선택한 옵션명</div>
										<div class="select">
											<div class="set_amount">
												<button type="button" class="amount_down"><img src="/resources/images/event/icon_minus.svg" alt="" /></button>
												<input type="number" class="input_number" name="amount" value="0" min="1" max="999" />
												<button type="button" class="amount_up"><img src="/resources/images/event/icon_plus.svg" alt="" /></button>
											</div>
										</div>
									</div>
									<div class="col col_6">
										<div class="tx_price"><em>37,000</em>원</div>
									</div>
								</div>
								<button type="button" class="btn_selected_option_delete"><img src="/resources/images/event/icon_close.jpg" /></button>
							</div>
						</div>
					</div>
					<div class="lay_footer">
						<div class="total">
							<div class="tx_total">총 상품금</div>
							<div class="tx_total_price"><em>74,000</em>원</div>
						</div>
						<div class="btn_area">
							<button type="button" class="btn_cancel_add_cart">취소</button>
							<button type="button" class="btn_confirm_add_Cart">장바구니 담기</button>
						</div>
					</div>
				</div>
			</div>
        </div>
		<script>
			const tab_menu = new Swiper(".area_tab_menu .swiper", {
				loop: true,
				slidesPerView: 4,
				centeredSlides: false,
				spaceBetween: 0,
				speed: 400,
				slideToClickedSlide: true,
				// autoplay: {
				// 	delay: 3000,
				// },
				navigation: {
					prevEl: ".area_tab_menu .tab_menu_prev",
					nextEl : ".area_tab_menu .tab_menu_next",
				},
			});


			$("body").on('click', ".btn_cart", function(){
				$('.layer_add_cart').fadeIn();
			})
			$("body").on('click', ".btn_cancel_add_cart, .btn_confirm_add_Cart, .layer_add_cart .dimm", function(){
				$('.layer_add_cart').fadeOut();
			})

			// 셀렉트박스클릭시
			$("body").on('click', ".select_box .selected", function(){
				let _selectbox = $(this).parents('.select_box');
				if( _selectbox.hasClass('active')) {
					_selectbox.removeClass('active');
				} else {
					_selectbox.addClass('active').siblings().removeClass('active');
				}
			}).on('click', ".select_box button", function(){
				let _value = $(this).val();
				let _selectbox = $(this).parents('.select_box');
				_selectbox.removeClass('active');
				_selectbox.find('.selected').text(_value);
			})

			// 갯수
			$('.amount_down').on('click', function(){
				let _input_amount = $(this).parents('.set_amount').find('input[name=amount]');
				let amount = _input_amount.val();
				if( amount > 0 ) {
					_input_amount.val(amount - 1)
				};
			})
			$('.amount_up').on('click', function(){
				let _input_amount = $(this).parents('.set_amount').find('input[name=amount]');
				let amount = _input_amount.val();
				if( amount < 999 ) {
					_input_amount.val(+amount + 1)
				};
			});
			$('input[name=amount]').on('input', function(){
				let amount = $(this).val()
				if( amount < 0 ) {
					$(this).val(0)
				}
				if( amount > 999 ) {
					$(this).val(999)
				}
			});
		</script>
	</jsp:body>
</layout:basicFrame>