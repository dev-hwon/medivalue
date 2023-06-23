<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrameNew>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<link rel="stylesheet" href="/resources/css/quickorder.css?20220831" />
		<link rel="stylesheet" href="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.standalone.min.css" type="text/css" />
		<style>
			form{display:inline;}
		</style>
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?v=2022060701"></script>
		<%--
		<script type="text/javascript" src="/resources/js/quickorder.js?20220317"></script>
		<script type="text/javascript" src="/resources/js/order/product-quick-order.js?20220509"></script>
		<script type="text/javascript" src="/resources/js/order/product-quick-order-search.js?20220317"></script>
		 --%>
		 <script type="text/javascript" src="/resources/js/quickorder.js?v=20220509"></script>
		<script type="text/javascript" src="/resources/js/order/product-quick-order.js?v=20220509"></script>
		<script type="text/javascript" src="/resources/js/order/product-quick-order-search.js?v=20220509"></script>
		 <script type="text/javascript" src="/resources/js/order/event_product.js"></script>
        <script type="text/javascript" src="/resources/js/order/ocb.js"></script>
		<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.min.js"></script>
   		<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>

        <script src="https://js.tosspayments.com/v1"></script>
		<script type="text/javascript">

            const POINT_MAXRATE = 0.05;
            const EVENT_MAXRATE = 0.02;
            let temp_pos_idx = 0;

			$(document).ready(function (){

<%--				${scriptMsg}--%>

				//	ChannelIO('showMessenger'); // ChannelIO('show'); // 팝업창 문의	

                <%--if ('${rtn_code}' != '200') {--%>
                <%--    alert('${rtn_msg}');--%>
                <%--}--%>

				if('${rtn_code}' == '403'){
					/*
					jQuery.browser = {};
					(function () {
					    jQuery.browser.msie = false;
					    jQuery.browser.version = 0;
					    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
					        jQuery.browser.msie = true;
					        jQuery.browser.version = RegExp.$1;
					    }
					})();
					if( $.browser.msie ){
						window.opener='Self';
					    window.open('','_parent','');
					    window.close();
					}else{
						window.close(); // 일반적인 현재 창 닫기
						window.open('about:blank','_self').self.close();  // IE에서 묻지 않고 창 닫기
					}
					 */
                    // location.href = "/index";
				}

				//$("input:radio[name='rdo_payment']:radio[value='${payment_type}']").attr("checked",true);
				
				$(".list_style_01").scroll(function(){
					if((this.scrollTop+this.clientHeight) == this.scrollHeight){
						// alert("끝지점");
					}
				});

				// $(document).on("change","input[id^='cart_detail_cnt']",function(){
				$(document).on("change","input[name='cart_detail_cnt'], select[name='cart_detail_cnt']",function(){

					var temp_cart_cnt = $(this).val();
                    var temp_total_amount = 0;
					var obj_parent = $(this);
                    if (temp_cart_cnt >= 1000) {
                        $(this).val(1000);
                        temp_cart_cnt = 1000;
                        $("#quick_order .table_style_01 .number .input").addClass("excess");
                        setTimeout(function() {
                            $("#quick_order .table_style_01 .number .input").removeClass("excess");
                        }, 1000);
                    }

                    if (temp_cart_cnt === '') {
                        $(this).val(1);
                    }

                    if(typeof(temp_cart_cnt) !='undefined' && temp_cart_cnt>0) {
                        temp_total_amount = Number($(this).parent().find("#cart_pd_amount").val())*Number(temp_cart_cnt);
                    }else{
                        $(this).val("1");
                        temp_total_amount = Number($(this).parent().find("#cart_pd_amount").val())*1;
                    }

                    var parent_obj = $(this);
                    var pd_cart_idx = $(this).parent().find("input[name='pd_cart_idx']").val();
                    var tpmm_idx = $(this).parent().find("input[name='cart_tpmm_idx']").val();
                    var tpsm_idx = $(this).parent().find("input[name='cart_tpsm_idx']").val();
                    var tsmi_idx = $(this).parent().find("input[name='cart_tsmi_idx']").val();
                    var pd_amount = $(this).parent().find("input[name='cart_pd_amount']").val();
                    //var pd_cart_cnt = $(this).parent().find("input[name='cart_detail_cnt']").val();
                    
                    var req_data = [{
                        tpmm_idx: tpmm_idx,
                        tpsm_idx: tpsm_idx,
                        tsmi_idx: tsmi_idx,
                        pd_amount: pd_amount,
                        cnt: temp_cart_cnt
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
                                // cart_list_reload($("#pd_cart_align").val());
                                labbit_add_to_cart(data.basket_save_list);
                            } else {
					   			if(data.rtn_cd =='405'){
					   				obj_parent.val('1');
					   			 	temp_total_amount = Number(obj_parent.parent().find("#cart_pd_amount").val())*1;
						   		}
                                alert(data['rtn_msg']);
                            }

                          //$(this).parent().parent().find(".price").html("<div class='price'>" + numberWithCommas(temp_total_amount) + "원" + "<sub>판매가</sub></div>")
                            parent_obj.parent().parent().find(".price").html("<div class='price'>" + numberWithCommas(temp_total_amount) + "원" + "</div>")
                            //$(this).parent().parent().find(".point").html("<div class='point'>" + numberWithCommas(Math.trunc(temp_total_amount-(temp_total_amount*POINT_MAXRATE))) + "원" + "<sub>포인트 적용가</sub></div>");
                            parent_obj.parent().parent().find(".point").html("<div class='point'>" + numberWithCommas(Math.trunc(temp_total_amount-((temp_total_amount*(POINT_MAXRATE+EVENT_MAXRATE))))) + "원" + "<sub>포인트 적용가</sub></div>");
                            parent_obj.parent().find("#cart_pd_total_amount").val(temp_total_amount);                    
                            quick_order_total_amount();
                            quick_order_total_check_amount();
                        }
                    });
				});
				
				$(document).on("click","select[id^='pd_group_type_1']",function(){
					var temp_group_1 = $(this).val();
					var temp_pd_group_idx = $(this).parent().find("#pd_group_idx").val();
					if(typeof(temp_group_1) != 'undefined' &&  temp_group_1 !='' && typeof(temp_pd_group_idx) != 'undefined' && temp_pd_group_idx != ''){
						var req_data = {req_group_type_value_1 : temp_group_1 , req_pd_group_idx : temp_pd_group_idx , req_type:"type_2"};
						var this_obj = $(this);
						$.ajax({
							url : '/quickOrder/rest/groupProduct/info',
							type : 'post',
							cache : false,
							data : req_data,
							dataType : 'json',
						   	success:function(data){
						   		if(data.rtn_cd == '200'){
					   				product_info_view(data);
					   				if(data.standard_list != 'undefined' && data.standard_list.length>0){
						   				product_option_view(this_obj, data, "#pd_group_type_2");
					   				}
						   		}
						   	},
						   	error:function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						});
					}
				});

				$(document).on("click","select[id^='pd_group_type_2']",function(){
					var temp_group_1 = $(this).parent().parent().parent().parent().find("#pd_group_type_1").val();
					var temp_group_2 = $(this).val();
					var temp_pd_group_idx = $(this).parent().parent().parent().parent().find("#pd_group_idx").val();

					if(typeof(temp_group_1) == 'undefined' ||  temp_group_1 ==''){

					}else if(typeof(temp_pd_group_idx) == 'undefined' || temp_pd_group_idx == ''){
						alert("새로고침 후 다시 시도해주세요.");
						return false;
					}else if(typeof(temp_group_2) == 'undefined' ||  temp_group_2 ==''){

					}else{
						var req_data = {req_group_type_value_1 : temp_group_1 , req_group_type_value_2 : temp_group_2 ,req_pd_group_idx : temp_pd_group_idx ,req_type:"type_3"};
						var this_obj = $(this);
						$.ajax({
							url : '/quickOrder/rest/groupProduct/info',
							type : 'post',
							cache : false,
							data : req_data,
							dataType : 'json',
						   	success:function(data){
						   		if(data.rtn_cd == '200'){
				   					product_info_view(data);
				   					if(data.standard_list != 'undefined' && data.standard_list.length>0){
				   						product_option_view(this_obj, data, "#pd_group_type_3");
					   				}
						   		}
						   	},
						   	error:function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

							}
						});
					}
				});

				$(document).on("click","select[id^='pd_group_type_3']",function(){
					var temp_group_1 = $(this).parent().parent().parent().parent().find("#pd_group_type_1").val();
					var temp_group_2 = $(this).parent().parent().parent().parent().find("#pd_group_type_2").val();
					var temp_group_3 = $(this).val();
					var temp_pd_group_idx = $(this).parent().parent().parent().parent().find("#pd_group_idx").val();

					if(typeof(temp_group_1) == 'undefined' ||  temp_group_1 ==''){

					}else if(typeof(temp_pd_group_idx) == 'undefined' || temp_pd_group_idx == ''){
						alert("새로고침 후 다시 시도해주세요.");
						return false;
					}else if(typeof(temp_group_2) == 'undefined' ||  temp_group_2 ==''){

					} else if (typeof (temp_group_3) == 'undefined' || temp_group_3 == '') {

                    } else {
                        var req_data = {
                            req_group_type_value_1: temp_group_1,
                            req_group_type_value_2: temp_group_2,
                            req_group_type_value_3: temp_group_3,
                            req_pd_group_idx: temp_pd_group_idx,
                            req_type: "view"
                        };
                        var this_obj = $(this);
                        $.ajax({
                            url: '/quickOrder/rest/groupProduct/info',
                            type: 'post',
                            cache: false,
                            data: req_data,
                            dataType: 'json',
                            success: function (data) {
                                if (data.rtn_cd == '200') {
                                    product_info_view(data);
                                    //product_option_view(this_obj, data, "#pd_group_type_3");
                                }
                            },
                            error: function (request, status, error) {
                                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);

                            }
                        });
                    }
				});
				/* 메디 캐쉬 페이지 이동*/
				$("#btn_move_medicash_charge").off().on("click",function(){
					window.open('/medicashMng/info');
				});

                $(document).on("change","select[id^='pd_group_type_1']",function(){
                    var temp_group_1 = $(this).val();
                    var temp_pd_group_idx = $(this).parent().find("#pd_group_idx").val();
                    temp_pos_idx = $(this).parent().find("#hd_pos_idx").val();

                    if(typeof(temp_group_1) != 'undefined' &&  temp_group_1 !='' && typeof(temp_pd_group_idx) != 'undefined' && temp_pd_group_idx != ''){
                        var req_data = {req_group_type_value_1 : temp_group_1 , req_pd_group_idx : temp_pd_group_idx , req_type:"type_2"};
                        var this_obj = $(this);
                        $.ajax({
                            url : '/quickOrder/rest/groupProduct/info',
                            type : 'post',
                            cache : false,
                            data : req_data,
                            dataType : 'json',
                            success:function(data){
                                if(data.rtn_cd == '200'){
                                    product_info_view(data);
                                    if(data.item != 'undefined' && data.item != null ){
                                        productLog(data.item.pk_idx, 'T1', temp_pos_idx);
                                    }
                                    if(data.standard_list != 'undefined' && data.standard_list.length>0){
                                        product_option_view(this_obj, data, "#pd_group_type_2");
                                    }
                                } else {
                                    productQuickOrderHandler.handleEvent(data);
                                }
                            },
                            error:function(request,status,error){
                                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                            }
                        });
                    }
                });

                $(document).on("change","select[id^='pd_group_type_2']",function(){
                    var temp_group_1 = $(this).parent().parent().parent().parent().find("#pd_group_type_1").val();
                    var temp_group_2 = $(this).val();
                    var temp_pd_group_idx = $(this).parent().parent().parent().parent().find("#pd_group_idx").val();

                    if(typeof(temp_group_1) == 'undefined' ||  temp_group_1 ==''){

                    }else if(typeof(temp_pd_group_idx) == 'undefined' || temp_pd_group_idx == ''){
                        alert("새로고침 후 다시 시도해주세요.");
                        return false;
                    }else if(typeof(temp_group_2) == 'undefined' ||  temp_group_2 ==''){

                    }else{
                        var req_data = {req_group_type_value_1 : temp_group_1 , req_group_type_value_2 : temp_group_2 ,req_pd_group_idx : temp_pd_group_idx ,req_type:"type_3"};
                        var this_obj = $(this);
                        $.ajax({
                            url : '/quickOrder/rest/groupProduct/info',
                            type : 'post',
                            cache : false,
                            data : req_data,
                            dataType : 'json',
                            success:function(data){
                                if(data.rtn_cd == '200'){
                                    product_info_view(data);
                                    if(data.item != 'undefined' && data.item != null ){
                                        productLog(data.item.pk_idx, 'T2', temp_pos_idx);
                                    }
                                    if(data.standard_list != 'undefined' && data.standard_list.length>0){
                                        product_option_view(this_obj, data, "#pd_group_type_3");
                                    }
                                } else {
                                    productQuickOrderHandler.handleEvent(data);
                                }
                            },
                            error:function(request,status,error){
                                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

                            }
                        });
                    }
                });

                $(document).on("change","select[id^='pd_group_type_3']",function(){
                    var temp_group_1 = $(this).parent().parent().parent().parent().find("#pd_group_type_1").val();
                    var temp_group_2 = $(this).parent().parent().parent().parent().find("#pd_group_type_2").val();
                    var temp_group_3 = $(this).val();
                    var temp_pd_group_idx = $(this).parent().parent().parent().parent().find("#pd_group_idx").val();

                    if(typeof(temp_group_1) == 'undefined' ||  temp_group_1 ==''){

                    }else if(typeof(temp_pd_group_idx) == 'undefined' || temp_pd_group_idx == ''){
                        alert("새로고침 후 다시 시도해주세요.");
                        return false;
                    }else if(typeof(temp_group_2) == 'undefined' ||  temp_group_2 ==''){

                    } else if (typeof (temp_group_3) == 'undefined' || temp_group_3 == '') {

                    } else {
                        var req_data = {
                            req_group_type_value_1: temp_group_1,
                            req_group_type_value_2: temp_group_2,
                            req_group_type_value_3: temp_group_3,
                            req_pd_group_idx: temp_pd_group_idx,
                            req_type: "view"
                        };
                        var this_obj = $(this);
                        $.ajax({
                            url: '/quickOrder/rest/groupProduct/info',
                            type: 'post',
                            cache: false,
                            data: req_data,
                            dataType: 'json',
                            success: function (data) {
                                if (data.rtn_cd == '200') {
                                    product_info_view(data);
                                    if(data.item != 'undefined' && data.item != null ){
                                        productLog(data.item.pk_idx, 'T3', temp_pos_idx);
                                    }
                                    //product_option_view(this_obj, data, "#pd_group_type_3");
                                } else {
                                    productQuickOrderHandler.handleEvent(data);
                                }
                            },
                            error: function (request, status, error) {
                                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);

                            }
                        });
                    }
                });

				$(document).on("click","button[id^='btn_cart_del']",function(){
					// alert("삭제");
					// $(this).parent().parent().parent()
					//$(this).parent().parent().parent().remove();
				});

                $(document).on("click", ".number .btn_delete", function () {
                    let pd_cart_idx = $(this).parents(".number").find("input[name='pd_cart_idx']").val();
                    let pd_cart = $(this).parents(".number").find("input[name='pd_cart_idx']");
                    var req_data = {
                        pd_cart_idx_list : [ pd_cart_idx ]
                    };

                    $.ajax({
                        url: "/quickOrder/rest/cart/delete",
                        method: "POST",
                        data : JSON.stringify(req_data),
                        contentType: "application/json",
                        success: function (data) {
                            if (data['rtn_cd'] === '200') {
                                pd_cart.parents(".tr").remove();
                            } else {
                                alert(data['rtn_msg']);
                            }
                        },
                        error: function (error) {
                            console.log(error);
                        },
                        complete : function() {
                            quick_order_refresh();
                        }
                    });
                });

                $(document).on("click", "#btn_total_cart_del", function () {
                    let pd_cart_idx_list = [];
                    let pd_cart_list = [];
                    $("#view_order_cart_area .tr").each(function (index, value) {
                        let pd_order_chk = $(this).find("input[name='pd_order_chk']");
                        if (pd_order_chk.prop("checked")) {
                            pd_cart_idx_list.push($(this).find("input[name='pd_cart_idx']").val());
                            pd_cart_list.push($(this).find("input[name='pd_cart_idx']"));
                        }
                    });

                    var req_data = {
                        pd_cart_idx_list : pd_cart_idx_list
                    };

                    $.ajax({
                        url: "/quickOrder/rest/cart/delete",
                        method: "POST",
                        data : JSON.stringify(req_data),
                        contentType: "application/json",
                        success: function (data) {
                            // if (data['rtn_cd'] === '200') {
                            //     for (let idx = 0; idx < pd_cart_list.length; idx++) {
                            //         let value = pd_cart_list[idx];
                            //         value.parents(".tr").remove();
                            //     }
                            // }
                            cart_list_reload();
                        },
                        error: function (error) {
                            console.log(error);
                        },
                        complete : function() {
                            quick_order_refresh();
                        }
                    });
                });

				$(document).off("click","button[id^='btn_quick_cart_add']").on("click","button[id^='btn_quick_cart_add']",function(){
					var quick_cart_cnt = $(this).parent().find("#btn_quick_cart_cnt").val();
					var quick_cart_obj = $(this).parent();
					if(typeof(quick_cart_cnt) !='undefined' && quick_cart_cnt !='0' && quick_cart_cnt !=''){
						var parent_obj = $(this);
						var tpmm_idx = $(this).parent().find("#tpmm_idx").val();
						var tpsm_idx = $(this).parent().find("#tpsm_idx").val();
						var tsmi_idx = $(this).parent().find("#tsmi_idx").val();
						var pd_name = $(this).parent().find("#pd_name").val();
						var pd_standard = $(this).parent().find("#pd_standard").val();
						var pd_unit = $(this).parent().find("#pd_unit").val();
						var pd_amount = $(this).parent().find("#pd_amount").val();
						var pd_company = $(this).parent().find("#pd_company").val();
						var req_data = [{tpmm_idx : tpmm_idx,
                                        tpsm_idx : tpsm_idx,
										tsmi_idx : tsmi_idx,
										pd_amount : pd_amount,
										cnt : quick_cart_cnt}];

                        if (pd_amount == 0 || tpsm_idx == 0) {
                            alert("장바구니에 담을 수 없는 제품입니다.");
                            return;
                        }

						$.ajax({
							url : '/quickOrder/rest/cart/save',
							type : 'post',
							cache : false,
							data : JSON.stringify({cart_list: req_data}),
							dataType : 'json',
                            contentType: 'application/json',
						   	success:function(data){
						   		if(data.rtn_cd == '200'){
                                    cart_list_reload($("#pd_cart_align").val());
                                    labbit_add_to_cart(data.basket_save_list);
						   		}else{
						   			alert(data.rtn_msg);
						   		}
						   	},
						   	error:function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						});
					}else{
						alert("수량을 확인해주세요.");
						return false;
					}
				});

                $(document).on("change", "#btn_quick_cart_cnt", function () {
                    let cnt = $(this).val();
                    let amount = $(this).siblings("input[name='pd_amount']").val();
                    let maxCnt = 1000;
                    let member_event_yn = $(this).siblings("input[name='member_event_yn']").val();
                    let pd_company_type = $(this).siblings("input[name='pd_company_type']").val();
                    $(this).parent().parent().siblings(".price").html("<div class='price'>" + numberToPrice(cnt * amount) + "원" + "<sub>판매가</sub></div>");
                    
                    //$(this).parent().parent().siblings(".point").html("<div class='point'>" + numberToPrice(Math.trunc((cnt * amount)-((cnt * amount)*POINT_MAXRATE))) + "원" + "<sub>포인트 적용가</sub></div>"); // "포인트 적용가" => "최대할인 적용가"로 변경요청 (20230223)
                    if(member_event_yn=='Y' && pd_company_type=='PCG001'){
                    	//$(this).parent().parent().siblings(".point").html("<div class='point'>" + numberToPrice(Math.trunc((cnt * amount)- ((Math.trunc((cnt * amount)*(POINT_MAXRATE+EVENT_MAXRATE)))))) + "원" + "<sub>최대할인 적용가</sub></div>"); // "포인트 적용가" => "최대할인 적용가"로 변경요청 (20230223)
                    	let check_discount_amount_basic = Math.trunc((cnt * amount)-(Math.trunc((cnt * amount)*POINT_MAXRATE)))
						let check_discount_amount = Math.trunc(check_discount_amount_basic-(check_discount_amount_basic*EVENT_MAXRATE))
                    	$(this).parent().parent().siblings(".point").html("<div class='point'>" + numberToPrice(check_discount_amount) + "원" + "<sub>최대할인 적용가</sub></div>"); // "포인트 적용가" => "최대할인 적용가"로 변경요청 (20230223)
                    }else{
                    	$(this).parent().parent().siblings(".point").html("<div class='point'>" + numberToPrice(Math.trunc((cnt * amount)-(Math.trunc((cnt * amount)*POINT_MAXRATE)))) + "원" + "<sub>최대할인 적용가</sub></div>"); // "포인트 적용가" => "최대할인 적용가"로 변경요청 (20230223)
                    }
                    
                    //console.log((cnt * amount) + " | " +POINT_MAXRATE + " | " + Math.trunc( (cnt * amount)) + " | " + ((cnt * amount)*POINT_MAXRATE));

                    if(cnt > maxCnt){
                    	$(this).parents(".inp_stock_wrap").addClass("excess");
                    	$(this).val(maxCnt);
                    	$(this).parent().parent().siblings(".total").children(".num").text(numberToPrice(maxCnt * (amount-(amount*POINT_MAXRATE))) + "원");
                    	setTimeout(function(){
                    		$("#btn_quick_cart_cnt").parents(".inp_stock_wrap").removeClass("excess");
                   		}, 1000);
                    }else{
                    	$(this).parents(".inp_stock_wrap").removeClass("excess");
                   		$(this).parent().parent().siblings(".total").children(".num").text(numberToPrice(cnt * (amount-(amount*POINT_MAXRATE))) + "원");
                    }
                });
                
				$(document).on("click","input[id^='pd_order_chk']",function(){
					quick_order_total_check_amount();
				});

                $("#btn_reload").on("click", function () {
                    cart_list_reload();
                });

                $("#pd_cart_align").on("change", function () {
                    cart_list_reload($(this).val());
                });



                $(document).on("change", "#quick_order .chk_cart_all", function () {
                    let chk = $("#quick_order .chk_cart");
                    if($(this).is(":checked")){
                        chk.prop("checked", true);
                    }else{
                        chk.prop("checked", false);
                    }
                    quick_order_total_amount();
                    quick_order_total_check_amount();
                });

                $(document).on("change", "#quick_order .chk_cart_title", function () {
                    let chk_all = $("#quick_order .chk_cart_all");
                    let chk_title = $("#quick_order .chk_cart_title");
                    let chk_list = $("#quick_order .chk_cart_list");
                    chk_all.prop("checked",
                        $("#quick_order .chk_cart_title:checked").length == chk_title.length
                    );
                    if($(this).is(":checked")){
                        $(this).parents(".thead").siblings(".tbody").find(".chk_cart_list").prop("checked", true);
                    }else{
                        $(this).parents(".thead").siblings(".tbody").find(".chk_cart_list").prop("checked", false);
                    }
                });

                $(document).on("change", "#quick_order .chk_cart_list", function () {
                    let chk_all = $("#quick_order .chk_cart_all");
                    let chk_title = $("#quick_order .chk_cart_title");
                    let chk_list = $("#quick_order .chk_cart_list");
                    chk_all.prop("checked",
                        $("#quick_order .chk_cart_list:checked").length == chk_list.length
                    );
                    $(this).parents(".tbody").siblings(".thead").find(".chk_cart_title").prop("checked",
                        $(this).parents(".tbody").find(".chk_cart_list:checked").length == $(this).parents(".tbody").find(".chk_cart_list").length
                    );
                });

                /* $(document).on("click", ".accordion_01 > ul > li > div > a", function () {
                    if ($(this).closest("li").hasClass("off")) {
                        $(this).closest("li").removeClass("off");
                        $(this).siblings(".subacc").stop().slideDown(300);
                    } else {
                        $(this).closest("li").addClass("off");
                        $(this).siblings(".subacc").stop().slideUp(300);
                    }
                }); */

                if ($("#pd_group_type_1").val() === $("#searchSelectGroupType").val()) {
                    var temp_group_1 = $("#pd_group_type_1").val();
                    var temp_pd_group_idx = $("#pd_group_type_1").parent().parent().find("#pd_group_idx").val();
                    if(typeof(temp_group_1) != 'undefined' &&  temp_group_1 !='' && typeof(temp_pd_group_idx) != 'undefined' && temp_pd_group_idx != ''){
                        var req_data = {req_group_type_value_1 : temp_group_1 , req_pd_group_idx : temp_pd_group_idx , req_type:"type_2"};
                        var this_obj = $("#pd_group_type_1");
                        $.ajax({
                            url : '/quickOrder/rest/groupProduct/info',
                            type : 'post',
                            cache : false,
                            data : req_data,
                            dataType : 'json',
                            success:function(data){
                                if(data.rtn_cd == '200'){
                                    product_info_view(data);
                                    if(data.standard_list != 'undefined' && data.standard_list.length>0){
                                        product_option_view(this_obj, data, "#pd_group_type_2");
                                    }
                                }else{
                                    productQuickOrderHandler.handleEvent(data);
                                }
                            },
                            error:function(request,status,error){
                                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                            }
                        });
                    }
                }
                
                // 메인화면에서 빠른주문 사용안내 클릭으로 화면 진입 시 (/quickOrder/info?func=quickorder)
                var url = document.location.href;
                var urlof = url.indexOf("?func=");
                if(urlof != -1){ // 도메인주소에 원하는 값이 있을 때
                    var parm = document.location.href.split("?func=");
                    var parm_name = parm[1];
                    openLayerPop(parm_name);
                }
                            
                $("#deferred_pay").on("click", function () {                	
                	$(".paymentTypeDiv").css("display", "none");
                    $(".point_detail_wrap ul li").eq(0).removeClass("active");
                    $("#btn_reset_medicash_charge").click();
                });

                $("#advance_pay").on("click", function () {                	
                	$(".paymentTypeDiv").css("display", "");
                    paymentDetail_add_info();
                });

                cartSelect();
			});

			function quick_order_total_amount(){
				var total_cart_amount = 0;
				var total_cart_cnt = 0;
				$("#view_order_cart_area div.tr").each(function(){
					
					total_cart_amount += Number($(this).find("#cart_pd_total_amount").val());
					//console.log("total_cart_amount :" + total_cart_amount);
                    total_cart_cnt ++;
				});
				$("#view_cart_total_amount").text(numberWithCommas(total_cart_amount)+"원");
                $("#view_product_check_total_cnt").text(total_cart_cnt);
			}
			
			function getProductSearchBar(e, idx) {
				let check_search_string = $("input[name='searchString']").val();
				let product_name = $(e).find(".tit").text();
				$("#searchString").val(product_name);
				$("#searchSelectIdx").val(idx);

				var formData = {
						req_search_text_query : check_search_string,
						req_search_text_select  : product_name,
						req_search_select_idx : idx
				};
				
				$.ajax({
	   				url : '/product/search/rest/recommen/select',
	   				type : 'post',
	   				cache : false,
	   				data : formData,
	   				dataType : 'json',
	   			   	success:function(data){
	   			   		if(data.rtn_code =='200'){
	   			   			$("#frm_top_search").submit();
	   			   		}else{
	   			   			$("#frm_top_search").submit();
	   			   		}
	   			   	},
	   			   	error:function(request,status,error){
	   			        // alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   			   		$("#frm_top_search").submit();
	   			    }
				});
				
				//$("#frm_top_search").submit();
			}
            // 금액별 무료배송 프로그레스바
            function delivery_price_progress_bar(totalPrice) {
                let orderCheck = `${order_check}`;
                let eventDeliveryYn = `${event_delivery_yn}`;
                if(orderCheck === 0 ||  eventDeliveryYn === 'Y') return;

                let standardPrice = 100000;
                let percent = Math.floor((totalPrice / standardPrice) * 100);
                if( totalPrice > standardPrice ){
                    $(".delivery_price_bar .price_difference").html("<span>무료 배송</span>");
                    $(".delivery_price_bar .current_bar").css('width', "100%");
                    $(".delivery_price_img").addClass('free');
                    return;
                }
                if( percent != 0 ){
                    $(".delivery_price_bar .price_difference").html(numberWithCommas(standardPrice - totalPrice) +"원 추가시 <span>무료 배송</span><small>(주문 금액 기준)</small>");
                    $(".delivery_price_bar .current_bar").css('width', percent + "%");
                    $(".delivery_price_img").removeClass('free');
                } else {
                    $(".delivery_price_bar .price_difference").html("주문금액이 100,000원 이상이면 <span>무료 배송</span>");
                    $(".delivery_price_bar .current_bar").css('width', "0%");
                    $(".delivery_price_img").removeClass('free');
                }
            }
            // 체크된 상품갯수
			function quick_order_total_check_cnt(){
                var total_cart_cnt = $("#view_order_cart_area div.tr #pd_order_chk:checked").length;
                $("#btn_cart_list_all_cnt").text("전체(" + total_cart_cnt + ")");
                $("#view_product_check_total_cnt").text(total_cart_cnt);
            }
            // 체크된 상품총합계
			function quick_order_total_check_amount(){
				var total_cart_amount = 0;
				$("#view_order_cart_area div.tr").each(function(){
					if($(this).find("#pd_order_chk").is(":checked")){
						total_cart_amount += Number($(this).find("#cart_pd_total_amount").val());
					}
				});

				$("#view_product_check_total_amount").text(numberWithCommas(total_cart_amount));

                quick_order_total_check_cnt();
                delivery_price_progress_bar(total_cart_amount);
			}
            // 토탈수량,금액 새로고침
            function quick_order_refresh(){
                quick_order_total_check_cnt();
                quick_order_total_check_amount();
                cartSelect();
            }

			function product_info_view(data){
			    $("#empty_view_order_area").css("z-index", 1);
				// $("#view_order_area").empty();
				$("#view_order_area").removeClass("discount");
	   			$("#view_online_area").empty();
	   			$("#view_prev_order_area").empty();

	   			var dy_online_html = "";
	   			var dy_shop_html = "";
	   			var dy_prev_order_html = "";
	   			if(data.item != 'undefined' && data.item != null ){
	   				var temp_group_info = data.item.fd_group_type_1;
	   				var group_cnt = 1;
					if(data.item.fd_group_type_2 !=''){
					    temp_group_info += (" / "+data.item.fd_group_type_2);
                        group_cnt = group_cnt + 1;
					}
					if(data.item.fd_group_type_3 !=''){
					    temp_group_info += (" / "+data.item.fd_group_type_3);
                        group_cnt = group_cnt + 1;
					}
					if(temp_group_info.replace(/(\s*)/g, '') ==''){
						temp_group_info = data.item.fd_product_standard;
					}

                    dy_shop_html += "<div>";

					// dy_shop_html +=     "<div class='img'>";
					// dy_shop_html +=         "<img src=\"" + data.item.view_image + "\" onerror=\"this.src='/resources/images/dummy/img_ready_for_image.jpg'\">";
					// dy_shop_html +=     "</div>";
                    dy_shop_html +=     "<div class='img'>";
                    dy_shop_html +=         "<a href='javascript:;' class='g_q_t3_product_img' onclick='openLayerProductInfoPop(\"detail\", \"" + data.item.pk_idx + "\", \"" + group_cnt + "\")'>"
                    dy_shop_html +=             "<img src=\"" + data.item.view_image + "\" onerror=this.src=\"/resources/images/dummy/img_ready_for_image.jpg\">"
                    dy_shop_html +=         "</a>"
                    dy_shop_html +=     "</div>";

                    dy_shop_html +=     "<div class='txt'>";
                    dy_shop_html +=         "<div class='hd'>";
                    dy_shop_html +=             "<div class='badge'>";
                    dy_shop_html +=                 "<button type='button' class='btn_detail' onclick='openLayer(\"detail\", \"" + data.item.pk_idx + "\", \"" + group_cnt + "\")'>상세보기</button>";
                    dy_shop_html +=                 "<span class='btn_discount'>최대 7% 할인</span>";
                    dy_shop_html +=                 "<span class='btn_insure'>보험</span>";
                    dy_shop_html +=                 "<span class='btn_special'>특가</span>";
                    dy_shop_html +=             "</div>";
                    dy_shop_html +=             "<a href='javascript:;' class='title g_q_t3_product_info' onclick='openLayer(\"detail\", \"" + data.item.pk_idx + "\", \"" + group_cnt + "\")'>" + data.item.fd_product_name + "</a>";
                    dy_shop_html +=         "</div>";
                    dy_shop_html +=         "<div class='bd g_q_t3_product_info' onclick='openLayer(\"detail\", \"" + data.item.pk_idx + "\", \"" + group_cnt + "\")'>";
                    dy_shop_html +=             "<div class='manufact'>";
                    dy_shop_html +=                 "<div class='manu'>" + data.item.fd_company_info + "</div>";
                    dy_shop_html +=             "</div>";
                    dy_shop_html +=             "<div class='standard'>";
                    dy_shop_html +=                 "<div class='stand'>" + data.item.fd_product_unit + "</div>";
                    dy_shop_html +=                 "<div class='code'></div>";
                    dy_shop_html +=             "</div>";
                    dy_shop_html +=         "</div>";
                    dy_shop_html +=         "<div class='ft'>";
                    dy_shop_html +=             "<div class='package g_q_t3_product_info' onclick='openLayer(\"detail\", \"" + data.item.pk_idx + "\", \"" + group_cnt + "\")'>";
                    dy_shop_html +=                 "<ul id='group_type'>";

                    if (group_cnt === 1) {
                        dy_shop_html +=                     "<li>";
                        dy_shop_html +=                         "<div>" + temp_group_info + "</div>";
                        dy_shop_html +=                     "</li>";
                    } else {

                        dy_shop_html +=                     "<li>";
                        dy_shop_html +=                         "<div>" + data.item.fd_group_type_1 + "</div>";
                        dy_shop_html +=                     "</li>";
                        
                        if(data.item.fd_group_type_2 !=''){
                            dy_shop_html +=                     "<li>";
                            dy_shop_html +=                         "<div>" + data.item.fd_group_type_2 + "</div>";
                            dy_shop_html +=                     "</li>";
                        }
                        if(data.item.fd_group_type_3 !=''){
                            dy_shop_html +=                     "<li>";
                            dy_shop_html +=                         "<div>" + data.item.fd_group_type_3 + "</div>";
                            dy_shop_html +=                     "</li>";
                        }
                    }

                    dy_shop_html +=                 "</ul>";
                    dy_shop_html +=             "</div>";
                    dy_shop_html +=         "<div class='util'>";
                    dy_shop_html +=             "<div class='price'>" + numberToPrice(data.item.shop_product_amount)+"원" + "<sub>판매가</sub>" + "</div>";
                    
                    /* 20230216 메디밸류 회원가 추가 */                    
                    if(data.member_event_yn=='Y' && data.item.fd_group_type_cd =='PCG001' ){
                    	//dy_shop_html +=             "<div class='price member'>" + numberToPrice(data.item.fd_product_discount_amount)+"원" + "<sub>메디밸류 회원가</sub>" + "</div>";
                    	//dy_shop_html +=             "<div class='point'>" + numberToPrice(Math.trunc(data.item.shop_product_amount-((data.item.shop_product_amount*POINT_MAXRATE) + (data.item.shop_product_amount*EVENT_MAXRATE) )))+"원" + "<sub>최대할인 적용가</sub>" + "</div>"; // "포인트 적용가" => "최대할인 적용가"로 변경요청 (20230223)
                    	let check_discount_amount_basic = Math.trunc(data.item.shop_product_amount-(data.item.shop_product_amount*POINT_MAXRATE))                    	 
						let check_discount_amount = Math.trunc(check_discount_amount_basic-(check_discount_amount_basic*EVENT_MAXRATE))	
                    	dy_shop_html +=             "<div class='point'>" + numberToPrice(check_discount_amount)+"원" + "<sub>최대할인 적용가</sub>" + "</div>"; // "포인트 적용가" => "최대할인 적용가"로 변경요청 (20230223)
                    	$("#view_order_area").addClass("discount");
                    }else{
                    	dy_shop_html +=             "<div class='point'>" + numberToPrice(Math.trunc(data.item.shop_product_amount-(data.item.shop_product_amount*POINT_MAXRATE)))+"원" + "<sub>최대할인 적용가</sub>" + "</div>"; // "포인트 적용가" => "최대할인 적용가"로 변경요청 (20230223)
                    }

                    dy_shop_html +=             "<div class='stock'>";
                    dy_shop_html +=                 "<div class='inp_stock_wrap'>";
                    dy_shop_html +=                     "<input hidden id='tpmm_idx' name='tpmm_idx' value=\"" + data.item.pk_idx + "\">";
                    dy_shop_html +=                     "<input hidden id='tpsm_idx' name='tpsm_idx' value=\"" + data.item.fk_tpsm_idx + "\">";
                    dy_shop_html +=                     "<input hidden id='tsmi_idx' name='tsmi_idx' value=\"" + data.item.fk_tsmi_idx + "\">";
                    dy_shop_html +=                     "<input hidden id='pd_name' name='pd_name' value=\"" + data.item.fd_product_name + "\">";
                    dy_shop_html +=                     "<input hidden id='pd_standard' name='pd_standard' value=\"" + temp_group_info + "\">";
                    dy_shop_html +=                     "<input hidden id='pd_unit' name='pd_unit' value=\"" + data.item.fd_product_unit + "\">";
                    dy_shop_html +=                     "<input hidden id='pd_company' name='pd_company' value=\"" + data.item.fd_company_info + "\">";
                    dy_shop_html +=                     "<input hidden id='pd_discount_amount' name='pd_discount_amount' value=\"" + data.item.fd_product_discount_amount + "\">";
                    dy_shop_html +=                     "<input hidden id='pd_company_type' name='pd_company_type' value=\"" + data.item.fd_group_type_cd + "\">";
                    dy_shop_html +=                     "<input hidden id='member_event_yn' name='member_event_yn' value=\"" + data.member_event_yn + "\">";
                    dy_shop_html +=                     "<input hidden id='pd_amount' name='pd_amount' value=\"" + data.item.shop_product_amount + "\">";
                    dy_shop_html +=                     "<input hidden id='pd_medi_code' name='pd_medi_code' value=\"" + data.item.fd_medi_product_code + "\">";
                    dy_shop_html +=                     "<select class='sel_stock g_q_t3_product_cnt' id='btn_quick_cart_cnt' onchange='changeSelect(this);'>";
                    dy_shop_html +=                         "<option value='0' >수량선택</option>"
                    dy_shop_html +=                         "<option value='1' selected >1</option>"
                    dy_shop_html +=                         "<option value='2' >2</option>"
                    dy_shop_html +=                         "<option value='3' >3</option>"
                    dy_shop_html +=                         "<option value='4' >4</option>"
                    dy_shop_html +=                         "<option value='5' >5</option>"
                    dy_shop_html +=                         "<option value='6' >6</option>"
                    dy_shop_html +=                         "<option value='7' >7</option>"
                    dy_shop_html +=                         "<option value='8' >8</option>"
                    dy_shop_html +=                         "<option value='9' >9</option>"
                    dy_shop_html +=                         "<option value='' >수량 입력하기</option>"
                    dy_shop_html +=                     "</select>";
                    dy_shop_html +=                     "<input type='text' class='inp_stock g_q_t3_product_cnt'>";
                    dy_shop_html +=                     "<button class='btn_stock g_q_t3_product_cart' id='btn_quick_cart_add'>장바구니</button>";
                    dy_shop_html +=                 "</div>";
                    
                    <!-- 위시리스트 START -->

                    let wishInfo = {};
                    if (data["wish_info"] !== null && data["wish_info"] !== "") {
                        wishInfo = data["wish_info"];
                        $("#wish_delete_button").attr("onclick", "productQuickOrder.deleteWishInfo("+ JSON.stringify(wishInfo) +" )")
                    } else {
                        wishInfo = {
                            fk_tpmm_idx: data.item.pk_idx,
                            pk_idx: ""
                        };
                    }

                    dy_shop_html +=                 "<div class='wish_wrap' id='wish_info'>";
                    dy_shop_html +=                 	"<button type='button' onclick='productQuickOrder.addWishInfo("+ JSON.stringify(wishInfo) +")'></button>";
                    dy_shop_html +=                 "</div>";
                    <!-- 위시리스트 END -->
                    
                    dy_shop_html +=             "</div>";
                    /*
                    dy_shop_html +=             "<div class='total'><span class='txt'>합계 금액 </span><span class='info'>?<span class='sub' style='display:none;'><span class='inn'>합계 금액에 <span class='blue'>배송비, 쿠폰 할인 금액은 포함되어 있지 않습니다.</span> 따라서 실 결제 금액은 달라질 수 있습니다.</span></span></span> ";
                    dy_shop_html +=             	"<span class='num'>" + numberToPrice(data.item.shop_product_amount-(data.item.shop_product_amount*0.05))+"원" + "</span>";
                    dy_shop_html +=             "</div>";
                    */
                    dy_shop_html +=         "</div>";
                    dy_shop_html +=     "</div>";
                    dy_shop_html += "</div>";

                    $("#view_order_area").html(dy_shop_html);
                    $("#view_order_area").removeClass("insure special")
                    if (data.item.fd_product_insure_code != null && data.item.fd_product_insure_code !== "") {
                        $("#view_order_area").addClass("insure");
                    }

                    if (data.item.fd_event_yn != null && data.item.fd_event_yn !== "N") {
                        $("#view_order_area").addClass("special");
                    }

                    /* 재료상 가격비교 > 메디코드 별 배너 이미지 변경 START */
                    var imgBannerUrl = "/resources/file_upload/event_banner/"+data.item.fd_medi_product_code+"_b.jpg";
                    $(".atc_step_2 .store_banner img").attr('src',imgBannerUrl);
                    /* 재료상 가격비교 > 메디코드 별 배너 이미지 변경 END */

                    const thisWish = $("#view_order_area");
                    const delAlert = $(".wish_del_pop");
                    thisWish.removeClass("wish");
                    delAlert.removeClass("on");

                    //console.log(data["wish_info"]);

                    if (data["wish_info"] !== null && data["wish_info"] !== "") {
                        thisWish.addClass("wish");
                    }

                    // else {
                    //     delAlert.addClass("on");
                    // }
	   			}

                if (data.online_company_list != undefined && data.online_company_list.length > 0) {
                    /* $("#shop_compare_cnt").text("가격비교 재료상(" + data.online_company_list.length + ")"); */
                    $("#shop_compare_cnt").text("*AI 최저가 가격비교 분석결과입니다.");
                    $(".atc_step_2 .store_list").show();
                    $(".atc_step_2 .store_info").show();
                    $(".atc_step_2 .store_banner").hide();
                } else {
                    /* $("#shop_compare_cnt").text("가격비교 재료상(0)") */
                    $("#shop_compare_cnt").text("　");
                    $(".atc_step_2 .store_list").hide();
                    $(".atc_step_2 .store_info").hide();
                    $(".atc_step_2 .store_banner").show();
                }

                dy_online_html += "<a href='javascript:;'>"
                dy_online_html +=   "<div class='row'>";
                dy_online_html +=       "<div class='text'>";
                dy_online_html +=           "<div class='title'>온라인몰</div>";
                dy_online_html +=       "</div>";
                dy_online_html +=       "<div class='util'>";
                dy_online_html +=           "<div class='price'>가격</div>";
                dy_online_html +=       "</div>";
                dy_online_html +=   "</div>";
                dy_online_html += "</a>"
                dy_online_html += "<div class='subacc'>";
                dy_online_html +=   "<ul>";

	   			$.each(data.online_company_list , function(idx, val) {
	   				dy_online_html += "<li>";
	   					dy_online_html += "<div>";
	   						dy_online_html += "<div class=\"row\">";
	   							dy_online_html += "<div class=\"text\">";
	   								dy_online_html += "<div class=\"title\">"+val.site_gubun+"</div>";
	   							dy_online_html += "</div>";
	   							dy_online_html += "<div class=\"util\">";
	   								dy_online_html += "<div class=\"price\">"+numberWithCommas(val.fd_product_amount)+"원</div>";
	   							dy_online_html += "</div>";
	   						dy_online_html += "</div>";
	   						// dy_online_html += "<div class=\"row\">";
	   						// 	dy_online_html += "<div class=\"standard\">";
	   						// 	var temp_group_info = val.fd_group_type_1;
	   						// 	if(val.fd_group_type_2 !=''){temp_group_info += (" / "+val.fd_group_type_2);}
	   						// 	if(val.fd_group_type_3 !=''){temp_group_info += (" / "+val.fd_group_type_3);}
	   						// 	if(temp_group_info.replace(/(\s*)/g, '') ==''){
	   						// 		temp_group_info = val.fd_product_standard;
	   						// 	}
	   						// 	dy_online_html += temp_group_info;
	   						// 	dy_online_html += "</div>";
	   						// dy_online_html += "</div>";
	   					dy_online_html += "</div>";
	   				dy_online_html += "</li>";
	   			});

                dy_online_html +=   "</ul>";
                dy_online_html += "</div>";

	   			$("#view_online_area").html(dy_online_html);

                if (data.order_list != undefined && data.order_list.length > 0) {
                    $("#empty_view_prev_order_area").css("z-index", 1);
                    $.each(data.order_list , function(idx, val) {
                        dy_prev_order_html +="<tr>";
                        dy_prev_order_html +="<td>";
                        dy_prev_order_html += (stringToDateFormat(val.fd_date));
                        dy_prev_order_html +="</td>";
                        dy_prev_order_html +="<td>"+numberWithCommas(val.fd_product_amount)+"</td>";
                        dy_prev_order_html +="<td>"+numberWithCommas(val.fd_cnt)+"</td>";
                        dy_prev_order_html +="<td>"+numberWithCommas(Number(val.fd_product_amount) * Number(val.fd_cnt))+"</td>";
                        dy_prev_order_html +="</tr>";
                    });
                } else {
                    // $("#empty_view_prev_order_area").css("z-index", 2);
                }
	   			$("#view_prev_order_area").html(dy_prev_order_html);
			}
			
			function product_option_view(this_obj, data, option_type){				
	   			var dy_html_group = "";
	   			
   				if($(this_obj).parent().parent().parent().find(option_type).length>0){
   					$("#view_order_area").empty();
   		   			$("#view_online_area").empty();
   		   			$("#view_prev_order_area").empty();
                    $("#empty_view_order_area").css("z-index", 2);
                    // $("#shop_compare_cnt").text("　");
                    // $(".atc_step_2 .store_list").hide();
                    // $(".atc_step_2 .store_info").hide();
                    // $(".atc_step_2 .store_banner").hide();

	   				$(this_obj).parent().parent().parent().find(option_type).empty();
	   				
	   				var dy_html_group = "<option value=\"\">규격선택</option>";
					
		   			$.each(data.standard_list, function(idx, val) {
		   				if(option_type == '#pd_group_type_2'){
		   					dy_html_group+="<option value=\""+val.fd_group_type_2+"\">";
			   				dy_html_group+=(val.fd_group_type_2);
			   				dy_html_group+="</option>";	
		   				}else if(option_type == '#pd_group_type_3'){
		   					dy_html_group+="<option value=\""+val.fd_group_type_3+"\">";
			   				dy_html_group+=(val.fd_group_type_3);
			   				dy_html_group+="</option>";	
		   				}
		   			});
		   			
	   			}
	   			$(this_obj).parent().parent().parent().find(option_type).append(dy_html_group);
			}

            function cart_list_reload(sort) {

                $.ajax({
                    url: "/quickOrder/rest/cart/list",
                    method: "GET",
                    type: "JSON",
                    data: {
                        sort: sort
                    },
                    success: function (data) {
                        $("#view_order_cart_area").empty();
                        if (data["rtn_code"] === "200") {
                            let cart_list = data["cart_list"];
                            if (cart_list != null && cart_list.length > 0) {
                                $("#cart_empty_area").css("z-index", 1);

                                // $("#btn_cart_list_all_cnt").text("전체(" + cart_list.length + ")");
                                $("#btn_cart_list_all_cnt").text("전체(0)");
                                $("#btn_cart_list").text("장바구니(" + cart_list.length + ")");
                                cart_list.forEach(function (value, index) {

                                    let quick_cart_cnt = value.fd_cnt;
                                    let pd_amount = value.fd_product_amount;
                                    let dy_cart_html = "";
                                    dy_cart_html +="<div class=\"tr insure special\">";
                                    dy_cart_html +="<div class=\"text\">";
                                    dy_cart_html +="<div class=\"title\">";
                                    if(data.fd_member_id == value.fd_reg_id){
                                        dy_cart_html +="<label class=\"label_check\"><input type=\"checkbox\" id=\"pd_order_chk\" name=\"pd_order_chk\" is_self='Y' class=\"chk_cart chk_cart_list\">";
                                    }
                                    else{
                                        dy_cart_html +="<label class=\"label_check\"><input type=\"checkbox\" id=\"pd_order_chk\" name=\"pd_order_chk\" is_self='N' class=\"chk_cart chk_cart_list\">";
                                    }
                                    dy_cart_html +="<div>";
                                    dy_cart_html +="<div class=\"badge\">";
                                    if (value["fd_product_insure_code"] != null && value["fd_product_insure_code"] != "") {
                                        dy_cart_html += "<span class='btn_insure'>[보험]</span>";
                                    }
                                    if (value["fd_event_yn"] != null && value["fd_event_yn"] == "Y") {
                                    	if(typeof(event_product) != 'undefined' ){
                                    		if(event_product.indexOf(value.fk_tpmm_idx)>-1){
                                    			dy_cart_html += "<span class='btn_special'>[이벤트]</span>";
                                    		}else{
                                    			dy_cart_html += "<span class='btn_special'>[특가]</span>";
                                    		}
                                    	}else{
                                    		dy_cart_html += "<span class='btn_special'>[특가]</span>";	
                                    	}
                                        
                                    }
                                    dy_cart_html +="</div>";
                                    dy_cart_html +="</div>";
                                    dy_cart_html +="</label>"
                                    dy_cart_html +="<a href='javascript:;' onclick='getCartGroupProductInfo(this)'>" + value.fd_product_name + "</a>"
                                    dy_cart_html +="</div>";
                                    dy_cart_html +="<div class=\"standard\">"+value.fd_product_standard +"</div>";
                                    dy_cart_html +="<div class=\"manufact\">"+value.fd_company_info+"</div>";
                                    dy_cart_html +="<div class=\"package\">"+value.fd_product_unit+"</div>";
                                    dy_cart_html +="</div>";

                                    dy_cart_html +="<div class=\"number\">";

                                    dy_cart_html +="<div class=\"input\">";
                                    dy_cart_html +="<input type=\"hidden\" value=\""+value.pk_idx+"\" id=\"pd_cart_idx\"  name=\"pd_cart_idx\" />";
                                    dy_cart_html +="<input type=\"hidden\" value=\""+value.fk_tpmm_idx+"\" id=\"cart_tpmm_idx\"  name=\"cart_tpmm_idx\" />";
                                    dy_cart_html +="<input type=\"hidden\" value=\""+value.fk_tpsm_idx+"\" id=\"cart_tpsm_idx\"  name=\"cart_tpsm_idx\" />";
                                    dy_cart_html +="<input type=\"hidden\" value=\""+value.fk_tsmi_idx+"\" id=\"cart_tsmi_idx\"  name=\"cart_tsmi_idx\" />";
                                    dy_cart_html +="<input type=\"hidden\" value=\""+value.fd_product_amount+"\" id=\"cart_pd_amount\"  name=\"cart_pd_amount\" />";
                                    dy_cart_html +="<input type=\"hidden\" value=\""+value.fd_product_discount_amount+"\" id=\"cart_pd_discount_amount\"  name=\"cart_pd_discount_amount\" />";
                                    // dy_cart_html +="<input type=\"hidden\" value=\""+value.fd_product_amount+"\" id=\"cart_pd_amount\"  name=\"cart_pd_amount\" />";
                                    // dy_cart_html +="<input type=\"hidden\" value=\""+value.fd_product_amount+"\" id=\"cart_pd_amount\"  name=\"cart_pd_amount\" />";
                                    // dy_cart_html +="<input type=\"hidden\" value=\""+value.fd_product_amount+"\" id=\"cart_pd_amount\"  name=\"cart_pd_amount\" />";
                                    if (quick_cart_cnt >= 10) {
                                        dy_cart_html += "<input type=\"text\" style=\"display: inline-block;\" name=\"cart_detail_cnt\" class=\"inp_stock\" value=" + quick_cart_cnt + ">";
                                    } else {
                                        dy_cart_html += "<input type=\"text\" name=\"cart_detail_cnt\" class=\"inp_stock\" value=" + quick_cart_cnt + ">";
                                        dy_cart_html += "<select class=\"sel_stock\" name=\"cart_detail_cnt\" onchange=\"changeSelect(this);\">";
                                        for (let idx = 1; idx < 10; idx++) {
                                            if (idx === Number(quick_cart_cnt)) {
                                                dy_cart_html += "<option selected value=" + idx + ">" + idx + "</option>";
                                            } else {
                                                dy_cart_html += "<option value=" + idx + ">" + idx + "</option>";
                                            }
                                        }
                                        dy_cart_html += "<option value=\"\">수량 입력하기</option>";
                                        dy_cart_html += "</select>";
                                    }

                                    dy_cart_html +="<input type=\"hidden\" value=\""+Number(pd_amount*quick_cart_cnt)+"\" id=\"cart_pd_total_amount\"  name=\"cart_pd_total_amount\" />";
                                    dy_cart_html +="</div>";

                                    dy_cart_html +="<div class=\"util\">";
                                    dy_cart_html +="<div class=\"price\">";
                                    dy_cart_html += numberWithCommas(Number(pd_amount*quick_cart_cnt));
                                    dy_cart_html +="원</div>";
                                    dy_cart_html +="<div class=\"button\">";
                                    // dy_cart_html +="<button tybutton\" id=\"btn_cart_del\" class=\"btn_delete\"></button>";
                                    dy_cart_html +="<button type=\"button\" class=\"btn_delete\"></button>";
                                    dy_cart_html +="</div>";

                                    dy_cart_html +="</div>";
                                    dy_cart_html +="</div>";
                                    dy_cart_html +="</div>";

                                    // $("#view_order_cart_area > div.tr").each(function(){
                                    //     var temp_cart_tpmm_idx =  $(this).find("#cart_tpmm_idx").val();
                                    //     var temp_cart_tpsm_idx = $(this).find("#cart_tpsm_idx").val();
                                    //     if(tpmm_idx==temp_cart_tpmm_idx && temp_cart_tpsm_idx == tpsm_idx){
                                    //         $(this).remove();pe=\"
                                    //     }
                                    // });
                                    $("#view_order_cart_area").append(dy_cart_html);
                                });
                            } else {
                                $("#cart_empty_area").css("z-index", 2);
                                $("#btn_cart_list_all_cnt").text("전체");
                                $("#btn_cart_list").text("장바구니");
                            }
                        }

                        // quick_order_total_amount();
                        // quick_order_total_check_amount();
                        $("#btn_cart_list_all_cnt").siblings("input:checkbox").prop("checked", false);
                    },
                    complete : function() {
                        quick_order_refresh()
                    }
                })

            }
            function getCartGroupProductInfo(value) {
                let temp_pd_group_idx = $(value).parent().parent().parent().find("input[name='cart_tpmm_idx']").val();
                // let temp_group_1 = $(value).parent().parent().parent().find("input[name='cart_pd_group_type_1']").val();
                // let temp_group_2 = $(value).parent().parent().parent().find("input[name='cart_pd_group_type_2']").val();
                // let temp_group_3 = $(value).parent().parent().parent().find("input[name='cart_pd_group_type_3']").val();
                // let group_cnt = 0;
                // if (temp_group_1 != "") {
                //     group_cnt += 1;
                // }
                //
                // if (temp_group_2 != "") {
                //     group_cnt += 1;
                // }
                //
                // if (temp_group_3 != "") {
                //     group_cnt += 1;
                // }
                //
                // if (group_cnt == 1) {
                //     var req_data = {req_group_type_value_1 : temp_group_1 , req_pd_group_idx : temp_pd_group_idx , req_type:"type_2"};
                // } else if (group_cnt == 2) {
                //     var req_data = {req_group_type_value_1 : temp_group_1 , req_group_type_value_2 : temp_group_2 ,req_pd_group_idx : temp_pd_group_idx ,req_type:"type_3"};
                // } else if (group_cnt == 3) {
                //     var req_data = {
                //         req_group_type_value_1 : temp_group_1 ,
                //         req_group_type_value_2 : temp_group_2 ,
                //         req_group_type_value_3 : temp_group_3 ,
                //         req_pd_group_idx : temp_pd_group_idx ,
                //         req_type:"view"
                //     };
                // }

                var req_data = {
                    req_group_type_value_1 : "group_type_1" ,
                    req_group_type_value_2 : "group_type_2" ,
                    req_group_type_value_3 : "group_type_3" ,
                    req_pd_group_idx : temp_pd_group_idx ,
                    req_type:"view"
                };

                $.ajax({
                    url : '/quickOrder/rest/groupProduct/info',
                    type : 'post',
                    cache : false,
                    data : req_data,
                    dataType : 'json',
                    success:function(data){
                        if(data.rtn_cd == '200'){
                            product_info_view(data);
                        }else{
                            productQuickOrderHandler.handleEvent(data);
                        }
                    },
                    error:function(request,status,error){
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
                });
            }
            function onSearchChatTalk() {
                const sIdx = ${tsmIdx};
                if(sIdx > 0){
                    $.ajax({
                        url: "/quickOrder/rest/search/help/click",
                        method: "GET",
                        type: "JSON",
                        data: {
                            tsmIdx: sIdx
                        },
                        success: function (data) {
                            //로그 카운트 완료
                        }
                    });
                }
                onChatTalk();
            }
            function openLayer(e, pd_info, pd_group_cnt, pos) {
                const sIdx = ${tsmIdx};
                const pIdx = pd_info;
                const stype = 'L';

                if(sIdx > 0){
                    $.ajax({
                        url: "/quickOrder/rest/search/product/click",
                        method: "GET",
                        type: "JSON",
                        data: {
                            tsmIdx: sIdx,
                            tpmmIdx: pIdx,
                            type: stype,
                            posIdx: pos
                        },
                        success: function (data) {
                            //로그 카운트 완료
                        }
                    });
                }

                openLayerProductInfoPop(e, pd_info, pd_group_cnt);
            }
            function productLog(pd_info, l_type, pos) {
                const sIdx = ${tsmIdx};
                const pIdx = pd_info;
                const stype = l_type;

                if(sIdx > 0){
                    $.ajax({
                        url: "/quickOrder/rest/search/product/click",
                        method: "GET",
                        type: "JSON",
                        data: {
                            tsmIdx: sIdx,
                            tpmmIdx: pIdx,
                            type: stype,
                            posIdx: pos
                        },
                        success: function (data) {
                            //로그 카운트 완료
                        }
                    });
                }
            }
            function cartSelect() {
                $("#pd_order_chk[is_self=Y]").click();
            }

		</script>
	</jsp:attribute>
	<jsp:body>
	<!-- BODY START -->
    <section id="quick_order" class="sub">
        <div class="quick_order_inner">
            <article class="atc_step_1">
                <div class="step_box">
                    <div class="tab_wrap">
                        <div class="tab_list">
                            <ul>
                                <li>
                                    <div>
                                        <button id="btn_view_product" type="button" class="g_q_t1_area">제품검색(${totalCount})</button>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <button id="btn_view_wish" type="button" class="g_q_t2_area">AI위시리스트</button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="tab_content">
                            <ul>
                                <li>
                                    <div class="empty" id="empty_product_search_list" <c:if test="${empty searchString && empty list}">style="z-index: 2"</c:if>>
                                        <p>검색창에서 <span>주문하실 제품</span>을 검색해 주세요.</p>
                                    </div>
                                    <div class="tab_content_inner">
                                        <div class="tab_head">
                                            <div class="row">
                                                <div class="comm_search_wrap">
                                                    <select name="search_cate" id="search_cate" class="sel_search g_q_t1_category_list">
                                                        <option value="">카테고리 전체</option>
                                                        <c:if test="${!empty cate_list}">
                                                        	<c:forEach var="item" items="${cate_list}" varStatus="status">
                                                        		<option value="${item.fk_cate_2_idx }">${item.cate_1_name}&gt;${item.cate_2_name}</option>
                                                        	</c:forEach>
                                                        </c:if>
                                                    </select>
                                                    <span class="bar"></span>
                                                    <input type="text" placeholder="결과 내 재검색" class="inp_search g_q_t1_search_info" id="searchAddString">
                                                    <button type="button" class="btn_search g_q_t1_search_btn" id="btn_search_add_list"></button>
                                                </div>
                                                <div class="comm_filter_wrap">
                                                    <label class="btn_gall g_q_t1_view_img"><input type="radio" name="sch_filter_1" class="inp_gall"onclick="changeFilter(this);" checked><span></span></label>
                                                    <label class="btn_list g_q_t1_view_list"><input type="radio" name="sch_filter_1" class="inp_list" onclick="changeFilter(this);" ><span></span></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab_body" id="product_search_list">
                                        	<!-- if 검색결과 있을 때, 없을 때 -->
                                        	<!-- 검색결과가 있을 때 START -->
                                            <div class="list_style_01 gallery" id="product_search_content_list">
                                                <ul>
                                                    <!-- 튜토리얼 시에만 보여지는 리스트 START (삭제금지) -->
                                                    <li class="insure rebuy tutorial_temp">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/quickorder/img_tutorial_product_temp.jpg" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button type="button" class="btn_detail" onclick="openLayerPop('detail');">상세보기</button></div>
                                                                    <a href="javascript:;" class="title" onclick="openLayerPop('detail');">GenTaper Finishing File</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">구매상품</span>
                                                                        <span class="btn_insure" title="보험 재료 상품입니다.">보험</span>
                                                                    </div>
                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">Micro-Mega</div>
                                                                        <div class="date">21.12.10일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">F1, 21mm yellow</div>
                                                                        <div class="code">03050000420</div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <select name="" class="sel_standard">
                                                                                        <option value="">규격선택</option>
                                                                                        <option value="1">1</option>
                                                                                        <option value="2">2</option>
                                                                                        <option value="3">3</option>
                                                                                    </select>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <!-- 튜토리얼 시에만 보여지는 리스트 END (삭제금지) -->
													<c:if test="${!empty list}">
														<%--
															li class : insure / 보험, rebuy / 구매상품
														 --%>
														<c:forEach var="item" items="${list}" varStatus="status">
															<c:set var="li_top_class_insure" value=""/>
															<c:set var="li_top_class_rebuy" value=""/>
															<c:if test="${item.fd_product_insure_code ne ''}">
																<c:set var="li_top_class_insure" value="insure"/>
															</c:if>
                                                            <c:if test="${item.lately_order_date ne ''}">
                                                                <c:set var="li_top_class_rebuy" value="rebuy"/>
                                                            </c:if>
                                                            <c:set var="pd_info" value=""/>
                                                            <c:set var="pd_info" value="${fn:split(item.group_tpmm_idx,',')[0]}"/>
                                                            <li class="${li_top_class_insure} ${li_top_class_rebuy}">
		                                                        <div>
		                                                            <div class="img">
		                                                                <a href="javascript:;" onclick="openLayer('detail','${pd_info}', '${item.group_cnt}', ${status.count});" class="g_q_t1_product_img"><img src="${item.view_image}" alt="" onerror="this.src='/resources/images/dummy/img_ready_for_image.jpg'"></a>
		                                                            </div>
		                                                            <div class="txt">
		                                                                <div class="hd">
		                                                                    <div class="detail"><button type="button" class="btn_detail" onclick="openLayer('detail','${pd_info}', '${item.group_cnt}', ${status.count});">상세보기</button></div>
		                                                                    <a href="javascript:;" class="title g_q_t1_product_title" onclick="openLayer('detail', '${pd_info}', '${item.group_cnt}', ${status.count});">${item.fd_product_name}</a>
		                                                                    <div class="badge">
		                                                                        <span class="btn_rebuy" title="${item.lately_order_date}">구매상품</span>
		                                                                        <span class="btn_insure" title="보험 재료 상품입니다.">보험</span>
		                                                                    </div>
		                                                                </div>
		                                                                <div class="bd g_q_t1_product_title" onclick="openLayer('detail','${pd_info}', '${item.group_cnt}', ${status.count});">
		                                                                    <div class="manufact">
		                                                                        <div class="manu">${item.fd_company_info}</div>
		                                                                        <div class="date">${item.lately_order_date}</div>
		                                                                    </div>
		                                                                    <div class="standard">
		                                                                        <div class="stand">${item.product_standard_info} ${item.fd_product_unit}</div>
		                                                                        <div class="code">
		                                                                        	 <c:if test="${item.group_cnt == 1 }">
		                                                                        	 	${item.group_medi_product_code}
		                                                                        	 </c:if>
		                                                                        </div>
		                                                                    </div>
		                                                                </div>
		                                                                <c:if test="${item.group_cnt >= 1 }">
		                                                                <div class="ft">
		                                                                    <div class="package">
		                                                                        <ul>
		                                                                            <li>
		                                                                                <div>
		                                                                                	<input type="hidden" name="pd_group_idx" id="pd_group_idx" value="${item.group_tpmm_idx}" />
                                                                                            <input type="hidden" id="hd_pos_idx" value="${status.count}" >
		                                                                                	<c:if test="${empty item.group_type_1}">
                                                                                                <c:set var="groupTypeArr_1" value="${fn:split('단일규격','')}"/>
                                                                                            </c:if>
                                                                                            <c:if test="${!empty item.group_type_1}">
                                                                                                <c:set var="groupTypeArr_1" value="${fn:split(item.group_type_1,'|')}"/>
                                                                                            </c:if>


                                                                                            <c:if test="${item.group_cnt == 1}">
                                                                                            <select name="pd_group_type_1" id="pd_group_type_1" class="sel_standard g_q_t1_product_standard_1">
                                                                                                <option value="">규격선택</option>
                                                                                                <c:if test="${!empty groupTypeArr_1}">
                                                                                                    <c:forEach var="pd_group_info" items="${groupTypeArr_1}">
                                                                                                        <option value="${pd_group_info}">${pd_group_info}</option>
                                                                                                    </c:forEach>
                                                                                                </c:if>
<%--                                                                                                <c:if test="${!empty groupTypeArr_1}">--%>
<%--                                                                                                        <option value="${pd_group_info}">단일규격</option>--%>
<%--                                                                                                </c:if>--%>
                                                                                            </select>
                                                                                            </c:if>
                                                                                            <c:if test="${item.group_cnt > 1}">
                                                                                                <select name="pd_group_type_1" id="pd_group_type_1" class="sel_standard g_q_t1_product_standard_1">
                                                                                                    <option value="">규격선택</option>
                                                                                                    <c:if test="${!empty groupTypeArr_1}">
                                                                                                        <c:forEach var="pd_group_info" items="${groupTypeArr_1}">
                                                                                                            <option <c:if test="${searchSelectGroupType eq pd_group_info}">selected</c:if> value="${pd_group_info}">${pd_group_info}</option>
                                                                                                        </c:forEach>
                                                                                                    </c:if>
                                                                                                </select>
                                                                                            </c:if>
		                                                                                </div>
		                                                                            </li>
		                                                                            <c:if test="${item.group_check_2>0}">
		                                                                            	<li>
			                                                                                <div>
			                                                                                    <select name="pd_group_type_2" id="pd_group_type_2" class="sel_standard g_q_t1_product_standard_2">
			                                                                                        <option value="">규격선택</option>		                                                                                      
			                                                                                    </select>
			                                                                                </div>
			                                                                            </li>
		                                                                            </c:if>
		                                                                            <c:if test="${item.group_check_3>0}">
		                                                                             <li>
		                                                                                <div>
		                                                                                    <select name="pd_group_type_3" id="pd_group_type_3" class="sel_standard g_q_t1_product_standard_3">
		                                                                                        <option value="">규격선택</option>		                                                                                      
		                                                                                    </select>
		                                                                                </div>
		                                                                            </li>
		                                                                            </c:if>
		                                                                        </ul>
		                                                                    </div>
		                                                                </div>
		                                                                </c:if>
		                                                            </div>
		                                                        </div>
		                                                    </li>
														</c:forEach>
													</c:if>
                                                </ul>
                                            </div>
                                            <!-- 검색결과가 있을 때 END -->
                                            <!-- 검색결과가 없을 때 START -->
                                            <div class="search_empty"
                                                    <c:if test="${!empty list}">
                                                        style="display:none;"
                                                    </c:if>>
                                            	<div class="empty_inner">
                                            		<div class="text">
                                                        <span>'${searchString}'</span>에<br>대한 검색결과가 없습니다.
                                            		</div>
                                            		<div class="text1">검색 결과는 없지만<br>대부분 판매 중인 경우가 많습니다.</div>
                                            		<div class="text1">채팅으로 제품 문의를 하시면,<br>빠르게 해당 제품을 찾아드리겠습니다.</div>
                                            		<div class="button">
                                            			<button type="button" onclick="onSearchChatTalk();">채팅으로 제품 문의하기</button>
                                            		</div>
                                            	</div>
                                            </div>
                                            <!-- 검색결과가 없을 때 END -->
                                        </div>
                                        <%-- <div class="tab_foot">
                                        	<div class="btn_chat_wrap">
                                                <button type="button" class="btn_chat g_q_t1_product_not_btn" onclick="onChatTalk();">찾는 제품이 없나요?  클릭후 채팅으로 문의하기</button>
                                            </div>
                                        </div> --%>
                                    </div>
                                </li>
                                <li>
                                    <div class="empty" id="wish_empty_area" style="z-index: 2;">
                                        <p>위시리스트 내역이 없습니다.</p>
                                    </div>
                                    <div class="tab_content_inner">
                                        <div class="tab_head">
                                            <div class="ai_wish_wrap off">
                                                <div class="ai_wish_inner">
                                               		<a href="javascript:;" class="tit g_q_t2_explain_area">AI 구매 추천을 위한 데이터 수집 중입니다.</a>
                                                	<div class="subacc">
	                                                    <%--<div class="progress_wrap" data-num="50">
	                                                        <div class="graphic"><span>AI</span></div>
	                                                        <div class="txt"><span>0</span>%</div>
	                                                    </div>--%>
	                                                    <div class="ani">AI</div>
	                                                    <div class="txt">구매데이터를 바탕으로 AI구매추천을 해드립니다.<br><strong>구매이력이 많아질수록</strong> AI구매추천 결과의 <strong>품질이 향상</strong>됩니다.</div>
                                                	</div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="comm_search_wrap">
                                                    <select name="" id="wish_info_cate_list" class="sel_search g_q_t2_category_area">
                                                        <option value="">카테고리 전체</option>
                                                    </select>
                                                    <span class="bar"></span>
                                                    <input type="text" placeholder="결과 내 재검색" class="inp_search g_q_t2_search_area" id="wish_list_search_input">
                                                    <button type="button" class="btn_search g_q_t2_search_btn" id="btn_wish_list_search"></button>
                                                </div>
                                                <div class="comm_filter_wrap">
                                                    <label class="btn_gall g_q_t2_view_img"><input type="radio" name="sch_filter_2" class="inp_gall" onclick="changeFilter(this);" checked><span></span></label>
                                                    <label class="btn_list g_q_t2_view_list"><input type="radio" name="sch_filter_2" class="inp_list" onclick="changeFilter(this);"><span></span></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab_body">
                                        
                                        	<!-- if 위시리스트 처음일 때, 존재할 때 -->
                                        	
                                        	<!-- AI 위시리스트 데이터 존재할 때 START -->
                                            <div class="list_style_02 gallery">
                                                <ul id="wish_info_list">
                                                    <li class="insure rebuy">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/dummy/img_ready_for_image.jpg" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button type="button" class="btn_detail" onclick="openLayerPop('detail');">상세보기</button></div>
                                                                    <a href="javascript:;" class="title" onclick="openLayerPop('detail');">제품이름 제품이름 제품이름</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">구매상품</span>
                                                                        <span class="btn_insure" title="보험 재료 상품입니다.">보험</span>
                                                                    </div>
                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">SS GLOBAL/한국</div>
                                                                        <div class="date">21.12.23일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">Syringe6g,Mixing Tips ,Mixing Tips 10개</div>
                                                                        <div class="code">01033000059</div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <button type="button" class="btn_package">규격선택</button>
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="insure rebuy">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/dummy/img_ready_for_image.jpg" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button type="button" class="btn_detail" onclick="openLayerPop('detail');">상세보기</button></div>
                                                                    <a href="javascript:;" class="title" onclick="openLayerPop('detail');">제품이름 제품이름 제품이름</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">구매상품</span>
                                                                        <span class="btn_insure" title="보험 재료 상품입니다.">보험</span>
                                                                    </div>
                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">${item.fd_company_info}</div>
                                                                        <div class="date">21.12.23일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">${item.fd_product_unit}</div>
                                                                        <div class="code">
                                                                        	<%-- 메디코드 표시 그룹인 경우 X 01033000059 --%>
                                                                        	<c:if test="${item.group_cnt == 1 }">
                                                                        		
                                                                        	</c:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <button type="button" class="btn_package">규격선택</button>
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="insure rebuy">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/dummy/img_ready_for_image.jpg" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button type="button" class="btn_detail" onclick="openLayerPop('detail');">상세보기</button></div>
                                                                    <a href="javascript:;" class="title" onclick="openLayerPop('detail');">제품이름 제품이름 제품이름</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">구매상품</span>
                                                                        <span class="btn_insure" title="보험 재료 상품입니다.">보험</span>
                                                                    </div>

                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">SS GLOBAL/한국</div>
                                                                        <div class="date">21.12.23일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">Syringe6g,Mixing Tips ,Mixing Tips 10개</div>
                                                                        <div class="code">01033000059</div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <button type="button" class="btn_package">규격선택</button>
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="insure rebuy">
                                                        <div>
                                                            <div class="img">
                                                                <img src="/resources/images/dummy/img_ready_for_image.jpg" alt="">
                                                            </div>
                                                            <div class="txt">
                                                                <div class="hd">
                                                                    <div class="detail"><button type="button" class="btn_detail" onclick="openLayerPop('detail');">상세보기</button></div>
                                                                    <a href="javascript:;" class="title" onclick="openLayerPop('detail');">제품이름 제품이름제품이름</a>
                                                                    <div class="badge">
                                                                        <span class="btn_rebuy">구매상품</span>
                                                                        <span class="btn_insure" title="보험 재료 상품입니다.">보험</span>
                                                                    </div>
                                                                </div>
                                                                <div class="bd">
                                                                    <div class="manufact">
                                                                        <div class="manu">SS GLOBAL/한국</div>
                                                                        <div class="date">21.12.23일 주문</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">Syringe6g,Mixing Tips ,Mixing Tips 10개</div>
                                                                        <div class="code">01033000059</div>
                                                                    </div>
                                                                </div>
                                                                <div class="ft">
                                                                    <button type="button" class="btn_package">규격선택</button>
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div>
                                                                                    <a href="javascript:;">CleanCord #000 300cm/ea</a>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- AI 위시리스트 데이터 존재할 때 END -->
                                            
                                            <!-- AI 위시리스트 처음일 때 START -->
                                            <div class="intro_temp wish_empty" style="display:none;">
                                        		<div class="image">
                                        			<img src="/resources/images/quickorder/img_wishlist_intro.png" alt="">
                                        		</div>
                                        		<div class="text">
                                        			<div class="tit">
                                        				AI위시리스트가 처음이시군요?
                                        			</div>
                                        			<div class="desc">
                                        				구매데이터를 바탕으로 AI구매추천을 해드립니다.<br><strong>구매이력이 많아질수록</strong> AI구매추천 결과의 품질이 향상됩니다.
                                        			</div>
                                        		</div>
                                        	</div>
                                            <!-- AI 위시리스트 처음일 때 END -->
                                            
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tutorial_step tutorial_step_2">
                    <div class="bg_click_area" onclick="closeLayerPop(this);"></div>
                    <div class="clip_step"></div>
                    <div class="layer_step">
                        <div class="layer_step_inner">
                            <div class="txt">2. 찾으시는 제품의 규격을 선택해 주세요.</div>
                            <button type="button" class="btn_next" onclick="nextLayerPop(3)">다음</button>
                        </div>
                    </div>
                </div>
            </article>
            <article class="atc_step_2">
                <div class="step_box">
                    <div class="tab_wrap">
                        <div class="tab_list">
                            <ul>
                                <li>
                                    <div>
                                        <button type="button" class="g_q_t3_area">재료상 가격비교</button>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <button type="button" class="g_q_t4_area">재료상 추가 요청</button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="tab_content">
                            <ul>
                                <li>
                                    <div class="empty" id="empty_view_order_area" style="z-index: 2;">
                                        <p>선택하신 상품이 <span>재료상 업체</span> 별로 표시됩니다.</p>
                                    </div>
                                    <div class="tab_content_inner">
                                        <div class="tab_head">
                                        	<div class="row">
                                        		<div class="table_util">
                                        			<span id="shop_compare_cnt">*AI 최저가 가격비교 분석결과입니다.</span>
                                        		</div>
                                        	</div>
                                        </div>
                                        <div class="tab_body">
                                        	<div class="list_style_04">
                                        		<ul>
                                        			<!-- 튜토리얼 시에만 보여지는 리스트 START (삭제금지) -->
                                        			<li class="tutorial_temp insure special">
                                        				<div>
                                        					<div class="img">
                                        						<img src="/resources/images/quickorder/img_tutorial_product_temp.jpg" alt="">
                                        					</div>
                                        					<div class="txt">
                                        						<div class="hd">
                                        							<div class="badge">
                                        								<button class="btn_detail" onclick="openLayerPop('detail');">상세보기</button><span class="btn_insure">보험</span><span class="btn_special">특가</span>
                                        							</div>
                                        							<a href="javascript:;" class="title" onclick="openLayerPop('detail');">GenTaper Finishing File</a>
                                        						</div>
                                        						<div class="bd">
                                        							<div class="manufact">
                                                                        <div class="manu">Micro-Mega</div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand">F1, 21mm yellow</div>
                                                                        <div class="code">03050000420</div>
                                                                    </div>
                                        						</div>
                                        						<div class="ft">
                                                                    <div class="package">
                                                                        <ul>
                                                                            <li>
                                                                                <div>Taper 01</div>
                                                                            </li>
                                                                            <li>
                                                                            	<div>mm 01</div>
                                                                            </li>
                                                                            <li>
                                                                            	<div>Ø3</div>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="util">
	                                                                    <div class="price">최저가 11,000원</div>
	                                                                    <div class="stock">
	                                                                        <div class="inp_stock_wrap">
	                                                                        	<select class="sel_stock" onchange="changeSelect(this);">
	                                                                        		<option value="0" selected>수량선택</option>
	                                                                        		<option value="1">1</option>
	                                                                        		<option value="2">2</option>
	                                                                        		<option value="3">3</option>
	                                                                        		<option value="4">4</option>
	                                                                        		<option value="5">5</option>
	                                                                        		<option value="6">6</option>
	                                                                        		<option value="7">7</option>
	                                                                        		<option value="8">8</option>
	                                                                        		<option value="9">9</option>
	                                                                        		<option value="10">수량 입력하기</option>
	                                                                        	</select>
	                                                                            <input type="text" class="inp_stock">
	                                                                            <button class="btn_stock">장바구니</button>
	                                                                        </div>
	                                                                        <!-- 위시리스트 START -->
	                                                                        <div class="wish_wrap">
	                                                                        	<button type="button" onclick="btnWishClick()"></button>
	                                                                        </div>
	                                                                        <!-- 위시리스트 END -->
	                                                                    </div>
	                                                                </div>
                                                                </div>
                                        					</div>
                                        				</div>
                                        				
                                        			</li>
                                        			<!-- 튜토리얼 시에만 보여지는 리스트 END (삭제금지) -->
                                        			
<%--                                        			<li class="insure special discount" id="select_product_info">--%>
													<%-- 아래 li에 "discount" 클래스 추가 시 할인율 뱃지 보여짐 (20230223 추가)--%>
                                        			<li class="" id="view_order_area">
                                        				<div>
                                        					<div class="img">
                                        						<img id="pd_view_image" src="" onerror="this.src='/resources/images/dummy/img_ready_for_image.jpg'">
                                        					</div>
                                        					<div class="txt">
                                        						<div class="hd">
                                        							<div class="badge">
                                        								<button class="btn_detail" onclick="openLayer('detail');">상세보기</button>
                                                                        <span  class="btn_insure">보험</span>
                                                                        <span  class="btn_special">특가</span>
                                        							</div>
                                        							<a href="javascript:;" class="title" onclick="openLayer('detail');"></a>
                                        						</div>
                                        						<div class="bd">
                                        							<div class="manufact">
                                                                        <div class="manu"></div>
                                                                    </div>
                                                                    <div class="standard">
                                                                        <div class="stand"></div>
                                                                        <div class="code"></div>
                                                                    </div>
                                        						</div>
                                        						<div class="ft">
                                                                    <div class="package">
                                                                        <ul id="group_type">
<%--                                                                            <li>--%>
<%--                                                                                <div >Taper 01</div>--%>
<%--                                                                            </li>--%>
<%--                                                                            <li>--%>
<%--                                                                            	<div >mm 01</div>--%>
<%--                                                                            </li>--%>
<%--                                                                            <li>--%>
<%--                                                                            	<div >Ø3</div>--%>
<%--                                                                            </li>--%>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="util">
	                                                                    <div class="price"></div>
	                                                                    <div class="stock">
	                                                                        <div class="inp_stock_wrap">
                                                                                <input hidden id="tpmm_idx" name="" value="">
                                                                                <input hidden id="tpsm_idx" name="" value="">
                                                                                <input hidden id="tsmi_idx" name="" value="">
                                                                                <input hidden id="pd_name" name="" value="">
                                                                                <input hidden id="pd_standard" name="" value="">
                                                                                <input hidden id="pd_unit" name="" value="">
                                                                                <input hidden id="pd_company" name="" value="">
                                                                                <input hidden id="pd_amount" name="" value="">
                                                                                <select class="sel_stock" id="btn_quick_cart_cnt" onchange="changeSelect(this);">
	                                                                        		<option value="0" selected>수량선택</option>
	                                                                        		<option value="1">1</option>
	                                                                        		<option value="2">2</option>
	                                                                        		<option value="3">3</option>
	                                                                        		<option value="4">4</option>
	                                                                        		<option value="5">5</option>
	                                                                        		<option value="6">6</option>
	                                                                        		<option value="7">7</option>
	                                                                        		<option value="8">8</option>
	                                                                        		<option value="9">9</option>
	                                                                        		<option value="">수량 입력하기</option>
	                                                                        	</select>
	                                                                            <input type="text" class="inp_stock">
	                                                                            <button class="btn_stock" id="btn_quick_cart_add">장바구니</button>
	                                                                        </div>
	                                                                    </div>
	                                                                </div>
                                                                </div>
                                        					</div>
                                        				</div>
                                        			</li>
                                        		</ul>
                                        		<div class="information store_info">
                                                ※ 치과재료 전문 대형 도매상의 판매 가격 중 가장 낮은 가격입니다.
                                            	</div>
                                        	</div>
                                        	<!-- 튜토리얼 시에만 보여지는 리스트 START (삭제금지) -->
                                        	<div class="tutorial_temp accordion_01">
                                                <ul>
                                                    <li>
                                                        <div>
                                                            <a href="javascript:;">
                                                                <div class="row">
                                                                    <div class="text">
                                                                        <div class="title">온라인몰</div>
                                                                    </div>
                                                                    <div class="util">
                                                                        <div class="price">가격</div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="subacc">
                                                                <ul><li><div><div class="row"><div class="text"><div class="title">eDENT</div></div><div class="util"><div class="price">39,000원</div></div></div><div class="row"><div class="standard">21mm / F1(노랑)</div></div></div></li><li><div><div class="row"><div class="text"><div class="title">SeilGlobal</div></div><div class="util"><div class="price">39,000원</div></div></div><div class="row"><div class="standard">21mm / F1(노랑)</div></div></div></li></ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- 튜토리얼 시에만 보여지는 리스트 END (삭제금지) -->
                                            <div class="accordion_01 store_list g_q_t3_compare_area">
                                                <ul>
                                                    <%--<li>
                                                        <div>
                                                            <a href="javascript:;">
                                                                <div class="row">
                                                                    <div class="text">
                                                                        <div class="title">소매상</div>
                                                                    </div>
                                                                    <div class="util">
                                                                        <div class="price">가격</div>
                                                                        <div class="stock">수량(재고)</div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="subacc">
                                                                <div class="empty_wrap">
                                                                    <div class="text">
                                                                        <div class="title">연동된 재료상이 없습니다.</div>
                                                                    </div>
                                                                    <div class="util">
                                                                        <div class="button">
                                                                            <button type="button" class="btn_white" onclick="goTabShow(2,2);">재료상관리</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>--%>
<%--                                                    <li>--%>
<%--                                                        <div>--%>
<%--                                                            <a href="javascript:;">--%>
<%--                                                                <div class="row">--%>
<%--                                                                    <div class="text">--%>
<%--                                                                        <div class="title">최저가 판매 업체</div>--%>
<%--                                                                    </div>--%>
<%--                                                                    <div class="util">--%>
<%--                                                                        <div class="price">가격</div>--%>
<%--                                                                        <div class="stock">수량(재고)</div>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </a>--%>
<%--                                                            <div class="subacc">--%>
<%--                                                                <ul id="view_order_area">--%>
<%--                                                                	&lt;%&ndash;--%>
<%--                                                                    <li>--%>
<%--                                                                        <div>--%>
<%--                                                                            <div class="row">--%>
<%--                                                                                <div class="text">--%>
<%--                                                                                    <div class="title">도매상 A</div>--%>
<%--                                                                                </div>--%>
<%--                                                                                <div class="util">--%>
<%--                                                                                    <div class="price">9,999,999원</div>--%>
<%--                                                                                    <div class="stock">--%>
<%--                                                                                        <div class="inp_stock_wrap">--%>
<%--                                                                                            <input type="text" class="inp_stock" placeholder="9999">--%>
<%--                                                                                            <button type="button" class="btn_stock">담기</button>--%>
<%--                                                                                        </div>--%>
<%--                                                                                    </div>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="row">--%>
<%--                                                                                <div class="standard">Taper 01 / mm 01 / Ø3</div>--%>
<%--                                                                            </div>--%>
<%--                                                                        </div>--%>
<%--                                                                    </li>--%>
<%--                                                                     &ndash;%&gt;--%>
<%--                                                                </ul>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </li>--%>
                                                    <li>
                                                        <div id="view_online_area">
                                                            <a href="javascript:;">
                                                                <div class="row">
                                                                    <div class="text">
                                                                        <div class="title">온라인몰</div>
                                                                    </div>
                                                                    <div class="util">
                                                                        <div class="price">가격</div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="subacc">
                                                                <ul>
                                                                	<%--
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">도매상 A</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="price">9,999,999원</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="standard">Taper 01 / mm 01 /Ø3</div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                     --%>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <%--<li>
                                                        <div>
                                                            <a href="javascript:;">
                                                                <div class="row">
                                                                    <div class="text">
                                                                        <div class="title">재료상 연동정보(2)</div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="subacc">
                                                                <ul>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">한국치과유통</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button type="button" class="btn_red">연동실패</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="subacc_accordion">
                                                                                    <a href="javascript:;">
                                                                                        <div class="row">
                                                                                            <div class="text">
                                                                                                <div class="title">소매상에서 요청을 거절하였습니다.</div>
                                                                                            </div>
                                                                                            <div class="util">
                                                                                                <div class="button">
                                                                                                    <button type="button" class="btn_recommend">추천 도매상</button>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </a>
                                                                                    <div class="subacc_subacc">
                                                                                        <ul>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="text">
                                                                                                            <div class="title">A 소매상</div>
                                                                                                            <div class="desc">18.3 km</div>
                                                                                                        </div>
                                                                                                        <div class="util">
                                                                                                            <div class="button">
                                                                                                                <button type="button" class="btn_white" onclick="openLayerPop('interlock');">연동하기</button>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div
                                                                                                            class="text">
                                                                                                            <div class="title"> B 소매상 </div>
                                                                                                            <div class="desc"> 20.3 km </div>
                                                                                                        </div>
                                                                                                        <div class="util">
                                                                                                            <div class="button">
                                                                                                                <button type="button" class="btn_white" onclick="openLayerPop('interlock');">연동하기</button>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">유닛808</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button type="button" class="btn_white">연동확인중</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>--%>
                                                </ul>
                                            </div>
                                            
                                            <div class="banner store_banner g_q_t3_compare_banner">
                                            	<img src="/resources/images/quickorder/img_quickorder_banner.jpg" onerror="this.src='/resources/images/quickorder/img_quickorder_banner.jpg';" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="empty">
                                        <p>재료상 연동 관리입니다.</p>
                                    </div>
                                    <div class="tab_content_inner">
                                        <div class="tab_head">
                                            <%--<div class="notification">
                                                <div class="btn_add_wrap">
                                                    <button  type="button" class="btn_add" onclick="openLayerPop('request');">재료상 추가 요청</button>
                                                </div>
                                                <div class="noti_box_wrap">
                                                    <button type="button" class="btn_box_close" onclick="closeNotice(this);">&#10005;</button>
                                                    <div class="tit">재료상 연동 관리</div>
                                                    <div class="desc">계정 정보를 한 번만 입력하시면, 각 재료상에 자동으로 로그인 되어 제품 검색, 재고 확인, 주문을 메디밸류 한 곳에서 이용하실 수 있습니다.</div>
                                                </div>
                                            </div>--%>
                                        </div>
                                        <div class="tab_body">
                                        	<div class="intro_temp g_q_t4_content">
                                        		<div class="image">
                                        			<img src="/resources/images/quickorder/img_material_intro.png" alt="">
                                        		</div>
                                        		<div class="text">
                                        			<div class="tit">
                                        				기존에 거래하던 재료상을<br>온라인에서 만나보세요.
                                        			</div>
                                        			<div class="desc">
                                        				연동을 통해 온라인 주문과 통합 관리가 가능해집니다.<br>보다 나은 서비스 제공을 위하여 서비스 준비중에 있습니다.
                                        			</div>
                                        			<div class="etc">
                                        				Coming Soon !
                                        			</div>
                                        		</div>
                                        	</div>
                                            <%--<div class="accordion_01 manage">
                                                <ul>
                                                    <li>
                                                        <div>
                                                            <a href="javascript:;">
                                                                <div class="row">
                                                                    <div class="text">
                                                                        <div class="title">이용 중인 재료상 <span class="num">(3)</span></div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="subacc">
                                                                <ul>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">SS GLOBAL</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button type="button" class="btn_blue">연동완료</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">DVmall</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button type="button" class="btn_blue">연동완료</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">DVmall</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button type="button" class="btn_blue">연동완료</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div>
                                                            <a href="javascript:;">
                                                                <div class="row">
                                                                    <div class="text">
                                                                        <div class="title">확인 중인 재료상 <span class="num">(2)</span></div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="subacc">
                                                                <ul>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">SS GLOBAL</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button type="button" class="btn_white">연동확인중</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">DVmall</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button type="button" class="btn_white">연동확인중</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div>
                                                            <a href="javascript:;">
                                                                <div class="row">
                                                                    <div class="text">
                                                                        <div class="title">연동 가능 재료상 <span class="num">(0)</span></div>
                                                                    </div>
                                                                    <div class="util">
                                                                        <div class="market_search_wrap">
                                                                            <input type="text" class="inp_search" placeholder="재료상 검색하기">
                                                                            <button type="button" class="btn_search"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="subacc">
                                                                <ul>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">건화약품</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button type="button" class="btn_white" onclick="openLayerPop('interlock');">연동하기</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">경동사</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button type="button" class="btn_white" onclick="openLayerPop('interlock');">연동하기</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">뉴케이팜</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button type="button" class="btn_white" onclick="openLayerPop('interlock');">연동하기</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">대일양행</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button type="button" class="btn_white" onclick="openLayerPop('interlock');">연동하기</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="text">
                                                                                    <div class="title">더원팜</div>
                                                                                </div>
                                                                                <div class="util">
                                                                                    <div class="button">
                                                                                        <button type="button" class="btn_white" onclick="openLayerPop('interlock');">연동하기</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>--%>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="step_box step_box_recent">
                    <div class="tab_wrap">
                        <div class="tab_content">
                            <div class="empty" id="empty_view_prev_order_area" style="z-index: 1">
                                <p>최근 3개월 내 주문내역이 없습니다.</p>
                            </div>
                            <div class="recent_wrap">
                                <div class="tab_head">
                                    <div class="recent_tit">최근 주문내역 (3개월)</div>
                                </div>
                                <div class="tab_body">
                                    <div class="table_wrap g_q_t3_recently_order_area">
                                        <table>
                                            <colgroup>
                                                <col style="width:70px;">
                                                <col>
                                                <col>
                                                <col>
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th>주문날짜</th>
                                                    <th>단가</th>
                                                    <th>수량</th>
                                                    <th>합계</th>
                                                </tr>
                                            </thead>
                                            <tbody id="view_prev_order_area">
                                            	<%--
                                                <tr>
                                                    <td>2021.12.29</td>
                                                    <td>9,999,999원</td>
                                                    <td>9999개</td>
                                                    <td>9,999,999E</td>
                                                </tr>
                                                 --%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tutorial_step tutorial_step_3">
                    <div class="bg_click_area" onclick="closeLayerPop(this);"></div>
                    <div class="clip_step"></div>
                    <div class="layer_step">
                        <div class="layer_step_inner">
                            <div class="txt">3. 찾으시는 제품의 최저가를 확인해 보세요.</div>
                            <button type="button" class="btn_next" onclick="nextLayerPop(4)">다음</button>
                        </div>
                    </div>
                </div>
            </article>
            <article class="atc_step_3">
                <div class="step_box">
                    <div class="tab_wrap">
                        <div class="tab_list">
                            <ul>
                                <li>
                                    <div>
<%--                                        <c:if test="${empty cart_list}">--%>
<%--                                            <button type="button" id="btn_cart_list">장바구니</button>--%>
<%--                                        </c:if>--%>
<%--                                        <c:if test="${!empty cart_list}">--%>
                                        <button type="button" id="btn_cart_list" class="g_q_t5_area">장바구니(${cart_list_size})</button>
<%--                                        </c:if>--%>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <button id="btn_order_info_list" type="button" class="g_q_t6_area">주문내역</button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="tab_content">
                            <ul>
                                <li>
                                    <div class="empty" id="cart_empty_area" <c:if test="${empty cart_list}">style="z-index: 2;"</c:if>>
                                        <p>제품을 장바구니에 담아주세요.</p>
                                    </div>
                                    <div class="tab_content_inner">
                                        <div class="tab_head">
                                            <div class="row">
                                                <div class="table_util">
                                                    <label class="label_check g_q_t5_top_check"><input type="checkbox" class="chk_cart_all chk_cart"><span id="btn_cart_list_all_cnt">전체(0)</span></label>
                                                    <button type="button" id="btn_total_cart_del" class="btn_util g_q_t5_top_del">삭제</button>
                                                    <button type="button" id="btn_reload" class="btn_util g_q_t5_top_reload">새로고침</button>
                                                </div>
                                                <div class="table_align">
                                                    <select class="sel_align g_q_t5_top_sort" id="pd_cart_align">
                                                        <option value="order_date" selected>제품담긴순서별 정렬</option>
                                                        <option value="order_name">제품이름별 정렬</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab_body">
                                            <div class="table_style_01">
                                                <ul>
                                                    <!-- 튜토리얼 시에만 보여지는 리스트 START (삭제금지) -->
                                                    <li class="tutorial_temp">
                                                        <div>
                                                            <%--<div class="thead">
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox"><span>eDENT</span></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="price">231,000원</div>
                                                                    </div>
                                                                </div>
                                                            </div>--%>
                                                            <div class="tbody">
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox"><span>GenTaper Finishing File</span></label>
                                                                        </div>
                                                                        <div class="standard">F1, 21mm yellow</div>
                                                                        <div class="manufact">Micro-Mega</div>
                                                                        <div class="package">6ea/1box</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <select class="sel_stock" onchange="changeSelect(this);">
	                                                                       		<option value="1">1</option>
	                                                                       		<option value="2">2</option>
	                                                                       		<option value="3">3</option>
	                                                                       		<option value="4">4</option>
	                                                                       		<option value="5">5</option>
	                                                                       		<option value="6">6</option>
	                                                                       		<option value="7">7</option>
	                                                                       		<option value="8">8</option>
	                                                                       		<option value="9">9</option>
	                                                                       		<option value="10">수량 입력하기</option>
	                                                                       	</select>
                                                                        </div>
                                                                        <div class="util">
	                                                                        <div class="price">39,000원</div>
	                                                                        <div class="button">
	                                                                            <button type="button" class="btn_delete"></button>
	                                                                        </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox"><span>Hero apical</span></label>
                                                                        </div>
                                                                        <div class="standard">종합 06 taper, 08 taper</div>
                                                                        <div class="manufact">Micro-Mega</div>
                                                                        <div class="package">4ea/1box</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <select class="sel_stock" onchange="changeSelect(this);">
	                                                                       		<option value="1">1</option>
	                                                                       		<option value="2">2</option>
	                                                                       		<option value="3">3</option>
	                                                                       		<option value="4">4</option>
	                                                                       		<option value="5">5</option>
	                                                                       		<option value="6">6</option>
	                                                                       		<option value="7">7</option>
	                                                                       		<option value="8">8</option>
	                                                                       		<option value="9">9</option>
	                                                                       		<option value="10">수량 입력하기</option>
	                                                                       	</select>
                                                                        </div>
                                                                        <div class="util">
	                                                                        <div class="price">52,000원</div>
	                                                                        <div class="button">
	                                                                            <button type="button" class="btn_delete"></button>
	                                                                        </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox"><span>ENDO TRAINING BLOCKS</span></label>
                                                                        </div>
                                                                        <div class="standard">0.15 - 0.35 taper .02</div>
                                                                        <div class="manufact">Dentsply Sirona</div>
                                                                        <div class="package">8ea</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <select class="sel_stock" onchange="changeSelect(this);">
	                                                                       		<option value="1">1</option>
	                                                                       		<option value="2">2</option>
	                                                                       		<option value="3">3</option>
	                                                                       		<option value="4">4</option>
	                                                                       		<option value="5">5</option>
	                                                                       		<option value="6">6</option>
	                                                                       		<option value="7">7</option>
	                                                                       		<option value="8">8</option>
	                                                                       		<option value="9">9</option>
	                                                                       		<option value="10">수량 입력하기</option>
	                                                                       	</select>
                                                                        </div>
                                                                        <div class="util">
	                                                                        <div class="price">140,000원</div>
	                                                                        <div class="button">
	                                                                            <button type="button" class="btn_delete"></button>
	                                                                        </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <!-- 튜토리얼 시에만 보여지는 리스트 END (삭제금지) -->
                                                    <li>
                                                        <div>
                                                            <%--<div class="thead">
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" id="chk_all" class="chk_cart chk_cart_title"><span>최저가 제품</span></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="price" id="view_cart_total_amount"></div>
                                                                    </div>
                                                                </div>
                                                            </div>--%>
                                                            <div class="tbody" id="view_order_cart_area">
                                                            	<c:if test="${!empty cart_list}">
                                                            		<c:forEach var="item" items="${cart_list}" varStatus="status">
                                                            			<c:set var="product_group_info" value="${item.fd_product_standard}"/>
                                                            			<div class="tr insure special">
		                                                                    <div class="text">
		                                                                        <div class="title">
		                                                                            <label class="label_check g_q_t5_product_check">
                                                                                        <c:if test="${memberId eq item.fd_reg_id}">
                                                                                            <input type="checkbox" id="pd_order_chk" name="pd_order_chk" is_self="Y" class="chk_cart chk_cart_list" value="Y">
                                                                                        </c:if>
                                                                                        <c:if test="${memberId ne item.fd_reg_id}">
                                                                                            <input type="checkbox" id="pd_order_chk" name="pd_order_chk" is_self="N" class="chk_cart chk_cart_list" value="Y">
                                                                                        </c:if>
		                                                                            	<div>
		                                                                            		<div class="badge">
                                                                                                <c:if test="${!empty item.fd_product_insure_code}">
                                                                                                    <span class="btn_insure">[보험]</span>
                                                                                                </c:if>
                                                                                                <c:set var="event_text" value="[특가]"/>
                                                                                                <c:set var="event_list">26583,26584,26608,26609,26610,26612,27075,27074,27862,27863,27864,27865,27866</c:set>
                                                                                                <c:if test="${item.fd_event_yn eq 'Y'}">
                                                                                                	<%-- 이벤트 표시 --%>
                                                                                                	<c:if test="${!empty event_list }">
                                                                                                		<c:forEach var="e_item" items="${event_list}">
                                                                                                			<c:if test="${e_item == item.fk_tpmm_idx}">
                                                                                                				<c:set var="event_text" value="[이벤트]"/>
                                                                                                			</c:if>
                                                                                                		</c:forEach>
                                                                                                	</c:if>
                                                                                                    <span class="btn_special">${event_text}</span>
                                                                                                </c:if>
		                                                                            		</div>
	                                                                            		</div>
		                                                                            </label>
                                                                                    <a href="javascript:;" class="g_q_t5_product_info" onclick="getCartGroupProductInfo(this)">${item.fd_product_name}</a>
		                                                                        </div>
		                                                                        <c:if test="${item.fd_group_type_1 ne ''}"><c:set var="product_group_info" value="${item.fd_group_type_1}"/></c:if>
		                                                                        <c:if test="${item.fd_group_type_2 ne ''}"><c:set var="product_group_info" value="${product_group_info} / ${item.fd_group_type_2}"/></c:if>
		                                                                        <c:if test="${item.fd_group_type_3 ne ''}"><c:set var="product_group_info" value="${product_group_info} / ${item.fd_group_type_3}"/></c:if>
                                                                                <%-- <div class="standard">${product_group_info}</div>--%>
		                                                                        <div class="standard">${item.fd_product_standard}</div>
		                                                                        <div class="manufact">${item.fd_company_info}</div>
		                                                                        <div class="package">${item.fd_product_unit}</div>
		                                                                    </div>
		                                                                    <div class="number">
		                                                                        <div class="input">
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

                                                                                    <input type="text" id="cart_detail_cnt"  name="cart_detail_cnt" value="${item.fd_cnt}" class="inp_stock g_q_t5_product_cnt" <c:if test="${item.fd_cnt >= 10}">style="display: inline-block"</c:if>>
		                                                                            <select class="sel_stock g_q_t5_product_cnt" name="cart_detail_cnt" onchange="changeSelect(this);" <c:if test="${item.fd_cnt >= 10}">style="display: none;"</c:if>>
		                                                                        		<c:forEach var="i" begin="1" end="9">
                                                                                            <option value="${i}" <c:if test="${i == item.fd_cnt}">selected</c:if> >${i}</option>
                                                                                        </c:forEach>
                                                                                        <option value="">수량 입력하기</option>
		                                                                        	</select>
		                                                                        </div>
		                                                                        <div class="util">
			                                                                        <div class="price">			                                                                        
			                                                                        	<%--
			                                                                        	<c:choose>
																							<c:when test="${item.fd_group_type_cd eq 'PCG001' and member_event_yn eq 'Y' }">
																								<fmt:formatNumber value="${item.fd_product_discount_amount * item.fd_cnt}" pattern="#,###"/>
																								(<fmt:formatNumber value="${item.fd_product_amount * item.fd_cnt}" pattern="#,###"/>)
																							</c:when>
																							<c:otherwise>
																								<fmt:formatNumber value="${item.fd_product_amount * item.fd_cnt}" pattern="#,###"/>
																							</c:otherwise>
																						</c:choose>
																						 --%>
																						 <fmt:formatNumber value="${item.fd_product_amount * item.fd_cnt}" pattern="#,###"/>
			                                                                        	원</div>
			                                                                        <div class="button">
			                                                                            <button type="button" class="btn_delete g_q_t5_product_del"></button>
			                                                                        </div>
		                                                                        </div>
		                                                                    </div>
		                                                                </div>
                                                            		</c:forEach>
                                                            	</c:if>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <%--
                                                    <li>
                                                        <div>
                                                            <div class="thead">
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_title"><span>도매상 B</span></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="price">5,000,000원</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="tbody">
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_list"><span>Smartcord X</span></label>
                                                                        </div>
                                                                        <div class="standard">CleanCord #000 300cm/ea</div>
                                                                        <div class="manufact">제조사</div>
                                                                        <div class="package">포장단위</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="price">
                                                                            3,000,000원
                                                                        </div>
                                                                        <div class="button">
                                                                            <button type="button" class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_list"><span>Smartcord X</span></label>
                                                                        </div>
                                                                        <div class="standard">CleanCord #000 300cm/ea</div>
                                                                        <div class="manufact">제조사</div>
                                                                        <div class="package">포장단위</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="price">1,000,000원</div>
                                                                        <div class="button">
                                                                            <button type="button" class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_list"><span>Smartcord X</span></label>
                                                                        </div>
                                                                        <div class="standard">CleanCord #000 300cm/ea</div>
                                                                        <div class="manufact">제조사</div>
                                                                        <div class="package">포장단위</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="price">1,000,000원</div>
                                                                        <div class="button">
                                                                            <button type="button" class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div>
                                                            <div class="thead">
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_title"><span>도매상 C</span></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="price">5,000,000원</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="tbody">
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_list"><span>Smartcord X</span></label>
                                                                        </div>
                                                                        <div class="standard">CleanCord #000 300cm/ea</div>
                                                                        <div class="manufact">제조사</div>
                                                                        <div class="package">포장단위</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="price">
                                                                            3,000,000원
                                                                        </div>
                                                                        <div class="button">
                                                                            <button type="button" class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_list"><span>Smartcord X</span></label>
                                                                        </div>
                                                                        <div class="standard">CleanCord #000 300cm/ea</div>
                                                                        <div class="manufact">제조사</div>
                                                                        <div class="package">포장단위</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="price">1,000,000원</div>
                                                                        <div class="button">
                                                                            <button type="button" class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="tr">
                                                                    <div class="text">
                                                                        <div class="title">
                                                                            <label class="label_check"><input type="checkbox" class="chk_cart chk_cart_list"><span>Smartcord X</span></label>
                                                                        </div>
                                                                        <div class="standard">CleanCord #000 300cm/ea</div>
                                                                        <div class="manufact">제조사</div>
                                                                        <div class="package">포장단위</div>
                                                                    </div>
                                                                    <div class="number">
                                                                        <div class="input">
                                                                            <input type="text">
                                                                        </div>
                                                                        <div class="price">1,000,000원</div>
                                                                        <div class="button">
                                                                            <button type="button" class="btn_delete"></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                     --%>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="tab_foot">
                                            <div class="tab_foot_top">
                                                <c:choose>
                                                    <c:when test="${order_check == 0}">
                                                        <div class="delivery_price_bar">
                                                            <div class="price_difference">첫 구매는 <span>무료 배송</span></div>
                                                            <div class="price_track">
                                                                <div class="current_bar" style="width:100%;"></div>
                                                            </div>
                                                        </div>
                                                        <div class="delivery_price_img free"><img src="/resources/images/quickorder/img_delivery_car.png" alt="" /></div>
                                                    </c:when>
                                                    <c:when test="${event_delivery_yn eq 'Y'}">
                                                        <div class="delivery_price_bar">
                                                            <div class="price_difference">신규 고객은 첫 달 <span>무료 배송</span></div>
                                                            <div class="price_track">
                                                                <div class="current_bar" style="width:100%;"></div>
                                                            </div>
                                                        </div>
                                                        <div class="delivery_price_img free"><img src="/resources/images/quickorder/img_delivery_car.png" alt="" /></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="delivery_price_bar">
                                                            <div class="price_difference">주문금액이 100,000원 이상이면 <span>무료 배송</span></div>
                                                            <div class="price_track">
                                                                <div class="current_bar"></div>
                                                            </div>
                                                        </div>
                                                        <div class="delivery_price_img"><img src="/resources/images/quickorder/img_delivery_car.png" alt="" /></div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="sum_wrap">
                                            	<div class="amount">
                                            		총 <span id="view_product_check_total_cnt">0</span>건
                                            	</div>
                                            	<div class="price">
                                                	합계 <span id="view_product_check_total_amount">0</span>원
                                            	</div>
                                            </div>
                                            <div class="notification g_q_t5_order_notice">
                                                <div class="noti_box_wrap">
                                                    <button type="button" class="btn_box_close" onclick="closeNotice(this);">&#10005;</button>
                                                    <div class="tit warning">수량 및 규격확인</div>
                                                    <div class="desc">주문하기 버튼 선택 전에 제품명, 수량, 규격을 확인해주시기 바랍니다.</div>
                                                </div>
                                            </div>
                                            <div class="btn_order_wrap">
                                                <button type="button" class="btn_order g_q_t5_order_btn" value="${paid_type}" >주문하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="empty" id="order_empty_area" style="z-index: 1;">
                                        <p>주문내역이 없습니다.</p>
                                    </div>
                                    <div class="tab_content_inner">
                                        <div class="tab_head">
                                            <div class="col">
                                                <div class="total_month_wrap">
                                                    <%-- <select name="" id="" class="sel_month">
                                                        <option value="">11월 주문금액</option>
                                                    </select> --%>
                                                    <input type="text" class="inp_month g_q_t6_month_area">
                                                    <div class="sum_month" id="order_month_total_payment">99,999,999원</div>
                                                </div>
                                                <div class="comm_search_wrap">
                                                    <%-- <select name="" class="sel_search">
                                                        <option value="">일자 순</option>
                                                    </select> --%>
                                                    <div class="chk_search">
                                                    	<label class="label_check_3 g_q_t6_insure_check"><input type="checkbox" id="insure_code_yn"><span>보험여부</span></label>
                                                    </div>
                                                    <span class="bar"></span>
                                                    <input type="text" placeholder="제품명" class="inp_search g_q_t6_top_search_info" id="order_info_list_search_input">
                                                    <button type="button" class="btn_search g_q_t6_top_search_btn" id="btn_order_info_list_search"></button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab_body">
                                            <div class="list_style_03" id="order_info_list">
                                                <dl>
                                                    <dt>
                                                        <div class="order_date">2021.11.23.</div>
                                                    </dt>
                                                    <dd>
                                                        <div class="order_list">
                                                            <ul>
                                                                <li class="complete">
                                                                    <div>
                                                                        <div class="txt">
                                                                            <div class="hd">
                                                                                <a href="javascript:;"
                                                                                    class="title">주문번호</a>
                                                                                <div class="badge">
                                                                                    <div class="time">2021.11.23. 09:31
                                                                                    </div>
                                                                                    <span class="btn_complete">주문완료</span>
                                                                                    <span class="btn_fail">주문실패</span>
                                                                                    <span class="btn_somefail">일부주문실패</span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="bd">
                                                                                <div class="accordion_02">
                                                                                    <!-- 주문건이 여러건일 때 보여짐 START -->
                                                                                    <a href="javascript:;">
                                                                                        <div class="text">하루온팩(더큰사이즈) 외
                                                                                            3건</div>
                                                                                        <div class="sum">64,852원</div>
                                                                                    </a>
                                                                                    <!-- 주문건이 여러건일 때 보여짐 END -->
                                                                                    <div class="subacc">
                                                                                        <ul>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">하루온팩(더큰사이즈)</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">
                                                                                                        	<div class="standard">750밀리리터1(EA)</div>
                                                                                                        	<div class="manufact">제조사</div>
                                                                                                        	<div class="package">포장단위</div>
                                                                                                        </div>
                                                                                                        <div class="util">
                                                                                                        	<div class="button"><button type="button">다시담기</button></div>
                                                                                                        	<div class="amount">50개</div>
                                                                                                        	<div class="price">14,852원</div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">하루온팩(더큰사이즈)</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">
                                                                                                        	<div class="standard">750밀리리터1(EA)</div>
                                                                                                        	<div class="manufact">제조사</div>
                                                                                                        	<div class="package">포장단위</div>
                                                                                                        </div>
                                                                                                        <div class="util">
                                                                                                        	<div class="button"><button type="button">다시담기</button></div>
                                                                                                        	<div class="amount">50개</div>
                                                                                                        	<div class="price">14,852원</div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">하루온팩(더큰사이즈)</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">
                                                                                                        	<div class="standard">750밀리리터1(EA)</div>
                                                                                                        	<div class="manufact">제조사</div>
                                                                                                        	<div class="package">포장단위</div>
                                                                                                        </div>
                                                                                                        <div class="util">
                                                                                                        	<div class="button"><button type="button">다시담기</button></div>
                                                                                                        	<div class="amount">50개</div>
                                                                                                        	<div class="price">14,852원</div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="complete">
                                                                    <div>
                                                                        <div class="txt">
                                                                            <div class="hd">
                                                                                <a href="javascript:;" class="title">주문번호</a>
                                                                                <div class="badge">
                                                                                    <div class="time">2021.11.23. 09:31</div>
                                                                                    <span class="btn_complete">주문완료</span>
                                                                                    <span class="btn_fail">주문실패</span>
                                                                                    <span class="btn_somefail">일부주문실패</span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="bd">
                                                                                <div class="accordion_02">
                                                                                    <!-- 주문건이 여러건일 때 보여짐 START -->
                                                                                    <!-- <a href="javascript:;">
                                                                                        <div class="text">하루온팩(더큰사이즈) 외 3건</div>
                                                                                        <div class="sum">64,852원</div>
                                                                                    </a> -->
                                                                                    <!-- 주문건이 여러건일 때 보여짐 END -->
                                                                                    <div class="subacc">
                                                                                        <ul>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">타나민 정 80mg</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">
                                                                                                        	<div class="standard">120밀리그램 90(정)</div>
                                                                                                        	<div class="manufact">제조사</div>
                                                                                                        	<div class="package">포장단위</div>
                                                                                                        </div>
                                                                                                        <div class="util">
                                                                                                        	<div class="button"><button type="button">다시담기</button></div>
                                                                                                        	<div class="amount">3개</div>
                                                                                                            <div class="price">0원<span class="disabled">(64,852원)</span></div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </dd>
                                                </dl>
                                                <dl>
                                                    <dt>
                                                        <div class="order_date">2021.11.22.</div>
                                                    </dt>
                                                    <dd>
                                                        <div class="order_list">
                                                            <ul>
                                                                <li class="complete">
                                                                    <div>
                                                                        <div class="txt">
                                                                            <div class="hd">
                                                                                <a href="javascript:;"class="title">주문번호</a>
                                                                                <div class="badge">
                                                                                    <div class="time">2021.11.23. 09:31</div>
                                                                                    <span class="btn_complete">주문완료</span>
                                                                                    <span class="btn_fail">주문실패</span>
                                                                                    <span class="btn_somefail">일부주문실패</span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="bd">
                                                                                <div class="accordion_02">
                                                                                    <!-- 주문건이 여러건일 때 보여짐 START -->
                                                                                    <a href="javascript:;">
                                                                                        <div class="text">하루온팩(더큰사이즈) 외 3건</div>
                                                                                        <div class="sum">64,852원</div>
                                                                                    </a>
                                                                                    <!-- 주문건이 여러건일 때 보여짐 END -->
                                                                                    <div class="subacc">
                                                                                        <ul>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">하루온팩(더큰사이즈)</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">
                                                                                                        	<div class="standard">750밀리리터1(EA)</div>
                                                                                                        	<div class="manufact">제조사</div>
                                                                                                        	<div class="package">포장단위</div>
                                                                                                        </div>
                                                                                                        <div class="util">
                                                                                                        	<div class="button"><button type="button">다시담기</button></div>
                                                                                                        	<div class="amount">50개</div>
                                                                                                        	<div class="price">14,852원</div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">하루온팩(더큰사이즈)</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">
                                                                                                        	<div class="standard">750밀리리터1(EA)</div>
                                                                                                        	<div class="manufact">제조사</div>
                                                                                                        	<div class="package">포장단위</div>
                                                                                                        </div>
                                                                                                        <div class="util">
                                                                                                        	<div class="button"><button type="button">다시담기</button></div>
                                                                                                        	<div class="amount">50개</div>
                                                                                                        	<div class="price">14,852원</div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">하루온팩(더큰사이즈)</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">
                                                                                                        	<div class="standard">750밀리리터1(EA)</div>
                                                                                                        	<div class="manufact">제조사</div>
                                                                                                        	<div class="package">포장단위</div>
                                                                                                        </div>
                                                                                                        <div class="util">
                                                                                                        	<div class="button"><button type="button">다시담기</button></div>
                                                                                                        	<div class="amount">50개</div>
                                                                                                        	<div class="price">14,852원</div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <%--<li class="fail">
                                                                    <div>
                                                                        <div class="txt">
                                                                            <div class="hd">
                                                                                <a href="javascript:;" class="title">지오영 네트웍스</a>
                                                                                <div class="badge">
                                                                                    <div class="time">2021.11.23. 09:31</div>
                                                                                    <span class="btn_complete">주문완료</span>
                                                                                    <span class="btn_fail">주문실패</span>
                                                                                    <span class="btn_somefail">일부주문실패</span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="bd">
                                                                                <div class="accordion_02">
                                                                                    <!-- 주문건이 여러건일 때 보여짐 START -->
                                                                                    <!-- <a href="javascript:;">
                                                                                        <div class="text">하루온팩(더큰사이즈) 외 3건</div>
                                                                                        <div class="sum">64,852원</div>
                                                                                    </a> -->
                                                                                    <!-- 주문건이 여러건일 때 보여짐 END -->
                                                                                    <div class="subacc">
                                                                                        <ul>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">타나민 정 80mg</div>
                                                                                                        <div class="stock">0/3개</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">120밀리그램 90(정) / 포장단위 / 제조</div>
                                                                                                        <div class="price">0원<span class="disabled">(64,852원)</span>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="somefail">
                                                                    <div>
                                                                        <div class="txt">
                                                                            <div class="hd">
                                                                                <a href="javascript:;" class="title">백제약품</a>
                                                                                <div class="badge">
                                                                                    <div class="time">2021.11.23. 09:31 </div>
                                                                                    <span class="btn_complete">주문완료</span>
                                                                                    <span class="btn_fail">주문실패</span>
                                                                                    <span class="btn_somefail">일부주문실패</span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="bd">
                                                                                <div class="accordion_02">
                                                                                    <!-- 주문건이 여러건일 때 보여짐 START -->
                                                                                    <a href="javascript:;">
                                                                                        <div class="text">하루온팩(더큰사이즈) 외2건</div>
                                                                                        <div class="sum">14,852원<span class="disabled">(20,000원)</span></div>
                                                                                    </a>
                                                                                    <!-- 주문건이 여러건일 때 보여짐 END -->
                                                                                    <div class="subacc">
                                                                                        <ul>
                                                                                            <li>
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">하루온팩(더큰사이즈)</div>
                                                                                                        <div class="stock">50/50개</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">750밀리리터1(EA) / 제조사 / 포장단위</div>
                                                                                                        <div class="price">14,852원</div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                            <li class="somefail">
                                                                                                <div>
                                                                                                    <div class="row">
                                                                                                        <div class="title">리스테린(쿨민트)</div>
                                                                                                        <div class="stock">0/3개</div>
                                                                                                    </div>
                                                                                                    <div class="row">
                                                                                                        <div class="descript">10G / 포장단위 / 제조</div>
                                                                                                        <div class="price">0원<span class="disabled">(5,852원)</span></div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>--%>
                                                            </ul>
                                                        </div>
                                                    </dd>
                                                </dl>
                                            </div>
                                        </div>
                                        <div class="tab_foot">
                                            <div class="btn_inquiry_wrap">
                                                <button type="button" class="btn_inquiry g_q_t6_view_puchase" id="btn_member_purchase_list">구매내역 조회</button>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tutorial_step tutorial_step_4">
                    <div class="bg_click_area" onclick="closeLayerPop(this);"></div>
                    <div class="clip_step"></div>
                    <div class="layer_step">
                        <div class="layer_step_inner">
                            <div class="txt">4. 제품들을 한눈에 확인해 보세요.</div>
                            <button type="button" class="btn_next" onclick="nextLayerPop(5)">다음</button>
                        </div>
                    </div>
                </div>
                <div class="tutorial_step tutorial_step_5">
                    <div class="bg_click_area" onclick="closeLayerPop(this);"></div>
                    <div class="clip_step"></div>
                    <div class="layer_step">
                        <div class="layer_step_inner">
                            <div class="txt">5. 장바구니에 담긴 제품들을 바로 주문해 보세요.</div>
                            <button type="button" class="btn_next" onclick="nextLayerPop(6)">다음</button>
                        </div>
                    </div>
                </div>
            </article>
        </div>

        <!-- 빠른주문 사용안내 팝업 -->
        <div class="quickorder_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button type="button" class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="img">
                        <img src="/resources/images/quickorder/img_qorder_pop.png" alt="">
                    </div>
                </div>
                <div class="btn_wrap">
                    <button type="button" class="btn_disable" onclick="closeLayerPop(this);">닫기</button>
                    <button type="button" class="btn_yellow" onclick="nextLayerPop(1)">자세히 보기</button>
                </div>
            </div>
        </div>

        <!-- 연동하기 팝업 -->
        <div class="interlock_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button type="button" class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                            <div class="title">건화약품 연동하기</div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                            <div class="col">
                                <div class="desc">(건화약품 한줄 소개멘트)</div>
                            </div>
                            <div class="col">
                                <div class="tit">건화약품 연락처</div>
                                <div class="desc">02-7468-4114</div>
                            </div>
                            <div class="col">
                                <div class="tit">건화약품 주소</div>
                                <div class="desc">서울시 종로구 하마로 143길, 기호빌딩</div>
                            </div>
                            <div class="col">
                                <div class="tit">건화약품 홈페이지</div>
                                <div class="desc">www.건화약품.co.kr</div>
                            </div>
                            <div class="col">
                                <div class="desc">※ 등록하신 계정 정보는 암호화 되어 안전하게 관리됩니다.<br>연동관련 문의사항은 메디밸류 고객센터(02-780-3921)로 연락 부탁 드립니다.</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button type="button" class="btn_disable" onclick="closeLayerPop(this);">닫기</button>
                    <button type="button" class="btn_blue" onclick="">연동하기</button>
                </div>
            </div>
        </div>

        <!-- 재료상 추가 요청 팝업 -->
        <div class="request_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button type="button" class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                            <div class="title">재료상 추가 요청</div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                            <div class="col">
                                <div class="desc">재료상 정보를 입력해 주시면 재료상 추가가 진행됩니다.</div>
                            </div>
                            <div class="col">
                                <div class="tit">재료상 이름</div>
                                <div class="inp">
                                    <input type="text" placeholder="재료상 이름을 입력해 주세요.">
                                </div>
                            </div>
                            <div class="col">
                                <div class="tit">재료상 연락처</div>
                                <div class="inp">
                                    <input type="text" placeholder="재료상 연락처를 입력해 주세요.">
                                </div>
                            </div>
                            <div class="col">
                                <div class="desc">※ 등록하신 계정 정보는 암호화 되어 안전하게 관리됩니다.<br>연동관련 문의사항은 메디밸류 고객센터(02-780-3921)로 연락 부탁 드립니다.</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button type="button" class="btn_disable" onclick="closeLayerPop(this);">닫기</button>
                    <button type="button" class="btn_blue" onclick="">요청하기</button>
                </div>
            </div>
        </div>

        <!-- 재품 상세 팝업 -->
        <div class="detail_pop layer_pop" id="view_product_detail_info">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button type="button" class="btn_close g_q_product_popup_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                        	<div class="title view_product_detail_info_pd_name_title"></div>
                        	<%--
                            <div class="title">CleanCord<span class="cate">[코드/지혈용품]</span></div>
                             --%>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                            <div class="row">
                                <div class="image g_q_product_popup_img">
                                    <div class="img">
                                        <img class="pd_info_view view_product_detail_info_pd_image img_zoom_image" src="/resources/images/dummy/img_ready_for_image.jpg" alt="" id="img_zoom_image">
                                    </div>
                                    <div class="img_zoom_result" id="img_zoom_result"></div>
                                </div>
                                <div class="text g_q_product_popup_total">
                                    <ul>
                                        <li>
                                            <div>
                                                <div class="tit">제품명</div>
                                                <div class="desc view_product_detail_info_pd_name pd_info_view"></div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="tit">제조사</div>
                                                <div class="desc view_product_detail_info_pd_company_info pd_info_view"></div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="tit">포장단위</div>
                                                <div class="desc view_product_detail_info_pd_unit pd_info_view"></div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="tit">보험코드</div>
                                                <div class="desc view_product_detail_info_insure_code_info">-</div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <div class="tit">규격 | <span class="view_product_detail_info_pd_standard_cnt pd_info_view"></span>종류</div>
                                                <div class="desc scrolly">
                                                    <ul id="view_product_detail_info_pd_standard_info" class="pd_info_view">
                                                    	<%--
                                                        <li>
                                                            <div>CleanCord #000 300cm/ea</div>
                                                        </li>
                                                         --%>                                                       
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col">

                            	<!-- 상세 내용이 있을 때 detail에 active클래스 추가 -->
                            	<div class="detail view_product_detail_info_pd_content">
                            		<button class="btn_detail" type="button" onclick="btnDetailClick(this);">상품 상세정보 보기</button>
                            		<div class="detail_editor">
                            		</div>
                            	</div>

                                <div class="spec">
                                    <div class="desc">전자상거래 등에서의 상품정보제공고시</div>
                                    <ul>
                                        <li class="g_q_product_popup_company">
                                            <div>
                                                <div class="tit">제조사/수입사</div>
                                                <div class="desc view_product_detail_info_pd_company_info pd_info_view"></div>
                                            </div>
                                        </li>
                                        <li class="g_q_product_popup_code">
                                            <div>
                                                <div class="tit">상품코드</div>
                                                <div class="desc view_product_detail_info_pd_medi_code pd_info_view"></div>
                                            </div>
                                        </li>
                                        <li class="g_q_product_popup_unit">
                                            <div>
                                                <div class="tit">중량/용량</div>
                                                <div class="desc view_product_detail_info_pd_unit pd_info_view"></div>
                                            </div>
                                        </li>
                                        <li class="g_q_product_popup_explain">
                                            <div>
                                                <div class="tit">취급주의사항</div>
                                                <div class="desc">제품 안에 사용 설명서를 참고하세요</div>
                                            </div>
                                        </li>
                                        <li class="g_q_product_popup_use_info">
                                            <div>
                                                <div class="tit">사용기한</div>
                                                <div class="desc">제품 박스를 참고하세요.</div>
                                            </div>
                                        </li>
                                        <%--<li class="btn_list g_q_product_popup_apply">
                                        	<div>
                                                <input hidden id="request_product_info_idx" val="">
                                        		<button type="button" id="btn_request_product_info">제품 정보 신청하기</button>
                                        	</div>
                                        </li>--%>
                                        <li class="btn_list g_q_product_popup_cancel">
                                        	<div>
                                        		<button type="button" onclick="openLayerPop('cancel_info');">배송/반품/교환 안내</button>
                                        	</div>
                                        </li>
                                        <li class="btn_list g_q_product_popup_chat">
                                        	<div>
                                        		<button type="button" onclick="onChatTalk();">재료 전문가와 채팅상담하기</button>
                                        	</div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button type="button" class="btn_blue g_q_product_popup_ok" onclick="closeLayerPop(this);">확인</button>
                </div>
            </div>
        </div>



        <!-- 주문하기 팝업 -->
        <div class="order_pop order_payment_pop layer_pop">
            <div class="bg_area" onclick=""></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button type="button" class="btn_close" id="btn_order_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                            <div class="title">주문결제</div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                            <div class="row">
                                <div class="order_prd_wrap">
                                    <div class="order_prd">
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title" id="order_product_info_cnt">주문제품(<span></span>)</div>
                                                <div class="util">
                                                    <div id="order_total_price" class="txt"></div>
                                                </div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_list">
                                                    <ul>
                                                        <li>
                                                            <div>
                                                                <div class="txt">
                                                                    <div class="bd">
                                                                        <div class="sub">
                                                                            <ul id="order_product_info_list" class="g_q_o_pop_b_product">
<%--                                                                                <li>--%>
<%--                                                                                    <div>--%>
<%--                                                                                        <div class="row">--%>
<%--                                                                                            <div class="title">제품명</div>--%>
<%--                                                                                            <div class="stock">2개</div>--%>
<%--                                                                                        </div>--%>
<%--                                                                                        <div class="row">--%>
<%--                                                                                            <div class="stand">제품규격</div>--%>
<%--                                                                                            <div class="price">24,000원</div>--%>
<%--                                                                                        </div>--%>
<%--                                                                                        <div class="row">--%>
<%--                                                                                            <div class="manu">제조사 / 포장단위</div>--%>
<%--                                                                                        </div>--%>
<%--                                                                                    </div>--%>
<%--                                                                                </li>--%>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="order_info_wrap order_payment_wrap">
                                    <div class="order_info">
                                        <%-- <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">주문자</div>
                                               <!--<div class="util">
                                                   <div class="button">
                                                       <button type="button" class="btn_modify" ></button>
                                                   </div>
                                               </div>-->
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic g_q_o_pop_b_user" id="order_member_info">
                                                    <dl>
                                                        <dt>
                                                            <div class="text">받는분</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_member_name">${member_info.fd_member_name_desc}</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">휴대폰</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_member_mobile_number">
                                                                <c:choose>
                                                                    <c:when test="${member_info.fd_tel_nomal_desc.length() == 8}">
                                                                        ${fn:substring(member_info.fd_tel_nomal_desc, 0, 4)}-${fn:substring(member_info.fd_tel_nomal_desc, 4, 8)}
                                                                    </c:when>
                                                                    <c:when test="${member_info.fd_tel_nomal_desc.length() == 9}">
                                                                        ${fn:substring(member_info.fd_tel_nomal_desc, 0, 2)}-${fn:substring(member_info.fd_tel_nomal_desc, 2, 5)}-${fn:substring(member_info.fd_tel_nomal_desc, 5, 9)}
                                                                    </c:when>
                                                                    <c:when test="${member_info.fd_tel_nomal_desc.length() == 10 && fn:startsWith(member_info.fd_tel_nomal_desc, '02')}">
                                                                        ${fn:substring(member_info.fd_tel_nomal_desc, 0, 2)}-${fn:substring(member_info.fd_tel_nomal_desc, 2, 6)}-${fn:substring(member_info.fd_tel_nomal_desc, 6, 10)}
                                                                    </c:when>
                                                                    <c:when test="${member_info.fd_tel_nomal_desc.length() == 10}">
                                                                        ${fn:substring(member_info.fd_tel_nomal_desc, 0, 3)}-${fn:substring(member_info.fd_tel_nomal_desc, 3, 6)}-${fn:substring(member_info.fd_tel_nomal_desc, 6, 10)}
                                                                    </c:when>
                                                                    <c:when test="${member_info.fd_tel_nomal_desc.length() == 11}">
                                                                        ${fn:substring(member_info.fd_tel_nomal_desc, 0, 3)}-${fn:substring(member_info.fd_tel_nomal_desc, 3, 7)}-${fn:substring(member_info.fd_tel_nomal_desc, 7, 11)}
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        ${member_info.fd_tel_nomal_desc}
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">이메일</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_member_email">${member_info.fd_email_info_desc}</div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div> --%>
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">배송정보</div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic g_q_o_pop_b_order">
                                                    <dl>
                                                        <dt>
                                                            <div class="text">배송지</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">${member_info.fd_addr_desc}</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">상세정보</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">${member_info.fd_addr_detail_desc} (${member_info.fd_addr_post_desc}) / ${member_info.fd_medical_name}</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">배송요청사항</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="row">
                                                                <div class="comment_wrap">
                                                                    <input id="order_ship_req" type="text" class="inp_basic g_q_o_pop_b_order_req" placeholder="배송요청사항을 직접 입력합니다.">
                                                                    <div class="comment">
                                                                        <ul>
                                                                            <li>
                                                                                <a href="javascript:;">배송 전 연락 부탁드립니다.</a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="javascript:;">부재시 경비실에 맡겨주세요.</a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="javascript:;">부재시 전화 주시거나 문자 남겨주세요.</a>
                                                                            </li>
                                                                            <li>
                                                                                <a href="javascript:;">안전한 배송 부탁드립니다.</a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">쿠폰/포인트 적용</div>
                                                <div class="util">
                                                    <div class="info">
                                                        쿠폰/포인트 사용 안내 <a href="javascript:;">?<span class="info_box">할인쿠폰과 포인트 중 하나의 혜택만 사용하실 수있습니다.</span></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic">
                                                    <dl>
                                                        <dt>
                                                            <div class="text">쿠폰적용</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="row">
                                                                <select name="" class="sel_basic g_q_o_pop_b_coupon" id="order_coupon_list">
                                                                    <option value="">사용가능한 쿠폰이 없습니다.</option>
                                                                </select>
<%--                                                                <select name="" class="sel_basic" id="order_delivery_coupon_list">--%>
<%--                                                                    <option value="">사용가능한 쿠폰이 없습니다.</option>--%>
<%--                                                                </select>--%>
                                                            </div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">포인트적용</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="row">
                                                                <input type="text" class="inp_basic g_q_o_pop_b_point" id="order_point_info_input" autocomplete="off" placeholder="0" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" /><button type="button" class="btn_basic g_q_o_pop_b_point_all_btn">모두사용</button>
                                                            </div>
                                                            <div class="subdesc">
                                                                <div class="text">현재 포인트 : <span class="color_red" id="order_point_info_text">0</span> 원</div>
                                                                <ul>
                                                                    <li>
                                                                        <div>- 최대 사용 가능 포인트 : <span class="color_red" id="total_max_use_point"></span> 원</div>
                                                                    </li>
                                                                    <li>
                                                                        <div>- 보유 포인트 1천원 이상부터 사용가능</div>
                                                                    </li>
                                                                    <li>
                                                                        <div>- 모든 제품의 총 주문 금액 5% 까지 사용가능</div>
                                                                    </li>
                                                                    <%--<li>
                                                                        <div>- 적립금 내역 : 내 계정 > 포인트 쿠폰</div>
                                                                    </li>--%>
                                                                </ul>
                                                            </div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">포인트/캐쉬백 적립</div>
                                                <div class="util">
                                                    <div class="info">
                                                        포인트 적립 안내 <a href="javascript:;">?<span class="info_box">OK캐쉬백 적립시 메디밸류 포인트 적립은 불가합니다.</span></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic order_small g_q_o_pop_b_tax">
                                                    <div class="comm_tab_wrap">
	                                                    <ul class="radio_wrap point_radio_wrap flex_start radio_button_wrap">
                                                            <li>
                                                                <label class="label_radio">
                                                                    <input type="radio" name="rdo_point" id="m_point" value="" checked="checked"><span>포인트 적립</span>
                                                                </label>
                                                            </li>
                                                            <li>
                                                                <label class="label_radio">
                                                                    <input type="radio" name="rdo_point" id="ocb_point" value=""><span>OK캐쉬백 적립</span>
                                                                </label>
                                                            </li>
	                                                        <%--
                                                            <c:if test="${ocb_yn eq 'Y' || ocb_test_yn eq 'Y'}">
	                                                        <label class="label_radio">
	                                                            <input type="radio" name="rdo_point" id="ocb_point" value=""><span>OK캐쉬백 적립</span>
	                                                        </label>
                                                            </c:if>
                                                             --%>
	                                                    </ul>
	                                                    <div class="point_detail_wrap radio_detail_wrap">
	                                                    	<ul>
	                                                    		<li class=""><div><div class="subdesc">포인트 적립 : 2%, OK캐쉬백 적립 : 1%</div></div></li>
	                                                    		<li class="">
	                                                    			<div>
	                                                    				<dl>
	                                                    					<dt>
	                                                    						<div class="text">카드번호</div>
	                                                    					</dt>
	                                                    					<dd>
                                                                                <input hidden id="current_ocb_card_info" value=""/>
	                                                    						<div class="row" id="ocb_card_info">
	                                                    							<input type="text" class="inp_basic div_4 ocb_card_number" />
                                                                                    <input type="password" class="inp_basic div_4 ocb_card_number" />
                                                                                    <input type="password" class="inp_basic div_4 ocb_card_number" />
                                                                                    <input type="text" class="inp_basic div_4 ocb_card_number" />

                                                                                    <button type="button" id="ocb_info_save" class="btn_basic btn_tooltip">
                                                                                        번호저장<span class="box_tooltip">카드번호 저장하여 다음에 사용합니다.</span>
                                                                                    </button>
	                                                    						</div>
	                                                    					</dd>
	                                                    				</dl>
	                                                    				<div class="check_2_wrap">
					                                                        <label class="label_check_2">
					                                                            <input type="checkbox" id="ocb_agreement"><span>적립 진행 필수 동의 / 개인정보 수집 및 이용동의 외 (필수)</span>
					                                                        </label>
					                                                        <a href="javascript:;" class="btn_terms" onclick="openLayerPop('point_terms');">상세보기</a>
					                                                    </div>
					                                                    <div class="subdesc">
					                                                    	<ul>
					                                                    		<li>
					                                                    			<div>- 카드번호가 잘못 입력되거나 유효하지 않은 경우 OK캐쉬백 적립이 되지 않습니다.</div>
					                                                    		</li>
					                                                    		<li>
					                                                    			<div>- 배송완료 7일 이후 OK캐쉬백에 적립예정포인트로 적립되며, 최종 적립 시점은 OK캐쉬백 정책에 따릅니다. (<a href="https://www.medivalue.co.kr/ocb/point/list" target="_blank">https://www.medivalue.co.kr/ocb/point/list</a>)</div>
					                                                    		</li>
					                                                    		<li>
					                                                    			<div>- 쿠폰, 포인트 등 각종 할인금액 및 배송비를 제외한 실제 결제금액의 1%(고객 수수료 제외)가 적립됩니다.</div>
					                                                    		</li>
					                                                    		<li>
					                                                    			<div>- 주문취소, 반품 등으로 실결제금액이 변경 됨에 따라 적립금액이 변동 될 수 있습니다.</div>
					                                                    		</li>
					                                                    	</ul>
					                                                    </div>
	                                                    			</div>
	                                                    		</li>
	                                                    	</ul>
	                                                    </div>
                                                    </div>
                                                    
                                                    
                                                    
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">세금계산서 정보</div>
                                                <div class="util">
                                                    <div class="button">
                                                        <button type="button" class="btn_modify g_q_o_pop_b_tax_modify" id="btn_modify_tax_info">수정하기</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic order_small g_q_o_pop_b_tax">
                                                    <div class="radio_wrap flex_start" id="order_invoice">
                                                        <label class="label_radio g_q_o_pop_b_tax_apply_y">
                                                            <input type="radio" name="rdo_invoice" id="rdo_invoice_Y" value="Y" checked="checked"><span>신청</span>
                                                        </label>
                                                        <label class="label_radio g_q_o_pop_b_tax_apply_n">
                                                            <input type="radio" name="rdo_invoice" id="rdo_invoice_N" value="N"><span>미신청</span>
                                                        </label>
                                                    </div>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">사업자번호</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="corporate_registration_number_order_info_text">${member_info.fd_corporate_registration_number_desc}</div>
                                                            <input class="inp_basic" name="fd_corporate_registration_number" type="text" hidden id="corporate_registration_number_order_info_input">
                                                        </dd>
                                                        <dt>
                                                            <div class="text">대표자명</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="corporate_representative_name_info_text">${member_info.fd_corporate_representative_name_desc}</div>
                                                            <input class="inp_basic" name="fd_corporate_representative_name" type="text" hidden id="corporate_representative_name_info_input">
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">회사명</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="corporate_registration_name_info_text">${member_info.fd_corporate_registration_name_desc}</div>
                                                            <input class="inp_basic" name="fd_corporate_registration_name" type="text" hidden id="corporate_registration_name_info_input">
                                                        </dd>
                                                    </dl>
                                                    <%--<dl>
                                                        <dt>
                                                            <div class="text">업태</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="corporate_business_conditions_info_text">${member_info.fd_corporate_business_conditions_desc}</div>
                                                            <input class="inp_basic" name="fd_corporate_business_conditions" type="text" hidden id="corporate_business_conditions_info_input">
                                                        </dd>
                                                        <dt>
                                                            <div class="text">종목</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="corporate_industry_type_info_text">${member_info.fd_corporate_industry_type_desc}</div>
                                                            <input class="inp_basic" name="fd_corporate_industry_type" type="text" hidden id="corporate_industry_type_info_input">
                                                        </dd>
                                                    </dl>--%>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">이메일</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="fd_email_info_text">${member_info.fd_email_info_desc}</div>
                                                            <input class="inp_basic" name="fd_email_info" type="text" hidden id="fd_email_info_input">
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="order_info">
                                    	<div class="order_box">
                                            <div class="order_head">
                                                <div class="title">결제금액</div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic order_bg_box g_q_o_pop_b_payment_area" id="order_payment_info">
                                                    <dl>
                                                        <dt>
                                                            <div class="text">제품금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_total_product_price"></div>
                                                        </dd>
                                                    </dl>
<%--                                                    <dl class="sub">--%>
<%--                                                        <dt>--%>
<%--                                                            <div class="text">└ 상품금액</div>--%>
<%--                                                        </dt>--%>
<%--                                                        <dd>--%>
<%--                                                            <div class="text" id="order_product_price"></div>--%>
<%--                                                        </dd>--%>
<%--                                                    </dl>--%>
<%--                                                    <dl class="sub">--%>
<%--                                                        <dt>--%>
<%--                                                            <div class="text">└ 상품할인금액</div>--%>
<%--                                                        </dt>--%>
<%--                                                        <dd>--%>
<%--                                                            <div class="text">0원</div>--%>
<%--                                                        </dd>--%>
<%--                                                    </dl>--%>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">배송비</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_delivery_fee"></div>
                                                        </dd>
                                                    </dl>
                                                    
                                                    <%-- 20230216 추가할인금액 추가 --%>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">추가할인금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text color_red" id="order_add_discount_amount">0원</div>
                                                        </dd>
                                                    </dl>
                                                    
                                                    <dl>
                                                        <dt>
                                                            <div class="text">쿠폰할인금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text color_red" id="order_coupon_info">0원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">포인트사용</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text color_red" id="order_point_info">0원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl class="total">
                                                        <dt>
                                                            <div class="text">최종결제금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_final_total_product_payment"></div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="order_box">    
                                        	<div class="paymentMethodDiv">
	                                        	<div class="order_head">
	                                                <div class="title">결제방식</div>
	                                            </div>
	                                             <div class="order_body">
                                                     <div class="order_basic">
                                                        <div class="radio_wrap payment_radio_wrap flex_start">
                                                             <label class="label_radio">
                                                                 <input type="radio" name="payment_method" id="deferred_pay" value="deferred_pay"><span>후불</span>
                                                             </label>
                                                             <label class="label_radio">
                                                                 <input type="radio" name="payment_method" id="advance_pay" value="advance_pay"><span>선불</span>
                                                             </label>
                                                        </div>
                                                     </div>
	                                             </div>
                                            </div>
                                            <div class="paymentTypeDiv">
	                                            <div class="order_head">
	                                                <div class="title">결제수단</div>
                                                    <div class="util"><div class="tx_add_noti" style="color: #F37C0A;">메디캐시 결제시 두배 적립</div></div>
	                                            </div>
	                                            <div class="order_body">
	                                                <div class="order_basic">
	                                                    <div class="radio_wrap payment_radio_wrap flex_start">
                                                            <label class="label_radio">
																<input type="radio" name="rdo_payment" value="medicash" ><span>메디캐시</span>
                                                            </label>
                                                            <label class="label_radio">
                                                                <input type="radio" name="rdo_payment" value="medipay" ><span>간편결제</span>
                                                            </label>
	                                                        <label class="label_radio g_q_o_pop_b_payment_bank">
	                                                            <input type="radio" name="rdo_payment" value="transfer"><span>계좌이체</span>
	                                                        </label>
	                                                        <label class="label_radio g_q_o_pop_b_payment_card">
	                                                            <input type="radio" name="rdo_payment" value="toss_payments"><span>신용카드</span>
	                                                        </label>
	                                                        <label class="label_radio g_q_o_pop_b_payment_mybnak">
	                                                            <input type="radio" name="rdo_payment" value="settle_bank_mytongjang"><span>내통장결제</span>
	                                                        </label>
	                                                    </div>
	                                                    <div class="payment_detail_wrap g_q_o_pop_b_payment_info">
                                                            <input type="hidden" name="payment_type" id="payment_type" value="${payment_type}"/>
                                                            <input type="hidden" name="payment_repeat" id="payment_repeat" value="${payment_repeat}"/>
	                                                    	<ul>
                                                                <li class="payment_detail_medicash">
                                                                    <div>
                                                                        <dl>
                                                                            <dt>
                                                                                <div class="text">보유메디캐시</div>
                                                                            </dt>
                                                                            <dd>
                                                                                <div class="row flex_end">
                                                                                    <div class="text word_keep">
                                                                                        <span class="color_orange" id="user_medicash_info" data-user-medicash="<c:if test="${empty m_cash}">0</c:if><c:if test="${!empty m_cash}">${m_cash.fd_total_amount}</c:if>"><c:if test="${empty m_cash}">0</c:if><c:if test="${!empty m_cash}"><fmt:formatNumber value="${m_cash.fd_total_amount}" pattern="#,###" /></c:if></span> 원
                                                                                    </div>
                                                                                    <button type="button" class="btn_basic" id="btn_move_medicash_charge">충전하기</button>
                                                                                    <button type="button" class="btn_basic" id="btn_reset_medicash_charge">새로고침</button>
                                                                                </div>
                                                                            </dd>
                                                                        </dl>
                                                                        <dl>
                                                                            <dt>
                                                                                <div class="text">메디캐시사용</div>
                                                                            </dt>
                                                                            <dd>
                                                                                <div class="row">
                                                                                    <input type="text" class="inp_basic" id="medicash_use_amount" name="medicash_use_amount" value="0" min="0" autocomplete="off" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/\B(?=(\d{3})+(?!\d))/g, ',')"/>
                                                                                    <button type="button" class="btn_basic" id="btn_use_all_medicash">모두사용</button>
                                                                                </div>
                                                                            </dd>
                                                                        </dl>
                                                                    </div>
                                                                    <div class="payment_tip">
                                                                        메디캐시를 이용해 보세요.<br />
                                                                        편리하게 미리 충전하고 추가 혜택까지 받을 수 있어요.
                                                                        <label class="label_check_2 input_checkbox_payment_repeat">
                                                                            <input type="checkbox" id="payment_repeat" name="payment_repeat" value="Y" <c:if test="${payment_type eq 'medicash' and  payment_repeat eq 'Y'}">checked="checked"</c:if>/><span>다음에도 이 결제수단을 사용합니다.</span>
                                                                        </label>
                                                                    </div>
                                                                </li>
                                                                <li class="payment_detail_medipay">
                                                                    <div class="payment_tip">
                                                                        간편결제를 이용해 보세요.<br />
                                                                        카드와 계좌를 미리 등록하고 간편하게 결제해요.
                                                                        <label class="label_check_2 input_checkbox_payment_repeat">
                                                                            <input type="checkbox" id="payment_repeat_medipay" name="payment_repeat_medipay" value="Y" <c:if test="${payment_type eq 'medipay' and  payment_repeat eq 'Y' }">checked="checked"</c:if>/><span>다음에도 이 결제수단을 사용합니다.</span>
                                                                        </label>
                                                                    </div>
                                                                </li>
	                                                    		<li class="payment_detail_transfer">
	                                                    			<div>
	                                                    				<dl>
	                                                    					<dt><div class="text">예금주</div></dt>
	                                                    					<dd><div class="text">메디밸류</div></dd>
	                                                    				</dl>
	                                                    				<dl>
	                                                    					<dt><div class="text">입금계좌</div></dt>
	                                                    					<dd>
	                                                    						<div class="clipboard_wrap">
				                                                                    <div class="txt_clip">하나은행</div>
				                                                                    <input type="text" class="inp_basic inp_clip" value="547-910035-44104" readonly>
				                                                                </div>
				                                                                <button type="button" class="btn_basic btn_clip g_q_o_pop_b_payment_copy" onclick="copyClipBoard(this);">복사하기</button>
	                                                    					</dd>
	                                                    				</dl>
	                                                    			</div>
	                                                    		</li>
                                                                <li class="payment_detail_toss_payments"></li>
                                                                <li class="payment_detail_settle_bank_mytongjang"></li>
	                                                    	</ul>
	                                                    </div>
	                                                </div>
	                                            </div>
                                            </div>
                                        </div>
                                        
                                        <div class="order_box">
                                        	<div class="paymentTypeDiv">
                                            <div class="order_head">
                                                <div class="title">개인정보 수집/제공</div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic">
                                                    <div class="check_2_wrap">
                                                        <label class="label_check_2 g_q_o_pop_b_user_agree_check">
                                                            <input type="checkbox" id="order_payment"><span>결제 진행 필수 동의</span>
                                                        </label>
                                                    </div>
                                                    <div class="terms_wrap">
                                                        <ul>
                                                            <li>
                                                                <div>
                                                                    <div class="txt">개인정보 수집 이용 및 위탁 동의 (필수)</div>
                                                                    <a href="javascript:;" class="btn_terms g_q_o_pop_b_user_agree_view_1" onclick="openLayerPop('personal_terms');">약관보기</a>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div>
                                                                    <div class="txt">결제대행 서비스 약관 동의 (필수)</div>
                                                                    <a href="javascript:;" class="btn_terms g_q_o_pop_b_user_agree_view_2" onclick="openLayerPop('service_terms');">약관보기</a>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="agree_desc">
                                                    	위 주문 내용을 확인 하였으며, 회원 본인은 결제에 동의합니다.
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="order_info_wrap order_complete_wrap">
                                    <div class="order_info">
                                    	<div class="order_box" id="order_result_delivery_info">
                                            <div class="order_head">
                                                <div class="title">배송정보</div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic g_q_o_pop_a_delivery">
                                                	<dl>
                                                        <dt>
                                                            <div class="text">주문번호</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_result_delivery_info_order_id"></div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">도착예정일</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="estimate_delivery_day"></div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">판매업체</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">메디밸류</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">배송정보</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">자체배송</div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_box" id="order_result_addr_info">
                                            <div class="order_head">
                                                <div class="title">받는사람 정보</div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic g_q_o_pop_a_receive">
                                                    <dl>
                                                        <dt>
                                                            <div class="text">받는사람</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_result_addr_info_name"></div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">받는주소</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text ellipsis_off" id="order_result_addr_info_detail"></div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">연락처</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_result_addr_info_tel_info"></div>
                                                        </dd>
                                                    </dl>
<%--                                                    <dl>--%>
<%--                                                        <dt>--%>
<%--                                                            <div class="text">배송요청사항</div>--%>
<%--                                                        </dt>--%>
<%--                                                        <dd>--%>
<%--                                                            <div class="text">직접 받고 부재 시 문 앞</div>--%>
<%--                                                        </dd>--%>
<%--                                                    </dl>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">세금계산서 정보</div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic order_small g_q_o_pop_a_tax">
                                                    <div class="radio_wrap flex_start" id="order_result_invoice">
                                                        <label class="label_radio">
                                                            <input checked="checked" type="radio" name="rdo_invoice_result" id="rdo_result_invoice_Y" onclick="return false;"><span>신청</span>
                                                        </label>
                                                        <label class="label_radio">
                                                            <input type="radio" name="rdo_invoice_result" id="rdo_result_invoice_N" onclick="return false;"><span>미신청</span>
                                                        </label>
                                                    </div>
                                                    <dl id="order_result_invoice_1">
                                                        <dt>
                                                            <div class="text">사업자번호</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_result_corporate_registration_number"></div>
                                                        </dd>
                                                        <dt>
                                                            <div class="text">대표자명</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_result_corporate_representative_name"></div>
                                                        </dd>
                                                    </dl>
                                                    <dl id="order_result_invoice_2">
                                                        <dt>
                                                            <div class="text">회사명</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_result_corporate_registration_name"></div>
                                                        </dd>
                                                    </dl>
                                                    <dl id="order_result_invoice_3">
                                                        <dt>
                                                            <div class="text">업태</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_result_corporate_business_conditions"></div>
                                                        </dd>
                                                        <dt>
                                                            <div class="text">종목</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_result_corporate_industry_type"></div>
                                                        </dd>
                                                    </dl>
                                                    <dl id="order_result_invoice_4">
                                                        <dt>
                                                            <div class="text">이메일</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_result_email_info"></div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="order_info" id="order_result_payment_info">
                                    	<div class="order_box" id="order_result_payment_transfer_info">
                                            <div class="order_head">
                                                <div class="title">결제정보</div>
                                                <div class="util">
                                                    <div class="info">입금일은 주문일로 부터 3일</div>
                                                </div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic g_q_o_pop_a_payment_info_area">
                                                    <dl>
                                                        <dt>
                                                            <div class="text">입금기한</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="deposit_limit_date"></div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">입금금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_result_payment_info_amount"></div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">입금계좌</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="clipboard_wrap">
                                                                <div class="txt_clip">하나은행</div>
                                                                <input type="text" class="inp_basic inp_clip" value="547-910035-44104" readonly>
                                                            </div>
                                                            <button type="button" class="btn_basic btn_clip g_q_o_pop_a_payment_info_copy" onclick="copyClipBoard(this);">복사하기</button>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">예금주</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text">메디밸류</div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_box">
                                            <div class="order_head">
                                                <div class="title">결제금액</div>
                                            </div>
                                            <div class="order_body">
                                                <div class="order_basic order_bg_box g_q_o_pop_a_payment_area">
<%--                                                	<div class="info_wrap saving">--%>
                                                	<div id="order_result_info_text" class="info_wrap">
                                                		<div class="info saving">
                                                			<div class="title">빠른주문하기를 통해<br><span id="order_result_info_saving" class="color_orange">19,000원</span>을 절약했어요.</div>
                                                			<!-- <div class="calc">
	                                                			<dl>
	                                                				<dt><div class="text">└ 최고 금액 대비</div></dt>
	                                                				<dd><div class="text color_orange">- <span class="num">19,000</span>원</div></dd>
	                                                			</dl>
	                                                			<dl>
	                                                				<dt><div class="text">└ 제품 할인 금액</div></dt>
	                                                				<dd><div class="text"><span class="num">0</span>원</div></dd>
	                                                			</dl>
                                                			</div> -->
                                                		</div>
                                                		<div class="info">
                                                			<div class="title">메디밸류를<br>이용해주셔서 감사합니다 :)</div>
                                                		</div>
                                                	</div>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">결제수단</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_result_payment_info_payment_name"></div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">제품금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_result_payment_info_product"></div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">배송비</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text" id="order_result_payment_info_delivery_fee"></div>
                                                        </dd>
                                                    </dl>
                                                    
                                                    <%-- 20230216 추가할인금액 추가 --%>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">추가할인금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text color_orange" id="order_result_payment_info_discount_amount">0원</div>
                                                        </dd>
                                                    </dl>
                                                    
                                                    <dl>
                                                        <dt>
                                                            <div class="text">쿠폰할인금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text color_orange" id="order_result_coupon_info">0원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl>
                                                        <dt>
                                                            <div class="text">적립금사용</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text color_orange" id="order_result_point_info">0원</div>
                                                        </dd>
                                                    </dl>
                                                    <dl class="total">
                                                        <dt>
                                                            <div class="text">총금액</div>
                                                        </dt>
                                                        <dd>
                                                            <div class="text color_blue" id="order_result_payment_info_total"></div>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap btn_payment_wrap">
                    <button type="button" class="btn_disable g_q_o_pop_b_close" onclick="closeLayerPop(this);">닫기</button>
                    <button type="button" class="btn_blue btn_payment g_q_o_pop_b_payment_req" onclick="payForIt(this);">결제하기</button>
                </div>
                <div class="btn_wrap btn_complete_wrap">
                    <button type="button" class="btn_disable g_q_o_pop_a_deatil" id="btn_order_detail" onclick="">주문상세보기</button>
                    <button type="button" class="btn_blue g_q_o_pop_a_continue" id="btn_order_continue" onclick="closeLayerPop(this);">주문계속하기</button>
                </div>
            </div>
        </div>
        <!-- 개인정보수집 약관 팝업 -->
        <div class="terms_pop personal_terms_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                            <div class="title">개인정보 수집 이용 및 위탁 동의</div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                            <div class="col">
                                <div class="terms_txt" id="TE0002">
