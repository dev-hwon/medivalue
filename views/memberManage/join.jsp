<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
<%--		<script type="text/javascript" src="/resources/js/validator.min.js"></script>--%>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">

			// IE 브라우저 replaceAll 호환성 처리 
			let agent = navigator.userAgent.toLowerCase();

			function custom_startsWith(str, keyword) {
				if (str.length < keyword.length) { return false; }
					return str.indexOf(keyword) == 0;
			}
		
			var signInPopup = {
				showMessage: function (msg) {
					$("#pop_alarm_msg").text(msg);
					$("#black").show();
					$(".popup_message_type_1").show();
				}
			}

			var phoneNumber = {
				formatter: function (value) {
					let joinTel = value;
					
					if(agent.indexOf("trident") != -1) {
						joinTel = joinTel.replace(/[^0-9]/g, "");
					} else {
						joinTel = joinTel.replaceAll(/[^0-9]/g, "");
					}
					
					if (joinTel != null || joinTel != '') {

						if (joinTel.length > 11) {
							joinTel = joinTel.slice(0, 11);
						}

						if(agent.indexOf("trident") != -1) {
							if (joinTel.length == 8) {
								joinTel = joinTel.slice(0, 4) + "-" + joinTel.slice(4, 8);
							} else if (joinTel.length == 9) {
								joinTel = joinTel.slice(0, 2) + "-" + joinTel.slice(2, 5) + "-" + joinTel.slice(5, 9);
							} else if(joinTel.length == 10 && custom_startsWith(joinTel, "02")) {
								joinTel = joinTel.slice(0, 2) + "-" + joinTel.slice(2, 6) + "-" + joinTel.slice(6, 10);
							} else if (joinTel.length == 10) {
								joinTel = joinTel.slice(0, 3) + "-" + joinTel.slice(3, 6) + "-" + joinTel.slice(6, 10);
							} else if (joinTel.length == 11) {
								joinTel = joinTel.slice(0, 3) + "-" + joinTel.slice(3, 7) + "-" + joinTel.slice(7, 11);
							}
						} else {
							if (joinTel.length == 8) {
								joinTel = joinTel.slice(0, 4) + "-" + joinTel.slice(4, 8);
							} else if (joinTel.length == 9) {
								joinTel = joinTel.slice(0, 2) + "-" + joinTel.slice(2, 5) + "-" + joinTel.slice(5, 9);
							} else if(joinTel.length == 10 && joinTel.startsWith("02")) {
								joinTel = joinTel.slice(0, 2) + "-" + joinTel.slice(2, 6) + "-" + joinTel.slice(6, 10);
							} else if (joinTel.length == 10) {
								joinTel = joinTel.slice(0, 3) + "-" + joinTel.slice(3, 6) + "-" + joinTel.slice(6, 10);
							} else if (joinTel.length == 11) {
								joinTel = joinTel.slice(0, 3) + "-" + joinTel.slice(3, 7) + "-" + joinTel.slice(7, 11);
							}
						}
						
						return joinTel;
					}
				}
			}

			var birthDay = {
				formatter: function (value) {
					let joinBirth = value;

					if(agent.indexOf("trident") != -1) {
						joinBirth = joinBirth.replace(/[^0-9]/g, "");
					} else {
						joinBirth = joinBirth.replaceAll(/[^0-9]/g, "");
					}
					
					if (joinBirth != null || joinBirth != '') {
						if (joinBirth.length > 8) {
							joinBirth = joinBirth.slice(0, 8);
						}

						if (joinBirth.length == 8) {
							joinBirth = joinBirth.slice(0, 4) + "/" + joinBirth.slice(4, 6) + "/" + joinBirth.slice(6, 8);
						}

						return joinBirth;
					}
				}
			}

			// $("#joinBirth").val(birthDay.formatter($("#joinBirth").val()));
			// $("#joinTel").val(phoneNumber.formatter($("#joinTel").val()));
			// $("#joinMobile").val(phoneNumber.formatter($("#joinMobile").val()));
			// $("#joinInNum").val(phoneNumber.formatter($("#joinInNum").val()));

			//value validator
			var validator = {
				id: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("아이디를 입력해주세요.");
						return false;
					}

					value = value.trim();
					let valid = /\s/g;
					if (valid.test(value)) {
						signInPopup.showMessage("유효하지 않은 아이디 입니다.");
						return false;
					}

					if (value.length < 6) {
						signInPopup.showMessage("아이디는 최소 6자리여야 합니다.");
						return false;
					}

					return true;
				},
				pw: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("비밀번호를 입력해주세요.");
						return false
					}
					value = value.trim();
					let valid = /\s/g;

					if (valid.test(value)) {
						signInPopup.showMessage("유효하지 않은 비밀번호 입니다.");
						return false;
					}

					if (value.length < 8) {
						signInPopup.showMessage("비밀번호는 최소 8자리여야 합니다.");
						return false;
					}

					if (value.length >= 16) {
						signInPopup.showMessage("비밀번호는 최대 16자리 입니다.");
						return false;
					}

					return true;
				},
				name: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("이름(대표자)를 입력해주세요.");
						return false
					}
					return true;
				},
				lic: function (value, joinType) {

					if (joinType === "L") {
						return true;
					}

					if (value == null || value == "") {
						signInPopup.showMessage("면허번호를 입력해주세요.");
						return false;
					}
					return true;
				},
				ins: function (value, joinType) {

					let medicalName = "";

					if (joinType === "L") {
						medicalName = "기공소";
					} else {
						medicalName = "의료기관";
					}

					if (value == null || value == "") {
						signInPopup.showMessage(medicalName + "명을 입력해주세요.");
						return false;
					}
					return true;
				},
				birthDay: function (value, joinType) {

					if (joinType === "L") {
						return true;
					}

					if (value == null || value == "") {
						signInPopup.showMessage("생년월일을 입력해주세요.");
						return false
					}
					value = value.trim();
					let valid = /(\d{4})\/(\d{2})\/(\d{2})|((\d{4})(\d{2})(\d{2}))/g;
					if (!valid.test(value)) {
						signInPopup.showMessage("유효하지 않은 생년월일 입니다.");
						return false;
					}
					return true;
				},
				email: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("이메일을 입력해주세요.");
						return false;
					}
					value = value.trim();
					let valid = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/g;
					if (!valid.test(value)) {
						signInPopup.showMessage("유효하지 않은 이메일 입니다.");
						return false;
					} else {
						return true;
					}
				},
				addr1: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("상세주소를 검색해주세요.");
						return false
					}
					return true;
				},
				addr2: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("나머지 주소를 입력해주세요.");
						return false
					}
					return true;
				},
				tel: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("전화번호를 입력해주세요.");
						return false
					}
					// value = value.trim();
					// let valid = /[\d]{2,3}[\d]{4}[\d]{4}/g;
					// if (!valid.test(value)) {
					// 	signInPopup.showMessage("전화번호 숫자만 입력해주세요.");
					// 	return false;
					// }
					return true;
				},
				mobile: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("휴대폰번호를 입력해주세요.");
						return false
					}

					// value = value.trim();
					// let valid = /[\d]{3}[\d]{4}[\d]{4}/g;
					// if (!valid.test(value)) {
					// 	signInPopup.showMessage("휴대폰번호 숫자만 입력해주세요.");
					// 	return false;
					// }
					return true;
				},
				person: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("추천인을 입력해주세요.");
						return false
					}
					return true;
				},
				mu: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("상호를 입력해주세요.");
						return false
					}
					value = value.trim();
					let valid = /\s/g;
					if (valid.test(value)) {
						signInPopup.showMessage("띄어쓰기 없이 입력해주세요.");
						return false;
					}
					return true;
				},
				busiNum: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("사업자번호를 입력해주세요.");
						return false
					}
					value = value.trim();
					let valid = /\s|-/g;
					if (valid.test(value)) {
						signInPopup.showMessage("띄어쓰기, - 없이 입력해주세요.");
					}
					return true;
				},
				ceo: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("이름(대표자)를 입력해주세요.");
						return false
					}
					return true;
				},
				indus1: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("업태를 입력해주세요.");
						return false
					}
					return true;
				},
				indus2: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("종목을 입력해주세요.");
						return false
					}
					return true;
				},
				baAddr1: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("사업자 주소를 검색해주세요.");
						return false
					}
					return true;
				},
				baAddr2: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("사업자 나머지 주소를 입력해주세요.");
						return false
					}
					return true;
				},
				// dep: function (value) {
				// 	if (value == null || value == "") {
				// 		signInPopup.showMessage("예금주 명을 입력해주세요.");
				// 		return false
				// 	}
				// 	return true;
				// },
				// bankAccount: function (value) {
				// 	if (value == null || value == "") {
				// 		signInPopup.showMessage("환불계좌 은행을 선택해주세요.");
				// 		return false
				// 	}
				// 	return true;
				// },
				// refBankAccount: function (value) {
				// 	if (value == null || value == "") {
				// 		signInPopup.showMessage("계좌번호를 입력해주세요.");
				// 		return false
				// 	}
				// 	return true;
				// },
				heal1: function (value, joinType) {

					if (joinType === "L") {
						return true;
					}

					if (value == null || value == "") {
						signInPopup.showMessage("요양기관기호를 입력해주세요.");
						return false
					}
					return true;
				},
				heal2: function (value, joinType) {

					if (joinType === "L") {
						return true;
					}

					if (value == null || value == "") {
						signInPopup.showMessage("요양기관명칭을 입력해주세요.");
						return false;
					}
					return true;
				},
				joinIn: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("이름(담당자)를 입력해주세요.");
						return false
					}
					return true;
				},
				joinInNum: function (value) {
					if (value == null || value == "") {
						signInPopup.showMessage("연락처(담당자)를 입력해주세요.");
						return false;
					}
					value = value.trim();
					// let valid = /[\d]{3}[\d]{4}[\d]{4}|[\d]{2,3}[\d]{4}[\d]{4}/g;
					// if (!valid.test(value)) {
					// 	signInPopup.showMessage("유효하지 않은 연락처(담당자) 입니다.");
					// 	return false;
					// }
					return true;
				},
				joinGender: function (value, joinType) {

					if (joinType === "L") {
						return true;
					}

					if (value == null || value == "") {
						signInPopup.showMessage("성별을 선택해주세요.");
						return false;
					}
					return true;
				}
			}

			$(document).ready(function (){
				$(".all_chk_cb").click(function(){
					if($(".all_chk_cb").prop("checked")){
						$("input[name=acc]").prop("checked",true);
					}else{
						$("input[name=acc]").prop("checked",false);
					}
				});

				$("#terms6").on("click", function(){
					if($(this).prop("checked")){
						$(this).siblings(".terms_chk_sub").find(".nm_chk").prop("checked", true);
					}else{
						$(this).siblings(".terms_chk_sub").find(".nm_chk").prop("checked", false);
					}
				});
				
				$(".terms_chk_sub .nm_chk").on("click", function(){
					if ($(".terms_chk_sub .nm_chk:checked").length == $(".terms_chk_sub .nm_chk").length) {
						$("#terms6").prop("checked",true);
					}else{
						$("#terms6").prop("checked",false);
					}
				});
				
				$(".nm_chk").on("click", function  () {
					if ($(".nm_chk:checked").length == $(".nm_chk").length) {
						$(".all_chk_cb").prop("checked",true);
					}else{
						$(".all_chk_cb").prop("checked",false);
					}
				});

				var $termsView=$("#sub0_2 .cnt1 .area .real_area .join_wrap .txt ul li.join_li28 .chk_wrap .terms_chk > button");
				var $termsClose=$("#sub0_2 .cnt1 .area .real_area .join_wrap .txt ul li.join_li28 .chk_wrap .terms_chk .terms_popup .terms_close, #sub0_2 .cnt1 .area .real_area .join_wrap .txt ul li.join_li28 .chk_wrap .terms_chk .terms_popup .terms_btn");

				$termsView.on("click", function  () {
					$(this).next().css("display","block");
					$("#black").css("display","block");
				});

				$termsClose.on("click", function  () {
					$(this).parent().css("display","none");
					$("#black").css("display","none");
				});

				$("#black").on("click", function  () {
					$termsClose.click()
				});

				$("#dup_btn_id").on("click", function () {
					let joinId = $("#joinId").val().trim();

					if (validator.id(joinId)) {
						$.ajax({
							url: "/member/rest/duplicate/id",
							method: "POST",
							contentType: "application/json",
							data: JSON.stringify({
								joinId: joinId
							}),
							success: function (data) {
								if(data["rtn_code"] == '200'){
									$("#joinIdChk").val("true");
								}
								signInPopup.showMessage(data["rtn_msg"]);
							}
						});
					} else {
						signInPopup.showMessage("아이디 값을 확인해주세요.");
					}
				});


				$(document).on("keyup", "#joinPwRe, #joinPw", function () {
					let joinPw = $("#joinPw").val().trim();
					let joinPwRe = $("#joinPwRe").val().trim();

					if ((joinPw != null && joinPw != "")
							&& (joinPwRe != null && joinPwRe != "")) {
						if (joinPw != joinPwRe) {
							$(".pw_caution").prop("hidden", false);
							$("#joinPwReChk").val(true);
						} else {
							$(".pw_caution").prop("hidden", true);
							$("#joinPwReChk").val(false);
						}
					}
				});

				$("#joinId").on("keyup", function () {
					$("#joinIdChk").val("false");
				});

				$("#joinEmail").on("keyup", function () {
					$("#joinEmailChk").val("false");
				});

				$("#dup_btn_email").on("click", function () {
					let joinEmail = $("#joinEmail").val().trim();

					if (validator.email(joinEmail)) {
						$.ajax({
							url: "/member/rest/duplicate/email",
							method: "POST",
							contentType: "application/json",
							data: JSON.stringify({
								joinEmail: joinEmail
							}),
							success: function (data) {
								if(data["rtn_code"] == '200'){
									$("#joinEmailChk").val("true");
								}
								signInPopup.showMessage(data["rtn_msg"]);
							}
						});
					}

				});

				$("#per_sch_btn_id").on("click", function () {
					//추천인 검색
					let joinPerson = $("#joinPerson").val().trim();
					if (validator.person(joinPerson)) {
						$.ajax({
							url: "/member/rest/recommend/check",
							method: "POST",
							contentType: "application/json",
							data: JSON.stringify({
								recommendInfo: joinPerson
							}),
							success: function (data) {
								if(data["rtn_code"] == '200'){
									$("#linkShopIdx").val(data["tsmi_idx"]);
								}
								signInPopup.showMessage(data["rtn_msg"]);
							}
						});
					}
				});

				$("#joinAddr1, #addr_sch_btn").on("click", function(){
					new daum.Postcode({
						oncomplete: function(data) {
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수
							var jibunAddress = data.jibunAddress;
							if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
								extraRoadAddr += data.bname;
							}
							if(data.buildingName !== '' && data.apartment === 'Y'){
								extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							}
							if(extraRoadAddr !== ''){
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							$("#form_addr > .form_cont input[type=text]").siblings("label").hide();
							$("#addrPost").val(data.zonecode);
							if(roadAddr != ''){
								$("#joinAddr1").val(roadAddr + extraRoadAddr);
							}else if(jibunAddress != ''){
								$("#joinAddr1").val(data.jibunAddress + extraRoadAddr);
							}
							if(roadAddr !== ''){
								//$("#joinAddr2").val(extraRoadAddr);
								$("#joinAddr2").val('');
							} else {
								$("#joinAddr2").val('');
							}
						},
						onclose: function(state) {
							if(state === 'FORCE_CLOSE'){
								// $("#alarm_msg").text('확인된 주소를 등록해주세요.');
								// $("#notice_view").addClass('on');
							} else if(state === 'COMPLETE_CLOSE'){
								// self.close();
								// $("#addr_detail").focus();
							}
						}
					}).open({
					    popupKey: 'popup1'
					});
				});

				$("#joinBa1, #ba_sch_btn").on("click", function(){
					new daum.Postcode({
						oncomplete: function(data) {
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수
							var jibunAddress = data.jibunAddress;
							if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
								extraRoadAddr += data.bname;
							}
							if(data.buildingName !== '' && data.apartment === 'Y'){
								extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							}
							if(extraRoadAddr !== ''){
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							$("#form_ba > .form_cont input[type=text]").siblings("label").hide();
							$("#baPost").val(data.zonecode);
							if(roadAddr != ''){
								$("#joinBa1").val(roadAddr + extraRoadAddr);
							}else if(jibunAddress != ''){
								$("#joinBa1").val(data.jibunAddress + extraRoadAddr);
							}
							if(roadAddr !== ''){
								//$("#joinBa2").val(extraRoadAddr);
								$("#joinBa2").val('');
							} else {
								$("#joinBa2").val('');
							}
						},
						onclose: function(state) {
							if(state === 'FORCE_CLOSE'){
								// $("#alarm_msg").text('확인된 주소를 등록해주세요.');
								// $("#notice_view").addClass('on');
							} else if(state === 'COMPLETE_CLOSE'){
								// self.close();
								// $("#addr_detail").focus();
							}
						}
					}).open({
					    popupKey: 'popup1'
					});
				});

				$("#addrSame").on("click", function () {
					let joinAddr1 = $("#joinAddr1").val();
					let joinAddr2 = $("#joinAddr2").val();
					let addrPost = $("#addrPost").val();
					$("#form_ba > .form_cont input[type=text]").siblings("label").hide();
					$("#joinBa1").val(joinAddr1);
					$("#joinBa2").val(joinAddr2);
					$("#baPost").val(addrPost);
				});

				$("#joinBirth").on("keyup", function () {
					let value = $(this).val();
					$(this).val(birthDay.formatter(value));
				});

				$("#joinTel").on("keyup", function () {
					let value = $(this).val();
					$(this).val(phoneNumber.formatter(value));
				});

				$("#joinMobile").on("keyup", function () {
					let value = $(this).val();
					$(this).val(phoneNumber.formatter(value));
				});

				$("#joinInNum").on("keyup", function () {
					let value = $(this).val();
					$(this).val(phoneNumber.formatter(value));
				});

				$("#joinLic").on("keyup", function () {
					let value = $(this).val();
					if(agent.indexOf("trident") != -1) {
						value = value.replace(/[^0-9]/g, "");
					} else {
						value = value.replaceAll(/[^0-9]/g, "");
					} 
						
					$(this).val(value);
				});

				$("#joinBusiNum").on("keyup", function () {
					let value = $(this).val();
					if(agent.indexOf("trident") != -1) {
						value = value.replace(/[^0-9]/g, "");
					} else {
						value = value.replaceAll(/[^0-9]/g, "");
					}					
					
					$(this).val(value);
				});

				$("#joinHeal1").on("keyup", function () {
					let value = $(this).val();
					if(agent.indexOf("trident") != -1) {
						value = value.replace(/[^0-9]/g, "");
					} else {
						value = value.replaceAll(/[^0-9]/g, "");
					}
					
					$(this).val(value);
				});

				$(".join_btn").on("click", function () {

					let joinType = $(".join_type input[name='join_type']:checked").val();

					let joinIdChk = $("#joinIdChk").val();
					let joinEmailChk = $("#joinEmailChk").val();
					let joinPwReChk = $("#joinPwRechk").val();

					//valid check
					let joinId = $("#joinId").val();
					let joinPw = $("#joinPw").val();
					let joinPwRe = $("#joinPwRe").val();

					let joinName = $("#joinName").val();
					let joinLic = $("#joinLic").val();

					let joinIns = $("#joinIns").val();
					let joinLab = $("#joinLab").val();

					let joinBirth = $("#joinBirth").val();
					let joinEmail = $("#joinEmail").val();

					let joinAddr1 = $("#joinAddr1").val();
					let joinAddr2 = $("#joinAddr2").val();
					let addrPost = $("#addrPost").val();

					let joinTel = $("#joinTel").val();

					let joinMobile = $("#joinMobile").val();
					let joinPerson = $("#joinPerson").val();
					let linkShopIdx = $("#linkShopIdx").val();

					// let mailReceive = $("input[name='mailReceive']:checked").val();
					// let smsReceive = $("input[name='smsReceive']:checked").val();
					let mailReceive = $("#mailReceive:checked").val();
					let smsReceive = $("#smsReceive:checked").val();
					if (mailReceive == null || mailReceive === '') {
						mailReceive = 'N'
					}

					if (smsReceive == null || smsReceive === '') {
						smsReceive = 'N'
					}

					let joinMu = $("#joinMu").val();
					let joinBusiNum = $("#joinBusiNum").val();
					let joinCeo = $("#joinCeo").val();
					let joinIndus1 = $("#joinIndus1").val();
					let joinIndus2 = $("#joinIndus2").val();

					let joinBa1 = $("#joinBa1").val();
					let joinBa2 = $("#joinBa2").val();
					let baPost = $("#baPost").val();

					// let joinDep = $("#joinDep").val().trim();
					// let joinBank = $("#bankList option:selected").val();
					// let joinRef = $("#joinRef").val().trim();

					let joinHeal1 = $("#joinHeal1").val();
					let joinHeal2 = $("#joinHeal2").val();

					let joinIn = $("#joinIn").val();
					let joinInNum = $("#joinInNum").val();

					let joinGender = $("input[name='gender']:checked").val();

					if(agent.indexOf("trident") != -1) {
						joinLic = joinLic.replace(/[^0-9]/g, "");
						joinBirth = joinBirth.replace(/[^0-9]/g, "");
						joinTel = joinTel.replace(/[^0-9]/g, "");
						joinMobile = joinMobile.replace(/[^0-9]/g, "");
						joinInNum = joinInNum.replace(/[^0-9]/g, "");
						joinHeal1 = joinHeal1.replace(/[^0-9]/g, "");
						joinBusiNum = joinBusiNum.replace(/[^0-9]/g, "");
					} else {
						joinLic = joinLic.replaceAll(/[^0-9]/g, "");
						joinBirth = joinBirth.replaceAll(/[^0-9]/g, "");
						joinTel = joinTel.replaceAll(/[^0-9]/g, "");
						joinMobile = joinMobile.replaceAll(/[^0-9]/g, "");
						joinInNum = joinInNum.replaceAll(/[^0-9]/g, "");
						joinHeal1 = joinHeal1.replaceAll(/[^0-9]/g, "");
						joinBusiNum = joinBusiNum.replaceAll(/[^0-9]/g, "");
					}

					if (!validator.id(joinId)) {
						return false;
					}

					if (!validator.pw(joinPw)) {
						return false;
					}

					if (!validator.name(joinName)) {
						return false;
					}

					if (!validator.lic(joinLic, joinType)) {
						return false;
					}

					if (joinType === "L") {
						joinIns = joinLab;
					}

					if (!validator.ins(joinIns, joinType)) {
						return false;
					}

					if (!validator.birthDay(joinBirth, joinType)) {
						return false;
					}

					if (!validator.joinGender(joinGender, joinType)) {
						return false;
					}

					if (!validator.email(joinEmail)) {
						return false;
					}

					if (!validator.addr1(joinAddr1)) {
						return false;
					}

					//if (!validator.addr2(joinAddr2)) {
					//	return false;
					//}

					if (!validator.tel(joinTel)) {
						return false;
					}

					if (!validator.mobile(joinMobile)) {
						return false;
					}

					// if (!validator.person(joinPerson)) {
					//
					// }

					if (!validator.mu(joinMu)) {
						return false;
					}

					if (!validator.busiNum(joinBusiNum)) {
						return false;
					}

					if (!validator.ceo(joinCeo)) {
						return false;
					}

					if (!validator.indus1(joinIndus1)) {
						return false;
					}

					if (!validator.indus2(joinIndus2)) {
						return false;
					}

					if (!validator.baAddr1(joinBa1)) {
						return false;
					}

					//if (!validator.baAddr2(joinBa2)) {
					//	return false;
					//}

					// if (!validator.dep(joinDep)) {
					// 	return false;
					// }
					//
					// if (!validator.bankAccount(joinBank)) {
					// 	return false;
					// }
					//
					// if (!validator.refBankAccount(joinRef)) {
					// 	return false;
					// }

					if (!validator.heal1(joinHeal1, joinType)) {
						return false;
					}

					if (!validator.heal2(joinHeal2, joinType)) {
						return false;
					}

					if (!validator.joinIn(joinIn)) {
						return false;
					}

					if (!validator.joinInNum(joinInNum)) {
						return false;
					}

					if (joinIdChk == "false") {
						signInPopup.showMessage("아이디 중복을 확인해주세요.");
						return false;
					}

					if (joinEmailChk == "false") {
						signInPopup.showMessage("이메일 중복을 확인해주세요.");
						return false;
					}

					if (joinPwReChk == "false" || (joinPwRe != joinPw)) {
						signInPopup.showMessage("입력한 비밀번호를 입력해주세요.");
						return false;
					}

					//약관 동의 체크
					let terms2 = $("#terms2:checked").val();
					let terms3 = $("#terms3:checked").val();
					let terms4 = $("#terms4:checked").val();
					let terms5 = $("#terms5:checked").val();
					let terms13 = $("#terms13:checked").val();

					let terms = false;

					if (terms2 == null || terms2 == "") {
						terms = true;
					}

					if (terms3 == null || terms3 == "") {
						terms = true;
					}

					if (terms5 == null || terms5 == "") {
						terms = true;
					}

					if (terms13 == null || terms13 == "") {
						terms = true;
					}


					if (terms) {
						signInPopup.showMessage("필수 이용 약관에 동의해주세요.");
						return false;
					}

					// if (mailReceive == null || mailReceive == "") {
					// 	signInPopup.showMessage("메일 수신 여부를 체크해주세요.");
					// 	return false;
					// }
					//
					// if (smsReceive == null || smsReceive == "") {
					// 	signInPopup.showMessage("sms 수신 여부를 체크해주세요.");
					// 	return false;
					// }

					let body = {
						member_id : joinId,
						member_pw : joinPw,
						member_pw_check : joinPwRe,
						member_name : joinName,
						medical_license_no : joinLic,
						medical_name : joinIns,
						birth_day : joinBirth,
						email_info : joinEmail,
						email_receive_yn : mailReceive,
						sms_receive_yn : smsReceive,
						addr : joinAddr1,
						addr_detail: joinAddr2,
						addr_post: addrPost,
						gender: joinGender,
						tel_normal: joinTel,
						tel_mobile: joinMobile,
						recommend_no: joinPerson,
						link_shop_idx: linkShopIdx,
						corporate_registration_name: joinMu,
						corporate_registration_number: joinBusiNum,
						corporate_representative_name: joinCeo,
						corporate_business_conditions: joinIndus1,
						corporate_industry_type: joinIndus2,
						corporate_addr: joinBa1,
						corporate_addr_detail: joinBa2,
						corporate_addr_post: baPost,
						// account_holder: joinDep,
						// bank_code: joinBank,
						// bank_account_no: joinRef,
						yk_giho_no: joinHeal1,
						yk_name: joinHeal2,
						manage_name: joinIn,
						manage_tel_info: joinInNum,
						use_agree_yn: terms2,
						private_agree_check_yn: terms3,
						private_agree_select_yn: terms4,
						age_agree_yn: terms5,
						member_type: joinType
					}



					$.ajax({
						url: "/member/rest/join",
						method: "POST",
						contentType: "application/json",
						data: JSON.stringify(
								body
						),
						success: function (data) {
							let rtn_msg = data["rtn_msg"];
							if (data["rtn_code"] == "200") {

								ad_log_naver("2", "1");

								location.replace("/index");
							} else {
								signInPopup.showMessage(rtn_msg);
							}

						}
					});
				});

				//joinCeo - joinIn
				$("#inSame1").on("click", function () {
					if ($("#inSame1").prop("checked")) {
						let joinCeo = $("#joinCeo").val();
						if (joinCeo != null && joinCeo != "") {
							$("#joinIn").val(joinCeo);
							$("#joinIn").siblings("label").hide();
						} else {
							signInPopup.showMessage("대표자명을 확인해주세요.");
							$(this).prop("checked", false);자
						}
					}
					// else {
					// 	$("#joinIn").val("");
					// }
				});

				//joinInNum
				$("#inSame2").on("click", function () {
					if ($("#inSame2").prop("checked")) {
						let joinTel = $("#joinTel").val();
						if (joinTel != null && joinTel != "") {
							$("#joinInNum").val(joinTel);
							$("#joinInNum").siblings("label").hide();
						} else {
							signInPopup.showMessage("전화번호를 확인해주세요.");
							$(this).prop("checked", false);
						}
					}
					// else {
					// 	$("#joinInNum").val("");
					// }
				});

				$("#joinIns").on("change", function () {
					let joinIns = $(this).val();
					if (joinIns != null && joinIns != "") {
						$("#joinMu").val(joinIns);
						$("#joinHeal2").val(joinIns);

						$("#joinMu").siblings("label").hide();
						$("#joinHeal2").siblings("label").hide();
					}
				});

				$("#joinLab").on("change", function () {
					let joinIns = $(this).val();
					if (joinIns != null && joinIns != "") {
						$("#joinMu").val(joinIns);
						$("#joinHeal2").val(joinIns);

						$("#joinMu").siblings("label").hide();
						$("#joinHeal2").siblings("label").hide();
					}
				});

				/* 20230309 가입유형별 노출 항목 설정 */
				const joinWrap = $(".join_wrap");
				const rdoType = $(".join_type input[name='join_type']");
				rdoType.on("change", function(){
					if(rdoType.is(":checked")){
						joinWrap.addClass("on");
					}
					if($(this).val() === "L"){
						joinWrap.addClass("lab");
					}else{
						joinWrap.removeClass("lab");
					}
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub0_2" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="join_wrap">
						
							<!-- 20230309 가입유형 추가 START -->
							<div class="join_type">
								<div class="title">가입유형을 선택해주세요</div>
								<div class="type">
									<label>
										<input type="radio" name="join_type" value="C">
										<div class="cont">
											<div class="image"><img src="/resources/images/sub/img_jointype_01.png" /></div>
											<div class="text">
												<div class="name">클리닉</div>
												<div class="desc">의사면허소지<br>클리닉 회원가입</div>
											</div>
										</div>
									</label>
									<label>
										<input type="radio" name="join_type" value="L">
										<div class="cont">
											<div class="image"><img src="/resources/images/sub/img_jointype_02.png" /></div>
											<div class="text">
												<div class="name">기공소</div>
												<div class="desc">개인 또는 법인 사업자<br>기공소 회원가입</div>
											</div>
										</div>
									</label>
								</div>
							</div>
							<!-- 20230309 가입유형 추가 END -->
							
							<div class="tit">
								<h3>회원가입</h3>
								<p><span><img src="/resources/images/main/join_mark1.jpg" width="8" height="8" border="0" alt="" /></span>필수입력사항</p>
							</div>

							<div class="txt">
								<ul>
									<li class="join_li1 clear">
										<h4>아이디<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinId">
											<input type="hidden" id="joinIdChk" value="false"/>
											<label for="joinId">6자 이상의 영문 혹은 영문과 숫자를 조합</label>
										</div>
										<button class="dup_btn" id="dup_btn_id">중복확인</button>
									</li>
												
									<li class="join_li2 clear">
										<h4>비밀번호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="password" id="joinPw" maxlength="16">
											<label for="joinPw">비밀번호를 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li3 clear">
										<h4>비밀번호확인<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="password" id="joinPwRe" maxlength="16">
											<input type="hidden" id="joinPwReChk" value="false">
											<label for="joinPwRe">비밀번호를 한번 더 입력해주세요</label>
										</div>
										<p hidden class="pw_caution">X 비밀번호가 일치하지 않습니다</p>
									</li>
	
									<li class="join_li4 clear">
										<h4>이름<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinName" >
											<label for="joinName">이름(대표자)를 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li5 clear clinic">
										<h4>면허번호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinLic" >
											<label for="joinLic">면허번호를 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li6 clear clinic">
										<h4>의료기관명<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinIns" >
											<label for="joinIns">의료기관명을 입력해주세요</label>
										</div>
									</li>
									
									<li class="join_li6 clear lab">
										<h4>기공소명<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinLab" >
											<label for="joinIns">기공소명을 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li7 clear clinic">
										<h4>생년월일<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinBirth" >
											<label for="joinBirth">YYYY / MM / DD</label>
										</div>
										
										<div class="chk_wrap">
											<input id="genderChk1" type="radio" name="gender" value="M">
											<label for="genderChk1">남</label>
										</div>

										<div class="chk_wrap">
											<input id="genderChk2" type="radio" name="gender" value="F">
											<label for="genderChk2">여</label>
										</div>

<%--										<div class="chk_wrap">--%>
<%--											<input id="genderChk3" type="radio" name="gender" value="none" checked>--%>
<%--											<label for="genderChk3">선택안함</label>--%>
<%--										</div>--%>

									</li>
	
									<li class="join_li8 clear">
										<h4>이메일<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="hidden" id="joinEmailChk" value="false"/>
											<input type="text" id="joinEmail">
											<label for="joinEmail">예 : anyprice@gmail.com</label>
										</div>
										<button class="dup_btn" id="dup_btn_email">중복확인</button>
									</li>
	
									<li class="join_li9 clear">
										<h4>주소<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont_wrap" id="form_addr">
											<div class="form_cont">
												<input type="text" id="joinAddr1" readonly>
												<label for="joinAddr1">상세주소를 검색해주세요</label>
											</div>
											<div class="form_cont">
												<input type="text" id="joinAddr2">
												<label for="joinAddr2">나머지 주소를 입력해주세요</label>
											</div>
											<input type="hidden" id="addrPost" name="addrPost" value=""/>
										</div>
										<button class="addr_sch_btn" id="addr_sch_btn"><img src="/resources/images/main/addr_sch_btn.jpg" width="13" height="13" border="0" alt="" />검색</button>
									</li>
	
									<li class="join_li10 clear">
										<h4>전화번호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinTel">
											<label for="joinTel">숫자만 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li11 clear">
										<h4>휴대폰<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										<div class="form_cont">
											<input type="text" id="joinMobile">
											<label for="joinMobile">숫자만 입력해주세요</label>
										</div>
<%--										<button class="get_au_btnw" id="get_au_btn_id">인증받기</button>--%>
									</li>
	
									<li class="join_li12 clear">
										<h4>추천인</h4>
										<div class="form_cont">
											<input type="hidden" id="linkShopIdx">
											<input type="text" id="joinPerson">
											<label for="joinPerson">추천인 아이디를 입력해주세요</label>
										</div>
										<button class="per_sch_btn" id="per_sch_btn_id">검색</button>
									</li>
	
									<%-- <li class="join_li13 clear">
										<h4>메일수신여부<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="chk_wrap chkw1">
											<input id="mailRecive1" type="radio" name="mailReceive" value="Y">
											<label for="mailRecive1">수신함</label>
										</div>
	
										<div class="chk_wrap">
											<input id="mailRecive2" type="radio" name="mailReceive" value="N">
											<label for="mailRecive2">수신안함</label>
										</div>
									</li>
	
									<li class="join_li14 clear">
										<h4>SMS수신여부<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="chk_wrap chkw1">
											<input id="smsRecive1" type="radio" name="smsReceive" value="Y">
											<label for="smsRecive1">수신함</label>
										</div>
	
										<div class="chk_wrap">
											<input id="smsRecive2" type="radio" name="smsReceive" value="N">
											<label for="smsRecive2">수신안함</label>
										</div>
									</li> --%>
									<li class="clear">
										<div class="subtit">
											<h3 class="">세금계산서 발행</h3>
										</div>
									</li>
									<li class="join_li15 clear">
										<h4>상호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinMu">
											<label for="joinMu">띄어쓰기 없이 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li16 clear">
										<h4>사업자번호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinBusiNum">
											<label for="joinBusiNum">사업자번호 입력 시 '-'를 제외하고 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li17 clear">
										<h4>대표자명<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinCeo">
											<label for="joinCeo">이름(대표자)를 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li18 clear">
										<h4>업태<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinIndus1">
											<label for="joinIndus1">업태를 입력해주세요</label>
										</div>
										
										<div class="description">
											<p>예시) 보건업/치과의원</p>
										</div>

									</li>
	
									<li class="join_li19 clear">
										<h4>종목<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinIndus2">
											<label for="joinIndus2">종목을 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li20 clear">
										<h4>사업자주소<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										
										<div class="form_cont_wrap" id="form_ba">
											<div class="chk_wrap">
												<input id="addrSame" type="checkbox">
												<label for="addrSame">위의 주소와 동일</label>
											</div>
	
											<div class="form_cont">
												<input type="text" id="joinBa1" readonly>
												<label for="joinBa1">상세주소를 검색해주세요</label>
											</div>
										
											<div class="form_cont">
												<input type="text" id="joinBa2">
												<label for="joinBa2">나머지 주소를 입력해주세요</label>
											</div>
											<input type="hidden" id="baPost" name="baPost" value=""/>
										</div>
	
										<button class="ba_sch_btn" id="ba_sch_btn"><img src="/resources/images/main/addr_sch_btn.jpg" width="13" height="13" border="0" alt="" />검색</button>
									</li>
	
<%--									<li class="join_li21 clear">--%>
<%--										<h4>예금주명<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>--%>
<%--	--%>
<%--										<div class="form_cont">--%>
<%--											<input type="text" id="joinDep">--%>
<%--											<label for="joinDep">예금주 명을 입력해주세요</label>--%>
<%--										</div>--%>
<%--									</li>--%>
	
<%--									<li class="join_li22 clear">--%>
<%--										<h4>환불계좌은행<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>--%>
<%--	--%>
<%--										<select name="bankList" id="bankList">--%>
<%--											<option value="" selected>은행을 선택하세요</option>--%>
<%--											<c:forEach var="item" items="${b_code_list}">--%>
<%--											<option value="<c:out value="${item.pk_code}"/>">${item.fd_code_name}</option>--%>
<%--											</c:forEach>--%>
<%--										</select>--%>
<%--									</li>--%>
<%--	--%>
<%--									<li class="join_li23 clear">--%>
<%--										<h4>환불계좌번호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>--%>
<%--	--%>
<%--										<div class="form_cont">--%>
<%--											<input type="text" id="joinRef">--%>
<%--											<label for="joinRef">계좌번호를 입력해주세요</label>--%>
<%--										</div>--%>
<%--									</li>--%>
	
									<li class="join_li24 clear clinic">
										<h4>요양기관기호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinHeal1">
											<label for="joinHeal1">요양기관기호를 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li25 clear clinic">
										<h4>요양기관명칭<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinHeal2">
											<label for="joinHeal2">요양기관명칭을 입력해주세요</label>
										</div>
									</li>
	
									<li class="join_li26 clear">
										<h4>담당자명<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinIn">
											<label for="joinIn">이름(담당자)를 입력해주세요</label>
										</div>
	
										<div class="chk_wrap">
											<input id="inSame1" type="checkbox">
											<label for="inSame1">대표자와 동일</label>
										</div>
									</li>
	
									<li class="join_li27 clear">
										<h4>담당자연락처<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
										<div class="form_cont">
											<input type="text" id="joinInNum">
											<label for="joinInNum">연락처(담당자)를 입력해주세요</label>
										</div>
	
										<div class="chk_wrap">
											<input id="inSame2" type="checkbox">
											<label for="inSame2">대표자와 동일</label>
										</div>
									</li>
	
									<li class="join_li28 clear">
										<h4>이용약관동의<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
										
										<div class="chk_wrap">
											<div class="all_chk">
												<input id="terms1" type="checkbox" name="acc" class="all_chk_cb">
												<label for="terms1">전체 동의합니다</label>
											</div>
	
											<div class="terms_chk">
												<input id="terms2" type="checkbox" name="acc" class="nm_chk" value="Y">
												<label for="terms2">메디밸류 이용약관 동의 (필수)</label>
												<button class="terms_view">약관보기</button>
	
												<div class="terms_popup">
													<button class="terms_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
													<div class="terms_tit"><h4>이용약관동의 <span>(필수)</span></h4></div>
													<div class="terms_txt">
														<p>
																${TE0001.fd_content}
														</p>
													</div>
	
													<button class="terms_btn">확인</button>
												</div>
											</div>
											
											<div class="terms_chk">
												<input id="terms13" type="checkbox" name="acc" class="nm_chk" value="Y">
												<label for="terms13">기공플랫폼 이용약관 동의 (필수)</label>
												<button class="terms_view">약관보기</button>

												<div class="terms_popup">
													<button class="terms_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
													<div class="terms_tit"><h4>기공플랫폼 이용약관 동의 <span>(필수)</span></h4></div>
													<div class="terms_txt">
														<p>
																${TE0013.fd_content}
														</p>
													</div>

													<button class="terms_btn">확인</button>
												</div>
											</div>
	
											<div class="terms_chk">
												<input id="terms3" type="checkbox" name="acc" class="nm_chk" value="Y">
												<label for="terms3">개인정보처리방침 동의 (필수)</label>
												<button class="terms_view">약관보기</button>
	
												<div class="terms_popup">
													<button class="terms_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
													<div class="terms_tit"><h4>개인정보처리방침 동의 <span>(필수)</span></h4></div>
													<div class="terms_txt">
														<p>
																${TE0002.fd_content}
														</p>
													</div>
	
													<button class="terms_btn">확인</button>
												</div>
											</div>
	
											<div class="terms_chk">
												<input id="terms4" type="checkbox" name="acc" class="nm_chk" value="Y">
												<label for="terms4">개인정보수집이용 동의 (선택)</label>
												<button class="terms_view">약관보기</button>
	
												<div class="terms_popup">
													<button class="terms_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
													<div class="terms_tit"><h4>개인정보수집이용 동의 <span>(선택)</span></h4></div>
													<div class="terms_txt">
														<p>
																${TE0012.fd_content}
														</p>
													</div>
	
													<button class="terms_btn">확인</button>
												</div>
											</div>
	
											<div class="terms_chk">
												<input id="terms6" type="checkbox" name="acc" class="nm_chk" value="Y">
												<label for="terms6">무료배송, 할인쿠폰 등 혜택/정보 수신 동의 (선택)</label>
												<div class="terms_chk_sub">
													<div>
														<input id="mailReceive" type="checkbox" name="acc" class="nm_chk" value="Y">
														<label for="mailReceive">이메일</label>
													</div>
													<div>
														<input id="smsReceive" type="checkbox" name="acc" class="nm_chk" value="Y">
														<label for="smsReceive">SMS</label>
													</div>
													<p class="sub_txt"><sup>&angrt;</sup> 이제 쉽고 빠르게, 다양한 혜택정보를 받아보세요.</p>
												</div>
											</div>
											
											<div class="terms_chk">
												<input id="terms5" type="checkbox" name="acc" class="nm_chk" value="Y">
												<label for="terms5">본인은 만 14세 이상입니다 (필수)</label>
											</div>
										</div>
									</li>
	
									<li class="join_li29">
										<button class="join_btn">가입하기</button>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>

	</jsp:body>
</layout:basicFrame>