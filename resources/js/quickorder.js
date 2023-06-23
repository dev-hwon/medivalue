$(function(){
    $("#footer").hide();

    // 화면 진입 시 배송지 관리 팝업 SHOW
    setTimeout(function(){
        // $(".address_pop").addClass("on");
    },1000);

	QucikSearchFocus();
    tabContent();
    //selectStandard();		// 규격 선택시 이벤트
    accordion();
    accordion02();
	accordion03();
    datePickers();
    deliveryMemo();
    cartCheckbox();
    scrollEvent();
	paymentDetail();
	radioDetailView();
});

// 레이어팝업 닫기 버튼
function closeLayerPop(e){
    $("#quick_order").removeClass("tutorial");
    $(e).parents(".layer_pop").removeClass("on");
    $(e).parents(".tutorial_step").removeClass("on");
    // $(".layer_pop").removeClass("on");
    // $(".tutorial_step").removeClass("on");
}

/* 제품 상세보기 */
function viewProductInfo(e, pd_info){
	 if(typeof(pd_info) !='undefined' && pd_info!='' ){
		 var req_data = {pd_info : pd_info};
		 $.ajax({
				url : '/quickOrder/rest/detail/view_order_info',
				type : 'post',
				cache : false,
				data : req_data,
				dataType : 'json',
			   	success:function(data){			   		
			   		if(data.rtn_cd == '200'){
			   			$("#view_order_area").empty();
			   			$("#view_online_area").empty();
			   			$("#view_prev_order_area").empty();
			   			
			   			var dy_online_html = "";
			   			var dy_shop_html = "";
			   			var dy_prev_order_html = "";
			   			
			   			var temp_group_info = data.item.fd_group_type_1;
						if(data.item.fd_group_type_2 !=''){temp_group_info += (" / "+data.item.fd_group_type_2);}
						if(data.item.fd_group_type_3 !=''){temp_group_info += (" / "+data.item.fd_group_type_3);}
						if(temp_group_info.replace(/(\s*)/g, '') ==''){
							temp_group_info = data.item.fd_product_standard;
						}
			   			dy_shop_html +="<li>";
				   			dy_shop_html +="<div>";
				   				dy_shop_html +="<div class=\"row\">";
				   					dy_shop_html +="<div class=\"text\">";
				   						dy_shop_html +="<div class=\"title\">"+data.item.fd_product_name+"</div>";
				   					dy_shop_html +="</div>";
				   					dy_shop_html +="<div class=\"util\">";
				   						dy_shop_html +="<div class=\"price\">"+numberWithCommas(data.item.shop_product_amount)+"원</div>";
				   						dy_shop_html +="<div class=\"stock\">";
				   							dy_shop_html +="<div class=\"inp_stock_wrap\">";
				   								dy_shop_html +="<input type=\"hidden\" id=\"tpmm_idx\" name=\"tpmm_idx\" value=\""+data.item.pk_idx+"\">";
				   								dy_shop_html +="<input type=\"hidden\" id=\"tqospm_idx\" name=\"tqospm_idx\" value=\""+data.item.fk_tqospm_idx+"\">";
				   								dy_shop_html +="<input type=\"hidden\" id=\"tsmi_idx\" name=\"tsmi_idx\" value=\""+data.item.fk_tsmi_idx+"\">";
				   								dy_shop_html +="<input type=\"hidden\" id=\"pd_name\" name=\"pd_name\" value=\""+data.item.fd_product_name+"\">";
				   								dy_shop_html +="<input type=\"hidden\" id=\"pd_standard\" name=\"pd_standard\" value=\""+temp_group_info+"\">";
				   								dy_shop_html +="<input type=\"hidden\" id=\"pd_unit\" name=\"pd_unit\" value=\""+data.item.fd_product_unit+"\">";
				   								dy_shop_html +="<input type=\"hidden\" id=\"pd_company\" name=\"pd_company\" value=\""+data.item.fd_company_info+"\">";
				   								dy_shop_html +="<input type=\"hidden\" id=\"pd_amount\" name=\"pd_amount\" value=\""+data.item.shop_product_amount+"\">";
				   								dy_shop_html +="<input type=\"text\" id=\"btn_quick_cart_cnt\" name=\"btn_quick_cart_cnt\" class=\"inp_stock\" placeholder=\"9999\" value=\"1\">";
				   								dy_shop_html +="<button type=\"button\" id=\"btn_quick_cart_add\" name=\"btn_quick_cart_add\" class=\"btn_stock\">담기</button>";
				   							dy_shop_html +="</div>";
				   						dy_shop_html +="</div>";
				   					dy_shop_html +="</div>";
				   				dy_shop_html +="</div>";
				   				dy_shop_html +="<div class=\"row\">";
				   					dy_shop_html +="<div class=\"standard\">"+temp_group_info+"</div>";
				   				dy_shop_html +="</div>";
				   			dy_shop_html +="</div>";
				   		dy_shop_html +="</li>";
				   		$("#view_order_area").html(dy_shop_html);
				   		
			   			$.each(data.online_company_list , function(idx, val) {
			   				//console.log(idx + " " + val.title);
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
			   						dy_online_html += "<div class=\"row\">";
			   							dy_online_html += "<div class=\"standard\"></div>";
			   							var temp_group_info = val.fd_group_type_1;
			   							if(val.fd_group_type_2 !=''){temp_group_info += (" / "+val.fd_group_type_2);}
			   							if(val.fd_group_type_3 !=''){temp_group_info += (" / "+val.fd_group_type_3);}
			   							if(temp_group_info.replace(/(\s*)/g, '') ==''){
			   								temp_group_info = val.fd_product_standard;
			   							}
			   							dy_online_html += temp_group_info;
			   							dy_online_html += "</div>";
			   						dy_online_html += "</div>";
			   					dy_online_html += "</div>";
			   				dy_online_html += "</li>";
			   			});
			   			$("#view_online_area").html(dy_online_html);
			   						   			
			   			$.each(data.order_list , function(idx, val) {
			   				dy_prev_order_html +="<tr>";
			   					dy_prev_order_html +="<td>";
			   					dy_prev_order_html += (stringToDateFormat(val.fd_date));
			   					dy_prev_order_html +="</td>";
			   					dy_prev_order_html +="<td>"+val.fd_product_name+"</td>";
			   					dy_prev_order_html +="<td>"+numberWithCommas(val.fd_product_amount)+"</td>";
			   					dy_prev_order_html +="<td>"+numberWithCommas(val.fd_cnt)+"</td>";
			   				dy_prev_order_html +="</tr>";
			   			});
			   			$("#view_prev_order_area").html(dy_prev_order_html);
			   		}else{		   			
			   			alert(data.rtn_msg);
			   		}
			   	},
			   	error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
		 });
	 }else{
		 alert("새로고침 후 다시 시도해주세요.");
		 return;
	 }
}

