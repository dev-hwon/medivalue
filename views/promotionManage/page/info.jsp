<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<c:set var="check_version_info" value="2023052501"/>
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

        </script>
	</jsp:attribute>
	<jsp:body>
		<div class="evt_container">
            <section class="area_visual">
                <div class="img_wrap"
					 <c:if test="${(not empty contents.fd_header_bg_image) and (contents.fd_header_bg_image ne '')}">
						 style="background-image: url('${bgColorMap.headerBg}');"
					 </c:if>
					 <c:if test="${((empty contents.fd_header_bg_image) or (contents.fd_header_bg_image eq '')) and ((not empty contents.fd_bg_top_color) and (contents.fd_bg_top_color ne ''))}">
						 style="background-color: ${bgColorMap.headerBg}"
					 </c:if>
				>
                	<c:if test="${contents.fd_header_image_pc ne ''}">
						<img src="${contents.fd_header_image_pc}?v=${check_version_info}" alt="특별한 프로모션" />
					</c:if>
                	<%-- 
                		                <img src="https://www.medivalue.co.kr/${contents.fd_header_image_pc}?v=${check_version_info}" alt="특별한 프로모션" />
                    <img src="${contents.fd_header_image_pc}?v=${check_version_info}" alt="특별한 프로모션" />
                    --%>
                </div>
				<div class="img_wrap"
					 <c:if test="${(not empty contents.fd_middle_bg_image) and (contents.fd_middle_bg_image ne '')}">
						 style="background-image: url('${bgColorMap.midBg}');"
					 </c:if>
					 <c:if test="${((empty contents.fd_middle_bg_image) or (contents.fd_middle_bg_image eq '')) and ((not empty contents.fd_bg_mid_color) and (contents.fd_bg_mid_color ne ''))}">
						 style="background-color: ${bgColorMap.midBg}"
					 </c:if>
				>
					<%--
					<img src="https://www.medivalue.co.kr/${contents.fd_middle_image_pc}?v=${check_version_info}" alt="특별한 프로모션 안내" />
					<img src="${contents.fd_middle_image_pc}?v=${check_version_info}" alt="특별한 프로모션 안내" />
					 --%>
					 <c:if test="${contents.fd_middle_image_pc ne ''}">
					 	<img src="${contents.fd_middle_image_pc}?v=${check_version_info}" alt="특별한 프로모션 안내" />
					 </c:if>
				</div>
            </section>
            <c:if test="${!empty list_cate}">
			<section class="area_tab_menu" style="background-color: ${bgColorMap.cateBgBackColor};">
				<div class="inner">
					<div class="swiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide"><button type="button" id="btn_cate" class="btn_tab" value="all">전체</button></div>
							<c:forEach  var="item" varStatus="satat" items="${list_cate }">
								<div class="swiper-slide">
									<button type="button" class="btn_tab" id="btn_cate" value="${item.fd_cate_color}_${item.pk_idx}" style="color: ${bgColorMap.cateBgColor};">${item.fd_cate_name}</button>
									<%--
									<input type="hidden" name="cate_color" id="cate_color" value="${item.fd_cate_color}">
									 --%>
								</div>
							</c:forEach>
						</div>
					</div>
					<button type="button" class="tab_menu_prev"></button>
					<button type="button" class="tab_menu_next"></button>
				</div>
			</section>
			</c:if>
            <section class="area_main">
                <div class="inner">               
		    		<c:if test="${contents.fd_platform_type_cd == loginInfo.fd_member_type}">
	                	<c:if test="${!empty list_product}">
		                	<div class="evt_goods_list">
								<ul class="row row_gap_20 row_align_stretch" style="justify-content: ${list_product_size lt 4 ? "center" : "flex-start" }">
									<!-- sample -->
									<c:forEach var="pd_item" items="${list_product}" varStatus="status">
										<li class="col col_xs_6 col_sm_4 col_lg_3 product_area_info cate_${pd_item.fk_tppmc_idx}">
											<div class="item_wrap">
												<div class="item_img g_e_b1_p_img_">											
													<img src="${pd_item.fd_view_image}" alt="${pd_item.fd_product_name}">
												</div>
												<div class="item_info g_e_b1_p_info_">
													<div class="tx_goodsName tx_shortening_2" id="tit_${pd_item.pk_idx}">${pd_item.fd_product_name}</div>
													<div class="tx_addinfo">
														<span>${pd_item.fd_product_unit}</span>
														<span class="tx_goodsCompanyName">${pd_item.fd_company_info}</span>
													</div>
													<div class="tx_price">
														<c:if test="${pd_item.fd_view_product_amount ne '0' and pd_item.fd_view_product_amount ne ''}">
															<div class="tx_price_discountPer"><em>
																<fmt:parseNumber var="pd_rate" value="${100-((pd_item.fd_view_sale_amount/pd_item.fd_view_product_amount)*100)}" integerOnly="true" pattern=".0"/>
															</em>
																${pd_rate}%
															</div>
															<div class="tx_price_origin">
																<em>
																 <fmt:formatNumber value="${pd_item.fd_view_product_amount}" pattern="#,###"/> 
																</em>원
															</div>
														</c:if>
														
														<div class="tx_price_discount">
															<em>
																<fmt:formatNumber value="${pd_item.fd_view_sale_amount}" pattern="#,###"/>
															</em>원
														</div>
													</div>
													<div class="tx_hashtag">
														<c:if test="${!empty pd_item.tag_list}">
															<c:forEach var="pd_item_tag" items="${pd_item.tag_list}">															
																<span><c:out value="#${pd_item_tag.fd_tag_name}"></c:out></span>
															</c:forEach>
														</c:if>
													</div>
												</div>
												<div class="item_btnCart g_e_b1_p_cart">												
													<button type="button" class="btn_cart" value="${pd_item.pk_idx}_${pd_item.fk_tpmm_idx}" >장바구니 담기</button>
												</div>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
	                	</c:if>
                	</c:if>
                </div>
            </section>

			<section class="area_caution">
				<div class="img_wrap"
					 <c:if test="${(not empty contents.fd_footer_bg_image) and (contents.fd_footer_bg_image ne '')}">
						 style="background-image: url('${bgColorMap.bottomBg}');"
					 </c:if>
					 <c:if test="${((empty contents.fd_footer_bg_image) or (contents.fd_footer_bg_image eq '')) and ((not empty contents.fd_bg_bottom_color) and (contents.fd_bg_bottom_color ne ''))}">
						 style="background-color: ${bgColorMap.bottomBg}"
					 </c:if>
				>
					<%--
					<img src="https://www.medivalue.co.kr/${contents.fd_footer_image_pc}?v=${check_version_info}" alt="특별한 프로모션 설명" />
					<img src="${contents.fd_footer_image_pc}?v=${check_version_info}" alt="특별한 프로모션 설명" />
					 --%>
					 <c:if test="${contents.fd_footer_image_pc ne ''}">
					 	<img src="${contents.fd_footer_image_pc}?v=${check_version_info}" alt="특별한 프로모션 설명" />
					 </c:if>
				</div>
			</section>

			<!-- 장바구니 레이어 -->
			<div class="layer_add_cart">
				<div class="dimm"></div>
				<div class="inner_wrap">
					<div class="lay_header">
						<div class="tx_maker" id="layer_popup_company_info">제조사</div>
						<div class="tx_tit" id="layer_popup_product_name">제품명</div>
					</div>
					<div class="lay_body">
						<div class="select_list layer_option_info"></div>						
						<div class="selected_options"></div>
					</div>
					<div class="lay_footer">
						<div class="total">
							<div class="tx_total">총 상품금</div>
							<div class="tx_total_price"><em id="view_cart_amount">0</em>원</div>
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
		  	$(document).ready(function (){
		  		$(document).ready(function (){
					let page_logoin_check = '${contents.fd_view_type_cd}';
					let page_access
		    		if(page_logoin_check == 'Member'){
		    			if ('${member_yn}' != 'Y'){
		        			alert("로그인 후 사용 가능합니다.");
		        			location.replace('/access/login?req_page='+window.location.href);
		        			return false;
						}
		    		}
					<c:if test="${contents.fd_platform_type_cd != loginInfo.fd_member_type}">
						alert("이벤트 참여 대상이 아닙니다.");
						location.replace('/index');
						return;
		    		</c:if>
		  		});
		  	});
        	
			let group_idx = "";
	    	let select_group_type_1 = "";
	    	let select_group_type_2 = "";
	    	let select_group_type_3 = "";

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
	        $(document).ready(function (){
					$("button[id^='btn_cate']").on("click",function(){
						let btn_value = $(this).val().split("_")[0];
						let btn_cate_idx = $(this).val().split("_")[1];
						$(".product_area_info").each(function(){
							$(this).hide();
						});
						if(btn_value != 'all'){
							//$(".area_tab_menu").css("backgroundColor",btn_value);							
							$(".cate_"+btn_cate_idx).show();
						}else{
							$(".product_area_info").each(function(){
								$(this).show();
							});
						}
					});
					$(document).on("click","button[id='btn_layer_popup_product_del']",function(){
						$(this).parent().remove();
						view_popup_total_amount();
					});
	
	                /* 장바구니 버튼 */
					$(".btn_cart").on("click", function(){
						var login_check = js_login_check_cart_btn();
						
						if(login_check){
							let req_idx = $(this).val().split("_")[0];
							let tpmm_idx = $(this).val().split("_")[1];
							
							let pd_title = $(this).parent().parent().find(".tx_goodsName").text();
							let pd_company = $(this).parent().parent().find(".tx_goodsCompanyName").text();
							let data_form = {tpmm_idx : tpmm_idx,req_idx:req_idx};
							$(".selected_options").empty();
							$(".layer_option_info").empty();
							$.ajax({
								url: '/promotion/page/rest/product_info',
								type: 'post',
								cache: false,
								data: data_form,
								dataType: 'json',
								success: function (data) {
									if(data.rtn_cd == '200'){
										if(data.list_product_size>0){
											let dy_html_select = "";
											let temp_group_area_cnt = data.check_group;
											dy_html_select+="<div class=\"select_box\">";
												dy_html_select+="<div class=\"selected\" id=\"pd_group_type_1\">규격선택</div>";
													dy_html_select+="<ul class=\"pd_group_type_1_area\">";
														$.each(data.list_product, function(idx, val) {
															dy_html_select+="<li>";
																dy_html_select+="<input type=\"hidden\" name=\"group_type_1_name\"  id=\"group_type_1_name\" value=\""+val.group_type_1+"\">";
																dy_html_select+="<input type=\"hidden\" name=\"group_type_1_idx\" id=\"group_type_1_idx\" value=\""+val.group_tpmm_idx+"\">";
																dy_html_select+="<button type=\"button\" id=\"btn_group_idx\" value=\""+val.group_tpmm_idx+"\">";
																	dy_html_select+=(val.group_type_1);
																dy_html_select+="</button>";
															dy_html_select+="</li>";
														});
												dy_html_select+="</ul>";
											dy_html_select+="</div>";
											if(temp_group_area_cnt>1){
												for(var i=1;i<temp_group_area_cnt;i++){
													dy_html_select+="<div class=\"select_box\">";
														dy_html_select+="<div class=\"selected\" id=\"pd_group_type_"+(i+1)+"\">규격선택</div>";
															dy_html_select+="<ul class=\"pd_group_type_"+(i+1)+"_area\">";														
																	dy_html_select+="<li>";
																		dy_html_select+="<button type=\"button\" id=\"btn_group_idx\" value=\"\">";
																			dy_html_select+=("규격선택");
																		dy_html_select+="</button>";
																	dy_html_select+="</li>";
														dy_html_select+="</ul>";
													dy_html_select+="</div>";
												}
											}
											$(".layer_option_info").html(dy_html_select);
											$("#layer_popup_product_name").text(pd_title);
											$("#layer_popup_company_info").text(pd_company);
											$('.layer_add_cart').fadeIn();
										}
									}else{
										alert(data.rtn_msg);
									}
								}
							});							
						}
					});
	
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
							rtn_login_check = false;
						}
						return rtn_login_check;
					}
	    	});
	      	let lsit_cate_size = Number('${list_cate_size}');
	      	let tab_menu_swiper_state  = true;
	      	if(lsit_cate_size<3){
	      		tab_menu_swiper_state = false;
		    } 
			const tab_menu = new Swiper(".area_tab_menu .swiper", {
				loop: tab_menu_swiper_state,
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

			function product_option_view(this_obj, data, option_type){
   				if($(this_obj).parent().parent().parent().parent().find(option_type).length>0){
   					$(this_obj).parent().parent().parent().parent().find(option_type).parent().find("ul").empty();
	   				var dy_html_select = "";
	   				//dy_html_select+="<ul>";
	   				if(option_type == '#pd_group_type_2'){
							$.each(data.standard_list, function(idx, val) {
								dy_html_select+="<li>";
									dy_html_select+="<input type=\"hidden\" name=\"group_type_2_name\"  id=\"group_type_2_name\" value=\""+val.fd_group_type_2+"\">";
									dy_html_select+="<input type=\"hidden\" name=\"group_type_2_idx\" id=\"group_type_2_idx\" value=\""+group_idx+"\">";
									dy_html_select+="<button type=\"button\" id=\"btn_group_idx\" value=\""+group_idx+"\">";
										dy_html_select+=(val.fd_group_type_2);
									dy_html_select+="</button>";
								dy_html_select+="</li>";
							});						
	   				}else if(option_type == '#pd_group_type_3'){
						$.each(data.standard_list, function(idx, val) {
							dy_html_select+="<li>";
								dy_html_select+="<input type=\"hidden\" name=\"group_type_3_name\"  id=\"group_type_3_name\" value=\""+val.fd_group_type_3+"\">";
								dy_html_select+="<input type=\"hidden\" name=\"group_type_3_idx\" id=\"group_type_3_idx\" value=\""+group_idx+"\">";
								dy_html_select+="<button type=\"button\" id=\"btn_group_idx\" value=\""+group_idx+"\">";
									dy_html_select+=(val.fd_group_type_3);
								dy_html_select+="</button>";
							dy_html_select+="</li>";
						});

   					}
	   				//dy_html_select+="</ul>";
	   				$(this_obj).parent().parent().parent().parent().find(option_type).parent().find("ul").append(dy_html_select);
	   			}
			}
			
			$("body").on('click', " .btn_confirm_add_Cart", function(){				
				var cart_list = new Array() ;
				let product_cart_cnt = 0;
				let temp_title = "";
				$("div.selected_option").each(function(){
					var data = new Object();
					if(temp_title==''){
						temp_title =  $(this).find(".selected_option_name").text();
					} 
					let temp_fk_tpmm_idx = $(this).find("input[id='fk_tpmm_idx']").val();
					let temp_pd_amount = $(this).find("input[id='pd_amount']").val();					
					let temp_cnt = $(this).find("input[id='amount']").val();

					data.tpmm_idx = temp_fk_tpmm_idx;
					pd_amount = temp_pd_amount;
					data.cnt = temp_cnt;
					cart_list.push(data);
					product_cart_cnt++;
				});
				if(product_cart_cnt>0){
					$.ajax({
						url : '/quickOrder/rest/cart/save',
						type : 'post',
						cache : false,
						data : JSON.stringify({cart_list: cart_list}),
						dataType : 'json',
	                    contentType: 'application/json',
					   	success:function(data){
					   		if(data.rtn_cd == '200'){
	                            popAlarm_renew(temp_title, product_cart_cnt, data['basket_list_size']);
	                            $('.layer_add_cart').fadeOut();
					   		}else{
					   			alert(data.rtn_msg);
					   		}
					   	},
					   	error:function(request,status,error){
					        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				}else{
					alert("제품 정보를 확인해주세요.");
					return false;
				}
			});
			$("body").on('click', ".btn_cancel_add_cart, .layer_add_cart .dimm", function(){
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
				//let _value = $(this).val();
				let _text = $(this).text();				
				let _value = $(this).val();				
				let _selectbox = $(this).parents('.select_box');
				_selectbox.removeClass('active');
				_selectbox.find('.selected').text(_text);
				/*
					영역 만들기
				*/				
				if(_value !=''){					
					let click_area = $(this).parent().parent().parent().find("div").attr("id");
					if(click_area == 'pd_group_type_1'){
						var temp_group_name = $(this).parent().find("#group_type_1_name").val();
						var temp_pd_group_idx = $(this).parent().find("#group_type_1_idx").val();						
						group_idx = temp_pd_group_idx;
						select_group_type_1 = temp_group_name;

						$(".pd_group_type_2_area").empty();
						$("#pd_group_type_2").text("규격선택");
						$(".pd_group_type_3_area").empty();
						$("#pd_group_type_3").text("규격선택");
												
						if(typeof(temp_group_name) != 'undefined' &&  temp_group_name !='' && typeof(temp_pd_group_idx) != 'undefined' && temp_pd_group_idx != ''){
							var req_data = {req_group_type_value_1 : temp_group_name , req_pd_group_idx : temp_pd_group_idx , req_type:"type_2"};
							var this_obj = $(this);
							$.ajax({
								url : '/quickOrder/rest/groupProduct/info',
								type : 'post',
								cache : false,
								data : req_data,
								async: false,
								dataType : 'json',
							   	success:function(data){
							   		if(data.rtn_cd == '200'){
						   				if(data.standard_list != 'undefined' && data.standard_list.length>0){
						   					if($(".pd_group_type_2_area").length>0){
							   					product_option_view(this_obj, data, "#pd_group_type_2");
								   			}else{
								   				let dy_html = select_area_info(data);
							   					$(".selected_options").append(dy_html);
							   					view_popup_total_amount();
									   		}
						   				}else{
						   					let dy_html = select_area_info(data);
						   					$(".selected_options").append(dy_html);
						   					view_popup_total_amount();
							   			}
							   		}
							   	},
							   	error:function(request,status,error){
							        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}
							});
						}						
					}else if(click_area == 'pd_group_type_2'){
						var temp_group_1 = select_group_type_1;
						var temp_group_2 = $(this).parent().find("#group_type_2_name").val();
						var temp_pd_group_idx = group_idx						
						select_group_type_2 = temp_group_2;

						$(".pd_group_type_3_area").empty();
						$("#pd_group_type_3").text("규격선택");
						
						if(typeof(temp_group_1) == 'undefined' ||  temp_group_1 ==''){
							alert("새로고침 후 다시 시도해주세요.");
							return false;
						}else if(typeof(temp_pd_group_idx) == 'undefined' || temp_pd_group_idx == ''){
							alert("새로고침 후 다시 시도해주세요.");
							return false;
						}else if(typeof(temp_group_2) == 'undefined' ||  temp_group_2 ==''){
							alert("새로고침 후 다시 시도해주세요.");
							return false;
						}else{
							var req_data = {req_group_type_value_1 : temp_group_1 , req_group_type_value_2 : temp_group_2 ,req_pd_group_idx : temp_pd_group_idx ,req_type:"type_3"};
							var this_obj = $(this);
							$.ajax({
								url : '/quickOrder/rest/groupProduct/info',
								type : 'post',
								cache : false,
								data : req_data,
								async: false,
								dataType : 'json',
							   	success:function(data){
							   		if(data.rtn_cd == '200'){
						   				if(data.standard_list != 'undefined' && data.standard_list.length>0){
							   				if($(".pd_group_type_3_area").length>0){
							   					product_option_view(this_obj, data, "#pd_group_type_3");
								   			}else{
								   				let dy_html = select_area_info(data);
							   					$(".selected_options").append(dy_html);
							   					view_popup_total_amount();
									   		}
						   				}else{
						   					let dy_html = select_area_info(data);
						   					$(".selected_options").append(dy_html);
						   					view_popup_total_amount();
							   			}
							   		}
							   	},
							   	error:function(request,status,error){
							        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}
							});
						}
					}else if(click_area == 'pd_group_type_3'){
						var temp_group_1 = select_group_type_1;
						var temp_group_2 = select_group_type_2;
						var temp_group_3 = $(this).parent().find("#group_type_3_name").val();
						var temp_pd_group_idx = group_idx		
						select_group_type_3 = temp_group_3;				
						if(typeof(temp_group_1) == 'undefined' ||  temp_group_1 ==''){
							alert("새로고침 후 다시 시도해주세요.");
							return false;
						}else if(typeof(temp_pd_group_idx) == 'undefined' || temp_pd_group_idx == ''){
							alert("새로고침 후 다시 시도해주세요.");
							return false;
						}else if(typeof(temp_group_2) == 'undefined' ||  temp_group_2 ==''){
							alert("새로고침 후 다시 시도해주세요.");
							return false;
						}else{
							var req_data = {req_group_type_value_1 : temp_group_1 , req_group_type_value_2 : temp_group_2 ,req_pd_group_idx : temp_pd_group_idx ,req_type:"type_3"};
							var this_obj = $(this);
							$.ajax({
								url : '/quickOrder/rest/groupProduct/info',
								type : 'post',
								cache : false,
								data : req_data,
								async: false,
								dataType : 'json',
							   	success:function(data){
							   		if(data.rtn_cd == '200'){						   			
					   					let dy_html = select_area_info(data);
					   					$(".selected_options").append(dy_html);
					   					view_popup_total_amount();
							   		}
							   	},
							   	error:function(request,status,error){
							        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}
							});
						}
					}
				}
			});

			// 갯수
			$(document).on('click','.amount_down',function(){
				let _input_amount = $(this).parents('.set_amount').find('input[name=amount]');
				let amount = _input_amount.val();
				if( amount > 0 ) {
					_input_amount.val(amount - 1);
					
				};
				if( amount <= 0 ) {
					_input_amount.val(1);
				}

				if(_input_amount.val()>0){
					let temp_pd_amount = Number($(this).parent().parent().find("#pd_amount").val());
					let temp_pd_amount_total = temp_pd_amount*_input_amount.val();
					$(this).parent().parent().parent().parent().find("#cart_info_amount").text(numberWithCommas(temp_pd_amount_total));
					view_popup_total_amount();
				}
				
			});
			
			$(document).on('click','.amount_up',function(){
				let _input_amount = $(this).parents('.set_amount').find('input[name=amount]');
				let amount = _input_amount.val();
				if( amount < 9999 ) {
					_input_amount.val(+amount + 1);
				
				};
				if(_input_amount.val()>0){
					let temp_pd_amount = Number($(this).parent().parent().find("#pd_amount").val());
					let temp_pd_amount_total = temp_pd_amount*_input_amount.val();
					$(this).parent().parent().parent().parent().find("#cart_info_amount").text(numberWithCommas(temp_pd_amount_total));
					view_popup_total_amount();
				}
			});
			$(document).on('keyup','input[name=amount]',function(){
			//$('input[name=amount]').on('input', function(){
				let amount = $(this).val()
				if( amount < 0 ) {
					$(this).val(1)
				}
				if( amount > 9999 ) {
					$(this).val(9999)
				}
				if($(this).val()>0){
					let temp_pd_amount = Number($(this).parent().parent().find("#pd_amount").val());
					let temp_pd_amount_total = temp_pd_amount*$(this).val();
					$(this).parent().parent().parent().parent().find("#cart_info_amount").text(numberWithCommas(temp_pd_amount_total));
					view_popup_total_amount();
				}
			});

			function view_popup_total_amount(){
				let temp_total_amount = 0;
				$("div.selected_option").each(function(){
  					let temp_cnt = $(this).find("input[name='amount']").val();
  					let temp_amount = $(this).find("input[name='pd_amount']").val();
  					temp_total_amount = (temp_total_amount+(temp_cnt*temp_amount));
				});
				$("#view_cart_amount").text(numberWithCommas(temp_total_amount));
			}
			
			function select_area_info(data){
				let check_dy_html =true;
				let dy_html  = "";
				let select_fk_tpmm_idx = data.item.pk_idx;
				$("div.selected_option").each(function(){
					let temp_fk_tpmm_idx = $(this).find("input[id='fk_tpmm_idx']").val();
					if(temp_fk_tpmm_idx == select_fk_tpmm_idx){
						check_dy_html = false;
						return false;
					}
				});
				
				if(check_dy_html){					
					dy_html+="<div class=\"selected_option\">";
						dy_html+="<div class=\"row row_align_end\">";
							dy_html+="<div class=\"col col_6\">";
								let temp_product_name = '';
								if(data.item.fd_group_type_1 !=''){
									temp_product_name = data.item.fd_group_type_1+" "+data.item.fd_group_type_2+ " "+data.item.fd_group_type_3;
								}else{
									temp_product_name = data.item.fd_product_standard;
								}
								dy_html+="<div class=\"selected_option_name tx_shortening_1\">"+temp_product_name+"</div>";
								dy_html+="<div class=\"select\">";
									dy_html+="<div class=\"set_amount\">";
										dy_html+="<input type=\"hidden\" name=\"fk_tpmm_idx\" id=\"fk_tpmm_idx\" value=\""+select_fk_tpmm_idx+"\">"
										dy_html+="<input type=\"hidden\" name=\"pd_amount\" id=\"pd_amount\" value=\""+data.item.shop_product_amount+"\">"
										dy_html+="<button type=\"button\" class=\"amount_down\"><img src=\"/resources/images/event/icon_minus.svg\" alt=\"\" /></button>";
										dy_html+="<input type=\"number\" class=\"input_number\" name=\"amount\" value=\"1\" min=\"1\" max=\"9999\" />";
										dy_html+="<button type=\"button\" class=\"amount_up\"><img src=\"/resources/images/event/icon_plus.svg\" alt=\"\" /></button>";
									dy_html+="</div>";
								dy_html+="</div>";
							dy_html+="</div>";
							dy_html+="<div class=\"col col_6\">";
								dy_html+="<div class=\"tx_price\"><em id=\"cart_info_amount\">"+numberWithCommas(data.item.shop_product_amount)+"</em>원</div>";
							dy_html+="</div>";
						dy_html+="</div>";
						dy_html+="<button type=\"button\" id=\"btn_layer_popup_product_del\" class=\"btn_selected_option_delete\"><img src=\"/resources/images/event/icon_close.jpg\" /></button>";
					dy_html+="</div>";
				}
				
				return dy_html;
			}			
		</script>
		
	</jsp:body>
</layout:basicFrame>
