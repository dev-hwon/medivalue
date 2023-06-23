// 매칭 기공소 갯수
var MATCH_CNT = "5";

function simpleFeeHistoryCheck(tmi_idx) {
    $(".toggleAiPopup").removeClass("on");
    $("#simpleFeeMemo").val("");

    var send_data = {
       tmi_idx: tmi_idx
   }
   $.ajax({
       url: '/simple/rest/check.do',
       type: 'post',
       contentType: "application/json",
       data: JSON.stringify(send_data),
       dataType: 'json',
       success: function (data) {
           if (data.rtn_code == '200') {
               var cnt = data["cnt"];
               if(0 <= cnt && cnt < 5) {
                 showCommPopup("ai_simple_complete_popup");
               } else if(cnt < 0) { // 한번도 신청한 적이 없는 경우
                 showCommPopup("ai_simple_ready_popup");
               } else {
                 showCommPopup("ai_simple_ready_popup");
               }
           }
       },
       error: function (request, status, error) {
           alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
       }
   });
}

function simpleFeeQnaNewCheck() {

   var url = document.location.pathname;
   $.ajax({
       url: "/simple/rest/new/check.do",
       type: "POST",
       contentType: "application/json",
       async: false,
       dataType: "json",
       success: function (data) {
          if (data["rtn_code"] == '200') {
              if(data["new_yn"]) {
					var str = "";
					if(data["lab_yn"]) {
						str = "<span class='new'>NEW</span> 새로운 기공수가<br>문의가 도착했어요.";
						$("#noit_popup_btn").text("나의 답변 내역");
					} else {
						str = "<span class='new'>NEW</span> 기공수가문의<br>답변이 도착했어요.";
						$("#noit_popup_btn").text("나의 문의 내역");
					}
					$("#newPopupInfo").html(str);
					showCommPopup("login_noti_popup");

					// 기공수가 문의&답변내역 N 표시
					var html = $(".login_noti_right_popup .tx_count").html();
					$(".login_noti_right_popup .tx_count").html(html + "<sup>N</sup>");
                  } else {

                  }
           }
       }
       /*,
       error: function (request, status, error) {
           alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
       } */
   });
}

function simpleFeeRegister(tmi_idx) {
    var memo = $("#simpleFeeMemo").val();
    var send_data = {
       tmi_idx: tmi_idx,
       memo: memo
   }
   $.ajax({
       url: '/simple/rest/register.do',
       type: 'post',
       contentType: "application/json",
       data: JSON.stringify(send_data),
       dataType: 'json',
       success: function (data) {
           if (data.rtn_code == '200') {
               if(data["result"] > 0) {
                 // showHideCommPopup("ai_simple_ready_popup");
                 showHideCommPopup("ai_simple_check_popup");
               } else {
                 alert("문의 등록 중 오류가 발생하였습니다.")
               }
           }
       },
       error: function (request, status, error) {
           alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
       }
   });
}

function simpleFeeBannerCntCheck() {

   $.ajax({
       url: '/simple/rest/banner/count.do',
       type: 'post',
       contentType: "application/json",
	   async: false,
       dataType: 'json',
       success: function (data) {
           if (data.rtn_code == '200') {
               var cnt = data["bannerCnt"];
			   var lab_yn = data["lab_yn"];
			   $(".login_noti_right_popup .tx_count").html(cnt);
			   $(".login_noti_right_popup").css("display", "block");
			   if(lab_yn) {
				   $(".login_noti_right_popup .txt").text("기공수가 답변내역");
			   } else {
				   $(".login_noti_right_popup .txt").text("기공수가 문의내역");
			   }
           } else {

		   }
       },
       error: function (request, status, error) {
           alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
       }
   });
}

function btn_hrefLink(dtInfo, url) {
    window.location.replace(dtInfo + url);
}

