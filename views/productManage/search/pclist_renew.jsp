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
			.div_blank {
				height: 15px;
			}
			.btn_wrap .cart_btn {
				width: 100% !important;
			}
			.bar {
				display: none;
			}
		</style>
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript" src="/resources/js/sub1.js"></script>
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script type="text/javascript">
			var proc_state = true;
			var signInPopup = {
					showMessage: function (msg) {
						$("#pop_alarm_msg").html(msg);
						$("#black").show();
						$(".popup_message_type_1").show();
					}
				}
			
			var all_cate_1_idx_list = [
				<c:forEach var="cate" items="${cate_list}" varStatus="varStatus">
				${cate.fk_tpcm_idx}<c:if test="${varStatus.index < cate_list.size()}">,</c:if>
				</c:forEach>
			];
			
			var all_cate_1_idx = 0;
			
			var scrollEvent = true;
			var categoryScrollEvent = false;
			var categoryCurrentTotalCount = 0;
			
			$(document).ready(function (){
				
				var res_option1_val = '${searchAddOption1}';
				<%--var res_option2_val = '${searchAddOption2}';--%>
				<%--var res_option3_val = '${searchAddOption3}';--%>
				<%--var res_option4_val = '${searchAddOption4}';--%>

				if(typeof res_option1_val != 'undefined' && res_option1_val !=''){load_filter_check(res_option1_val, 1);}
				// if(typeof res_option2_val != 'undefined' && res_option2_val !=''){load_filter_check(res_option2_val, 2);}
				// if(typeof res_option3_val != 'undefined' && res_option3_val !=''){load_filter_check(res_option3_val, 3);}
				// if(typeof res_option4_val != 'undefined' && res_option4_val !=''){load_filter_check(res_option4_val, 4);}

				$("input:checkbox[name='searchOption1']").on("click", function(){
					filter_check(this,1);
					$("#f_add_search").submit();
				});
				// $("input:checkbox[name='searchOption2']").on("click", function(){
				// 	filter_check(this,2);
				// 	$("#f_add_search").submit();
				// });
				// $("input:checkbox[name='searchOption3']").on("click", function(){
				// 	filter_check(this,3);
				// 	$("#f_add_search").submit();
				// });
				// $("input:checkbox[name='searchOption4']").on("click", function(){
				// 	filter_check(this,4);
				// 	$("#f_add_search").submit();
				// });
				$(document).on("click","button[id^='btn_del_filter']",function(){
					var sel_id = $(this).parent().find("p").attr("id").replace("filter_","");
					if(typeof(sel_id) !='undefied'){
						$("#"+sel_id).trigger("click");
						$(this).parent().remove();
					}
				});

				$("#searchOrderType").on("change",function(){
					$("#f_add_search").submit();
				});

				$("#btn_search_medi").on("click",function(){
					$("#f_add_search").attr("action", "/product/search/medi/list");
					$("#f_add_search").submit();
				});
				$("#btn_search_compare").on("click",function(){
					$("#f_add_search").attr("action", "/product/search/compare/list");
					$("#f_add_search").submit();
				});

				$("#btn_result_view").on("click",function(){
					$("#search_write").css("display","block");
					$("#black3").css("display","block");
					$("#req_write_searchText").val($("#searchString").val());
					if($("#searchString").val().trim().length==0){
						$("#req_write_searchText").attr("readonly", false);
					}
				});

				$("#btn_result_write").on("click",function(){
					if($.trim($("#req_write_searchText").val()) ==''){
						signInPopup.showMessage("검색어를 확인해주세요.");
						return;
					}else if($.trim($("#req_write_searchMemo").val()).length <=0){
						signInPopup.showMessage("불편사항 및 요청사항을 확인해주세요.");
						return;
					}else{
						var formData = $("#f_search_write").serialize();
						$.ajax({
							url : '/product/search/rest/result/write',
							type : 'post',
							cache : false,
							data : formData,
							dataType : 'json',
						   	success:function(data){
						   		if(data.rtn_code !='200'){
						   			signInPopup.showMessage(data.rtn_msg);
						   		}else{
						   			$("#search_write").css("display","none");
						   			$("#black3").css("display","none");
						   			//$('#search_write')[0].reset();
						   		}
						   	},
						   	error:function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    }
						});
					}
				});

				$(".cp_close").on("click",function(){
					$("#search_write").css("display","none");
		   			$("#black").css("display","none");
				});

				$("#btn_add_search").on("click",function(){
					$("#f_add_search").submit();
				});

				$("#searchAddCategory").on("change", function(){
					$("#f_add_search").submit();
				});

				/* 바로 구매하기 버튼 클릭 시 */
				$(".buy_btn").on("click", function  () {
					if ($(this).attr("class").indexOf("lb") > -1) return false;
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

				$(document).on("click", ".wish_btn", function() {
					if (!checkLogin()) return false;
					if ($(this).hasClass("on")) {
						$(this).removeClass("on").find("img").attr("src","/resources/images/main/sub_like_icon.png");
					}else {
						$(this).addClass("on").find("img").attr("src","/resources/images/main/sub_like_icon_on.png");
					}
				});

				/* 찜 버튼 클릭 시 */
				$(document).on("click", ".wish_btn", function() {
					var login_check = checkLogin();
					if(login_check){
						var tpsm_idx = $(this).parent().parent().parent().parent().find("input[name='tpsm_idx']").val();
						if(typeof tpsm_idx != 'undefined' && tpsm_idx !='' && tpsm_idx != '0'){
							if(proc_state){
								var wish_state = 'N';
								if(!$(this).hasClass("on")){
									wish_state = 'Y';
								}
								proc_state = false;
								var formData = {tpsm_idx : tpsm_idx,
												wish_state : wish_state
												};
								$.ajax({
									url : '/wish/rest/save',
									type : 'post',
									cache : false,
									data : formData,
									dataType : 'json',
								   	success:function(data){
								   		if(data.rtn_code !='200'){
								   			signInPopup.showMessage(data.rtn_msg);
											if($(e).hasClass("on")){
												$(e).removeClass("on");
											}
								   		}
								   		proc_state = true;
								   	},
								   	error:function(request,status,error){
								        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								        proc_state = true;
								        if($(e).hasClass("on")){
											$(e).removeClass("on");
										}
								    }
								});
							}else{
								signInPopup.showMessage("처리중입니다. 잠시만 기다려 주세요.");
								return;
							}
						}else{
							signInPopup.showMessage("제품을 담을수 없습니다.");
							if($(this).hasClass("on")){
								$(this).removeClass("on");
							}
						}
					}else{
						if($(this).hasClass("on")){
							$(this).removeClass("on");
						}
					}
				});

				/* 장바구니 버튼 클릭 시 */
				$(document).on("click", ".cart_btn", function() {
					var login_check = checkLogin();
					if(login_check){
						var pk_idx = $(this).parent().parent().parent().parent().find("input[name='tpsm_idx']").val();
						var product_name = $(this).parent().parent().parent().parent().children("div.info").children("div.info_wrap").find(".pd_tit").text();
						var product_price = $(this).parent().parent().find(".pd_price").text();
						var pd_cnt = 1;
						if(typeof tpsm_idx != 'undefined' && tpsm_idx !='' && tpsm_idx != '0'){

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
															"<input type='checkbox' class='cb_item'><span></span>" +
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
																"<input type='checkbox' class='cb_item'><span></span>" +
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
					}
				});
			});

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
// 					p_html +=		"<p class='subtit' id='" + subtit_idx + "'>" + subtit + "</p>";
				}

				p_html +=		"<div class='cnt_list col5'>";

				if (p_list != null && p_list.length > 0) {

					let check_cate = "";
					let check_p_cnt = "0";
					let check_p_state = "";

// 					p_html += 		"<ul>";

					for (let idx = 0; idx < p_list.length; idx++) {

						let p = p_list[idx];
						let img_class = 'img';
						let patch_class = 'item_info';
						let option_count = 0;
// 						let on_error = "this.src='/resources/images/dummy/340x339.png'";
						let on_error = "this.src=\"/resources/images/dummy/250x321.png\"";

						let product_stanadard = "";
						let company_info = "";
						let product_unit = "";
						let edent_amount_low_price = "";
						let dvmall_amount_low_price = "";
						let seil_amount_low_price = "";

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

						if (p['fd_product_standard'] != null && p['fd_product_standard'] != '') {
							product_standard = "규격 ㅣ " + p['fd_product_standard'];
						}

						if (p['fd_company_info'] != null && p['fd_company_info'] != '') {
							company_info = "제조사 ㅣ " + p['fd_company_info'];
						}

						if (p['fd_product_unit'] != null && p['fd_product_unit'] != '') {
							product_unit = "포장단위 ㅣ " + p['fd_product_unit'];
						}

						let min_compare_list = [];
						let compare_list = [];

						let edent = {
							amount: Number(p['edent_amount']),
							low_price: 'low_price',
							name: 'eDENT'
						}

						let dvmall = {
							amount: Number(p['dvmall_amount']),
							low_price: 'low_price',
							name: 'DVmall'
						}

						let seil = {
							amount: Number(p['seil_amount']),
							low_price: 'low_price',
							name: 'SeilGlobal'
						}

						if (p['edent_amount'] == p['compare_min_amount']) {
							edent_amount_low_price = "low_price";
							min_compare_list.push(edent);
						} else {
							compare_list.push(edent);
						}

						if (p['dvmall_amount'] == p['compare_min_amount']) {
							dvmall_amount_low_price = "low_price";
							min_compare_list.push(dvmall);
						} else {
							compare_list.push(dvmall);
						}

						if (p['seil_amount'] == p['compare_min_amount']) {
							seil_amount_low_price = "low_price";
							min_compare_list.push(seil);
						} else {
							compare_list.push(seil)
						}

						compare_list.sort(function (a, b) {
							let amount_a = a['amount'];
							let amount_b = b['amount'];
							if(amount_a === 0) return 1;
							if(amount_a > amount_b) return 1;
							if(amount_a === amount_b) return 0;
							if(amount_a < amount_b) return -1;
						});

						if (check_cate != p['fk_cate_2_idx']) {
							if (check_p_cnt != 0) {
								p_html += 		"</ul>";
								p_html += 	"</div>";
								p_html += "</div>";
								check_p_cnt = 0;
							}
							p_html += "<div class='pd_list pd_list" + idx + "'>";
							p_html += 	"<div class='pd_list_tit'>";
							p_html += 		"<h5>" + p['cate_1_name'] + " - " + p['cate_2_name'] + "</h5>";
							p_html +=	"</div>";
							check_p_state = "";
						}

						if (idx == 0) {
							p_html += "<div class=pd_list_txt>";
							p_html += "<strong>가격비교</strong>";
							p_html += "<ul class='depth1'>";
						}

						if (idx != 0) {
							if (check_p_state != p['fd_product_group_purchase_yn']) {
								if (check_cate == p['fk_cate_2_idx']) {
									p_html += "</div>";
								}
								p_html += "<div class='pd_list_txt'>";
								p_html += "<strong>가격비교</strong>";
								p_html += "<ul class='depth1'>";
							}
						}

						let li = '';
						li += "<li class='clear " + patch_class + "' id='code"+ p['fd_medi_product_code'] + "'>";
						li += 	"<input type='hidden' name='tpmm_idx' id='tpmm_idx' value='" + p['pk_idx'] + "' />";
						li += 	"<input type='hidden' name='tpsm_idx' id='tpsm_idx' value='" + p['tpsm_idx'] + "' />";
						li += 	"<input type='hidden' name='tsmi_idx' id='tsmi_idx' value='" + p['fk_tsmi_idx'] + "' />";
						li += 	"<div class='img " + img_class + "'>";
						li += 		"<div class='icon_list'>";
						li += 			"<div class='li li_option'>";
						li += 				"<div>";
						li += 					"<div class='desc'>규격<br>확인</div>";
						li += 				"</div>";
						li += 			"</div>";
						li += 			"<div class='li li_insure'>";
						li += 				"<div>";
						li += 					"<div class='desc'>보험<br>재료</div>";
						li += 				"</div>";
						li += 			"</div>";
						li += 		"</div>";
						if (p['fd_img_path_thumbnail'] == null || p['fd_img_path_thumbnail'] == '') {
							// li += 			"<a href='/product/detail?req_view_idx=" + p['tpsm_idx'] + "' target='_self'>";
							// li += 			"<a href='javascript:;' target='_self'>";
							li += 				"<img style='object-fit: contain;' src='" + p['fd_img_path'] + "' border='0' alt='' onerror='" + on_error + "' />";
							// li += 			"</a>";
						}
						if (p['fd_img_path_thumbnail'] != null && p['fd_img_path_thumbnail'] != '') {
							// li += 			"<a href='/product/detail?req_view_idx=" + p['tpsm_idx'] + "' target='_self'>";
							// li += 			"<a href='javascript:;' target='_self'>";
							li += 				"<img style='object-fit: contain;' src='" + p['fd_img_path_thumbnail'] + "' border='0' alt='' onerror='" + on_error + "'/>";
							// li += 			"</a>";
						}
						li += 	"</div>";
						li += 	"";
						li += 	"<div class='info'>";
						li += 		"<div class='info_wrap'>";
						li += 			"<h4 class='pd_tit'>";
						// li += 				"<a href='/product/detail?req_view_idx=" + p['tpsm_idx'] + "' target='_self'>";
						// li += 				"<a href='javascript:;' target='_self'>";
						li += 					"" + p['fd_product_name'] + "";
						// li += 				"</a>";
						li += 			"</h4>";
						li += 			"<p class='standard'>" + product_standard + "</p>";
						li += 			"<p class='manu'>" + company_info + "</p>";
						li += 			"<p class='pack'>" + product_unit + "</p>";
						li += 		"</div>";
						li += 	"</div>";
						li += 	"";
						li += 	"<div class='price_new'>";
						li += 		"<h5><p>가격비교</p>";
						/* li += 			"<div class='switch_wrap'>";
						li += 				"<input type='checkbox' name='' value='' onclick='compareSwitch(this);'>";
						li += 				"<div class='alert alert_on'>탭을 클릭하시면 재료상별 가격비교가 가능합니다.</div>";
						li += 				"<div class='alert alert_off'>탭을 클릭하시면 최저가 제품 구매가 가능합니다.</div>";
						li += 			"</div>"; */
						li += 		"</h5>";
						li += 		"<div class='price_new_info'>";

						if (loginInfo === '') {
							li += 			"<div class='price clear'>";
							li += 				"<p class='pd_price'>로그인 후 최저가 확인</p>";
							// li += 				"<button class='wish_btn' type='button' id='btn_wish'></button>";
							li += 			"</div>";
						} else {
							li += 			"<div class='price clear'>";
							li += 				"<p class='pd_price'>" + numberToPrice(p['shop_product_amount']) + "원</p>";
							li += 				"<button class='wish_btn' type='button' id='btn_wish'></button>";
							li += 			"</div>";
						}

//						li += 			"<div class='btn_wrap clear'>";
//						li += 				"<button class='cart_btn' id='btn_cart' type='button'>장바구니</button>";
// 						li +=				 "<button class='buy_btn lb' id='btn_buy' type='button'>구매하기</button>";
//						li += 				"<span class='bar'></span>";
//						li += 			"</div>";
						li += 		"</div>";
						li += 		"<div class='price_new_comp'>";
						li += 			"<ul class='depth2'>";

						for (let i = 0; i < min_compare_list.length; i++) {
							let compare = min_compare_list[i];
							li += 			"<li class='" + compare['low_price'] + "'>";
							li += 				"<button type='button' class='clear'>";
							li += 					"<h6>"+ compare['name'] +"</h6>";
							li += 					"<div class='p_wrap'><p>" + numberToPrice(compare['amount']) + "원</p></div>";
							li += 				"</button>";
							li += 			"</li>";
						}

						for (let i = 0; i < compare_list.length; i++) {
							let compare = compare_list[i];
							li += 			"<li>";
							li += 				"<button type='button' class='clear'>";
							li += 					"<h6>"+ compare['name'] +"</h6>";
							li += 					"<div class='p_wrap'><p>" + numberToPrice(compare['amount']) + "원</p></div>";
							li += 				"</button>";
							li += 			"</li>";
						}

						// li += 			"<li class='" + edent_amount_low_price + "'>";
						// li += 				"<button type='button' class='clear'>";
						// li += 					"<h6>eDENT</h6>";
						// li += 					"<div class='p_wrap'><p>" + numberToPrice(p['edent_amount']) + "원</p></div>";
						// li += 				"</button>";
						// li += 			"</li>";
						// li += 			"<li class='" + dvmall_amount_low_price + "'>";
						// li += 				"<button type='button' class='clear'>";
						// li += 					"<h6>DVmall</h6>";
						// li += 					"<div class='p_wrap'><p>" + numberToPrice(p['dvmall_amount']) + "원</p></div>";
						// li += 				"</button>";
						// li += 			"</li>";
						// li += 			"<li class='" + seil_amount_low_price + "'>";
						// li += 				"<button type='button' class='clear'>";
						// li += 					"<h6>SeilGlobal</h6>";
						// li += 					"<div class='p_wrap'><p>" + numberToPrice(p['seil_amount']) + "원</p></div>";
						// li += 				"</button>";
						// li += 			"</li>";

						li += 			"</ul>";
						li += 			"<div class='btn_wrap'>";
						li += 				"<button type='button' class='btn_more' onclick='moveQuickOrder(\"" + p['fd_product_name'] + "\"," + p['pk_idx'] + ")'>가격비교 하기</button>";
						li += 			"</div>";
						li += 		"</div>";
						li += 	"</div>";
						li += 	"";
						li += "</li>";

						p_html += li;

						check_p_cnt = check_p_cnt + 1;
						if (idx == p_list.length - 1) {
							p_html += 		"</ul>";
							p_html += 	"</div>";
							p_html += "</div>";
						}
						check_cate = p['fk_cate_2_idx'];
						if (p['fd_product_group_purchase_yn'] == 'Y') {
							check_p_state = "Y";
						}
						if (p['fd_product_group_purchase_yn'] != 'Y') {
							check_p_state = "N";
						}
					}

// 					p_html +=			"</ul>"

				} else {
// 					p_html += "<div> 현재 행사중인 제품이 없습니다. </div>";
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
			}

			function getPaybackProductList(fk_cate_1_idx, page, anchor) {

				let req = JSON.stringify({
					fk_cate_1_idx: fk_cate_1_idx,
					page: page
				});

				$.ajax({
					url: '/product/rest/pclist',
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
				let searchAddOption1 = '${searchAddOption1}';
				<%--let searchAddOption2 = '${searchAddOption2}';--%>
				<%--let searchAddOption3 = '${searchAddOption3}';--%>
				<%--let searchAddOption4 = '${searchAddOption4}';--%>
				// if (searchAddOption1 != '' || searchAddOption2 != '' || searchAddOption2 != '' || searchAddOption2 != '') return;
				if (searchAddOption1 != '') return;

				let cate_idx = '${cate_idx}';
				if (cate_idx > 0) {
// 					getCategoryPaybackProductList($(".p_cate_" + cate_idx).children("div").children("a"), cate_idx, 0);
				} else {
					getPaybackProductList(all_cate_1_idx_list[all_cate_1_idx], 0, true);
				}
			});

			$(document).scroll(function () {
				let scrollT = $(this).scrollTop();
				let bottomHeight = $(".cnt1").height() + $(".cnt1").offset().top;
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
    			   			if (pop_id === "cartPopup3") {
    			   				pd_title = $("#" + pop_id).find(".pop_item").find(".cb_item:checked").eq(0).parent().parent().parent().find(".pop_tit").text();
    			   			}
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
    			   			if (pop_id === "cartPopup3") {
    			   				pd_title = $("#" + pop_id).find(".pop_item").find(".cb_item:checked").eq(0).parent().parent().parent().find(".pop_tit").text();
    			   			}
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

			function load_filter_check(check_val, type){
				var temp_option_val = check_val.split("[{|}]");
				if(temp_option_val instanceof Array){
					$("input:checkbox[name='searchOption"+type+"']").each(function(){
						if(temp_option_val.indexOf($(this).val())>-1){
							$(this).prop("checked", true);
							filter_check(this,type);
						}
					});
				}
			}

			function filter_check(e, search_type){
				var dy_option = "";
				var option_val = [];
				var check_val = $(e).val();
				var temp_name= $(e).attr("name");
				$(document).find("div[id^='filter_check_area_"+search_type+"']").remove();
				if($(e).is(":checked")==false){
					$("input:checkbox[name='"+temp_name+"']:input[value='"+check_val+"']").prop("checked", false);
				}else{
					$("input:checkbox[name='"+temp_name+"']:input[value='"+check_val+"']").prop("checked", true);
				}
				$("input:checkbox[name='"+temp_name+"']").each(function(){
					check_val = $(this).val();
					temp_nam = $(this).attr("name");
					if($(this).is(":checked")){
						if(option_val.indexOf(check_val)<=-1){
							option_val.push(check_val);
							dy_option +="<div class=\"ch_filt\" id=\"filter_check_area_"+search_type+"\">";
								dy_option +="<p id=\"filter_"+$(this).attr("id")+"\">";
									dy_option += ($(this).parent().find("label").text().trim());
								dy_option +="</p>";
								dy_option +="<button type=\"button\" id='btn_del_filter'>";
									dy_option +="<img src='/resources/images/main/ch_filt_delete.jpg' width='8' height='8' border='0' alt='' />"
								dy_option +="</button>";
							dy_option +="</div>";
							$("input:checkbox[name='"+temp_name+"']:input[value='"+check_val+"']").prop("checked", true);
						}
					}else{
						$("input:checkbox[name='"+temp_name+"']:input[value='"+check_val+"']").prop("checked", false);
						//$("p[id='"+$(this).attr("id")+"']").parent().find("#btn_del_filter").trigger("click");
					}
				});

				$("#select_filter").append(dy_option);
				$(document).find("#searchAddOption"+search_type).remove();
				if(option_val.length>0){
					var input_option = "<input type=\"hidden\" id=\"searchAddOption"+search_type+"\" name=\"searchAddOption"+search_type+"\" value=\""+(Array.from(new Set(option_val)).join('[{|}]'))+"\" / >";
					$("#f_add_search").append(input_option);
				}
				filter_view();
			}

			function filter_view(){
				if($("#select_filter > div.ch_filt").length>0){
					$(".sub .choice_filter").css("display","block");
					//$(".sub .cnt1 .area .real_area .right_cnt .asso").css("display","none")
				}else{
					$(".sub .choice_filter").css("display","none");
				}
			}

			function compareSwitch(e){
				if($(e).is(":checked")){
					$(e).parents(".price_new").addClass("on");
					$(e).parents("h5").children("p").text("제품구매");
				}else{
					$(e).parents(".price_new").removeClass("on");
					$(e).parents("h5").children("p").text("가격비교");
				}
			}

			function moveQuickOrder(product_name, idx) {
				$("#searchString").val(product_name);
				$("#searchSelectIdx").val(idx);
				$("#frm_top_search").submit();
			}

			<%-- 메뉴 폰트 컬러 적용 --%>
			$(function(){
				$("#header .btm .area .real_area #gnb ul li:nth-child(2)").addClass("color_blue");
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="searchMain" class="sub">
			<article class="cnt1" id="cnt_anchor">
				<div class="banner_wrap">
					<img src="/resources/images/sub/img_compareprice_slide02.jpg?v20220307" />
				</div>
				<div class="area">
					<div class="real_area clear">
						<div class="left_filter">
							<div class="wrap">
								<ul class="depth1">
									<li class="filter_1">
										<div class="filter_tit clear">
											<h4>카테고리</h4>
											<button class="updown" type="button"><img src="/resources/images/main/filter_up.png" width="12" height="8" border="0" alt="" /></button>
										</div>
										<div class="d2_wrap">
											<ul class="depth2">
												<c:if test="${!empty group_search_cate_1_list }">
													<c:forEach var="o_item" items="${group_search_cate_1_list}"  varStatus="state">
														<c:if test="${state.index<=5}">
															<li>
																<input id="searchOption1_chk${state.index}" name="searchOption1" type="checkbox" value="${o_item.fk_cate_1_idx}">
																<label for="searchOption1_chk${state.index}">${o_item.cate_name}</label>
															</li>
														</c:if>
													</c:forEach>
												</c:if>
											</ul>
											<c:if test="${group_search_cate_1_list_size>=3 }">
												<button class="more_view" style="display: block;" type="button">더보기<img src="/resources/images/main/filter_down.png" width="9" height="5" border="0" alt="" /></button>
											</c:if>
											<c:if test="${group_search_cate_1_list_size>=5 }">
												<button class="full_view" style="display: block;" type="button">전체보기<img src="/resources/images/main/filter_view.png" width="5" height="9" border="0" alt="" /></button>
											</c:if>
											<div class="filt_popup filter_1_popup">
												<div class="filter_pu_tit">
													<h5>카테고리 전체</h5>
												</div>
												<div class="filter_pu_txt">
													<ul class="clear">
														<c:if test="${!empty group_search_cate_1_list }">
															<c:forEach var="o_item" items="${group_search_cate_1_list}"  varStatus="state">
																<li>
																	<input id="f1Chk${state.index}" name="searchOption1" type="checkbox" value="${o_item.fk_cate_1_idx }">
																	<label for="f1Chk${state.index}">${o_item.cate_name}</label>
																</li>
															</c:forEach>
														</c:if>
													</ul>
												</div>
												<div class="filter_pu_close">
													<button type="button">닫기</button>
												</div>
											</div>
										</div>
									</li>
<%--									<li class="filter_2">--%>
<%--										<div class="filter_tit clear">--%>
<%--											<h4>종류</h4>--%>
<%--											<button class="updown" type="button"><img src="/resources/images/main/filter_up.png" width="12" height="8" border="0" alt="" /></button>--%>
<%--										</div>--%>
<%--										<div class="d2_wrap">--%>
<%--											<ul class="depth2">--%>
<%--												<c:if test="${!empty group_search_cate_2_list }">--%>
<%--													<c:forEach var="o_item" items="${group_search_cate_2_list}"  varStatus="state">--%>
<%--														<c:if test="${state.index<=5}">--%>
<%--															<li>--%>
<%--																<input id="filt2_chk${state.index}" name="searchOption2" type="checkbox" value="${o_item.fk_cate_2_idx}">--%>
<%--																<label for="filt2_chk${state.index}">${o_item.cate_name}</label>--%>
<%--															</li>--%>
<%--														</c:if>--%>
<%--													</c:forEach>--%>
<%--												</c:if>--%>
<%--											</ul>--%>
<%--											<c:if test="${group_search_cate_2_list_size>=3 }">--%>
<%--												<button class="more_view" style="display: block;" type="button">더보기<img src="/resources/images/main/filter_down.png" width="9" height="5" border="0" alt="" /></button>--%>
<%--											</c:if>--%>
<%--											<c:if test="${group_search_cate_2_list_size>=5 }">--%>
<%--												<button class="full_view" style="display: block;" type="button">전체보기<img src="/resources/images/main/filter_view.png" width="5" height="9" border="0" alt="" /></button>--%>
<%--											</c:if>--%>
<%--											<div class="filt_popup filter_2_popup">--%>
<%--												<div class="filter_pu_tit">--%>
<%--													<h5>종류 전체</h5>--%>
<%--												</div>	--%>
<%--												<div class="filter_pu_txt">--%>
<%--													<ul class="clear">--%>
<%--														<c:if test="${!empty group_search_cate_2_list }">--%>
<%--															<c:forEach var="o_item" items="${group_search_cate_2_list}"  varStatus="state">--%>
<%--																<li>--%>
<%--																	<input id="f2Chk${state.index}" name="searchOption2" type="checkbox" value="${o_item.fk_cate_2_idx }">--%>
<%--																	<label for="f2Chk${state.index}">${o_item.cate_name}</label>--%>
<%--																</li>--%>
<%--															</c:forEach>--%>
<%--														</c:if>--%>
<%--													</ul>--%>
<%--												</div>--%>
<%--												<div class="filter_pu_close">--%>
<%--													<button type="button">닫기</button>--%>
<%--												</div>--%>
<%--											</div>--%>
<%--										</div>--%>
<%--									</li>--%>

<%--									<li class="filter_3">--%>
<%--										<div class="filter_tit clear">--%>
<%--											<h4>제조사</h4>--%>
<%--											<button class="updown" type="button"><img src="/resources/images/main/filter_up.png" width="12" height="8" border="0" alt="" /></button>--%>
<%--										</div>--%>
<%--										<div class="d2_wrap">--%>
<%--											<ul class="depth2">--%>
<%--												<c:if test="${!empty group_search_company_list }">--%>
<%--													<c:forEach var="o_item" items="${group_search_company_list}"  varStatus="state">--%>
<%--														<c:if test="${state.index<=5}">--%>
<%--															<li>--%>
<%--																<input id="filt3_chk${state.index}" name="searchOption3" type="checkbox" value="${o_item.fd_company_info}">--%>
<%--																<label for="filt3_chk${state.index}">${o_item.fd_company_info}</label>--%>
<%--															</li>--%>
<%--														</c:if>--%>
<%--													</c:forEach>--%>
<%--												</c:if>--%>
<%--											</ul>--%>
<%--											<c:if test="${group_search_company_list_size>=3 }">--%>
<%--												<button class="more_view" style="display: block;" type="button">더보기<img src="/resources/images/main/filter_down.png" width="9" height="5" border="0" alt="" /></button>--%>
<%--											</c:if>--%>
<%--											<c:if test="${group_search_company_list_size>=5 }">--%>
<%--												<button class="full_view" style="display: block;" type="button">전체보기<img src="/resources/images/main/filter_view.png" width="5" height="9" border="0" alt="" /></button>--%>
<%--											</c:if>--%>
<%--											<div class="filt_popup filter_3_popup">--%>
<%--												<div class="filter_pu_tit">--%>
<%--													<h5>제조사 전체</h5>--%>
<%--												</div>	--%>
<%--												<div class="filter_pu_txt">--%>
<%--													<ul class="clear">--%>
<%--														<c:if test="${!empty group_search_company_list }">--%>
<%--															<c:forEach var="o_item" items="${group_search_company_list}"  varStatus="state">--%>
<%--																<li>--%>
<%--																	<input id="f3Chk${state.index}" name="searchOption3" type="checkbox" value="${o_item.fd_company_info }">--%>
<%--																	<label for="f3Chk${state.index}">${o_item.fd_company_info}</label>--%>
<%--																</li>--%>
<%--															</c:forEach>--%>
<%--														</c:if>--%>
<%--													</ul>--%>
<%--												</div>--%>
<%--												<div class="filter_pu_close">--%>
<%--													<button type="button">닫기</button>--%>
<%--												</div>--%>
<%--											</div>--%>
<%--										</div>--%>
<%--									</li>--%>

<%--									<li class="filter_4">--%>
<%--										<div class="filter_tit clear">--%>
<%--											<h4>규격</h4>--%>
<%--											<button class="updown" type="button"><img src="/resources/images/main/filter_up.png" width="12" height="8" border="0" alt="" /></button>--%>
<%--										</div>--%>
<%--										<div class="d2_wrap">--%>
<%--											<ul class="depth2">--%>
<%--												<c:if test="${!empty group_search_standard_list }">--%>
<%--													<c:forEach var="o_item" items="${group_search_standard_list}"  varStatus="state">--%>
<%--														<c:if test="${state.index<=5}">--%>
<%--															<li>--%>
<%--																<input id="filt4_chk${state.index}" name="searchOption4" type="checkbox" value="${o_item.fd_product_standard}">--%>
<%--																<label for="filt4_chk${state.index}">${o_item.fd_product_standard}</label>--%>
<%--															</li>--%>
<%--														</c:if>--%>
<%--													</c:forEach>--%>
<%--												</c:if>--%>
<%--											</ul>--%>
<%--											<c:if test="${group_search_standard_list_size>=3 }">--%>
<%--												<button class="more_view" style="display: block;" type="button">더보기<img src="/resources/images/main/filter_down.png" width="9" height="5" border="0" alt="" /></button>--%>
<%--											</c:if>--%>
<%--											<c:if test="${group_search_standard_list_size>=5 }">--%>
<%--												<button class="full_view" style="display: block;" type="button">전체보기<img src="/resources/images/main/filter_view.png" width="5" height="9" border="0" alt="" /></button>--%>
<%--											</c:if>--%>
<%--											<div class="filt_popup filter_4_popup">--%>
<%--												<div class="filter_pu_tit">--%>
<%--													<h5>규격 전체</h5>--%>
<%--												</div>	--%>
<%--												<div class="filter_pu_txt">--%>
<%--													<ul class="clear">--%>
<%--														<c:if test="${!empty group_search_standard_list }">--%>
<%--															<c:forEach var="o_item" items="${group_search_standard_list}"  varStatus="state">--%>
<%--																<li>--%>
<%--																	<input id="f4Chk${state.index}" name="searchOption4" type="checkbox" value="${o_item.fd_product_standard }">--%>
<%--																	<label for="f4Chk${state.index}">${o_item.fd_product_standard}</label>--%>
<%--																</li>--%>
<%--															</c:forEach>--%>
<%--														</c:if>--%>
<%--													</ul>--%>
<%--												</div>--%>
<%--												<div class="filter_pu_close">--%>
<%--													<button type="button">닫기</button>--%>
<%--												</div>--%>
<%--											</div>--%>
<%--										</div>--%>
<%--									</li>--%>
									<%--
										옵션 추가
									--%>
								</ul>
<%--								<div class="comments_write">--%>
<%--									<button id="btn_result_view" type="button"><img src="/resources/images/main/comment_icon.png" width="13" height="13" border="0" alt="" />검색결과에 의견 남기기</button>--%>
<%--								</div>--%>
								<layout:searchWriteFormFrame/>
							</div>
						</div>

						<div class="right_cnt">
							<%--
							<div class="asso clear">
								<h4>연관검색어</h4>
								<p>타이탄엑스</p>
								<p>타이탄X</p>
								<p>타이탄엑스 파우더</p>
								<p>Titan-X</p>
								<p>Trioss</p>
								<p>타이탄X 골이식재</p>
							</div>
							--%>
							<div class="choice_filter clear">
								<h4>선택된 필터</h4>
								<div class="ch_filt_wrap clear" id="select_filter">
									<%--
									<div class="ch_filt"><p>ABCDEFGHJKLMOPQRSTUVWABCDEFGHJKLMOPQRSTUVW</p><button type="button"><img src="/resources/images/main/ch_filt_delete.jpg" width="8" height="8" border="0" alt="" /></button></div>
									 --%>
								</div>
								<button type="button" class="reset_btn">초기화</button>
							</div>
							<div class="div_blank"></div>
							<form id="f_add_search" name="f_add_search" method="post" action="${action}">
							</form>
							<div class="result_sch">
								<div class="rs_tit clear">
									<h3>병원에서 많이 쓰는 <span>인기제품</span>의 가격비교입니다.</h3>
								</div>
							</div>
							<!--
							<form id="f_add_search" name="f_add_search" method="post" action="${action}">
							<div class="result_sch">
								<div class="rs_tit clear">
									<h3><span>'${searchString}'</span> 에 대한 검색 결과에요.</h3>
									<select name="searchOrderType" id="searchOrderType" class="nis">
										<%--	<option value="">메디밸류 랭킹순</option>
										 --%>
										 <option value="search_type" <c:if test="${searchOrderType eq 'search_type'}">selected="selected"</c:if>>검색</option>
										<option value="low_price" <c:if test="${searchOrderType eq 'low_price'}">selected="selected"</c:if>>낮은 가격순</option>
										<option value="high_price" <c:if test="${searchOrderType eq 'high_price'}">selected="selected"</c:if>>높은 가격순</option>
										<option value="p_name" <c:if test="${searchOrderType eq 'p_name'}">selected="selected"</c:if>>이름순</option>
									</select>
								</div>
								<div class="rs_txt">
									<ul>
										<li class="clear">
											<h4>결과 내 검색</h4>
											<div class="form_cont">
												<label for="searchAddString"><c:if test="${searchAddString eq ''}">검색어를 입력하세요</c:if></label>
												<input type="hidden" id="searchMainColumn" name="searchColumn" value="${searchColumn}"/>
												<input type="hidden" id="searchMainString" name="searchString" value="${searchString}"/>
												<input type="text" id="searchAddString" name="searchAddString" value="${searchAddString}"/>
												<button class="sch_btn" type="button" id="btn_add_search"><img src="/resources/images/main/search_btn4.png" width="13" height="13" border="0" alt="" /></button>
											</div>
											<div class="checks">
												<input type="radio" id="searchAddOptionState_1" name="searchAddOptionState" <c:if test="${searchAddOptionState ne 'N' }">checked="checked"</c:if> value="Y">
												<label for="searchAddOptionState_1">포함</label>
											</div>
											<div class="checks">
												<input type="radio" id="searchAddOptionState_2" name="searchAddOptionState" <c:if test="${searchAddOptionState eq 'N' }">checked="checked"</c:if> value="N">
												<label for="searchAddOptionState_2">제외</label>
											</div>
										</li>
										<li class="clear">
											<h4>결과 내 카테고리</h4>
											<select name="searchAddCategory" id="searchAddCategory" class="nis">
												<option value="">전체목록보기</option>
												<c:if test="${!empty group_search_cate_list }">
													<c:forEach var="o_item" items="${group_search_cate_list}" varStatus="state">
														<option value="${o_item.fk_cate_2_idx}" <c:if test="${o_item.fk_cate_2_idx eq searchAddCategory}">selected="selected"</c:if> >${o_item.cate_1_name} > ${o_item.cate_2_name} </option>
													</c:forEach>
												</c:if>
											</select>
										</li>
									</ul>
								</div>
							</div>
							</form>
							-->

							<c:if test="${empty p_list}">
								<div class="cnt_cate_wrap"></div>
							</c:if>

							<c:if test="${!empty p_list}">
								<c:set var="check_cate" value=""/>
								<c:set var="check_p_cnt" value="0"/>
								<c:set var="check_p_state" value=""/>
								<c:forEach var="p_item" items="${p_list}" varStatus="state" >
									<c:if test="${check_cate != p_item.fk_cate_2_idx}">
										<c:if test="${check_p_cnt != 0}">
												</ul>
											</div>
										</div>
										<c:set var="check_p_cnt" value="0"/>
										</c:if>
										<div class="pd_list pd_list${state.index}">
											<div class="pd_list_tit">
												<h5>${p_item.cate_1_name} - ${p_item.cate_2_name}</h5>
											</div>
										<c:set var="check_p_state" value=""/>
									</c:if>
									<c:if test="${state.first}">
										<div class=pd_list_txt>
											<strong>가격비교</strong>
											<ul class="depth1">
									</c:if>
									<c:if test="${!state.first}">
										<c:if test="${check_p_state ne p_item.fd_product_group_purchase_yn}">
										<c:if test="${check_cate == p_item.fk_cate_2_idx}">
											</div>
										</c:if>
										<div class="pd_list_txt">
											<strong>가격비교</strong>
											<ul class="depth1">
										</c:if>
									</c:if>
										<li class="clear <c:if test="${p_item.fd_option_count > 0}">option </c:if> <c:if test="${!empty p_item.fd_product_insure_code}">insure</c:if>" >
											<input type="hidden" name="tpsm_idx" id="tpsm_idx" value="${p_item.tpsm_idx }" />
											<input type="hidden" name="tsmi_idx" id="tsmi_idx" value="${p_item.fk_tsmi_idx }" />
											<div class="img <c:if test="${p_item.fd_event_yn eq 'Y'}">payback</c:if> <c:if test="${p_item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
												<div class="icon_list">
													<div class="li li_option">
														<div>
															<div class="desc">규격<br>확인</div>
														</div>
													</div>
													<div class="li li_insure">
														<div>
															<div class="desc">보험<br>재료</div>
														</div>
													</div>
												</div>
												<c:if test="${p_item.fd_img_path_thumbnail eq ''}">
<%--													<a href="/product/detail?req_view_idx=${p_item.tpsm_idx }" target="_self">--%>
														<img style="object-fit: contain;" src="${p_item.fd_img_path}" border="0" alt="" onerror="this.src='/resources/images/dummy/250x321.png'" />
<%--													</a>--%>
												</c:if>
												<c:if test="${p_item.fd_img_path_thumbnail ne ''}">
<%--													<a href="/product/detail?req_view_idx=${p_item.tpsm_idx }" target="_self">--%>
														<img style="object-fit: contain;" src="${p_item.fd_img_path_thumbnail}"border="0" alt="" onerror="this.src='/resources/images/dummy/250x321.png'"/>
<%--													</a>--%>
												</c:if>
											</div>

											<div class="info">
												<div class="info_wrap">
													<h4 class="pd_tit">
<%--														<a href="/product/detail?req_view_idx=${p_item.tpsm_idx }" target="_self">--%>
															${p_item.fd_product_name}
<%--														</a>--%>
													</h4>
													<p class="standard"><c:if test="${p_item.fd_product_standard ne '' }">규격 ㅣ ${p_item.fd_product_standard}</c:if></p>
													<p class="manu"><c:if test="${p_item.fd_company_info ne '' }">제조사 ㅣ ${p_item.fd_company_info}</c:if></p>
													<p class="pack"><c:if test="${p_item.fd_product_unit ne '' }">포장단위 ㅣ ${p_item.fd_product_unit }</c:if></p>
												</div>
											</div>

											<div class="price_new">
												<h5><p>가격비교</p>
													<div class="switch_wrap">
														<input type="checkbox" name="" value="" onclick="compareSwitch(this);">
														<div class="alert alert_on">탭을 클릭하시면 재료상별 가격비교가 가능합니다.</div>
														<div class="alert alert_off">탭을 클릭하시면 최저가 제품 구매가 가능합니다.</div>
													</div>
												</h5>
												<div class="price_new_info">
													<div class="price clear">
														<p class="pd_price">
															<c:if test="${loginInfo == null}">
																<p class="pd_price">로그인 후 최저가 확인</p>
															</c:if>
															<c:if test="${loginInfo != null}">
																<p><fmt:formatNumber value="${p_item.shop_product_amount}" pattern="#,###" />원</p>
															</c:if>
														</p>
														<button class="wish_btn" type="button" id="btn_wish"></button>
													</div>
													<!--
													<div class="btn_wrap clear">
														 <button class="cart_btn" id="btn_cart" type="button">장바구니</button>
														 <button class="buy_btn lb" id="btn_buy" type="button">구매하기</button>
														<span class="bar"></span>
													</div>
												    -->
												</div>
												<div class="price_new_comp">
													<ul class="depth2">
														<c:forEach var="min_compare" items="${p_item.min_compare_list}">
															<li class="low_price">
																<button type="button" class="clear">
																	<h6><c:out value="${min_compare.fd_shop_name}"></c:out></h6>
																	<div class="p_wrap"><p><fmt:formatNumber value="${min_compare.fd_amount}" pattern="#,###" />원</p></div>
																</button>
															</li>
														</c:forEach>
														<c:forEach var="compare" items="${p_item.compare_list}">
															<li class="">
																<button type="button" class="clear">
																	<h6><c:out value="${compare.fd_shop_name}"></c:out></h6>
																	<div class="p_wrap"><p><fmt:formatNumber value="${compare.fd_amount}" pattern="#,###" />원</p></div>
																</button>
															</li>
														</c:forEach>
<%--														<li class="<c:if test="${p_item.edent_amount eq p_item.compare_min_amount }">low_price</c:if>">--%>
<%--															<button type="button" class="clear">--%>
<%--																<h6>eDENT</h6>--%>
<%--																<div class="p_wrap"><p><fmt:formatNumber value="${p_item.edent_amount}" pattern="#,###" />원</p></div>--%>
<%--															</button>--%>
<%--														</li>--%>
<%--														<li class="<c:if test="${p_item.dvmall_amount eq p_item.compare_min_amount }">low_price</c:if>">--%>
<%--															<button type="button" class="clear">--%>
<%--																<h6>DVmall</h6>--%>
<%--																<div class="p_wrap"><p><fmt:formatNumber value="${p_item.dvmall_amount}" pattern="#,###" />원</p></div>--%>
<%--															</button>--%>
<%--														</li>--%>
<%--														<li class="<c:if test="${p_item.seil_amount eq p_item.compare_min_amount }">low_price</c:if>">--%>
<%--															<button type="button" class="clear">--%>
<%--																<h6>SeilGlobal</h6>--%>
<%--																<div class="p_wrap"><p><fmt:formatNumber value="${p_item.seil_amount}" pattern="#,###" />원</p></div>--%>
<%--															</button>--%>
<%--														</li>--%>
													</ul>
												</div>
											</div>

										</li>

										<c:set var="check_p_cnt" value="${check_p_cnt+1}"/>
										<c:if test="${state.last}">
												</ul>
											</div>
										</div>
										</c:if>
										<c:set var="check_cate" value="${p_item.fk_cate_2_idx}"/>
										<c:if test="${p_item.fd_product_group_purchase_yn eq 'Y'}">
											<c:set var="check_p_state" value="Y"/>
										</c:if>
										<c:if test="${p_item.fd_product_group_purchase_yn ne 'Y'}">
											<c:set var="check_p_state" value="N"/>
										</c:if>
								</c:forEach>
							</c:if>

						</div>
					</div>
				</div>
			</article>
	
			<%--  히스토리 영역 시작 --%>
<%--			<layout:historyFrame/>--%>
			<%--  히스토리 영역 끝 --%>
		</section>		
	</jsp:body>
</layout:basicFrame>