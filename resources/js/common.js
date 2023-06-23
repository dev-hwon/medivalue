$(document).ready(function (){
	function banner () {
		var $close=$(".event_banner .real_area .close_btn");

		$close.on("click", function  () {
			$(this).parents(".event_banner").stop().animate({"margin-top":"-44px"}, function  () {
				$(this).css("display","none")
			})
		});
	}
	banner();

	// 있는경우에만 실행
	if( $(".nis").length > 0 ) {
		$(".nis").niceSelect();
	}

	$("#btn_ok").on("click",function(){
		$(".popup_message_type_1").css("display","none");
		$("#black").css("display","none");
	});
	
	$("#black").click(function(){
		$(".popup_message_type_1").hide();
		$(this).hide();
	});
	
	var placeholderTarget = $(".form_cont input[type=text], .form_cont input[type=password], .form_cont textarea");
 
    placeholderTarget.focus(function(){
        $(this).siblings("label").fadeOut("fast");
    });
 
    placeholderTarget.focusout(function(){
        if($(this).val() == ""){
            $(this).siblings("label").fadeIn("fast");
        }
    });

	setTimeout(function() {
		$("#main .cnt2").addClass("active");
		$("#main .cnt4").addClass("active");
		$("#main .cnt6").addClass("active");
		$("#main .cnt7").addClass("active");
		$("#main .cnt8").addClass("active");
		$("#main .cnt10").addClass("active");
		$("#main .cnt11").addClass("active");
		$(".my_history").addClass("active");
	}, 500);

	var $fullMenu=$("#header .btm .area .real_area .full_menu .fm_btn");
	var $fullMenuClose=$("#header .btm .area .real_area .full_menu .full_menu_wrap .fmw_login .fmw_close");
	var $hdText=$("#header .area .real_area .left .sch_box .form_cont input");
	var $totalSch=$("#header .top .area .real_area .left .sch_box .total_sch");
	var $subWish=$(".wish_wrap .wish_btn");
	var $subWish2=$(".last_view .md .md_txt .depth1 > li .depth2 > li .wish_btn");
	var $ipClose=$("#header .area .real_area .left .sch_box .input_popup .ip_close button");
	var $qbPlus=$(".cart_popup .quan_box .plus");
	var $qbMinus=$(".cart_popup .quan_box .minus");
	var $puCancel=$(".cart_popup .cancel_btn");
	var $cartBtn1=$(".wish_wrap .cart_btn");
	var $cartBtn3=$("#main .cnt9 .area .real_area .txt .right .cart_btn");
	var $cartBtn4=$("#main .cnt12 .area .real_area .txt ul.depth1_1 li.depth1_1_li2 .cart_btn");
	//var $cartBtn5=$("#main .cnt12 .area .real_area .txt div.btm > div.bx-wrapper > div.bx-viewport > ul.bxslider25 > li > ul.depth2 > li > div.control_box > .cart_btn");
	var $cartBtn5=$("#main .cnt12 .area .real_area div.txt > div.btm > ul.bxslider25 > li > ul.depth2 > li > div.control_box > button.cart_btn");	
	var $cartBtn6=$("#main .cnt12 .area .real_area div.txt > div.btm > .slick_m_wrap > ul.slick25 .control_box > button.cart_btn");
	var $black3=$("#black3");
	var $schBtn2=$("#header .top .area .real_area .left .search_icon2");
	var $hdRbtn2=$("#header .top .area .real_area .right > ul > li.hd_r_btn2");
	var $util13=$("#header .btm .area .real_area .util .util1 li.util1_3");
	var $cartAlarm=$("#header .top .area .real_area .right > ul > li.hd_r_btn3 .cart_alarm");
	var $cartNum=$("#header .top .area .real_area .right > ul > li.hd_r_btn3 > a .cart_num");
	var posY=$("#header").offset().top;
	var $ipLeft=$("#header .area .real_area .left .sch_box .input_popup .ip_wrap .ip_left");
	var $ipRight=$("#header .area .real_area .left .sch_box .input_popup .ip_wrap .ip_right");
	
	$(document).on("click","button[id^='btn_rtn_keyword']",function(){
		var temp_text = $(this).text();
		if($.trim(temp_text).length>0){
			$("#searchString").val(temp_text);
			$("#frm_search").submit();
		}
	});
	
	$("#btn_top_menu").on("click",function(){
		$fullMenu.trigger("click");
	});
	
	$("#black2").on("click",function(){
		$fullMenuClose.trigger("click");
	})
	
	$(".cart_popup .cart_go_btn").on("click", function  () {
		let pop_id = $(this).parent().parent().parent().attr("id");	// cartPopup1
		if (pop_id == undefined) {
			pop_id = $(this).parent().parent().attr("id"); // cartPopup2
		}
		
		/*
		let pd_title = "";
		if (pop_id == "cartPopup1") {
			pd_title = $(this).parent().parent().find(".pop_tit").text();
		} else if (pop_id == "cartPopup2") {
			pd_title = $(this).parent().parent().find(".pop_tit").eq(0).text() + " 외";
		}
		$cartAlarm.find(".pd_tit").text(pd_title);
		$cartAlarm.find(".pd_desc").text($("#" + pop_id).find(".pop_item").length + "개 제품을 장바구니에 제품을 담았습니다");
		*/
		

		//$cartAlarm.css("display","block");
		//$cartNum.css("display","block");

		/*
		setTimeout(function() { 
			$cartAlarm.css("display","none");
		}, 3000);
		*/

		let result = addCart($(this));

		if (!result) {
			alert("수량을 체크 해주세요.");
		} else {
			$(this).closest(".cart_popup").css("display","none");
			$("#black3").css("display","none")
		}
	});
	
	$util13.on({
		"mouseenter":function  () {
			$(this).find(".as_center_pu").css("display","block")
		},
		"mouseleave":function  () {
			$(this).find(".as_center_pu").css("display","none")
		}
	});

	$hdRbtn2.on({
		"mouseenter":function  () {
			$(this).find(".my_account_pu").css("display","block")
		},
		"mouseleave":function  () {
			$(this).find(".my_account_pu").css("display","none")
		}
	});

	$schBtn2.on("click", function  () {
		$(".last_view.on").css("display","block").stop().animate({"right":"0"});
		$("#black4").css("display","block");
	});

	$(".last_view .lastView_close").on("click", function  () {
		$(this).parent().stop().animate({"right":"-350px"}, function  () {
			$(this).css("display","none");
		});
		$("#black4").css("display","none");
	});

	$("#black4").on("click", function  () {
		$(".last_view .lastView_close").click()
	});

	/*$cartBtn1.on("click", function  () {
		if (!checkLogin()) return false;

		$(".cart_popup.on").css("display","block");
		$("#black3").css("display","block");
		return false;
	});*/
	
	$cartBtn1.on("click", function  () {
		if (!checkLogin()) return false;
		
		// if ($(this).parents("li").hasClass("option")){
		// 	$("#cartPopup3").css("display","block");
		// 	$("#black3").css("display","block");
		// 	return false;
		// }else{
		// 	$(".cart_popup.on").css("display","block");
		// 	$("#black3").css("display","block");
		// 	return false;
		// }
	});


	$cartBtn3.on("click", function  () {
		if (!checkLogin()) return false;
		
		//$(".cart_popup.on").css("display","block");
		$("#cartPopup2").css("display","block");
		$("#black3").css("display","block");
		return false;
	});

	$cartBtn4.on("click", function  () {
		if (!checkLogin()) return false;
		
		//$(".cart_popup.on").css("display","block");
		$("#cartPopup2").css("display","block");
		$("#black3").css("display","block");
		return false;
	});
	
	$cartBtn5.on("click", function  () {
		if (!checkLogin()) return false;
		
		viewCart($(this));
		
		//$(".cart_popup.on").css("display","block");
		//$("#black3").css("display","block");
		return false;
	});
	
	$cartBtn6.on("click", function  () {
		if (!checkLogin()) return false;
		
		viewCart($(this));
		
		//$(".cart_popup.on").css("display","block");
		//$("#black3").css("display","block");
		return false;
	});
	
	

	$puCancel.on("click", function  () {
		$(".cart_popup").css("display","none");
		$black3.css("display","none");
	});

	$black3.on("click", function  () {
		$puCancel.click()
	});

	$(document).on("change", ".cart_popup .quan_box input[type='text']", function () {

		let cnt = parseInt($(this).val());

		if (cnt < 0) {
			alert("올바른 값을 입력해주세요.");
			// $("#pop_alarm_msg").text("올바른 값을 입력해주세요.");
			$(".popup_message_type_1").css("display","block");
			$(this).val(1);
			return false;
		}

		let tot_price = 0;
		let cartId = $(this).closest(".cart_popup").attr("id");
		if (cartId === "cartPopup3") {

			$(this).closest(".cart_popup").find(".label_check").each(function () {
				if ($(this).children().prop("checked")) {
					let product_price = priceToNumber($(this).closest(".pop_item").find(".pop_price").text().replace("원", ""));
					let cnt = parseInt($(this).closest(".pop_item").find(".pop_cnt").val());
					let calc_price = product_price * cnt;
					tot_price = tot_price + calc_price;
				}
			});

		} else {
			$(this).closest(".cart_popup").find(".pop_price").each(function(i){
				let product_price = $(this).parent().parent().find(".pop_price").text().replace("원", "");
				let cnt = parseInt($(this).parent().parent().find(".pop_cnt").val());
				let calc_price = priceToNumber(product_price) * cnt;
				tot_price = tot_price + calc_price;
			});
		}
		$(this).closest(".cart_popup").find(".pop_tot_price").text(numberToPrice(tot_price));
	});

	$(document).on("click", ".cart_popup .comm_check_only .label_check input[type='checkbox']", function () {
		//전체값만 체크
		let cartId = $(this).closest(".cart_popup").attr("id");
		if (cartId === "cartPopup3") {
			let product_price = priceToNumber($(this).closest(".pop_item").find(".pop_price").text().replace("원", ""));
			let cnt = parseInt($(this).closest(".pop_item").find(".pop_cnt").val());
			let tot_price = priceToNumber($(this).closest(".cart_popup").find(".pop_tot_price").text().replace("원", ""));

			if ($(this).prop("checked")) {
				tot_price = tot_price + product_price * cnt;
			} else {
				tot_price = tot_price - product_price * cnt;
			}

			if (tot_price < 0) {
				tot_price = 0;
			}

			$(this).closest(".cart_popup").find(".pop_tot_price").text(numberToPrice(tot_price));
		}
	});

	//$qbPlus.on("click", function  () {
	$(document).on("click", ".cart_popup .quan_box .plus", function(){
		var n =$(this).index(this);
		var num = $(this).prev().find(".num:eq("+n+")").val();
		num = $(this).prev().find(".num:eq("+n+")").val(num*1+1);
		var $ccc2= $(this).prev().find(".num").val();

		if ($ccc2>1) {
			$qbMinus.css("color","#232323")
		}else {
			$qbMinus.css("color","#b2b2b2")
		}
		let tot_price = 0;
		let cartId = $(this).closest(".cart_popup").attr("id");
		if (cartId === "cartPopup3") {

			$(this).closest(".cart_popup").find(".label_check").each(function () {
				if ($(this).children().prop("checked")) {
					let product_price = priceToNumber($(this).closest(".pop_item").find(".pop_price").text().replace("원", ""));
					let cnt = parseInt($(this).closest(".pop_item").find(".pop_cnt").val());
					let calc_price = product_price * cnt;
					tot_price = tot_price + calc_price;
				}
			});

		} else {
			$(this).closest(".cart_popup").find(".pop_price").each(function(i){
				let product_price = $(this).parent().parent().find(".pop_price").text().replace("원", "");
				let cnt = parseInt($(this).parent().parent().find(".pop_cnt").val());
				let calc_price = priceToNumber(product_price) * cnt;
				tot_price = tot_price + calc_price;
			});
		}
		$(this).closest(".cart_popup").find(".pop_tot_price").text(numberToPrice(tot_price));
	});
	
	//$qbMinus.click(function(){
	$(document).on("click", ".cart_popup .quan_box .minus", function(){
		var n = $(this).index(this);
		var num = $(this).next().find(".num:eq("+n+")").val();
		num = $(this).next().find(".num:eq("+n+")").val(num*1-1);
		var $ccc= $(this).next().find(".num").val();

		if ($ccc<1) {
			alert("최소 수량은 1개 입니다.");
			$(this).next().find(".num").val(1);
		}

		if ($ccc>1) {
			$qbMinus.css("color","#232323")
		}else {
			$qbMinus.css("color","#b2b2b2")
		}
		let tot_price = 0;
		let cartId = $(this).parent().parent().parent().parent().parent().attr("id");
		if (cartId === "cartPopup3") {
			$(this).closest(".cart_popup").find(".label_check").each(function () {
				if ($(this).children().prop("checked")) {
					let product_price = priceToNumber($(this).closest(".pop_item").find(".pop_price").text().replace("원", ""));
					let cnt = parseInt($(this).closest(".pop_item").find(".pop_cnt").val());
					let calc_price = product_price * cnt;
					tot_price = tot_price + calc_price;
				}
			});
		} else {
			$(this).closest(".cart_popup").find(".pop_price").each(function(i){
				let product_price = $(this).parent().parent().find(".pop_price").text().replace("원", "");
				let cnt = parseInt($(this).parent().parent().find(".pop_cnt").val());
				let calc_price = priceToNumber(product_price) * cnt;
				tot_price = tot_price + calc_price;
			});
		}
		$(this).closest(".cart_popup").find(".pop_tot_price").text(numberToPrice(tot_price));
	});

	$(window).on("resize",function  () {
		var hei=$(this).outerHeight();
		var $fmw=$("#header .btm .area .real_area .full_menu .full_menu_wrap");
		var $fmwUl=$("#header .btm .area .real_area .full_menu .full_menu_wrap > ul");
		var $fmwd2=$("#header .btm .area .real_area .full_menu .full_menu_wrap > ul > li .depth2_wrap");
		var $fmwd3=$("#header .btm .area .real_area .full_menu .full_menu_wrap > ul > li .depth2_wrap .dep2 > li .depth3_wrap");
		
		$fmw.css("height",hei);
		$fmwd2.css("height",hei);
		$fmwd3.css({"height":hei});
		$fmwUl.css("height",hei-134);
		$fmwd2.children("ul").css("height",hei-68);
		$fmwd3.children("ul").css("height",hei-68);

		$(".last_view1 .breakdown").css("height",hei-661)
		$(".last_view2 .breakdown").css("height",hei-350)
		
		var lv1Bh=$(".last_view1 .breakdown").outerHeight()
		var mdH=hei-lv1Bh-140

		$(".last_view .md .md_txt .lv_wrap").css("height",mdH)
	});
	$(window).trigger("resize");

	$totalSch.on("click", function  () {
		$(".input_popup").css("height","0")
	});

	$fullMenu.on("click", function  () {
		$(this).next().css("display","block").stop().animate({"left":"0"}, function  () {
			$("#black2").css("display","block");
		});
	});

	$fullMenuClose.on("click", function  () {
		$(this).closest(".full_menu_wrap").stop().animate({"left":"-100%"}, function  () {
			$(this).css("display","none")
		})
		$("#black2").css("display","none");
	});

	$hdText.on("input", function  (e) {		
		var ipLeftW=$ipLeft.find("ul li button").outerWidth();

		if ($(this).val()=='') {
			$(this).parent().next().css({"height":"0","border":"0"});
		}else{
			if($.trim($(this).val()).length>=3){
				var req_searchKeyword = $(this).val();
				
				var formData = {
					"req_searchKeyword":req_searchKeyword,
					"req_type":"view"
				}
				
				$.ajax({
					url : '/product/search/rest/info',
					type : 'post',
					cache : false,
					data : formData,
					dataType : 'json',
				   	success:function(data){
				   		if(data.rtn_code != '200'){
				   			if($(".popup_message_type_1").css('display') === 'none' ){
				   				$("#pop_alarm_msg").text(data.rtn_msg);
								$(".popup_message_type_1").show();
				   			}
				   		}else{
				   			$("#view_search_keyword").empty();
				   			$("#view_search_recommend").empty();
				   			
				   			if(data.r_list_cnt>0){
				   				var search_dy_html = "";
				   				$.each(data.r_list, function(index, value) {
				   					search_dy_html +="<li>";
						   			search_dy_html +="<button type=\"button\" id=\"pd_link_1\" onclick=\"location.href='/product/detail?req_view_idx="+value.fk_tpsm_idx+"';\">";						   			
						   			search_dy_html +=(value.fd_product_name);						   			
						   			search_dy_html +="</button>";
						   			search_dy_html +="</li>";
				   				});
				   				$("#view_search_recommend").html(search_dy_html);
				   			}
				   			
				   			if(data.list_cnt>0){
				   				var search_dy_html = "";
				   				$.each(data.list, function(index, value) {
				   					search_dy_html +="<li>";
						   			search_dy_html +="<button type=\"button\"  id=\"btn_rtn_keyword\">";
						   			var temp_str_view  = value.fd_product_name;						   			
						   			temp_str_view = temp_str_view.replace(req_searchKeyword, "<span>"+req_searchKeyword+"</span>");
						   			search_dy_html +=(temp_str_view);						   			
						   			search_dy_html +="</button>";
						   			search_dy_html +="</li>";
				   				});
				   				$("#view_search_keyword").html(search_dy_html);
				   			}
				
							var inpPopleftHeight = $("#header .area .real_area .left .sch_box form .input_popup .ip_wrap .ip_left").height();
							var inpPoprightHeight = $("#header .area .real_area .left .sch_box form .input_popup .ip_wrap .ip_right").height();
							if(inpPopleftHeight > inpPoprightHeight){
								var inpPopHeight = inpPopleftHeight + 30;
							}else{
								var inpPopHeight = inpPoprightHeight + 30;
							}
			   				$("div.input_popup").css({"height": inpPopHeight + "px","border":"1px solid #eaeaea"});
				   		}
				   	},
				   	error:function(request,status,error){
				        // alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
			}
		}

		if (ipLeftW>160) {
			$ipLeft.css("width","100%");
			$ipRight.css("display","none");
		}
	});
	
	var prevScrollY = $(window).scrollTop();
	$(window).on("scroll", function  () {
		var scrollY2=$(this).scrollTop();
		var posY2= scrollY2-384
		var ftTop=$("#footer").offset().top;
		var headH=$("#header .hd_wrap").height();
		var ebannerH=$(".event_banner").height();
		var headTopH=$("#header .hd_wrap .top").height();
		var headBotH=$("#header .hd_wrap .btm").height();
		var headBanTopH=headH - headBotH;
		winScrT = $(window).scrollTop(),
		totH = winScrT + $(window).height();

		/*마우스 스크롤 시 헤더 높이 변경 01*/
		if(prevScrollY > scrollY2){
            $("#header .hd_wrap").stop().css("top", 0);
			//console.log("UP");
		}else{
			$("#header .hd_wrap").stop().css("top", - headBanTopH);
			//console.log("DOWN");
		}
		prevScrollY = scrollY2;
		/* 리뉴얼 END */

		if( scrollY2 > 0 ) {
			$('.quick_menus').fadeIn();
		} else {
			$('.quick_menus').fadeOut();
		}
	});
	
	var headWrapH = $("#header .hd_wrap").height();
    $("section.main, section.sub").css({"padding-top":headWrapH});
    $(".evt_container").css({"padding-top":headWrapH}); // 이벤트에서만 사용

	/* 리뉴얼 START */
	
	/*마우스 스크롤 시 헤더 높이 변경 02*/
	/*$(document).bind('mousewheel', function(e) {
		var headTopH=$("#header .hd_wrap .top").height();
	    if (e.originalEvent.wheelDelta >= 0) {
			$("#header .hd_wrap").css("top", 0);
	    }
	    else {
			$("#header .hd_wrap").css("top", - headTopH);
	    }
	});*/
	/* 리뉴얼 END */

	$subWish.on("click", function  () {
		if (!checkLogin()) return false;
		if ($(this).hasClass("on")) {
			$(this).removeClass("on").find("img").attr("src","/resources/images/main/sub_like_icon.png");
		}else {
			$(this).addClass("on").find("img").attr("src","/resources/images/main/sub_like_icon_on.png");
		}
	});

	$subWish2.on("click", function  (e) {
		var login_check = checkLogin();
		var wish_obj =  $(this);
		if(login_check){
			var left_tpsm_idx = $(this).parent().find("#tpsm_idx").val();
			var wish_state = 'N';
			if(!$(this).hasClass("on")){
				wish_state = 'Y';
			}

			var formData = {tpsm_idx : left_tpsm_idx,
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
			   			$("#pop_alarm_msg").text(data.rtn_msg);
						$(".popup_message_type_1").show();						
			   		}else{
			   			if(wish_state=='Y'){			   				
			   				$(wish_obj).addClass("on").find("img").attr("src","/resources/images/main/wish_icon_on.png");
						}else{							
							$(wish_obj).removeClass("on").find("img").attr("src","/resources/images/main/wish_icon.png");
						}
			   		}
			   	},
			   	error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			       
			    }
			});
		}
	});

	function noti () {
		var $imgA=$(".noti .depth1 li .depth2 li a");
		$imgA.attr("onclick","return false");
		$imgA.on({
			"mouseenter":function  () {
				$(this).find(".wish_wrap").stop().animate({"bottom":"0"}, function  () {					
					//$(this).parents("a").removeAttr("onclick")
					$(this).parents("a").attr("onclick","return false");
				});
			},
			"mouseleave":function  () {
				$(this).find(".wish_wrap").stop().animate({"bottom":"-75px"});
			},
			"click":function  (e) {
				e.stopPropagation();
				var temp_loc_info = e.target.id;				
				if(temp_loc_info == 'pd_img_info'){
					$imgA.removeAttr("onclick");
					var loc_info = $(e.target).parent().parent().parent().find("a").attr("href");
					location.href=loc_info;
				}else{
					//$imgA.attr("onclick","return false");
					$imgA.attr("onclick","return false");
				}
			}
		});
	}
	noti();

	$ipClose.on("click", function  () {
		$(this).parents(".input_popup").css({"opacity":"0","z-index":"-10"});
	});

	function noti2 () {
		var $imgA=$(".noti2 .depth1 li .depth2 li a")

		$imgA.on({
			"mouseenter":function  () {
				$(this).find(".wish_wrap").stop().animate({"bottom":"0"});
			},
			"mouseleave":function  () {
				$(this).find(".wish_wrap").stop().animate({"bottom":"-60px"});
			}
		});
	}
	noti2();

	$("#header .btm .area .real_area .full_menu .full_menu_wrap > ul > li").on({
		"mouseenter":function  () {
			$(this).find(".depth2_wrap").css("display","block");
		},
		"mouseleave":function  () {
			$(this).find(".depth2_wrap").css("display","none");
		}
	});

	$("#header .btm .area .real_area .full_menu .full_menu_wrap > ul > li .depth2_wrap .dep2 li").on({
		"mouseenter":function  () {
			var aaa=$(this).outerWidth();
			$(this).find(".depth3_wrap").css({"left":aaa+1,"display":"block"});
			
		},
		"mouseleave":function  () {
			$(this).find(".depth3_wrap").css("display","none");
		}
	});
	
	/*$(".lvslider1").bxSlider({
		auto : false,
		autoHover : true,
		autoControls : false,
		pause: 4000,
		controls : true,
		pager: false,
		touchEnabled : false,
		onSlideBefore: function ($slideElement, oldIndex, newIndex){
			var current_index = parseInt(newIndex + 1);               
            $('#lvslider1_view_no').text(current_index);                
		}
	});*/
	/*
	$(".left_menu li button.question, " +
	  ".main_hd a.question").on("click", function(){
		if (checkLogin()) {
			location.href = "/member/mypage/question/list";
		}
	});
	*/
	
	$(".left_menu li button.question, .main_hd a.question, .banner button.question_write, #footer button.question").on("click", function(){
		//if (checkLogin()) {
		  $(".popup_message_type_1").css("display","block");
		  $("div.popup_message_type_1 > div.tit > h4").text("1:1 문의");;
		  $("#pop_alarm_msg").text("우측 하단 '채널톡'을 이용하시면 빠른 문의가 가능합니다. ");
		  $("#black").css("display","block");
		//}
	});
	
	$(".left_menu li button.notice, " +
	  "#footer button.notice, " +
	  ".main_hd a.notice").on("click", function(){
		location.href = "/notice/list";
	});
	
	$(".left_menu li button.useinfo, " + 
	  "#footer .ft_gnb li button.useinfo, " +
	  ".main_hd a.useinfo").on("click", function(){
		location.href = "/common/explain/useinfo";
	});
	
	$(".left_menu li button.terms3, " +
	  ".main_hd a.terms3").on("click", function(){
		location.href = "/terms/info?tab=3";
	});
	
	$("#footer button.terms2").on("click", function(){
		location.href = "/terms/info?tab=2";
	});
	
	$("#footer button.terms").on("click", function(){
		location.href = "/terms/info";
	});
	/*
	$(".banner button.question_write, " +
	  "#footer button.question").on("click", function(){
	  	if (checkLogin()) {
			location.href = "/member/mypage/question/write";
		}
	});
	*/
	
	// $(".snb .btn_as, " +
	//   "#footer button.btn_as, " +
	//   "#main a.btn_as").on("click", function(){
	//   	if (checkLogin()) {
	// 		location.href = "/member/mypage/question/aswrite";
	// 	}
	// });
	
	$(".wish_wrap").hover(function(){
		$(this).parents("li.slick-slide").children("a").attr("onclick","return false");
	}, function(){
		$(this).parents("li.slick-slide").children("a").attr("onclick","");
	});
	
	$(".option_list .sub").click(function(){
		$(this).parents("li.option").children("a").attr("onclick","return false");
	});
	
	categoryHover();
	
	
	
	
});

