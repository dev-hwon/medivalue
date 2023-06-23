<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<%--
		<link rel="stylesheet" href="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker3.css" type="text/css" />
		<script type="text/javascript" src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.kr.min.js"></script>
		 --%>
		<link rel="stylesheet" href="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.standalone.min.css" type="text/css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220317"></script>
		<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.min.js"></script>
		<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>

		<script type="text/javascript">
			var chk_idx = "";
			var proc_state = true;
			
			var signInPopup = {
				showMessage: function (msg) {
					$("#pop_alarm_msg").text(msg);
					$("#black").show();
					$(".popup_message_type_1").show();
				}
			}
			
			$(document).ready(function (){
				/*
				$("#req_s_date").datepicker({
					fromat: "yyyy-mm-dd",
					language : "kr"
				});*/
				var view_rtn_code = '${rtn_code}';
				if(view_rtn_code !='200'){
					$("#pop_alarm_msg").text('${rtn_msg}');
					$("#black").show();
					$(".popup_message_type_1").show();
					
					if(view_rtn_code=='404' || view_rtn_code == '403'){
						setTimeout(function() { location.replace("/index");}, 2000);
					}
				}

				if($(".s9bxs1").length>0){
					alert("1");
					$(".s9bxs1").bxSlider({
						auto : true,
						autoHover : true,
						autoControls : false,
						pause: 4000,
						controls : true,
						pager: false,
						touchEnabled : false
					});
			
					setTimeout(function() {
						$("#sub9 .cnt2").addClass("active");
					}, 500);
				}

				var $detSch=$("#sub9 .cnt1 .area .real_area .top .sch_wrap .sch_wrap_top .detail_sch");
				var $schBtm=$("#sub9 .cnt1 .area .real_area .top .sch_wrap .sch_wrap_btm");
				var $filterBtn=$("#sub9 .cnt1 .area .real_area .top .sch_wrap .sch_wrap_btm > div > ul > li > button");
				var $s9allchk=$("#sub9 .cnt1 .area .real_area .top .sch_wrap .sch_wrap_btm .cate .cate_tit .chk_wrap_wrap .chk_wrap #allchk");
				var $s9allchkno=$("#sub9 .cnt1 .area .real_area .top .sch_wrap .sch_wrap_btm .cate .cate_tit .chk_wrap_wrap .chk_wrap #allchkno");
				var $tlc2=$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.td .td_list .tlc2");
				//var $s9Dpu=$("#sub9 .cnt1 .area .real_area .btm .btm_btm .delete_popup");
				//var $s9DepClose=$("#sub9 .cnt1 .area .real_area .btm .btm_btm .delete_popup .dep_close");
				var $cateLi=$("#sub9 .cnt1 .area .real_area .top .sch_wrap .sch_wrap_btm .cate ul li")
				var $s9qbPlus=$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.td .td_list .one_td6 .quan_box .plus");
				var $s9qbMinus=$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.td .td_list .one_td6 .quan_box .minus");
		
				$detSch.on("click", function  () {
					if ($(this).hasClass("on")) {
						$(this).removeClass("on");
						$schBtm.stop().slideUp();
					}else {
						$(this).addClass("on");
						$schBtm.stop().slideDown();
					}
				});

				$(".detail_sch").addClass("on");
				$(".sch_wrap_btm").slideDown();
		
				$filterBtn.on("click", function  () {
					if ($(this).parent().hasClass("on")) {
						$(this).parent().removeClass("on");
					}else {
						$(this).parent().addClass("on");
					}
					/*
					if ($(this).parent().hasClass("inq_month")) {
						$(".inq_recen").removeClass("on")
					}else if ($(this).parent().hasClass("inq_recen")) {
						$(".inq_month").removeClass("on")
					}
					*/
				});
		
				$s9allchk.click(function(){
					if($s9allchk.prop("checked")){
						$cateLi.addClass("on");
						$filterBtn.on("click", function  () {
							$s9allchk.prop("checked",false);
						});

						$("#s_searchCate1").val('');
						$("#frm_my_s").submit();
					}else{
						$cateLi.removeClass("on");
					}
				})
		
				$s9allchkno.click(function(){
					if($s9allchkno.prop("checked")){
						$cateLi.removeClass("on");
						$filterBtn.on("click", function  () {
							$s9allchkno.prop("checked",false);
						});
					}else{
						$cateLi.addClass("on");
					}
				})
		
				$(".all_chk_mh").click(function(){
					if($(".all_chk_mh").prop("checked")){
						$(".all_chk_mh2").prop("checked",true);
						$("input[name=pd_check]").prop("checked",true);
		
// 						$tlc2.on("click", function  () {
// 							$(".all_chk_mh").prop("checked",false);
// 						});
					}else{
						$("input[name=pd_check]").prop("checked",false);
						$(".all_chk_mh2").prop("checked",false);
					}
					$("li.td").each(function(index, item){
						let chk = $(item).closest("li").find(".soldout").length;
						if (chk == 1) {
// 							signInPopup.showMessage("품절된 제품은 제외되었습니다.");
							$(item).find("input[name='pd_check']").prop("checked", false);
						}
					});
				})
		
				$(".all_chk_mh2").click(function(){
					$(".all_chk_mh").prop("checked",true);
					if($(".all_chk_mh2").prop("checked")){
						$("input[name=pd_check]").prop("checked",true);
		
// 						$tlc2.on("click", function  () {
// 							$(".all_chk_mh2").prop("checked",false);
// 						});
					}else{
						$(".all_chk_mh").prop("checked",false);
						$("input[name=pd_check]").prop("checked",false);
					}
					$("li.td").each(function(index, item){
						let chk = $(item).closest("li").find(".soldout").length;
						if (chk == 1) {
// 							signInPopup.showMessage("품절된 제품은 제외되었습니다.");
							$(item).find("input[name='pd_check']").prop("checked", false);
						}
					});
				})
		
				$(".tlc2").on("click", function  () {
					let chk = $(this).closest("li").find(".soldout").length;
					let isChecked = $(this).closest("li").find("input[name='pd_check']").prop("checked");
					if (chk == 1) {
						if (isChecked) signInPopup.showMessage("품절된 제품입니다.");
// 						$(this).prop("checked", false);
// 						return false;
					}
					if ($(".tlc2:checked").length == $(".tlc2").length) {
						$(".all_chk_mh").prop("checked",true);
						$(".all_chk_mh2").prop("checked",true);
					} else {
						$(".all_chk_mh").prop("checked",false);
						$(".all_chk_mh2").prop("checked",false);
					}
				});
				
				$("#dep_close").on("click",function(){
					$(".delete_popup").css("display","none");
					$("#black").css("display","none");
				});
				
				$("#btn_del_cancel").on("click", function(){
					$(".delete_popup").css("display","none");
					$("#black").css("display","none");
				});
		
				$("#btn_del_ok").on("click", function(){
					product_wish_del(chk_idx);
				});
				/*
				$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.th .mh_th1 .chc_delete button, #sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.td .td_list .one_td7 button").on("click", function  () {
					$s9Dpu.css("display","block");
					$("#black").css("display","block");
				});
				
				
				$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.td .td_list .one_td7 button").on("click", function  () {
					var $th7Idx=$(this).parents(".td").index()
					
					$("#sub9 .cnt1 .area .real_area .btm .btm_btm .delete_popup .btn_wrap .ok_btn").on("click", function  () {
						$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li").eq($th7Idx).css("display","none");
						$s9Dpu.css("display","none");
						$("#black").css("display","none");
					});
				});
				
				$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.th .mh_th1 .chc_delete button").on("click", function  () {
					var $ched=$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.td .td_list .one_td1 input[name=mhn]:checked")
					
					$("#sub9 .cnt1 .area .real_area .btm .btm_btm .delete_popup .btn_wrap .ok_btn").on("click", function  () {
						$ched.parents(".td").css("display","none");
						$(".all_chk_mh").prop("checked",false);
						$s9Dpu.css("display","none");
						$("#black").css("display","none");
					});
				});

				$s9DepClose.on("click", function  () {
					$s9Dpu.css("display","none");
					$("#black").css("display","none");
				});
				
		
				$("#sub9 .cnt1 .area .real_area .btm .btm_btm .delete_popup .btn_wrap .cancel_btn").on("click", function  () {
					$s9DepClose.click();
				});
				*/
				
				$("#black").on("click", function  () {
					$(".delete_popup").css("display","none");
					$("#black").css("display","none");
				});
		
				$s9qbPlus.on("click", function  () {
					var s9n =$(this).index(this);
					var s9num = $(this).prev().find(".num:eq("+s9n+")").val();
					s9num = $(this).prev().find(".num:eq("+s9n+")").val(s9num*1+1); 
					var $s9ccc2= $(this).prev().find(".num").val();
		
					if ($s9ccc2>1) {
						$s9qbMinus.css("color","#232323")
					}else {
						$s9qbMinus.css("color","#b2b2b2")
					}
				});
				
				$s9qbMinus.click(function(){ 
					var s9n = $(this).index(this);
					var s9num = $(this).next().find(".num:eq("+s9n+")").val();
					s9num = $(this).next().find(".num:eq("+s9n+")").val(s9num*1-1);
					var $s9ccc2= $(this).next().find(".num").val();
		
					if ($s9ccc2<1) {
						alert("최소 수량은 1개 입니다.");
						$(this).next().find(".num").val(1);
					}
		
					if ($s9ccc2>1) {
						$s9qbMinus.css("color","#232323")
					}else {
						$s9qbMinus.css("color","#b2b2b2")
					}
				});

				jQuery("#searchOrderType > option[value='${searchOrderType}']").attr("selected", "true");
				jQuery("#searchOrderPageCnt > option[value='${pageSize}']").attr("selected", "true");
				
				$("#btn_req_date_lately_3month").on("click",function(){					
					$("#req_s_date").val( '${prev_3_month_s_date}');
					$("#req_e_date").val( '${prev_3_month_e_date}');
					$("button[id^='btn_req_date_month_type_']").each(function(){
						$(this).parent("li").removeClass("on");
					});
					$("#s_searchDateType").val($(this).attr("id"));
					$("#frm_my_s").submit();
				})
				
				$("button[id^='cate_']").on("click",function(){
					var cate_check = "";
					var cate_checkc_cnt = 0;
					$("button[id^='cate_']").each(function(){						
						if($(this).parent("li").hasClass("on")){
							if(cate_check!=''){
								cate_check += ",";
							}
							cate_check += $(this).attr("id");
							cate_checkc_cnt++;
						}
					});
					if(cate_checkc_cnt>0){
						$("#s_searchCate1").val(cate_check);
						$("#frm_my_s").submit();
					}
				});
				
				$("button[id^='btn_req_date_month_type_']").on("click",function(){
					$("#btn_req_date_lately_3month").parent("li").removeClass("on");
					if($(this).parent("li").hasClass("on")){
						$("button[id^='btn_req_date_month_type_']").each(function(){
							$(this).parent("li").removeClass("on");
						});
						var temp_month =$.trim($(this).find("#view_month").text());
						if(typeof temp_month !='undefined' && temp_month !=''){
							$(this).parent("li").addClass("on");
							let today = new Date()
							today.setMonth(Number(temp_month)-1); 
							today.setDate(1);
							$("#req_s_date").val(dateFormat(today));
							today.setMonth(Number(temp_month));
							today.setDate(0);
							$("#req_e_date").val(dateFormat(today));
						}
						$("#s_searchDateType").val($(this).attr("id"));
						$("#frm_my_s").submit();
					}
				});
				
				/*삭제 */
				$("button[id^='btn_delete']").on("click",function(){
					var wish_idx = $(this).parent().parent().find("input:checkbox[name='pd_check']").val();
					if(typeof wish_idx !='undefined' && wish_idx !=''){
						chk_idx = wish_idx;
						$(".delete_popup").css("display","block");
						$("#black").css("display","block");
					}
					$(".delete_popup").css("display","block");
					$("#black").css("display","block");
				});
				
				$(".cart_go_btn").on("click",function(){
					var login_check = checkLogin();
					if(login_check){
						var chk_cnt = 0;
						let formData = {};
						let cart_list = [];
						var pd_title = "";
						
						let bChk = checkSoldOut();
						if (bChk) {
						
						$("li.td").each(function(index, item){
							if($(this).find("input[name='pd_check']").is(":checked")){
								let cart_obj = {};
								const tpmm_idx = $(this).find("input[name='tpmm_idx']").val();
								const cnt = $(this).find("input[name='pd_cnt']").val();
								// formData['list['+chk_cnt+'].fk_tpsm_idx'] = pk_idx;
								// formData['list['+chk_cnt+'].cnt'] = cnt;
								cart_obj["tpmm_idx"] = tpmm_idx;
								cart_obj["cnt"] = cnt;
								cart_list.push(cart_obj);
								chk_cnt++;
								if(pd_title ==''){
									pd_title = $.trim($(this).find(".info_box > .tit").text());
								}
							}
						});

						formData["cart_list"] = cart_list;

						if(chk_cnt>0){
							//$("#black").show();
							//$("#pop_alarm_msg").text("장바구니에 담고 있습니다. 잠시만 기다려 주세요.");
							//$(".popup_message_type_1").show();

							// google tag manager

							// $.ajax({
			    			// 	url : '/basket/rest/save',
			    			// 	type : 'post',
			    			// 	cache : false,
			    			// 	data : formData,
			    			// 	dataType : 'json',
			    			//    	success:function(data){
			    			//    		if(data.rtn_code == '200'){
			    			//    			popAlarm2(pd_title, chk_cnt, "G");
							// 			// labbit_add_to_cart(data.productInfoList);
			    			//    		}else{
			    			//    			$("#pop_alarm_msg").text(data.rtn_msg);
							// 			$(".popup_message_type_1").show();
			    			//    		}
			    			//    	},
			    			//    	error:function(request,status,error){
			    			//         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							//
							// 	}
							// });
							$.ajax({
								url: '/quickOrder/rest/cart/save',
								type: 'post',
								cache: false,
								data: JSON.stringify(formData),
								contentType: 'application/json',
								dataType: 'json',
								success: function (data) {
									if (data.rtn_cd == '200') {
										// cart_list_reload($("#pd_cart_align").val());
										popAlarm3(pd_title, chk_cnt, data['basket_list_size']);
										labbit_add_to_cart(data.basket_save_list);
									} else {
										alert(data['rtn_msg']);
									}
								}
							});
						}else{
							$("#pop_alarm_msg").text('제품을 선택해주세요.');
							$("#black").show();
							$(".popup_message_type_1").show();
						}
						
						}
					}
				});
				
				$(".buy_go_btn").on("click",function(){
					var login_check = js_login_check();
					if(login_check){
						var chk_cnt = 0;
						let formData = {};
						var pd_title = "";
						let pkList = "";
						
						let bChk = checkSoldOut();
						if (bChk) {
						
						$("li.td").each(function(index, item){
							if($(this).find("input[name='pd_check']").is(":checked")){								
								const pk_idx = $(this).find("input[name='tpsm_idx']").val(); 
								const cnt = $(this).find("input[name='pd_cnt']").val(); 
								formData['list['+chk_cnt+'].fk_tpsm_idx'] = pk_idx;
								formData['list['+chk_cnt+'].cnt'] = cnt;
								chk_cnt++;
								if(pd_title ==''){
									pd_title = $.trim($(this).find(".pd_tit").text());
								}
								if (index == 0) {
									pkList += "pk_idx=" + pk_idx;
								} else {
									pkList += "&pk_idx=" + pk_idx;
								}
							}
						});
						if(chk_cnt>0){
							//google tag manager
							$.ajax({
								url : '/basket/rest/save',
								type : 'post',
								cache : false,
								data : formData,
								dataType : 'json',
							   	success:function(data){
							   		$(".popup_message_type_1").hide();
							   		if(data.rtn_code != '200'){
							   			$("#black").show();
							   			$("#pop_alarm_msg").text(data.rtn_msg);							   			
										$(".popup_message_type_1").show();
							   		}else{
							   			$("#black").hide();
							   			popAlarm2(pd_title, 1,'P');
										ad_log_naver("3", "1");
										labbit_add_to_cart(data.productInfoList);
							   			setTimeout(function() {location.replace('/product/basket/list?' + pkList);}, 2000);
							   		}							   									   		
							   		proc_state = true;
							   	},
							   	error:function(request,status,error){
							        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							        proc_state = true;
							    }
							});
						}else{
							$("#pop_alarm_msg").text('제품을 선택해주세요.');
							$("#black").show();
							$(".popup_message_type_1").show();
						}
						
						}
					}
				});

				$(".cart_go").on("click",function(){
					var login_check = js_login_check();
					if(login_check){
						let chk = $(this).closest("li").find(".soldout").length;
						if (chk == 1) {
							signInPopup.showMessage("품절된 제품입니다.");
// 							$(this).closest($("li.td")).find("input[name='pd_check']").prop("checked", false);
							return false;
						}
						var tpsm_idx = $(this).parent().parent().parent().find("input[name='tpsm_idx']").val();
						var pd_title = $(this).parent().parent().parent().find("div.info").find("div.info_box").find(".pd_tit").text();
						var pd_cnt = $(this).parent().find("input[name='pd_cnt']").val();
						if(typeof tpsm_idx != 'undefined' && tpsm_idx !='' && tpsm_idx != '0'){
							var formData = {
									"list[0].fk_tpsm_idx":tpsm_idx,
									"list[0].cnt":pd_cnt
							}
							//$("#black").show();
							//$("#pop_alarm_msg").text("장바구니에 담고 있습니다. 잠시만 기다려 주세요.");
							//$(".popup_message_type_1").show();

							//google tag manager
							$.ajax({
								url : '/basket/rest/save',
								type : 'post',
								cache : false,
								data : formData,
								dataType : 'json',
							   	success:function(data){
							   		$(".popup_message_type_1").hide();
							   		if(data.rtn_code != '200'){
							   			$("#pop_alarm_msg").text(data.rtn_msg);
							   			$("#black").show();
										$(".popup_message_type_1").show();
							   		}else{
//							   			$("#black").hide();
							   			popAlarm2(pd_title, 1,'P');
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
					}
				});

				$(".btn_sel_delete").on("click", function(){
					var chk_cnt = 0;
					$("li.td").each(function(){
						if($(this).find("input[name='pd_check']").is(":checked")){
							chk_cnt++;
							if(chk_idx !=''){
								chk_idx +=",";
							}
							chk_idx +=($(this).find("input[name='pd_check']").val()); 
						}
					});
					if(chk_cnt>0){
						//$s9Dpu.css("display","block");
						$(".delete_popup").css("display","block");
						$("#black").css("display","block");						
					}else{
						$("#pop_alarm_msg").text('제품을 선택해주세요.');
						$("#black").show();
						$(".popup_message_type_1").show();
					}
				});
				
				$("#searchOrderType").on("change", function(){					
					$("#s_searchOrderType").val($(this).val());
					$("#frm_my_s").submit();
				});
				$("#searchOrderPageCnt").on("change", function(){					
					$("#s_searchOrderPageCnt").val($(this).val());
					$("#frm_my_s").submit();
				});
				

				$(".input_date").datepicker({
					language: "ko",
					format: "yyyy-mm-dd"
				});

				// $(".input_date").each(function (index, value) {
				// 	$(value).focus();
				// });

				$(".cal_icon").on("click", function () {
					$(this).parent().children(".input_date").focus();
				});
				
				$("#view_searchString").keyup(function(event){
					if(event.keyCode==13){
						$("#frm_my_s").submit();
					}
				});

				$(".btn_search").on("click", function () {
					$("#frm_my_s").submit();
				});

				$(".sch_btn").on("click", function () {
					$("#frm_my_s").submit();
				});

			});
			
			function product_wish_del(chk_idx){
				var formData = {wish_idx : chk_idx,
						wish_state : 'Y'
						};
				$.ajax({   
					url : '/wish/rest/upate',
					type : 'post',
					cache : false,
					data : formData,
					dataType : 'json',
				   	success:function(data){
				   		$("#pop_alarm_msg").text(data.rtn_msg);
						$(".popup_message_type_1").show();
						if(data.rtn_code=='200'){
						   	location.replace('/myhome/info');
						}
				   	},
				   	error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
			}
			
			function dateFormat(date) {
		        let month = date.getMonth() + 1;
		        let day = date.getDate();		     
		        month = month >= 10 ? month : '0' + month;
		        day = day >= 10 ? day : '0' + day;
		        
		        return date.getFullYear() + '-' + month + '-' + day;
			}
			
			function checkSoldOut() {
				let bProcess = true;
				$("li.td").each(function(index, item){
					let chk = $(item).closest("li").find(".soldout").length;
					let isChecked = $(item).closest("li").find("input[name='pd_check']").prop("checked");
					if (chk == 1 && isChecked) {
						signInPopup.showMessage("품절된 제품이 포함되어 있습니다.");
						$(item).next("input[name='pd_check']").prop("checked", false);
						bProcess = false;
					}
				});
				return bProcess;
			}
		</script>
		${pageNavi.script}
	</jsp:attribute>
	<jsp:body>
		<section id="sub9" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<layout:leftMyFrame/>
							
						
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>MY 홈 (위시리스트)</h4>
									</div>
								</div>
								<div class="right_txt">
									<div class="top">
										<%-- <div class="tit">
											<h3>안녕하세요, <span>${loginInfo.fd_medical_name}</span>님</h3>
											<p>오늘도 메디밸류와 함께 힘찬 하루 보내세요</p>
										</div> --%>
										<div class="sch_wrap">
											<form id="frm_my_s" name="frm_my_s" action="/myhome/info" method="post">
												<input type="hidden" name="searchOrderType" id="s_searchOrderType" value="${searchOrderType}" />
												<input type="hidden" name="searchCate1" id="s_searchCate1" value="${searchCate1}" />
												<input type="hidden" name="searchDateType" id="s_searchDateType" value="${searchDateType}" />
												<input type="hidden" name="searchOrderPageCnt" id="s_searchOrderPageCnt" value="${searchOrderPageCnt}" />
												
												<div class="sch_wrap_top clear">
													<h4>제품검색</h4>
													<div class="form_cont">
														<label for="view_searchString">
															<c:if test="${searchString eq '' }">제품명을 입력해주세요</c:if>
														</label>
														<input type="text" id="view_searchString" name="searchString" value="${searchString}" />
														<!-- 211005 수정 시작 -->
														<button class="sch_btn" type="button"><img src="/resources/images/main/search_btn4.png" width="13" height="13" border="0" alt="" /></button>
														<!-- 211005 수정 끝 -->
													</div>
													<button type="button" class="detail_sch">상세검색</button>
												</div>
				
												<div class="sch_wrap_btm">
													<%-- <div class="inq_peri">
														<h4>조회기간</h4>
														<ul class="clear">
															<li class="inq_recen <c:if test="${searchDateType eq 'btn_req_date_lately_3month'}">on</c:if>"><button type="button" id="btn_req_date_lately_3month">최근 3개월</button></li>
															<li class="inq_month <c:if test="${searchDateType eq 'btn_req_date_month_type_1'}">on</c:if>"><button type="button" id="btn_req_date_month_type_1"><span id="view_month">${prev_month_3}</span>월</button></li>
															<li class="inq_month <c:if test="${searchDateType eq 'btn_req_date_month_type_2'}">on</c:if>"><button type="button" id="btn_req_date_month_type_2"><span id="view_month">${prev_month_2}</span>월</button></li>
															<li class="inq_month <c:if test="${searchDateType eq 'btn_req_date_month_type_3'}">on</c:if>"><button type="button" id="btn_req_date_month_type_3"><span id="view_month">${prev_month_1}</span>월</button></li>
															<li class="inq_month <c:if test="${searchDateType eq 'btn_req_date_month_type_4'}">on</c:if>"><button type="button" id="btn_req_date_month_type_4"><span id="view_month">${now_month}</span>월</button></li>
															<li class="calen clear">
																<div class="form_cont">
																	<label for="req_s_date"></label>
																	<input class="input_date" type="text" id="req_s_date" name="req_s_date" value="${req_s_date}"/>
																	<button class="cal_icon" type="button"><img src="/resources/images/main/order_calen.jpg" width="11" height="11" border="0" alt="" /></button>
																</div>
																<p>~</p>
																<div class="form_cont">
																	<label for="req_e_date"></label>
																	<input class="input_date" type="text" id="req_e_date" name="req_e_date" value="${req_e_date}"/>
																	<button class="cal_icon" type="button"><img src="/resources/images/main/order_calen.jpg" width="11" height="11" border="0" alt="" /></button>
																</div>
															</li>
															<li class="btn_sch">
																<button type="button" class="btn_search"></button>
															</li>
														</ul>
													</div> --%>
													<div class="cate">
														<c:if test="${!empty cate_menu_list}">
															<div class="cate_tit clear">
																<h4>카테고리</h4>
																<div class="chk_wrap_wrap">
																	<div class="chk_wrap">
																		<input id="allchk" type="radio" name="ac" checked>
																		<label for="allchk">전체선택</label>
																	</div>
																	<div class="chk_wrap">
																		<input id="allchkno" type="radio" name="ac">
																		<label for="allchkno">전체제외</label>
																	</div>
																</div>
															</div>
															<ul class="clear">
																<c:set var="view_cnt" value="8"/>
																<c:forEach var="item" items="${cate_menu_list}" varStatus="state">
																	<c:set var="btn_on" value=""/>
																	<c:choose>
																		<c:when test="${searchCate1 ne ''}">
																			<c:set var="temp_name" value="cate_${item.pk_idx}"/>
																			<c:forTokens items="${searchCate1}" delims="," var="item2">
																			    <c:if test="${item2 eq temp_name}">
																			    	<c:set var="btn_on" value="on"/>
																			    </c:if>
																			</c:forTokens>
																		</c:when>
																		<c:otherwise>
																			<c:if test="${param.ac != null }">
																				<c:set var="btn_on" value="on"/>
																			</c:if>
																			<c:if test="${param.ac == null }">
																				<c:set var="btn_on" value=""/>
																			</c:if>
																		</c:otherwise>
																	</c:choose>
																	<li class="<c:if test="${(state.index % view_cnt == 0)}">first</c:if> ${btn_on}"><button id="cate_${item.pk_idx}" type="button">${item.fd_name}</li>
																</c:forEach>
															</ul>
														</c:if>
													</div>
												</div>
											</form>
										</div>
									</div>
				
									<div class="btm">
										<div class="btm_top clear">
											<div class="slt_wrap">
												<select name="searchOrderType" id="searchOrderType">
													<option value="lately">최근순</option>
													<option value="name">이름순</option>
													<option value="amount_desc">높은 가격순</option>
													<option value="amount_asc">낮은 가격순</option>
													<option value="purchase">구매일자순</option>
												</select>
												
												<select name="searchOrderPageCnt" id="searchOrderPageCnt">
													<option value="100">100개씩 보기</option>
													<option value="50">50개씩 보기</option>
													<option value="30">30개씩 보기</option>
													<option value="10">10개씩 보기</option>
												</select>
											</div>
										</div>
				
										<div class="btm_btm">
											<div class="table_div">
												<ul>
													<li class="th">
														<div class="mh_th1 all_chk_wrap clear">
															<div class="all_chk">
																<input id="mhchk1" type="checkbox" name="mhn" class="all_chk_mh">
																<label for="mhchk1">전체선택</label>
															</div>
				
															<div class="chc_delete">
																<button type="button" class="btn_sel_delete">선택삭제</button>
															</div>
														</div>
														<h5 class="mh_th2">제품명</h5>
														<h5 class="mh_th3">규격</h5>
														<h5 class="mh_th4">제조사</h5>
														<h5 class="mh_th5">포장단위</h5>
													</li>
													<c:if test="${!empty list}">
														<c:forEach var="item" items="${list}" varStatus="state">
															<li class="td pd_li_${item.pk_idx} <c:if test="${item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if> <c:if test="${!empty item.fd_order_date}">rebuy</c:if> <c:if test="${empty item.fd_order_date}">putin</c:if>">
																<div class="td_list">
																	<input type="hidden" name="tpmm_idx" id="tpmm_idx" value="${item.fk_tpmm_idx}" />
																	<div class="one_td1 pd_chk">
																		<input id="tdListChk${state.index}" type="checkbox" name="pd_check" class="tlc2" value="${item.pk_idx}"/>															
																		<label for="tdListChk${state.index}"></label>
																	</div>			
																	<div class="one_td2 img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
																		<c:set var="view_image" value="${item.fd_img_path_thumbnail}"/>
																		<c:if test="${view_image eq ''}">
																			<c:set var="view_image" value="${item.fd_img_path}"/>
																		</c:if>
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
<%--																		<a href="/product/detail?req_view_idx=${item.fk_tpsm_idx}" target="_self">--%>
																		<img src="${view_image}" width="250" height="321" border="0" alt="" />
																		</a>
																	</div>
						
																	<div class="one_td3 info">
																		<div class="info_box">
																			<div class="badge"><span class="btn_rebuy">구매상품</span><span class="btn_putin">담은상품</span></div>

<%--																			<c:if test="${empty item.fd_order_date}">--%>
<%--																				담은상품--%>
<%--																			</c:if>--%>
<%--																			<c:if test="${!empty item.fd_order_date}">--%>
<%--																				구매상품--%>
<%--																			</c:if>--%>

																			<div class="sub">[${item.cate_1_name} / ${item.cate_2_name}]</div>
																			<div class="tit">${item.fd_product_name}</div>
																			<%-- <h4 class="pd_tit">${item.fd_product_name}</h4>
																			<p class="standard">[규격] ${item.fd_product_standard}</p>
																			<div class="mp_wrap clear">
																				<p class="manu">제조사ㅣ${item.fd_company_info}</p>
																				<p class="pack">포장단위ㅣ${item.fd_product_unit}</p>
																			</div> --%>
																		</div>
																	</div>
						
																	<div class="one_td4">
																		<%-- <p>${item.strLately_purchase_date}</p> --%>
																		<div class="tit">${item.fd_product_standard}</div>
																	</div>
																	<div class="one_td5">
																		<%-- <p><fmt:formatNumber value="${item.shop_product_amount}" pattern="#,###" />원</p> --%>
																		<div class="tit">${item.fd_company_info}</div>
																	</div>			
																	<div class="one_td6">
																		<!-- <div class="quan_box clear">
																			<button type="button" class="minus">-</button>
																			<div class="form_cont">
																				<label for="pd_cnt"></label>
																				<input type="text" id="pd_cnt" name="pd_cnt" class="num" value="1">
																			</div>
																			<button type="button" class="plus">+</button>
																		</div>
																		<button type="button" class="cart_go">장바구니 담기</button> -->
																		<div class="tit">${item.fd_product_unit}</div>
																	</div>
						
																	<div class="one_td7">
																		<button type="button" id="btn_delete"><img src="/resources/images/main/ship_delete.jpg" width="19" height="19" border="0" alt="" /></button>
																	</div>
																</div>
															</li>
														</c:forEach>
													</c:if>
				
													<li class="th last_th clear">
														<div class="mh_th1 all_chk_wrap clear">
															<div class="all_chk">
																<input id="mhchk2" type="checkbox" name="mhn" class="all_chk_mh2">
																<label for="mhchk2">전체선택</label>
															</div>	
															<div class="chc_delete">
																<button type="button" class="btn_sel_delete">선택삭제</button>
															</div>
														</div>
													</li>
												</ul>
											</div>
											<div class="delete_popup">
												<button type="button" class="dep_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>
												<h5>삭제하시겠습니까?</h5>
												<div class="btn_wrap">
													<button type="button" id="btn_del_cancel" class="cancel_btn">취소</button>
													<button type="button" id="btn_del_ok" class="ok_btn">확인</button>
												</div>
											</div>
											<div class="pd_list_paging">									
												${pageNavi.navi}
											</div>
											<div class="clear">
												<div class="table_btn_wrap clear">
													<button type="button" class="cart_go_btn">장바구니 담기</button>
<%--													<button type="button" class="buy_go_btn">바로 구매하기</button>--%>
												</div>
											</div>
										</div>
									</div>
								
								</div>
							</div>

							
							
						</div>
					</div>
				</div>
			</article>
	
			<%--
			<article class="cnt2 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit">
							<h3>혹시 이 제품 필요하지 않으세요?</h3>
							<p>구매내역 분석을 통한 AI PICK</p>
						</div>
						
						<div class="txt">
							<ul class="depth1 s9bxs1">
								<li>
									<ul class="depth2 clear">
										<li>
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c2_img1.png" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명</h4>
													<div class="price clear">
														<strong class="percent">75%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
						
										<li>
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c2_img2.png" width="250" height="321" border="0" alt="" />
						
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
													<img src="/resources/images/main/mn_c2_img3.png" width="250" height="321" border="0" alt="" />
						
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
													<img src="/resources/images/main/mn_c2_img4.png" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">81%</strong>
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
													<img src="/resources/images/main/mn_c2_img1.png" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">75%</strong>
														<p>0,000,000원</p>
													</div>
													<div class="cost"><p>0,000,000원</p></div>
												</div>
											</a>
										</li>
						
										<li>
											<a href="">
												<div class="img">
													<img src="/resources/images/main/mn_c2_img2.png" width="250" height="321" border="0" alt="" />
						
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
													<img src="/resources/images/main/mn_c2_img3.png" width="250" height="321" border="0" alt="" />
						
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
													<img src="/resources/images/main/mn_c2_img4.png" width="250" height="321" border="0" alt="" />
						
													<div class="wish_wrap">
														<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[제조사] 제품명</h4>
													<div class="price clear">
														<strong class="percent">81%</strong>
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
				 --%>
			</article>
		</section>	
	</jsp:body>
</layout:basicFrame>