<%--                                    <p>개인정보처리방침</p>--%>
<%--                                    <p>&lt;(주)메디밸류&gt;('http://www.medivalue.co.kr'이하 '회사')은(는) 「개인정보 보호법」 제30조에 따라 정부주체의--%>
<%--                                        개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립 · 공개합니다.○ 이--%>
<%--                                        개인정보처리방침은 2021년 6월 1부터 적용됩니다.</p>--%>
<%--                                    <h5>제1조(개인정보의 처리 목적)</h5>--%>
<%--                                    <p>회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 겨우에는--%>
<%--                                        법률에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.1. 회원가입 및 관리<br>회원 가입의사 확인, 회원제 서비스 제공에 따른 본인--%>
<%--                                        식별 · 인증, 회원자격 유지 · 관리, 서비스 부정이용 방지, 비인가 사용방지 및 서비스 제공 및 계약의 이행, 각종 고지 · 통지, 서비스 이용 및--%>
<%--                                        상담, 문의 등 원활한 의사소통 경로 확보, 맞춤형 회원 서비스 제공, 거점 기반 서비스 제공, 고충처리 목적 등으로 개인정보를 처리합니다.<br>2.--%>
<%--                                        재화 또는 서비스 제공<br>물품배송, 서비스 제공, 계약서 · 청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 요금결제 · 정산을 목적으로--%>
<%--                                        개인정보를 처리합니다.<br>3. 마케팅 및 광고에의 활용신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회--%>
<%--                                        제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로--%>
<%--                                        개인정보를 처리합니다.</p>--%>
<%--                                    <h5>제2조(개인정보의 처리 및 보유 기간)</h5>--%>
<%--                                    <p>1. 회사는 법령에 따른 개인정보 보유 · 이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유 · 이용기간 내에서 개인정보를 처리--%>
<%--                                        · 보유합니다.<br>2. 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br>①홈페이지 회원가입 및 관리: 회원 탈퇴 시까지<br>다만,--%>
<%--                                        다음의 사유에 해당하는 경우에는 해당 사유 종료시까지<br>-관계 법령 위반에 따른 수사조사 등이 진행 중인 경우에는 해당 수사조사 종료--%>
<%--                                        시까지<br>-홈페이지 이용에 따른 채권 채무관계 잔존 시에는 해당 채권 채무관계 정산시까지<br>②재화 또는 서비스 제공: 재화·서비스 공급완료 및--%>
<%--                                        요금결제·정산 완료시까지<br>다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료 시까지<br>-『전자상거래 등에서 소비자 보호에 관한--%>
<%--                                        법률』<br>①계약 또는 청약철회 등에 관한 기록: 5년<br>②대금결제 및 재화 등의 공급에 관한 기록: 5년<br>③소비자의 불만 또는 분쟁처리에--%>
<%--                                        관한 기록: 3년<br>④표시·광고에 관한 기록: 6개월<br>-『정보통신 이용촉진 및 정보보호 등에 관한 법률』<br>본인 확인에 대한 기록:--%>
<%--                                        6개월<br>- 『통신비밀보호법』<br>인터넷 로그기록자료, 접속지 추적자료: 3개월</p>--%>
<%--                                    <h5>제3조(개인정보의 제3자 제공)</h5>--%>
<%--                                    <p>1. 회사는 인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」--%>
<%--                                        제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.<br>2.단, 원활한 서비스 제공을 위해 상품 구매 시 서비스 제공 업체로--%>
<%--                                        이용자의 개인정보를 제3자 제공에 동의하는 경우에는 서비스 제공 및 배송, 본인확인 등을 위하여 필요한 최소한의 개인정보만을 서비스 제공 업체에게--%>
<%--                                        제공합니다.<br>판매업체<br>-개인정보를 제공받는 자 : 판매업체<br>-제공받는 자의 개인정보 이용목적 : 서비스 제공 및 배송<br>-제공하는--%>
<%--                                        개인정보 항목: 로그인ID, 성명, 주소, 전화번호, 메일주소, 구매상품정보, 의료기관명, 의료기관전화번호, 은행계좌정보<br>-제공받는 자의--%>
<%--                                        보유.이용기간: 구매완료일로부터 5년</p>--%>
<%--                                    <h5>제4조(개인정보처리 위탁)</h5>--%>
<%--                                    <p>1. 회사는 활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br>-결제 서비스<br>-위탁받는 자 (수탁자) :--%>
<%--                                        토스페이먼트(주)<br>-위탁하는 업무의 내용 : 구매 및 요금 결제<br>2. 회사는 위탁계약 체결시 「개인정보 보호법」 제26조에 따라 위탁업무--%>
<%--                                        수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에--%>
<%--                                        명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.<br>3. 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보--%>
<%--                                        처리방침을 통하여 공개하도록 하겠습니다.<br>제5조(정보주체와 법정대리인의 권리·의무 및 그 행사방법)<br>1. 정보주체는 회사에 대해 언제든지--%>
<%--                                        개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.<br>2. 1항에 따른 권리 행사는 회사에 대해 「개인정보 보호법」 시행령--%>
<%--                                        제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 회사는 이에 대해 지체 없이 조치하겠습니다.<br>3.제1항에--%>
<%--                                        따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한--%>
<%--                                        고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.<br>4.개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조--%>
<%--                                        제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.<br>5.개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집--%>
<%--                                        대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.<br>6.회사는 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구--%>
<%--                                        시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.<br>제6조(처리하는 개인정보의 항목 작성)<br>1. 회사는 다음의 개인정보--%>
<%--                                        항목을 처리하고 있습니다.<br>-홈페이지 회원 가입 및 관리<br>필수항목 : 로그인ID, 이름, 면허번호, 의료기관명, 생년월일, 이메일, 주소,--%>
<%--                                        전화번호, 휴대폰, 요양기관기호 및 명칭, 담당자명<br>선택항목 : 추천인<br>-재화 또는 서비스 제공<br>필수항목 : 로그인ID, 이름,--%>
<%--                                        면허번호, 의료기관명, 생년월일, 이메일, 주소, 전화번호, 휴대폰, 상호, 사업자번호 및 사업자등록정보, 사업자 주소, 은행계좌정보, 요양기관기호 및--%>
<%--                                        명칭, 담당자명<br>선택항목 : 추천인<br>-회사의 서비스 이용과정에서 IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 블랑 이용기록,--%>
<%--                                        모바일 기기정보(앱 버전, OS버전), ADID/IDFA(광고식별자)등의 정보가 자동으로 생성되어 수집될 수 있습니다.<br>-진행하는 이벤트에 따라--%>
<%--                                        수집항목이 상이할 수 있으므로 응모 시 별도 동의를 받으며, 목적 달성 즉시 파기합니다.<br></p>--%>
<%--                                    <h5>제7조(개인정보의 파기)</h5>--%>
<%--                                    <p>1.회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.<br>2.이용자로부터--%>
<%--                                        동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를--%>
<%--                                        별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다. 별도 보존되는 개인정보는 법률에 의한 경우가 아니고서는 보존목적 이외의 다른--%>
<%--                                        목적으로 이용되지 않습니다.<br>3.개인정보 파기의 절차 및 방법은 다음과 같습니다.<br>①파기절차<br>회사는 파기 사유가 발생한 개인정보를--%>
<%--                                        선정하고, 회사의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.<br>②파기방법<br>-회사는 전자적 파일 형태의 정보는 기록을 재생할 수--%>
<%--                                        없는 기술적 방법을 사용합니다.<br>-종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다</p>--%>
<%--                                    <h5>제8조(개인정보의 안전성 확보 조치)</h5>--%>
<%--                                    <p>회사는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.<br>1.관리적 조치: 내부관리계획 수립 시행, 정기적 직원 교육--%>
<%--                                        등<br>2.기술적 조치: 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정도 등의 암호화, 보안프로그램 설치등<br>3.물리적--%>
<%--                                        조치: 전산실, 자료보관실 등의 접근 통제</p>--%>
<%--                                    <h5>제9조(개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항)</h5>--%>
<%--                                    <p>1.(주)메디밸류 은(는) 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를--%>
<%--                                        사용합니다.<br>2.쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC--%>
<%--                                        컴퓨터내의 하드디스크에 저장되기도 합니다.<br>-쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기--%>
<%--                                        검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.<br>-쿠키의 설치•운영 및 거부 : 웹브라우저 상단의--%>
<%--                                        도구&gt;인터넷 옵션&gt;개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다. 다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에--%>
<%--                                        어려움이 발생할 수 있습니다.</p>--%>
<%--                                    <h5>제10조 (개인정보 보호책임자)</h5>--%>
<%--                                    <p>1. (주)메디밸류 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와--%>
<%--                                        같이 개인정보 보호책임자를 지정하고 있습니다.<br>-개인정보 보호책임자<br>•성명 :홍하석<br>•직책 :개발<br>•직급 :팀장<br>•연락처 :--%>
<%--                                        info@medivalue.co.kr,<br>-개인정보 보호 담당부서<br>•부서명 :개발팀<br>•담당자 :홍하석<br>•연락처 :--%>
<%--                                        info@medivalue.co.kr,<br>2.이용자께서는 회사의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제--%>
<%--                                        등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 회사는 사용자의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.<br>--%>
<%--                                    </p>--%>
<%--                                    <h5>제11조(개인정보 열람청구)</h5>--%>
<%--                                    <p>정보주체는 ｢개인정보 보호법｣ 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.<br>회사는 정보주체의 개인정보 열람청구가 신속하게--%>
<%--                                        처리되도록 노력하겠습니다.<br>-개인정보 열람청구 접수·처리 부서<br>•부서명 : 개발팀<br>•담당자 : 홍하석<br>•연락처 :--%>
<%--                                        info@medivalue.co.kr,</p>--%>
<%--                                    <h5>제12조(권익침해 구제방법)</h5>--%>
<%--                                    <p>사용자는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수--%>
<%--                                        있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다.<br>1. 개인정보분쟁조정위원회 : (국번없이)--%>
<%--                                        1833-6972 (www.kopico.go.kr)<br>2. 개인정보침해신고센터 : (국번없이) 118--%>
<%--                                        (privacy.kisa.or.kr)<br>3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr)<br>4. 경찰청 : (국번없이) 182--%>
<%--                                        (cyberbureau.police.go.kr)<br>「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의--%>
<%--                                        처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는--%>
<%--                                        바에 따라 행정심판을 청구할 수 있습니다.<br>※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr) 홈페이지를--%>
<%--                                        참고하시기 바랍니다.</p>--%>
<%--                                    <h5>제13조(개인정보 처리방침 변경)</h5>--%>
<%--                                    <p>본 개인정보 처리방침을 개정할 경우에는 최소 7일전에 홈페이지 또는 이메일을 통해 변경 및 내용 등을 공지하겠습니다. 다만 이용자의 소중한 권리 또는--%>
<%--                                        의무에 중요한 내용변경이 발생하는 경우 시행일로부터 최소 30일 전에 공지하도록 하겠습니다.<br>이 개인정보처리방침은 2021년 6월 1부터--%>
<%--                                        적용됩니다.</p>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button class="btn_blue" onclick="closeLayerPop(this);">확인</button>
                </div>
            </div>
        </div>

        <div class="terms_pop service_terms_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                            <div class="title">결제대행 서비스 약관 동의</div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                            <div class="col">
                                <div class="terms_txt" id="TE0004">
