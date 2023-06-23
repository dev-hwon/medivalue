<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript" src="/resources/js/sub.js"></script>
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script type="text/javascript">
			var li_cnt = 1;
			var proc_state = true;
			var signInPopup = {
					showMessage: function (msg) {
						$("#pop_alarm_msg").html(msg);
						$("#black").show();
						$(".popup_message_type_1").show();
					}
				}

			$(document).ready(function (){

				let view_log = {
					'name': '${info.fd_product_name}', 		// ex. ‘Hygiene Mask Set’
					'id': '${info.pk_idx}', 		// ex. ‘1781’
					'price': '${info.fd_product_amount}', 		// ex. ‘13800’
					'category': '${info.cate_1_name}/' + '${info.cate_2_name}', 	//ex. ‘위생/소독/멸균’
					'brand': '${info.fd_company_info}'
				}

				labbit_view_item(view_log);

				if($(".subbxslider1").length>0){
					$(".subbxslider1").bxSlider({
						auto : true,
						autoHover : true,
						autoControls : false,
						pause: 4000,
						controls : true,
						pager: false,
						touchEnabled : false
					});	
				}

				if($(".subbxslider2").length>0){
					$(".subbxslider2").bxSlider({
						auto : true,
						autoHover : true,
						autoControls : false,
						pause: 4000,
						controls : true,
						pager: false,
						touchEnabled : false
					});
				}

				if($(".subbxslider3").length>0){
					$(".subbxslider3").bxSlider({
						auto : true,
						autoHover : true,
						autoControls : false,
						pause: 4000,
						controls : true,
						pager: false,
						touchEnabled : false
					});
				}

				if($(".subbxslider4").length>0){
					$(".subbxslider4").bxSlider({
						auto : true,
						autoHover : true,
						autoControls : false,
						pause: 4000,
						controls : true,
						pager: false,
						touchEnabled : false
					});
				}

				/* 이미지 링크 작업 시작 */
				var $sRimgA1=$("div.recom1 ul.depth1 li a");
				$sRimgA1.on({
					"mouseenter":function  () {
						$(this).find(".wish_wrap").stop().animate({"bottom":"0"}, function  () {
							//$(this).parents("a").removeAttr("onclick")
							$sRimgA1.attr("onclick","return false");
						});
					},
					"mouseleave":function  () {
						$(this).find(".wish_wrap").stop().animate({"bottom":"-75px"});
					},
					"click":function  (e) {
						e.stopPropagation();
						var temp_loc_info = e.target.id;
						if(temp_loc_info == 'pd_img_info'){
							$sRimgA1.removeAttr("onclick");	
						}else{
							$sRimgA1.attr("onclick","return false");
						}
					}
				});

				var $sRimgA2=$("div.recom2 ul.depth1 li a");
				$sRimgA2.on({
					"mouseenter":function  () {
						$(this).find(".wish_wrap").stop().animate({"bottom":"0"}, function  () {
							//$(this).parents("a").removeAttr("onclick")
							$sRimgA2.attr("onclick","return false");
						});
					},
					"mouseleave":function  () {
						$(this).find(".wish_wrap").stop().animate({"bottom":"-75px"});
					},
					"click":function  (e) {
						e.stopPropagation();
						var temp_loc_info = e.target.id;
						if(temp_loc_info == 'pd_img_info'){
							$sRimgA2.removeAttr("onclick");	
							var loc_info = $(e.target).parent().parent().parent().find("a").attr("href");
							location.href=loc_info;
						}else{
							$sRimgA2.attr("onclick","return false");
						}
					}
				});

				var $sRimgA3=$("div.cnt3 .area .real_area .txt .depth1 li a");
				$sRimgA3.on({
					"mouseenter":function  () {
						$(this).find(".wish_wrap").stop().animate({"bottom":"0"}, function  () {
							//$(this).parents("a").removeAttr("onclick")
							$sRimgA3.attr("onclick","return false");
						});
					},
					"mouseleave":function  () {
						$(this).find(".wish_wrap").stop().animate({"bottom":"-75px"});
					},
					"click":function  (e) {
						e.stopPropagation();
						var temp_loc_info = e.target.id;
						if(temp_loc_info == 'pd_img_info'){
							$sRimgA3.removeAttr("onclick");	
						}else{
							$sRimgA3.attr("onclick","return false");
						}
					}
				});

				/* 이미지 링크 작업 끝 */
				$("#product_option, #product_option_sub").on("change",function(){

					let loginInfo = '${loginInfo}';

					if (loginInfo === '') {
						signInPopup.showMessage('로그인 후 확인 가능합니다.');
						$("#product_option").val('');
						return false;
					}

					li_cnt++;
					var dy_p_info = "";
					var dy_p_info_sub = "";
					var check_option = true;

					if(typeof $(this).val() != 'undefined'&&  $(this).val() != ''){
						var tpsm_idx = $(this).val().split("_")[0];
						var shop_amount = $(this).val().split("_")[1];
						var stock_sell_yn = $(this).val().split("_")[2];

						if (stock_sell_yn == 'N') {
							signInPopup.showMessage("품절된 제품입니다. 제품을 담을수 없습니다.");
							$(this).val("");
							return false;
						}

						$("ul#option_view_area > li").each(function(){
							var temp_tpms_idx = $(this).find("#tpsm_idx").val();
							if(temp_tpms_idx == tpsm_idx){
								check_option = false;
								var temp_cnt = $(this).find("#order_cnt").text();
							}
						});

						if(check_option){
							var p_info_name = $("select[name='product_option'] option:selected").text();
							dy_p_info +="<li id=\""+li_cnt+"_"+tpsm_idx+"\" class=\"pd_info_"+tpsm_idx+"\">";
								dy_p_info += "<input type=\"hidden\" name=\"tpsm_idx\" id=\"tpsm_idx\" value=\""+tpsm_idx+"\">";
								dy_p_info += "<input type=\"hidden\" name=\"shop_amount\" id=\"shop_amount\" value=\""+shop_amount+"\">";
								dy_p_info += "<button type=\"button\" class=\"delete_btn\" id=\"btn_product_detail_del\">";
									dy_p_info += "<img src=\"/resources/images/main/sub_bundle_option_delete.png\" width=\"22\" height=\"22\" border=\"0\" alt=\"삭제\">";
								dy_p_info += "</button>";
								dy_p_info += "<div class=\"total_name clear\">";
									dy_p_info += "<p>";
										dy_p_info += (p_info_name);
									dy_p_info += "</p>";
								dy_p_info += "</div>";
								dy_p_info += "<div class=\"or_wrap clear\">";
									dy_p_info += "<div class=\"quan_box clear\">";
										dy_p_info += "<button class=\"minus\" id=\"btn_order_minus\" type=\"button\">-</button>";
											dy_p_info += "<p id=\"order_cnt\" class=\"product_order_cnt\">1</p>";
										dy_p_info += "<button class=\"plus\" id=\"btn_order_plus\" type=\"button\">+</button>";
									dy_p_info += "</div>";
									dy_p_info += "<div class=\"total\">";
										dy_p_info += "<p>";
										dy_p_info += "<strong id=\"product_detail_amount\" class=\"product_amount\">";
										dy_p_info += (numberToPrice(shop_amount));
										dy_p_info += "</strong>원";
										dy_p_info += "</p>";
									dy_p_info += "</div>";
								dy_p_info += "</div>";
							dy_p_info += "</li>";
							dy_p_info_sub += "";
							dy_p_info_sub += "<div class=\"slt_box pd_info_"+tpsm_idx+"\">";
								dy_p_info_sub += "<input type=\"hidden\" name=\"tpsm_idx\" id=\"tpsm_idx\" value=\""+tpsm_idx+"\">";
								dy_p_info_sub += "<input type=\"hidden\" name=\"shop_amount\" id=\"shop_amount\" value=\""+shop_amount+"\">";
								dy_p_info_sub += "<button type=\"button\" id=\"btn_product_detail_del\" class=\"delete_btn\"><img src=\"/resources/images/main/sub_bundle_option_delete.png\" width=\"22\" height=\"22\" border=\"0\" alt=\"\" /></button>";
								dy_p_info_sub += "<div class=\"total_name clear\">";
									dy_p_info_sub += "<p>";
									dy_p_info_sub += (p_info_name);
									dy_p_info_sub += "</p>";
								dy_p_info_sub += "</div>";
								dy_p_info_sub += "<div class=\"quan_box clear\">";
									dy_p_info_sub += "<button type=\"button\" id=\"btn_order_minus\"  class=\"minus\">-</button>";
									dy_p_info_sub += "<p id=\"order_cnt\" class=\"product_order_cnt\">1</p>";
									dy_p_info_sub += "<button type=\"button\" id=\"btn_order_plus\" class=\"plus\">+</button>";
								dy_p_info_sub += "</div>";
								dy_p_info_sub += "<div class=\"total\">";
									dy_p_info_sub += "<p>";
										dy_p_info_sub += "<strong id=\"product_detail_amount\" class=\"product_amount\">";
											dy_p_info_sub += (numberToPrice(shop_amount));
										dy_p_info_sub += " 원</strong>";
									dy_p_info_sub += "</p>";
								dy_p_info_sub += "</div>";
							dy_p_info_sub += "</div>";
							$("#option_view_area").append(dy_p_info);
							$("#option_view_area_sub").append(dy_p_info_sub);
						}
						check_amount_view();
					}
				});

				/* 수량  Plus 처리 */
				$(document).on("click","button[id^='btn_order_plus']",function(){
					var now_cnt = $(this).parent().find("#order_cnt").text();
					var req_cnt = 0;
					var check_idx = $(this).parent().parent().parent().find("#tpsm_idx").val();
					if(typeof now_cnt != 'undefined' && now_cnt != ''){
						req_cnt = Number(now_cnt.replace(",",""))+1;
						//$(this).parent().find("#order_cnt").text(numberToPrice(req_cnt));
						if(req_cnt>0){
							var shop_amount = $(this).parent().parent().parent().find("#shop_amount").val();
							if(typeof shop_amount != 'undefined' && shop_amount != ''){
								//$(this).parent().parent().parent().find("#product_detail_amount").text(numberToPrice(req_cnt*shop_amount));
								//$(this).parent().parent().parent().find(".product_amount").text(numberToPrice(req_cnt*shop_amount));
								$(".pd_info_"+check_idx).find(".product_order_cnt").text(req_cnt);
								$(".pd_info_"+check_idx).find(".product_amount").text(numberToPrice(req_cnt*shop_amount));
							}
						}
						check_amount_view();
					}
				});
				/* 영역 삭제 */
				$(document).on("click","button[id^='btn_product_detail_del']",function(){
					var check_idx = $(this).parent().find("#tpsm_idx").val();
					$(".pd_info_"+check_idx).remove();
					check_amount_view();
				});

				/* 수량 Minus 처리 */
				$(document).on("click","button[id^='btn_order_minus']",function(){
					var now_cnt = $(this).parent().find("#order_cnt").text();
					var req_cnt = 0;
					var check_idx = $(this).parent().parent().parent().find("#tpsm_idx").val();
					if(typeof now_cnt != 'undefined' && now_cnt != ''){
						if(now_cnt == '1'){
							alert("최소수량은 1개입니다.");
							return;
						}
						req_cnt = Number(now_cnt.replace(",",""))-1;
						//$(this).parent().find("#order_cnt").text(numberToPrice(req_cnt));
						if(req_cnt>0){
							var shop_amount = $(this).parent().parent().parent().find("#shop_amount").val();
							if(typeof shop_amount != 'undefined' && shop_amount != ''){
								//$(this).parent().parent().parent().find("#product_detail_amount").text(numberToPrice(req_cnt*shop_amount));
								$(".pd_info_"+check_idx).find(".product_order_cnt").text(req_cnt);
								$(".pd_info_"+check_idx).find(".product_amount").text(numberToPrice(req_cnt*shop_amount));
							}
						}
						check_amount_view();
					}
				});

				$(".my_wish").on("click",function(e){
					var login_check = checkLogin();
					if(login_check){
						var tpsm_idx = '${info.pk_idx}';
						if(typeof tpsm_idx != 'undefined' && tpsm_idx !='' && tpsm_idx != '0'){
							if(proc_state){
								proc_state = false;
								var wish_state = 'N';
								if(!$(this).hasClass("on")){
									wish_state = 'Y';
								}
								 /*
								var formData = {tpsm_idx : tpsm_idx,
												wish_state : wish_state
												};
								 */
								let formData = {};
								let data_cnt = 0;
								$("ul#option_view_area > li").each(function(index){
									var temp_tpsm_idx = $(this).find("#tpsm_idx").val();
										formData['list['+index+'].tpsm_idx'] = temp_tpsm_idx;
										formData['list['+index+'].wish_yn'] = wish_state;
										data_cnt++;
								});
								if(data_cnt>0){
									$.ajax({   
										url : '/wish/rest/datail_save',
										type : 'post',
										cache : false,
										data : formData,
										dataType : 'json',
									   	success:function(data){
									   		if(data.rtn_code !='200'){
									   			$("#pop_alarm_msg").text(data.rtn_msg);
												$(".popup_message_type_1").show();
												if($(e).hasClass("on")){
													$(e).removeClass("on");
												}
									   		}else{
									   			$(".my_wish").addClass("on");
									   		}
									   		proc_state = true;
									   	},
									   	error:function(request,status,error){
									        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
									        if($(e).hasClass("on")){
												$(e).removeClass("on");
											}
									        proc_state = true;
									    }
									});
								}else{
									$("#pop_alarm_msg").text("제품 정보를 확인해주세요.");
									$(".popup_message_type_1").show();
									$("#black").show();
									proc_state = true;
									return;
								}								
							}else{
								$("#pop_alarm_msg").text("처리중입니다. 잠시만 기다려 주세요.");
								$(".popup_message_type_1").show();
								proc_state = true;
								$("#black").show();
								return;
							}
						}else{
							$("#pop_alarm_msg").text("제품을 담을수 없습니다.");
							$(".popup_message_type_1").css("display","block");
							$("#black").show();
							if($(this).hasClass("on")){
								$(this).removeClass("on");
							}
							proc_state = true;
						}
					}else{
						if($(this).hasClass("on")){
							$(this).removeClass("on");
						}
						proc_state = true;
					}
				});

				$("#btn_product_medicash_top_order").on("click", function () {
					let login_check = js_login_check_buy_btn();
					// console.log("구매하기");
					if (login_check) {

						let formData = {};
						$("ul#option_view_area > li").each(function(index){
							var temp_cnt = $(this).find("#order_cnt").text();
							var temp_tpsm_idx = $(this).find("#tpsm_idx").val();
							formData['list['+index+'].fk_tpsm_idx'] = temp_tpsm_idx;
							formData['list['+index+'].cnt'] = temp_cnt;
						});

						if (JSON.stringify(formData) === '{}') {
							signInPopup.showMessage("장바구니 담기가 불가능한 상태 입니다.<br/>제품을 확인해주세요.");
						} else {
							$.ajax({
								url: "/order/rest/medicash/info",
								type: "POST",
								// contentType: "application/json",
								accept: "*/*",
								// data: JSON.stringify(formData),
								data: formData,
								success: function (data) {
									if (data['rtn_code'] === '200') {
										location.href = '/order/info/medicash/' + data['fd_order_id'];
									} else {
										signInPopup.showMessage("");
									}
								},
								error: function (data) {
									signInPopup.showMessage("");
								}
							});
						}

					}
				});

				$("#btn_product_detail_top_order, #btn_product_detail_sub_order").on("click",function(){
					var login_check = js_login_check_buy_btn();
					if(login_check){
						var pd_cnt = $("ul#option_view_area > li").length;
						var pd_title =  $.trim($("ul#option_view_area > li").eq(0).find(".total_name").text());
						//console.log($.trim(pd_title) + " | " + pd_cnt);

						if(typeof pd_cnt != 'undefined' && pd_cnt>0 ){
							var login_check = js_login_check_buy_btn();
							if(login_check){
								let formData = {};
								$("ul#option_view_area > li").each(function(index){
									var temp_cnt = $(this).find("#order_cnt").text();
									var temp_tpsm_idx = $(this).find("#tpsm_idx").val();
									formData['list['+index+'].fk_tpsm_idx'] = temp_tpsm_idx;
									formData['list['+index+'].cnt'] = temp_cnt;
								});
								//google tag manager
								
								$.ajax({
									url : '/basket/rest/save',
									type : 'post',
									cache : false,
									data : formData,
									dataType : 'json',
								   	success:function(data){
								   		if(data.rtn_code != '200'){
								   			$("#pop_alarm_msg").text(data.rtn_msg);
											$(".popup_message_type_1").show();
								   		}else{
								   			popAlarm(pd_title, pd_cnt);
											ad_log_naver("3", "1");
											labbit_add_to_cart(data.productInfoList);
								   			setTimeout(function() { location.replace("/product/basket/list");}, 2000);
								   		}
								   		proc_state = true;
								   	},
								   	error:function(request,status,error){
								        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								        proc_state = true;
								    }
								});
							}
						}else{
							signInPopup.showMessage("장바구니 담기가 불가능한 상태 입니다.<br/>제품을 확인해주세요.");
						}
					}
				});

				$("#btn_product_detail_sub_cart, #btn_product_detail_top_cart").on("click",function(){
					var login_check = js_login_check_cart_btn();
					if(login_check){
						var pd_cnt = $("ul#option_view_area > li").length;
						var pd_title =  $.trim($("ul#option_view_area > li").eq(0).find(".total_name").text());
						//console.log($.trim(pd_title) + " | " + pd_cnt);

						if(typeof pd_cnt != 'undefined' && pd_cnt>0 ){
							var login_check = js_login_check_cart_btn();
							if(login_check){
								let formData = {};
								$("ul#option_view_area > li").each(function(index){
									var temp_cnt = $(this).find("#order_cnt").text();
									var temp_tpsm_idx = $(this).find("#tpsm_idx").val();
									formData['list['+index+'].fk_tpsm_idx'] = temp_tpsm_idx;
									formData['list['+index+'].cnt'] = temp_cnt;
								});
								//google tag manager
								
								$.ajax({
									url : '/basket/rest/save',
									type : 'post',
									cache : false,
									data : formData,
									dataType : 'json',
								   	success:function(data){
								   		if(data.rtn_code != '200'){
								   			$("#pop_alarm_msg").text(data.rtn_msg);
											$(".popup_message_type_1").show();
								   		}else{
								   			popAlarm(pd_title, pd_cnt);
											ad_log_naver("3", "1");
											labbit_add_to_cart(data.productInfoList);
								   		}
								   		proc_state = true;
								   	},
								   	error:function(request,status,error){
								        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								        proc_state = true;
								    }
								});
							}
						}else{
							signInPopup.showMessage("장바구니 담기가 불가능한 상태 입니다.<br/>제품을 확인해주세요.");
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

				/* 장바구니 버튼 */
				$(".wish_wrap .cart_btn").on("click", function(){
					var login_check = checkLogin();
					
					if(login_check){
						const pk_idx = $(this).parent().parent().find("#tpsm_idx").val();
						const product_name = $(this).parent().parent().parent().find(".pd_tit").text();
						const product_price = $(this).parent().parent().parent().find("#product_amount").text();
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

				var chk_stock_sell_yn = $("#product_option").val().split("_")[2];
				if (chk_stock_sell_yn == 'N') {
// 					signInPopup.showMessage("품절된 제품입니다. 제품을 담을수 없습니다.");
					$("#product_option, #product_option_sub").val("");
					$("#btn_product_detail_del").trigger("click");
				}

				if ($("#product_option").val() == "") {
					check_amount_view();
				}

				let urlParams = new URLSearchParams(window.location.search);
				let cart_btn = urlParams.get("cart_btn");
				let buy_btn = urlParams.get("buy_btn");
				let list = urlParams.getAll("list");

				for (let idx = 0; idx < list.length; idx++) {
					set_option(list[idx]);
				}

				// if (cart_btn) {
				// 	$("#btn_product_detail_sub_cart").trigger("click");
				// }

				if (buy_btn) {
					$("#btn_product_detail_top_order").trigger("click");
				}
			});

			/* 장바구니 담기 버튼 클릭 시 */
			function addCart(obj) {
				let pop_id = obj.parent().parent().parent().attr("id");	// cartPopup1
				
				if (pop_id == undefined) {
					pop_id = obj.parent().parent().attr("id"); // cartPopup2
				}
				
				let formData = {};
				$.each($("#" + pop_id).find(".pop_item"), function(i){
					const pk_idx = $(this).find(".pk_idx").text();
					const cnt = $(this).find(".pop_cnt").val();
					formData['list['+i+'].fk_tpsm_idx'] = pk_idx;
					formData['list['+i+'].cnt'] = cnt;
				});
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
    			   			let pd_cnt = $("#" + pop_id).find(".pop_item").length;
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
			}

			function check_amount_view(){
				var pd_cnt = 0;
				var total_amount = 0;
				$("ul#option_view_area > li").each(function(){
					var temp_cnt = $(this).find("#order_cnt").text();
					var temp_amount = $(this).find("#shop_amount").val();
					total_amount+= (temp_amount*temp_cnt);
					pd_cnt++;
				});
				$("#product_total_cnt").text(pd_cnt);
				$(".product_total_amount").text(numberToPrice(total_amount));
			}

			function js_login_check_cart_btn(){

				let location_search = location.search;
				let location_pathname = location.pathname;
				// let url = location_pathname + location_search + "&cart_btn=true";
				let url = location_pathname + location_search;
				$("ul#option_view_area > li").each(function(index){
					var temp_tpsm_idx = $(this).find("#tpsm_idx").val();
					var temp_amount = $(this).find("#product_detail_amount").text().replaceAll(",", "").replaceAll(/(\s*)/g, "");
					var temp_cnt = $(this).find("#order_cnt").text();
					url = url + "&list=" + temp_tpsm_idx + "_" + temp_amount + "_" + temp_cnt;
				});
				url = encodeURIComponent(url);
				var rtn_login_check = true;
				if ("${loginInfo}" == ""){
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

			function js_login_check_buy_btn(){

				let location_search = location.search;
				let location_pathname = location.pathname;
				let url = location_pathname + location_search + "&buy_btn=true";

				$("ul#option_view_area > li").each(function(index){
					var temp_tpsm_idx = $(this).find("#tpsm_idx").val();
					var temp_amount = $(this).find("#product_detail_amount").text().replaceAll(",", "").replaceAll(/(\s*)/g, "");
					var temp_cnt = $(this).find("#order_cnt").text();
					url = url + "&list=" + temp_tpsm_idx + "_" + temp_amount + "_" + temp_cnt;
				});
				url = encodeURIComponent(url);
				var rtn_login_check = true;
				if ("${loginInfo}" == ""){
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

			function set_option(value) {
				li_cnt++;
				var dy_p_info = "";
				var dy_p_info_sub = "";
				var check_option = true;

				if(typeof value != 'undefined' &&  value != ''){
					//idx_amount_cnt
					var tpsm_idx = value.split("_")[0];
					var shop_amount = value.split("_")[1];
					var cnt = value.split("_")[2];
					var option_value = tpsm_idx + "_" + shop_amount + "_" + "Y";
					var name = "";

					$("#product_option option").each(function(){
						let temp_value = $(this).val();
						let temp_idx = temp_value.split("_")[0];

						if (temp_idx === tpsm_idx) {
							name = $(this).text();
						}
					});

					if(check_option){
						// var p_info_name = $("select[name='product_option'] option:selected").text();
						var p_info_name = name;

						dy_p_info +="<li id=\""+li_cnt+"_"+tpsm_idx+"\" class=\"pd_info_"+tpsm_idx+"\">";
						dy_p_info += "<input type=\"hidden\" name=\"tpsm_idx\" id=\"tpsm_idx\" value=\""+tpsm_idx+"\">";
						dy_p_info += "<input type=\"hidden\" name=\"shop_amount\" id=\"shop_amount\" value=\""+shop_amount+"\">";
						dy_p_info += "<button type=\"button\" class=\"delete_btn\" id=\"btn_product_detail_del\">";
						dy_p_info += "<img src=\"/resources/images/main/sub_bundle_option_delete.png\" width=\"22\" height=\"22\" border=\"0\" alt=\"삭제\">";
						dy_p_info += "</button>";
						dy_p_info += "<div class=\"total_name clear\">";
						dy_p_info += "<p>";
						dy_p_info += (p_info_name);
						dy_p_info += "</p>";
						dy_p_info += "</div>";
						dy_p_info += "<div class=\"or_wrap clear\">";
						dy_p_info += "<div class=\"quan_box clear\">";
						dy_p_info += "<button class=\"minus\" id=\"btn_order_minus\" type=\"button\">-</button>";
						dy_p_info += "<p id=\"order_cnt\" class=\"product_order_cnt\">" + cnt + "</p>";
						dy_p_info += "<button class=\"plus\" id=\"btn_order_plus\" type=\"button\">+</button>";
						dy_p_info += "</div>";
						dy_p_info += "<div class=\"total\">";
						dy_p_info += "<p>";
						dy_p_info += "<strong id=\"product_detail_amount\" class=\"product_amount\">";
						dy_p_info += (numberToPrice(shop_amount));
						dy_p_info += "</strong>원";
						dy_p_info += "</p>";
						dy_p_info += "</div>";
						dy_p_info += "</div>";
						dy_p_info += "</li>";
						dy_p_info_sub += "";
						dy_p_info_sub += "<div class=\"slt_box pd_info_"+tpsm_idx+"\">";
						dy_p_info_sub += "<input type=\"hidden\" name=\"tpsm_idx\" id=\"tpsm_idx\" value=\""+tpsm_idx+"\">";
						dy_p_info_sub += "<input type=\"hidden\" name=\"shop_amount\" id=\"shop_amount\" value=\""+shop_amount+"\">";
						dy_p_info_sub += "<button type=\"button\" id=\"btn_product_detail_del\" class=\"delete_btn\"><img src=\"/resources/images/main/sub_bundle_option_delete.png\" width=\"22\" height=\"22\" border=\"0\" alt=\"\" /></button>";
						dy_p_info_sub += "<div class=\"total_name clear\">";
						dy_p_info_sub += "<p>";
						dy_p_info_sub += (p_info_name);
						dy_p_info_sub += "</p>";
						dy_p_info_sub += "</div>";
						dy_p_info_sub += "<div class=\"quan_box clear\">";
						dy_p_info_sub += "<button type=\"button\" id=\"btn_order_minus\"  class=\"minus\">-</button>";
						dy_p_info_sub += "<p id=\"order_cnt\" class=\"product_order_cnt\">" + cnt + "</p>";
						dy_p_info_sub += "<button type=\"button\" id=\"btn_order_plus\" class=\"plus\">+</button>";
						dy_p_info_sub += "</div>";
						dy_p_info_sub += "<div class=\"total\">";
						dy_p_info_sub += "<p>";
						dy_p_info_sub += "<strong id=\"product_detail_amount\" class=\"product_amount\">";
						dy_p_info_sub += (numberToPrice(shop_amount));
						dy_p_info_sub += " 원</strong>";
						dy_p_info_sub += "</p>";
						dy_p_info_sub += "</div>";
						dy_p_info_sub += "</div>";
						$("#option_view_area").append(dy_p_info);
						$("#option_view_area_sub").append(dy_p_info_sub);
					}
					check_amount_view();
				}
			}
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub10" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="location">
							<ul class="clear">
								<li><a href="/index">홈</a></li>
								<li><a href="#">${info.cate_1_name }</a></li>
								<li><a href="#">${info.cate_2_name }</a></li>
								<%--<li><a href="">이종골</a></li>--%>
							</ul>
						</div>
						<div class="wrap clear <c:if test="${group_list.size() > 0}">option</c:if> <c:if test="${!empty info.fd_product_insure_code}">insure</c:if> "><!-- 여기에 addClass : option, insure -->
							<div class="left">
								<div class="img <c:if test="${info.fd_event_yn eq 'Y'}">payback</c:if> <c:if test="${info.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
									<div class="icon_list">
										<div class="li li_option">
											<div>
												<div class="tit"><strong>${group_list.size() + 1}</strong>개</div>
												<div class="desc">규격선택</div>
											</div>
										</div>
										<div class="li li_insure">
											<div>
												<div class="desc">보험<br>재료</div>
											</div>
										</div>
									</div>
									<img src="${info.fd_img_path}" style="object-fit:contain;" onerror="this.src='/resources/images/dummy/483x621.png'" width="483" height="621" border="0" alt="제품 이미지" id="pd_img_info"/>
								</div>
							</div>
							<div class="right">
								<div class="name">
									<h3>${info.fd_product_name }</h3>
								</div>
								<div class="price clear">
									<h4>
										<c:if test="${loginInfo == null}">
											로그인 후 최저가 확인
										</c:if>
										<c:if test="${loginInfo != null}">
											<fmt:formatNumber value="${info.fd_product_amount}" pattern="#,###" />원
										</c:if>
									</h4>
									<strong><%-- 43% --%></strong>
								</div>
								<div class="spec">
									<ul>
										<li class="spec1 clear">
											<h5>규격</h5>
											<p>${info.fd_product_standard}</p>
										</li>
										<li class="spec1 clear">
											<h5>판매단위</h5>
											<p>${info.fd_product_unit}</p>
										</li>
										<li class="spec1 clear">
											<h5>제조사</h5>
											<p>${info.fd_company_info}</p>
										</li>
										<c:if test="${!empty info.fd_product_insure_code}">
										<li class="spec1 clear">
											<h5>보험코드</h5>
											<p>${info.fd_product_insure_code}</p>
										</li>
										</c:if>
										<li class="spec2 clear">
											<h5>배송구분</h5>
											<p>일반배송</p>
										</li>
										<%--
										<li class="spec2 clear">
											<h5>제조사</h5>
											<p>치예원 • 닥터다니엘</p>
										</li>
										<li class="spec2 clear">
											<h5>배송구분</h5>
											<p>일반배송</p>
										</li>
										 --%>
									</ul>
								</div>

								<div class="option_wrap">
									<h4>옵션선택</h4>
									<select name="product_option" id="product_option" class="ow1">
										<option value="">제품정보를 선택해주세요.</option>
										<c:if test="${!empty group_list}">
											<c:choose>
												<c:when test="${info.fd_stock_sell_yn eq 'N'}"><c:set var="sotxt" value="[품절]"/></c:when>
												<c:otherwise><c:set var="sotxt" value=""/></c:otherwise>
											</c:choose>
											<option value="${info.pk_idx}_${info.fd_product_amount}_${info.fd_stock_sell_yn}">${sotxt} ${info.fd_product_name} ${info.fd_product_standard} ${info.fd_product_unit}</option>
											<c:forEach var="item" items="${group_list}" varStatus="state">
												<c:choose>
													<c:when test="${item.fd_stock_sell_yn eq 'N'}"><c:set var="sotxt" value="[품절]"/></c:when>
													<c:otherwise><c:set var="sotxt" value=""/></c:otherwise>
												</c:choose>
												<option value="${item.fk_tpsm_group_idx}_${item.fd_product_amount}_${item.fd_stock_sell_yn}">${sotxt} ${item.view_product_name} ${item.fd_product_standard} ${item.fd_product_unit}</option>
											</c:forEach>
										</c:if>
										<c:if test="${empty group_list}">
											<c:choose>
												<c:when test="${info.fd_stock_sell_yn eq 'N'}"><c:set var="sotxt" value="[품절]"/></c:when>
												<c:otherwise><c:set var="sotxt" value=""/></c:otherwise>
											</c:choose>
											<option value="${info.pk_idx}_${info.fd_product_amount}_${info.fd_stock_sell_yn}" selected="selected">${sotxt} ${info.fd_product_name} ${info.fd_product_standard} ${info.fd_product_unit}</option>
										</c:if>
									</select>
									<%--
									<select name="" id="" class="ow2">
										<option value="">제품명_용량_규격</option>
										<option value="">1</option>
										<option value="">2</option>
										<option value="">3</option>
										<option value="">4</option>
									</select>
									 --%>
								</div>

								<div class="option_result">
									<ul id="option_view_area">
										<c:if test="${empty group_list}">
											<li id="1_${info.pk_idx}" class="pd_info_${info.pk_idx}">
												<input type="hidden" name="tpsm_idx" id="tpsm_idx" value="${info.pk_idx}">
												<input type="hidden" name="shop_amount" id="shop_amount" value="${info.fd_product_amount}">
												<button type="button" class="delete_btn" id="btn_product_detail_del">
													<img src="/resources/images/main/sub_bundle_option_delete.png" width="22" height="22" border="0" alt="삭제" />
												</button>
												<div class="total_name clear">
													<p>${info.fd_product_name} ${info.fd_product_standard} ${info.fd_product_unit }
													</p>
												</div>
												<div class="or_wrap clear">
													<div class="quan_box clear">
														<button class="minus" id="btn_order_minus" type="button">-</button>
														<p id="order_cnt" class="product_order_cnt">1</p>
														<button class="plus" id="btn_order_plus" type="button">+</button>
													</div>
													<div class="total">
														<c:if test="${loginInfo == null}">
															<p>로그인 후 최저가 확인</p>
														</c:if>
														<c:if test="${loginInfo != null}">
														<p><strong id="product_detail_amount" class="product_amount">
															<fmt:formatNumber value="${info.fd_product_amount}" pattern="#,###" />
														</strong>원</p>
														</c:if>
													</div>
												</div>
											</li>
										</c:if>
									</ul>
								</div>
	
								<div class="result clear">
									<div class="total clear">
										<h5>총 상품금액</h5>
										<p>
											<c:if test="${loginInfo == null}">
												로그인 후 최저가 확인
											</c:if>
											<c:if test="${loginInfo != null}">
											<strong class="product_total_amount">
												<c:if test="${empty group_list}">
													<fmt:formatNumber value="${info.fd_product_amount}" pattern="#,###" />
												</c:if>
											</strong>
											원
											</c:if>
										</p>
									</div>
								</div>

								<c:choose>
									<c:when test="${info.fk_cate_1_idx == 213 && info.fk_cate_2_idx == 214}">
										<div class="btn_wrap clear">
											<button type="button" class="buy_btn" id="btn_product_medicash_top_order">구매하기</button>
										</div>
									</c:when>
									<c:otherwise>
										<div class="btn_wrap clear">
											<button type="button" class="buy_btn" id="btn_product_detail_top_order">바로 구매하기</button>
											<button type="button" class="cart_btn" id="btn_product_detail_top_cart">장바구니 담기</button>
											<button type="button" class="wish_btn my_wish" id="btn_product_detail_wish"></button>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</article>
			<c:if test="${!empty p_rc_list}">
				<article class="cnt2 noti">
					<div class="area">
						<div class="real_area">
							<div class="tit">
								<h3>Related Item</h3>
								<p>이 제품과 연관된 제품이에요!</p>
							</div>		
							<div class="txt">
								<ul class="depth1 subbxslider1">
									<c:set var="view_cnt" value="4"/>
									<c:forEach var="item" items="${p_rc_list}" varStatus="state">
										<c:if test="${state.first }">
											<li>
												<ul class="depth2 clear">
										</c:if>
											<li>
												<a href="/product/detail.do?req_view_idx=${item.fk_tpsm_idx}" target="_self">
													<div class="img">
														<input type="hidden" name="tpsm_idx" id="tpsm_idx" value="${item.fk_tpsm_idx }">
														<input type="hidden" name="shop_product_amount" id="shop_product_amount" value="${item.shop_product_amount }">
														<img src="${item.view_image}" onerror="this.src='/resources/images/dummy/250x321.png'" width="250" height="321" border="0" alt="제품이미지" id="pd_img_info"/>
														<div class="wish_wrap">
															<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>
													<div class="info">
														<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name} ${item.fd_product_standard}</h4>
														<div class="price clear">
															<%--<strong class="percent">10%</strong>--%>
															<p id="product_amount"><fmt:formatNumber value="${item.shop_product_amount}" pattern="#,###" />원</p>
														</div>
														<div class="cost"><%-- <p>0,000,000원</p>--%></div>
													</div>
												</a>
											</li>
											<c:if test="${(state.index % view_cnt == view_cnt-1) and !state.last and !state.first}">
												</ul>
											</li>
											<li>
												<ul class="depth2 clear">
											</c:if>
											<c:if test="${state.last}">
												</ul>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</article>
			</c:if>
			<article class="cnt3">
				<div class="area">
					<div class="real_area clear">
						<div class="left">
							<div class="detail_info">
								<div class="info_split" id="tab1">
									<div class="info_btn_area">
										<ul class="info_btn clear">
											<li class="first info_btn1 on"><button type="button" href="#tg1">제품설명</button></li>
											<li class="info_btn2"><button type="button" href="#tg2">제품영상</button></li>
											<li class="info_btn3"><button type="button"href="#tg3">제품정보</button></li>
										</ul>
									</div>
									<div class="info_cnt info_cnt_sp">
										<c:set var="view_page_id" value="tg1"/>
										<c:if test="${!empty contents_list  }">
											<ul class="depth1">
												<c:if test="${info.fd_event_yn eq 'Y'}">
													<div class="prd_banner">
														<img src="/resources/images/sub/img_detail_payback.jpg" alt="" />
													</div>
												</c:if>
												<c:if test="${info.fd_custom_use_point_yn eq 'Y'}">
													<div class="prd_banner">
														<img src="/resources/images/sub/img_detail_smallequipment.jpg" alt="" />
													</div>
												</c:if>
												
												<!-- PAYBACK 일 떄 노출 START -->
													<%-- <li class="depth1_li0">
														<div class="prd_banner">
															<img src="/resources/images/sub/img_detail_payback.jpg" alt="" />
														</div>
													</li>
													<li class="depth1_li0">
														<div class="prd_txt">
															<p class="tit">Total Haenaem Bur Kit Total Haenaem Bur Kit Total Haenaem Bur Kit</p>
														</div>
													</li>
													<li class="depth1_li0">
														<div class="prd_img">
															<img src="${info.fd_img_path}" onerror="this.src='/resources/images/dummy/483x621.png'"alt="제품 이미지" />
														</div>
													</li>
													<li class="depth1_li0">
														<div class="prd_info">
															<ul>
																<li class="clear">
																	<h4>제품명</h4>
																	<p>${info.fd_product_name}</p>
																</li>
				
																<li class="clear">
																	<h4>제조사</h4>
																	<p>${info.fd_company_info}</p>
																</li>
				
																<li class="clear">
																	<h4>규격</h4>
																	<p>${info.fd_product_standard}</p>
																</li>
				
																<li class="clear">
																	<h4>포장단위</h4>
																	<p>${info.fd_product_unit}</p>
																</li>
															</ul>
														</div>
													</li> --%>
												<!-- PAYBACK 일 떄 노출 END -->
											<c:forEach var="item" items="${contents_list}" varStatus="state">
												<c:set var="view_contetns" value="${item.fd_contents}"/>
												<c:choose>
													<c:when test="${item.fd_type eq 'image'}">
														<li class="depth1_li0" id="tg1">
															<div class="img" align="center">
																<img src="${view_contetns}" onerror="this.src='/resources/images/dummy/644x413.png'" width="644" border="0" alt="">
															</div>
														</li>
													</c:when>
													<c:when test="${item.fd_type eq 'video'}">
														<li class="depth1_li0" id="tg2">
															<div class="video">
																<p style="height: 400px;">
																	<iframe src="${view_contetns}" width="100%" height="100%" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>
																</p>
															</div>
														</li>
													</c:when>
													<c:when test="${item.fd_type eq 'default'}">
														<li class="depth1_li0">
															<div class="prd_txt">
																<p class="tit">${info.fd_product_name}</p>
															</div>
														</li>
														<li class="depth1_li0">
															<div class="prd_img">
																<img src="${info.fd_img_path}" onerror="this.src='/resources/images/dummy/483x621.png'"alt="제품 이미지" />
															</div>
														</li>
														<li class="depth1_li0">
															<div class="prd_info">
																<ul>
																	<li class="clear">
																		<h4>제품명</h4>
																		<p>${info.fd_product_name}</p>
																	</li>

																	<li class="clear">
																		<h4>제조사</h4>
																		<p>${info.fd_company_info}</p>
																	</li>

																	<li class="clear">
																		<h4>규격</h4>
																		<p>${info.fd_product_standard}</p>
																	</li>

																	<li class="clear">
																		<h4>포장단위</h4>
																		<p>${info.fd_product_unit}</p>
																	</li>
																</ul>
															</div>
														</li>
													</c:when>

													<c:otherwise>
														<li class="depth1_li0" id="tg1">
															<p>${view_contetns}</p>
														</li>
													</c:otherwise>
												</c:choose>
											</c:forEach>

											</ul>
											<c:set var="view_page_id" value="tg3"/>
										</c:if>
										<c:if test="${empty contents_list  }">
											<ul class="depth1">
												<c:if test="${info.fd_event_yn eq 'Y'}">
												<div class="prd_banner">
													<img src="/resources/images/sub/img_detail_payback.jpg" alt="" />
												</div>
												</c:if>
												<c:if test="${info.fd_custom_use_point_yn eq 'Y'}">
													<div class="prd_banner">
														<img src="/resources/images/sub/img_detail_smallequipment.jpg" alt="" />
													</div>
												</c:if>
												<li class="depth1_li0">
													<div class="prd_txt">
														<p class="tit">${info.fd_product_name}</p>
													</div>
												</li>
												<li class="depth1_li0">
													<div class="prd_img">
														<img src="${info.fd_img_path}" onerror="this.src='/resources/images/dummy/483x621.png'"alt="제품 이미지" />
													</div>
												</li>
												<li class="depth1_li0">
													<div class="prd_info">
														<ul>
															<li class="clear">
																<h4>제품명</h4>
																<p>${info.fd_product_name}</p>
															</li>
															<li class="clear">
																<h4>제조사</h4>
																<p>${info.fd_company_info}</p>
															</li>
															<li class="clear">
																<h4>규격</h4>
																<p>${info.fd_product_standard}</p>
															</li>
															<li class="clear">
																<h4>포장단위</h4>
																<p>${info.fd_product_unit}</p>
															</li>
														</ul>
													</div>
												</li>
											</ul>
										</c:if>
										<div class="info_cnt_normal"id="${view_page_id}">
											<div class="info_cnt_top">
												<%--<ul>
													<li class="clear"><h4>제품명</h4><p>${info.fd_product_name}</p></li>
													<li class="clear"><h4>제조사</h4><p>${info.fd_company_info}</p></li>
													<li class="clear"><h4>규격</h4><p>${info.fd_product_standard}</p></li>
													<li class="clear"><h4>포장단위</h4><p>${info.fd_product_unit}</p></li>
												</ul>--%>
											</div>
											<!-- PAYBACK 일 떄 노출 START -->
											<c:if test="${info.fd_event_yn eq 'Y'}">
											<div class="info_cnt_body">
												<div class="inner">
													<div class="text">
														<div class="tit"><span>메디밸류 100%페이백</span></div>
														<div class="desc">치과를 위해 메디밸류가 제안하는 베스트셀링 140여종</div>
													</div>
													<div class="image">
														<img src="/resources/images/sub/img_payback_211029.jpg" />
													</div>
													<div class="category">
														<div class="tit">카테고리 선택시 더 많은 페이백 상품을 보실수 있습니다.</div>
														<div class="tab_cate col3">
															<ul>
																<c:forEach var="cate" items="${cate_list}" varStatus="varStatus">
																	<li>
																		<div>
																			<a href="/product/payback?cate_idx=<c:out value="${cate.fk_tpcm_idx}"/>"><c:out value="${cate.fd_name}"/></a>
																		</div>
																	</li>
																</c:forEach>
															<%--<li><div><a href="/product/payback?cate_idx=1">인상재</a></div></li>
																<li><div><a href="/product/payback?cate_idx=2">시멘트</a></div></li>
																<li><div><a href="/product/payback?cate_idx=3">근관재</a></div></li>
																<li><div><a href="/product/payback?cate_idx=4">레진/본딩/에칭</a></div></li>
																<li><div><a href="/product/payback?cate_idx=8">템포관련/덴쳐</a></div></li>
																<li><div><a href="/product/payback?cate_idx=9">수술재료/마취</a></div></li>
																<li><div><a href="/product/payback?cate_idx=10">방사선재/교합관련</a></div></li>
																<li><div><a href="/product/payback?cate_idx=15">마스크/글러브/석션</a></div></li>
																<li><div><a href="/product/payback?cate_idx=6">트레이/스케일러팁</a></div></li>
																<li><div><a href="/product/payback?cate_idx=13">기타 치과 재료</a></div></li>--%>
															</ul>
														</div>
													</div>
												</div>
											</div>
											</c:if>
											<!-- PAYBACK 일 떄 노출 END -->
											<div class="info_cnt_btm">
												<h4>전자상거래 등에서의 상품정보제공고시</h4>
												<ul>
													<li class="clear">
														<h5>제조사/수입사</h5>
														<p>${info.fd_company_info}</p>
													</li>
													<li class="clear">
														<h5>중량/용량</h5>
														<p>${info.fd_product_unit}</p>
													</li>
													<%--
													<li class="clear">
														<h5>원산지</h5>
														<p>${info.fd_product_unit}</p>
													</li>
													<li class="clear">
														<h5>제조연월</h5>
														<p>내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 내용을 입력하세요 입력하세요</p>
													</li>
													 --%>
													<li class="clear">
														<h5>취급주의사항</h5>
														<p>제품 안에 사용 설명서를 참고하세요</p>
													</li>
													<li class="clear">
														<h5>사용기한</h5>
														<p>제품 박스를 참고하세요.</p>
													</li>
													<li class="clear">
														<h5>상품코드</h5>
														<p>${info.fd_medi_product_code}</p>
													</li>
												</ul>
												<p class="caution">*본 내용은 공정거래위원회 ‘상품정보제공고시’에 따라 판매자가 직접 등록한 것으로 해당 정보에 대한 책임은 판매자에게 있습니다.</p>
											</div>
										</div>
									
									</div>
								</div>
							</div>
							<c:if test="${!empty p_t_list}">
								<div class="recom1 noti2">
									<h3>함께 구매하면 좋은 제품이에요</h3>
									<ul class="depth1 subbxslider2">
										<c:set var="view_cnt" value="3"/>
										<c:forEach var="item" items="${p_t_list}" varStatus="state">
											<c:if test="${state.first}">
												<li>
													<ul class="depth2 clear">
											</c:if>
												<li>
													<a href="/product/detail.do?req_view_idx=${item.fk_tpsm_idx}" target="_self">
														<div class="img">
															<input type="hidden" name="tpsm_idx" id="tpsm_idx" value="${item.fk_tpsm_idx }">
															<input type="hidden" name="shop_product_amount" id="shop_product_amount" value="${item.shop_product_amount }">
															<img src="${item.view_image}" onerror="this.src='/resources/images/dummy/250x321.png'" width="250" height="321" border="0" alt="제품이미지" id="pd_img_info"/>
															<div class="wish_wrap">
																<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
																<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
															</div>
														</div>
														<div class="info">
															<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name} ${item.fd_product_standard}</h4>
															<div class="price clear">
																<%--<strong class="percent">10%</strong>--%>
																<p id="product_amount"><fmt:formatNumber value="${item.shop_product_amount}" pattern="#,###" />원</p>
															</div>
															<div class="cost"><%-- <p>0,000,000원</p>--%></div>
														</div>
													</a>
												</li>
												<c:if test="${(state.index % view_cnt == view_cnt-1) and !state.last and !state.first}">
													</ul>
												</li>
												<li>
													<ul class="depth2 clear">
												</c:if>
												<c:if test="${state.last}">
													</ul>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</c:if>

							<c:if test="${!empty p_a_list}">
								<div class="recom2 noti2">
									<h3>다른분들이 함께 본 제품이에요</h3>
									<ul class="depth1 subbxslider2">
										<c:set var="view_cnt" value="3"/>
										<c:forEach var="item" items="${p_a_list}" varStatus="state">
											<c:if test="${state.first }">
												<li>
													<ul class="depth2 clear">
											</c:if>
												<li>
													<a href="/product/detail.do?req_view_idx=${item.fk_tpsm_idx}" target="_self">
														<div class="img">
															<input type="hidden" name="tpsm_idx" id="tpsm_idx" value="${item.fk_tpsm_idx }">
															<input type="hidden" name="shop_product_amount" id="shop_product_amount" value="${item.shop_product_amount }">
															<img src="${item.view_image}" onerror="this.src='/resources/images/dummy/250x321.png'" width="250" height="321" border="0" alt="제품이미지" id="pd_img_info"/>
															<div class="wish_wrap">
																<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
																<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
															</div>
														</div>
														<div class="info">
															<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name} ${item.fd_product_standard}</h4>
															<div class="price clear">
																<%--<strong class="percent">10%</strong>--%>
																<p id="product_amount"><fmt:formatNumber value="${item.shop_product_amount}" pattern="#,###" />원</p>
															</div>
															<div class="cost"><%-- <p>0,000,000원</p>--%></div>
														</div>
													</a>
												</li>
												<c:if test="${(state.index % view_cnt == view_cnt-1) and !state.last and !state.first}">
													</ul>
												</li>
												<li>
													<ul class="depth2 clear">
												</c:if>
												<c:if test="${state.last}">
													</ul>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</c:if>
						</div>

						<div class="right">
							<div class="floating_box">
								<div class="auto_wrap" id="option_view_area_sub">
									<div class="option_wrap">
										<select name="product_option_sub" id="product_option_sub" class="ow1">
										<option value="">제품정보를 선택해주세요.</option>
										<c:if test="${!empty group_list}">
											<c:choose>
												<c:when test="${info.fd_stock_sell_yn eq 'N'}"><c:set var="sotxt" value="[품절]"/></c:when>
												<c:otherwise><c:set var="sotxt" value=""/></c:otherwise>
											</c:choose>
											<option value="${info.pk_idx}_${info.fd_product_amount}_${info.fd_stock_sell_yn}">${sotxt} ${info.fd_product_name}_${info.fd_stock_sell_yn} ${info.fd_product_standard} ${info.fd_product_unit}</option>
											<c:forEach var="item" items="${group_list}" varStatus="state">
												<c:choose>
													<c:when test="${item.fd_stock_sell_yn eq 'N'}"><c:set var="sotxt" value="[품절]"/></c:when>
													<c:otherwise><c:set var="sotxt" value=""/></c:otherwise>
												</c:choose>
												<option value="${item.fk_tpsm_group_idx}_${item.fd_product_amount}_${item.fd_stock_sell_yn}">${sotxt} ${item.fd_product_name} ${item.fd_product_standard} ${item.fd_product_unit}</option>
											</c:forEach>
										</c:if>
										<c:if test="${empty group_list}">
											<c:choose>
												<c:when test="${info.fd_stock_sell_yn eq 'N'}"><c:set var="sotxt" value="[품절]"/></c:when>
												<c:otherwise><c:set var="sotxt" value=""/></c:otherwise>
											</c:choose>
											<option value="${info.pk_idx}_${info.fd_product_amount}_${info.fd_stock_sell_yn}" selected="selected">${sotxt} ${info.fd_product_name} ${info.fd_product_standard} ${info.fd_product_unit}</option>
										</c:if>
										</select>
										<%--	<select name="" id="" class="ow1"><option value="">[필수] 옵션을 선택해주세요-</option></select>
												<select name="" id="" class="ow2"><option value="">제품명_용량_규격</option></select> --%>
									</div>
									<c:if test="${empty group_list}">
										<div class="slt_box pd_info_${info.pk_idx}">
											<input type="hidden" name="tpsm_idx" id="tpsm_idx" value="${info.pk_idx}">
											<input type="hidden" name="shop_amount" id="shop_amount" value="${info.fd_product_amount}">
											<button type="button" id="btn_product_detail_del" class="delete_btn"><img src="/resources/images/main/sub_bundle_option_delete.png" width="22" height="22" border="0" alt="" /></button>
											<div class="total_name clear">
												<p>${info.fd_product_name} ${info.fd_product_standard} ${info.fd_product_unit}</p>
											</div>
											<div class="quan_box clear">
												<button type="button" id="btn_order_minus"  class="minus">-</button>
												<p id="order_cnt" class="product_order_cnt">1</p>
												<button type="button" id="btn_order_plus" class="plus">+</button>
											</div>
											<div class="total">
												<c:if test="${loginInfo == null}">
													<p>로그인 후 최저가 확인</p>
												</c:if>
												<c:if test="${loginInfo != null}">
												<p><strong class="product_amount"><fmt:formatNumber value="${info.fd_product_amount}" pattern="#,###" /></strong>원</p>
												</c:if>
											</div>
										</div>
									</c:if>
								</div>
								<div class="fix_wrap">
									<div class="result_box">
										<ul>
											<li class="rb_price clear">
												<c:if test="${loginInfo == null}">
													<p>로그인 후 최저가 확인</p>
												</c:if>
												<c:if test="${loginInfo != null}">
												<p>총 <span id="product_total_cnt"><c:if test="${empty group_list}">1</c:if></span>개</p>
												<strong>
													<span class="product_total_amount">
													<c:if test="${empty group_list}"><fmt:formatNumber value="${info.fd_product_amount}" pattern="#,###" /></c:if>
													<c:if test="${!empty group_list}">0</c:if>
													</span>
													<span>원</span>
												</strong>
												</c:if>
											</li>
											<%---<li class="rb_opap">
												<p><span>ㄴ</span> 17,000원 할인 적용</p>
											</li>--%>
											<li class="rb_opap">
												<p><span>ㄴ</span> 10만원이상 무료배송</p>
											</li>
										</ul>
									</div>
									<c:choose>
										<c:when test="${info.fk_cate_1_idx == 213 && info.fk_cate_2_idx == 214}">
											<div class="btn_wrap">
												<button type="button" class="buy_btn" id="ㅉㅉㅉㅉㅈ">구매하기</button>
											</div>
										</c:when>
										<c:otherwise>
											<div class="btn_wrap">
												<div class="btn_wrap_top clear">
													<button type="button" class="cart_btn" id="btn_product_detail_sub_cart">장바구니 담기</button>
													<button type="button" class="wish_btn my_wish"></button>
												</div>
												<button type="button" class="buy_btn" id="btn_product_detail_sub_order">바로 구매하기</button>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>

			<article class="cnt4 noti">
				<div class="area">
					<div class="real_area">
						<c:if test="${!empty p_r_list}">
							<c:set var="view_cnt" value="4"/>
						<div class="tit">
							<h3>Recommended Item</h3>
							<p>이런 제품은 어떠세요?</p>
						</div>
						<div class="txt">
							<ul class="depth1 subbxslider4">
								<c:forEach var="mn_item" items="${p_r_list}" varStatus="state">
									<c:if test="${state.first }">
											<li>
												<ul class="depth2 clear">
									</c:if>
										<li>
											<a href="/product/detail?req_view_idx=${mn_item.fk_tpsm_idx}" target="_self">
												<div class="img">
													<input type="hidden" name="tpsm_idx" id="tpsm_idx" value="${mn_item.fk_tpsm_idx }">
													<input type="hidden" name="shop_product_amount" id="shop_product_amount" value="${mn_item.shop_product_amount }">
													<img src="${mn_item.view_image}" onerror="this.src='/resources/images/dummy/250x321.png'" width="250" height="321" border="0" alt="" id="pd_img_info"/>
													<div class="wish_wrap">
														<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
												<div class="info">
													<h4 class="pd_tit">[${mn_item.fd_company_info }] ${mn_item.fd_product_name}</h4>
													<div class="price clear">
														<%--
														<strong class="percent">10%</strong>
														 --%>
														<p id="product_amount"><fmt:formatNumber value="${mn_item.shop_product_amount}" pattern="#,###" />원</p>
													</div>
													<div class="cost"><%--<p>0,000,000원</p> --%></div>
												</div>
											</a>
										</li>
										<c:if test="${(state.index % view_cnt == view_cnt-1) and !state.last and !state.first}">
												</ul>
											</li>
											<li>
												<ul class="depth2 clear">
										</c:if>
										<c:if test="${state.last}">
												</ul>
											</li>
										</c:if>
								</c:forEach>
							</ul>
						</div>
						</c:if>
						<div class="banner"><a href="#"><img src="/resources/images/main/mn_c12_banner.jpg" width="1052" height="141" border="0" alt="" /></a></div>
					</div>
				</div>
			</article>
			<%--  히스토리 영역 시작 --%>
			<layout:historyFrame/>
			<%--  히스토리 영역 끝 --%>
		</section>
	</jsp:body>
</layout:basicFrame>