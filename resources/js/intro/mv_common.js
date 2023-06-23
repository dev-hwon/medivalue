const xs = 0;
const sm = 768;
const md = 992;
const lg = 1200;
const areaWin = $(window);
let areaWinWidth = areaWin.width();
let position_default_value = $(window).scrollTop();

// $(function () {
//   // 카테고리 파라미터(cate_cd) 있을 때, 그리드 저장 버튼 노출
//   var url = new URL(window.location.href);
//   var urlParams = url.searchParams;
//   if (urlParams.has("cate_cd")) {
//     console.log();
//     categoryGrid.getColumn("row_save").hidden = false;
//   }
// });

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
// 파라미터값있으면 이동
if (
  getParameters("moveposition") !== null &&
  getParameters("moveposition") !== undefined &&
  getParameters("moveposition") !== ""
) {
  moveTo("." + getParameters("moveposition"), 1000);
}

// 스크롤업다운체크
function scrUpDown() {
  let current_scroll_value = $(window).scrollTop();
  if (current_scroll_value > position_default_value) {
    $("body").addClass("scrDown").removeClass("scrUp");
  } else {
    $("body").addClass("scrUp").removeClass("scrDown");
  }
  position_default_value = current_scroll_value;
}
// 스크롤막기
function scrollDisable() {
  $("body")
    .addClass("scrollDisable")
    .on("scroll touchmove mousewheel", function (e) {
      e.preventDefault();
    });
}
// 스크롤허용
function scrollAble() {
  $("body").removeClass("scrollDisable").off("scroll touchmove mousewheel");
}
function fixedHeader() {
  let current_scroll_value = $(window).scrollTop();
  let main_index = $(".main_index");
  let header = $("header");

  if (current_scroll_value > main_index.offset().top) {
    header.addClass("fixed_top");
    main_index.css("padding-top", header.outerHeight());
    $(".sec1_scr_obj").fadeOut();
  } else {
    header.removeClass("fixed_top");
    main_index.attr("style", "");
    $(".sec1_scr_obj").fadeIn();
  }
}

$(window).on("load scroll", function () {
  fixedHeader();
  scrUpDown();
});

function moveTo(target, speed) {
  let _target = $(target);
  let _targetPos = _target.offset().top - $("header").outerHeight();
  $("html, body").animate({ scrollTop: _targetPos }, speed ? speed : 600);
}

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
function closenSheet(elem) {
  scrollAble();
  let _target = $(elem);
  let _target_overlay = $(".sheet_overlay");
  _target_overlay.fadeOut(function () {
    $(this).remove();
  });
  _target.removeClass("active");
}

// target active insight
function isScrolledIntoView(type, target) {
  let docViewTop = areaWin.scrollTop();
  let docViewBottom = docViewTop + areaWin.height();
  let elemTop = target.offset().top;
  let elemBottom = elemTop + target.height();

  if (type === "animate") {
    return elemTop - target.outerHeight() / 2 <= docViewBottom;
    // return elemTop <= docViewBottom && elemBottom >= docViewTop;
  }
  if (type === "video") {
    return elemTop <= docViewBottom && elemBottom >= docViewTop;
  }
}

// custom video
$(".video_wrap").each(function (index, item) {
  let video = $(item).find("video");
  $(window).on("load scroll", function (event) {
    if (isScrolledIntoView("video", video)) {
      video.get(0).play();
    }
    if (!isScrolledIntoView("video", video)) {
      video.get(0).pause();
    }
  });
});

// custom animate
$(".animated").each(function (index, item) {
  let animate_nm = $(item).data("animate");
  let animate_duration = "duration__" + $(item).data("duration");
  let animate_delay = $(item).data("delay")
    ? "delay__" + $(item).data("delay")
    : "";

  let animate_class = "";
  switch (animate_nm) {
    case "slideleft":
      animate_class = "slideInLeft";
      break;
    case "slideright":
      animate_class = "slideInRight";
      break;
    case "slideup":
      animate_class = "slideInUp";
      break;
    case "slidedown":
      animate_class = "slideInDown";
      break;
  }

  $(window).on("load scroll", function (event) {
    if (isScrolledIntoView("animate", $(item))) {
      $(item).addClass(
        animate_class +
          " " +
          (animate_duration ? animate_duration : "") +
          " " +
          (animate_delay ? animate_delay : "")
      );
    }
    if (!isScrolledIntoView("animate", $(item))) {
      $(item).removeClass(
        animate_class +
          " " +
          (animate_duration ? animate_duration : "") +
          " " +
          (animate_delay ? animate_delay : "")
      );
    }
  });
});

// custom parallax
$(".plx").each(function (index, item) {
  let elemTop = $(item).offset().top;
  let type = $(item).data("plxtype");
  let speed = $(item).data("plxspeed");
  let unit = speed * -1;
  let initTop = $(window).scrollTop();
  let initPosBg = (initTop - elemTop) * unit;
  if (type === "bg") {
    $(this).css({
      "background-repeat": "no-repeat",
      "background-attachment": "fixed",
      "background-size": "cover",
      "background-position": "0 " + initPosBg + "px",
    });
    $(window).on("scroll load", function () {
      let docViewTop = $(window).scrollTop();
      let docViewBottom = docViewTop + $(window).height();
      let posBg = (docViewTop - elemTop) * unit;
      if (docViewBottom >= elemTop) {
        $(item).css("background-position-y", posBg);
      }
    });
    return;
  }
  if (type === "item") {
    $(window).on("scroll load", function () {
      let docViewTop = $(window).scrollTop();
      let docViewBottom = docViewTop + $(window).height();
      let posItem = docViewTop + (docViewTop - elemTop) * unit;
      $(item).css("top", posItem);
    });
    return;
  }
});