<%--                                    <p>구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</p>--%>
<%--                                    <h5>개인정보 수집·이용동의</h5>--%>
<%--                                    <p>수집 목적: 온라인 쇼핑 구매자에 대한 상품 배송<br>수집 항목: 결제정보, 의료기관명, 의료기관 전화번호, 수취인명, 휴대전화번호, 수취인주소<br>보유 기간: 업무 목적 달성 후 파기(단, 타 법령에 따라 법령에서 규정한 기간동안 보존)</p>--%>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button class="btn_blue" onclick="closeLayerPop(this);">확인</button>
                </div>
            </div>
        </div>
        
        <!-- 오케이 캐쉬백 약관 팝업 -->
        <div class="terms_pop point_terms_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                            <div class="title">OK캐쉬백 적립 약관 동의 (필수)</div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                            <div class="col">
                                <div class="terms_txt" id="">
                                    <h5>개인정보 수집·이용동의</h5>
                                    <table>
                                    	<colgroup>
                                    		<col style="width:33.3333%" >
                                    		<col style="width:33.3333%" >
                                    		<col style="width:33.3333%" >
                                    	</colgroup>
                                    	<thead>
                                    		<tr>
                                    			<th>이용목적</th>
                                    			<th>수집·이용 항목</th>
                                    			<th>보유기간</th>
                                    		</tr>
                                    	</thead>
                                    	<tbody>
                                    		<tr>
                                    			<td>OK캐쉬백 적립 신청시<br>카드번호 자동입력</td>
                                    			<td>OK캐쉬백<br>카드번호</td>
                                    			<td>회원탈퇴</td>
                                    		</tr>
                                    	</tbody>
                                    </table><br>
                                    <h5>개인정보 제3자 제공 동의</h5>
                                    <table>
                                    	<colgroup>
                                    		<col style="width:25%" >
                                    		<col style="width:25%" >
                                    		<col style="width:25%" >
                                    		<col style="width:25%" >
                                    	</colgroup>
                                    	<thead>
                                    		<tr>
                                    			<th>제공받는 자</th>
                                    			<th>제공하는 목적</th>
                                    			<th>제공하는 항목</th>
                                    			<th>보유기간</th>
                                    		</tr>
                                    	</thead>
                                    	<tbody>
                                    		<tr>
                                    			<td>SK플래닛㈜</td>
                                    			<td>OK캐쉬백 적립</td>
                                    			<td>OK캐쉬백<br>카드번호</td>
                                    			<td>회원탈퇴</td>
                                    		</tr>
                                    	</tbody>
                                    </table>
                                    <p class="info">고객님께서는 동의를 거부할 권리가 있으며, 동의 거부 시 OK캐쉬백 적립이 제한됩니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button class="btn_blue" onclick="closeLayerPop(this);">확인</button>
                </div>
            </div>
        </div>
        
        <!-- 취소 및 반품 안내 팝업 -->
        <div class="cancel_info_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                            <div class="title">배송/반품/교환 안내</div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                            <div class="col">
                            	<div class="tab_wrap div_3">
	                            	<div class="tab_list">
	                            		<ul>
	                            			<li class="on">
	                            				<div><button type="button">배송</button></div>
	                            			</li>
	                            			<li>
	                            				<div><button type="button">반품</button></div>
	                            			</li>
	                            			<li>
	                            				<div><button type="button">교환</button></div>
	                            			</li>
	                            		</ul>
	                            	</div>
	                            	<div class="tab_content">
	                            		<ul>
	                            			<li class="on">
	                            				<div>
	                            					<div class="table_wrap">
					                                    <table>
					                                    	<colgroup>
					                                    		<col style="width:95px" >
					                                    		<col style="" >
					                                    	</colgroup>
					                                    	<tbody>
					                                    		<tr>
					                                    			<th>배송비</th>
					                                    			<td>10만원 이상 구매 시 <span class="red">무료</span> 배송이며, 10만원 미만 구매 시 <b>3,000원의 배송료</b>가 부과됩니다.</td>
					                                    		</tr>
					                                    		<tr>
					                                    			<th>배송지역</th>
					                                    			<td>전국 (<span class="red">도서 및 산간 지역 추가 요금은 메디밸류에서 부담</span>합니다.)</td>
					                                    		</tr>
					                                    		<tr>
					                                    			<th>택배사</th>
					                                    			<td>로젠택배 (Tel. 1588-9988)</td>
					                                    		</tr>
					                                    		<tr>
					                                    			<th>배송 예정일</th>
					                                    			<td>오후 3시까지 입금확인된 주문 건에 대해 연휴, 공휴일 제외 2일 이내 발송됩니다. (택배사 사정으로 배송이 늦어질 수 있음)</td>
					                                    		</tr>
					                                    		<tr>
					                                    			<th>부분 배송제</th>
					                                    			<td>주문하신 상품의 신속한 배송을 위해 <b>일부 상품이 먼저 배송되는 부분 배송제</b>를 실시하고 있습니다. 상품은 수령하신 당일 즉시 개봉하여 거래명세서와 함께 확인해 주시기 바랍니다.</td>
					                                    		</tr>
					                                    	</tbody>
					                                    </table>
					                                </div>
	                            				</div>
	                            			</li>
	                            			<li>
	                            				<div>
	                            					<div class="table_wrap">
					                                    <table>
					                                    	<colgroup>
					                                    		<col style="width:95px" >
					                                    		<col style="" >
					                                    	</colgroup>
					                                    	<tbody>
					                                    		<tr>
					                                    			<th>기한</th>
					                                    			<td>제품 수령일로부터 15일 이내에 가능합니다.</td>
					                                    		</tr>
					                                    		<tr>
					                                    			<th>접수방법</th>
					                                    			<td>고객센터 (Tel. 02-779-6551) 및 채널톡으로 접수 가능합니다.</td>
					                                    		</tr>
					                                    		<tr>
					                                    			<th>비용</th>
					                                    			<td>상품의 하자, 오배송으로 인해 반품하시는 경우는 무료반품을 실시하고 있습니다. 단순변심, 오주문 등 <span class="red">고객님의 귀책사유로 인한 반품을 요청하시는 경우 고객님께 반품 비용이 청구</span>됩니다.<br>(무게나 부피에 따라 비용 책정되며, 반품 수거 택배 기사에게 지불)</td>
					                                    		</tr>
					                                    		<tr>
					                                    			<th>반품시 포장 유의사항</th>
					                                    			<td>타박스 및 배송된 박스로 별도 포장하여 주시기 바랍니다.<br>(<b>송장을 상품에 바로 붙여 포장이 훼손된 경우 반품이 불가</b>합니다.)</td>
					                                    		</tr>
					                                    		<tr>
					                                    			<th>불가사유</th>
					                                    			<td>고객님의 책임 있는 사유로 <b>상품과 상품 포장이 멸실 또는 훼손된 경우 반품이 불가</b>합니다. (택배 송장을 상품에 바로 붙여 상품가치가 훼손된 경우)<br><br>
					                                    			고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 반품이 불가합니다. (설치가 완료되어 상품의 가치가 훼손된 경우)<br><br>
					                                    			<b>시간이 경과되어 재판매가 곤란한 정도로 상품의 가치가 상실된 경우 반품이 불가</b>합니다.</td>
					                                    		</tr>
					                                    		<tr>
					                                    			<th>환불정보</th>
					                                    			<td>반송하신 <span class="red">상품이 입고되어야 환불 처리가 가능</span>합니다.<br><br>
					                                    			상품 입고 확인이 되면 5일 이내 송금이 되며, 환불 계좌번호가 정확하지 않을 시 환불 처리가 지연될 수 있습니다. 카드 결제 건의 경우 전체 취소 및 부분 취소가 가능하며, 입고 확인이 되면 5일 이내 취소 처리가 됩니다.</td>
					                                    		</tr>
					                                    	</tbody>
					                                    </table>
					                                </div>
	                            				</div>
	                            			</li>
	                            			<li>
	                            				<div>
	                            					<div class="table_wrap">
					                                    <table>
					                                    	<colgroup>
					                                    		<col style="width:95px" >
					                                    		<col style="" >
					                                    	</colgroup>
					                                    	<tbody>
					                                    		<tr>
					                                    			<th>교환</th>
					                                    			<td>상기 반품 조건에 따른 반품 후 재주문하셔야 합니다.</td>
					                                    		</tr>
					                                    	</tbody>
					                                    </table>
					                                </div>
	                            				</div>
	                            			</li>
	                            		</ul>
	                            	</div>
                            	</div>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button class="btn_blue" onclick="closeLayerPop(this);">확인</button>
                </div>
            </div>
        </div>
        
        <!-- 위시리스트 삭제 확인 팝업 -->
        <div class="wish_del_pop layer_pop">
            <div class="bg_area" onclick="closeLayerPop(this);"></div>
            <div class="layer_pop_inner">
                <div class="btn_close_wrap">
                    <button type="button" class="btn_close" onclick="closeLayerPop(this);"></button>
                </div>
                <div class="cont">
                    <div class="head">
                        <div class="head_inner">
                            <div class="title">알림메세지</div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="body_inner">
                        	<div class="description">위시리스트에서 삭제하시겠습니까?</div>
                        </div>
                    </div>
                </div>
                <div class="btn_wrap">
                    <button type="button" class="btn_disable" onclick="closeLayerPop(this);">취소</button>
                    <button id="wish_delete_button" type="button" class="btn_blue" onclick="productQuickOrder.deleteWishInfo()">확인</button>
                </div>
            </div>
        </div>
        
        
    <!-- BODY END -->
    <!-- Channel Plugin Scripts -->
	<script>
	  (function() {
	    var w = window;
	    if (w.ChannelIO) {
	      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
	    }
	    var ch = function() {
	      ch.c(arguments);
	    };
	    ch.q = [];
	    ch.c = function(args) {
	      ch.q.push(args);
	    };
	    w.ChannelIO = ch;
	    function l() {
	      if (w.ChannelIOInitialized) {
	        return;
	      }
	      w.ChannelIOInitialized = true;
	      var s = document.createElement('script');
	      s.type = 'text/javascript';
	      s.async = true;
	      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
	      s.charset = 'UTF-8';
	      var x = document.getElementsByTagName('script')[0];
	      x.parentNode.insertBefore(s, x);
	    }
	    if (document.readyState === 'complete') {
	      l();
	    } else if (window.attachEvent) {
	      window.attachEvent('onload', l);
	    } else {
	      window.addEventListener('DOMContentLoaded', l, false);
	      window.addEventListener('load', l, false);
	    }
	  })();
	  ChannelIO('boot', {
	    "pluginKey": "0f535368-1d85-49c0-af56-c3a12d95d3a6"
	  });
	</script>
	<!-- End Channel Plugin -->
	</jsp:body>
</layout:basicFrameNew>
