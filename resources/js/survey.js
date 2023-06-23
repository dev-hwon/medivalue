$(function(){
    $(".input_btn_wrap label").click(function(){
        validationClick(this);
    });

    $(".input_txt_wrap input").keyup(function(){
        validationKeyup(this);
    });
    progressBefore();
    // slickBefore();
    // slickAfter();
});

function nextSection(){
    $("section").removeClass("on");
    let rdo_section = $("input[name='rdo_00']:checked").val();
    if(rdo_section == "1"){
        $(".sec_before").addClass("on");
        progressBefore();
        slickBefore();
    }else{
        $(".sec_after").addClass("on");
        progressAfter();
        slickAfter();
    }
}

function validationClick(e){
    let servey_this = $(e);
    let servey_atc = servey_this.parents("article");
    let servey_length = servey_atc.find("input:checked").length;
    if(servey_length != 0){
        servey_atc.addClass("ready");
    }else{
        servey_atc.removeClass("ready");
    }
}

function validationKeyup(e){
    let servey_this = $(e);
    let servey_atc = servey_this.parents("article");
    let servey_input = servey_atc.find(".input_txt_wrap li input");

    // servey_input.each(function(){
    //     if($(this).val() == ""){
    //         servey_atc.removeClass("ready");
    //         return false;
    //     }else{
    //         servey_atc.addClass("ready");
    //     }
    // });
}

function btnInnerText(e){
    let text_this = $(e);
    text_this.parents("label").click();
}

function prevSectionBtn(e){
    $("section").removeClass("on");
    $(".sec_common").addClass("on");
}

function check_aggrement(e) {
    let this_section = $(e).parents("section");
    let this_check = this_section.find(".agree_wrap input[type='checkbox']");
    if(this_check.is(":checked")){
        if(this_section.hasClass("sec_before")){
            $(".sec_before").slick("slickNext");
        }else if(this_section.hasClass("sec_after")){
            $(".sec_after").slick("slickNext");
        }
    }else{
        $("#market_agreement").addClass("on");
    }
}

function blur_tel_duplicate(tel) {
    if (tel !== '' && tel.length > 9) {
        $.ajax({
            url: "/survey/rest/tel/duplicate",
            method: "POST",
            data: JSON.stringify({
                "fd_tel": tel
            }),
            contentType: "application/json",
            success: function (data) {
                if (data['rtn_cd'] === '200') {
                    if (Boolean(data['duplicate'])) {
                        $(".notice_popup_txt").text("설문 중복 참여는 불가능해요.");
                        $("#notice_popup").addClass("on");
                        // $("input[name='survey_phone_type_1']").val('');
                        // $("input[name='survey_phone_type_2']").val('');
                    }
                } else {
                    alert(data['rtn_msg']);
                }
            },
            error: function () {
                console.log(error);
            }
        });
    } else {
        $(".notice_popup_txt").text("연락처는 최소 10자리는 입력해주세요.");
        $("#notice_popup").addClass("on");
    }
}

function check_tel_duplicate(tel, e) {
    if (tel !== '' && tel.length > 9) {
        $.ajax({
            url: "/survey/rest/tel/duplicate",
            method: "POST",
            data: JSON.stringify({
                "fd_tel": tel
            }),
            contentType: "application/json",
            success: function (data) {
                if (data['rtn_cd'] === '200') {
                    if (Boolean(data['duplicate'])) {
                        $(".notice_popup_txt").text("설문 중복 참여는 불가능해요.");
                        $("#notice_popup").addClass("on");
                        // $("input[name='survey_phone_type_1']").val('');
                        // $("input[name='survey_phone_type_2']").val('');
                    } else {
                        check_aggrement(e);
                    }
                } else {
                    alert(data['rtn_msg']);
                }
            },
            error: function () {
                console.log(error);
            }
        });
    } else {
        $(".notice_popup_txt").text("연락처는 최소 10자리는 입력해주세요.");
        $("#notice_popup").addClass("on");
    }
}

function nextSectionBtn(e){
    let this_section = $(e).parents("section");
    let this_check = this_section.find(".agree_wrap input[type='checkbox']");

    let servey_atc = $(e).parents("article");
    let servey_input = servey_atc.find(".input_txt_wrap li input");

    let input_check = true;
    servey_input.each(function(index){
        // if ($(this).val() === "" && index < 4) {
        if ($(this).val() === "") {
            input_check = false;
        }
    });

    // if(this_check.is(":checked")){
    //     if(this_section.hasClass("sec_before")){
    //         $(".sec_before").slick("slickNext");
    //     }else if(this_section.hasClass("sec_after")){
    //         $(".sec_after").slick("slickNext");
    //     }
    // }else{
    //     $(".layer_popup").addClass("on");
    // }

    if (input_check) {

        let survey_phone = "";
        if(this_section.hasClass("sec_before")){
            survey_phone = $("input[name='survey_phone_type_1']").val();
        }else if(this_section.hasClass("sec_after")){
            survey_phone = $("input[name='survey_phone_type_2']").val();
        }

        if (survey_phone !== "") {
            check_tel_duplicate(survey_phone, e);
        } else {
            if(this_check.is(":checked")){
                if(this_section.hasClass("sec_before")){
                    $(".sec_before").slick("slickNext");
                }else if(this_section.hasClass("sec_after")){
                    $(".sec_after").slick("slickNext");
                }
            }else{
                $("#market_agreement").addClass("on");
            }
        }


    } else {
        // if(this_section.hasClass("sec_before")){
        //     $(".sec_before").slick("slickNext");
        // }else if(this_section.hasClass("sec_after")){
        //     $(".sec_after").slick("slickNext");
        // }
        $("#input_check").addClass("on");
    }

}

