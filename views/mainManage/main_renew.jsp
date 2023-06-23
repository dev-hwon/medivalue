<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame2>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/slick.css?v=20230320"/>
		<link rel="stylesheet" href="/resources/css/main.css?v=20230320" />
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
		const _loginInfo = '${loginInfo}';
		let _memberType = ''; // 회원구분
		if(_loginInfo.length>0) {
			_memberType = '${loginInfo.fd_member_type}';
		}
		const _basketCnt = '${requestScope.basket_user_cnt}';
		const _purchaseCnt = '${purchase_totalCount}';
		const _wishCnt = '${requestScope.wish_list_size}';
		const _stDomain = '${st_domain}';

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

		$(function(){
			/* 오늘 하루 열지 않음 공통 START */
	        if (document.cookie.indexOf("today_popup=done") < 0){
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

		function closePopProc(popup_name, popup_limit_day) {
            setCookie(""+popup_name+"", "done" , popup_limit_day);
            $("."+popup_name).hide();
        }
		closePop

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
            const endYear = "2023";
            const endMonth = "4";
            const endDate = "18";
            const endHours = "23";
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

		function check_alert(url, state) {
			if(state.indexOf("MP0001") < 0) {
				/*alert("기공 플랫폼은 현재 베타 서비스로 사전 신청자에 한해서 사용 가능합니다. (사용 문의는 고객센터로 문의해주세요.)");*/
				const target = $(".main_terms_popup");
				target.addClass("on");
				return false;
			}

			if (url !== '') {
				window.location.replace(url);
			}
		}

		function getConfirmAgreement() {
			$.ajax({
				url: "/member/rest/confirm",
				method: "POST",
				success: function (data) {
					if (data["rtn_cd"] === "200") {
						location.reload();
					} else {
						alert(data["rtn_msg"]);
					}
				},
				error: function (error) {
					alert("네트워크 연결을 확인해주세요.");
				},
			});
		}
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
						<%--
						<div class="detail">
							<div class="img">
								<img src="/resources/images/main_renew/img_popup_today_221017.jpg?v20221017" />
							</div>
							<div class="link g_m_popup_event">
								<a href="/notice/view?idx=60" target="_self" ></a>
							</div>
						</div>
						 --%>
						<div class="detail">
							<div class="img">
								<img src="/resources/images/popup/img_popup_today_230414.jpg?v20230414" />
							</div>
						</div>
						<div class="btn">
							<%-- 
							<button type="button" onclick="closePopWeek1();">일주일간 보지 않기</button>
							  --%>
							  <button type="button" onclick="closePopProc('today_popup',1);">오늘 하루 보지 않기</button>
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

			<%-- 기공서비스 약관 동의 팝업 --%>
			<div class="comm_popup comm_main_popup main_terms_popup pop_small" style="visibility: hidden; opacity: 0;">
		        <div class="bg" onclick="closePopup(this);"></div>
		        <div class="content">
		            <div class="popup_inner">
		                <div class="head">
		                    <div class="util">
		                        <div class="comm_button"><button type="button" class="btn_close" onclick="closePopup(this);"></button></div>
		                    </div>
		                </div>
		                <div class="body">
		                    <div class="comm_image">
		                        <img src="/resources/images/main_renew/img_terms_popup.jpg" alt="">
		                    </div>
		                    <a href="/terms/info?tab=3" title="약관보기" class="link" target="_blank"></a>
		                </div>
		                <div class="foot">
		                    <div class="comm_button">
		                        <button type="button" class="btn_primary" onclick="getConfirmAgreement();">동의하고 이용하기</button>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>

			<article class="atc_visual">
				<%--기공수가 픽스 배너 --%>
				<div class="fixed_right_banner login_noti_right_popup" style="display: none;">
					<c:if test="${!fn:contains(loginInfo.medi_add_modulue_info, 'MP0001')}">
						<a href="javascript:;" onclick="check_alert('', '${loginInfo.medi_add_modulue_info}')">
					</c:if>
					<c:if test="${fn:contains(loginInfo.medi_add_modulue_info, 'MP0001')}">
						<a href="javascript:void(0);" onclick="btn_hrefLink('${dt_info}','/estimate/list')">
					</c:if>
						<p class="txt"></p>
						<div class="tx_count">0</div>
					</a>
				</div>
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
	                                        <img src="${st_domain}${item.fd_img_path}" />
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

									<div class="login_noti_popup comm_popup">
										<button type="button" class="btn_close" onclick="closePopup(this)"></button>
										<div id="newPopupInfo" class="text"></div>
										<div class="btn_wrap"><button id="noit_popup_btn" type="button" onclick="btn_hrefLink('${dt_info}','/estimate/list')">나의 문의 내역</button></div>
									</div>
	                            </c:if>

	                        </div>
	                    </div>
	                </form>
	            </div>
	        </article>

			<!-- ai 상품리스트 :: type_ai -->
			<article class="row_set row_pd_list pd_list_ai type_ai" style="display: none;">
				<div class="inner">
					<div class="head">
						<div class="title"><img src="/resources/images/main_renew/icon_thumbUp.png" alt=""/>
							<c:if test="${loginInfo !=null}">
								${loginInfo.fd_medical_name}님께 AI가 추천해요
							</c:if>
							<c:if test="${loginInfo == null}">
								메디밸류가 추천해요
							</c:if>
						</div>
						<div class="unit">
							<div class="tooltip tt_name_ai">
								<button type="button" class="btn_tt">AI추천<i class="icon_help"></i></button>
								<div class="tt_content">회원님의 이용정보를 바탕으로 AI가 추천해요</div>
								<div class="tt_arrow"></div>
							</div>
						</div>
					</div>
					<div class="slick_btn_wrap">
						<button type="button" class="slick_btn slick_btn_prev"><i></i></button>
						<button type="button" class="slick_btn slick_btn_next"><i></i></button>
					</div>
					<div class="pd_lists"></div>
				</div>
			</article>
			<!-- 일반 상품리스트 :: type_default -->

			<!-- 오늘의 특가 찬스 -->
			<article class="row_set row_pd_list pd_list_today_chance type_default" style="display: none;">
				<div class="inner">
					<div class="head">
						<div class="title">오늘의 특가 찬스</div>
						<div class="unit">
							<button type="button" class="slick_btn slick_btn_prev"><i></i></button>
							<button type="button" class="slick_btn slick_btn_next"><i></i></button>
						</div>
					</div>
					<div class="pd_lists"></div>
				</div>
			</article>

			<!-- 오늘의 인기 상품 -->
			<article class="row_set row_pd_list pd_list_today_hot type_default" style="display: none;">
				<div class="inner">
					<div class="head">
						<div class="title">오늘의 인기 상품</div>
						<div class="unit">
							<button type="button" class="slick_btn slick_btn_prev"><i></i></button>
							<button type="button" class="slick_btn slick_btn_next"><i></i></button>
						</div>
					</div>
					<div class="pd_lists"></div>
				</div>
			</article>

			<!-- 관심 집중 상품 -->
			<article class="row_set row_pd_list pd_list_focus type_default" style="display: none;">
				<div class="inner">
					<div class="head">
						<div class="title">관심 집중 상품</div>
						<div class="unit">
							<button type="button" class="slick_btn slick_btn_prev"><i></i></button>
							<button type="button" class="slick_btn slick_btn_next"><i></i></button>
						</div>
					</div>
					<div class="pd_lists"></div>
				</div>
			</article>

			<!-- 자주 산 상품 -->
			<article class="row_set row_pd_list pd_list_favorite type_default" style="display: none;">
				<div class="inner">
					<div class="head">
						<div class="title">자주 산 상품</div>
						<div class="unit">
							<button type="button" class="slick_btn slick_btn_prev"><i></i></button>
							<button type="button" class="slick_btn slick_btn_next"><i></i></button>
						</div>
					</div>
					<div class="pd_lists"></div>
				</div>
			</article>

			<!-- 장바구니 연관상품 -->
			<article class="row_set row_pd_list pd_list_cart_rel type_default" style="display: none;">
				<div class="inner">
					<div class="head">
						<div class="title">장바구니 연관상품</div>
						<div class="unit">
							<button type="button" class="slick_btn slick_btn_prev"><i></i></button>
							<button type="button" class="slick_btn slick_btn_next"><i></i></button>
						</div>
					</div>
					<div class="pd_lists"></div>
				</div>
			</article>

			<!-- 이런상품은 어때요? -->
			<article class="row_set row_pd_list pd_list_recommend type_default" style="display: none;">
				<div class="inner">
					<div class="head">
						<div class="title">이런상품은 어때요?</div>
						<div class="unit">
							<button type="button" class="slick_btn slick_btn_prev"><i></i></button>
							<button type="button" class="slick_btn slick_btn_next"><i></i></button>
						</div>
					</div>
					<div class="pd_lists"></div>
				</div>
			</article>

			<!-- 다른 고객이 많이 구매한 상품 -->
			<article class="row_set row_pd_list pd_list_others type_default" style="display: none;">
				<div class="inner">
					<div class="head">
						<div class="title">다른 고객이 많이 구매한 상품</div>
						<div class="unit">
							<button type="button" class="slick_btn slick_btn_prev"><i></i></button>
							<button type="button" class="slick_btn slick_btn_next"><i></i></button>
						</div>
					</div>
					<div class="pd_lists"></div>
				</div>
			</article>

			<article class="atc_banner">
				<div class="inner">
					<a href="/quickOrder/info?searchString=특가"><img src="/resources/images/main_renew/img_banner_02.png" alt=""></a>
				</div>
			</article>
			<!-- 카테고리 추천상품 -->
			<article class="row_set row_cate_recom" style="display: none;">
				<div class="inner">
					<div class="head">
						<div class="title">카테고리 추천 상품</div>
					</div>
					<div class="cont">
						<div class="c_r_left">
							<div class="cate_tab_menu">
								<div class="selected tx_shortening_1">카테고리명 나오는곳</div>
								<div class="menu_lists">
									<p class="tx_tit">HOT 카테고리</p>
									<ul>
										<li><button type="button" value="">카테고리명1</button> </li>
										<li><button type="button" value="">카테고리명2</button> </li>
										<li><button type="button" value="">카테고리명3 카테고리명3 카테고리명3 카테고리명3</button> </li>
										<li><button type="button" value="">카테고리명4 카테고리명4</button> </li>
										<li><button type="button" value="">카테고 리 명5 카테 고리 명5</button> </li>
										<li><button type="button" value="">카테고 리고리 명6</button></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="c_r_center">
							<div class="banner_slide">
								<div class="item"><a href=""><img src="http://via.placeholder.com/260x407/598bfe/ffffff" alt="배너1"/></a></div>
								<div class="item"><a href=""><img src="http://via.placeholder.com/260x407/fd535b/ffffff" alt="배너2"/></a></div>
								<div class="item"><a href=""><img src="http://via.placeholder.com/260x407/0195ff/ffffff" alt="배너3"/></a></div>
							</div>
						</div>
						<div class="c_r_right">
							<div class="c_r_right_inner_wrap">
								<button type="button" data-tabto="prev" class="btn_tab_prev"><i class="icon_arrow_tab"></i></button>
								<button type="button" data-tabto="next" class="btn_tab_next"><i class="icon_arrow_tab"></i></button>
								<div class="pd_lists"></div>
							</div>
						</div>
					</div>
				</div>
			</article>
			<!-- 추천 브랜드관 -->
			<article class="row_set row_brand_recom" style="display: none;">
				<div class="inner">
					<div class="head">
						<div class="title">추천 브랜드관
							<div class="tooltip tt_name_brand">
								<button type="button" class="btn_tt"><i class="icon_help"></i></button>
								<div class="tt_content">고품질 브랜드 추천 제품을 만나보세요</div>
								<div class="tt_arrow"></div>
							</div>
						</div>
					</div>
					<div class="cont">
						<div class="brand_tab_menu">
							<button type="button" class="slick_btn slick_btn_prev_tabmenu"><i></i></button>
							<button type="button" class="slick_btn slick_btn_next_tabmenu"><i></i></button>
							<div class="lists">
								<div class="list_item"><button type="button" class="active"><img src="/resources/images/main_renew/logo_brand/logo_mani.png" alt="mani" /><span class="tx_name">mani</span></button></div>
								<div class="list_item"><button type="button"><img src="/resources/images/main_renew/logo_brand/logo_spident.png" alt="spident" /><span class="tx_name">spident</span></button></div>
								<div class="list_item"><button type="button"><img src="/resources/images/main_renew/logo_brand/logo_gc.png" alt="gc" /><span class="tx_name">gc</span></button></div>
								<div class="list_item"><button type="button"><img src="/resources/images/main_renew/logo_brand/logo_3mespe.png" alt="3mespe" /><span class="tx_name">3mespe</span></button></div>
								<div class="list_item"><button type="button"><img src="/resources/images/main_renew/logo_brand/logo_king.png" alt="king" /><span class="tx_name">king</span></button></div>
								<div class="list_item"><button type="button"><img src="/resources/images/main_renew/logo_brand/logo_shofu.png" alt="shofu" /><span class="tx_name">shofu</span></button></div>
								<div class="list_item"><button type="button"><img src="/resources/images/main_renew/logo_brand/logo_dentkist.png" alt="dentkist" /><span class="tx_name">dentkist</span></button></div>
								<div class="list_item"><button type="button"><img src="/resources/images/main_renew/logo_brand/logo_dentsply.png" alt="dentsply" /><span class="tx_name">dentsply</span></button></div>
							</div>
						</div>
						<div class="pd_lists_wrap">
							<button type="button" class="slick_btn slick_btn_prev"><i></i></button>
							<button type="button" class="slick_btn slick_btn_next"><i></i></button>
							<div class="pd_lists"></div>
						</div>
					</div>
				</div>
			</article>

			<!-- 공식 협약 치과의사회 -->
			<article class="row_partner">
				<div class="inner">
					<div class="head">
						<div class="title">공식 협약 치과의사회 <em>의료환경의 미래를 준비하는메디밸류와 함께합니다.</em></div>
						<div class="unit">
							<button type="button" class="slick_btn slick_btn_prev"><i></i></button>
							<button type="button" class="slick_btn slick_btn_next"><i></i></button>
						</div>
					</div>
					<div class="lists">

					</div>
				</div>
			</article>
		</section>
		<script>
			let arr_partner = [
				{"img_path" : "/resources/images/main_renew/logo_partner/partner1.png", "name" : "강남구 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner2.png", "name" : "서울여자 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner3.png", "name" : "인천시 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner4.png", "name" : "강동구 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner5.png", "name" : "강서구 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner6.png", "name" : "구로구 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner7.png", "name" : "관악구 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner8.png", "name" : "도봉구 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner9.png", "name" : "동작구 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner10.png", "name" : "부천시 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner11.png", "name" : "서초구 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner12.png", "name" : "수원시 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner13.png", "name" : "안양시 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner14.png", "name" : "양천구 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner15.png", "name" : "은평구 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner16.png", "name" : "중구 치과의사회" },
				{"img_path" : "/resources/images/main_renew/logo_partner/partner17.png", "name" : "충남 치과의사회" }
			]
			let html_partner = '';
			$.each(arr_partner, function(index, item){
				html_partner += '<div class="item"><img src="'+ item.img_path +'" alt="'+ item.name +'" /></div>';
			});
			$('.row_partner .lists').append(html_partner).slick({
				rows: 2,
				slidesPerRow: 6,
				infinite: true,
				// autoplay: true,
				// autoplaySpeed: 5000,
				speed: 500,
				fade: false,
				swipe: true,
				swipeToSlide: true,
				dots: false,
				arrows: true,
				prevArrow : $(".row_partner .slick_btn_prev"),
				nextArrow : $(".row_partner .slick_btn_next")
			});

			function addComma(data) {
				return data.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}

			function loadPdlist(data, type) {
				// 할인 퍼센트 - ai리스트
				// 판매가 문구 - ai리스트, 카테고리추천, 추천브랜드

				let html  = "";
				$.each(data, function(index, item){
					// let fd_discount_percent = ( item.fd_discount_amount === item.fd_product_amount ? 0 : (item.fd_discount_amount / item.fd_product_amount ) * 100);
					let fd_discount_percent = parseInt((item.fd_discount_amount / item.fd_product_amount ) * 100);
					if(index < 6) {
						html += '<div class="item">'
						html += '	<a href="'+ item.pk_idx +'">'
						html += '		<div class="item_img">'
						html += '			<div class="img_wrap">'
						html += '				<img src="'+ _stDomain + '' + item.fd_img_path +'" alt="'+ item.fd_product_name +'"/>'
						html += '			</div>'
						html += '		</div>'
						html += '		<div class="item_info">'
						html += '			<div class="tx_tit tx_shortening_2">'+ item.fd_product_name +'</div>'
						html += '			<div class="tx_subinfo">'
						html += '				<span class="subinfo_maker">제조사 : <em>'+ item.fd_company_info +'</em></span>'
						html += '				<span class="subinfo_unit">포장단위 : <em>'+ item.fd_product_unit +'</em></span>'
						html += '				<span class="subinfo_standard">규격 : <em>'+ item.fd_product_standard +'</em></span>'
						html += '			</div>'
						html += '			<div class="tx_price">'
						if( type === '' || type === undefined || type === null ) {
							html += '				<div class="tx_price_discountPer">'+ fd_discount_percent +'%</div>'
						}
						html += '				<div class="tx_price_origin">'+ ( type === 'ai' || type === 'category' || type === 'brand' ? '<span class="tx_prefix">판매가</span>' : '')+'<em>'+ addComma(item.fd_product_amount) +'</em>원</div>'
						html += '				<div class="tx_price_discount"><span class="tx_prefix">최대할인 적용가</span><em>'+ addComma(item.fd_discount_amount) +'</em>원</div>'
						html += '			</div>'
						html += '		</div>'
						html += '	</a>'
						html += '	<button type="button" class="btn_add_cart"><i class="ic_svg icon_cart"></i></button>'
						html += '</div>'
					}

				});
				return html;
			}
			function initSlide(target, datas, type) {
				if(!datas || datas.length==0) {
					destroyPdList($(target).closest('.row_pd_list'));
					return;
				}
				$(target).append(loadPdlist(datas, type)).slick({
					slidesToShow: 5,
					slidesToScroll: 1,
					infinite: true,
					// autoplay: true,
					// autoplaySpeed: 5000,
					speed: 500,
					fade: false,
					swipe: true,
					swipeToSlide: true,
					dots: false,
					arrows: true,
					prevArrow : $(target).parents(".row_pd_list").find(".slick_btn_prev"),
					nextArrow : $(target).parents(".row_pd_list").find(".slick_btn_next")
				});
				$(target).closest('article').show();
			}
			function initSlideBrand(target, datas, type) {
				$(target).append(loadPdlist(datas, type)).slick({
					slidesToShow: 3,
					slidesToScroll: 1,
					infinite: true,
					// autoplay: true,
					// autoplaySpeed: 5000,
					speed: 500,
					fade: false,
					swipe: true,
					swipeToSlide: true,
					dots: false,
					arrows: true,
					prevArrow : $(target).parents(".row_set").find(".slick_btn_prev"),
					nextArrow : $(target).parents(".row_set").find(".slick_btn_next")
				});
			}
			function destroyPdList(target) {
				$(target).remove();
			}
			$.ajax({
				url: "/main/rest/recommendList",
				method: "GET",
				dataType: "json"
			})
			.done(function(data) {
				if(data.list) {
					const item = data.list;
					if(item.ai_recom || item.medi_recom) {
						if (_memberType!==undefined && _memberType == 'C') {
							initSlide('.pd_list_ai .pd_lists', item.ai_recom.list, 'ai'); // 클리닉 + 로그인 시
						} else {
							initSlide('.pd_list_ai .pd_lists', item.medi_recom.list, 'ai'); // 비로그인, 기공소
						}
					}
					if(item.today_chance) {
						initSlide('.pd_list_today_chance .pd_lists', item.today_chance.list); // 오늘의 특가 찬스
					}
					if(item.today_hot) {
						initSlide('.pd_list_today_hot .pd_lists', item.today_hot.list); // 오늘의 인기 상품
					}
					if(item.focus) {
						initSlide('.pd_list_focus .pd_lists', item.focus.list); // 관심 집중 상품
					}
					if(item.favorite && _purchaseCnt.length>0 && parseInt(_purchaseCnt)>0) {
						initSlide('.pd_list_favorite .pd_lists', item.favorite.list); // 자주 산 상품
					}
					if(item.cart_rel && _basketCnt.length>0 && parseInt(_basketCnt)>0) {
						initSlide('.pd_list_cart_rel .pd_lists', item.cart_rel.list); // 장바구니 연관상품
					}
					if(item.recommend && _wishCnt.length>0 && parseInt(_wishCnt)>0) {
						initSlide('.pd_list_recommend .pd_lists', item.recommend.list); // 이런 상품은 어때요?
					}
					if(item.category) {
						$('.row_cate_recom .pd_lists').append(loadPdlist(item.category.list, 'category'));
						$('.row_cate_recom').show();
						$(".row_cate_recom .banner_slide").slick({
							slidesToShow: 1,
							slidesToScroll: 1,
							infinite: true,
							// autoplay: true,
							// autoplaySpeed: 5000,
							speed: 500,
							fade: false,
							swipe: true,
							swipeToSlide: true,
							dots: true,
							arrows: false,
						});
						$(".row_cate_recom .menu_lists ul li button").on('click', function(){
							let seelected_name = $(this).text();
							let selected_idx = $(this).parent().index();
							$(this).parents('.row_cate_recom').find('.selected').text(seelected_name);
							console.log(selected_idx);
						});
					} else {
						destroyPdList('.row_cate_recom');
					}
					if(item.brand) {
						initSlideBrand('.row_brand_recom .pd_lists', item.brand.list, 'brand');
						$('.row_brand_recom').show();
						$('.brand_tab_menu button').on('click', function(){
							$(this).addClass('active').parent().siblings().find('button').removeClass('active');
							// 관련리스트 호출
						});
						$(".row_brand_recom .brand_tab_menu .lists").slick({
							slidesToShow: 6,
							slidesToScroll: 1,
							infinite: true,
							// autoplay: true,
							// autoplaySpeed: 5000,
							// speed: 500,
							fade: false,
							swipe: true,
							swipeToSlide: true,
							dots: false,
							arrows: true,
							prevArrow : $(".brand_tab_menu .slick_btn_prev_tabmenu"),
							nextArrow : $(".brand_tab_menu .slick_btn_next_tabmenu")
						});
					} else {
						destroyPdList('.row_brand_recom');
					}
				}
			})
			.fail(function(xhr, status, errorThrown) {
				console.warn('error');
			})

			$('.btn_add_cart').on('click', function(){
				popAlarm_renew('test goods title', 1, 2)
			});

			$('.tooltip .btn_tt').on('click', function(){
				let tooltip = $(this).parent();
				$('.tt_content, .tt_arrow', tooltip).stop().fadeIn().delay(1500).fadeOut();
			});
		</script>
	</jsp:body>
</layout:basicFrame2>