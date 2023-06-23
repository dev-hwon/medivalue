
let header = $("header");
let main = $(".m_contents");
let position_default_value = $(window).scrollTop();

/** 파라미터값 추출 */
function getParameters(paramName) {
    let returnValue;
    let url = location.href;
    let parameters = url.slice(url.indexOf("?") + 1, url.length).split("&");
    for (let i = 0; i < parameters.length; i++) {
        let varName = parameters[i].split("=")[0];
        if (varName.toUpperCase() == paramName.toUpperCase()) {
            returnValue = parameters[i].split("=")[1];
            return returnValue;
        }
    }
}
/** 파라미터값( moveposition )있으면 이동 */
if (
    getParameters("moveposition") !== null &&
    getParameters("moveposition") !== undefined &&
    getParameters("moveposition") !== ""
) {
    moveTo("." + getParameters("moveposition"), 1000);
}

/** 스크롤업다운체크 */
function scrUpDown() {
    let current_scroll_value = $(window).scrollTop();
    if (current_scroll_value > position_default_value) {
        $("body").addClass("scrDown").removeClass("scrUp");
    } else {
        $("body").addClass("scrUp").removeClass("scrDown");
    }
    position_default_value = current_scroll_value;
}
/** 스크롤막기 */
function scrollDisable() {
    $("body")
        .addClass("scrollDisable")
        .on("touchmove", function (e) {
            e.preventDefault();
        });
}
/** 스크롤허용 */
function scrollAble() {
    $("body").removeClass("scrollDisable").off("touchmove");
}
function fixedHeader() {
    let current_scroll_value = $(window).scrollTop();

    if (current_scroll_value > main.offset().top) {
        header.addClass("fixed_top");
        main.css("padding-top", header.outerHeight());
    } else {
        header.removeClass("fixed_top");
        main.attr("style", "");
    }
}

$(window).on("load scroll", function () {
    fixedHeader();
    scrUpDown();
});

/** 스크롤이동 */
function moveTo(target, speed) {
    let _target = $(target);
    let _targetPos = _target.offset().top - header.outerHeight();
    $("html, body").animate({ scrollTop: _targetPos }, speed ? speed : 600);
}

/** 시트레이어 열기 */
function openSheet(elem) {
    scrollDisable();

    let _target = $(elem);
    _target.before('<div class="sheet_overlay"></div>');
    _target.addClass("active");

    _target.prev().on("click", function () {
        closenSheet(elem);
    });
    $(".btn_closeSheet", _target).on("click", function () {
        closenSheet(elem);
    });
}
/** 시트레이어 닫기 */
function closenSheet(elem) {
    scrollAble();
    let _target = $(elem);
    let _target_overlay = $(".sheet_overlay");
    _target_overlay.fadeOut(function () {
        $(this).remove();
    });
    _target.removeClass("active");
}

/** 일반레이어 열기 */
function openLayer(elem) {
    scrollDisable();

    let _target = $(elem);
    _target.before('<div class="layer_overlay"></div>');
    _target.fadeIn("active");

    _target.prev().on("click", function () {
        closenLayer(elem);
    });
    $(".btn_close_mv_modal", _target).on("click", function () {
        closenLayer(elem);
    });
}
/** 일반레이어 닫기 */
function closenLayer(elem) {
    scrollAble();
    let _target = $(elem);
    let _target_overlay = $(".layer_overlay");
    _target_overlay.fadeOut(function () {
        $(this).remove();
    });
    _target.fadeOut("active");
}

