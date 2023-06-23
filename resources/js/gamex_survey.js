$(function(){
    $(".input_btn_wrap label").click(function(){
        validationClick(this);
    });

    $(".input_txt_wrap input").keyup(function(){
        validationKeyup(this);
    });

    $(".input_btn_wrap label input[type='checkbox']").change(function(){
        validationMax3(this);
    });
    progressCommon();
    slickCommon();
    telMin4Input();
    telAutoFocus();
    // slickBefore();
    // slickAfter();
});

// function nextSection(){
//     $("section").removeClass("on");
//     let rdo_section = $("input[name='rdo_00']:checked").val();
//     if(rdo_section == "1"){
//         $(".sec_before").addClass("on");
//         progressBefore();
//         slickBefore();
//     }else{
//         $(".sec_after").addClass("on");
//         progressAfter();
//         slickAfter();
//     }
// }

function validationClick(e){
    let servey_this = $(e);
    let servey_atc = servey_this.parents("article");
    let servey_length = servey_atc.find("input:checked").length;
    if(servey_length != 0){
        servey_atc.addClass("ready");
    }else{
        servey_atc.removeClass("ready");
    }
    // if(servey_atc.is(":last-child")){
    //     location.href='/resources/gamex_survey_complete.html';
    // }
}

function validationKeyup(e){
    let servey_this = $(e);
    let servey_atc = servey_this.parents("article");
    let servey_input = servey_atc.find(".input_txt_wrap li input");
    servey_input.each(function(){
        if($(this).val() == "" || $(".inp_tel_1").val().length < 3 || $(".inp_tel_2").val().length < 4){
            servey_atc.removeClass("ready");
            return false;
        }else{
            servey_atc.addClass("ready");
        }
    });
}

function btnInnerText(e){
    let text_this = $(e);
    text_this.parents("label").click();
}

// function prevSectionBtn(e){
//     $("section").removeClass("on");
//     $(".sec_common").addClass("on");
// }
// function nextSectionBtn(e){
//     let this_section = $(e).parents("section");
//     let this_check = this_section.find(".agree_wrap input[type='checkbox']");

//     if(this_check.is(":checked")){
//         if(this_section.hasClass("sec_before")){
//             $(".sec_before").slick("slickNext");
//         }else if(this_section.hasClass("sec_after")){
//             $(".sec_after").slick("slickNext");
//         }
//     }else{
//         $(".layer_popup").addClass("on");
//     }
// }
function validationAgree(e){
    if($.trim($("#fd_username").val()).length ==0){
    	alert("이름을 확인해주세요.")
    	return false;
    }
    let this_section = $(e).parents("section");
    let this_check = this_section.find(".agree_wrap input[type='checkbox']");
    
    if(this_check.is(":checked")){
        $(".sec_common").slick("slickNext");
    }else{
        $(".layer_popup").addClass("on");
    }
}

function prevSlideBtn(){
    $(".sec_common").slick("slickPrev");
}

function nextSlideBtn(e){
	
	let event_area = $(e).parent().parent().find(".input_btn_wrap.answer ");
	let page_state = true;	
	if(event_area.length>0){
		$(event_area.find("input:checkbox")).each(function(){
			if($(this).is(":checked")==true){
				if($(this).val()=="기타"){
					if($.trim($(this).parent().find(".inp_etc").val())==''){
						page_state = false;
						alert("기타내용을 입력해주세요.");
						return false;
					}
				}
			}
		});		
	}
	if(page_state){
		$(".sec_common").slick("slickNext");
	}
	
    
}

function agreeYesBtn(){
    $(".sec_common .agree_wrap input[type='checkbox']").prop("checked", true);
    $(".sec_common").slick("slickNext");
    $(".layer_popup").removeClass("on");
}

function agreeNoBtn(){
    //$(".sec_common").slick("slickNext");
    $(".layer_popup").removeClass("on");
}

function slickCommon(){
    $(".sec_common").slick({
        infinite: false,
        arrows : false,
        dots: false,
        slidesToShow: 1,
        slidesToScroll: 1,
        speed: 300,
        autoplay: false,
        fade: true,
        swipe: false,
        cssEase: 'ease-out',
    });
}

function progressCommon(){
    $('.sec_common').on('init afterChange', function(event, slick, currentSlide, nextSlide){
        let progress = $("nav .progress .progress_bar");
        let percent = $("nav .percent");
        let total = slick.slideCount;
        let current = (currentSlide ? currentSlide : 0) + 1;
        let progress_width = 100 * (current / total);
        let progress_width_rount = Math.round(progress_width);
        progress.css("width", progress_width+"%");
        percent.text(progress_width_rount+"%");

        const slickCurrent = $("article.slick-current");
        if(slickCurrent.hasClass("nav_hide")){
            $("nav").addClass("off");
        }else{
            $("nav").removeClass("off");
        }

    });
}

