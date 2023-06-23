$(function(){
    $(".input_btn_wrap label").click(function(){
        validationClick(this);
    });

    $(".input_txt_wrap input").keyup(function(){
        validationKeyup(this);
        outputToInput(this);
    });

    $(".sec_common article:last-child ")

    progressCommon();
    slickCommon();
});

function outputToInput(e){
    const inp_val = $(e).val();
    const inp_nth = $(e).parents("li").index();
    $(".input_txt_wrap.confirm li").eq(inp_nth).find(".output").text(inp_val);
}

function validationClick(e){
    let servey_this = $(e);
    let servey_atc = servey_this.parents("article");
    let servey_length = servey_atc.find("input:checked").length;
    if(servey_length != 0){
        servey_atc.addClass("ready");
        $(".sec_common").slick("slickNext");
    }else{
        servey_atc.removeClass("ready");
    }
    if(servey_atc.is(":last-child")){
        // location.href='/sample/sidex_survey_complete';
        // let formData = $("#survey_form").serialize();
        //
        // $.ajax({
        //     url: "/survey/rest/save",
        //     method: "POST",
        //     data: formData,
        //     success: function (data) {
        //         console.log(data);
        //     }
        // })

    }
}

function validationKeyup(e){
    let servey_this = $(e);
    let servey_atc = servey_this.parents("article");
    let servey_input = servey_atc.find(".input_txt_wrap li input");
    servey_input.each(function(){
        if($(this).val() == ""){
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

function validationAgree(e){
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

function nextSlideBtn(){
    $(".sec_common").slick("slickNext");
}

function agreeYesBtn(){
    $(".sec_common .agree_wrap input[type='checkbox']").prop("checked", true);
    $(".sec_common").slick("slickNext");
    $(".layer_popup").removeClass("on");
}

function agreeNoBtn(){
    $(".sec_common").slick("slickNext");
    $(".layer_popup").removeClass("on");
}

function progressBar(){
    $(".button_wrap .btn_next").click(function(){
        if($("section.on").hasClass("sec_before")){

        }else if($("section.on").hasClass("sec_after")){

        }
    });
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
    });
}

function closePopup(e){
    $(e).parents(".layer_popup").removeClass("on");
}