function stringToDateFormat(str) {
	var result_str = str.replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3');
    return result_str;
}


//레이어팝업 열기
function openLayerProductInfoPop(e, pd_info, pd_group_cnt){
    closeLayerPop();
    if(typeof(pd_info) !='undefined' && pd_info!='' ){
    	var req_data = {pd_info : pd_info, pd_standard_cnt : pd_group_cnt};
    	
    	$.ajax({   
			url : '/quickOrder/rest/detail/info',
			type : 'post',
			cache : false,
			data : req_data,
			dataType : 'json',
		   	success:function(data){
		   		if(data.rtn_cd == '200'){
                    let insure_code
                        = (data.item.fd_product_insure_code === undefined || data.item.fd_product_insure_code === "") ? "-" : data.item.fd_product_insure_code;

		   			$(".pd_info_view").empty();
		   			$(".view_product_detail_info_pd_image").attr("src",data.item.view_image);	// 제품 이미지
		   			$(".view_product_detail_info_pd_image").attr("onerror", "this.src=" + "'/resources/images/dummy/img_ready_for_image.jpg'");	// 제품 이미지
		   			$(".view_product_detail_info_pd_name").text(data.item.fd_product_name);	// 제품명
		   			$(".view_product_detail_info_pd_company_info").text(data.item.fd_company_info);	// 제조사
		   			$(".view_product_detail_info_pd_unit").text(data.item.fd_product_unit);	// 포장단위		   			
		   			$(".view_product_detail_info_pd_medi_code").text(data.item.fd_medi_product_code);	// 상품코드
		   			$(".view_product_detail_info_insure_code_info").text(insure_code);	// 상품코드
		   			$(".view_product_detail_info_pd_standard_info").html();	// 규격 종류
		   			$(".view_product_detail_info_pd_standard_cnt").text(pd_group_cnt);	// 규격 카운트
                    $("#request_product_info_idx").val(data.item.pk_idx);
					// 제품 상세보기 모달팝업 22.03.31 
					$(".detail_lightbox").attr("href", data.item.view_image);
					$(".detail_lightbox").data("lightbox", "image-" + data.item.pk_idx);
					$(".detail_lightbox").data("title", data.item.fd_product_name);

                    $(".view_product_detail_info_pd_content").removeClass("active");
                    $(".view_product_detail_info_pd_content").removeClass("on");

                    if (data.item.fd_content !== null && data.item.fd_content !== "") {
                        $(".view_product_detail_info_pd_content").show();
                        $(".view_product_detail_info_pd_content").addClass("active");
                        $(".view_product_detail_info_pd_content > .detail_editor").html(data.item.content);
                        $(".view_product_detail_info_pd_content .btn_detail").show();
                    } else {
                        $(".view_product_detail_info_pd_content").hide();
                    }

		   			var pd_dy_html = ""
		   			if(Number(data.standard_list_size)>0){
		   				$.each(data.standard_list, function(index, data_item) {
		   					var data_item_pd_name = data_item.fd_product_name;
		   					var data_item_pd_name_group = (data_item.fd_group_type_1+data_item.fd_group_type_2+data_item.fd_group_type_3);
		   					if(data_item_pd_name_group.replace(/(\s*)/g, "") !=''){
		   						data_item_pd_name = data_item_pd_name+data_item_pd_name_group;
		   					}else{
		   						data_item_pd_name = data_item_pd_name+data_item.fd_product_standard;
		   					}
		   					
		   					pd_dy_html += "<li>";
		   						pd_dy_html += "<div>";
		   							pd_dy_html +=(data_item_pd_name); 
		   						pd_dy_html += "</div>";
		   					pd_dy_html += "</li>";
		   					
		   				});
		   			}else{
		   				var data_item_pd_name = data.item.fd_product_name;
	   					var data_item_pd_name_group = (data.item.fd_group_type_1+data.item.fd_group_type_2+data.item.fd_group_type_3);

	   					if(data_item_pd_name_group.replace(/(\s*)/g, "") !=''){
	   						data_item_pd_name = data_item_pd_name+data_item_pd_name_group;
	   					}else{
	   						data_item_pd_name = data_item_pd_name+data.item.fd_product_standard;
	   					}

		   				pd_dy_html += "<li>";
	   						pd_dy_html += "<div>";
	   							pd_dy_html +=(data_item_pd_name); 
	   						pd_dy_html += "</div>";
   						pd_dy_html += "</li>";   					
		   			}
		   			$('#view_product_detail_info_pd_standard_info').append(pd_dy_html);

		   			let labbit_view_item_value = {
                        name: data.item.fd_product_name,
                        id: data.item.pk_idx,
                        price: data.item.shop_product_amount,
                        category: data.item.cate_1_name + "/" + data.item.cate_2_name,
                        brand: data.item.fd_company_info
                    }

                    labbit_view_item(labbit_view_item_value);

		   		}else{		   			
		   			alert(data.rtn_msg);
		   		}
		   	},
		   	error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
    }
    
	var target = $("."+e+"_pop.layer_pop");
    target.addClass("on");
}

//  레이어팝업 열기
function openLayerPop(e){
    paymentDetail_add_info();
    closeLayerPop();
    var target = $("."+e+"_pop.layer_pop");
    target.addClass("on");

    // 주문하기 > 결제하기 버튼 클릭 시
    if(e == "order_complete"){
        $(".order_payment_pop").removeClass("on");
    }
}

// 레이어팝업 다음 버튼
function nextLayerPop(e){
    $(".quickorder_pop").removeClass("on");
    $(".address_pop").removeClass("on");
    $(".tutorial_step").removeClass("on");
    $(".tutorial_step_"+e).addClass("on");

    // 빠른주문 사용안내 시작 시
    if(e == "1"){
        $("#quick_order").addClass("tutorial");
        $(".tab_wrap .tab_list > ul > li").removeClass("on");
        $(".tab_wrap .tab_content > ul > li").removeClass("on");
        $(".tab_wrap .tab_list > ul > li:first-child").addClass("on");
        $(".tab_wrap .tab_content > ul > li:first-child").addClass("on");
        $("#quick_order .atc_step_1 .list_style_01").addClass("gallery");
        $("#quick_order .comm_filter_wrap .btn_gall .inp_list").prop("checked", true);
    }
}

// 빠른주문하기 클릭시 input 포커싱
function focusQuickSearch(){
    $("#header .btm.btm_quick .quick_search_wrap .quick_search .form_cont .inp_search").focus();
}

// 탭 이벤트
function tabContent(){
    // 새로고침시
    $(".tab_wrap .tab_list > ul > li:first-child").addClass("on");
    $(".tab_wrap .tab_content > ul > li:first-child").addClass("on");

    // 탭 클릭시
    $(".tab_wrap .tab_list > ul > li").click(function(e){ 
        var idx = $(this).index();
        var wish = $(".atc_step_1 .tab_list > ul > li:nth-child(2)");
        $(this).parents(".tab_wrap").find(".tab_list > ul > li").removeClass("on").eq(idx).addClass("on");
        $(this).parents(".tab_wrap").find(".tab_content > ul > li").removeClass("on").eq(idx).addClass("on");
        /*if($(this).parents("article").hasClass("atc_step_1") && idx == 1){
            var target = $("#quick_order .ai_wish_wrap .progress_wrap");
            var num = target.data("num");
            aiProgress(num);
        }else if($(this).parents("article").hasClass("atc_step_1") && idx == 0){
            aiProgress(0);
        }*/
        e.preventDefault();
    });
}

// 상단 메뉴 바 검색창 포커스
function QucikSearchFocus(){
    $("#header .btm.btm_quick .quick_search_wrap .quick_search .form_cont .inp_search").focus(function(){
        $(this).siblings(".quick_search_keyword").addClass("on");
    });
    $("#header .btm.btm_quick .quick_search_wrap .quick_search .form_cont .inp_search").blur(function(){
        $(this).siblings(".quick_search_keyword").removeClass("on");
    });
}

// 상단 메뉴 바 검색버튼 클릭시 (.empty 처리 확인 필요)
function submitSearch(){
    // $("#quick_order .atc_step_1 .empty").fadeOut(300);
}

// 스크롤시 header, body 영역 스크립트
function scrollEvent(){

    // common.js 의 scroll event off
    $(window).off("scroll");
	$(document).off('mousewheel');

    var headTopH = $("#header .hd_wrap .top").height();
    var headBotH = $("#header .hd_wrap .btm").height();
    var headH = headTopH + headBotH;
    var scrollArea = $("#header .hd_wrap");

    $("body").css("overflow", "hidden");
    $(".event_banner").hide();
    /*
	$("#quick_order").css("paddingTop", headBotH);
    $("#header .hd_wrap").css("top", - headTopH);

    $(scrollArea).bind('mousewheel', function(e) {
        if (e.originalEvent.wheelDelta >= 0) {
            $("#header .hd_wrap").css("top", 0);
            $("#quick_order").css("paddingTop", headH);
        }
        else {
            $("#header .hd_wrap").css("top", - headTopH);
            $("#quick_order").css("paddingTop", headBotH);
        }
        e.preventDefault();
    });*/
}

// 제품검색(리스트, 갤러리) 정렬방식 변경
function changeFilter(e){
    var target = $(e).parents(".tab_head").siblings(".tab_body").find("[class^='list_style_']");
    if($(e).hasClass("inp_list")){
        target.removeClass("gallery");
    }else{
        target.addClass("gallery");
    }
}

// 제품검색 규격 선택 셀렉트 박스
function selectStandard(){
    var targetSelect = $("#quick_order .sel_standard");
    var targetSelectFirst = $("#quick_order .list_style_01 .package > ul > li:first-child .sel_standard");
    targetSelect.attr("disabled", true);
    targetSelectFirst.attr("disabled", false);
    targetSelect.change(function(){
        if($(this).val() === "null"){
            $(this).parents(".package li").next("li").find(".sel_standard").attr("disabled", true);
        }else{
            $(this).parents(".package li").next("li").find(".sel_standard").removeAttr("disabled").focus();
        }
    });
}

// 재료상 가격비교 아코디언
function accordion(){
    var accBtnMain = $(".accordion_01 > ul > li > div > a");
    var accBtnSub = $(".subacc_accordion .btn_recommend");
    var marketSearch = $(".market_search_wrap");
    marketSearch.click(function(){ // 재료상 검색하기 클릭시 아코디언 기능 비활성화
        return false;
    });

    // accBtnMain.click(function () {
    //     if ($(this).closest("li").hasClass("off")) {
    //         $(this).closest("li").removeClass("off");
    //         $(this).siblings(".subacc").stop().slideDown(300);
    //     } else {
    //         $(this).closest("li").addClass("off");
    //         $(this).siblings(".subacc").stop().slideUp(300);
    //     }
    // });

    accBtnSub.click(function () {
        if ($(this).closest(".subacc_accordion").hasClass("off")) {
            $(this).closest(".subacc_accordion").removeClass("off");
            $(this).closest(".subacc_accordion").find(".subacc_subacc").stop().slideDown(300);
        } else {
            $(this).closest(".subacc_accordion").addClass("off");
            $(this).closest(".subacc_accordion").find(".subacc_subacc").stop().slideUp(300);
        }
    });
}

// 주문내역 아코디언
function accordion02(){
    var accBtn = $(".accordion_02 > a");
    accBtn.click(function () {
        if ($(this).parents(".accordion_02").hasClass("off")) {
            $(this).parents(".accordion_02").removeClass("off");
            $(this).siblings(".subacc").stop().slideDown(300);
        } else {
            $(this).parents(".accordion_02").addClass("off");
            $(this).siblings(".subacc").stop().slideUp(300);
        }
    });
}

// 주문내역 아코디언
function accordion03(){
    var accBtn = $("#quick_order .ai_wish_wrap .tit");
    accBtn.click(function () {
        if ($(this).parents(".ai_wish_wrap").hasClass("off")) {
            $(this).parents(".ai_wish_wrap").removeClass("off");
            $(this).siblings(".subacc").stop().slideDown(300);
        } else {
            $(this).parents(".ai_wish_wrap").addClass("off");
            $(this).siblings(".subacc").stop().slideUp(300);
        }
    });
}

// 재료상관리, 장바구니 알림창 닫기 버튼
function closeNotice(e){
    $(e).parents(".noti_box_wrap").stop().slideUp(300);
}

// 탭 바로가기
function goTabShow(a, b){
    $("#quick_order .atc_step_"+a).find(".tab_wrap .tab_list > ul > li:nth-child("+b+")").click();
}

// 클립보드 복사
function copyClipBoard(e){
    var target = $(e).parent().find(".clipboard_wrap .inp_clip").select();
    try {
        var successful = document.execCommand("copy");
        alert("클립보드에 복사되었습니다.")

    } catch (error) {
        alert("이 브라우저는 지원하지 않습니다.")
    }
}

// 주문내역 > 주문금액 datepicker
function datePickers(){
    $("#quick_order .total_month_wrap .inp_month").datepicker({
        language: "ko",
        autoclose: true,
        format: "yyyy년 mm월 주문금액",
        startView: "months", 
        minViewMode: "months"
    }).datepicker("setDate", "now");
}

// 배송요청사항
function deliveryMemo(){
    var target = $(".layer_pop .order_box .order_body .comment_wrap input[type='text']");
    var comment = target.siblings(".comment");
    var target_wrap = target.parents(".comment_wrap");
    comment.find("a").click(function(){
        var text = $(this).text();
        target.val(text);
    });
    target.focus(function(){
        target_wrap.addClass("on");
    });
    target.blur(function(){
        target_wrap.removeClass("on");
    });
}

// AI 위시리스트 progress
function aiProgress(e){
    var target = $("#quick_order .ai_wish_wrap .progress_wrap");
	var target2 = $("#quick_order .ai_wish_wrap .tit");
    var graphic = target.find(".graphic");
    var graphic2 = target2.find(".progress_bar");
    var text = target.find(".txt > span");
    var text2 = target2.find("span > i");
    graphic.css({
        "backgroundPosition" : "0 " + e + "%"
    });
	graphic2.css({
        "width" : e + "%"
    });
    text.each(function(){
        var $this = $(this);
        $({countNum: $this.text()}).animate({
            countNum: e
        },
        {
            duration: 300,
            easing:'linear',
            step: function() {
                $this.text(Math.floor(this.countNum));
            },
            complete: function() {
                $this.text(this.countNum);
            }
        });  
    });
	text2.each(function(){
        var $this = $(this);
        $({countNum: $this.text()}).animate({
            countNum: e
        },
        {
            duration: 300,
            easing:'linear',
            step: function() {
                $this.text(Math.floor(this.countNum));
            },
            complete: function() {
                $this.text(this.countNum);
            }
        });  
    });
}

// 장바구니 체크박스
function cartCheckbox(){
    var chk = $("#quick_order .chk_cart");
    var chk_all = $("#quick_order .chk_cart_all");
    var chk_title = $("#quick_order .chk_cart_title");
    var chk_list = $("#quick_order .chk_cart_list");
    
    // 전체 체크박스 클릭 시
    // chk_all.on("change", function(){
    //     if($(this).is(":checked")){
    //         chk.prop("checked", true);
    //     }else{
    //         chk.prop("checked", false);
    //     }
    // });

    // 재료상 체크박스 클릭 시
    chk_title.on("change", function(){
        chk_all.prop("checked", 
            $("#quick_order .chk_cart_title:checked").length == chk_title.length
        );
        if($(this).is(":checked")){
            $(this).parents(".thead").siblings(".tbody").find(".chk_cart_list").prop("checked", true);
        }else{
            $(this).parents(".thead").siblings(".tbody").find(".chk_cart_list").prop("checked", false);
        }
    });

    // 제품 체크박스 클릭 시
    chk_list.on("change", function(){
        chk_all.prop("checked", 
            $("#quick_order .chk_cart_list:checked").length == chk_list.length
        );
        $(this).parents(".tbody").siblings(".thead").find(".chk_cart_title").prop("checked", 
            $(this).parents(".tbody").find(".chk_cart_list:checked").length == $(this).parents(".tbody").find(".chk_cart_list").length
        );
    });
}

// 수량선택 10개 이상시
function changeSelect(e){
    let this_id = $(e).attr("id");
	var this_val = $(e).val();
	var this_input = $(e).siblings("input[type='text'].inp_stock");
    // this_input.val(this_val);

	// if(this_val >= 10){
    //     $(e).removeAttr("id");
	// 	$(e).hide();
    //     this_input.attr("id", this_id);
	// 	/*this_input.val("");*/
	// 	this_input.show();
	// 	this_input.focus();
	// }else{
	// 	$(e).show();
    //     $(e).attr("id", this_id);
	// 	this_input.hide();
	// }
	
	/* 100원 이벤트 */
	//console.log("parent : ", $(e).parent().parent().find(".inp_stock_wrap").length);
	//if(e.parent().find(".inp_stock_wrap"))
	var temp_cs_tpmm_idx = 0;
	if($(e).parent().parent().find(".inp_stock_wrap").length >0){		
		temp_cs_tpmm_idx = $(e).parent().find("#tpmm_idx").val();
	}else{
		temp_cs_tpmm_idx = $(e).parent().find("#cart_tpmm_idx").val();
	}
	//console.log("cart_tpmm_idx : ", temp_cs_tpmm_idx)
	
	if(event_product.indexOf(Number(temp_cs_tpmm_idx))>-1){
		$(e).val(1);
		alert("이벤트 상품은 수량 변경을 할 수 없습니다.");
    	return;
    }
	

    if(this_val < 10 && this_val !== ""){    	
        $(e).show();
        $(e).attr("id", this_id);
        this_input.hide();
    }else{
        $(e).removeAttr("id");
        $(e).hide();
        this_input.attr("id", this_id);
        this_input.val("");
        this_input.show();
        this_input.focus();
    }
}
// let user_medicash = $("#user_medicash_info").data("user-medicash");
// if( +user_medicash === 0 ) {
//     let result = confirm("메디캐시가 없어요.\n\n충전페이지로 이동할까요?")
//     if(result) {
//         window.open("about:blank").location.replace('/medicashMng/info');
//     }ㅁ
//     $(this).prop('checked', false);
//     return;
// }

// 주문결제 > 결제수단 라디오버튼 클릭 시
function paymentDetail(){
    let target_radio = $("#quick_order .paymentTypeDiv input[type='radio']");
	target_radio.click(function() {
        paymentDetail_add_info();
	});
}
function paymentDetail_add_info() {
    let check_method = $("#quick_order .paymentMethodDiv #advance_pay").prop('checked');
    if(check_method) {
        let target_checked = $("#quick_order .paymentTypeDiv .payment_radio_wrap input[type='radio']:checked")
        let target_detail = $(".layer_pop .order_box .order_body .order_basic .payment_detail_wrap");
        let this_value = target_checked.val();
        target_detail.find("li.payment_detail_"+this_value).show().siblings().hide();
        if(this_value === 'medicash') {
            $(".point_detail_wrap ul li").eq(0).addClass("active");
            $("#btn_reset_medicash_charge").click();
        } else {
            $(".point_detail_wrap ul li").eq(0).removeClass("active");
        }
    }
}
// 주문결제 > 결제하기 클릭 시
function payForIt(e){
	// $(e).parents(".order_pop.order_payment_pop").addClass("order_complete_pop");
	// $(e).parents(".order_pop.order_payment_pop").removeClass("order_payment_pop");
}

// 제품 상세 이미지 확대
function imageZoom(imgID, resultID) {
    var img, lens, result, cx, cy;
    img = document.getElementById(imgID);
    result = document.getElementById(resultID);
	//imgNaturalW = img.naturalWidth;
	//imgNaturalH = img.naturalHeight;

    /* Create lens: */
    lens = document.createElement("DIV");
    lens.setAttribute("class", "img_zoom_lens");

    /* Insert lens: */
    img.parentElement.insertBefore(lens, img);

    /* Calculate the ratio between result DIV and lens: */
    cx = result.offsetWidth / lens.offsetWidth;
    cy = result.offsetHeight / lens.offsetHeight;

    /* Set background properties for the result DIV */
    result.style.backgroundImage = "url('" + img.src + "')";
    result.style.backgroundSize = (img.width * cx) + "px " + (img.height * cy) + "px";

    /* Execute a function when someone moves the cursor over the image, or the lens: */
    lens.addEventListener("mousemove", moveLens);
    img.addEventListener("mousemove", moveLens);

    /* And also for touch screens: */
    lens.addEventListener("touchmove", moveLens);
    img.addEventListener("touchmove", moveLens);
    function moveLens(e) {
        var pos, x, y;

        /* Prevent any other actions that may occur when moving over the image */
        e.preventDefault();

        /* Get the cursor's x and y positions: */
        pos = getCursorPos(e);

        /* Calculate the position of the lens: */
        x = pos.x - (lens.offsetWidth / 2);
        y = pos.y - (lens.offsetHeight / 2);

        /* Prevent the lens from being positioned outside the image: */
        if (x > img.width - lens.offsetWidth) {x = img.width - lens.offsetWidth;}
        if (x < 0) {x = 0;}
        if (y > img.height - lens.offsetHeight) {y = img.height - lens.offsetHeight;}
        if (y < 0) {y = 0;}

        /* Set the position of the lens: */
        lens.style.left = x + "px";
        lens.style.top = y + "px";

        /* Display what the lens "sees": */
        result.style.backgroundPosition = "-" + (x * cx) + "px -" + (y * cy) + "px";
        result.style.backgroundColor='white';
		$("#"+imgID).parents(".image").addClass("on");
    }
    function getCursorPos(e) {
        var a, x = 0, y = 0;
        e = e || window.event;

        /* Get the x and y positions of the image: */
        a = img.getBoundingClientRect();

        /* Calculate the cursor's x and y coordinates, relative to the image: */
        x = e.pageX - a.left;
        y = e.pageY - a.top;

        /* Consider any page scrolling: */
        x = x - window.pageXOffset;
        y = y - window.pageYOffset;
        return {x : x, y : y};
    }

	$("#"+imgID).parents(".image").addClass("on");
}

function imageZoomDestroy(imgID, resultID){
	var lens = $("#"+imgID).siblings(".img_zoom_lens");
	/*lens.remove();*/
	lens.addClass("img_zoom_lens_off");
	lens.removeClass("img_zoom_lens");
	$("#"+imgID).parents(".image").removeClass("on");
}

$(function(){
	detailImgHover();
});
function detailImgHover(){
	$(".detail_pop.layer_pop .body .image .img").hover(function(){
		imageZoom("img_zoom_image", "img_zoom_result");
	}, function(){
		imageZoomDestroy("img_zoom_image", "img_zoom_result");
	});
}

function radioDetailClick(){
	console.log("e");
}
function radioDetailView(){
	const tabWrap = document.querySelector(".comm_tab_wrap");
    const tabButtonWrap = tabWrap.querySelector(".radio_button_wrap");
    const tabButton = tabWrap.querySelectorAll(".radio_button_wrap .label_radio");
    const tabDetailWrap = tabWrap.querySelector(".radio_detail_wrap > ul");
    const tabDetail = tabWrap.querySelectorAll(".radio_detail_wrap > ul > li");
    const radioDetails = [...tabDetailWrap.children];
    tabButton.forEach((item) => {
        item.onchange = (e) => {
            const li = [...e.currentTarget.parentElement.parentElement.children];
            const index= li.indexOf(e.currentTarget.parentElement);
            /*
            tabDetail.forEach((item) =>{
                item.classList.remove("active");
            });
            */
            if(index == 1){
                radioDetails[1].classList.add("active");
            }
            else{
                radioDetails[1].classList.remove("active");
            }

        }
    });
}

function btnWishClick(){
	const thisWish = $("#view_order_area");
	const delAlert = $(".wish_del_pop");
	if(thisWish.hasClass("wish")){
		delAlert.addClass("on");
	}else{
		thisWish.addClass("wish");
	}
}

function btnWishDelClick(){
	const thisWish = $("#view_order_area");
	const delAlert = $(".wish_del_pop");
	thisWish.removeClass("wish");
	delAlert.removeClass("on");
}

function btnDetailClick(e){
	$(e).parents(".detail").addClass("on");
    $(e).hide();
}

