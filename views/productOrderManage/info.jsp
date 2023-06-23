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
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript" src="/resources/js/sub2.js"></script>
		<script src="https://js.tosspayments.com/v1"></script>
<%--		<script type="text/javascript" src="https://tbnpg.settlebank.co.kr/resources/js/SettlePG.js"></script>--%>
		<script type="text/javascript">

			var initialTotalAmount = ${order_info.fd_total_payment};
			var initialTotalDeliveryFee = ${order_info.fd_delivery_fee};

			var normalTotalAmount = <c:out value="${product_normal_info.fd_total_payment}" default="0"/>;
			var normalTotalDeliveryFee = <c:out value="${product_normal_info.fd_delivery_fee}" default="0"/>;
			var normalInitialTotalAmount = <c:out value="${product_normal_info.fd_total_payment}" default="0"/> ;
			var normalInitialTotalDeliveryFee = <c:out value="${product_normal_info.fd_delivery_fee}" default="0"/> ;

			var saleTotalAmount = <c:out value="${product_sale_info.fd_total_payment}" default="0"/>;
			var saleTotalDeliveryFee = <c:out value="${product_sale_info.fd_delivery_fee}" default="0"/>;
			var saleInitialTotalAmount = <c:out value="${product_sale_info.fd_total_payment}" default="0"/>;
			var saleInitialTotalDeliveryFee = <c:out value="${product_sale_info.fd_delivery_fee}" default="0"/> ;

			var totalAmount = initialTotalAmount;
			var totalDeliveryFee = initialTotalDeliveryFee;

			var signInPopup = {
				showMessage: function (msg) {
					$("#pop_alarm_msg").text(msg);
					$("#black").show();
					$(".popup_message_type_1").show();
				}
			};

			var coupon = {
				resetCoupon: function () {
					let mileage = $("#mileage").val();

					if (mileage == null || mileage == 0) {
						totalAmount = initialTotalAmount;
					}

					totalDeliveryFee = initialTotalDeliveryFee;

					$("input[name='cp_rds_ship']").prop("checked", false);
					$("input[name='cp_rds_cost']").prop("checked", false);
					//	쿠폰 설정 초기화

					$(".pd_cost_1 > .pdc_li1 > p > strong").text(initialTotalAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$(".pdc_li2_1 > p").text(initialTotalAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
					$(".pdc_li2_2 > p").text(0 + "원");
					$(".pd_cost_2 > .pdc_li1 > p > strong").text(totalDeliveryFee.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$(".pdc_li1 > .wrap > strong").text((totalAmount + totalDeliveryFee).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$("#coupon_info").text(0);
					let paymentMethod = $("input[name='ex_rds_1']:checked").val();
					if (paymentMethod === "medicash") {
						useAllMedicash();
					}
				},
				resetCostCoupon: function () {
					totalAmount = initialTotalAmount;

					// $("input[name='cp_rds_ship']").prop("checked", false);
					$("input[name='cp_rds_cost']").prop("checked", false);
					//	쿠폰 설정 초기화
					//	.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
					$(".pd_cost_1 > .pdc_li1 > p > strong").text(totalAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$(".pdc_li2_1 > p").text(totalAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
					$(".pdc_li2_2 > p").text(0 + "원");
					$("#coupon_info").text(0);
				}
			}

			var mileage = {
				resetMileage: function () {
					totalAmount = initialTotalAmount;
					let memberMileage = Number('${mileage.fd_mileage_point}');
					$("#mileage").siblings("label").hide();
					$("#mileage").val(0);
					$("#mileageValue").val(0);

					$("#currentMileage").text(memberMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$("#currentMileagePoint").val(memberMileage);

					$(".pd_cost_1 > .pdc_li1 > p > strong").text(totalAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$(".pdc_li2_1 > p").text(totalAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
					$(".pdc_li2_2 > p").text(0 + "원");
					$("#mileage_info").text(0);
				}
			}

			let login_check = '${login_check}';
			if (login_check === 'N') {
				location.replace("/access/login");
			}

			function checkout_log() {
				let productInfoList = ${product_info_list};
				labbit_begin_checkout(productInfoList);
			}

			$(document).ready(function (){
				checkout_log();
				let error = '${error}';
				let code = '${code}';
				let errorMessage = '${errorMessage}';

				if (error) {

					// if (code === "503") {
					// 	signInPopup.showMessage('결제 진행중에 문제가 발생했습니다. 다시 시도해주세요.');
					// }
					// } else if (code === "504") {
					// 	signInPopup.showMessage('데이터 입력 중 문제가 발생했습니다. 고객센터로 연락 부탁드립니다.');
					// } else if (code === "507") {
					// 	signInPopup.showMessage('결제 모듈에 문제가 발생했습니다. 다시 시도해주세요.');
					// } else if (code === "500") {
					// 	signInPopup.showMessage('결제 진행중에 문제가 발생했습니다. 다시 시도해주세요.');
					// } else {
					// 	signInPopup.showMessage('결제 진행 중 문제가 발생했습니다. 고객센터로 연락 부탁드립니다.');
					// }
					if (errorMessage !== '') {
						signInPopup.showMessage('카드 결제 실패 - ' + errorMessage);
					} else if (code === "508") {
						signInPopup.showMessage('결제 진행 중 문제가 발생했습니다. 고객센터로 연락 부탁드립니다.');
					} else {
						signInPopup.showMessage('결제 진행중에 문제가 발생했습니다. 다시 시도해주세요.');
					}

				} else {
					let rtn_code = '${rtn_code}';
					let rtn_msg = '${rtn_msg}';
					if (rtn_code === '401') {
						$("#btn_ok").on("click", function () {
							location.replace("/product/basket/list");
						});
						signInPopup.showMessage(rtn_msg);
					} else if(rtn_code > 200){
						signInPopup.showMessage(rtn_msg);
					}
				}

				var $floatingBox2=$("#sub2_2 .cnt3 .area .real_area .right .floating_box2");

				$(window).on("scroll", function  () {
					$(window).on("resize",function  () {
						var scrollY=$(this).scrollTop();
						var posY=$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li1").offset().top;
						var s22C3Y=$("#sub2_2 .cnt3").offset().top;
						var s22C4Y=$("#sub2_2 .cnt4").offset().top;
						var pbH2=$floatingBox2.outerHeight();
						var pbtg2=s22C4Y-pbH2-99;

						if (scrollY>posY-174){
							$floatingBox2.css({"position":"fixed","top":"174px","z-index":"9","bottom":"auto"});
							/* $("#header .top").css({"position":"absolute","top":posY-98}) */
						}else if (scrollY<posY-174) {
							$floatingBox2.css({"position":"static"});
						}

						if (scrollY>pbtg2-159) {
							$floatingBox2.css({"position":"absolute","top":"auto","bottom":"0"});
						}
					});
					$(window).trigger("resize");
				});

				$("#cpRdo").on("click", function () {
					coupon.resetCoupon();
				});

				$("input[name='cp_rds_ship']").on("click", function () {
					totalDeliveryFee = 0;
					$("input[name='cp_rds_cancel']").prop("checked", false);
					$(".pd_cost_2 > .pdc_li1 > p > strong").text(0);
					$(".pdc_li1 > .wrap > strong").text((totalAmount).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					let paymentMethod = $("input[name='ex_rds_1']:checked").val();
					if (paymentMethod === "medicash") {
						useAllMedicash();
					}
				});

				$("input[name='cp_rds_cost']").on("click", function () {
					mileage.resetMileage();
					totalAmount = initialTotalAmount;
					$("input[name='cp_rds_cancel']").prop("checked", false);
					let couponInfo = $(this).parent().children("input[name='coupon_info']").val();
					totalAmount = totalAmount - couponInfo;
					// $(".pdc_li2_1 > p").text(totalAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
					$(".pdc_li2_2 > p").text(couponInfo.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
					$(".pdc_li1 > .wrap > strong").text((totalAmount + totalDeliveryFee).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$("#coupon_info").text(couponInfo.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					let paymentMethod = $("input[name='ex_rds_1']:checked").val();
					if (paymentMethod === "medicash") {
						useAllMedicash();
					}
				});

				$(".tax_modi").on("click", function () {
					if ($(".tax_info_li > p").prop("hidden")) {
						$(".tax_info_li > .form_cont > input").each(function (index, item) {
							$(item).parent().parent().children("p").text($(item).val());
						});
						$(".tax_info_li > p").attr("hidden", false);
						$(".tax_info_li > .form_cont").attr("hidden", true);
						$(this).text("수정하기");
					} else {
						$(".tax_info_li > p").attr("hidden", true);
						$(".tax_info_li > .form_cont").attr("hidden", false);
						$(this).text("수정완료");
					}

				});

				// $("input[name='ex_rds_1']").on("change", function () {
				// 	let paymentMethod = $(this).val();
				// 	if (paymentMethod == "transfer") {
				// 		$("#tax_yn").children("div").children("#ex_rd6").prop("checked", false);
				// 		$("#tax_yn > div > input[name='ex_rds_2']").prop("disabled", false);
				// 	} else {
				// 		$(".tax_info_li").css("display", "none");
				// 		$("#tax_yn").children("div").children("#ex_rd6").prop("checked", true);
				// 		$("#tax_yn > div > input[name='ex_rds_2']").prop("disabled", true);
				// 	}
				// });

				$(".chk_wrap > div > #ex_rd9").on("click", function () {
					$(".btn > #btn_medicash_refresh").trigger("click");
				});

				$(".paying_btn").on("click", function () {
					let proc_state = true;
					let orderId = '${order_info.fd_order_id}';
					let shipCouponIdx = '';
					let costCouponIdx = '';

					//input value check
					let shipReq = $("#selboxDirect").val().trim();
					let paymentMethod = $("input[name='ex_rds_1']:checked").val();
					let paymentAgreementYn = $("input[name='payment_agreement_yn']:checked").val();
					let taxYn = $("input[name='ex_rds_2']:checked").val();
					let taxInfo = {};

					if (paymentMethod == null || paymentMethod == '') {
						signInPopup.showMessage('결제 방법을 선택해주세요.');
						return false;
					}

					if (paymentAgreementYn == null || paymentAgreementYn == '') {
						signInPopup.showMessage('개인정보 수집/제공에 동의해주세요.');
						return false;
					}

					if (taxYn == null || taxYn == '') {
						signInPopup.showMessage('세금계산서 신청 여부를 선택해주세요.');
						return false;
					}

					if (taxYn == 'Y') {
						let fd_corporate_registration_number = $("#fd_corporate_registration_number").val();
						let fd_corporate_registration_name = $("#fd_corporate_registration_name").val();
						let fd_corporate_representative_name = $("#fd_corporate_representative_name").val();
						let fd_corporate_business_conditions = $("#fd_corporate_business_conditions").val();
						let fd_corporate_industry_type = $("#fd_corporate_industry_type").val();
						let fd_email_info = $("#fd_email_info").val();

						if (fd_corporate_registration_number == null || fd_corporate_registration_number == '') {
							signInPopup.showMessage('사업자번호를 확인해주세요.');
							return false;
						}

						if (fd_corporate_registration_name == null || fd_corporate_registration_name == '') {
							signInPopup.showMessage('회사명을 확인해주세요.');
							return false;
						}

						if (fd_corporate_representative_name == null || fd_corporate_representative_name == '') {
							signInPopup.showMessage('대표자명을 확인해주세요.');
							return false;
						}

						if (fd_corporate_business_conditions == null || fd_corporate_business_conditions == '') {
							signInPopup.showMessage('업태 정보를 확인해주세요');
							return false;
						}

						if (fd_corporate_industry_type == null || fd_corporate_industry_type == '') {
							signInPopup.showMessage('종목을 확인해주세요.');
							return false;
						}

						if (fd_email_info == null || fd_email_info == '') {
							signInPopup.showMessage('이메일을 확인해주세요.');
							return false;
						}

						taxInfo = {
							fd_corporate_registration_number: fd_corporate_registration_number,
							fd_corporate_registration_name: fd_corporate_registration_name,
							fd_corporate_representative_name: fd_corporate_representative_name,
							fd_corporate_business_conditions: fd_corporate_business_conditions,
							fd_corporate_industry_type: fd_corporate_industry_type,
							fd_email_info: fd_email_info
						}
					}

					let couponGroupIdx = new Array();

					$("input[name='cp_rds_ship']").each(function (index, value) {
						if ($(value).prop("checked")) {
							shipCouponIdx = $(value).val();
							couponGroupIdx.push(shipCouponIdx);
						}
					});

					$("input[name='cp_rds_cost']").each(function (index, value) {
						if ($(value).prop("checked")) {
							costCouponIdx = $(value).val();
							couponGroupIdx.push(costCouponIdx);
						}
					});

					let mileage = $("#mileageValue").val();
					let medicash = priceToNumber($("#medicash_use_all").val());

					if (paymentMethod === "medicash") {
						let checkAmount = priceToNumber($(".pd_cost_5").find("strong").text());
						if (checkAmount !== medicash) {
							signInPopup.showMessage("메디캐쉬 사용 금액을 확인해주세요");
							return;
						}
					}

					if(proc_state){
						proc_state = false;
						$.ajax({
							url : '/order/rest/confirm',
							type : 'post',
							contentType: 'application/json',
							cache : false,
							data: JSON.stringify({
								paymentMethod: paymentMethod,
								orderId: orderId,
								shipReq: shipReq,
								paymentAgreementYn: paymentAgreementYn,
								taxYn: taxYn,
								taxInfo: taxInfo,
								couponGroupIdx: couponGroupIdx.toString(),
								mileage: mileage,
								medicash: medicash
							}),
							dataType : 'json',
							success:function(data){
								if(data.rtn_code != '200'){
									signInPopup.showMessage('결제 실패 다시 시도해주세요.');
									proc_state = true;
								} else {
									paymentMethod = data["paymentMethod"];
									if(paymentMethod === 'card'){
										var clientKey = '${client_key}';
										let tossPayments = TossPayments(clientKey);
										tossPayments.requestPayment('카드', {
											amount: data.totalPayment,
											orderId: data.orderId,
											orderName: data.orderName,
											customerName: data.customerName,
											successUrl: window.location.origin + data.successUrl,
											failUrl: window.location.origin + data.failUrl
										}).catch(function (error) {
											proc_state = true;
											if(error.code === 'USER_CANCEL') {
												signInPopup.showMessage("카드결제를 취소하셨습니다.");
												return;
											}else if(error.code === 'UNAUTHORIZED_KEY') {
												signInPopup.showMessage("토스 인증키가 잘못되었습니다.");
												return;
											}
										});
									} else if (paymentMethod === 'bank') {
										var el = document.getElementsByTagName("body")[0];

										var settleForm = document.createElement("form");
										settleForm.setAttribute("id", "SETTLEBANK_FORM");
										settleForm.setAttribute("name", "SETTLEBANK_FORM");
										settleForm.setAttribute("target", "SETTLEBANK_FORM");
										settleForm.setAttribute("method", "POST");
										settleForm.setAttribute("action", data['authUrl'] + "/init.do");

										for(var key in data){
											if (key === "callbackUrl" || key === "cancelUrl") {
												data[key] = window.location.origin + data[key];
											}
											settleForm.appendChild(makeFormInput(key, data[key]));
										}
										el.appendChild(settleForm);

										var userAgent = new String(navigator.userAgent);
										var mobilePhones = new Array('iphone', 'ipod', 'android', 'blackberry', 'windows ce', 'nokia', 'webos', 'opera mini', 'sonyericsson', 'opera mobi', 'iemobile', 'windows phone', 'test_app');
										var isMobile = false;

										for( var i = 0 ; i < mobilePhones.length ; ++i ){
											if( userAgent.toLowerCase().indexOf(mobilePhones[i]) > -1)
											{
												isMobile = true;
												break;
											}
										}

										if(!isMobile){
											var windowStatus = '';
											if (userAgent.indexOf('Trident') > 0) {
												if (userAgent.indexOf('Trident/4.0') > 0) windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';
												else windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';
											}
											else if (userAgent.indexOf('AppleWebKit') > 0 && userAgent.indexOf('Chrome') == -1) windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';
											else windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';

											var mchtPopup = window.open('', 'SETTLEBANK_FORM', windowStatus);
											setTimeout(function(){
												if (mchtPopup == null) alert("팝업 허용 해주세요");
												else settleForm.submit();
											}, 1000);
										} else {
											settleForm.submit();
										}

									} else if (paymentMethod === 'card2') {
										SETTLE_PG.pay({
											env : data['env'],
											mchtId : data['mchtId'],
											method: "card",
											trdDt : data['trdDt'],
											trdTm : data['trdTm'],
											mchtTrdNo : data['mchtTrdNo'],
											mchtName : data['mchtName'],
											mchtEName : data['mchtEName'],
											pmtPrdtNm : data['pmtPrdtNm'],
											trdAmt : data['trdAmt'],
											notiUrl : data['notiUrl'],
											nextUrl : data['nextUrl'],
											cancUrl : data['cancUrl'],
											pktHash : data["pktHash"],

											ui :{
												type:"popup",   //popup, iframe, self, blank
												width: "430",   //popup창의 너비
												height: "660"   //popup창의 높이
											}
										}, function(data) {
											console.log(data);
										});
									} else if (paymentMethod === 'medicash') {
										location.replace("/order/result/medicash/" + data.orderId);
									} else {
										location.replace("/order/result/transfer/" + data.orderId);
									}

								}
							},
							error:function(request,status,error){
								signInPopup.showMessage('네트워크 환경을 확인해주세요.');
								proc_state = true;
							}
						});
					}else{
						signInPopup.showMessage('주문 처리 중 입니다.');
					}

				});

				$(".copy_btn").on("click", function () {
					var $temp = $("<input>");
					$("body").append($temp);
					$temp.val($("#bank_no").val()).select();
					let result = document.execCommand("copy");
					if (result) {
						signInPopup.showMessage("복사되었습니다.");
					}
					$temp.remove();
				});

				$(".all_use").on("click", function () {
					coupon.resetCostCoupon();

					let memberMileage = Number('${mileage.fd_mileage_point}');
					if (memberMileage < 1000) {
						signInPopup.showMessage("1,000 포인트 이상부터 사용가능합니다.");
						return false;
					}

					//let maxMileage = totalAmount * 0.05;
					let maxMileage = Number('${total_max_use_point}');
					let useMileage = 0;
					if (maxMileage > memberMileage) {
						useMileage = memberMileage;
					} else {
						useMileage = maxMileage;
					}

					useMileage = Math.floor(useMileage);
					$("#mileage").siblings("label").hide();
					$("#mileage").val(useMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$("#mileageValue").val(useMileage);

					memberMileage = memberMileage - useMileage;
					$("#currentMileage").text(memberMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$("#currentMileagePoint").val(memberMileage);

					totalAmount = totalAmount - useMileage;
					$(".pdc_li2_2 > p").text(useMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
					$(".pdc_li1 > .wrap > strong").text((totalAmount + totalDeliveryFee).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$("#mileage_info").text(useMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					// let paymentMethod = $("input[name='ex_rds_1']:checked").val();
					// if (paymentMethod === "medicash") {
					// 	useAllMedicash();
					// }
				});

				$("#mileage").on("change", function () {
					coupon.resetCostCoupon();

					let memberMileage = Number('${mileage.fd_mileage_point}');
					let useMileage = $(this).val();
					useMileage = useMileage.replaceAll(',', '');
					useMileage = Math.floor(useMileage);
					if (memberMileage < 1000) {
						signInPopup.showMessage("1,000 포인트 이상부터 사용가능합니다.");
						$("#mileage").siblings("label").hide();
						$("#mileage").val(0);
						return false;
					}

					//let maxMileage = initialTotalAmount * 0.05;
					let maxMileage = Number('${total_max_use_point}');

					if (useMileage > maxMileage) {
						signInPopup.showMessage("최대 " + maxMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
								+ " 포인트 까지 사용가능합니다.");
						$("#mileage").siblings("label").hide();
						if (maxMileage <= memberMileage) {
							$("#mileage").val(maxMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							$("#mileageValue").val(maxMileage);
						} else {
							$("#mileage").val(0);
							$("#mileageValue").val(0);
						}
						return false;
					} else {
						$("#mileage").siblings("label").hide();
						$("#mileage").val(useMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
						$("#mileageValue").val(useMileage);
					}

					memberMileage = memberMileage - useMileage;
					$("#currentMileage").text(memberMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$("#currentMileagePoint").val(memberMileage);

					totalAmount = totalAmount - useMileage;
					$(".pdc_li2_2 > p").text(useMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
					$(".pdc_li1 > .wrap > strong").text((totalAmount + totalDeliveryFee).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					$("#mileage_info").text(useMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

					// let paymentMethod = $("input[name='ex_rds_1']:checked").val();
					// if (paymentMethod === "medicash") {
					// 	useAllMedicash();
					// }
				});

				$("#selboxDirect").on("input", function () {
					let shipReq = $(this).val();
					if (shipReq.length >= 60) {
						signInPopup.showMessage("최대 60자까지 입력가능합니다.");
						return;
					}
				});

				$(".btn > #btn_medicash_refresh").on("click", function () {
					$.ajax({
						url: "/order/rest/medicash",
						method: "POST",
						contentType: "application/json",
						accept: "*/*",
						success: function (data) {
							if (data["rtn_code"] === "200") {
								let medicash = data["medicash"];
								$(".num > #medicash_info").text(numberToPrice(medicash["fd_medicash_info"]));
							} else {
								signInPopup.showMessage(data["rtn_msg"]);
							}
						},
						error: function (error) {
						}
					});
				});

				$(".btn > #btn_medicash_recharge").on("click", function () {
					let medicash_url = window.location.origin + "/product/medicash";
					window.open(medicash_url, '메디캐쉬충전', 'width=1400px,height=800px,scrollbars=yes');
				});

				$(".btn > #btn_medicash_use_all").on("click", function () {
					useAllMedicash();
				});

				$("#ex_rd9").on("click", function () {
					$(".num > #medicash_use_all").val("");
				});

			});

			function useAllMedicash() {
				let amount = priceToNumber($(".pd_cost_5").find("strong").text());

				$.ajax({
					url: "/order/rest/medicash/check",
					method: "POST",
					accept: "*/*",
					data: JSON.stringify({
						amount: amount
					}),
					success: function (data) {
						if (data["rtn_code"] === "200") {
							let state = data["state"];
							if (state) {
								$(".num > #medicash_use_all").val(numberToPrice(amount));
							}
						} else {
							signInPopup.showMessage(data["rtn_msg"]);
						}
					},
					error: function (data) {
						// signInPopup.showMessage("")
					}
				})
			}

			function makeFormInput(name, value){

				var settleInput = document.createElement("input");

				settleInput.setAttribute("type", "hidden");
				settleInput.setAttribute("name", name);
				settleInput.setAttribute("value", value);

				return settleInput;
			}

		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub2_2" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<h3>주문결제</h3>

						<div class="order_pd">
							<div class="order_pd_tit clear">
								<h4>주문상품</h4>
								<button type="button"><img src="/resources/images/main/order_pd_btn.jpg" width="48" height="28" border="0" alt="" /></button>
							</div>

							<div class="order_pd_detail">								
								<c:if test="${!empty product_sale_info_list}">
								<div class="cart_pd sale_pd">
									<div class="cart_pd_tit sale_pd_tit clear">
										<h4>특가제품</h4>
									</div>

									<div class="cart_pd_list sale_pd_list">
										<ul>
											<c:forEach var="item" items="${product_sale_info_list}" varStatus="status">
											<li class="clear">
												<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
													<c:choose>
														<c:when test="${!empty item.fd_img_path_thumbnail}">
															<img src="<c:out value="${item.fd_img_path_thumbnail}"/>" width="250" height="321" border="0" alt="" />
														</c:when>
														<c:when test="${!empty item.fd_img_path}">
															<img src="<c:out value="${item.fd_img_path}"/>" width="250" height="321" border="0" alt="" />
														</c:when>
														<c:otherwise>
															<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
														</c:otherwise>
													</c:choose>
												</div>
												<div class="info">													
													<input type="hidden" id="pd_point_use_type" name="pd_point_use_type" value="${item.fd_custom_use_point_type_cd}"/>
													<input type="hidden" id="pd_point_use_max_info" name="pd_point_use_max_info" value="${item.use_max_point}"/>
													<div class="info_box">
														<h4 class="pd_tit"><c:out value="${item.fd_product_name}"/></h4>
														<p class="standard">[규격] <c:out value="${item.fd_product_standard}"/></p>
														<div class="mp_wrap clear">
															<p class="manu">제조사ㅣ<c:out value="${item.fd_company_name}"/></p>
															<p class="pack">포장단위ㅣ<c:out value="${item.fd_product_unit}"/></p>
														</div>
													</div>
												</div>

												<div class="manu_p">
													<p><c:out value="${item.fd_shop_name}"/></p>
												</div>

												<div class="ship_p">
													<p><c:out value="${order_info.fd_date}"/> 도착예정</p>
												</div>

												<div class="pack_p">
													<p><c:out value="${item.fd_cnt}"/>개</p>
												</div>

												<div class="price_p">
													<p>
														<fmt:formatNumber value="${item.shop_sale_amount*item.fd_cnt}" pattern="#,###" /> 원
													</p>
												</div>

											</li>
											</c:forEach>
										</ul>
									</div>
								</div>
								</c:if>

								<c:if test="${!empty product_normal_info_list}">
								<div class="cart_pd normal_pd">
									<div class="cart_pd_tit sale_pd_tit clear">
										<h4>일반제품</h4>
									</div>

									<div class="cart_pd_list normal_pd_list">
										<ul>
											<c:forEach var="item" items="${product_normal_info_list}" varStatus="status">
											<li class="clear">
												<div class="img">
													<c:choose>
														<c:when test="${!empty item.fd_img_path_thumbnail}">
															<img src="<c:out value="${item.fd_img_path_thumbnail}"/>" width="250" height="321" border="0" alt="" />
														</c:when>
														<c:when test="${!empty item.fd_img_path}">
															<img src="<c:out value="${item.fd_img_path}"/>" width="250" height="321" border="0" alt="" />
														</c:when>
														<c:otherwise>
															<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
														</c:otherwise>
													</c:choose>
												</div>

												<div class="info">
													<div class="info_box">													
														<input type="hidden" id="pd_point_use_type" name="pd_point_use_type" value="${item.fd_custom_use_point_type_cd}"/>
														<input type="hidden" id="pd_point_use_max_info" name="pd_point_use_max_info" value="${item.use_max_point}"/>														
														<h4 class="pd_tit"><c:out value="${item.fd_product_name}"/></h4>
														<p class="standard">[규격] <c:out value="${item.fd_product_standard}"/></p>
														<div class="mp_wrap clear">
															<p class="manu">제조사ㅣ<c:out value="${item.fd_company_name}"/></p>
															<p class="pack">포장단위ㅣ<c:out value="${item.fd_product_unit}"/></p>
														</div>
													</div>
												</div>
												<div class="manu_p">
													<p><c:out value="${item.fd_shop_name}"/></p>
												</div>
<%--												<fmt:formatDate var="estimateDate" value="${item.fd_date}" pattern="MM/dd(E)" />--%>
												<div class="ship_p">
													<p><c:out value="${order_info.fd_date}"/> 도착예정</p>
												</div>

												<div class="pack_p">
													<p><c:out value="${item.fd_cnt}"/>개</p>
												</div>

												<div class="price_p">
													<p>
														<fmt:formatNumber value="${item.shop_sale_amount*item.fd_cnt}" pattern="#,###" /> 원
													</p>
												</div>
											</li>
											</c:forEach>
										</ul>
									</div>
								</div>
								</c:if>

							</div>

							<div class="order_pd_txt">
								<c:if test="${order_info.fd_cnt == 1}">
									<h5>${order_info.fd_order_name} 상품을 주문합니다.</h5>
								</c:if>
								<c:if test="${order_info.fd_cnt > 1}">
									<h5>${order_info.fd_order_name} 외 <span>${order_info.fd_cnt - 1}</span> 상품을 주문합니다.</h5>
								</c:if>
<%--								<p>주문은 <span>${order_info_list.size()}번</span>에 나누어서 배송합니다.</p>--%>
								<p>주문은 <span>${order_shop_size}번</span>에 나누어서 배송합니다.</p>
							</div>

						</div>
					</div>
				</div>
			</article>

			<article class="cnt2">
				<div class="area">
					<div class="real_area">
						<ul class="depth1">
							<li class="c2_li1">
								<div class="order_info_tit clear">
									<h4>주문자</h4>
<%--									<p>주문자 정보입니다.</p>--%>
								</div>
	
								<div class="order_info_txt">
									<ul class="depth2">
										<li class="clear">
											<h5>보내는 분</h5>
											<p>${member.fd_member_name_desc}</p>
										</li>

										<li class="clear">
											<h5>휴대폰</h5>
											<p>
												<c:choose>
													<c:when test="${member.fd_tel_mobile_desc.length() == 8}">
														${fn:substring(member.fd_tel_mobile_desc, 0, 4)}-${fn:substring(member.fd_tel_mobile_desc, 4, 8)}
													</c:when>
													<c:when test="${member.fd_tel_mobile_desc.length() == 9}">
														${fn:substring(member.fd_tel_mobile_desc, 0, 2)}-${fn:substring(member.fd_tel_mobile_desc, 2, 5)}-${fn:substring(member.fd_tel_mobile_desc, 5, 9)}
													</c:when>
													<c:when test="${member.fd_tel_mobile_desc.length() == 10 && fn:startsWith(member.fd_tel_mobile_desc, '02')}">
														${fn:substring(member.fd_tel_mobile_desc, 0, 2)}-${fn:substring(member.fd_tel_mobile_desc, 2, 6)}-${fn:substring(member.fd_tel_mobile_desc, 6, 10)}
													</c:when>
													<c:when test="${member.fd_tel_mobile_desc.length() == 10}">
														${fn:substring(member.fd_tel_mobile_desc, 0, 3)}-${fn:substring(member.fd_tel_mobile_desc, 3, 6)}-${fn:substring(member.fd_tel_mobile_desc, 6, 10)}
													</c:when>
													<c:when test="${member.fd_tel_mobile_desc.length() == 11}">
														${fn:substring(member.fd_tel_mobile_desc, 0, 3)}-${fn:substring(member.fd_tel_mobile_desc, 3, 7)}-${fn:substring(member.fd_tel_mobile_desc, 7, 11)}
													</c:when>
													<c:otherwise>
														${member.fd_tel_mobile_desc}
													</c:otherwise>
												</c:choose>
											</p>
										</li>

										<li class="clear">
											<h5>이메일</h5>
											<p>${member.fd_email_info_desc}</p>
										</li>
									</ul>
								</div>
							</li>

							<li class="c2_li2">
								<div class="order_info_tit clear">
									<h4>배송정보</h4>
<%--									<p>배송 휴무일 : 빠른배송(휴무없음), 택배배송(일요일)</p>--%>
									<button type="button">배송지 변경 안내</button>
									<div class="oit_popup">
										<div class="oit_popup_wrap">
											<span class="tri"><img src="/resources/images/main/oit_popup_tri.png" width="12" height="10" border="0" alt="" /></span>
											<p>장바구니, 홈에서<br>배송지를 변경할 수 있어요</p>
											<button type="button" class="oit_close"><img src="/resources/images/main/oit_popup_close.png" width="11" height="11" border="0" alt="" /></button>
										</div>
									</div>
								</div>
	
								<div class="order_info_txt">
									<ul class="depth2">
										<li class="clear oit_1">
											<h5>배송지</h5>
											<div class="p_wrap">
												<c:if test="">
													<h6>기본배송지</h6>
												</c:if>
												<p>${member_addr.fd_addr_desc}</p>
											</div>
										</li>

										<li class="clear oit_2">
											<h5>상세정보</h5>

											<div class="p_wrap_right">
												<div class="p_wrap pw_1 clear">
													<p>${member_addr.fd_addr_detail_desc} ${member_addr.fd_addr_post_desc}</p>
												</div>

												<div class="p_wrap pw_2 clear">
													<h6>배송요청사항</h6>
													<div class="pw_2_wrap">
														<div class="form_cont">
															<label for="selboxDirect"></label>
															<input type="text" id="selboxDirect" maxlength="60" placeholder="요청사항을 직접 입력해주세요." name="selboxDirect" class="non_tar">
															<button type="button" class="ship_req_btn non_tar"><img src="/resources/images/main/cart_down.jpg" width="10" height="6" border="0" alt="" /></button>
														</div>

														<div id="selectDiv2">
															<ul>
																<li class="ship_req1"><p>배송요청사항 직접입력하기.</p></li>
																<li class="ship_req2"><p>배송 전 연락 부탁드립니다.</p></li>
																<li class="ship_req3"><p>부재시 경비실에 맡겨주세요.</p></li>
																<li class="ship_req4"><p>부재시 전화 주시거나 문자 남겨주세요.</p></li>
																<li class="ship_req5"><p>안전한 배송 부탁드립니다.</p></li>
															</ul>
														</div>
													</div>
													<div class="ship_req">
														<input type="text">
													</div>
												</div>

<%--												<div class="p_wrap pw_3 clear">--%>
<%--													<h6>배송완료 메시지</h6>--%>
<%--													<p>배송직후</p>--%>
<%--												</div>--%>
<%--												--%>
<%--												<div class="p_wrap pw_4 clear">--%>
<%--													<h6>배송희망시간</h6>--%>
<%--													<p>오전 10:00 ~</p>--%>
<%--												</div>--%>
											</div>
										</li>
									</ul>
								</div>

<%--								<button class="ship_modi">수정하기</button>--%>
<%--								<div class="sc_btn">--%>
<%--									<button type="button">수정하기</button>--%>
<%--								</div>--%>
							</li>
						</ul>
					</div>
				</div>
			</article>

			<article class="cnt3">
				<div class="area">
					<div class="real_area">

						<div class="left">
							<ul class="depth1">
								<li class="c3_li1">
									<div class="order_info_tit clear">
										<h4>쿠폰 / 포인트</h4>
										<p>할인쿠폰과 포인트 중 하나의 혜택만 사용하실 수 있습니다.</p>
<%--										<p>쿠폰 정보입니다.</p>--%>
									</div>

									<div class="order_info_txt">
										<ul class="depth2">
											<li class="clear oit_1">
												<h5>쿠폰 적용</h5>
												<div class="p_wrap">
													<div id="selectDiv" class="">
														<c:if test="${empty coupon_list}">
															<div id="selectTit"><p class="non_tar">사용가능한 쿠폰이 없습니다.</p></div>
														</c:if>
														<c:if test="${!empty coupon_list}">
															<button type="button" class="coupon_btn non_tar"><img src="/resources/images/main/cart_down.jpg" width="12" height="7" border="0" alt="" /></button>
															<div id="selectTit"><p class="non_tar">사용 가능 쿠폰 <c:out value="${coupon_list.size()}"/> 개</p></div>
															<ul id="coupon_select">

																<li class="coupon1 no_cp clear">
																	<div class="cp_rdo">
																		<input id="cpRdo" type="radio" name="cp_rds_cancel">
																		<label for="cpRdo">쿠폰 적용 안 함</label>
																	</div>
																</li>

																<c:forEach var="item" items="${coupon_list}" varStatus="status">
																	<li class="coupon norm_cp clear">
																		<div class="cp_rdo">
																			<c:if test="${item.fd_coupon_type eq 'UC0003'}">
																				<input id="cpRdo${status.index}" type="radio" name="cp_rds_ship" value="${item.pk_idx}">
																				<label for="cpRdo${status.index}">배송비 할인</label>
																			</c:if>
																			<c:if test="${item.fd_coupon_type eq 'UC0004'}">
																				<input id="cpRdo${status.index}" type="radio" name="cp_rds_cost" value="${item.pk_idx}">
																				<label for="cpRdo${status.index}">
																					<fmt:formatNumber value="${item.fd_coupon_info}" pattern="#,###" />원 할인
																				</label>
																				<input hidden name="coupon_info" value="${item.fd_coupon_info}"/>
																			</c:if>
																			<c:if test="${item.fd_coupon_type eq 'UC0002'}">
																				<input id="cpRdo${status.index}" type="radio" name="cp_rds_cost" value="${item.pk_idx}">
																				<label for="cpRdo${status.index}">
																					<fmt:formatNumber value="${item.fd_coupon_info}" pattern="#,###" />원 할인
																				</label>
																				<input hidden name="coupon_info" value="${item.fd_coupon_info}"/>
																			</c:if>
																		</div>
																		<div class="cp_info">
																			<h6><c:out value="${item.fd_coupon_name}"/></h6>
																			<p>
																				<fmt:parseDate var="dateString" value="${item.fd_expire_date}" pattern="yyyyMMdd" />
																				유효기간 <fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd"/> 까지
																			</p>
																		</div>
																	</li>
																</c:forEach>
															</ul>
														</c:if>
													</div>
												</div>
											</li>

											<li class="clear oit_2">
												<h5>포인트 적용</h5>
												<div class="p_wrap_right">
													<div class="p_wrap p_wrap_1 clear">
														<div class="form_cont">
															<label for="mileage">0</label>
															<input type="text" id="mileage">
															<input type="text" id="mileageValue">
														</div>

														<button type="button" class="all_use">모두사용</button>
													</div>

													<div class="p_wrap p_wrap_2 clear">
														<h6>현재 포인트 : <span id="currentMileage"><fmt:formatNumber value="${mileage.fd_mileage_point}" pattern="#,###" /></span> 포인트</h6>
														<p>- 보유 포인트 1천원 이상부터 사용가능</p>
														<c:choose>
															<c:when test="${mileage.fd_mileage_point > total_max_use_point}">
																<p>- 최대 사용 가능 포인트 : <span style="font-size:13px;color:#0066CC;"><fmt:formatNumber value="${total_max_use_point}" pattern="#,###" /></span> 포인트</p>
																<input type="hidden" name="total_max_use_point" id="total_max_use_point" value="${total_max_use_point}"/>
															</c:when>
															<c:otherwise>
																<p>- 최대 사용 가능 포인트 : <span style="font-size:13px;color:#0066CC;"><fmt:formatNumber value="${mileage.fd_mileage_point}" pattern="#,###" /></span> 포인트</p>
																<input type="hidden" name="total_max_use_point" id="total_max_use_point" value="${mileage.fd_mileage_point}"/>
															</c:otherwise>
														</c:choose>
														<p>- 일반 상품은 총 결제 금액의 5% 까지 사용가능</p>														
														<p>- 적립금 내역 : 내 계정 > 포인트 쿠폰 </p>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</li>

								<li class="c3_li2">
									<div class="order_info_tit clear">
										<h4>결제수단</h4>
<%--										<p>결제수단 관련 정보입니다.</p>--%>
									</div>

									<div class="order_info_txt">
										<ul class="depth2">
											<li class="oit_1">
												<div class="chk_wrap chk_wrap1 clear">
													<div>
														<input type="radio" id="ex_rd3" name="ex_rds_1" value="transfer">
														<label for="ex_rd3">계좌이체</label>
													</div>

<%--													<div class="p_wrap">--%>
<%--														<p>하나은행</p>--%>
<%--														<p>예금주 : 메디밸류</p>--%>
<%--														<input hidden id="bank_no" value="547-910035-44104"/>--%>
<%--														<p>547-910035-44104--%>
<%--															<button type="button" class="copy_btn">복사하기</button>--%>
<%--														</p>--%>
<%--													</div>--%>
												</div>

												<div class="chk_wrap chk_wrap2 clear">
													<div>
														<input type="radio" id="ex_rd4" name="ex_rds_1" value="card">
														<label for="ex_rd4">신용카드</label>
													</div>
												</div>

<%--												<div class="chk_wrap chk_wrap2 clear">--%>
<%--													<div>--%>
<%--														<input type="radio" id="ex_rd8" name="ex_rds_1" value="card2">--%>
<%--														<label for="ex_rd8">세틀뱅크카드</label>--%>
<%--													</div>--%>
<%--												</div>--%>

												<div class="chk_wrap chk_wrap2 clear">
													<div>
														<input type="radio" id="ex_rd7" name="ex_rds_1" value="bank">
														<label for="ex_rd7">내통장결제</label>
													</div>
												</div>

<%--												 메디캐쉬 추가 영역 START--%>
<%--											 	<div class="chk_wrap chk_wrap2">--%>
<%--													<div>--%>
<%--														<input type="radio" id="ex_rd9" name="ex_rds_1" value="medicash">--%>
<%--														<label for="ex_rd9">메디캐쉬</label>--%>
<%--													</div>--%>
<%--												</div>--%>
<%--												 메디캐쉬 추가 영역 END--%>
											</li>

											<li class="clear oit_2">
												<div class="p_wrap">
													<div class="row1">
														<p>하나은행</p>
														<p>예금주 : 메디밸류</p>
														<input hidden id="bank_no" value="547-910035-44104"/>
														<p>547-910035-44104
															<button class="copy_btn">복사하기</button>
														</p>
													</div>
													<div class="row2">
														<p>입금기한</p>
														<c:set var="time" value="<%=new java.util.Date(new java.util.Date().getTime() + 60*60*24*1000 *3 )%>" />
														<p><fmt:formatDate value="${time}" pattern="yyyy년 MM월 dd일 00시 00분까지"/></p>
													</div>

												</div>
											</li>
											<li class="clear oit_3">
												<div class="row_wrap">
													<div class="row">
														<div class="hd">보유 메디캐쉬</div>
														<div class="num"><span id="medicash_info"><fmt:formatNumber value="${medicash.fd_medicash_info}" pattern="#,###" /></span> 원</div>
														<div class="btn"><button id="btn_medicash_recharge">충전하기</button></div>
														<div class="btn"><button id="btn_medicash_refresh">새로고침</button></div>
													</div>
													<div class="row">
														<div class="hd">메디캐쉬 사용</div>
														<div class="num"><input id="medicash_use_all" disabled type="text"/></div>
														<div class="btn"><button id="btn_medicash_use_all">모두사용</button></div>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</li>

								<li class="c3_li3">
									<div class="order_info_tit clear">
										<h4>세금계산서 정보</h4>
<%--										<p>세금계산서 정보 입니다.</p>--%>
									</div>

									<div class="order_info_txt">
										<ul class="depth2">
											<li class="clear oit_1">
												<h5>세금계산서신청</h5>

												<div id="tax_yn" class="chk_wrap clear">
													<div>
														<input type="radio" id="ex_rd5" name="ex_rds_2" value="Y">
														<label for="ex_rd5">신청</label>
													</div>

													<div>
														<input type="radio" id="ex_rd6" name="ex_rds_2" value="N">
														<label for="ex_rd6">미신청</label>
													</div>
												</div>
											</li>

											<li class="tax_info_li clear" style="margin-top:32px">
												<h5>사업자번호</h5>
												<p><c:out value="${member.fd_corporate_registration_number_desc}"/></p>
												<div class="form_cont" hidden>
													<input type="text" id="fd_corporate_registration_number" value="<c:out value="${member.fd_corporate_registration_number_desc}"/>"/>
												</div>
											</li>

											<li class="tax_info_li clear">
												<h5>회사명</h5>
												<p><c:out value="${member.fd_corporate_registration_name_desc}"/></p>
												<div class="form_cont" hidden>
													<input type="text" id="fd_corporate_registration_name" value="<c:out value="${member.fd_corporate_registration_name_desc}"/>"/>
												</div>
											</li>

											<li class="tax_info_li clear">
												<h5>대표자명</h5>
												<p><c:out value="${member.fd_corporate_representative_name_desc}"/></p>
												<div class="form_cont" hidden>
													<input type="text" id="fd_corporate_representative_name" value="<c:out value="${member.fd_corporate_representative_name_desc}"/>"/>
												</div>
											</li>

											<li class="tax_info_li clear">
												<h5>업태</h5>
												<p><c:out value="${member.fd_corporate_business_conditions_desc}"/></p>
												<div class="form_cont" hidden>
													<input type="text" id="fd_corporate_business_conditions" value="<c:out value="${member.fd_corporate_business_conditions_desc}"/>"/>
												</div>
											</li>

											<li class="tax_info_li clear">
												<h5>종목</h5>
												<p><c:out value="${member.fd_corporate_industry_type_desc}"/></p>
												<div class="form_cont" hidden>
													<input type="text" id="fd_corporate_industry_type" value="<c:out value="${member.fd_corporate_industry_type_desc}"/>"/>
												</div>
											</li>

											<li class="tax_info_li clear">
												<h5>이메일</h5>
												<p><c:out value="${member.fd_email_info_desc}"/></p>
												<div class="form_cont" hidden>
													<input type="text" id="fd_email_info" value="<c:out value="${member.fd_email_info_desc}"/>"/>
												</div>
											</li>
										</ul>
										<button type="button" class="tax_modi">수정하기</button>
									</div>
								</li>
							</ul>
						</div>

						<div class="right">
							<div class="floating_box2">
								<h4>결제금액</h4>
								<div class="pd_cost_result">
									<ul class="depth1">
										<li class="pd_cost_1">
											<div class="pdc_li1 clear">
												<h5>제품금액</h5>
												<p><strong><fmt:formatNumber value="${order_info.fd_total_payment}" pattern="#,###" /></strong> 원</p>
											</div>

											<ul class="depth2">
												<li class="pdc_li2_1 clear">
													<h6>└ 상품금액</h6>
													<p>
														<fmt:formatNumber value="${order_info.fd_total_payment}" pattern="#,###" />원
													</p>
												</li>
												<li class="pdc_li2_2 clear">
													<h6>└ 상품할인금액</h6>
													<p>0원</p>
												</li>
											</ul>
										</li>
										<li class="pd_cost_2">
											<div class="pdc_li1 clear">
												<h5>배송비</h5>
												<p><strong><fmt:formatNumber value="${order_info.fd_delivery_fee}" pattern="#,###" /></strong> 원</p>
											</div>
										</li>

										<li class="pd_cost_3">
											<div class="pdc_li1 clear">
												<h5>쿠폰할인금액</h5>
												<p><strong id="coupon_info">0</strong> 원</p>
											</div>
										</li>
										<li class="pd_cost_4">
											<div class="pdc_li1 clear">
												<h5>적립금사용</h5>
												<p><strong id="mileage_info">0</strong> 원</p>
											</div>
										</li>
										<li class="pd_cost_5 clear">
											<ul class="depth2">
												<li>
													<div class="pdc_li1 clear">
														<h5>최종결제금액</h5>
														<div class="wrap clear">
															<p>원</p>
															<strong><fmt:formatNumber value="${order_info.fd_total_payment + order_info.fd_delivery_fee}" pattern="#,###" /></strong>
														</div>
													</div>
												</li>
<%--												<li class="clear">--%>
<%--													<div class="pdc_li2 clear">--%>
<%--														<span class="mark">적립</span>--%>
<%--														<p>3,000원</p>--%>
<%--													</div>--%>
<%--												</li>--%>
											</ul>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>

			<article class="cnt4">
				<div class="area">
					<div class="real_area">
						<div class="order_info_tit clear">
							<h4>개인정보 수집/제공</h4>
<%--							<p>개인정보 수집/제공 정보입니다.</p>--%>
						</div>
						<div class="order_info_txt">
							<div class="chk_wrap">
								<div>
									<input id="chk5" type="checkbox" name="payment_agreement_yn" value="Y">
									<label for="chk5">결제 진행 필수 동의</label>
								</div>
								<div class="p_wrap clear">
									<p>개인정보 수집 이용 및 위탁 동의 (필수)</p>
									<button type="button" class="terms_view">약관보기</button>

									<div class="terms_popup">
										<button type="button" class="terms_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
										<div class="terms_tit"><h4>이용약관동의 <span>(필수)</span></h4></div>
										<div class="terms_txt">
											${TE0002.fd_content}
										</div>
										<button type="button" class="terms_btn">확인</button>
									</div>
								</div>
								<div class="p_wrap clear">
									<p>결제대행 서비스 약관 동의 (필수)</p>
									<button type="button" class="terms_view">약관보기</button>
									<div class="terms_popup">
										<button type="button" class="terms_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
										<div class="terms_tit"><h4>이용약관동의 <span>(필수)</span></h4></div>
										<div class="terms_txt">
											${TE0004.fd_content}
										</div>
										<button type="button" class="terms_btn">확인</button>
									</div>
								</div>
							</div>
						</div>

						<div class="clear">
							<button type="button" class="paying_btn">결제하기</button>
						</div>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>