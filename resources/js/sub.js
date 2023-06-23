$(document).ready(function (){
	var placeholderTarget = $(".form_cont input[type=text], .form_cont textarea");
 
    placeholderTarget.focus(function(){
        $(this).siblings("label").fadeOut("fast");
    });
 
    placeholderTarget.focusout(function(){
        if($(this).val() == ""){
            $(this).siblings("label").fadeIn("fast");
        }
    });
	
	setTimeout(function() {
		$("#sub10 .cnt2").addClass("active");
	}, 500);


	var $c3tabBtn=$("#sub10 .cnt3 .area .real_area .left .detail_info .info_split .info_btn");
	var $floatingBox=$("#sub10 .cnt3 .area .real_area .right .floating_box");
	var $fullview=$("#sub10 .cnt3 .area .real_area .left .detail_info .info_split .info_cnt > div .full_view");
	var $menu=$("#sub10 .cnt3 .area .real_area .left .detail_info .info_split .info_btn_area .info_btn li");
	var $cnt=$("#sub10 .cnt3 .area .real_area .left .detail_info .info_split .info_cnt > div .detail_info1 .depth1 > li");
	var $pdetWish=$("#sub10 .cnt1 .area .real_area .wrap .right .btn_wrap .wish_btn");
	var $flotingWish=$("#sub10 .cnt3 .area .real_area .right .floating_box .btn_wrap .btn_wrap_top  .wish_btn");

	$flotingWish.on("click", function  () {
		if ($(this).hasClass("on")) {
			$(this).removeClass("on");
		}else {
			$(this).addClass("on");
		}
	});

	$pdetWish.on("click", function  () {
		if ($(this).hasClass("on")) {
			$(this).removeClass("on");
		}else {
			$(this).addClass("on");
		}
	});

	function subInfo () {
		$fullview.on("click", function  () {
			$(this).css("display","none").prev().css("height","100%");
		});

		$menu.children().on("click", function  () {
			var tg=$(this).attr("href");
			var posY2=$(tg).offset().top-224;	

			$("html, body").animate({scrollTop:posY2}, function  () {
				$(window).on("scroll", scrollMove);
				$c3tabBtn.css({"position":"fixed","top":"159px","z-index":"50"});
				$floatingBox.css({"position":"fixed","top":"159px","z-index":"50"});
				$(this).parent().addClass("on").siblings().removeClass("on");
			})

			return false;
		});
	}
	subInfo();

	function scrollMove () {
		var scrollY2=$(window).scrollTop();

		$cnt.each(function  (idx) {
			if (scrollY2>=$(this).offset().top-67) $menu.eq(idx).addClass("on").siblings().removeClass("on");
			else if (scrollY2==$(document).height()-$(window).height())$menu.eq(idx).addClass("on").siblings().removeClass("on");
		});
	}

	function subp () {
		$(window).on("scroll", function  () {			
			if($("#sub10").length>0){
				var scrollY=$(this).scrollTop();
				var posY=$("#sub10 .cnt3").offset().top-159;
				var subC4Y=$("#sub10 .cnt4").offset().top-159;
				var pbH=$floatingBox.outerHeight();
				var pbtg=subC4Y-pbH;
				var tbtg=subC4Y-67;

				if (scrollY>posY){
					$c3tabBtn.css({"position":"fixed","top":"159px","z-index":"9"});
					$floatingBox.css({"position":"fixed","top":"159px","z-index":"9"});
				}else {
					$c3tabBtn.css({"position":"static"});
					$floatingBox.css({"position":"static"});
				}

				if (scrollY>pbtg) {
					$floatingBox.css({"position":"absolute","top":"auto","bottom":"0"});
				}

				if (scrollY>tbtg) {
					$c3tabBtn.css({"position":"absolute","top":"auto","bottom":"0"});
				}
				scrollMove();
			}
		});
		
		$(window).on("resize",function  () {
			if($("#sub10").length>0){
				var hei=$(this).outerHeight()-159;
				var fixWrapH=$("#sub10 .cnt3 .area .real_area .right .floating_box .fix_wrap").outerHeight()
	
				$("#sub10 .cnt3 .area .real_area .right .floating_box").css("height",hei);
				$("#sub10 .cnt3 .area .real_area .right .floating_box .auto_wrap").css("height",hei-fixWrapH-37)
			}
		});
		$(window).trigger("resize");
	}
	subp();
});