<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:MobileStoreFrame>
    <jsp:attribute name="stylesheet">
	    <link href="/resources/css/mobile/list.css" rel="stylesheet" >
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript">
			let layer_pd_info={
					tpmm_idx:0,
					tpsm_idx:0,
					tsmi_idx:0,
					pd_amount:0,
					cnt:0
			};
			let proc_state = true;
			$(document).ready(function (){
				$(".btn_order").on("click",function(){
					alert("주문");
				});

				$(".btn_modify_info").off().on("click",function(){
					if(proc_state){
						if(layer_pd_info.tpmm_idx  == 0) {
							alert('제품정보를 확인 후 다시 시도해주세요');
							return false;
						}else if(layer_pd_info.tpsm_idx  == 0) {
							alert('제품정보를 확인 후 다시 시도해주세요');
							return false;
						}else if(layer_pd_info.tsmi_idx  == 0) {
							alert('제품정보를 확인 후 다시 시도해주세요');
							return false;
						}else if(layer_pd_info.cnt  == 0) {
							alert('제품정보를 확인 후 다시 시도해주세요');
							return false;
						}else if(layer_pd_info.pd_amount  == 0) {
							alert('제품정보를 확인 후 다시 시도해주세요');
							return false;
						}else{
							proc_state = false;
							var req_data = [{
			                        tpmm_idx: layer_pd_info.tpmm_idx,
			                        tpsm_idx: layer_pd_info.tpsm_idx,
			                        tsmi_idx: layer_pd_info.tsmi_idx,
			                        pd_amount: layer_pd_info.pd_amount,
			                        cnt: layer_pd_info.cnt
			                }];
							$.ajax({
		                        url: '/quickOrder/rest/cart/save',
		                        type: 'post',
		                        cache: false,
		                        data: JSON.stringify({cart_list: req_data}),
		                        dataType: 'json',
		                        contentType: 'application/json',
		                        success: function (data) {
		                            if (data.rtn_cd == '200') {
		                                location.replace('/m/basket_cart/list');
		                            } else {								   			
		                                alert(data['rtn_msg']);
		                            }
		                            proc_state = true;
		                        }
		                    });
						}
					}else{
						alert("처리중 입니다. 잠시만 기다려 주세요.");
						return false;
					}					
				});

				$("#layer_pd_cnt").on("keyup",function(){
					let temp_pd_cnt = $(this).val();
					if(typeof(temp_pd_cnt) !='undefined' && temp_pd_cnt != '' && temp_pd_cnt !='0' ){
						layer_pd_info.cnt = temp_pd_cnt;
						layer_produdt_cart_update();
					}else{
						alert("수량을 확인해주세요.");
						return false;
					}
				});
				$(".btn_set_cnt").on("click",function(){					
					let layer_pd_cnt = $(this).parent().find("#cart_detail_cnt").val();					
					let layer_tpmm_idx = $(this).parent().find("#cart_tpmm_idx").val();
					let layer_tpsm_idx = $(this).parent().find("#cart_tpsm_idx").val();
					let layer_tsmi_idx = $(this).parent().find("#cart_tsmi_idx").val();
					let layer_pd_amount = $(this).parent().find("#cart_pd_amount").val();

					if(typeof(layer_pd_cnt) !='undefined'){
						let temp_view_total_amount = (layer_pd_amount*layer_pd_cnt);
						
						$("#layer_pd_cnt").val(layer_pd_cnt);
						layer_pd_info.tpmm_idx = layer_tpmm_idx;
						layer_pd_info.tpsm_idx = layer_tpsm_idx;
						layer_pd_info.tsmi_idx = layer_tsmi_idx;
						layer_pd_info.pd_amount= layer_pd_amount;
						layer_pd_info.cnt = layer_pd_cnt;
						$("#layer_pd_total_amount").text(addComma(temp_view_total_amount));
						openSheet('.sheetLayer_select_option');
					}
						
				});
			});
		</script>
	</jsp:attribute>
	
    <jsp:body>
        <div class="m_contents">
            <section class="area_top_banner cart_banenr">
                <div class="container container_full">
                    <div class="inner_wrap">
                        <div class="tx_tit">나의 장바구니</div>
                        <div class="tx_desc">모바일에서 편리하게 구매해요</div>
                    </div>
                    <img src="/resources/images/mobile/img_cart.png" alt="" class="img_obj" />
                </div>
            </section>
            <section class="area_controller">
                <div class="container">
                    <div class="row row_between">
                        <div class="col col_checkbox">
                            <label class="checkbox">
                                <input type="checkbox" class="input_checkbox" name="input_check_all" id="input_check_all"/>
                                <span class="input_shape"></span>
                                <span class="input_checkbox_name">전체선택</span>
                            </label>
                        </div>
                        <div class="col col_name_btnlist">
                            <ul>
                                <li><button type="button" class="btn_checked_delete">선택삭제</button></li>
                                <li><button type="button" class="btn_checked_order">주문하기</button></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <section class="area_goods_list">
                <div class="container">
                    <ul>
                    <c:if test="${!empty cart_list }">
                    	<c:forEach var="item" items="${cart_list}" varStatus="status">
                    		<!-- ::full case::AI_list -->
	                        <li class="goods_card">
	                            <!-- 라벨없을때 <div class="cd_head nolabels"> nolabels 추가  -->
	                            <div class="cd_head nolabels">
	                                <!--
	                                <div class="labels">
	                                    <div class="cd_label label_recom">추천상품</div>
	                                    <div class="cd_label label_discount">최대 20% 할인</div>
	                                    <div class="cd_label label_added">담은상품</div>
	                                    <div class="cd_label label_purchased">구매상품</div>
	                                </div>
	                                -->
	                                <label class="checkbox">
	                                    <input type="checkbox" class="input_checkbox" id="pd_order_chk" name="" value="Y"/>
	                                    <span class="input_shape"></span>
	                                </label>
	                            </div>
	                            <a href="#해당상품상세페이지로" class="cd_info">
	                                <div class="info_img"><div class="img_wrap"><img src="/resources/images/mobile/sample_goods_img.jpg" alt="" /></div></div>
	                                <div class="info_text">
	                                    <div class="tx_cate tx_shortening_2">[${item.cate_1_name} > ${item.cate_2_name}]</div>
	                                    <div class="tx_tit tx_shortening_2">${item.fd_product_name}</div>
	                                    <div class="tx_subinfo tx_shortening_2">${item.fd_product_standard} l {item.fd_company_info} l ${item.fd_product_unit}</div>
	                                    <div class="tx_price">
	                                        <span class="tx_p_discount_per"></span>
		                                        <span class="tx_p_discount_price"><em id="p_amount"><fmt:formatNumber value="${item.fd_product_amount * item.fd_cnt}" pattern="#,###"/></em>원</span>
		                                        <span class="tx_p_origin_price"></span>
		                                    	<%--
		                                        <span class="tx_p_discount_per"><em>99</em>%</span>
		                                        <span class="tx_p_discount_price"><em>9,999,999</em>원</span>
		                                        <span class="tx_p_origin_price"><em>9,999,999</em>원</span>
		                                         --%>
	                                    </div>
	                                </div>
	                            </a>
	                            <div class="cd_foot">
	                            	<input type="hidden" id="pd_cart_idx"  name="pd_cart_idx" value="${item.pk_idx}" />
									<input type="hidden" id="cart_tpmm_idx"  name="cart_tpmm_idx" value="${item.fk_tpmm_idx}" />
									<input type="hidden" id="cart_tpsm_idx"  name="cart_tpsm_idx" value="${item.fk_tpsm_idx}" />
									<input type="hidden" id="cart_tsmi_idx"  name="cart_tsmi_idx" value="${item.fk_tsmi_idx}" />																					
									<c:choose>
										<c:when test="${item.fd_group_type_cd eq 'PCG001' and member_event_yn eq 'Y' }">
											<input type="hidden" id="cart_pd_discount_amount"  name="cart_pd_discount_amount" value="${item.fd_product_discount_amount}" />																							
										</c:when>
										<c:otherwise>
											<input type="hidden" id="cart_pd_discount_amount"  name="cart_pd_discount_amount" value="${item.fd_product_amount}" />																							
										</c:otherwise>
									</c:choose>		
									<input type="hidden" id="cart_pd_amount"  name="cart_pd_amount" value="${item.fd_product_amount}" />
									<input type="hidden" id="cart_pd_total_amount"  name="cart_pd_total_amount" value="${item.fd_product_amount*item.fd_cnt}" />
                                     <c:if test="${item.fd_group_type_1 ne ''}">
                                     	<input type="hidden" id="cart_pd_group_type_1"  name="cart_pd_group_type_1" value="${item.fd_group_type_1}" />
                                     </c:if>
                                     <c:if test="${item.fd_group_type_1 eq ''}">
                                     	<input type="hidden" id="cart_pd_group_type_1"  name="cart_pd_group_type_1" value="${product_group_info}" />
                                     </c:if>
                                    <input type="hidden" id="cart_pd_group_type_2"  name="cart_pd_group_type_2" value="${item.fd_group_type_2}" />
                                    <input type="hidden" id="cart_pd_group_type_3"  name="cart_pd_group_type_3" value="${item.fd_group_type_3}" />
                                    <input type="hidden" id="cart_detail_cnt"  name="cart_detail_cnt" value="${item.fd_cnt}" />
                 	
	                                <button type="button" class="btn_set btn_set_cnt"><div class="op_val">${item.fd_cnt}</div><i class="op_arrow"></i></button>
	                                <a href="" class="btn_set btn_single_buy">주문하기</a>
	                            </div>
	                        </li>
                        </c:forEach>
                     </c:if>
                        <%--
                        
                        <!-- ::full case::AI_list -->
                        <li class="goods_card">
                            <!-- 라벨없을때 <div class="cd_head nolabels"> nolabels 추가  -->
                            <div class="cd_head nolabels">
                                <!--
                                <div class="labels">
                                    <div class="cd_label label_recom">추천상품</div>
                                    <div class="cd_label label_discount">최대 20% 할인</div>
                                    <div class="cd_label label_added">담은상품</div>
                                    <div class="cd_label label_purchased">구매상품</div>
                                </div>
                                -->
                                <label class="checkbox">
                                    <input type="checkbox" class="input_checkbox" />
                                    <span class="input_shape"></span>
                                </label>
                            </div>
                            <a href="#해당상품상세페이지로" class="cd_info">
                                <div class="info_img"><div class="img_wrap"><img src="/resources/images/mobile/sample_goods_img.jpg" alt="" /></div></div>
                                <div class="info_text">
                                    <div class="tx_cate tx_shortening_2">[마스크/글러브/석션 > 석션재료(팁,홀더,관련부품)] </div>
                                    <div class="tx_tit tx_shortening_2">Aluminium Suction Holder Suction Holder</div>
                                    <div class="tx_subinfo tx_shortening_2">FujiCEM 2RMGI l GC/일본 l 13.3g x 2paste</div>
                                    <div class="tx_price">
                                        <span class="tx_p_discount_per"><em>99</em>%</span>
                                        <span class="tx_p_discount_price"><em>9,999,999</em>원</span>
                                        <span class="tx_p_origin_price"><em>9,999,999</em>원</span>
                                    </div>
                                </div>
                            </a>
                            <div class="cd_foot">
                                <button type="button" class="btn_set btn_set_cnt" onclick="openSheet('.sheetLayer_select_option')"><div class="op_val">20</div><i class="op_arrow"></i></button>
                                <a href="" class="btn_set btn_single_buy">주문하기</a>
                            </div>
                        </li>
                         --%>
                    </ul>
                </div>
            </section>
            <section class="area_totalPrice">
                <div class="row row_between">
                    <div class="col col_4 col_left">
                        <div class="tx_tit">총 주문 금액</div>
                        <div class="tx_price"><em id="view_order_total_amount">0</em>원</div>
                    </div>
                    <div class="col col_8 col_right">                    	
                        <a href="#" class="btn_order"><span id="view_order_cnt">0</span>개 상품 주문하기</a>
                    </div>
                </div>
            </section>
        </div>
        <layout:MobileStoreFooterFrame />

        <div class="sheetLayer sheetLayer_bottom sheetLayer_select_option">
            <div class="sheet_content">
                <div class="sheet_inner">
                    <div class="sheet_inner_title">수량 선택</div>
                    <div class="set_amount">
                        <button type="button" class="amount_down"><img src="/resources/images/mobile/icon_minus.svg" alt="" /></button>
                        <input type="number" class="input_number" id="layer_pd_cnt" name="layer_pd_cnt" value="0" />
                        <button type="button" class="amount_up"><img src="/resources/images/mobile/icon_plus.svg" alt="" /></button>
                    </div>
                </div>
            </div>
            <div class="sheet_bottom">
                <div class="s_b_top">
                    <div class="tx_tit">상품금액</div>
                    <div class="tx_total_price"><em id="layer_pd_total_amount">0</em>원</div>
                </div>
                <button type="button" class="btn_modify_info">수정하기</button>
            </div>
            <button class="btn_closeSheet"><img src="/resources/images/intro/icon_close.png" alt="" /></button>
        </div>
        <script>
            let controller = $(".area_controller");
            let goodslist = $(".area_goods_list");
            function fixedController() {
                let current_scroll_value = $(window).scrollTop();
                if (current_scroll_value > goodslist.offset().top) {
                    controller.addClass("fixed_top").css('top', $('header').outerHeight());
                    controller.next().css("margin-top", controller.outerHeight());
                } else {
                    controller.removeClass("fixed_top").attr("style", "");
                    controller.next().attr("style", "");
                }
            }
            $(window).on("load scroll", function () {
                fixedController();
            });

            function checkedTotalPrice() {
                let checked_cnt = $('.area_goods_list input[type=checkbox]:checked').length;
                let temp_total_payment = 0;
                if( checked_cnt > 0) {
                	$("input:checkbox[id='pd_order_chk']").each(function(){
                    	if($(this).is(":checked")){
                        	let temp_amount = $(this).parent().parent().parent().find("#cart_pd_total_amount").val();
                        	if(Number(temp_amount)>0){
                        		temp_total_payment += Number(temp_amount);
                            }
                        }
                    });
                    $("#view_order_total_amount").text(addComma(temp_total_payment));
                    $("#view_order_cnt").text(addComma(checked_cnt));
                    $('.area_totalPrice').addClass('active');
                } else {
                    $('.area_totalPrice').removeClass('active');
                }
            }

            function infoClearLayerPriceInfo(){
            	 $("#view_order_total_amount").text('0');
                 $("#view_order_cnt").text('0');
                 $('.area_totalPrice').removeClass('active');
            }

            // 리스트상단 전체선택, 선택삭제, 장바구니담기
            $('.area_controller').on('click','input[name=input_check_all]', function(){
                if($(this).prop('checked')) {
                    $('.area_goods_list input[type=checkbox]').prop('checked', true);
                } else {
                    $('.area_goods_list input[type=checkbox]').prop('checked', false);
                }
                checkedTotalPrice();
            }).on('click', '.btn_checked_delete', function(){
                let checked_cnt = $('.area_goods_list input[type=checkbox]:checked').length;
                if( checked_cnt > 0) {
                    mvLayer.confirm('선택한 상품을 삭제합니다.', function(res){                        
                        if(res == true){
                        	let pd_cart_idx_list = [];
                        	$("input:checkbox[id='pd_order_chk']").each(function(){
                            	if($(this).is(":checked")){
                            		let temp_idx = $(this).parent().parent().parent().find("#pd_cart_idx").val();
                            		if(typeof(temp_idx) !='undefined' && temp_idx !=''  && temp_idx !='0'){
                            			pd_cart_idx_list.push(temp_idx);
                                    	$(this).parent().parent().parent().remove();
                                	}
                            	}
                        	});
                        	if(pd_cart_idx_list.length>0){
                        		var req_data = {
                                        pd_cart_idx_list : pd_cart_idx_list
    							};
    							
                        		$.ajax({
                                    url: "/quickOrder/rest/cart/delete",
                                    method: "POST",
                                    data : JSON.stringify(req_data),
                                    contentType: "application/json",
                                    success: function (data) {
                                    	 if (data.rtn_cd != '200') {     		                                								   			
     		                                alert(data['rtn_msg']);
     		                            }
                                    },
                                    error: function (error) {
                                        console.log(error);
                                    },
                                    complete : function() {
                                    	$('.area_totalPrice').removeClass('active');
                                    	infoClearLayerPriceInfo();
                                    }
                                });
                            }
                        }
                    });
                } else {
                    mvLayer.alert('선택한 상품이 없습니다.')
                }
            }).on('click', '.btn_checked_order', function(){
                let checked_cnt = $('.area_goods_list input[type=checkbox]:checked').length;
                if( checked_cnt > 0) {
                    // mvLayer.addCart('선택한 상품을 주문합니다.')
                    
                } else {
                    mvLayer.alert('선택한 상품이 없습니다.')
                }
            });

            // 상품개별_체크박스
            $('.goods_card input[type=checkbox]').on('click', function(){
                let check_cnt = $('.area_goods_list input[type=checkbox]').length;
                let checked_cnt = $('.area_goods_list input[type=checkbox]:checked').length;
                if( check_cnt === checked_cnt ) {
                    $('input[name=input_check_all]').prop('checked', true);
                } else {
                    $('input[name=input_check_all]').prop('checked', false);
                }
                checkedTotalPrice();
            });

            // 시트_내부작동
            let _input_layer_pd_cnt =  $('input[name=layer_pd_cnt]');
            $('.amount_down').on('click', function(){
            	let layer_pd_cnt = Number(_input_layer_pd_cnt.val());
                if( layer_pd_cnt === 0 ) return;
                let temp_total_cnt =  layer_pd_cnt -1;                
                _input_layer_pd_cnt.val(temp_total_cnt);
                layer_pd_info.cnt = temp_total_cnt;
                layer_produdt_cart_update();
            })
            $('.amount_up').on('click', function(){
                let layer_pd_cnt = Number(_input_layer_pd_cnt.val());
                if( layer_pd_cnt === 9999 ) return;
                let temp_total_cnt =  layer_pd_cnt + 1;
                _input_layer_pd_cnt.val(temp_total_cnt);
                layer_pd_info.cnt = temp_total_cnt;
                layer_produdt_cart_update();
            });

            function layer_produdt_cart_update(){
            	let temp_view_amount = layer_pd_info.cnt *layer_pd_info.pd_amount;
            	$("#layer_pd_total_amount").text(addComma(temp_view_amount));
            }

        </script>
    </jsp:body>
</layout:MobileStoreFrame>