function popAlarm(pd_title, pd_cnt) {
	const $cartAlarm=$("#header .top .area .real_area .right > ul > li.hd_r_btn3 .cart_alarm");
	const $cartNum=$("#header .top .area .real_area .right > ul > li.hd_r_btn3 > a .cart_num");
	if (pd_cnt > 1) {
		pd_title = pd_title + " 외";
	}

	$cartAlarm.find(".pd_tit").text(pd_title);
	$cartAlarm.find(".pd_desc").text(pd_cnt + "개 제품을 장바구니에 제품을 담았습니다");
	
	let count = parseInt($cartNum.text()) + pd_cnt;
	$cartNum.text(count);
	
	$cartAlarm.css("display","block");
	$cartNum.css("display","block");
	
	setTimeout(function() { 
		$cartAlarm.css("display","none");
	}, 3000);
}

function popAlarm2(pd_title, pd_cnt, type) {
	// const $cartAlarm=$("#header .top .area .real_area .right > ul > li.hd_r_btn3 .cart_alarm");
	const $cartAlarm=$("#cart_alarm_id");
	const $cartNum=$("#cart_num_id");
	if(type=='G'){
		if (pd_cnt >= 1) {
			pd_title = pd_title + " 외";
		}
	}else{
		pd_title = pd_title
	}

	$cartAlarm.find(".pd_tit").text(pd_title);
	$cartAlarm.find(".pd_desc").text(pd_cnt + "개 제품을 장바구니에 제품을 담았습니다");
	
	let count = parseInt($cartNum.text());
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
	return str;
}
function popAlarm3(pd_title, pd_cnt, basketSize) {
	const $cartAlarm=$("#header .btm .area .real_area .right > ul > li.hd_r_btn3 .cart_alarm"); // .btm 으로 변경
	const $cartNum=$("#header .btm .area .real_area .right > ul > li.hd_r_btn3 > a .cart_num");
	if (pd_cnt > 1) {
		pd_title = pd_title + " 외";
	}

	$cartAlarm.find(".pd_tit").text(ConvertTag(pd_title));
	$cartAlarm.find(".pd_desc").text(pd_cnt + "개 제품을 장바구니에 담았습니다");

	let count = basketSize; //parseInt($cartNum.text()) + pd_cnt;
	$cartNum.text(count);

	$cartAlarm.css("display","block");
	$cartNum.css("display","block");

	setTimeout(function() {
		$cartAlarm.css("display","none");
	}, 3000);
}

