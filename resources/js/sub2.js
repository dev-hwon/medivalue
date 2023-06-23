$(document).ready(function (){
	function subComm () {
		$(".all_chk_cb").click(function(){
			if($(".all_chk_cb").prop("checked")){
				$("input[name=acc]").prop("checked",true);
			}else{
				$("input[name=acc]").prop("checked",false);
			}
		})

		$("#saleChk1").click(function(){
			if($("#saleChk1").prop("checked")){
				$("input.spc").prop("checked",true);
			}else{
				$("input.spc").prop("checked",false);
			}
		})

		$("#nomChk1").click(function(){
			if($("#nomChk1").prop("checked")){
				$("input.npc").prop("checked",true);
			}else{
				$("input.npc").prop("checked",false);
			}
		})
	}
	subComm();

	function s21 () {
		var $spChange=$("#sub2_1 .cnt1 .area .real_area .right_summ .ship_info .ship_change");
		var $spClose=$("#sub2_1 .cnt1 .area .real_area .right_summ .ship_info .ship_change_popup .sc_tit .sc_close");
		var $spModi=$("#sub2_1 .cnt1 .area .real_area .right_summ .ship_info .ship_change_popup .sc_txt > ul > li.sc_txt2 .sc_modi > button");
		var $spModiClose=$("#sub2_1 .cnt1 .area .real_area .right_summ .ship_info .sc_modi_popup .sm_tit .sm_close");
		var $cartUp=$("#sub2_1 .cnt1 .area .real_area .left_cart_list .cart_pd .cart_pd_tit p button");
		var $qbPlus=$("#sub2_1 .cnt1 .area .real_area .left_cart_list .cart_pd .cart_pd_list ul li .quan_box .plus");
		var $qbMinus=$("#sub2_1 .cnt1 .area .real_area .left_cart_list .cart_pd .cart_pd_list ul li .quan_box .minus");
		var $deleteBtn=$("#sub2_1 .cnt1 .area .real_area .left_cart_list .all_chk_wrap .chc_delete button");

		$deleteBtn.on("click", function  () {
			// $("#sub2_1 .cnt1 .area .real_area .left_cart_list .cart_pd .cart_pd_list ul li input:checkbox[name='acc']:checked").parents("li").css("display","none");
			// $("#sub2_1 .cnt1 .area .real_area .left_cart_list .all_chk_wrap .all_chk .all_chk_cb").prop("checked", false);
			// $("#sub2_1 .cnt1 .area .real_area .left_cart_list .cart_pd .cart_pd_tit .spc").prop("checked", false);
			// $("#sub2_1 .cnt1 .area .real_area .left_cart_list .cart_pd .cart_pd_tit .npc").prop("checked", false);
			// $("#sub2_1 .cnt1 .area .real_area .left_cart_list .all_chk_wrap .all_chk input[type='checkbox'] + label span").css("display","none")
		});
		
		$spChange.on("click", function  () {
			$(this).next().css("display","block");
			$("#black").css("display","block");
		});

		$spClose.on("click", function  () {
			$(this).closest(".ship_change_popup").css("display","none");
			$("#black").css("display","none");
		});

		$spModi.on("click", function  () {
			$(this).closest(".ship_change_popup").css("display","none").next(".sc_modi_popup").css("display","block");
		});

		$spModiClose.on("click", function  () {
			$(this).closest(".sc_modi_popup").css("display","none");
			$spClose.click()
		});

		$cartUp.on("click", function  () {
			if ($(this).hasClass("on")) {
				$(this).removeClass("on").closest(".cart_pd_tit").next().find("ul").stop().slideDown();
				$(this).children().css({"transform":"scaleY(1)"});
			}else {
				$(this).addClass("on").closest(".cart_pd_tit").next().find("ul").stop().slideUp();
				$(this).children().css({"transform":"scaleY(-1)"});
			}
		});

		// $qbPlus.on("click", function  () {
		// 	var n =$qbPlus.index(this);
		// 	var num = $(".num:eq("+n+")").val();
		// 	num = $(".num:eq("+n+")").val(num*1+1);
		// 	var $ccc2= $(this).prev().find(".num").val();
		//
		// 	if ($ccc2>1) {
		// 		$qbMinus.css("color","#232323")
		// 	}else {
		// 		$qbMinus.css("color","#b2b2b2")
		// 	}
		// });
		//
		// $qbMinus.click(function(){
		// 	var n = $qbMinus.index(this);
		// 	var num = $(".num:eq("+n+")").val();
		// 	num = $(".num:eq("+n+")").val(num*1-1);
		// 	var $ccc= $(this).next().find(".num").val();
		//
		// 	if ($ccc<1) {
		// 		alert("최소 수량은 1개 입니다.");
		// 		$(this).next().find(".num").val(1);
		// 	}
		//
		// 	if ($ccc>1) {
		// 		$qbMinus.css("color","#232323")
		// 	}else {
		// 		$qbMinus.css("color","#b2b2b2")
		// 	}
		// });
	}
	s21();

	function s22 () {
		var $oitBtn=$("#sub2_2 .cnt2 .area .real_area .depth1 li .order_info_tit > button");
		var $oitClose=$("#sub2_2 .cnt2 .area .real_area .depth1 li .order_info_tit .oit_popup .oit_popup_wrap .oit_close");
		var $optBtn=$("#sub2_2 .cnt1 .area .real_area .order_pd .order_pd_tit button");
		var $rdo1=$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li2 .order_info_txt .depth2 li.oit_1 .chk_wrap > div input[type='radio']");
		var $rdo2=$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li3 .order_info_txt ul li.oit_1 .chk_wrap > div input[type='radio']");
		var $payment1=$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li2 .order_info_txt .depth2 li.oit_1 .chk_wrap > div #ex_rd3");
		var $payment2=$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li2 .order_info_txt .depth2 li.oit_1 .chk_wrap > div #ex_rd9");
		var $tax1=$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li3 .order_info_txt ul li.oit_1 .chk_wrap > div #ex_rd5");
		var $sltit=$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li1 .order_info_txt .depth2 li.oit_1 .p_wrap #selectDiv #selectTit");
		var $couponBtn=$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li1 .order_info_txt .depth2 li.oit_1 .p_wrap #selectDiv .coupon_btn");
		var $cpInfo=$("#selectDiv ul li .cp_info");
		var $cpRdo=$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li1 .order_info_txt .depth2 li.oit_1 .p_wrap #selectDiv ul li .cp_rdo");
		var $shipInput=$("#sub2_2 .cnt2 .area .real_area .depth1 li.c2_li2 .order_info_txt .depth2 li.oit_2 .p_wrap_right .pw_2 .form_cont input");
		var $shipRepBtn=$("#sub2_2 .cnt2 .area .real_area .depth1 li.c2_li2 .order_info_txt .depth2 li.oit_2 .p_wrap_right .pw_2 .form_cont .ship_req_btn");
		var $pdcli1W=$("#sub2_2 .cnt3 .area .real_area .right .pd_cost_result .depth1 > li.pd_cost_5 .depth2 li .pdc_li1 .wrap").outerWidth();
		var $s22Real=$("#sub2_2 .cnt3 .area .real_area")
		var $s22Right=$("#sub2_2 .cnt3 .area .real_area .right")
		var $s22Pwrap=$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li2 .order_info_txt .depth2 li.oit_1 .chk_wrap .p_wrap")
		var $s22Oit2=$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li2 .order_info_txt .depth2 li.oit_2")
		var $s22Oit3=$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li2 .order_info_txt .depth2 li.oit_3")
		var $s22Taxinfo=$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li3 .order_info_txt ul li.tax_info_li")
		var $s22Taxmodi=$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li3 .order_info_txt .tax_modi");
		var $termsView=$("#sub2_2 .cnt4 .area .real_area .order_info_txt .chk_wrap .p_wrap button");
		var $termsClose=$("#sub2_2 .cnt4 .area .real_area .order_info_txt .chk_wrap .p_wrap .terms_popup .terms_close, #sub2_2 .cnt4 .area .real_area .order_info_txt .chk_wrap .p_wrap .terms_popup .terms_btn");


		$termsView.on("click", function  () {
			$(this).next().css("display","block");
			$("#black").css("display","block");
		});

		$termsClose.on("click", function  () {
			$(this).parent().css("display","none");
			$("#black").css("display","none");
		});

		$("#black").on("click", function  () {
			$termsClose.click()
		});

		$(window).on("resize",function  () {
			/*var s22C3H=$("#sub2_2 .cnt3 .area .real_area .left .depth1").outerHeight();
			$s22Real.css("height",s22C3H);
			$s22Right.css("height",s22C3H);*/

			$rdo1.change(function(){
				/*var s22C3H=$("#sub2_2 .cnt3 .area .real_area .left .depth1").outerHeight();*/
				if($payment1.is(":checked")){
					$s22Pwrap.css("display","block");
					$s22Oit2.css("display","block");
					$s22Oit3.css("display","none");
					/*$s22Real.css("height",s22C3H);
					$s22Right.css("height",s22C3H);*/
				} else if($payment2.is(":checked")){
					$s22Oit2.css("display","none");
					$s22Oit3.css("display","block");
					/*$s22Real.css("height",s22C3H);
					$s22Right.css("height",s22C3H);*/
				}else{
					$s22Pwrap.css("display","none");
					$s22Oit2.css("display","none");
					$s22Oit3.css("display","none");
					/*$s22Real.css("height",s22C3H);
					$s22Right.css("height",s22C3H);*/
				}
			});

			$rdo2.change(function(){
				/*var s22C3H=$("#sub2_2 .cnt3 .area .real_area .left .depth1").outerHeight();*/

				if($tax1.is(":checked")){
					$s22Taxinfo.css("display","block");
					$s22Taxmodi.css("display","block");
					/*$s22Real.css("height",s22C3H);
					$s22Right.css("height",s22C3H);*/
				}else{
					$s22Taxinfo.css("display","none");
					$s22Taxmodi.css("display","none");
					/*$s22Real.css("height",s22C3H);
					$s22Right.css("height",s22C3H);*/
				}
			});
		});
		$(window).trigger("resize");

		$shipInput.on("input", function  () {
			if ($(this).hasClass("open")) {
				$(this).removeClass("open");
				$("#selectDiv2").css("display","none");
				$shipRepBtn.css("transform","scaleY(1)")
			}
			// else {
			// 	$(this).addClass("open")
			// 	$("#selectDiv2").css("display","block");
			// 	$shipRepBtn.css("transform","scaleY(-1)")
			// }
		});

		$shipInput.on("click", function  () {
			if ($(this).hasClass("open")) {
				$(this).removeClass("open");
				$("#selectDiv2").css("display","none");
				$shipRepBtn.css("transform","scaleY(1)")
			}else {
				$(this).addClass("open")
				$("#selectDiv2").css("display","block");
				$shipRepBtn.css("transform","scaleY(-1)")
			}
		});

		$shipRepBtn.on("click", function  () {
			if ($("#selboxDirect").hasClass("open")) {
				$("#selboxDirect").removeClass("open");
				$("#selectDiv2").css("display","none");
				$shipRepBtn.css("transform","scaleY(1)")
			}else {
				$("#selboxDirect").addClass("open");
				$("#selectDiv2").css("display","block");
				$shipRepBtn.css("transform","scaleY(-1)");
			}
		});

		$("#sub2_2 .cnt2 .area .real_area .depth1 li.c2_li2 .order_info_txt .depth2 li.oit_2 .p_wrap_right .pw_2 .pw_2_wrap #selectDiv2 ul li").on("click", function  () {
			if ($(this).hasClass("ship_req1")) {
				$shipInput.attr("placeholder"," ");
				$shipInput.val(" ");
				$("#selectDiv2").css("display","none");
				$shipRepBtn.css("transform","scaleY(1)");
				$shipInput.removeClass("open").focus()
				$shipRepBtn.removeClass("open")
			}else {
				$shipInput.attr("placeholder",$(this).find("p").text());
				$shipInput.val($(this).find("p").text());
				$("#selectDiv2").css("display","none");
				$shipRepBtn.css("transform","scaleY(1)");
				$shipInput.removeClass("open")
				$shipRepBtn.removeClass("open")
			}
		});

		$oitBtn.on("click", function  () {
			$(this).next().css("display","block")
		});

		$oitClose.on("click", function  () {
			$(this).closest(".oit_popup").css("display","none")
		});

		$optBtn.on("click", function  () {
			if ($(this).hasClass("on")) {
				$(this).removeClass("on").css("transform","scaleY(1)").parent().next().stop().slideUp()
				$("#sub2_2 .cnt1 .area .real_area .order_pd .order_pd_txt").css("display","block");
			}else {
				$(this).addClass("on").css("transform","scaleY(-1)").parent().next().stop().slideDown()
				$("#sub2_2 .cnt1 .area .real_area .order_pd .order_pd_txt").css("display","none");
			}
		});

		$sltit.on("click", function  () {
			if ($(this).hasClass("open")) {
				$(this).removeClass("open").next().slideUp();
				$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li1 .order_info_txt .depth2 li.oit_1 .p_wrap #selectDiv .coupon_btn").css("transform","scaleY(1)")
			}else {
				$(this).addClass("open").next().slideDown();
				$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li1 .order_info_txt .depth2 li.oit_1 .p_wrap #selectDiv .coupon_btn").css("transform","scaleY(-1)")
			}
		});

		$couponBtn.on("click", function  () {
			if ($("#selectTit").hasClass("open")) {
				$("#selectTit").removeClass("open").next().slideUp();
				$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li1 .order_info_txt .depth2 li.oit_1 .p_wrap #selectDiv .coupon_btn").css("transform","scaleY(1)")
			}else {
				$("#selectTit").addClass("open").next().slideDown();
				$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li1 .order_info_txt .depth2 li.oit_1 .p_wrap #selectDiv .coupon_btn").css("transform","scaleY(-1)")
			}
		});

		$cpInfo.on("click", function  () {
			// $(this).prev().find("label").click()
		});

		$cpRdo.on("click", function  () {
			// $("#selectTit p").text($(this).find("label").text());
		});

		$("html").click(function  (e) {
			if(!$(e.target).hasClass("non_tar") && !$(e.target).parent().hasClass("non_tar")) {
				$shipInput.removeClass("open");
				$("#selectDiv2").css("display","none");
				$shipRepBtn.css("transform","scaleY(1)");

				// $sltit.removeClass("open").next().slideUp();
				$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li1 .order_info_txt .depth2 li.oit_1 .p_wrap #selectDiv .coupon_btn").css("transform","scaleY(1)")

				if ($("#selectTit").hasClass("open") && $(e.target).parents("#coupon_select").attr("id") == null) {
					$("#selectTit").removeClass("open").next().slideUp();
					$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li1 .order_info_txt .depth2 li.oit_1 .p_wrap #selectDiv .coupon_btn").css("transform","scaleY(1)")
				}
			}

		});


	}
	s22();


	function s23 () {
		var $s23OitBtn=$("#sub2_3 .cnt2 .area .real_area .order_info_txt .depth1 > li .box button");

		$s23OitBtn.on("click", function  () {
			if ($(this).hasClass("on")) {
				$(this).removeClass("on").css("transform","scaleY(1)").parent().next(".box_detail").stop().slideUp();
			}else {
				$(this).addClass("on").css("transform","scaleY(-1)").parent().next(".box_detail").stop().slideDown();
			}
		});
	}
	s23();
});