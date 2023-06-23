$(document).ready(function (){
	var $fullView=$(".sub .cnt1 .area .real_area .left_filter .wrap ul.depth1 > li .d2_wrap > .full_view");
	var $moreView=$(".sub .cnt1 .area .real_area .left_filter .wrap ul.depth1 > li .d2_wrap > .more_view");
	var $filtpuClose=$(".sub .cnt1 .area .real_area .left_filter .wrap ul.depth1 > li .d2_wrap .filt_popup .filter_pu_close button");
	var $upDown=$(".sub .cnt1 .area .real_area .left_filter .wrap ul.depth1 > li .filter_tit .updown");
	//var $s12cpBtn=$(".sub .cnt1 .area .real_area .left_filter .wrap .comments_write button");
	//var $s12cpClose=$(".sub .cnt1 .area .real_area .left_filter .wrap .comm_popup .cp_tit .cp_close");
	var $leftFilter=$(".sub .cnt1 .area .real_area .left_filter .wrap ul.depth1 > li .d2_wrap .depth2 li input[type='checkbox']");
	var $filtDelete=$(".sub .cnt1 .area .real_area .right_cnt .choice_filter .ch_filt_wrap .ch_filt button");
	var $resetBtn=$(".sub .cnt1 .area .real_area .right_cnt .choice_filter .reset_btn");
	var $liength1=$(".sub .cnt1 .area .real_area .left_filter .wrap .depth1 > .filter_1 .d2_wrap .depth2 li").length;
	var $liength2=$(".sub .cnt1 .area .real_area .left_filter .wrap .depth1 > .filter_2 .d2_wrap .depth2 li").length;
	var $liength3=$(".sub .cnt1 .area .real_area .left_filter .wrap .depth1 > .filter_3 .d2_wrap .depth2 li").length;
	var $liength4=$(".sub .cnt1 .area .real_area .left_filter .wrap .depth1 > .filter_4 .d2_wrap .depth2 li").length;
	var $liength5=$(".sub .cnt1 .area .real_area .left_filter .wrap .depth1 > .filter_5 .d2_wrap .depth2 li").length;
	var $liength6=$(".sub .cnt1 .area .real_area .left_filter .wrap .depth1 > .filter_6 .d2_wrap .depth2 li").length;
	var $wishBtn=$(".sub .cnt1 .area .real_area .right_cnt .pd_list .pd_list_txt ul > li .price_info .wish_btn");
	var $cartBtn=$(".sub .cnt1 .area .real_area .right_cnt .pd_list .pd_list_txt ul > li .price_info .btn_wrap .cart_btn");
	//var $s11cpBtn=$("#sub1_1 .cnt2 .area .real_area .tit .comments");
	//var $s11cpClose=$("#sub1_1 .cnt2 .area .real_area .tit .comm_popup .cp_tit .cp_close");

	$(window).on("resize",function  () {
		var subc1H=$(".sub .cnt1").outerHeight();
		var $leftFilter2=$(".sub .cnt1 .area .real_area .left_filter");
		
		$leftFilter2.css("height",subc1H);
	});
	$(window).trigger("resize");

	$fullView.on("click", function  () {
		$(this).next().css("display","block")
	});

	$moreView.on("click", function  () {
		$(this).css("display","none").prev().stop().animate({"height":"100%"})
	});

	$filtpuClose.on("click", function  () {
		$(this).closest(".filt_popup").css("display","none")
	});

	$upDown.on("click", function  () {
		if ($(this).parents("li").hasClass("on")) {
			$(this).parents("li").removeClass("on").find(".updown img").css({"transform":"rotate(0deg)"});
			$(this).parents("li").css("padding-bottom","8px").find(".d2_wrap").stop().slideDown();
		}else {
			$(this).parents("li").addClass("on").find(".updown img").css({"transform":"rotate(180deg)"});
			$(this).parents("li").css("padding-bottom","7px").find(".d2_wrap").stop().slideUp();
		}
	});
	/*
	$s12cpBtn.on("click", function  () {
		//$(this).parent().next().css("display","block");
		$("#search_write").css("display","block");
		$("#black").css("display","block");
		$("#req_write_searchText").val($("#searchString").val());
		if($("#searchString").val().trim().length==0){
			$("#req_write_searchText").attr("readonly", false);
		}
	});
	
	$s12cpClose.on("click", function  () {
		//$(this).parents(".comm_popup").css("display","none");
		$("#search_write").css("display","block");
		$("#black").css("display","none");
	});
	
	$resetBtn.on("click", function  () {
		$leftFilter.prop("checked",false);
		$(".choice_filter").css("display","none")
	});
	*/

	/*
	$leftFilter.change(function(){
		if($(this).is(":checked")){
			$(".sub .choice_filter").css("display","block")
			$(".sub .cnt1 .area .real_area .right_cnt .asso").css("display","none")
		}else{
			$(".sub .choice_filter").css("display","none")
			$(".sub .cnt1 .area .real_area .right_cnt .asso").css("display","block")
		}
	});
	*/

	$filtDelete.on("click", function  () {
		$(this).parent().css("display","none")
	});
	/*
	if ($liength1> 3) {
		$(".filter_1 .more_view").css("display","none").next().css("display","block");
	}else if ($liength1>7) {
		$(".filter_1 .more_view").css("display","block").next().css("display","none");
	}

	if ($liength2>7) {
		$(".filter_2 .more_view").css("display","none").next().css("display","block");
	}else {
		$(".filter_2 .more_view").css("display","block").next().css("display","none");
	}

	if ($liength3>7) {
		$(".filter_3 .more_view").css("display","none").next().css("display","block");
	}else {
		$(".filter_3 .more_view").css("display","block").next().css("display","none");
	}

	if ($liength4>7) {
		$(".filter_4 .more_view").css("display","none").next().css("display","block");
	}else {
		$(".filter_4 .more_view").css("display","block").next().css("display","none");
	}

	if ($liength5>7) {
		$(".filter_5 .more_view").css("display","none").next().css("display","block");
	}else {
		$(".filter_5 .more_view").css("display","block").next().css("display","none");
	}

	if ($liength6>7) {
		$(".filter_6 .more_view").css("display","none").next().css("display","block");
	}else {
		$(".filter_6 .more_view").css("display","block").next().css("display","none");
	}
	*/

	$wishBtn.on("click", function  () {
		if ($(this).hasClass("on")) {
			$(this).removeClass("on")
		}else {
			$(this).addClass("on")
		}
	});

	$cartBtn.on("click", function  () {
		if ($(this).hasClass("on")) {
			$(this).removeClass("on")
		}else {
			$(this).addClass("on")
		}
	});

	/*
	$s11cpBtn.on("click", function  () {
		$("#search_write").css("display","block");
		$("#black").css("display","block");
		$("#req_write_searchText").val($("#searchString").val());
		if($("#searchString").val().trim().length==0){
			$("#req_write_searchText").attr("readonly", false);
		}
	});

	$s11cpClose.on("click", function  () {
		$("#search_write").css("display","none");
		
		$("#black").css("display","none");
	});
	*/
});