function checkLogin() {
	if (g_check_login == "") {
		let location_search = location.search;
		let location_pathname = location.pathname;
		let url = location_pathname + location_search;

		$("#pop_alarm_msg").text("로그인 후 이용해 주세요.");
		$(".popup_message_type_1").css("display","block");
		$("#black").css("display","block");

		$(".one_btn").on("click", function () {
			location.href="/access/login?url=" + url;
		});
		// setTimeout(function() { location.href="/access/login";}, 1000);

		return false;
	}
	return true;
}

function priceToNumber(strNum) {
    return Number(strNum.replace(/[^0-9.-]+/g,""));
}

function numberToPrice(num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
}
function js_login_check(){
	var rtn_login_check = true;		
	if ("${loginInfo}" == ""){
		$("#pop_alarm_msg").text("로그인 후 이용해 주세요.");
		$(".popup_message_type_1").css("display","block");
		$("#black").css("display","block");
		rtn_login_check = false;
	};
	return rtn_login_check;				
}
function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

function scrollAnchor(id){
	var headHeight = $("#header .hd_wrap").height();
	var anchorTop = $("#"+id).offset().top;
	var thisTop = anchorTop - headHeight;
	$("html, body").stop().animate({
		scrollTop : thisTop
	}, 300);
	
}