/** alert, confirm, 장바구니담기 */
let mvLayer = {
    timer: 500,
    confirm: function (tx_cont, callback) {
        let _this = this;
        if (tx_cont == null || tx_cont.trim() === "") {
            console.warn("내용누락!");
        } else if (callback == null || typeof callback != 'function') {
            console.warn("콜백함수누락!");
        } else {
            $(document).on("click", ".comm_layer .btn_confirm", function () {
                $(document).off("click", ".comm_layer .btn_confirm").off("click", ".comm_layer .btn_cancel");
                callback(true);
                _this.close($(this));
            });
            $(document).on("click", ".comm_layer .btn_cancel", function () {
                $(document).off("click", ".comm_layer .btn_confirm").off("click", ".comm_layer .btn_cancel");
                callback(false);
                _this.close($(this));
            });
            _this.open('type_confirm', tx_cont);
        }
    },

    alert: function (tx_cont, callback) {
        let _this = this;
        if (tx_cont == null || tx_cont.trim() === "") {
            console.warn("내용누락! ");
        } else {
            $(document).on("click", ".comm_layer .btn_confirm", function () {
                $(document).off("click", ".comm_layer .btn_confirm");
                if( callback ) {
                    callback(true);
                }
                mvLayer.close($(this));
            });
            _this.open("type_alert", tx_cont);
        }
    },

    addCart: function (tx_cont) {
        let _this = this;
        if (tx_cont == null || tx_cont.trim() === "") {
            console.warn("내용누락!");
        } else {
            $(document).on("click", ".comm_layer .btn_confirm", function () {
                $(document).off("click", ".comm_layer .btn_confirm");
                mvLayer.close($(this));
            });
            _this.open("type_addCart", tx_cont);
        }
    },

    open: function (type, tx_cont) {
        let html = '';
        switch(type) {
            case 'type_confirm' :
                html+='<div class="layer_overlay"></div>'
                html+='<div class="comm_layer comm_layer_confirm">'
                html +=     '<div class="lay_body">' + tx_cont +'</div>'
                html +=     '<div class="btn_wrap">'
                html +=         '<button type="button" class="btn_comm btn_gray btn_cancel">최소</button>'
                html +=         '<button type="button" class="btn_comm btn_gray btn_confirm">확인</button>'
                html +=     '</div>'
                html += '</div>'
                break;
            case'type_alert' : {
                html+='<div class="layer_overlay"></div>'
                html+='<div class="comm_layer comm_layer_alert">'
                html +=     '<div class="lay_body">' + tx_cont +'</div>'
                html +=     '<div class="btn_wrap">'
                html +=         '<button type="button" class="btn_comm btn_gray btn_confirm">확인</button>'
                html +=     '</div>'
                html += '</div>'
                break;
            }
            case 'type_addCart' :
                html+='<div class="layer_overlay"></div>'
                html+='<div class="comm_layer comm_layer_confirm">'
                html +=     '<div class="lay_body">' + tx_cont +'</div>'
                html +=     '<div class="btn_wrap">'
                html +=         '<button type="button" class="btn_comm btn_gray btn_confirm">확인</button>'
                html +=         '<a href="#장바구니페이지로이동" class="btn_comm btn_blue btn_move">장바구니 이동</a>'
                html +=     '</div>'
                html += '</div>'
                break;
        }
        $('body').append(html);
        $('.comm_layer').fadeIn(this.timer);
    },

    close: function (target) {
        let layer = $(target).closest(".comm_layer");
        layer.prev().fadeOut(this.timer, function(){ $(this).remove(); })
        layer.fadeOut(this.timer, function(){ $(this).remove(); })
    }
}

/** 공통_툴팁 */
if($('.mv_tooltip').length > 0) {
    $('body').on('click','.mv_tooltip .btn_show_tt', function(){
        let _this = $(this);
        if(_this.next().css('display') !== 'block') {
            let temp = setTimeout(function(){
                _this.next().fadeOut();
            }, 1600);
            _this.next().fadeIn();
        }
    });
}
/** 공통_셀렉트박스클릭시 */
if($('.select_box').length > 0) {
    $("body").on('click', ".select_box .selected", function(){
        let _selectbox = $(this).parents('.select_box');
        if( _selectbox.hasClass('active')) {
            _selectbox.removeClass('active');
        } else {
            _selectbox.addClass('active').siblings().removeClass('active');
        }
    }).on('click', ".select_box button", function(){
        let _value = $(this).val();
        let _selectbox = $(this).parents('.select_box');
        _selectbox.removeClass('active');
        _selectbox.find('.selected').text(_value);
    })
}

/** 공통_천단위콤마 */
function addComma(data) {
    return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
/** 공통_콤마제거 */
function removeCommas(data) {
    if(!data || data.length === 0){
        return "";
    }else{
        return data.split(",").join("");
    }
}

/** 탭이동 */
if($('.tab_menu').length > 0) {
    $(".tab_menu button").on('click', function () {
        let _target = $(this).data("target");
        $(this).addClass('active').parent().siblings().find("button").removeClass("active")
        $(_target).addClass('active').siblings().removeClass("active")
    });
}
/** 파라미터값( tabname )있으면 탭전환 */
if (
    getParameters("tabname") !== null &&
    getParameters("tabname") !== undefined &&
    getParameters("tabname") !== ""
) {
    $(".tab_menu button[data-target=\'."+ getParameters("tabname") +"\']").trigger("click");
}