function agreeYesBtn(){
    if($("section.on").hasClass("sec_before")){
        $(".sec_before .agree_wrap input[type='checkbox']").prop("checked", true);
        $(".sec_before").slick("slickNext");
        $("#market_agreement").removeClass("on");
    }else if($("section.on").hasClass("sec_after")){
        $(".sec_after .agree_wrap input[type='checkbox']").prop("checked", true);
        $(".sec_after").slick("slickNext");
        $("#market_agreement").removeClass("on");
    }
}

function agreeNoBtn(){
    if($("section.on").hasClass("sec_before")){
        $(".sec_before").slick("slickNext");
        $("#market_agreement").removeClass("on");
    }else if($("section.on").hasClass("sec_after")){
        $(".sec_after").slick("slickNext");
        $("#market_agreement").removeClass("on");
    }
}

function inputYesBtn(){
    $("#input_check").removeClass("on");
}

function inputNoBtn(){
    $(".sec_before .agree_wrap input[type='checkbox']").prop("checked", false);
    $(".sec_after .agree_wrap input[type='checkbox']").prop("checked", false);
    $("input[name='surven_username_type_1']").val("");
    $("input[name='survey_phone_type_1']").val("");
    $("input[name='survey_email_type_1']").val("");
    $("input[name='survey_licence_number_type_1']").val("");
    $("input[name='surven_username_type_2']").val("");
    $("input[name='survey_phone_type_2']").val("");
    $("input[name='survey_email_type_2']").val("");
    $("input[name='survey_licence_number_type_2']").val("");
    $("input[name='survey_medical_name_type_2']").val("");
    $("input[name='survey_medical_address_type_2']").val("");

    if($("section.on").hasClass("sec_before")){
        $(".sec_before").slick("slickNext");
        $("#input_check").removeClass("on");
    }else if($("section.on").hasClass("sec_after")){
        $(".sec_after").slick("slickNext");
        $("#input_check").removeClass("on");
    }
}

function popUpBtn(){
    $("#notice_popup").removeClass("on");
    $(".notice_popup_txt").text("");
}

function progressBar(){
    $(".button_wrap .btn_next").click(function(){
        if($("section.on").hasClass("sec_before")){

        }else if($("section.on").hasClass("sec_after")){

        }
    });
}

function slickBefore(){
    $(".sec_before").slick({
        infinite: false,
        arrows : true,
        dots: false,
        slidesToShow: 1,
        slidesToScroll: 1,
        speed: 300,
        autoplay: false,
        fade: true,
        swipe: false,
        cssEase: 'ease-out',
        prevArrow: $('.sec_before .slick_btn_wrap .btn_prev'),
        nextArrow: $('.sec_before .slick_btn_wrap .btn_next')
    });
}

function slickAfter(){
    $(".sec_after").slick({
        infinite: false,
        arrows : true,
        dots: false,
        slidesToShow: 1,
        slidesToScroll: 1,
        speed: 300,
        autoplay: false,
        fade: true,
        swipe: false,
        cssEase: 'ease-out',
        prevArrow: $('.sec_after .slick_btn_wrap .btn_prev'),
        nextArrow: $('.sec_after .slick_btn_wrap .btn_next')
    });
}

function progressBefore(){
    $('.sec_before').on('init afterChange', function(event, slick, currentSlide, nextSlide){
        let progress = $("nav .progress .progress_bar");
        let percent = $("nav .percent");
        let total = slick.slideCount;
        let current = (currentSlide ? currentSlide : 0) + 1;
        let progress_width = 100 * (current / total);
        let progress_width_rount = Math.round(progress_width);
        progress.css("width", progress_width+"%");
        percent.text(progress_width_rount+"%");
    });
}

function progressAfter(){
    $('.sec_after').on('init afterChange', function(event, slick, currentSlide, nextSlide){
        let progress = $("nav .progress .progress_bar");
        let percent = $("nav .percent");
        let total = slick.slideCount;
        let current = (currentSlide ? currentSlide : 0) + 1;
        let progress_width = 100 * (current / total);
        let progress_width_rount = Math.round(progress_width);
        progress.css("width", progress_width+"%");
        percent.text(progress_width_rount+"%");
    });
}

function closePopup(e){
    $(e).parents(".layer_popup").removeClass("on");
}