/* naver log start */

/*
	type  - 전환 유형 값
	value - 전환 가치 (기본값 "1")

	---

	전환 유형 타입
	1 - 구매 완료 페이지
	2 - 화원 가입 완료 페이지
	3 - 장바구니 페이지
	4 - 신청/예약 완료 페이지
	5 - 기타 페이지

 */

function ad_log_naver(type, value) {
	// var _nasa={};
	// if (window.wcs) _nasa["cnv"] = wcs.cnv(type, value);
	//
	// if(!wcs_add) var wcs_add = {}; wcs_add["wa"] = "s_263efe277b";
	// // if (!_nasa) var _nasa={};
	// if (window.wcs) {
	// 	// wcs.inflow("medivalue.co.kr"); wcs_do(_nasa);
	// 	let host_url = "medivalue.co.kr";
	// 	// let host_url = window.location.host;
	// 	wcs.inflow(host_url);
	// 	wcs_do(_nasa);
	// }
}

/* naver log end */

/* google tag manager start */

function labbit_view_item(value) {

	let company_info = value['brand'];
	if (company_info === '' || company_info === null) {
		company_info = 'NA';
	}

	let view_event = {
		'event': 'labbit_view_item',
		'ecommerce': {
			'detail': {
				'products': [{
					'name': value['name'],
					'id': value['id'],
					'price': value['price'],
					'category': value['category'],
					'brand': company_info
				}]
			}
		}
	}
	window.dataLayer.push(view_event);
}