$(document).ready(function (){

	$("#main_sub_title_1").text(MATCH_CNT + "곳");
    // $("#main_sub_title_2").text("하루 최대 " + MATCH_CNT + "개의 AI선별을 받을 수 있습니다.");
    $("#main_sub_title_2").html("<span>기공소측 담당자가 답변을 준비중입니다 &#x1F60A;</span>");

	simpleFeeBannerCntCheck();
	simpleFeeQnaNewCheck();

	function mn1 () {
		var ghj=$("#main .cnt1_2 .area .real_area .c1_left .c1_left_wrap .c1_left_box h3")
	
		if (ghj.text().length>16) {
			ghj.css("font-size","16px")
		}else {
			ghj.css("font-size","22px")
		}
	}
	mn1();
	

	function mnc7 () {
		var slider6 = $('.bxslider6').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		var slider7 = $('.bxslider7').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		var slider8 = $('.bxslider8').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		var slider9 = $('.bxslider9').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		var slider10 = $('.bxslider10').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		var slider11 = $('.bxslider11').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		var slider12 = $('.bxslider12').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		var slider13 = $('.bxslider13').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		var slider14 = $('.bxslider14').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		var slider15 = $('.bxslider15').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		var slider16 = $('.bxslider16').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		var slider17 = $('.bxslider17').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		var slider18 = $('.bxslider18').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		var slider19 = $('.bxslider19').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		var slider20 = $('.bxslider20').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		var slider21 = $('.bxslider21').bxSlider({
			auto : true,
			autoHover : true,
			autoControls : false,
			pause: 4000,
			controls : true,
			pager: false,
			touchEnabled : false
		});
		

		$("#main .cnt7 .area .real_area .txt .tab_split .tab_btn li button").on("click", function  () {
			var tgIdx=$(this).parent().index();

			$(this).parent().addClass("on").siblings().removeClass("on");
			$(this).closest(".tab_split").find(">.tab_cnt>div").eq(tgIdx).show().siblings().hide();
			

			slider6.reloadSlider();
			slider7.reloadSlider();
			slider8.reloadSlider();
			slider9.reloadSlider();
			slider10.reloadSlider();
			slider11.reloadSlider();
			slider12.reloadSlider();
			slider13.reloadSlider();
			slider14.reloadSlider();
			slider15.reloadSlider();
			slider16.reloadSlider();
			slider17.reloadSlider();
			slider18.reloadSlider();
			slider19.reloadSlider();
			slider20.reloadSlider();
			slider21.reloadSlider();
		});
	}
	mnc7();

	function mnc9 () {
		var $bigImg=$("#main .cnt9 .area .real_area .txt .left .img img");
		var $ele=$("#main .cnt9 .area .real_area .txt .right ul li");

		$ele.children("a").on("click", function  () {
			var aaa=$(this).find("img").attr("src")
			$(this).attr({href:aaa});

			var bigSrc=$(this).attr("href");
			var bigAlt=$(this).children().attr("alt");

			$bigImg.attr({src:bigSrc,alt:bigAlt});
			return false;
		});
	}
	mnc9();


	function mnc12 () {
		$("#main .cnt12 .area .real_area .txt .btm ul.depth1_2 > li > ul > li").on({
			"mouseenter":function  () {
				$(this).find(".pd_info_pu").stop().animate({"bottom":"0"})
			},
			"mouseleave":function  () {
				$(this).find(".pd_info_pu").stop().animate({"bottom":"-100%"})
			}
		});

		/* 전체 수정 */
		$("#main .cnt12 .area .real_area .txt .btm ul.depth1_2 > li > ul > li .control_box .chk_wrap_wrap .chk_opa").on("click", function  () {
			if ($(this).hasClass("on")) {
				$(this).removeClass("on").next().find("input[type='checkbox']").prop("checked", false);
			}else {
				$(this).addClass("on").next().find("input[type='checkbox']").prop("checked", true);
			}
		});
		/* 전체 수정 */
	}
	mnc12();
	
	function timer() {
		const now = new Date();
		const std = new Date();
		std.setDate(std.getDate() + 1);
		std.setHours(9);
		std.setMinutes(0);
		std.setSeconds(0);
		const diff = (std.getTime() - now.getTime()) / 1000;
		
		let time = parseInt(diff);
		let hour = "";
        let min = "";
        let sec = "";

        let x = setInterval(function(){
        	hour = parseInt(time/60/60);
            min = parseInt((time/60)%60);
            sec = time%60;
            
            hour = lpad(String(hour), 2, '0');
            min = lpad(String(min), 2, '0');
            sec = lpad(String(sec), 2, '0');

            $(".timer_txt").text(hour + ":" + min + ":" + sec);
            time--;

            if (time < 0) {
                clearInterval(x);
                $(".timer_txt").text("종료");
            }
        }, 1000);
	}
	/*timer();*/
	
	function timerWeek(){
		
		const now = new Date();
		/*const now = new Date(2021, 9, 25);
		now.setHours(0);
		now.setMinutes(0);
		now.setSeconds(0);*/
		
		const edate = new Date();
		edate.setDate(now.getDate() + (1 + 7 - now.getDay()) % 7);
		/*edate.setDate(now.getDate() + (7 - now.getDay()) % 7 + 1);*/
		edate.setHours(0);
		edate.setMinutes(0);
		edate.setSeconds(0);
		
		const sdate = new Date();
		sdate.setDate(now.getDate() + (1 + 7 - now.getDay()) % 7);
		/*sdate.setDate(now.getDate() + (7 - now.getDay()) % 7 + 1);*/
		sdate.setHours(9);
		sdate.setMinutes(0);
		sdate.setSeconds(0);
		
		const tdate = new Date();
		tdate.setDate(now.getDate() + (7 - now.getDay()) % 7 + 1);
		tdate.setHours(0);
		tdate.setMinutes(0);
		tdate.setSeconds(0);
		
		//console.log(edate + "/" + sdate + "/" + tdate);
		
		const diff = (edate.getTime() - now.getTime()) / 1000;
		const diff2 = (sdate.getTime() - now.getTime()) / 1000;
		const diff3 = (tdate.getTime() - now.getTime()) / 1000;
		
		//console.log(diff + "/" + diff2 + "/" + diff3);
		
		let time = parseInt(diff);
		let time2 = parseInt(diff2);
		let time3 = parseInt(diff3);
		
		//console.log(time + "/" + time2 + "/" + time3);
		
        let x = setInterval(function(){
			let day = parseInt(time/60/60/24);
        	let hour = parseInt((time/60/60)%24);
            let min = parseInt((time/60)%60);
            let sec = time%60;

            day = lpad(String(day), 1, '0');
            hour = lpad(String(hour), 2, '0');
            min = lpad(String(min), 2, '0');
            sec = lpad(String(sec), 2, '0');

			let day3 = parseInt(time3/60/60/24);
        	let hour3 = parseInt((time3/60/60)%24);
            let min3 = parseInt((time3/60)%60);
            let sec3 = time3%60;

            day3 = lpad(String(day3), 1, '0');
            hour3 = lpad(String(hour3), 2, '0');
            min3 = lpad(String(min3), 2, '0');
            sec3 = lpad(String(sec3), 2, '0');
            
			if (time < 0 && time2 > 0) {
	            clearInterval(x);
	            $(".timer_txt").text("종료");
	        }else if (time2 <= 0 && time3 > 0){
				/*time = time3;*/
				time3--;
				$(".timer_txt").text(day3 + "일 " + hour3 + ":" + min3 + ":" + sec3);
			}else{
            	time--;
				$(".timer_txt").text(day + "일 " + hour + ":" + min + ":" + sec);
			}
        }, 1000);
	}
	timerWeek();
	
	
	function lpad(s, padLength, padString) {
		while (s.length < padLength)
			s = padString + s;
		return s;
	}


});