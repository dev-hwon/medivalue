<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/slick.css"/>
		<link rel="stylesheet" href="/resources/css/main.css?v=20211242" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />

		<style type="text/css">
			.d-none {
				display: none;
			}

			#header .btm .area .real_area .right > ul > li.hd_r_btn3 .cart_alarm {
				top: 45px !important;
    			right: -22px !important;
			}
		</style>
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/slick.min.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/main.js"></script>
		<script type="text/javascript" src="/resources/js/main_renew.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220317"></script>
		<script src="/resources/js/jquery/plugin/cookie/jquery.cookie.js"></script>
		<script type="text/javascript">

		setInterval(function() { /* setInterval 시작 */
		    var boxIn = $('.boxIn ul'); /* boxIn 변수에 .boxIn ul 요소 저장 */
		    var boxRow = $('.boxIn ul li:first'); /* boxRow 변수에 첫번째 .boxIn ul li 요소 저장  */
		    var ARea = function(){ /* ARea 변수에 함수 저장 */
		        boxRow.appendTo(boxIn).slideDown(300); /* boxRow 요소를 boxIn 요소 마지막에 추가하며 show 메서드 적용합니다. */
		    };
		    $(boxRow).slideUp(300, ARea); /* boxRow 요소가 300ms로 숨겨지고나면 변수 ARea에 저장 된 콜백 함수가 실행됩니다. */
		},7000); /* setInterval 이 7초마다 실행됩니다. */

		var signInPopup = {
				showMessage: function (msg) {
					$("#pop_alarm_msg").html(msg);
					$("#black").show();
					$(".popup_message_type_1").show();
				}
			}

			$(document).ready(function (){
				var chk_id = $.cookie('medivalue_web_id');

				if(typeof(chk_id)!='undefined' && chk_id!=''){
					$("#user_id").siblings("label").hide();
					$("#user_id").val(chk_id);
					$("#chk_save_id").attr("checked", true);
				}

				$("#chk_save_id").on("click",function(){
					if($("#chk_save_id").attr("checked")) {
						$("#chk_save_id").attr("checked", false);
					} else {
						$("#chk_save_id").attr("checked", true);
					}

					var temp_id = $("#user_id").val();
					if(typeof(temp_id) !='undefined' && temp_id !=''){
						$.cookie('medivalue_web_id', temp_id, { expires: 15, path: "/"});
					}
				});

				/* 로그인 버튼 */
				$("#btn_login").on("click", function(){
					var temp_id = $("#user_id").val();
					var temp_pw = $("#user_pw").val();
					var remem_id = $("#chk_save_id").attr("checked");

					if( typeof(temp_id) =='undefined' || temp_id.trim() == ''){
						$("#black").show();
						$("#pop_alarm_msg").text("아이디를 확인해주세요.");
						$(".popup_message_type_1").css("display","block");
						//$("#user_id").focus();
						return;
					}else if( typeof(temp_pw) =='undefined' || temp_pw.trim() ==''){
						$("#black").show();
						$("#pop_alarm_msg").text("비밀번호를 확인해주세요.");
						$(".popup_message_type_1").css("display","block");
						return;
					}else{
						var formData = $("#f_login").serialize();
						$.ajax({
		    				url : '/access/rest/loginProc',
		    				type : 'post',
		    				cache : false,
		    				data : formData,
		    				dataType : 'json',
		    			   	success:function(data){
		    			   		if(data.rtn_code =='200'){
									var temp_id = $("#user_id").val();
									if(typeof(remem_id) == 'undefined') { // 아이디 기억하기 기능 
										$.cookie('medivalue_web_id', temp_id, { expires: 0, path: "/"});
									} else {
										if(typeof(temp_id) !='undefined' && temp_id !=''){
											$.cookie('medivalue_web_id', temp_id, { expires: 15, path: "/"});
										}
									}
		    			   			location.replace('/index');
		    			   		}else{
		    			   			$("#black").show();
		    						$("#pop_alarm_msg").text(data["rtn_msg"]);
		    						$(".popup_message_type_1").css("display","block");
		    			   		}
		    			   	},
		    			   	error:function(request,status,error){
		    			        // alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    			    }
						});
					}
				});

				$("#user_pw").on("keyup", function(e){
					if (e.keyCode == 13) {
						$("#btn_login").click();
            		}
				});

				$(".join_btn").on("click", function () {
					location.href = "/member/join";
				});

				/* 장바구니 버튼 */
				$(".cart_btn").on("click", function(){
					
					var login_check = js_login_check_cart_btn();
					
					var pd_cnt = $("ul#sale_product_info > li").length;
					var pd_title =  $.trim($("#saleProduct_name").html()); // 상품명
					let formData = {};
					let cart_list = [];

					if(login_check){
						let formData = {};
						$("ul#sale_product_info > li").each(function(index){
							let cart_obj = {};
							var temp_cnt = '1'; // 장바구니에 담을 물건의 갯수 - 한번 클릭에 한개씩
							var temp_tpsm_idx = $(this).find("#tpsm_idx").val(); // tpsm_idx
							var temp_tsmi_idx = $(this).find("#tsmi_idx").val(); // tsmi_idx
							var temp_tpmm_idx = $(this).find("#tpmm_idx").val(); // tsmi_idx
							cart_obj["tpmm_idx"] = temp_tpmm_idx;
							cart_obj["cnt"] = 1;
							cart_list.push(cart_obj);
						});

						formData["cart_list"] = cart_list;

						$.ajax({
							url: '/quickOrder/rest/cart/save',
							type: 'post',
							cache: false,
							data: JSON.stringify(formData),
							contentType: 'application/json',
							dataType: 'json',
							success: function (data) {
								if(data['rtn_cd'] != '200'){
									alert(data['rtn_msg']);
								}else{
									popAlarm_renew(pd_title, pd_cnt, data['basket_list_size']);
									labbit_add_to_cart(data.basket_save_list);
								}
							}
						});
					}
				});

				
				function ConvertTag(str){
					 str = str.replace("&lt;","<");
					 str = str.replace("&gt;",">");
					 str = str.replace("&quot;","\"");
					 str = str.replace("&#39;","\'");
					 str = str.replace("&amp;","&");
					 return str;
					}

				// 차후 common.js로 옮기던, btm을 바꾸던 해야할 듯 _ads
				function popAlarm_renew(pd_title, pd_cnt, basketSize) {
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

				function js_login_check_cart_btn(){
					let location_search = location.search;
					let location_pathname = location.pathname;
					// let url = location_pathname + location_search + "&cart_btn=true";
					let url = location_pathname + location_search;
					$("ul#sale_product_info > li").each(function(index){
						var temp_tpsm_idx = $(this).find("#tpsm_idx").val();
						var temp_amount = $(this).find("#product_detail_amount").text().replaceAll(",", "").replaceAll(/(\s*)/g, "");
						var temp_cnt = $(this).find("#order_cnt").text();
						url = url + "&list=" + temp_tpsm_idx + "_" + temp_amount + "_" + temp_cnt;
					});
					url = encodeURIComponent(url);
					var rtn_login_check = true;

					if ("${loginInfo}" == null){
						$("#pop_alarm_msg").text("로그인 후 이용해 주세요.");
						$(".popup_message_type_1").css("display","block");
						$("#black").css("display","block");
						$(".one_btn").on("click", function () {
							location.href="/access/login?url=" + url;
						});
						rtn_login_check = false;
					}
					return rtn_login_check;
				}
		});

		function moveQuickOrder(product_name, idx) {
			$("#searchString").val(product_name);
			$("#searchSelectIdx").val(idx);
			$("#frm_top_search").submit();
		}
		</script>

		<script>
		$(function(){
			/* 오늘 하루 열지 않음 공통 START */
	        if (document.cookie.indexOf("todayPop=done") < 0){
	        	$(".today_popup").show();
	        	activeDate();
	        }else {
	        	$(".today_popup").hide();
	        }
	        /* 오늘 하루 열지 않음 공통 END */

			/* 오늘 하루 열지 않음 (배송지연일 때) START */
	        if (document.cookie.indexOf("todayDelayPop=done") < 0){
	        	$(".today_delay_popup").show();
	        	activeDateDelay();
	        }
	        else {
	        	$(".today_delay_popup").hide();
	        }
	        /* 오늘 하루 열지 않음 (배송지연일 때) END */

	        /* 오늘 하루 열지 않음 IE일 때 START */
	        var agent = navigator.userAgent.toLowerCase();
	        if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
	        	if (document.cookie.indexOf("todayIePop=done") < 0){
		        	$(".today_ie_popup").show();
		        }else {
					$(".today_ie_popup").hide();
		        }
	        }
	        /* 오늘 하루 열지 않음 IE일 때 END */

			/* 220614 오적립 팝업 */
			if (document.cookie.indexOf("todayPopFault=done") < 0){
				faultPopupYN();
				activeDateFault();
			}else {
				$(".fault_popup").hide();
			}
			/* 220614 오적립 팝업 END */
			
			/* 100원 이벤트 팝업 START */
	        // if (document.cookie.indexOf("benefitPop=done") < 0){
			<c:if test="${requestScope.event_popup_yn eq 'Y' && !empty requestScope.loginInfo}">
	        if (document.cookie.indexOf("benefitPop=done") < 0){

	        	$(".benefit_popup").show();

	        	activeDateBenefit();
	        }else {
	        	$(".benefit_popup").hide();
	        }
			</c:if>
	        /* 100원 이벤트 팝업 END */
		});

		/* 오늘 하루 열지 않음 (공통) START */
		function setCookie( name, value, expiredays ) {
            var todayDate = new Date();
            todayDate.setDate( todayDate.getDate() + expiredays ); 
            document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
    	}

		function closePopWeek1() {
            setCookie("todayPop", "done" , 7);
            $(".today_popup").hide();
        }

		function closePopDay() {
            setCookie("todayPop", "done" , 1);
            $(".today_popup").hide();
        }

        function closePop() {
            $(".today_popup").hide();
        }
        /* 오늘 하루 열지 않음 (공통) END */

        /* 오늘 하루 열지 않음 (배송지연일 때) START */
		function closeDelayPopDay() {
            setCookie("todayDelayPop", "done" , 7);
            $(".today_delay_popup").hide();
        }
        function closeDelayPop() {
            $(".today_delay_popup").hide();
        }
        /* 오늘 하루 열지 않음 (배송지연일 때) END */

        /* 오늘 하루 열지 않음 (IE일 때) START */
		function closeIePopDay() {
            setCookie("todayIePop", "done" , 1);
            $(".today_ie_popup").hide();
        }
        function closeIePop() {
            $(".today_ie_popup").hide();
        }
        /* 오늘 하루 열지 않음 (IE일 때) END */

		/* 220614 오적립 팝업 */
		function faultPopupYN() {
			let faultPoint = "${faultPoint}";
			if(faultPoint.trim().length > 0) {
				$(".fault_popup").show();
				$(".today_ie_popup").hide();
			} else {
				$(".fault_popup").hide();
			}
		}
		function closeIePopFault() {
			$(".fault_popup").hide();
		}
		function closePopWeek1Fault() {
			setCookie("todayPopFault", "done" , 7);
			$(".fault_popup").hide();
		}

		function nowDateFault() { // 현재 날짜
			const nowDt = new Date();
			const nowYear = nowDt.getFullYear();
			const nowMonth = nowDt.getMonth() + 1;
			const nowDate = nowDt.getDate();
			const nowHours = nowDt.getHours();
			const nowMin = nowDt.getMinutes();
			const nowSecond = nowDt.getSeconds();
			return nowYear+'-'+(nowMonth<10?'0'+nowMonth:nowMonth)+'-'+(nowDate<10?'0'+nowDate:nowDate)+'-'+nowHours+'-'+nowMin+'-'+nowSecond;
		};

		function startDateFault() {  // 시작 날짜
			const startYear = "2022";
			const startMonth = "6";
			const startDate = "15";
			const startHours = "00";
			const startMin = "00";
			const startSecond = "00";
			return startYear+'-'+(startMonth<10?'0'+startMonth:startMonth)+'-'+(startDate<10?'0'+startDate:startDate)+'-'+startHours+'-'+startMin+'-'+startSecond;
		};

		function endDateFault() {  // 끝나는 날짜
			const endYear = "2022";
			const endMonth = "6";
			const endDate = "30";
			const endHours = "19";
			const endMin = "00";
			const endSecond = "00";
			return endYear+'-'+(endMonth<10?'0'+endMonth:endMonth)+'-'+(endDate<10?'0'+endDate:endDate)+'-'+endHours+'-'+endMin+'-'+endSecond;
		};

		function activeDateFault() {
			if(nowDateFault() > endDateFault() || nowDateFault() < startDateFault()){
				$(".fault_popup").hide();
			}
		};
		/* 220614 오적립 팝업 End */
		
		/* 100원 이벤트 팝업 START */
		function closeBenefitPopWeek() {
            setCookie("benefitPop", "done" , 7);
            $(".benefit_popup").hide();
        }

        function closeBenefitPop() {
            $(".benefit_popup").hide();
        }
        /* 100원 이벤트 팝업 END */

        /* 오늘 하루 열지 않음 팝업 (공통) 활성화 기간 설정 START */
        function nowDate() { // 현재 날짜
            const nowDt = new Date();
            const nowYear = nowDt.getFullYear();
            const nowMonth = nowDt.getMonth() + 1;
            const nowDate = nowDt.getDate();
            const nowHours = nowDt.getHours();
            const nowMin = nowDt.getMinutes();
            const nowSecond = nowDt.getSeconds();
            return nowYear+'-'+(nowMonth<10?'0'+nowMonth:nowMonth)+'-'+(nowDate<10?'0'+nowDate:nowDate)+'-'+nowHours+'-'+nowMin+'-'+nowSecond;
        };

        function startDate() {  // 시작 날짜
            const startYear = "2022";
            const startMonth = "10";
            const startDate = "17";
            const startHours = "00";
            const startMin = "00";
            const startSecond = "00";
            return startYear+'-'+(startMonth<10?'0'+startMonth:startMonth)+'-'+(startDate<10?'0'+startDate:startDate)+'-'+startHours+'-'+startMin+'-'+startSecond;
        };

        function endDate() {  // 끝나는 날짜
            const endYear = "2022";
            const endMonth = "10";
            const endDate = "31";
            const endHours = "00";
            const endMin = "00";
            const endSecond = "00";
            return endYear+'-'+(endMonth<10?'0'+endMonth:endMonth)+'-'+(endDate<10?'0'+endDate:endDate)+'-'+endHours+'-'+endMin+'-'+endSecond;
        };

        function activeDate() {
            if(nowDate() > endDate() || nowDate() < startDate()){
            	$(".today_popup").hide();
            }
        };
        /* 오늘 하루 열지 않음 팝업 (공통) 활성화 기간 설정 END */

        /* 오늘 하루 열지 않음 팝업 (배송지연일 때) 활성화 기간 설정 START */
        function nowDateDelay() { // 현재 날짜
            const nowDt = new Date();
            const nowYear = nowDt.getFullYear();
            const nowMonth = nowDt.getMonth() + 1;
            const nowDate = nowDt.getDate();
            const nowHours = nowDt.getHours();
            const nowMin = nowDt.getMinutes();
            const nowSecond = nowDt.getSeconds();
            return nowYear+'-'+(nowMonth<10?'0'+nowMonth:nowMonth)+'-'+(nowDate<10?'0'+nowDate:nowDate)+'-'+nowHours+'-'+nowMin+'-'+nowSecond;
        };
        
        function startDateDelay() {  // 시작 날짜
            const startYear = "2022";
            const startMonth = "7";
            const startDate = "11";
            const startHours = "00";
            const startMin = "00";
            const startSecond = "00";
            return startYear+'-'+(startMonth<10?'0'+startMonth:startMonth)+'-'+(startDate<10?'0'+startDate:startDate)+'-'+startHours+'-'+startMin+'-'+startSecond;
        };

        function endDateDelay() {  // 끝나는 날짜
            const endYear = "2022";
            const endMonth = "8";
            const endDate = "5";
            const endHours = "00";
            const endMin = "00";
            const endSecond = "00";
            return endYear+'-'+(endMonth<10?'0'+endMonth:endMonth)+'-'+(endDate<10?'0'+endDate:endDate)+'-'+endHours+'-'+endMin+'-'+endSecond;
        };

        function activeDateDelay() {
            if(nowDateDelay() > endDateDelay() || nowDateDelay() < startDateDelay()){
            	$(".today_delay_popup").hide();
            }
        };
        /* 오늘 하루 열지 않음 팝업 (배송지연일 때) 활성화 기간 설정 END */
        
        /* 100원 이벤트 팝업 활성화 기간 설정 START */
        function nowDateBenefit() { // 현재 날짜
            const nowDt = new Date();
            const nowYear = nowDt.getFullYear();
            const nowMonth = nowDt.getMonth() + 1;
            const nowDate = nowDt.getDate();
            const nowHours = nowDt.getHours();
            const nowMin = nowDt.getMinutes();
            const nowSecond = nowDt.getSeconds();
            return nowYear+'-'+(nowMonth<10?'0'+nowMonth:nowMonth)+'-'+(nowDate<10?'0'+nowDate:nowDate)+'-'+nowHours+'-'+nowMin+'-'+nowSecond;
        };

        function startDateBenefit() {  // 시작 날짜
            const startYear = "2022";
            const startMonth = "10";
            const startDate = "5";
            const startHours = "00";
            const startMin = "00";
            const startSecond = "00";
            return startYear+'-'+(startMonth<10?'0'+startMonth:startMonth)+'-'+(startDate<10?'0'+startDate:startDate)+'-'+startHours+'-'+startMin+'-'+startSecond;
        };

        function endDateBenefit() {  // 끝나는 날짜
            const endYear = "2023";
            const endMonth = "10";
            const endDate = "5";
            const endHours = "00";
            const endMin = "00";
            const endSecond = "00";
            return endYear+'-'+(endMonth<10?'0'+endMonth:endMonth)+'-'+(endDate<10?'0'+endDate:endDate)+'-'+endHours+'-'+endMin+'-'+endSecond;
        };

        function activeDateBenefit() {
            if(nowDateBenefit() > endDateBenefit() || nowDateBenefit() < startDateBenefit()){
            	$(".benefit_popup").hide();
            }
        };
        /* 100원 이벤트 팝업 활성화 기간 설정 END */
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="main" class="main">
			<%--오늘 하루 열지 않음 (공통)--%>
			<div class="layer_popup today_popup">
				<!-- <div class="bg"></div> -->
				<div class="cont">
					<div class="inner_box">
						<div class="util">
							<button type="button" class="btn_close" onclick="closePop();"></button>
						</div>
						<div class="detail">
							<div class="img">
								<img src="/resources/images/main_renew/img_popup_today_221017.jpg?v20221017" />
							</div>
							<div class="link g_m_popup_event">
								<a href="/notice/view?idx=60" target="_self" ></a>
							</div>
						</div>
						<div class="btn">
							<button type="button" onclick="closePopWeek1();">일주일간 보지 않기</button>
							<button type="button" onclick="closePop();">닫기</button>
						</div>
					</div>
				</div>
			</div>

			<%--오늘 하루 열지 않음 (배송지연일 때)--%>
			<div class="layer_popup today_delay_popup">
				<!-- <div class="bg"></div> -->
				<div class="cont">
					<div class="inner_box">
						<div class="util">
							<button type="button" class="btn_close" onclick="closeDelayPop();"></button>
						</div>
						<div class="detail">
							<div class="txt">
								<div class="pre">8월 1일 ~ 3일 치과기자재협회 휴가로 인한</div>
								<div class="tit">배송 휴무 안내</div>
								<div class="desc">8월 1일 ~ 3일까지 치과기자재협회<br>휴가로 도매상 물품 공급이 안되어<br><b>8월 4일부터 순차적으로 발송됩니다.</b></div>
							</div>
							<div class="link">
								<a href="/notice/view?idx=53&num=18">자세히 보기</a>
							</div>
						</div>
						<div class="info">
							배송 휴무 기간 : 8월 1일 ~ 3일까지
						</div>
						<div class="btn">
							<button type="button" onclick="closeDelayPopDay();">일주일동안 보지않기</button>
							<button type="button" onclick="closeDelayPop();">닫기</button>
						</div>
					</div>
				</div>
			</div>

			<%--오늘 하루 열지 않음 (IE일 때)--%>
			<div class="layer_popup today_ie_popup">
				<div class="bg" onclick="closeIePop();"></div>
				<div class="cont">
					<div class="inner_box">
						<div class="util">
							<button type="button" class="btn_close" onclick="closeIePop();"></button>
						</div>
						<div class="detail">
							<div class="img">
								<img src="/resources/images/main_renew/img_ie_chat_alert.png?v20220603" />
							</div>
							<div class="link">
								<a href="https://www.google.com/chrome/" target="_blank" class="link_01"></a>
								<a href="https://www.microsoft.com/windows/microsoft-edge" target="_blank" class="link_02"></a>
							</div>
						</div>
						<div class="btn">
							<button type="button" onclick="closeIePopDay();">오늘 하루 보지 않기</button>
							<button type="button" onclick="closeIePop();">닫기</button>
						</div>
					</div>
				</div>
			</div>

			<%-- 220614 오적립 팝업 --%>
			<div class="fault_popup">
				<div class="bg" onclick="closeIePopFault();"></div>
				<div class="cont">
					<div class="inner_box">
						<div class="util">
							<button type="button" class="btn_close" onclick="closeIePopFault();"></button>
						</div>
						<div class="detail">
							<div class="img">
								<div class="logo">
									<img src="/resources/images/main_renew/img_fault_logo_popup.png" />
								</div>
								<div class="icon">
									<img src="/resources/images/main_renew/img_fault_icon_popup.png" />
								</div>
							</div>
							<div class="txt">
								<div class="tit">
									시스템 오류로 인한<br>
									<b>과지급 적립금 회수 안내</b>
								</div>
								<div class="desc">
									메디밸류의 전산 시스템 오류로 인하여 오지급된<br>
									<b>적립금 <fmt:formatNumber value="${faultPoint}" pattern="#,###" />원이 6월 16일 오후 5시 전에 회수 예정입니다.</b><br>
									서비스 이용에 불편을 드려 대단히 죄송합니다.
								</div>
							</div>
							<div class="info">
								회수 결과는 메디밸류 스토어 > 내 계정 > 쿠폰/포인트 메뉴에서 확인 가능합니다.
							</div>
						</div>
						<div class="btn">
							<button type="button" onclick="closePopWeek1Fault();">일주일간 보지 않기</button>
							<button type="button" onclick="closeIePopFault();">닫기</button>
						</div>
					</div>
				</div>
			</div>
			
			<%--100원 이벤트 팝업--%>
			<div class="layer_popup benefit_popup">
				<!-- <div class="bg"></div> -->
				<div class="cont">
					<div class="inner_box">
						<div class="util">
							<button type="button" class="btn_close" onclick="closeBenefitPop();"></button>
						</div>
						<div class="detail">
							<div class="img">
								<img src="/resources/images/main_renew/img_popup_today_220401.jpg?v20221005" />
							</div>
							<div class="link">
								<a href="/event/first_order" target="_self" ></a>
							</div>
						</div>
						<div class="btn">
							<button type="button" onclick="closeBenefitPopWeek();">일주일간 보지 않기</button>
							<button type="button" onclick="closeBenefitPop();">닫기</button>
						</div>
					</div>
				</div>
			</div>
			
			<%--클리닉 인증 누적거래 순위 팝업--%>
			<div class="comm_popup rank_detail_popup" style="visibility: hidden; opacity: 0;">
		        <div class="bg" onclick="closePopup(this);"></div>
		        <div class="content">
		        	<div class="util">
		        		<button type="button" class="btn_close" onclick="closePopup(this);"></button>
		        	</div>
		            <div class="popup_inner">
		                <div class="head">
		                    <div class="title">클리닉 인증 <span class="sort">누적거래</span> 순위</div>
		                </div>
		                <div class="body">
		                    <div class="rank_wrap">
		                    	<div class="rank_list">
		                    		<table>
                            			<colgroup>
                            				<col style="width:10%;">
                            				<col style="width:auto;">
                            				<col style="width:20%;">
                            				<col style="width:20%;">
                            			</colgroup>
                            			<thead>
                            				<tr>
                            					<th class="no">순위</th>
                            					<th class="title">기공소명</th>
                            					<th class="accum">누적거래</th>
                            					<th class="recent">최근거래</th>
                            				</tr>
                            			</thead>
                            			<tbody>
                            				<tr class="on" onclick="rankPopupListEvent(this);">
                            					<td class="no">1</td>
                            					<td class="title">
                            						<div class="txt_title">하늘치과기공소</div>
                            						<div class="txt_desc">고양 일산동구</div>
                            					</td>
                            					<td class="accum on">
                            						<div class="txt_num">9,999+</div>
                            					</td>
                            					<td class="recent">
                            						<div class="txt_num">1,234</div>
                            						<div class="txt_range up">869</div>
                            					</td>
                            				</tr>
                            				<tr onclick="rankPopupListEvent(this);">
                            					<td class="no">2</td>
                            					<td class="title">
                            						<div class="txt_title">케이치과기공소</div>
                            						<div class="txt_desc">서울 구로구</div>
                            					</td>
                            					<td class="accum on">
                            						<div class="txt_num">8,672</div>
                            					</td>
                            					<td class="recent">
                            						<div class="txt_num">1,234</div>
                            						<div class="txt_range up">869</div>
                            					</td>
                            				</tr>
                            				<tr onclick="rankPopupListEvent(this);">
                            					<td class="no">3</td>
                            					<td class="title">
                            						<div class="txt_title">퍼슨경동치과기공소</div>
                            						<div class="txt_desc">서울 동작구</div>
                            					</td>
                            					<td class="accum on">
                            						<div class="txt_num">6,812</div>
                            					</td>
                            					<td class="recent">
                            						<div class="txt_num">1,234</div>
                            						<div class="txt_range up">869</div>
                            					</td>
                            				</tr>
                            				<tr onclick="rankPopupListEvent(this);">
                            					<td class="no">4</td>
                            					<td class="title">
                            						<div class="txt_title">옵투스교정치과기공소</div>
                            						<div class="txt_desc">대전 대덕구</div>
                            					</td>
                            					<td class="accum on">
                            						<div class="txt_num">2,958</div>
                            					</td>
                            					<td class="recent">
                            						<div class="txt_num">1,234</div>
                            						<div class="txt_range up">869</div>
                            					</td>
                            				</tr>
                            				<tr onclick="rankPopupListEvent(this);">
                            					<td class="no">5</td>
                            					<td class="title">
                            						<div class="txt_title">당일도착보장치과기공소</div>
                            						<div class="txt_desc">부산 기장군</div>
                            					</td>
                            					<td class="accum on">
                            						<div class="txt_collecting"></div>
                            					</td>
                            					<td class="recent">
                            						<div class="txt_collecting"></div>
                            					</td>
                            				</tr>
                            			</tbody>
                            		</table>
		                    	</div>
		                    	<div class="rank_info">
		                    		<table>
                            			<thead>
                            				<tr>
                            					<th>기공소 정보</th>
                            				</tr>
                            			</thead>
                            			<tbody>
                            				<tr>
                            					<td>
                            						<div class="info_wrap">
                            							<div class="info_list">
	                            							<ul>
	                            								<li>
	                            									<div class="th">기공소명</div>
	                            									<div class="td">하늘치과기공소</div>
	                            								</li>
	                            								<li>
	                            									<div class="th">대표자명</div>
	                            									<div class="td">김소장</div>
	                            								</li>
	                            								<li>
	                            									<div class="th">주소</div>
	                            									<div class="td">서울특별시 영등포구 여의공원로 115<br>세우빌딩, 6층</div>
	                            								</li>
	                            								<li>
	                            									<div class="th">이메일</div>
	                            									<div class="td">aaa@naver.com</div>
	                            								</li>
	                            								<li>
	                            									<div class="th">연락처</div>
	                            									<div class="td">02-0123-0123</div>
	                            								</li>
	                            							</ul>
	                            						</div>
	                            						<div class="info_box">
	                            							<div class="tit"><span>TIP.</span> 직접 연락하실 경우</div>
	                            							<div class="desc">"메디밸류를 통해 보고 연락드렸어요"라고 하시면<br>빠른 확인이 가능합니다.</div>
	                            						</div>
                            						</div>
                            					</td>
                            				</tr>
                            			</tbody>
                           			</table>
		                    	</div>
		                    </div>
		                </div>
		            </div>
		            <div class="foot">
		                <div class="comm_button">
		                    <button type="button" class="" onclick="closePopup(this);">확인</button>
		                </div>
		            </div>
		        </div>
		    </div>

			<article class="atc_visual">
	            <div class="inner">	
	                <form id="f_login" name="f_login" action="/access/loginProc" method="post">
	                    <div class="visual_wrap">
	                    	<ul>
	                        <!-- 
	                            <li class="">
	                                <a href="/product/pclist">
	                                    <div class="img">
	                                        <img src="/resources/images/main/img_visual_slide01.jpg?v20220114" />
	                                    </div>
	                                </a>
	                            </li>
	                            <li class="dark">
	                                <a href="/notice/view?idx=22&num=6">
	                                    <div class="img">
	                                        <img src="/resources/images/main/img_visual_slide03.jpg?v20220118" />
	                                    </div>
	                                </a>
	                            </li>
	                            <li class="">
	                                <a href="/notice/view?idx=25&num=9">
	                                    <div class="img">
	                                        <img src="/resources/images/main/img_visual_slide04.jpg?v20220118" />
	                                    </div>
	                                </a>
	                            </li>
	                          -->

	                        <c:forEach var="item" items="${banner_list}" varStatus="status">
	                        		<!-- <li <c:if test="${status.index % 2 == 1}"> class="dark"</c:if>>  -->
	                        	<li class="g_click_area_main_banner g_m_h_banner">
	                                <a <c:if test="${!item.fd_act_type.equals('BBA001')}">href="${item.fd_act_info}"</c:if> <c:if test="${item.fd_act_type.equals('BBA003')}">target="_blank"</c:if>>
	                                    <div class="img">
	                                        <img src="${item.fd_img_path}" />
	                                    </div>
	                                </a>
	                            </li>
	                        </c:forEach>
	                       </ul>
	                    </div>
	                    <div class="login_wrap" id="intro_login">
	                        <div class="tit" <c:if test="${empty loginInfo}"></c:if>>
	                        	<c:if test="${board_list != null}">
		                        	<div <c:if test = "${fn:length(board_list) > 1}" >class="box"</c:if><c:if test="${!(empty loginInfo)}"></c:if>> 
									    <div <c:if test = "${fn:length(board_list) > 1}" >class="boxIn"</c:if>>
									        <ul>
									        <c:forEach var="item" items="${board_list}" varStatus="status">
									            <li class="g_click_area_main_notice g_m_h_notice"><a href="/notice/view?idx=${item.pk_idx}&num=" <c:if test="${!(empty loginInfo)}"></c:if>><c:out value="${item.fd_title}" /></a></li>
									        </c:forEach>
									        </ul>
									    </div>
									</div>
								</c:if>
							</div>
	                        <div class="login_inner">
	                        	<c:if test="${loginInfo == null}">
	                            <div class="inp_wrap">
	                                <div class="form_cont">
	                                    <input type="text" id="user_id" name="user_id" value="" placeholder="아이디">
	                                </div>
	                                <div class="form_cont">
	                                    <input type="password" id="user_pw" name="user_pw" value="" placeholder="비밀번호">
	                                </div>
	                                <div class="chk_wrap">
	                                    <label><input id="chk_save_id" type="checkbox" name="chk_save_id" ><span>아이디 기억하기</span></label>
	                                </div>
	                            </div>
	                            <div class="btn_wrap">
	                                <button type="button" id="btn_login" class="login_btn g_m_l_login">로그인</button>
	                            </div>
	                            <div class="util_wrap">
	                                <a href="/member/join" class="g_m_l_join g_m_l_join">회원가입</a>
	                                <div class="find_mem">
	                                    <a href="/member/find/id" class="g_m_l_find_id">아이디 찾기</a>
	                                    <a href="/member/find/password" class="g_m_l_find_pw" >비밀번호 찾기</a>
	                                </div>
	                            </div>
	                            </c:if>
	                            <c:if test="${loginInfo !=null}">
	                            	<div class="txt_wrap">
	                            		<div class="util">
	                            			<div class="info"><a href="/member/mypage/check" class="g_m_l_my_info">내정보</a></div>
	                            			<div class="btn">
	                            				<c:if test="${loginInfo !=null}">
													<button type="button" onclick="logOut();" class="g_m_l_logout">로그아웃</button>
												</c:if> 
	                            			</div>
	                            		</div>
		                                <div class="name">${loginInfo.fd_medical_name}님</div>
		                                <%-- <div class="stat">
		                                    <ul>
		                                        <li>
		                                            <div>배송중 <span class="num"><a href="/order/list">${deli_count}</a></span></div>
		                                        </li>
		                                        <li>
		                                            <div>쿠폰 <span class="num"><a href="/coupon/list"><c:if test="${!empty couponList}" ><c:out value="${couponList.size()}"/></c:if>
		                                           													   <c:if test="${empty couponList}" >0</c:if>
		                                                                        </a></span></div>
		                                        </li>
		                                        <li>
		                                            <div>포인트 <span class="num"><a href="/coupon/list">
		                                                                         <c:if test="${!empty mileageInfo.fd_mileage_point}" ><fmt:formatNumber value="${mileageInfo.fd_mileage_point}" pattern="#,###" /></c:if>
		                                                                         <c:if test="${empty mileageInfo.fd_mileage_point}" >0</c:if>
		                                            </a></span></div>
		                                        </li>
		                                    </ul>
		                                </div> --%>
		                            </div>
		                            <div class="stat_wrap">
		                            	<ul>
		                            		<li>
		                            			<div>
		                            				<div class="txt">배송중</div>
		                            				<div class="num">
		                            					<a href="/order/list" class="g_m_l_delivery_ing">${deli_count}</a>
		                            				</div>
		                            			</div>
		                            		</li>
		                            		<li>
		                            			<div>
		                            				<div class="txt">쿠폰</div>
		                            				<div class="num">
		                            					<a href="/coupon/list" class="g_m_l_coupon_info">
		                            						<c:if test="${!empty couponList}" ><c:out value="${couponList.size()}"/></c:if>
		                                           			<c:if test="${empty couponList}" >0</c:if>
		                                            	</a>
		                            				</div>
		                            			</div>
		                            		</li>
		                            		<li>
		                            			<div>
		                            				<div class="txt">포인트</div>
		                            				<div class="num">
		                            					<a href="/coupon/list" class="g_m_l_poin_info">
	                                                        <c:if test="${!empty mileageInfo.fd_mileage_point}" ><fmt:formatNumber value="${mileageInfo.fd_mileage_point}" pattern="#,###" /></c:if>
	                                                        <c:if test="${empty mileageInfo.fd_mileage_point}" >0</c:if>
															원
		                                            	</a>
		                            				</div>
		                            			</div>
		                            		</li>
		                            	</ul>
		                            </div>
		                            <!-- <div class="box_wrap">
		                                <div class="txt">가격비교를 통한 1월 비용절감 금액</div>
		                                <div class="num">1,020,000원</div>
		                            </div> -->
		                            <div class="btn_wrap">
		                                <a href="/quickOrder/info" class="btn_quick g_m_l_quick_order">빠른주문하기</a>
		                            </div>
	                            </c:if>
	                        </div>
	                    </div>
	                </form>
	            </div>
	        </article>
	        <article class="atc_row row_00">
	            <div class="inner">
	                <div class="component_wrap col3">
	                    <div class="component">
	                        <div class="component_inner">
	                            <div class="head">
	                                <p class="title">오늘의 찬스<span style="display:none;">${sale_item.fd_date_start} ~ ${sale_item.fd_date_end}</span></p>
	                            </div>
	                            <div class="body">
	                                <div class="prd_list_00">
	                                    <ul id="sale_product_info">
	                                        <li>
	                                            <div>
	                                                <div class="image g_m_c_chance_image">
	                                                    <img src="${sale_item.fd_file_path}" alt="${sale_item.fd_product_name}" title="${sale_item.fd_product_name}">
	                                                </div>
	                                                <div class="text">
	                                                	<div class="discount">
	                                                		<div class="etc"><fmt:formatNumber value="${sale_item.fd_ori_amount}" />원</div>
	                                                		<div class="rate">${discount}%</div>
	                                                		<div class="price"><fmt:formatNumber value="${sale_item.fd_product_amount}" />원</div>
	                                                	</div>
	                                                    <div class="detail g_m_c_week_chance_info">
	                                                        <div id="saleProduct_name" class="title">${sale_item.fd_product_name}</div>
	                                                        <div class="standard">규격 ㅣ ${sale_item.fd_product_standard}</div>
	                                                        <div class="manufact">제조사 ㅣ ${sale_item.fd_company_name}</div>
	                                                        <div class="package">포장단위 ㅣ ${sale_item.fd_product_unit}</div>
	                                                    </div>
	                                                    <div class="button">
	                                                        <button class="btn_cart cart_btn g_m_c_week_chance_cart" type="button"></button>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <%-- <div>
	                                                <div class="image g_m_c_chance_image">
	                                                    <img src="${sale_item.fd_file_path}" alt="${sale_item.fd_product_name}" title="${sale_item.fd_product_name}">
	                                                </div>
	                                                <div class="text">
	                                                    <div class="detail g_m_c_week_chance_info">
	                                                        <div id="saleProduct_name" class="title">${sale_item.fd_product_name}</div>
	                                                        <div class="standard">규격 ㅣ ${sale_item.fd_product_standard}</div>
	                                                        <div class="manufact">제조사 ㅣ ${sale_item.fd_company_name}</div>
	                                                        <div class="package">포장단위 ㅣ ${sale_item.fd_product_unit}</div>
	                                                    </div>
	                                                    <div class="button">
	                                                        <div class="price">
	                                                            <div class="etc"><fmt:formatNumber value="${sale_item.fd_ori_amount}" />원</div>
	                                                            <div class="num">
	                                                                <div class="cost"><fmt:formatNumber value="${sale_item.fd_product_amount}" />원</div>
	                                                                <div class="rate">${discount}%</div>
	                                                            </div>
	                                                        </div>
	                                                        <button class="btn_blue cart_btn g_m_c_week_chance_cart" type="button">장바구니 담기</button>
	                                                    </div>
	                                                </div>
	                                            </div> --%>
	                                            <input type="hidden" id="tpsm_idx" name="tpsm_idx" value="${sale_item.fk_tpsm_idx}"> 
	                                            <input type="hidden" id="tsmi_idx" name="tsmi_idx" value="${sale_item.fk_tsmi_idx}">
	                                            <input type="hidden" id="tpmm_idx" name="tpmm_idx" value="${sale_item.fk_tpmm_idx}">
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="component">
	                        <div class="component_inner">
	                            <div class="head">
	                                <p class="title g_m_c_popularity_more">유통기한 임박</p>
	                                <%--<a href="/product/pclist" class="title g_m_c_popularity_more">가격도, 품질도 BEST &#10095;</a>--%>
	                                <div class="util slide_util_01">
	                                    <button type="button" class="btn_prev g_m_c_popularity_btn"></button>
	                                    <div class="paging">
	                                        <span class="current"></span>/<span class="total"></span>
	                                    </div>
	                                    <button type="button" class="btn_next g_m_c_popularity_btn"></button>
	                                </div>
	                            </div>
	                            <div class="body">
	                                <div class="prd_list_00 slide_list_01">
	                                    <ul>
	                                    	<c:forEach var="item" items="${PPList}" varStatus="status">
	                                        <li>
	                                            <a href="javascript:void(0);" class="g_m_c_popularity_product_info" onclick='moveQuickOrder( "${item.fd_product_name}", "${item.pk_idx}");' >
	                                                <div class="image">
	                                                    <img src="${item.fd_img_path_thumbnail}" alt="${item.fd_product_name}" title="${item.fd_product_name}" >
	                                                </div>
	                                                <div class="text">
	                                                	<div class="discount">
	                                                		<div class="rate">${item.comp_percent}%<span class="symbol">⬇</span></div>
	                                                	</div>
	                                                    <div class="detail">
	                                                        <div class="title">${item.fd_product_name}</div>
	                                                        <div class="standard">규격ㅣ${item.fd_product_standard}</div>
	                                                        <div class="manufact">제조사ㅣ${item.fd_company_info}</div>
	                                                        <div class="package">포장단위ㅣ${item.fd_product_unit}</div>
	                                                    </div>
	                                                    <%--<div class="button">
	                                                        <button class="btn_cart cart_btn" type="button"></button>
	                                                    </div>--%>
	                                                </div>
	                                            </a>
	                                        </li>
	                                        </c:forEach>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="component">
	                        <div class="component_inner">
	                            <div class="head">
	                                <div class="title">
	                                	클리닉 인증 거래 순위
	                                	<div class="btn_information">
	                                		<div class="button"></div>
	                                		<div class="content">
	                                			메디밸류를 이용중인 클리닉에서 인증한 거래 순위입니다.<br>기공소의 <i>누적 거래량순, 최근 거래량순</i>을 보여드립니다.
	                                		</div>
	                                	</div>
                                	</div>
	                                <div class="util">
	                                    <a href="javascript:;" class="btn_detail" onclick="rankDetailPopupEvent();">자세히보기 &#10095;</a>
	                                </div>
	                            </div>
	                            <div class="body">
	                            	<div class="rank_list">
	                            		<table>
	                            			<colgroup>
	                            				<col style="width:14%;" />
	                            				<col style="width:auto;" />
	                            				<col style="width:21%;" />
	                            				<col style="width:21%;" />
	                            			</colgroup>
	                            			<thead>
	                            				<tr>
	                            					<th class="no">순위</th>
	                            					<th class="title">기공소명</th>
	                            					<th class="accum on"><button type="button" class="btn_sort btn_accum" onclick="rankSortButtonEvent(this);">누적거래</button></th>
	                            					<th class="recent"><button type="button" class="btn_sort btn_recent" onclick="rankSortButtonEvent(this);">최근거래</button></th>
	                            				</tr>
	                            			</thead>
	                            			<tbody>
	                            				<tr onclick="rankRowClickEvent(this);">
	                            					<td class="no">1</td>
	                            					<td class="title">
	                            						<div class="txt_title">하늘치과기공소</div>
	                            						<div class="txt_desc">고양 일산동구</div>
	                            					</td>
	                            					<td class="accum on">
	                            						<div class="txt_num">9,999+</div>
	                            					</td>
	                            					<td class="recent">
	                            						<div class="txt_num">1,234</div>
	                            						<div class="txt_range up">869</div>
	                            					</td>
	                            				</tr>
	                            				<tr onclick="rankRowClickEvent(this);">
	                            					<td class="no">2</td>
	                            					<td class="title">
	                            						<div class="txt_title">케이치과기공소</div>
	                            						<div class="txt_desc">서울 구로구</div>
	                            					</td>
	                            					<td class="accum on">
	                            						<div class="txt_num">8,672</div>
	                            					</td>
	                            					<td class="recent">
	                            						<div class="txt_num">1,234</div>
	                            						<div class="txt_range up">869</div>
	                            					</td>
	                            				</tr>
	                            				<tr onclick="rankRowClickEvent(this);">
	                            					<td class="no">3</td>
	                            					<td class="title">
	                            						<div class="txt_title">퍼슨경동치과기공소</div>
	                            						<div class="txt_desc">서울 동작구</div>
	                            					</td>
	                            					<td class="accum on">
	                            						<div class="txt_num">6,812</div>
	                            					</td>
	                            					<td class="recent">
	                            						<div class="txt_num">1,234</div>
	                            						<div class="txt_range up">869</div>
	                            					</td>
	                            				</tr>
	                            				<tr onclick="rankRowClickEvent(this);">
	                            					<td class="no">4</td>
	                            					<td class="title">
	                            						<div class="txt_title">옵투스교정치과기공소</div>
	                            						<div class="txt_desc">대전 대덕구</div>
	                            					</td>
	                            					<td class="accum on">
	                            						<div class="txt_num">2,958</div>
	                            					</td>
	                            					<td class="recent">
	                            						<div class="txt_num">1,234</div>
	                            						<div class="txt_range up">869</div>
	                            					</td>
	                            				</tr>
	                            				<tr onclick="rankRowClickEvent(this);">
	                            					<td class="no">5</td>
	                            					<td class="title">
	                            						<div class="txt_title">당일도착보장치과기공소</div>
	                            						<div class="txt_desc">부산 기장군</div>
	                            					</td>
	                            					<td class="accum on">
	                            						<div class="txt_num">899</div>
	                            					</td>
	                            					<td class="recent">
	                            						<div class="txt_num">1,234</div>
	                            						<div class="txt_range down">74</div>
	                            					</td>
	                            				</tr>
	                            			</tbody>
	                            		</table>
	                            		
	                            		<!-- 리스트 불러오지 못했을 때 START -->
	                            		<div class="rank_loading" style="display:none;">
	                            			<div class="img" onclick="window.location.reload()">
	                            				<img src="/resources/images/main_renew/ico_rank_reload.png" alt="">
	                            			</div>
	                            			<div class="txt">
	                            				<div>
	                            					<b>데이터 로딩에 실패했습니다.</b>
	                            				</div>
	                            				<div>새로고침 또는 잠시 후 다시 시도해주세요.</div>
	                            			</div>
	                            		</div>
	                            		<!-- 리스트 불러오지 못했을 때 END -->
	                            	
	                            	</div>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <%-- <div class="component">
	                        <div class="component_inner">
	                            <div class="head">
	                                <p class="title">후기로 보는 메디밸류</p>
	                                <div class="util slide_util_02">
	                                    <button type="button" class="btn_prev g_m_c_post_btn"></button>
	                                    <div class="paging">
	                                        <span class="current"></span>/<span class="total"></span>
	                                    </div>
	                                    <button type="button" class="btn_next g_m_c_post_btn"></button>
	                                </div>
	                            </div>
	                            <div class="body">
	                                <div class="review_list slide_list_02 g_m_c_post_info">
	                                    <ul>
	                                        <li>
	                                            <a href="/notice/view?idx=52&num=" style="cursor:pointer;">
	                                                <div class="image">
	                                                	<img src="/resources/images/main_renew/img_review_02.png" alt="">
	                                                </div>
	                                            </a>
	                                        </li>
	                                        <li>
	                                            <a href="javascript:;">
	                                                <div class="text">
	                                                    <div class="title">
	                                                        <div class="ico"><img src="/resources/images/main_renew/ico_review_icon.png" alt=""></div>
	                                                        <div class="name">정영복치과 김*은 재료실장님</div>
	                                                    </div>
	                                                    <div class="cont">
	                                                        치과재료플랫폼은 복잡해보이기 쉬운데 메디밸류의 플랫폼은 한 눈에 보이는게 좋았고, 재료 비교도 한 눈에 나와있어 최저가 비교가 편해서 좋아요! 포인트도 나름 쏠쏠하게 쌓이고, 담당 직원분이 너무 친절해서 매번 도움을 받고 있어요.더 많은 사람이 사용했으면 좋겠어요!!
	                                                    </div>
	                                                </div>
	                                            </a>
	                                        </li>
	                                        <li>
	                                            <a href="javascript:;">
	                                                <div class="text">
	                                                    <div class="title">
	                                                        <div class="ico"><img src="/resources/images/main_renew/ico_review_icon.png" alt=""></div>
	                                                        <div class="name">오후치과 장*선 총괄 실장님</div>
	                                                    </div>
	                                                    <div class="cont">
	                                                        기존에 이용하던 업체에서  입고 지연 상태였던 재료를 2개월 가까이 기다리던 중,  메디밸류를 통해 다음 날 해당 재료를 구매할 수 있었고 이후 메디밸류를 애용하게 되었습니다. 항상 친절하고 신속하게 재료들을 찾아서 주문을 도와주시고, 가격 혜택 및 적립금, 여러 다양한 이벤트를 진행해서 참 좋습니다. 늘 친절한 서비스에 만족하고 있고, 앞으로도 애용할 것 같습니다^^
	                                                    </div>
	                                                </div>
	                                            </a>
	                                        </li>
	                                        <li>
	                                            <a href="javascript:;">
	                                                <div class="text">
	                                                    <div class="title">
	                                                        <div class="ico"><img src="/resources/images/main_renew/ico_review_icon.png" alt=""></div>
	                                                        <div class="name">디데이치과 이*아 실장님</div>
	                                                    </div>
	                                                    <div class="cont">
	                                                        저희가 자주 쓰는 재료를 즐겨찾기 해두고, 장바구니에 추가만 하면 돼서 이전보다 재료 주문이 훨씬 수월해졌습니다. 그리고 메디밸류의 빠른주문에 정말 만족합니다. 주문하면 거의 다음날 배송 시작이라는 메시지를 받게 되어 요즘 재료 걱정이 없는 거 같아요. 친절함에 이용하게 돼서 편리함까지 얻게 되니 메디밸류 만족도는 최고입니다 ^_^
	                                                    </div>
	                                                </div>
	                                            </a>
	                                        </li>
	                                        <li>
	                                            <a href="javascript:;">
	                                                <div class="text">
	                                                    <div class="title">
	                                                        <div class="ico"><img src="/resources/images/main_renew/ico_review_icon.png" alt=""></div>
	                                                        <div class="name">연세올림픽치과 정*혜님</div>
	                                                    </div>
	                                                    <div class="cont">
	                                                        제품이미지가 크고 선명해서 사용하기에 편하고 몇 몇 제품은 동영상도 첨부되어 있어, 처음 보는 제품도 사용방법을 익히기에 좋은 것 같습니다. 특히 한 번 구매했던 재료를 다시 검색할 필요 없이 담아서 결제할 수 있고, 덤으로 할인도 받을 수 있어서 일석이조입니다. 더 번창하세요.^^
	                                                    </div>
	                                                </div>
	                                            </a>
	                                        </li>
	                                        <li>
	                                            <a href="javascript:;">
	                                                <div class="text">
	                                                    <div class="title">
	                                                        <div class="ico"><img src="/resources/images/main_renew/ico_review_icon.png" alt=""></div>
	                                                        <div class="name">마이스터치과 이*진 총괄 실장님</div>
	                                                    </div>
	                                                    <div class="cont">
	                                                        포인트 사용 및 적립이 편하고 플랫폼 구성이 단순해서 보기 좋다고 느꼈어요. 매번 다양한 제품을 구매하는 것은 아니라, 병원에 맞춰진 제품을 선택적으로 구매하기 때문에 자주 구매하는 제품 위주로 쉽고 빠르게 구매할 수 있어 좋았습니다. 그리고 문의사항에 적극적으로 응대해 주셔서 너무 만족합니다.
	                                                    </div>
	                                                </div>
	                                            </a>
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div> --%>
	                    
	                </div>
	            </div>
	        </article>
	        <article class="atc_banner">
	        	<div class="inner">
					<div class="banner_wrap">
						<ul>
							<li>
								<a href="/quickOrder/info?searchString=특가"><img src="/resources/images/main_renew/img_banner_02.png" alt=""></a>
							</li>
						</ul>
					</div>
	        	</div>
	        </article>
	        <article class="atc_row row_02">
	            <div class="inner">
	                <div class="component_wrap col3">
	                    <div class="component">
	                        <div class="component_inner">
	                            <div class="head">
	                                <p class="title">스마트한 메디밸류의  다양한서비스를 만나보세요!</p>
	                            </div>
	                            <div class="body">
	                                <div class="banner_01 banner_chat">
	                                    <a href="/intro/counseling" class="g_m_c_landing_dental_material_help">
	                                        <div class="title">
	                                            <span class="font_blue">의료재료</span>에 대해서<br><span class="font_blue">도움</span>이 필요하신가요?
	                                        </div>
	                                    </a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="component">
	                        <div class="component_inner">
	                            <div class="head">
	                                <p class="title">　</p>
	                            </div>
	                            <div class="body">
	                                <div class="banner_01 banner_quick">
	                                    <a href="/intro/quick_order" class="g_m_c_landing_quick_order">
	                                        <div class="title">
	                                            <span class="font_blue">빠른주문하기</span>에 대해서<br><span class="font_blue">궁금하신 점</span>이 있으신가요?
	                                        </div>
	                                    </a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="component">
	                        <div class="component_inner">
	                            <div class="head">
	                                <a href="/company/info" class="title g_m_c_landing_medivalue_btn">메디밸류 소개 &#10095;</a>
	                            </div>
	                            <div class="body">
	                                <div class="banner_01 banner_intro">
	                                    <a href="/company/info" class="g_m_c_landing_medivalue_info">
	                                        <div class="title">
	                                            메디밸류에 대해<br><span class="font_blue">궁금</span>하신가요?
	                                        </div>
	                                    </a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </article>
	        <article class="atc_partner">
	            <div class="inner">
	                <div class="partner_wrap g_m_b_mou_banner">
	                    <div class="text">
	                        <div class="title">[공식 협약 치과의사회]</div>
	                        <div class="desc">의료환경의 미래를 준비하는<br><span class="font_blue">메디밸류와 함께합니다.</span></div>
	                    </div>
	                    <div class="list">
	                        <ul>
	                            <li>
	                                <div>
	                                    <a href="javascript:;"><img src="/resources/images/main_renew/img_partner_03.png" alt=""></a>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <a href="javascript:;"><img src="/resources/images/main_renew/img_partner_15.png" alt=""></a>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <a href="javascript:;"><img src="/resources/images/main_renew/img_partner_11.png" alt=""></a>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <a href="javascript:;"><img src="/resources/images/main_renew/img_partner_04.png" alt=""></a>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <a href="javascript:;">도봉구치과의사회</a>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <a href="javascript:;"><img src="/resources/images/main_renew/img_partner_16.png" alt=""></a>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <a href="javascript:;">양천구치과의사회</a>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <a href="javascript:;"><img src="/resources/images/main_renew/img_partner_09.png" alt=""></a>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <a href="javascript:;"><img src="/resources/images/main_renew/img_partner_17.png" alt=""></a>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <a href="javascript:;">중구치과의사회</a>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <a href="javascript:;"><img src="/resources/images/main_renew/img_partner_10.png" alt=""></a>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <a href="javascript:;"><img src="/resources/images/main_renew/img_partner_08.png" alt=""></a>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <a href="javascript:;"><img src="/resources/images/main_renew/img_partner_13.png" alt=""></a>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <a href="javascript:;">관악구치과의사회</a>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <a href="javascript:;"><img src="/resources/images/main_renew/img_partner_14.png" alt=""></a>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <a href="javascript:;"><img src="/resources/images/main_renew/img_partner_18.png" alt=""></a>
	                                </div>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	        </article>
		</section>
	</jsp:body>
</layout:basicFrame>