function labbit_add_to_cart(value) {
	let productList = [];
	for (let pdx = 0; pdx < value.length; pdx++) {
		let pd = value[pdx];
		let company_info = pd['fd_company_info'];
		if (company_info === '' || company_info === null) {
			company_info = 'NA';
		}
		let product = {
			'name': 	pd['fd_product_name'],
			'id': 		pd['pk_idx'],
			'price': 	pd['shop_product_amount'],
			'category': pd['cate_1_name'] + "/" + pd['cate_2_name'],
			'quantity': pd['fd_cnt'],
			'variant':	pd['fd_product_standard'],
			'brand':	company_info
		}
		productList.push(product);
	}

	let cart_event = {
		'event': 'labbit_add_to_cart',
		'ecommerce': {
			'add': { 'products': productList}
		}
	}

	window.dataLayer.push(cart_event);
}

function labbit_begin_checkout(value) {
	let productList = [];

	if (value !== '') {

		let totalPrice = 0;

		for (let pdx = 0; pdx < value.length; pdx++) {
			let pd = value[pdx];
			let company_info = pd['fd_company_info'];
			if (company_info === '' || company_info === null) {
				company_info = 'NA';
			}

			let product = {
				'name': 	pd['fd_product_name'],
				'id': 		pd['fk_tpsm_idx'],
				'price': 	pd['shop_sale_amount'],
				'category': pd['cate_1_name'] + "/" + pd['cate_2_name'],
				'quantity': pd['fd_cnt'],
				'variant':	pd['fd_product_standard'],
				'brand': 	company_info
			};
			productList.push(product);
			totalPrice += parseInt(pd['shop_sale_amount']) * parseInt(pd['fd_cnt']);
		}

		let actionField = {
    		'revenue': totalPrice
		}

		let checkout_event = {
			'event': 'labbit_begin_checkout',
			'ecommerce': {
				'checkout': {
				 	'actionField': actionField,
					'products': productList
				}
			}
		}

		window.dataLayer.push(checkout_event);
	}

}

