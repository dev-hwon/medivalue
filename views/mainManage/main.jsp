<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/slick.css"/>
		<link rel="stylesheet" href="/resources/css/main.css?v=20211242" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
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
		<script type="text/javascript" src="/resources/js/main.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script src="/resources/js/jquery/plugin/cookie/jquery.cookie.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				/* $(".bxslider2").bxSlider({
					auto : true,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});

				$(".bxslider3").bxSlider({
					auto : true,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});

				$(".bxslider4").bxSlider({
					auto : true,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});

				$(".bxslider5").bxSlider({
					auto : true,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});

				$(".bxslider22").bxSlider({
					auto : true,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});

				$(".bxslider23").bxSlider({
					auto : true,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});

				$(".bxslider24").bxSlider({
					auto : true,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});

				$(".bxslider25").bxSlider({
					auto : false,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				}); */
// 				g_check_login = "${loginInfo.fd_member_id}";

				var chk_id = $.cookie('medivalue_web_id');
				if(typeof(chk_id)!='undefined' && chk_id!=''){
					$("#user_id").siblings("label").hide();
					$("#user_id").val(chk_id);
					$("#chk_save_id").attr("checked", true);
				}

				$("#chk_save_id").on("click",function(){
					var temp_id = $("#user_id").val();
					if(typeof(temp_id) !='undefined' && temp_id !=''){
						$.cookie('medivalue_web_id', temp_id, { expires: 15, path: "/"});
					}
				});

				/* 카테고리별 추천 제품 - 카테고리 버튼 */
				$(".tab_btn li button").on("click", function(){
					const slider_num = $(this).parent().index() + 6;
					const pd_cate = $(this).parent().find(".cate_num").text();
					let formData = {
						pd_cate : pd_cate
					};

					$.ajax({
	    				url : '/main/rest/cate/products',
	    				type : 'post',
	    				cache : false,
	    				data : formData,
	    				dataType : 'json',
	    			   	success:function(data){
	    			   		if(data.rtn_code == '200'){
	    			   			$.each(data.product_list, function(i, e){
	    			   				const product_name = "[" + e.fd_company_info + "] " + e.fd_product_name;
	    			   				const product_amount = numberToPrice(e.fd_product_amount) + "원";
	    			   				$(".bxslider" + slider_num).find(".pd_idx:eq("+(i+4)+")").text(e.pk_idx);
	    			   				$(".bxslider" + slider_num).find(".pd_image:eq("+(i+4)+")").attr("src", e.fd_img_path);
	    			   				$(".bxslider" + slider_num).find(".pd_tit:eq("+(i+4)+")").text(product_name);
	    			   				$(".bxslider" + slider_num).find(".pd_price:eq("+(i+4)+")").text(product_amount);
	    			   				$(".bxslider" + slider_num).find(".pd_idx:eq("+(i+12)+")").text(e.pk_idx);
	    			   				$(".bxslider" + slider_num).find(".pd_image:eq("+(i+12)+")").attr("src", e.fd_img_path);
	    			   				$(".bxslider" + slider_num).find(".pd_tit:eq("+(i+12)+")").text(product_name);
	    			   				$(".bxslider" + slider_num).find(".pd_price:eq("+(i+12)+")").text(product_amount);
	    			   			});
	    			   			const list_cnt = data.product_list.length;
	    			   			for (let t=0; t<8; t++) {
	    			   				if (t < list_cnt) {
	    			   					$(".bxslider" + slider_num).find(".item_info:eq("+(t+4)+")").removeClass("d-none");
	    			   					$(".bxslider" + slider_num).find(".item_info:eq("+(t+12)+")").removeClass("d-none");
	    			   				} else {
	    			   					$(".bxslider" + slider_num).find(".item_info:eq("+(t+4)+")").addClass("d-none");
	    			   					$(".bxslider" + slider_num).find(".item_info:eq("+(t+12)+")").addClass("d-none");
	    			   				}
	    			   			}
	    			   		}else{
	    			   			alert(data.rtn_msg);
	    			   		}
	    			   	},
	    			   	error:function(request,status,error){
	    			        // alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				});

				/* 찜 버튼 */
				$(".wish_wrap .wish_btn").on("click", function(){
					$(this).parents("li.slick-slide").children("a").attr("onclick","return false");
					if ("${loginInfo}" == "") return false;

					const $obj = $(this);
					const pk_idx = $(this).parent().parent().parent().parent().find(".pd_idx").text();
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
	    			   			// if ($obj.hasClass("on")) {
	    			   			// 	$obj.removeClass("on").find("img").attr("src","/resources/images/main/sub_like_icon.png")
	    			   			// }else {
	    			   			// 	$obj.addClass("on").find("img").attr("src","/resources/images/main/sub_like_icon_on.png")
	    			   			// }
	    			   		}else{
	    			   			alert(data.rtn_msg);
	    			   		}
	    			   	},
	    			   	error:function(request,status,error){
	    			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				});

				/* 장바구니 한번에 담기 */
				$("#main .cnt9 .area .real_area .txt .right .cart_btn, " +
				  "#main .cnt12 .area .real_area .txt ul.depth1_1 li.depth1_1_li2 .cart_btn").on("click", function(){

					const dv = $(this).closest("article").attr("class");

					let $obj = "";
					if (dv == "cnt9") {
						$obj = $("#main .cnt9 .area .real_area .txt .right .item_info");
					} else if (dv == "cnt12") {
						$obj = $("#main .cnt12 .area .real_area div.txt > div.btm ul.slick25 li.item_info");
					}

					let all = false;
					const checked_cnt = $obj.find("input[type=checkbox]:checked").length;
					if (checked_cnt == 0) {
						all = true;
					}

					let list = [];
					let clist = [];		// 체크리스트. 중복 체크를 위해 필요
					$obj.each(function(i){
						let chk = $(this).find("input[type=checkbox]").is(":checked");
						if (chk || all) {
							let pd_idx = $(this).find(".pd_idx").text();
							let pd_tit = $(this).find(".pd_tit").text();
							let pd_price = $(this).find(".pd_price").text().replace("원", "");
							let item = {
								pd_idx: pd_idx,
								pd_tit: pd_tit,
								pd_price: pd_price
							}
							if (clist.find((element) => element == pd_idx) != undefined) return true;
							list.push(item);
							clist.push(pd_idx);
						}
					});

					let tot_price = 0;
					$("#cartPopup2 ul").empty();
					$.each(list, function(i){
						if (i == 0) {
							$("#cartPopup2 h2").text(list[i].pd_tit);
							if (list.length > 1) {
								$("#cartPopup2 h2").text($("#cartPopup2 h2").text() + " 외 " + (list.length - 1) + "종");
							}
						}

						let innerHtml = "" +
						"<li class=\"pop_item\">" +
							"<div class=\"pk_idx d-none\">"+list[i].pd_idx+"</div>" +
							"<h3 class=\"pop_tit\">"+list[i].pd_tit+"</h3>" +
							"<div class=\"price_wrap clear\">" +
								"<div class=\"price clear\">" +
									"<strong class=\"pop_price\">"+list[i].pd_price+"원</strong>" +
									//"<p>0,000원</p>" +
								"</div>" +
								"<div class=\"quan_box clear\">" +
									"<button class=\"minus\">-</button>" +
									"<div class=\"form_cont\">" +
										"<label for=\"cartP"+(i+1)+"\"></label>" +
										"<input type=\"text\" id=\"cartP"+(i+1)+"\" class=\"num pop_cnt\" value=\"1\">" +
									"</div>" +
									"<button class=\"plus\">+</button>" +
								"</div>" +
							"</div>" +
						"</li>";
						$("#cartPopup2 ul").append(innerHtml);
						tot_price = tot_price + priceToNumber(list[i].pd_price);
						$("#cartPopup2").find(".pop_tot_price").text(numberToPrice(tot_price));
					});
				});

				/* 장바구니 버튼 */
				$(".wish_wrap .cart_btn").on("click", function(){

					$(this).parents("li.slick-slide").children("a").attr("onclick","return false");
					if ("${loginInfo}" == "") return false;
					const pk_idx = $(this).closest(".item_info").find(".pd_idx").text();
					const product_name = $(this).closest(".item_info").find(".pd_tit").text();
					const product_price = $(this).closest(".item_info").find(".pd_price").text();

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

				/* 로그인 버튼 */
				$("#btn_login").on("click", function(){
					var temp_id = $("#user_id").val();
					var temp_pw = $("#user_pw").val();
					if( typeof(temp_id) =='undefined' || temp_id.trim() == ''){
						$("#black").show();
						$("#pop_alarm_msg").text("아이디를 확인해주세요.");
						$(".popup_message_type_1").css("display","block");
						//$("#user_id").focus();
						return;
					}else if( typeof(temp_pw) =='undefined' || temp_pw.trim() ==''){
						$("#black").show();
						$("#pop_alarm_msg").text("비밀번호를 확인해주세요.");
						$(".popup_message_type_1").css("display","block");
						return;
					}else{
						var formData = $("#f_login").serialize();
						$.ajax({
		    				url : '/access/rest/loginProc',
		    				type : 'post',
		    				cache : false,
		    				data : formData,
		    				dataType : 'json',
		    			   	success:function(data){
		    			   		if(data.rtn_code =='200'){
									var temp_id = $("#user_id").val();
									if(typeof(temp_id) !='undefined' && temp_id !=''){
										$.cookie('medivalue_web_id', temp_id, { expires: 15, path: "/"});
									}
		    			   			location.replace('/index');
		    			   		}else{
		    			   			$("#black").show();
		    						$("#pop_alarm_msg").text(data["rtn_msg"]);
		    						$(".popup_message_type_1").css("display","block");
		    			   		}
		    			   	},
		    			   	error:function(request,status,error){
		    			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    			    }
						});
					}
				});

				$("#user_pw").on("keyup", function(e){
					if (e.keyCode == 13) {
						$("#btn_login").click();
            		}
				});

				$(".join_btn").on("click", function () {
					location.href = "/member/join";
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

				/* 수정 210927 시작 */
				function slider () {
					var $visual=$("#main .cnt1_3 .area .real_area .c1_right .visual li");
					var $paging=$("#main .cnt1_3 .area .real_area .c1_right .paging li");
					var total=$visual.length;
					var nowNum=0;
					var nextNum;
					var playNext;

					$paging.children().on("mouseenter",function  () {
						nextNum=$(this).parent().index();
						clearInterval(playNext);

						if (nowNum==nextNum) return false;

						$(this).parent().addClass("on").siblings().removeClass("on");
						if (nowNum>nextNum) {
							$visual.eq(nowNum).css("left",0).stop().animate({left:"100%"});
							$visual.eq(nextNum).css("left","-100%").stop().animate({left:0});
						}else {
							$visual.eq(nowNum).css("left",0).stop().animate({left:"-100%"});
							$visual.eq(nextNum).css("left","100%").stop().animate({left:0});
						}

						nowNum=nextNum;
					});

					$paging.children().on("mouseleave",function  () {
						playNext=setInterval(function  () {
							nextNum=nowNum+1;
							if (nextNum==total) nextNum=0;

							$paging.eq(nextNum).addClass("on").siblings().removeClass("on");
							$visual.eq(nowNum).css("left",0).stop().animate({left:"-100%"});
							$visual.eq(nextNum).css("left","100%").stop().animate({left:0});

							nowNum++;
							if (nowNum==total) nowNum=0;
						}, 3000);
					});

					function timer () {
						playNext=setInterval(function  () {
							nextNum=nowNum+1;
							if (nextNum==total) nextNum=0;

							$paging.eq(nextNum).addClass("on").siblings().removeClass("on");
							$visual.eq(nowNum).css("left",0).stop().animate({left:"-100%"});
							$visual.eq(nextNum).css("left","100%").stop().animate({left:0});

							nowNum++;
							if (nowNum==total) nowNum=0;
						}, 3000);
					}
					timer ();
				}
				slider ();
				/* 수정 210927 끝 */


				$(".btn_option").hover(function () {
					let ul = $(this).siblings(".sub").children("ul");
					let pd_idx = $(this).parent().parent().parent().parent().siblings(".pd_idx").text();
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

			// function addCart3(obj) {
			// 	let formData = {};
			// 	$.each($("#" + pop_id).find(".pop_item"), function(i){
			// 		const pk_idx = $(this).find(".pk_idx").text();
			// 		const cnt = $(this).find(".pop_cnt").val();
			// 		formData['list['+i+'].fk_tpsm_idx'] = pk_idx;
			// 		formData['list['+i+'].cnt'] = cnt;
			// 	});
			// 	console.log(formData);
			// }
			//
			// function addCart4(obj) {
			//
			// }

			/* 메디밸류 핫 제품군 TOP5 - 개별 장바구니 버튼 클릭 시 */
			function viewCart($obj) {
				if ("${loginInfo}" == "") return false;
				const pk_idx = $obj.closest(".item_info").find(".pd_idx").text();
				const product_name = $obj.closest(".item_info").find(".pd_tit").text();
				const product_price = $obj.closest(".item_info").find(".pd_price").text();
				$("#cartPopup1").find("input[name=pk_idx]").text(pk_idx);
				$("#cartPopup1").find(".pk_idx").text(pk_idx);
				$("#cartPopup1").find(".pop_tit").text(product_name);
				$("#cartPopup1").find(".pop_price").text(product_price);
				$("#cartPopup1").find(".pop_tot_price").text(product_price.replace("원", ""));
				$("#cartPopup1").find(".pop_cnt").val(1);
				$(".cart_popup.on").css("display","block");
				$("#black3").css("display","block");
			}
		</script>
		
		<script>
		$(function(){
			/* slick slider */
			$(".slick01").slick({
				slidesToShow: 1,
				slidesToScroll: 1,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				swipe: false,
				dots: true
			});
			$(".slick02_1").slick({
				slidesToShow: 4,
				slidesToScroll: 4,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				swipe: false,
				prevArrow: $('.slick02_1_prev'),
				nextArrow: $('.slick02_1_next')
			});
			$(".slick02").slick({
				slidesToShow: 4,
				slidesToScroll: 4,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				swipe: false,
				prevArrow: $('.slick02_prev'),
				nextArrow: $('.slick02_next')
			});
			$(".slick03").slick({
				slidesToShow: 3,
				slidesToScroll: 3,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				swipe: false,
				prevArrow: $('.slick03_prev'),
				nextArrow: $('.slick03_next')
			});
			$(".slick04").slick({
				slidesToShow: 3,
				slidesToScroll: 3,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				swipe: false,
				prevArrow: $('.slick04_prev'),
				nextArrow: $('.slick04_next')
			});
			$(".slick05").slick({
				slidesToShow: 4,
				slidesToScroll: 4,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				swipe: false,
				prevArrow: $('.slick05_prev'),
				nextArrow: $('.slick05_next')
			});
			$(".slick05_1").slick({
				slidesToShow: 4,
				slidesToScroll: 4,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				swipe: false,
				prevArrow: $('.slick05_1_prev'),
				nextArrow: $('.slick05_1_next')
			});
			$(".slick22").slick({
				slidesToShow: 3,
				slidesToScroll: 3,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				swipe: false,
				prevArrow: $('.slick22_prev'),
				nextArrow: $('.slick22_next')
			});
			$(".slick23").slick({
				slidesToShow: 4,
				slidesToScroll: 4,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				swipe: false,
				prevArrow: $('.slick23_prev'),
				nextArrow: $('.slick23_next')
			});
			$(".slick24").slick({
				slidesToShow: 3,
				slidesToScroll: 3,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				swipe: false,
				prevArrow: $('.slick24_prev'),
				nextArrow: $('.slick24_next')
			});
			$(".slick25").slick({
				slidesToShow: 4,
				slidesToScroll: 4,
				infinite: true,
				autoplay: true,
				autoplaySpeed: 4000,
				swipe: false
			});
			<%--
			/* 오늘 하루 열지 않음 START */
	        if (document.cookie.indexOf("todayPop=done") < 0){     
	        	$(".today_popup").show();
	        }
	        else {
	        	$(".today_popup").hide();
	        }
	        /* 오늘 하루 열지 않음 END */
	         --%>
	        
		});
		
		/* 오늘 하루 열지 않음 START */		
		function setCookie( name, value, expiredays ) {
            var todayDate = new Date();
            todayDate.setDate( todayDate.getDate() + expiredays ); 
            document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
    	}
		function closePopDay() {
            setCookie("todayPop", "done" , 1);
            $(".today_popup").hide();
        }
        function closePop() {
            $(".today_popup").hide();
        }
		/* 오늘 하루 열지 않음 END */
		
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="main">
			<div class="layer_popup today_popup">
				<!-- <div class="bg"></div> -->
				<div class="cont">
					<div class="inner_box">
						<div class="img">
							<img src="/resources/images/main/img_popup_today_220119.jpg" />
						</div>
						<div class="btn">
							<button onclick="closePopDay();"></button>
							<button onclick="closePop();"></button>
						</div>
					</div>
				</div>
			</div>
			<article class="main_visual">
				<div class="inner">
					<div class="visual_slide">
						<ul class="slick01">
							<li>
								<a href="/notice/view?idx=29&num=13">
									<div class="img"><img src="/resources/images/main/img_visual_slide06.jpg?v20220303" /></div>
								</a>
							</li>
							<li>
								<a href="/product/pclist">
									<div class="img"><img src="/resources/images/main/img_visual_slide01.jpg?v20220114" /></div>
								</a>
							</li>
							<li>
								<a href="/notice/view?idx=22&num=6">
									<div class="img"><img src="/resources/images/main/img_visual_slide03.jpg?v20220118" /></div>
								</a>
							</li>
							<li>
								<a href="/notice/view?idx=25&num=9">
									<div class="img"><img src="/resources/images/main/img_visual_slide04.jpg?v20220118" /></div>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</article>
			<%--
			<article class="cnt1_3">
				<div class="area">
					<div class="real_area clear">
						< % -- 로그인 전 시작 -- % >	
						<form id="f_login" name="f_login" action="/access/loginProc" method="post">
						<c:if test="${loginInfo == null }">
						<div class="c1_left" id="intro_login">
							<div class="c1_left_wrap">
								<h2>로그인하고 다양한 혜택을 받으세요</h2>
								<ul>
									<li class="c1_left_li1">
										<div class="form_cont">
											<label for="user_id"></label>
											<input type="text" id="user_id" name="user_id" value="" placeholder="아이디를 입력해주세요"/>
										</div>
									</li>
									<li class="c1_left_li2">
										<div class="form_cont">
											<label for="user_pw"></label>
											<input type="password" id="user_pw" name="user_pw" value="" placeholder="비밀번호를 입력해주세요"/>
										</div>
									</li>
									<li class="clear c1_left_li3">
										<div class="chk_wrap">
											<input id="chk_save_id" type="checkbox" name="chk_save_id">
											<label for="chk_save_id">아이디 저장</label>
										</div>
										<div class="find_mem">
											<button type="button" class="find_id" onclick="javascript:location.href='/member/find/id';">아이디 찾기</button>
											<button type="button" class="find_pw" onclick="javascript:location.href='/member/find/password';">비밀번호 찾기</button>
										</div>
									</li>
								</ul>
								<div class="btn_wrap clear">
									<button type="button" class="join_btn">회원가입</button>
									<button type="button" id="btn_login" class="login_btn">로그인</button>
								</div>
							</div>
						</div>
						</c:if>
						< % -- 로그인 전 끝 -- % >
						< % -- 로그인 후 시작 -- % >
						<c:if test="${loginInfo != null }">
						<div class="c2_left" id="intro_user">
							<div class="c1_left_wrap">
								<h2>안녕하세요,</h2>
								<div class="c1_left_box">
									<h3>${loginInfo.fd_medical_name}님,</h3>
									<strong>
										스마트한 재료 구매를 시작해 보세요.
										< % -- 
										<c:choose>
											<c:when test="${loginInfo.lately_access_day ==0}">
												재방문해주셨네요!
											</c:when>
											<c:when test="${loginInfo.lately_access_day >=1}">
												${loginInfo.lately_access_day}일만에 방문해주셨네요!
											</c:when>
											<c:otherwise>
												오랫만에 방문해주셨네요.
											</c:otherwise>
										</c:choose>
										 -- % >
									</strong>
 < % --									<button type="button" onclick="javascript:location.href='/myhome/info';">우리 병원의 재료 구매내역, 추천을 확인해 보세요</button>-- % >
									<button type="button" onclick="javascript:location.href='/myhome/info';">우리 병원의 재료 구매내역을 한 곳에서 확인해보세요.</button>
									<c:if test="${!empty requestScope.main_coupon_list }">
										<c:forEach var="item" items="${requestScope.main_coupon_list}" varStatus="state">
											<p>[${item.fd_coupon_name}] ${item.strCouponExpireDate}까지</p>
										</c:forEach>
									</c:if>
									< %--
									<p>[행사공지] GAMEX 2021 메디밸류 참가 행사 초대문 2021/09/25</p>
									<p>[쿠폰발급] SIDEX 2021 부스 방문 가입 20% 쿠폰이 지급되었어요</p>
									 -- % >
								</div>
							</div>
						</div>
						</c:if>
						< % -- 로그인 후 끝 -- % >
						<div class="c1_right">
							<ul class="visual">
								<li class="list1"><a href="/product/list?req_munu_idx=13" target="_self"><img src="/resources/images/main/c1_right_visual1.jpg" width="614" height="256" border="0" alt="" /></a></li>
								<li class="list2"><a href="/myhome/info" target="_self"><img src="/resources/images/main/c1_right_visual2.jpg" width="614" height="256" border="0" alt="" /></a></li>
								<li class="list3"><a href="/order/list" target="_self"><img src="/resources/images/main/c1_right_visual3.jpg" width="614" height="256" border="0" alt="" /></a></li>
							</ul>
							<ul class="paging">
								<li class="on"><a href="/product/list?req_munu_idx=13" target="_self">구매추천</a></li>
								<li><a href="/myhome/info" target="_self">MY 홈</a></li>
								<li><a href="/order/list" target="_self">주문/배송</a></li>
							</ul>
						</div>
						< % --
						<div class="c1_right">
							<h2><span>혜택</span>은 역시, 메디밸류 스토어</h2>
							<ul>
								<li class="c1_right_li1" style="background-image: url('/resources/images/main/main_1.png');">
									<a href="/product/list?req_munu_idx=9" target="_self">
										< %--
										<span class="icon"><img src="/resources/images/main/mn_c1_1_icon1.jpg" width="75" height="57" border="0" alt="" /></span>
										<h3>구매 추천 바로가기</h3>
										 --% > 
									</a>
								</li>
								<li class="c1_right_li2" style="background-image:url('/resources/images/main/main_2.png');">
									<a href="/myhome/info" class="btn_as" target="_self">
										< %--<span class="icon"><img src="/resources/images/main/mn_c1_1_icon2.jpg" width="75" height="57" border="0" alt="" /></span>
										<h3>A/S 서비스 신청하기</h3>--% >
									</a>
								</li>
								<li class="c1_right_li3" style="background-image: url('/resources/images/main/main_3.png');">
									<a href="#">
										< %--<span class="icon"><img src="/resources/images/main/mn_c1_1_icon3.jpg" width="75" height="57" border="0" alt="" /></span>
										<h3>주문/배송 조회하기</h3>--% >
									</a>
								</li>
							</ul>
						</div>
						 -- % >
						</form>
					</div>
				</div>
			</article>
			 --%>
			<c:if test="${!empty main_menu_small_list}">
				<%-- 소장비 패키지 추가 2021.12.28. --%>								
				<article class="cnt2_1 noti active">
					<div class="area">
						<div class="real_area">
							<div class="tit">
								<h3>소장비 패키지 최저가 구매</h3>
								<p>최대 60만원 더 저렴하게!</p>
							</div>
							<div class="txt">
								<div class="slick_wrap">
									<ul class="slick02_1">
										<c:forEach var="item" items="${main_menu_small_list}" varStatus="status">
											<c:set var="mileage_info" value=""/>
											<c:if test="${item.fd_custom_use_point_yn eq 'Y' }">
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
											</c:if>
											<li class="item_info ${li_class}">
												<div class="pd_idx d-none">${item.fk_tpsm_idx}</div>
												<a href="/product/detail?req_view_idx=${item.fk_tpsm_idx}" target="_self">
													<div class="img ${div_class}" ${mileage_info}>
														<div class="icon_list">
															<div class="li li_option">
																<div>
																	<div class="tit"><strong><c:out value="${item.tpsm_product_group_cnt}"/></strong>개</div>
																	<div class="desc">규격선택</div>
																</div>
															</div>
															<div class="li li_insure">
																<div>
																	<div class="desc">보험<br>재료</div>
																</div>
															</div>
														</div>
														<img class="pd_image" id="pd_img_info" src="${item.view_image}" onerror="this.src='/resources/images/dummy/640x480.png'" width="250" height="321" border="0" alt="" />
														<div class="wish_wrap">
															<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>
													<div class="info">
														<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>
														<div class="price clear">
															
															<!-- <strong class="percent">75%</strong> -->
															<c:if test="${loginInfo == null}">
															<p class="pd_price">로그인 후 최저가 확인</p>
															</c:if>
															<c:if test="${loginInfo != null}">
															<p class="pd_price"><fmt:formatNumber value="${item.shop_product_amount}" pattern="#,###" />원</p>
															</c:if>
															<div class="option_list">
																<button class="btn_option">규격확인</button>
																<div class="sub">
																	<div class="tit">규격정보</div>
																	<ul></ul>
																</div>
															</div>
														</div>
														<div class="cost"><p></p></div>
													</div>
												</a>
											</li>
										</c:forEach>
									</ul>
									<button class="slick-prev slick02_1_prev">prev</button>
									<button class="slick-next slick02_1_next">next</button>
								</div>
							</div>
						</div>
					</div>
				</article>
			</c:if>
<%-- 			<c:if test="${!empty main_menu_list}"> --%>
<%-- 			<c:forEach var="mitem" items="${main_menu_list}" varStatus="mstatus"> --%>
<%-- 			<c:if test="${mitem.fd_menu_name eq '최대 할인율 특가'}"> --%>
			<%--
				<c:if test="${!empty product_list_max_sale}">
			 --%>
			<%-- 페이백 숨김 2021.12.28. --%>				
			<!-- 신규 slickslider -->
			<%--<article class="cnt2 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>구매한 만큼 100% 돌려주는 커다란 혜택</h3>
							<p>수량, 구매액 제한 없이 필요한 제품 마음껏 구매하세요.</p>
						</div>
						<div class="txt">
							<div class="slick_wrap">
								<ul class="slick02">
									<c:forEach var="item" items="${product_list_max_sale}" varStatus="status">
										<li class="item_info <c:if test="${!empty item.fd_option_count && item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
											<div class="pd_idx d-none">${item.pk_idx}</div>
											<a href="/product/detail?req_view_idx=${item.pk_idx}" target="_self">
												<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
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
													<img class="pd_image" id="pd_img_info" src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="250" height="321" border="0" alt="" />
													<div class="wish_wrap">
														<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
												<div class="info">
													<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>
													<div class="price clear">
														
														<!-- <strong class="percent">75%</strong> -->
														<c:if test="${loginInfo == null}">
														<p class="pd_price">로그인 후 최저가 확인</p>
														</c:if>
														<c:if test="${loginInfo != null}">
														<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>
														</c:if>
														<div class="option_list">
															<button class="btn_option">규격확인</button>
															<div class="sub">
																<div class="tit">규격정보</div>
																<ul></ul>
															</div>
														</div>
													</div>
													<div class="cost"><p></p></div>
												</div>
											</a>
										</li>
									</c:forEach>
								</ul>
								<button class="slick-prev slick02_prev">prev</button>
								<button class="slick-next slick02_next">next</button>
							</div>
						</div>
					</div>
				</div>
			</article>--%>
			
			<!-- 기존 bxslider -->
			<%-- <article class="cnt2 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>제값 주고 사면 아깝잖아요!</h3>
							<p>최대 할인율 특가</p>
						</div>
						<div class="txt">
							<ul class="depth1 bxslider2">
							<c:forEach var="item" items="${product_list_max_sale}" varStatus="status">
								
								<c:if test="${status.index % 4 eq 0}">
								<li>
									<ul class="depth2 clear">
								</c:if>
										<li class="item_info">
											<div class="pd_idx d-none">${item.pk_idx}</div>
											<a href="/product/detail?req_view_idx=${item.pk_idx}" target="_self">
												<div class="img">
													<img class="pd_image" id="pd_img_info" src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="250" height="321" border="0" alt="" />
													<div class="wish_wrap">
														<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
												<div class="info">
													<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>
													<div class="price clear">
														
														<!-- <strong class="percent">75%</strong> -->
														<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>
													</div>
													<div class="cost"><p><!-- 0,000,000원 --></p></div>
												</div>
											</a>
										</li>
								<c:if test="${status.index % 4 eq 3}">
									</ul>
								</li>
								</c:if>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</article> --%>
			<%--
			</c:if>
			 --%>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${mitem.fd_menu_name eq '24시간 한정판매'}"> --%>
<%--			<c:if test="${!empty product_list_24hour_sale}">--%>
<%--			<c:forEach var="item" items="${product_list_24hour_sale}" varStatus="status">--%>
<%--			<article class="cnt3">--%>
<%--				<div class="area">--%>
<%--					<div class="real_area clear">--%>
<%--						<a href="/product/detail?req_view_idx=${item.pk_idx}">--%>
<%--							<div class="left">--%>
<%--								<div class="tit">--%>
<%--<!-- 									<h3>매일 오전 9시</h3> -->--%>
<%--<!-- 									<span class="bar"></span> -->--%>
<%--<!-- 									<p>24시간 한정 판매</p> -->--%>
<%--									<h3>매주 월요일 9시</h3>--%>
<%--									<span class="bar"></span>--%>
<%--									<p>1주일 한정 판매</p>--%>
<%--								</div>--%>
<%--								<div class="info">--%>
<%--									<div class="pd_idx d-none">${item.pk_idx}</div>--%>
<%--									<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>--%>
<%--									<div class="price clear">--%>
<%--										&lt;%&ndash;--%>
<%--										<strong class="percent">75%</strong>--%>
<%--										 &ndash;%&gt;--%>
<%--										<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>--%>
<%--									</div>--%>
<%--									<div class="cost"><p>&lt;%&ndash; 0,000,000원 &ndash;%&gt;</p></div>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--							<div class="right">--%>
<%--								<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">--%>
<%--									<img src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="785" height="383" border="0" alt="" />--%>
<%--								</div>--%>
<%--								<div class="mark"><p>타임딜</p></div>--%>
<%--								<div class="time">--%>
<%--									<p><img src="/resources/images/main/main_time_icon.png" width="22" height="22" border="0" alt="" /><span class="timer_txt">0일 23:59:59</span></p>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</a>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			</article>--%>
<%--			</c:forEach>--%>
<%--			</c:if>--%>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${mitem.fd_menu_name eq '일주일 한정 특가'}"> --%>
			<c:if test="${!empty product_list_week_sale}">
			<!-- 신규 slickslider -->
			<article class="cnt4 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit">
<!-- 							<h3>단 7일간 마감임박 특가</h3> -->
<!-- 							<p>일주일 한정 특가</p> -->
							<h3>단 한달간 한정 수량만!</h3>
							<p>기간 한정 제품</p>
						</div>
						<div class="txt">
							<div class="slick_wrap div3">
								<ul class="slick03">
									<c:forEach var="item" items="${product_list_week_sale}" varStatus="status">
										<li class="item_info <c:if test="${!empty item.fd_option_count && item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
											<div class="pd_idx d-none">${item.pk_idx}</div>
											<a href="/product/detail?req_view_idx=${item.pk_idx}" target="_self">
												<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
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
													<img id="pd_img_info" src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="340" height="339" border="0" alt="" />
													<div class="wish_wrap">
														<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
												<div class="info">
													<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>
													<div class="price clear">
														<%-- <strong class="percent">10%</strong> --%>
														<c:if test="${loginInfo == null}">
															<p class="pd_price">로그인 후 최저가 확인</p>
														</c:if>
														<c:if test="${loginInfo != null}">
															<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>
														</c:if>
														<div class="option_list">
															<button class="btn_option">규격확인</button>
															<div class="sub">
																<div class="tit">규격정보</div>
																<ul>
																</ul>
															</div>
														</div>
													</div>
													<div class="cost"><p><%-- 0,000,000원 --%></p></div>
												</div>
											</a>
										</li>
									</c:forEach>
								</ul>
								<button class="slick-prev slick03_prev">prev</button>
								<button class="slick-next slick03_next">next</button>
							</div>
						</div>
					</div>
				</div>
			</article>
			
			<!-- 기존 bxslider -->
			<%-- <article class="cnt4 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>단 7일간 마감임박 특가</h3>
							<p>일주일 한정 특가</p>
						</div>
						<div class="txt">
							<ul class="depth1 bxslider3">
							<c:forEach var="item" items="${product_list_week_sale}" varStatus="status">
								<c:if test="${status.index % 3 eq 0}">
								<li>
									<ul class="depth2 clear">
								</c:if>
										<li class="item_info">
											<div class="pd_idx d-none">${item.pk_idx}</div>
											<a href="/product/detail?req_view_idx=${item.pk_idx}" target="_self">
												<div class="img">
													<img id="pd_img_info" src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="340" height="339" border="0" alt="" />
													<div class="wish_wrap">
														<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
												<div class="info">
													<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>
													<div class="price clear">
														<strong class="percent">10%</strong>
														<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
								<c:if test="${status.index % 3 eq 2}">
									</ul>
								</li>
								</c:if>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</article>  --%>
			</c:if>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${mitem.fd_menu_name eq '메디밸류 기획전'}"> --%>
			<c:if test="${!empty product_list_exhibition}">
			
			<!-- 신규 slickslider -->
			<article class="cnt5">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>시선집중, 이런 제품은 어때요?</h3>
							<p>메디밸류 기획전</p>
						</div>
						<div class="txt">
							<div class="video">
								<iframe src="${product_exhibition_video.fd_video_path}" width="100%" height="100%" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>
							</div>
							<div class="product">
								<div class="slick_s_wrap">
									<ul class="slick04">
									<c:forEach var="item" items="${product_list_exhibition}" varStatus="status">
										<li class="<c:if test="${!empty item.fd_option_count && item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
											<div class="pd_idx d-none">${item.pk_idx}</div>
											<a href="/product/detail?req_view_idx=${item.pk_idx}" class="clear" target="_self">
												<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
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
													<img src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="83" height="82" border="0" alt="" />
												</div>
												<div class="info">
													<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>
													<div class="price clear">
														<strong class="percent"><%-- 10% --%></strong>
														<c:if test="${loginInfo == null}">
															<p class="pd_price">로그인 후 최저가 확인</p>
														</c:if>
														<c:if test="${loginInfo != null}">
															<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>
														</c:if>
													</div>
												</div>
											</a>
										</li>
									</c:forEach>
									</ul>
									<button class="slick-prev slick04_prev">prev</button>
									<button class="slick-next slick04_next">next</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
			
			<!-- 기존 bxslider -->
			<%-- <article class="cnt5">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>시선집중, 이런 제품은 어때요?</h3>
							<p>메디밸류 기획전</p>
						</div>
						<div class="txt">
							<div class="video">
								<iframe src="${product_exhibition_video.fd_video_path}" width="100%" height="100%" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>
							</div>
							<div class="product">
								<ul class="depth1 bxslider4">
								<c:forEach var="item" items="${product_list_exhibition}" varStatus="status">
									<c:if test="${status.index % 3 eq 0}">
									<li>
										<ul class="depth2 clear">
									</c:if>
											<li>
												<div class="pd_idx d-none">${item.pk_idx}</div>
												<a href="/product/detail?req_view_idx=${item.pk_idx}" class="clear" target="_self">
													<div class="img"><img src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="83" height="82" border="0" alt="" /></div>
													<div class="info">
														<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>
														<div class="price clear">
															<strong class="percent">10%</strong>
															<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>
														</div>
													</div>
												</a>
											</li>
									<c:if test="${status.index % 3 eq 2}">
										</ul>
									</li>
									</c:if>
								</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</article> --%>
			
			</c:if>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${mitem.fd_menu_name eq '인기 제품 총출동'}"> --%>
			<c:if test="${!empty product_list_popular}">
			<!-- 신규 slickslider -->
			<article class="cnt6 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>지금 제일 잘 나가는 제품</h3>
							<p>인기 제품 총출동</p>
						</div>
						<div class="txt">
							<div class="slick_wrap">
								<ul class="slick05">
									<c:forEach var="item" items="${product_list_popular}" varStatus="status">
										<li class="item_info  <c:if test="${!empty item.fd_option_count && item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
											<div class="pd_idx d-none">${item.pk_idx}</div>
											<a href="/product/detail?req_view_idx=${item.pk_idx}" target="_self">
												<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
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
													<img id="pd_img_info" src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="250" height="321" border="0" alt="" />
													<div class="wish_wrap">
														<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
												<div class="info">
													<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>
													<div class="price clear">
														<strong class="percent"><%--10% --%></strong>
														<c:if test="${loginInfo == null}">
															<p class="pd_price">로그인 후 최저가 확인</p>
														</c:if>
														<c:if test="${loginInfo != null}">
															<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>
														</c:if>
														<div class="option_list">
															<button class="btn_option">규격확인</button>
															<div class="sub">
																<div class="tit">규격정보</div>
																<ul>
																</ul>
															</div>
														</div>
													</div>
													<div class="cost"><p><%--0,000,000원 --%></p></div>
												</div>
											</a>
										</li>
									</c:forEach>
								</ul>
								<button class="slick-prev slick05_prev">prev</button>
								<button class="slick-next slick05_next">next</button>
							</div>
						</div>
						
						<div class="banner"><a href="#"><img src="/resources/images/main/mn_c6_banner.png" width="1052" height="141" border="0" alt="" /></a></div>
					</div>
				</div>
			</article>
			
			<!-- 기존 bxslider -->
			<%-- <article class="cnt6 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>지금 제일 잘 나가는 제품</h3>
							<p>인기 제품 총출동</p>
						</div>
						<div class="txt">
							<ul class="depth1 bxslider5">
							<c:forEach var="item" items="${product_list_popular}" varStatus="status">
								<c:if test="${status.index % 4 eq 0}">
								<li>
									<ul class="depth2 clear">
								</c:if>
										<li class="item_info">
											<div class="pd_idx d-none">${item.pk_idx}</div>
											<a href="/product/detail?req_view_idx=${item.pk_idx}" target="_self">
												<div class="img">
													<img id="pd_img_info" src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="250" height="321" border="0" alt="" />
													<div class="wish_wrap">
														<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
												<div class="info">
													<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>
													<div class="price clear">
														<strong class="percent">10%</strong>
														<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
								<c:if test="${status.index % 4 eq 3}">
									</ul>
								</li>
								</c:if>
							
							</c:forEach>
							
							</ul>
						</div>
						
						<div class="banner"><a href="#"><img src="/resources/images/main/mn_c6_banner.png" width="1052" height="141" border="0" alt="" /></a></div>
					</div>
				</div>
			</article> --%>
			</c:if>
			
<%-- 			</c:if> --%>
<%-- 			<c:if test="${mitem.fd_menu_name eq '카테고리별 추천 제품'}"> --%>
			<%-- 
			<article class="cnt7 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>이 제품도 필요하실 것 같아요!</h3>
							<p>카테고리별 추천 제품</p>
						</div>
						<div class="txt">
							<div class="tab_split" id="tab1">
								<ul class="tab_btn clear">
									<c:if test="${!empty cate_list_1}">
										<c:forEach var="item" items="${cate_list_1}" varStatus="status">
											<c:if test="${status.index % 8 eq 0}"><c:set var="v_class" value="first "/></c:if>
											<c:if test="${status.index % 8 ne 0}"><c:set var="v_class" value=""/></c:if>
											<c:if test="${item.pk_idx eq pd_cate}"><c:set var="v_class2" value=" on"/><c:set var="cate_name" value="${item.fd_name}"/></c:if>
											<c:if test="${item.pk_idx ne pd_cate}"><c:set var="v_class2" value=""/></c:if>
											<li class="${v_class}tab_btn${status.index + 1}${v_class2}"><button>${item.fd_name}</button><div class="cate_num d-none">${item.pk_idx}</div></li>
										</c:forEach>
									</c:if>
									<!--
									<c:if test="${empty cate_list_1}">
										<li class="first tab_btn1 on"><button type="button">인상재</button></li>
										<li class="tab_btn2"><button type="button">시멘트</button></li>
										<li class="tab_btn3"><button type="button">근관재</button></li>
										<li class="tab_btn4"><button type="button">레진/본딩/애칭</button></li>
										<li class="tab_btn5"><button type="button">바(Bur)/연마재</button></li>
										<li class="tab_btn6"><button type="button">트레이/스케일러팁</button></li>
										<li class="tab_btn7"><button type="button">위생/소독/멸균</button></li>
										<li class="tab_btn8"><button type="button">템포관련/덴쳐</button></li>
										<li class="first tab_btn9"><button type="button">수술재료/마취</button></li>
										<li class="tab_btn10"><button type="button">방사선재/교합관련</button></li>
										<li class="tab_btn11"><button type="button">스톤/석고</button></li>
										<li class="tab_btn12"><button type="button">아말감/GI</button></li>
										<li class="tab_btn13"><button type="button">기타 치과 재료</button></li>
										<li class="tab_btn14"><button type="button">치과기구</button></li>
										<li class="tab_btn15"><button type="button">마스크/글러브/석션</button></li>
										<li class="tab_btn16"><button type="button">임플란트</button></li>
									</c:if>
									 -->
								</ul>
								<div class="tab_cnt">
									<c:if test="${!empty cate_list_1}">
									<c:forEach var="cate_item" items="${cate_list_1}" varStatus="cate_status">
										<c:set var="cate_name" value="${cate_item.fd_name}"/>
										<c:set var="cate_idx" value="${cate_item.pk_idx}"/>
									<div class="tab_cnt${cate_status.index + 1}">
										<ul class="depth1 bxslider${cate_status.index + 6} bxs">
										<c:if test="${!empty product_list}">
										<c:forEach var="item" items="${product_list}" varStatus="status">
											<c:if test="${status.index % 4 eq 0}">
											<li>
												<ul class="depth2 clear">
											</c:if>
													<li class="item_info <c:if test="${item.pk_idx eq 0}">d-none</c:if>">
														<div class="pd_idx d-none">${item.pk_idx}</div>
														<a href="/product/detail?req_view_idx=${item.pk_idx}" target="_self">
															<div class="img">
																<img id="pd_img_info" class="pd_image" src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="250" height="321" border="0" alt="" />
																<div class="wish_wrap">
																	<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
																	<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
																</div>
															</div>
															
															<div class="info">
																<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>
																<div class="price clear">
																	<strong class="percent"><!--10% --></strong>
																	<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>
																</div>
																<div class="cost"><!-- <p>0,000,000원</p>--></div>
															</div>
														</a>
													</li>
											<c:if test="${status.index % 4 eq 3}">
												</ul>
											</li>
											</c:if>
										</c:forEach>
										</c:if>
										<!--
										<c:if test="${empty product_list}">
										<c:forEach var="item" begin="0" end="7">
											<c:if test="${item % 4 eq 0}">
											<li>
												<ul class="depth2 clear">
											</c:if>
													<li class="item_info">
														<a href="/product/detail?req_view_idx=${item.pk_idx}" target="_self">
															<div class="img">
																<img id="pd_img_info" src="/resources/images/main/mn_c2_img${(item % 4) + 1}.png" width="250" height="321" border="0" alt="" />
																<div class="wish_wrap">
																	<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
																	<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
																</div>
															</div>
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0원</p>
																</div>
																<div class="cost"><p>0원</p></div>
															</div>
														</a>
													</li>
											<c:if test="${item % 4 eq 3}">
												</ul>
											</li>
											</c:if>
										</c:forEach>
										</c:if>
										 -->
										</ul>
										<a href="/product/search/list?cate_idx_1=${cate_idx}" id="view_btn_link" target="_self" class="view_btn"><c:out value="${cate_name}"/> 전체보기<img src="/resources/images/main/main_view_btn.png" width="9" height="15" border="0" alt="" /></a>
									</div>
									</c:forEach>
									</c:if>
									
							</div>
						</div>
					</div>
				</div>
			</article>
			--%>			
<%-- 			</c:if> --%>
<%-- 			<c:if test="${mitem.fd_menu_name eq '메디밸류 추천제품'}"> --%>
			<c:if test="${!empty product_list_medirecommend}">
			<!-- 신규 slickslider -->
			<article class="cnt6 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>이 제품도 필요하실 것 같아요!</h3>
							<p>메디밸류 추천 제품</p>
						</div>
						<div class="txt">
							<div class="slick_wrap">
								<ul class="slick05_1">
								<c:forEach var="item" items="${product_list_medirecommend}" varStatus="status">
									<li class="item_info  <c:if test="${!empty item.fd_option_count && item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
										<div class="pd_idx d-none">${item.pk_idx}</div>
										<a href="/product/detail?req_view_idx=${item.pk_idx}" target="_self">
											<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
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
												<img id="pd_img_info" src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="250" height="321" border="0" alt="" />
												<div class="wish_wrap">
													<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
													<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
												</div>
											</div>
											<div class="info">
												<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>
												<div class="price clear">
													<strong class="percent"><%--10% --%></strong>
													<c:if test="${loginInfo == null}">
														<p class="pd_price">로그인 후 최저가 확인</p>
													</c:if>
													<c:if test="${loginInfo != null}">
														<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>
													</c:if>
													<div class="option_list">
														<button class="btn_option">규격확인</button>
														<div class="sub">
															<div class="tit">규격정보</div>
															<ul>
															</ul>
														</div>
													</div>
												</div>
												<div class="cost"><p><%--0,000,000원 --%></p></div>
											</div>
										</a>
									</li>
								</c:forEach>
								</ul>
								<button class="slick-prev slick05_1_prev">prev</button>
								<button class="slick-next slick05_1_next">next</button>
							</div>
						</div>
					</div>
				</div>
			</article>
			</c:if>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${mitem.fd_menu_name eq '럭키투데이 핫딜'}"> --%>
			<c:if test="${!empty product_list_lucky_today}">
			<!-- 신규 slickslider -->
			<article class="cnt8 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>놓치면 후회할 합리적인 제품</h3>
							<p>입소문 제품 핫딜</p>
						</div>
						<div class="txt">
							<div class="slick_wrap div3">
									<ul class="slick22">
									<c:forEach var="item" items="${product_list_lucky_today}" varStatus="status">
										<li class="item_info  <c:if test="${!empty item.fd_option_count && item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
											<div class="pd_idx d-none">${item.pk_idx}</div>
											<a href="/product/detail?req_view_idx=${item.pk_idx}" target="_self">
												<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
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
													<img id="pd_img_info" src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="340" height="339" border="0" alt="" />
													<div class="wish_wrap">
														<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
												<div class="info">
													<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>
													<div class="price clear">
														<strong class="percent"><%-- 10% --%></strong>
														<c:if test="${loginInfo == null}">
															<p class="pd_price">로그인 후 최저가 확인</p>
														</c:if>
														<c:if test="${loginInfo != null}">
															<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>
														</c:if>
														<div class="option_list">
															<button class="btn_option">규격확인</button>
															<div class="sub">
																<div class="tit">규격정보</div>
																<ul>
																</ul>
															</div>
														</div>
													</div>
													<div class="cost"><p><%-- 0,000,000원 --%></p></div>
												</div>
											</a>
										</li>
									</c:forEach>
								</ul>
								<button class="slick-prev slick22_prev">prev</button>
								<button class="slick-next slick22_next">next</button>
							</div>
						</div>
					</div>
				</div>
			</article>
			</c:if>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${mitem.fd_menu_name eq '지금 꼭 필요한 상품 총집합'}"> --%>
			<c:if test="${!empty product_list_now_need}">
			<article class="cnt9">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>꼭 필요한 필수구매 제품을 한눈에</h3>
							<p>자주구매 제품 총집합</p>
						</div>
						<div class="txt clear">
							<div class="left">
								<div class="img"><%--
									<img src="/resources/images/pd_custom/53-4.jpg" onerror="this.src='/resources/images/dummy/640x480.png'" width="518" height="431" border="0" alt="" /><span class="mark">BEST</span>
									--%>
									<img src="<c:out value="${product_list_now_need.get(0).fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="518" height="431" border="0" alt="" /><span class="mark">BEST</span>
								</div>
							</div>
							<div class="right">
								<ul>
								<c:forEach var="item" items="${product_list_now_need}" varStatus="status">
									<li class="clear item_info  <c:if test="${!empty item.fd_option_count && item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
										<div class="pd_idx d-none">${item.pk_idx}</div>
										<div class="chk_wrap">
											<input id="c9_Chk${status.index}" type="checkbox">
											<label for="c9_Chk${status.index}"></label>
										</div>
										<a href="/product/detail?req_view_idx=${item.pk_idx}" class="clear" target="_self">
											<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
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
												<img src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="83" height="82" border="0" alt="" />
											</div>
											<div class="info">
												<div class="info_box">
													<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>
													<div class="price clear">
														<strong class="percent"><%-- 10% --%></strong>
														<c:if test="${loginInfo == null}">
															<p class="pd_price">로그인 후 최저가 확인</p>
														</c:if>
														<c:if test="${loginInfo != null}">
															<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>
														</c:if>
													</div>
												</div>
											</div>
										</a>
									</li>
								</c:forEach>
								</ul>
								<button class="cart_btn" type="button">장바구니 한번에 담기<img src="/resources/images/main/mn_c9_cart.png" width="19" height="17" border="0" alt="" /></button>
							</div>
						</div>
					</div>
				</div>
			</article>
			</c:if>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${mitem.fd_menu_name eq '구매 상승 제품'}"> --%>
			<c:if test="${!empty product_list_buying_rise}">
			
			<!-- 신규 slickslider -->
			<article class="cnt10 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>급상승 주문 제품들이에요!</h3>
							<p>구매 상승 제품</p>
						</div>
						<div class="txt">
							<div class="slick_wrap">
								<ul class="slick23">
								<c:forEach var="item" items="${product_list_buying_rise}" varStatus="status">
									<li class="item_info  <c:if test="${!empty item.fd_option_count && item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
										<div class="pd_idx d-none">${item.pk_idx}</div>
										<a href="/product/detail?req_view_idx=${item.pk_idx}" target="_self">
											<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
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
												<img id="pd_img_info" src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="250" height="321" border="0" alt="" />
												<div class="wish_wrap">
													<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
													<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
												</div>
											</div>
											<div class="info">
												<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>
												<div class="price clear">
													<strong class="percent"><%-- 10% --%></strong>
													<c:if test="${loginInfo == null}">
														<p class="pd_price">로그인 후 최저가 확인</p>
													</c:if>
													<c:if test="${loginInfo != null}">
														<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>
													</c:if>
													<div class="option_list">
														<button class="btn_option">규격확인</button>
														<div class="sub">
															<div class="tit">규격정보</div>
															<ul>
															</ul>
														</div>
													</div>
												</div>
												<div class="cost"><p><%-- 0,000,000원 --%></p></div>
											</div>
										</a>
									</li>
								</c:forEach>
								</ul>
								<button class="slick-prev slick23_prev">prev</button>
								<button class="slick-next slick23_next">next</button>
							</div>
						</div>
					</div>
				</div>
			</article>
			</c:if>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${mitem.fd_menu_name eq '마감 세일 제품'}"> --%>
			<c:if test="${!empty product_list_finish_sale}">
			
			<!-- 신규 slickslider -->
			<article class="cnt11 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit">
<!-- 							<h3>쏟아지는 마감 할인 혜택</h3> -->
<!-- 							<p>마감 세일 제품</p> -->
							<h3>쏟아지는 사은품 증정 혜택</h3>
							<p>사은품 증정 제품</p>
						</div>
						<div class="txt">
							<div class="slick_wrap div3">
								<ul class="slick24">
								<c:forEach var="item" items="${product_list_finish_sale}" varStatus="status">
									<li class="item_info  <c:if test="${!empty item.fd_option_count && item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
										<div class="pd_idx d-none">${item.pk_idx}</div>
										<a href="/product/detail?req_view_idx=${item.pk_idx}" target="_self">
											<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
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
												<img id="pd_img_info" src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="339" height="339" border="0" alt="" />
												<div class="wish_wrap">
													<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
													<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
												</div>
											</div>
											<div class="info">
												<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h4>
												<div class="price clear">
													<strong class="percent"><%-- 10% --%></strong>
													<c:if test="${loginInfo == null}">
														<p class="pd_price">로그인 후 최저가 확인</p>
													</c:if>
													<c:if test="${loginInfo != null}">
														<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>
													</c:if>
													<div class="option_list">
														<button class="btn_option">규격확인</button>
														<div class="sub">
															<div class="tit">규격정보</div>
															<ul>
															</ul>
														</div>
													</div>
												</div>
												<div class="cost"><p><%-- 0,000,000원 --%></p></div>
											</div>
										</a>
									</li>
								</c:forEach>
								</ul>
								<button class="slick-prev slick24_prev">prev</button>
								<button class="slick-next slick24_next">next</button>
							</div>
						</div>
					</div>
				</div>
			</article>
			</c:if>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${mitem.fd_menu_name eq '메디밸류 핫 제품군 TOP5'}"> --%>
			<c:if test="${!empty product_list_hot_top5}">
			<article class="cnt12">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>탑 병원은 다 아는 이 제품</h3>
							<p>메디밸류 핫 제품군 BEST</p>
						</div>
						<div class="txt">
							<ul class="depth1 depth1_1 clear">
								<li class="depth1_1_li1">
									<a id="#cnt12" >
										<img src="<c:out value="${product_list_hot_top5.get(0).fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="660" height="370" border="0" alt="" />
									</a>
								</li>
								<li class="depth1_1_li2">
									<span class="sub_cate">기획전</span>
									<p class="p1">메디밸류 베스트 셀링 제품</p>
									<h4>한정수량<br>메디찬스</h4>
									<span class="sale_txt"><img src="/resources/images/main/mn_c12_sale.png" width="75" height="44" border="0" alt="" /></span>
									<h5>[베스트] 메디밸류</h5>
									<p class="price">&nbsp;</p>
									<p class="cost">&nbsp;</p>
									<%--
									<p class="price"><strong>~00%</strong>597,900원</p>
									<p class="cost">753,000원</p>
									 --%>
									<button class="cart_btn" type="button">장바구니 한번에 담기<img src="/resources/images/main/mn_c12_cart.png" width="20" height="20" border="0" alt="" /></button>
								</li>
							</ul>
							
							<!-- 신규 slickslider -->
							<div class="btm">
								<div class="slick_m_wrap">
									<ul class="slick25">
									<c:forEach var="item" items="${product_list_hot_top5}" varStatus="status">
										<li class="img_box3 item_info">
											<div class="pd_idx d-none">${item.pk_idx}</div>
											<a href="/product/detail?req_view_idx=${item.pk_idx}">
												<img src="<c:out value="${item.fd_img_path}"/>" onerror="this.src='/resources/images/dummy/640x480.png'" width="263" height="255" border="0" alt="" />
												<div class="pd_info_pu">
													<h5 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name}</h5>
													<c:if test="${loginInfo == null}">
														<p class="pd_price">로그인 후 최저가 확인</p>
													</c:if>
													<c:if test="${loginInfo != null}">
														<p class="pd_price"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</p>
													</c:if>
												</div>
											</a>
											<div class="control_box clear">
												<div class="chk_wrap_wrap">
													<div class="chk_opa"></div>
													<div class="chk_wrap">
														<input id="c12Chk${status.index + 1}" type="checkbox">
														<label for="c12Chk${status.index + 1}"> </label>
													</div>
												</div>
												<button class="cart_btn"><img src="/resources/images/main/mn_c12_cart.png" width="28" height="28" border="0" alt="" /></button>
											</div>
										</li>
									</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
			</c:if>
<%-- 			</c:if> --%>
<%-- 			</c:forEach> --%>
<%-- 			</c:if> --%>
			<article class="cnt13">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3><a href="/notice/list">공지사항</a></h3>
							<c:if test="${board_info != null}">
							<p><a href="/notice/view?idx=${board_info.pk_idx}"><c:out value="${board_info.fd_title}"/> <fmt:formatDate pattern="YYYY/MM/dd" value="${board_info.fd_reg_date}" /></a></p>
							</c:if>
						</div>
						
						<div class="txt">
							<div class="banner">
								<a href=""><img src="/resources/images/main/mn_c12_banner.jpg" width="1051" height="139" border="0" alt="" /></a>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>