function closePopup(e){
    $(e).parents(".layer_popup").removeClass("on");
}

function telAutoFocus(){
    $(".inp_tel").keyup(function(){
        if($(this).val().length >= 4){
            $(this).next().focus();
            if($(this).is(":last-child")){
                $(this).parents("li").next("li").find("input").focus();
            }
        }
    });
}

function telMin4Input(){
    $(".inp_tel_1").keyup(function(){
        if($(this).val().length >= 3){
            $(".inp_tel_2").prop("readonly", false);
        }else{
            $(".inp_tel_2").prop("readonly", true);
        }
    })
}

// slide index = 1 > 다음 클릭 시 - 개원여부
function goToNextSlideBtnForkOpen(e){    
    $(".sec_common").slick("slickNext");
	/*
    const rdoNotOpen = $(".rdo_not_open");
    if(rdoNotOpen.is(":checked")){
        goToNextSlideBtn(e);        
    }else{    
        $(".sec_common").slick("slickNext");
    }
    */
}

// slide index = 6 > 이전 클릭 시 - 개원여부
function goToPrevSlideBtnForkOpen(e){
    const rdoNotOpen = $(".rdo_not_open");
    if(rdoNotOpen.is(":checked")){
        goToPrevSlideBtn(e);
    }else{
        $(".sec_common").slick("slickPrev");
    }
}

// slide index = 2 > 다음 클릭 시 - 메디밸류구매여부
function goToNextSlideBtnFork(e){
    const chkMedval = $(".chk_medivalue");       
    let page_state = true;
    $("input[name='answer_2']").each(function(){    	
    	if($(this).is(":checked")==true){
    		if($(this).val()=='기타'){
    			if($.trim($("input[name='fd_answer_2_text']").val())==''){
    				alert("기타내용을 입력해주세요.");
    				//$("input[name='fd_answer_2_text']").focus();
    				page_state = false;
    				return false;
    			}
    		}
    	}
    });
    
    if(page_state){
    	if(chkMedval.is(":checked")){
            $(".sec_common").slick("slickNext");
        }else{
            // goToSlideBtn(4);
            goToNextSlideBtn(e);
        }
    }
    
}

// slide index = 5 > 이전 클릭 시
function goToPrevSlideBtnFork(e){
    const chkMedval = $(".chk_medivalue");
    let page_state = true;
    $("input[name='answer_3']").each(function(){    	
    	if($(this).is(":checked")==true){
    		if($(this).val()=='기타'){
    			if($.trim($("input[name='fd_answer_3_text']").val())==''){
    				alert("기타내용을 입력해주세요.");
    				//$("input[name='fd_answer_3_text']").focus();
    				page_state = false;
    				return false;
    			}
    		}
    	}
    });
    if(page_state){
	    if(chkMedval.is(":checked")){
	        // goToSlideBtn(3);
	        goToPrevSlideBtn(e);
	    }else{
	        $(".sec_common").slick("slickPrev");
	    }
    }
}

// slide index = 3 > 다음 클릭 시
function goToNextSlideBtn(e){
    const thisAtc = $(e).parents("article");
    const idx = thisAtc.index();
    let goToSlideNumber = "";
    if(idx == 2){
        goToSlideNumber = idx + 2;
    }else if(idx == 3){
        goToSlideNumber = idx + 2;
    }else if(idx == 1){
        goToSlideNumber = idx + 5;
    }
    $(".sec_common").slick("slickGoTo", goToSlideNumber);
}

// slide index = 4 > 이전 클릭 시
function goToPrevSlideBtn(e){
    const thisAtc = $(e).parents("article");
    const idx = thisAtc.index();
    let goToSlideNumber = "";
    if(idx == 4){
        goToSlideNumber = idx - 2;
    }else if(idx == 6){
        goToSlideNumber = idx - 5;
    }else if(idx == 5){
        goToSlideNumber = idx - 2;
    }
    $(".sec_common").slick("slickGoTo", goToSlideNumber);
}

// slide 바로 가기
function goToSlideBtn(e){
    $(".sec_common").slick("slickGoTo", e);
}

// 최대 3개 선택 가능
function validationMax3(e){
    const limit = 3;
    const thisAtc = $(e).parents(".validationMax3");
    const checked = thisAtc.find(".input_btn_wrap input[type='checkbox']:checked").length;
    if(checked > limit){
        e.checked = false;
    }
}

// 기타 입력 해제 버튼 클릭 시
function etcUncheckBtn(e){
    const thisLabel = $(e).parents("label");
    const thisChkBox = thisLabel.find("input[type='checkbox']");
    const thisText = $(e).siblings(".inp_etc");
    thisChkBox.prop("checked", false);
    thisText.val(""); // 텍스트 내용 삭제
}