function labbit_purchase(auction, value) {

	let productList = [];

	if (value !== '') {
		let auctionField = {
			'id': 			auction.fd_order_id,
			'revenue': 		auction.fd_total_payment,
			'shipping':		auction.fd_delivery_fee
		}

		for (let pdx = 0; pdx < value.length; pdx++) {
			let pd = value[pdx];
			let company_info = pd['fd_company_info'];
			if (company_info === '' || company_info === null) {
				company_info = 'NA';
			}

			let product = {
				'name': 	pd['fd_product_name'],
				'id': 		pd['fk_tpsm_idx'],
				'price': 	pd['shop_sale_amount'],
				'category': pd['cate_1_name'] + "/" + pd['cate_2_name'],
				'quantity': pd['fd_cnt'],
				'variant':	pd['fd_product_standard'],
				'brand': 	company_info
			};
			productList.push(product);
		}

		let purchase_event = {
			'event': 'labbit_purchase',
			'ecommerce': {
				'purchase': {
					'actionField': auctionField,
					'products': productList
				}
			}
		}
		window.dataLayer.push(purchase_event);
	}


}
/* google tag manager end */

/*헤더 리뉴얼 추가 스크립트 START*/
function focusQuickSearch(){
    $("#header .btm .area .real_area .left .sch_box form .form_cont input[type='text']").focus();
}

function onChatTalk(){
	/*$("#ch-plugin #ch-plugin-core > div").click();*/
	ChannelIO('showMessenger');
};

// 상단 메뉴 바 검색시 추천 검색어
function quickSearchKeyword(e){
    const input = $(e);
    if(input.val() == ""){
        input.parent().removeClass("on");
    }else{
        input.parent().addClass("on");
    }
}
/*헤더 리뉴얼 추가 스크립트 END*/

/*카테고리 추가 스크립트 START*/
function categoryToggle(){
	$("#header .btm .area .real_area .category").toggleClass("on");
	$("#header .sub_category_bg").toggleClass("on");
}
function categoryClose(){
	$("#header .btm .area .real_area .category").removeClass("on");
	$("#header .sub_category_bg").removeClass("on");
}
function categoryHover(){
	$("#header .btm .area .real_area .category .sub_category .depth_1 > ul > li").hover(function(){
		$(this).addClass("on");
		if($(this).children().hasClass("depth_2")){
			$("#header .btm .area .real_area .category .sub_category").addClass("extend");
		}
	}, function(){
		$(this).removeClass("on");
		$("#header .btm .area .real_area .category .sub_category").removeClass("extend");
	});
}
/*카테고리 추가 스크립트 END*/

/*헤더 상단 배너 닫기 버튼 START*/ 
function closeTopBanner(){
	var headWrapH = $("#header .hd_wrap").height();
	var headBannerH = $("#header .banner_wrap").height();
	var headH = headWrapH - headBannerH;
    $("#header .banner_wrap").stop().animate({
        "height":"0"
    }, 300);
    $("section.main, section.sub").stop().animate({
		"padding-top":headH
	}, 300);

}
/*헤더 상단 배너 닫기 버튼 END*/


/**
* 공통 알림 팝업 기본
* - 적용 중인 페이지
* 1. 100원 이벤트 페이지 (/event/first_order)
* 2. 쿠폰/포인트 페이지 (/coupon/list)
*/
function layerAlert(txt, func, cancel){
    $(".layer_alert .cont .body .txt").text(txt);
    $(".layer_alert .cont .foot .btn_ok").attr("onclick", func);
    if(cancel == "y"){
        $(".layer_alert").addClass("confirm");
    }else{
        $(".layer_alert").removeClass("confirm");
    }
    $(".layer_alert").addClass("on");
}

/**
* 공통 알림 팝업 닫기
* - 적용 중인 페이지
* 1. 100원 이벤트 페이지 (/event/first_order)
* 2. 쿠폰/포인트 페이지 (/coupon/list)
*/
function layerAlertClose(){
    $(".layer_alert").removeClass("on");
}


/*공통 팝업 Hide*/
const closePopup = (e)=> {
    $(e).parents(".comm_popup").removeClass("on");
}

/*공통 팝업 Show*/
const showCommPopup = (e)=> {
    $(".comm_popup."+e).addClass("on");
}

/*공통 팝업 Show (팝업에서 팝업 오픈 시 기존 열린 팝업 닫기)*/
const showHideCommPopup = (e)=> {
    $(".comm_popup").removeClass("on");
    $(".comm_popup."+e).addClass("on");
}

const toggleAiPopupAcc = (e)=>{
    $(e).toggleClass("on");
}

const notiSideShow = ()=> {
    $(".notification_wrap").addClass("on");
}

const notiSideHide = ()=> {
    $(".notification_wrap").removeClass("on");
}

const notiSideTabHandler = (e)=> {
    $(".notification_wrap .noti_tab > ul > li").removeClass("on");
    $(e).parents("li").addClass("on");
}