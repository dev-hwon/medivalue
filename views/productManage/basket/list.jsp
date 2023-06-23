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
		<script type="text/javascript" src="/resources/js/common.js?20220203"></script>
		<script src="/resources/js/sub2.js"></script>
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">

			var npcDeliveryFee = 0;
			var npcDeliveryFeeLimit = 0;
			var commonDeliveryFee = 0;
			var commonDeliveryFeeLimit = 0;

			var signInPopup = {
				showMessage: function (msg) {
					$("#pop_alarm_msg").text(msg);
					$("#black").show();
					$(".popup_message_type_1").show();
				}
			}

			var orderPaymentObj = {
				initOrderPaymentTotalPreview: function () {
					// $("input[name=acc]").prop("checked",true);
					let totalAmount = 0;
					let totalCount = 0;
					$(".pd_chk > input[name='amount']").each(function (index, item) {
						if($(item).next("input[name='acc']").prop("checked")){
							let cnt = Number($(item).prev("input[name='cnt']").val());
							totalAmount += Number($(item).val()) * cnt;
							totalCount += 1;
						}
					});

					if (totalCount > 0) {
						$(".order_btn").removeClass("order_zero");
						$("#pd_cost_total").text(totalAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
						$(".order_btn > button").text("총 " + totalCount + "개 주문하기");
					} else {
						$(".order_btn").addClass("order_zero");
						$(".order_btn > button").text("주문할 제품을 선택해주세요.");
						$(".order_btn > button").attr("disabled", true);
					}

					$(".pd_cost_2 > p").children().text(0);
				},
				setOrderPaymentPreview: function (bAll) {
					let totalAmount = 0;
					let normalTotalAmount = 0;
					let totalCount = 0;
					let deliveryFee = Number(commonDeliveryFee);
					$(".pd_chk > input[name='amount']").each(function (index, item) {
						let chk = $(item).closest("li").find(".soldout").length;
						if (chk == 1) {
// 							signInPopup.showMessage("품절된 제품은 제외되었습니다.");
							if (bAll) $(item).next("input[name='acc']").prop("checked", false);
						} else {
							if($(item).next("input[name='acc']").prop("checked")){
								let cnt = Number($(item).prev("input[name='cnt']").val());
								let amount = Number($(item).val()) * cnt;
								totalAmount += amount;
								totalCount += 1;
								if ($(item).next("input[name='acc']").attr("class") == "npc") {
									normalTotalAmount += amount;
								}
							}
						}
					});

					if (totalCount > 0) {

						$(".order_btn").removeClass("order_zero");
						$(".order_btn > button").text("총 " + totalCount + "개 주문하기");
						$(".order_btn > button").attr("disabled", false);

					} else {
						$(".order_btn").addClass("order_zero");
						$(".order_btn > button").text("주문할 제품을 선택해주세요.");
						$(".order_btn > button").attr("disabled", true);
					}

					$("#pd_cost_total").text(totalAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

					// if(normalTotalAmount > 0 && (normalTotalAmount < npcDeliveryFeeLimit)){
					if(totalAmount > 0 && (totalAmount < commonDeliveryFeeLimit)){
						totalAmount += deliveryFee;
						$(".pd_cost_2 > p").children().text(deliveryFee.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					} else {
						$(".pd_cost_2 > p").children().text(0);
					}

					$("#pd_cost_total_result").text(totalAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

				}
			};

			var memberAddrListObj = {
				getMemberAddrList: function () {
					$.ajax({
						url: "/product/rest/addr/list",
						method: "GET",
						contentType: "application/json",
						success: function (data) {
							let rtn_code = data["rtn_code"];
							let rtn_msg = data["rtn_msg"];
							if (rtn_code === "200") {
								let memberAddrList = data["memberAddrList"];
								memberAddrListObj.setMemberAddrListPopup(memberAddrList);

							} else {
								$("#default_addr").hide();
								$(".ship_change").attr("disabled" , true);
								$(".ship_change").text("로그인을 해주세요.")
							}
						}
					});
				},
				setMemberOrderAddr: function (memberAddr) {
					if (memberAddr != null) {
						let fd_addr = memberAddr["fd_addr_desc"];
						let fd_addr_detail = memberAddr["fd_addr_detail_desc"];
						$("#default_addr").text(fd_addr + " " + fd_addr_detail);
					}

				},
				setMemberAddrListPopup: function (memberAddrList) {
					$("#sc_list").empty();
					let scHeaderHTML =
							"<li class='sc_txt1 clear'>" +
								"<h5 class='sc_h5_1'>선택</h5>" +
								"<h5 class='sc_h5_2'>배송정보</h5>" +
								"<h5 class='sc_h5_3'>수정</h5>" +
							"</li>";

					$("#sc_list").append(scHeaderHTML);

					let scListHTML = "";

					let selectedAddrIdx = $("#selected_addr").val();

					for (let addr_idx = 0; addr_idx < memberAddrList.length; addr_idx++) {
						let memberAddr = memberAddrList[addr_idx];
						let fd_basic_yn = memberAddr["fd_basic_yn"];
						let fd_addr = memberAddr["fd_addr_desc"];
						let fd_addr_name = memberAddr["fd_addr_name"];
						let fd_addr_detail = memberAddr["fd_addr_detail_desc"];
						let fd_medical_name = memberAddr["fd_medical_name"];
						let fd_tel_info = memberAddr["fd_tel_info_desc"];
						let pk_idx = memberAddr["pk_idx"];
						if (selectedAddrIdx != null && selectedAddrIdx !== '') {
							if (pk_idx == selectedAddrIdx) {
								memberAddrListObj.setMemberOrderAddr(memberAddr);
							}
						} else if (fd_basic_yn === "Y") {
								$("#selected_addr").val(memberAddr["pk_idx"]);
								memberAddrListObj.setMemberOrderAddr(memberAddr);
						} else {
						//	기본배송지 설정 필요
						}

						scListHTML +=
							"<li class='sc_txt2 clear'>" +
								"<div class='sc_rdo'>" +
									"<input id='scRdo" + pk_idx + "'type='radio' name='scRdo' value='" + pk_idx + "'>" +
									"<label for='scRdo" + pk_idx + "'></label>" +
								"</div>" +

								"<div class='sc_info'>" +
									"<div class='sc_info_wrap'>";

						if (fd_basic_yn === "Y") {
							scListHTML +=
									"<span class='sc_sp'>기본배송지</span>";
						}

							scListHTML +=
										"<p class='sc_addr'>" + fd_addr + " " + fd_addr_detail + "</p>" +
										"<p class='sc_tel'><span>" + fd_addr_name + "</span>" + " " + fd_tel_info + "</p>" +
									"</div>" +
								"</div>" +

								"<div class='sc_modi'>" +
									"<button type='button' id='" + pk_idx + "'><img src='/resources/images/main/sc_modi.jpg' width='22' height='22' border='0' alt='' /></button>" +
								"</div>" +
							"</li>";
					}

					$("#sc_list").append(scListHTML);
				}
			}

			var basketList = {
				checkBasketList: function () {
					//여기서 화면 비어있는지 컨트롤
					let salePdSize = $(".sale_pd_list > ul").children().length;
					let normalPdSize = $(".normal_pd_list > ul").children().length;

					if (salePdSize == 0 && normalPdSize == 0) {
						$("#basket").empty();
						$("#basket").append(
								"<div class='cart_zero'>" +
									"<h4>장바구니에 담긴 상품이 없습니다</h4>" +
								"</div>")

						//하위 바스켓 리스트
					} else if (salePdSize == 0) {
						$(".sale_pd").empty();
						$(".sale_pd").append(
								"<div class='cart_zero'>" +
								"<h4>장바구니에 담긴 특가 상품이 없습니다</h4>" +
								"</div>"
						)
					} else if (normalPdSize == 0) {
						$(".normal_pd").empty();
						$(".normal_pd").append(
								"<div class='cart_zero'>" +
									"<h4>장바구니에 담긴 일반 상품이 없습니다</h4>" +
								"</div>"
						)
					}
				},
				deleteBasketProduct: function (pdIdx) {
					$(".le_ok").attr("id", pdIdx);
					$("#pop_alarm_msg_2").text("상품을 삭제하시겠습니까?");
					$(".popup_message_type_2").show();
					$("#black").show();
				},
				deleteBasketProductAction: function (pdIdx) {
					$.ajax({
						url: "/product/rest/basket/delete/" + pdIdx,
						method: "POST",
						contentType: "application/json",
						success: function (data) {
							if (data["rtn_code"] === "200") {
								$("#li" + pdIdx).remove();
								basketList.checkBasketList();
								orderPaymentObj.setOrderPaymentPreview();
								$("#pop_alarm_msg").text(data["rtn_msg"]);
								$("#black").show();
								$(".popup_message_type_1").show();
							} else {
								$("#pop_alarm_msg").text(data["rtn_msg"]);
								$("#black").show();
								$(".popup_message_type_1").show();
							}

							// $("input[name=acc]").prop("checked",false);
						}
					});
				},
				deleteBasketSelectedProduct: function () {
					$("#pop_alarm_msg_2").text("선택한 상품을 삭제하시겠습니까?");
					$(".popup_message_type_2").show();
					$("#black").show();
				},
				deleteBasketSelectedProductAction: function () {
					let pdList = new Array();
					$(".pd_chk > input[name='acc']").each(function (index, item) {
						if ($(item).prop("checked")) {
							pdList.push($(item).val());
						}
					});
					$.ajax({
						url: "/product/rest/basket/delete",
						method: "POST",
						contentType: "application/json",
						data: JSON.stringify({
							pdList: pdList
						}),
						success: function (data) {
							if (data["rtn_code"] === "200") {
								pdList.forEach(function (value, index, array) {
									$("#li" + value).remove();
								});
								basketList.checkBasketList();
								orderPaymentObj.setOrderPaymentPreview();
							}

							signInPopup.showMessage(data["rtn_msg"]);
							$("input[name=acc]").prop("checked",false);
						}
					});
				},
				setBasketProduct: function (className, pkIdx, cnt) {
					$.ajax({
						url: "/product/rest/basket/"+ className + "/" + pkIdx,
						method: "POST",
						contentType: "application/json",
						data: JSON.stringify({
							cnt: cnt
						}),
						success: function (data) {
							if (data["rtn_code"] === "200") {
								let cnt = data["fd_cnt"];
								$("#qb" + pkIdx).val(cnt);
								$("#cnt" + pkIdx).val(cnt);
								orderPaymentObj.setOrderPaymentPreview();

								let amount = $("#amount" + pkIdx).val();
								amount = amount * Number(cnt);
								$("#price" + pkIdx).text(amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원");

							} else {
								signInPopup.showMessage(data["rtn_msg"]);
							}
						}
					});
				},
				getDeliveryFee: function () {
					$.ajax({
						url: "/product/rest/delivery/fee",
						method: "GET",
						contentType: "application/json",
						async: false,
						success: function (data) {
							if (data["rtn_code"] === "200") {
								let deliveryInfo = data["productDeliveryFeeInfo"];
								let normalDeliveryInfo = deliveryInfo["N"];
								let specialDeliveryInfo = deliveryInfo["S"];
								let commonDeliveryInfo = deliveryInfo["C"];
								npcDeliveryFee = Number(normalDeliveryInfo["fd_delivery_fee"]);
								npcDeliveryFeeLimit = Number(normalDeliveryInfo["fd_delivery_fee_limit"]);
								commonDeliveryFee = Number(commonDeliveryInfo["fd_delivery_fee"]);
								commonDeliveryFeeLimit = Number(commonDeliveryInfo["fd_delivery_fee_limit"]);
								// spcDeliveryFee = specialDeliveryInfo["fd_delivery_fee"];
								// spcDeliveryFeeLimit = specialDeliveryInfo["fd_delivery_fee_limit"];

								// $(".pd_cost_2 > p").children().text(this.npcDeliveryFee.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
							} else {
								signInPopup.showMessage(data["rtn_msg"]);
							}
						}
					})
				},
				// orderBasketList: function () {
				// 	console.log("click");
				// }
			};

			$(document).ready(function (){

				let login_check = '${login_check}';
				if (login_check === 'N') {
					// alert('로그인 후 이용 가능합니다.');
					location.replace("/access/login")
				}

				basketList.getDeliveryFee();
				// orderPaymentObj.initOrderPaymentTotalPreview();
				orderPaymentObj.setOrderPaymentPreview();
				memberAddrListObj.getMemberAddrList();

				// $(document).on("click", ".minus, .plus", function () {
				// 	let pkIdx = $(this).parent().attr("id");
				// 	let className = $(this).attr("class");
				// 	let cnt = $("#cnt" + pkIdx).val();
				// 	basketList.setBasketProduct(className, pkIdx, cnt);
				// });
				$(document).on("click", ".minus, .plus", function () {
					let pkIdx = $(this).parent().attr("id");
					let className = $(this).attr("class");
					let cnt = $("#qb" + pkIdx).val();
					basketList.setBasketProduct(className, pkIdx, cnt);
				});

				$(document).on("change", ".num", function () {
					let pkIdx = $(this).parent().parent().attr("id");
					let cnt = $("#qb" + pkIdx).val();
					basketList.setBasketProduct("cnt", pkIdx, cnt);
				});


				$(document).on("click", ".sc_modi > button", function () {

					$(".sm_tit > h4").text("배송지 수정");

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

							// $("#w_addr_post").val(data.zonecode);

							if(roadAddr != ''){
								$("#sm_addr").text(roadAddr + ' ' + extraRoadAddr);
							}else if(jibunAddress != ''){
								$("#sm_addr").text(data.jibunAddress + ' ' + extraRoadAddr);
							}
						},
						onclose: function(state) {
							if(state === 'FORCE_CLOSE'){
								$("#alarm_msg").text('확인된 주소를 등록해주세요.');
								$("#notice_view").addClass('on');
							} else if(state === 'COMPLETE_CLOSE'){
								$(".ship_change_popup").css("display","none").next(".sc_modi_popup").css("display","block");
							}
						}
					}).open();

					// $(".ship_change_popup").css("display","none").next(".sc_modi_popup").css("display","block");
					$(".form_cont input[type=text]").siblings("label").hide();

					let pk_idx = $(this).attr("id");
					$(".sm_btn > button").attr("id", pk_idx);

					//modify addr
					$.ajax({
						url: "/product/rest/addr/info/" + pk_idx,
						method: "GET",
						contentType: "application/json",
						success: function (data) {
							let memberAddr = data["memberAddr"];
							let fd_basic_yn = memberAddr["fd_basic_yn"];
							let fd_addr = memberAddr["fd_addr_desc"];
							let fd_addr_detail = memberAddr["fd_addr_detail_desc"];
							let fd_medical_name = memberAddr["fd_medical_name"];
							let fd_addr_name = memberAddr["fd_addr_name"];
							let fd_tel_info = memberAddr["fd_tel_info_desc"];

							// $("#sm_addr").text(fd_addr);

							if (fd_basic_yn != null && fd_basic_yn !== '') {
								if (fd_basic_yn === "N") {
									$("#sc_sp").hide();
								} else {
									$("#sc_sp").show();
								}
							}

							if (fd_addr_detail != null && fd_addr_detail !== '') {
								$("#placeholder_sm1").val(fd_addr_detail);
							}

							if (fd_addr_name != null && fd_addr_name !== '') {
								$("#placeholder_sm2").val(fd_addr_name);
							}

							if (fd_tel_info != null && fd_tel_info !== '') {
								$("#placeholder_sm3").val(fd_tel_info);
							}

						}
					})
				});

				$(".sc_btn > button").on("click",function(){

					$(".sm_tit > h4").text("배송지 추가");

					$("#sm_addr").text("");
					$("#placeholder_sm1").val("");
					$("#placeholder_sm2").val("");
					$("#placeholder_sm3").val("");
					$("#placeholder_sm4").val("");

					$(".sm_btn > button").attr("id", "");

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

							$("#placeholder_sm4").val(data.zonecode);

							if(roadAddr != ''){
								$("#sm_addr").text(roadAddr + ' ' + extraRoadAddr);
							}else if(jibunAddress != ''){
								$("#sm_addr").text(data.jibunAddress + ' ' + extraRoadAddr);
							}
						},
						onclose: function(state) {
							if(state === 'FORCE_CLOSE'){
								$("#alarm_msg").text('확인된 주소를 등록해주세요.');
								$("#notice_view").addClass('on');
							} else if(state === 'COMPLETE_CLOSE'){
								$(".ship_change_popup").css("display","none").next(".sc_modi_popup").css("display","block");
							}
						}
					}).open();
				});

				$(".sm_btn > button").on("click", function () {

					let pk_idx = $(".sm_btn > button").attr("id");

					let addr = $("#sm_addr").text();
					let addr_detail = $("#placeholder_sm1").val();
					let addr_name = $("#placeholder_sm2").val();
					let tel_info = $("#placeholder_sm3").val();
					let addr_post = $("#placeholder_sm4").val();

					//valid check

					$.ajax({
						url: "/product/rest/addr/manage",
						method: "POST",
						contentType: "application/json",
						data: JSON.stringify({
							pk_idx: pk_idx,
							addr: addr,
							addr_detail: addr_detail,
							addr_name: addr_name,
							tel_info: tel_info,
							addr_post: addr_post
						}),
						success: function (data) {
							signInPopup.showMessage(data["rtn_msg"]);

							$(".sc_modi_popup").css("display","none");
							$("#black").css("display","none");

							memberAddrListObj.getMemberAddrList();

						}
					});

				});

				$(document).on("click", "input[name='scRdo']", function () {
					let pk_idx = $(this).val();

					$.ajax({
						url: "/product/rest/addr/info/" + pk_idx,
						method: "GET",
						contentType: "application/json",
						success: function (data) {

							$(".ship_change_popup").css("display","none");
							$("#black").css("display","none");

							if (data["rtn_code"] === "200") {
								let memberAddr = data["memberAddr"];
								memberAddrListObj.setMemberOrderAddr(memberAddr);
								$("#selected_addr").val(memberAddr["pk_idx"]);

							} else {
								signInPopup.showMessage(data["rtn_msg"]);
							}

						}
					});

				});

				$(document).on("click", "input[name=acc]", function () {
					let bAll = false;
					if ($(this).prop("class").indexOf("all_chk_cb") > -1 || $(this).prop("id").indexOf("saleChk1") > -1 || $(this).prop("id").indexOf("nomChk1") > -1) bAll = true;
					let chk = $(this).closest("li").find(".soldout").length;
					let isChecked = $(this).closest("li").find("input[name='acc']").prop("checked");
					if (chk == 1) {
						if (isChecked) signInPopup.showMessage("품절된 제품입니다.");
// 						$(this).prop("checked", false);
// 						return false;
					}
					orderPaymentObj.setOrderPaymentPreview(bAll);
				});

				$(document).on("click", ".chc_delete", function () {
					basketList.deleteBasketSelectedProduct();
				});

				$(document).on("click", ".order_btn > button", function (event) {
					event.preventDefault();
					let orderForm = document.getElementById("order_form");
					orderForm = new FormData(orderForm);
					
					let bChk = checkSoldOut();
					if (bChk) {

						let pdList = new Array();
						let selectedAddrIdx = '';
						for (let order of orderForm.entries()) {
							let name = order[0];
							let value = order[1];
							if (name == 'selected_addr') {
								selectedAddrIdx = value;
							}
							if (name == 'acc' && value != 'on') {
								pdList.push(value);
							}
						}

						if (selectedAddrIdx == null || selectedAddrIdx == '') {
							signInPopup.showMessage("배송지를 선택해주세요.");
							return false;
						}

						$.ajax({
							url: "/order/rest/info",
							method: "POST",
							contentType: "application/json",
							data: JSON.stringify({
								selectedAddrIdx: selectedAddrIdx,
								pdList: pdList.toString()
							}),
							success: function (data) {
								if (data["rtn_code"] == "200") {
									let orderId = data["fd_order_id"];
									location.replace("/order/info/" + orderId);
								} else {
									// alert(data["rtn_msg"]);
									signInPopup.showMessage(data["rtn_msg"]);
								}
							}
						});

					}

				});

				$(".le_ok").on("click", function () {
					$(".popup_message_type_2").hide();
					$("#black").hide();
					let pdIdx = $(".le_ok").attr("id");
					if (pdIdx != null && pdIdx != '') {
						basketList.deleteBasketProductAction(pdIdx);
						$(".le_ok").removeAttr("id");
					} else {
						basketList.deleteBasketSelectedProductAction();
					}

				});

				$(".le_cancel").on("click", function () {
					$(".popup_message_type_2").hide();
					$("#black").hide();
				});

				$(".le_close").on("click", function () {
					$(".popup_message_type_2").hide();
					$("#black").hide();
				});

				// $(".order_btn").on("click", function () {
				// 	let bChk = checkSoldOut();
				// 	if (bChk) {
				// 		$("#order_form").submit();
				// 	}
				// });
			});
			
			function checkSoldOut() {
				let bProcess = true;
				$(".cart_pd_list ul li").each(function(index, item){
					let chk = $(item).closest("li").find(".soldout").length;
					let isChecked = $(item).closest("li").find("input[name=acc]").prop("checked");
					if (chk == 1 && isChecked) {
						signInPopup.showMessage("품절된 제품이 포함되어 있습니다.");
						$(item).next("input[name='acc']").prop("checked", false);
						bProcess = false;
					}
				});
				return bProcess;
			}

		</script>
		<script type="text/javascript">
			var _nasa={};
			if (window.wcs) _nasa["cnv"] = wcs.cnv("3","1");
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub2_1" class="sub">
			<form id="order_form">
				<input hidden id="selected_addr" name="selected_addr" value=""/>
			<article class="cnt1">
				<div class="area">
					<div class="real_area clear">
						<h3>장바구니</h3>
						<div class="left_cart_list">
							<div class="all_chk_wrap clear">
								<div class="all_chk">
									<input id="chk1" type="checkbox" name="acc" class="all_chk_cb">
									<label for="chk1">전체선택<span name="item_select"></span></label>
								</div>
		
								<div class="chc_delete">
									<button type="button">선택삭제</button>
								</div>
							</div>
							<div id="basket">
							<c:if test="${basketSize > 0}">
								<c:if test="${!empty productSaleList}">
										<div class="cart_pd sale_pd">
											<div class="cart_pd_tit sale_pd_tit clear">
												<div class="sale_pd_chk">
													<input id="saleChk1" type="checkbox" name="acc" class="spc">
													<label for="saleChk1">특가제품</label>
												</div>
												<p><span>${estimateDeliveryDay}</span> 도착예정<button type="button"><img src="/resources/images/main/cart_up.jpg" width="8" height="4" border="0" alt="" /></button></p>
											</div>
											<div class="cart_pd_list sale_pd_list">
												<ul>
													<c:forEach var="item" items="${productSaleList}" varStatus="status">
													<li class="clear" id="<c:out value="li${item.pk_idx}"/>">
														<div class="pd_chk">
															<input hidden id="<c:out value="cnt${item.pk_idx}"/>" name="cnt" value="${item.fd_cnt}"/>
															<input hidden id="<c:out value="amount${item.pk_idx}"/>" name="amount" value="${item.shop_sale_amount}"/>
															<input <c:if test="${item.checkYn == 'Y'}">checked</c:if> id="<c:out value="chk${item.pk_idx}"/>" type="checkbox" name="acc" class="spc" value="${item.pk_idx}">
															<label for="<c:out value="chk${item.pk_idx}"/>"></label>
														</div>

														<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
															<a href="/product/detail?req_view_idx=<c:out value="${item.fk_tpsm_idx}"/>">
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
															</a>
														</div>

														<div class="info">
															<div class="info_box">
																<h4 class="pd_tit"><c:out value="${item.fd_product_name}"/></h4>
																<p class="standard"><c:out value="${item.fd_product_standard}"/></p>
																<div class="mp_wrap clear">
																	<p class="manu">제조사ㅣ<c:out value="${item.fd_company_name}"/> </p>
																	<p class="pack">포장단위ㅣ<c:out value="${item.fd_product_unit}"/></p>
																</div>
															</div>
														</div>

														<div class="quan_box clear" id="<c:out value="${item.pk_idx}"/>">
															<button type="button" class="minus">-</button>
															<div class="form_cont">
																<label for="<c:out value="qb${item.pk_idx}"/>"></label>
																<input type="text" name="cnt" id="<c:out value="qb${item.pk_idx}"/>" class="num" value="<c:out value="${item.fd_cnt}"/>">
															</div>
															<button type="button" class="plus">+</button>
														</div>

														<div class="price_info">
															<div class="price clear">
																<p id="<c:out value="price${item.pk_idx}"/>">
																	<fmt:formatNumber value="${item.shop_sale_amount*item.fd_cnt}" pattern="#,###" /> 원
																</p>
															</div>
														</div>

														<div class="delete_icon"><button type="button" onclick="basketList.deleteBasketProduct(<c:out value="${item.pk_idx}"/>)" ><img src="/resources/images/main/cart_delete.jpg" width="10" height="10" border="0" alt="" /></button></div>
													</li>
													</c:forEach>
												</ul>
											</div>
										</div>
								</c:if>
								<c:if test="${empty productSaleList}">
									<div class="cart_zero">
										<h4>장바구니에 담긴 특가 상품이 없습니다</h4>
									</div>
								</c:if>
								<c:if test="${!empty productNormalList}">
									<div class="cart_pd normal_pd">
										<div class="cart_pd_tit normal_pd_tit clear">
											<div class="nom_pd_chk">
												<input id="nomChk1" type="checkbox" name="acc" class="npc">
												<label for="nomChk1">일반제품</label>
											</div>
											<p><span>${estimateDeliveryDay}</span> 도착예정<button type="button"><img src="/resources/images/main/cart_up.jpg" width="8" height="4" border="0" alt="" /></button></p>
										</div>
										<div class="cart_pd_list normal_pd_list">
											<ul>
												<c:forEach var="item" items="${productNormalList}" varStatus="status">
													<li class="clear <c:if test="${item.fd_option_count > 0}">option</c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>" id="<c:out value="li${item.pk_idx}"/>">
														<div class="pd_chk">
															<input hidden id="<c:out value="cnt${item.pk_idx}"/>" name="cnt" value="${item.fd_cnt}"/>
															<input hidden id="<c:out value="amount${item.pk_idx}"/>" name="amount" value="${item.shop_sale_amount}"/>
															<input <c:if test="${item.checkYn == 'Y'}">checked</c:if> id="<c:out value="chk${item.pk_idx}"/>" type="checkbox" name="acc" class="npc" value="<c:out value="${item.pk_idx}"/>">
															<label for="<c:out value="chk${item.pk_idx}"/>"></label>
														</div>

														<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback</c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if> <c:if test="${item.fd_custom_use_point_yn eq 'Y'}">mileage</c:if>">
															<div class="icon_list">
																<div class="li li_option">
																	<div>
																		<div class="desc">규격<br>확인</div>
																	</div>
																</div>
																<div class="li li_insure">
																	<div>
																		<div class="desc">보험<br>재료</div>
																	</div>
																</div>
															</div>
															<a href="/product/detail?req_view_idx=<c:out value="${item.fk_tpsm_idx}"/>">
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
															</a>
														</div>


														<div class="info">
															<div class="info_box">
																<h4 class="pd_tit"><c:out value="${item.fd_product_name}"/></h4>
																<p class="standard"><c:out value="${item.fd_product_standard}"/></p>
																<div class="mp_wrap clear">
																	<p class="manu">제조사ㅣ<c:out value="${item.fd_company_name}"/> </p>
																	<p class="pack">포장단위ㅣ<c:out value="${item.fd_product_unit}"/></p>
																</div>
															</div>
														</div>

														<div class="quan_box clear" id="<c:out value="${item.pk_idx}"/>" >
															<button type="button" class="minus">-</button>
															<div class="form_cont">
																<label for="<c:out value="qb${item.pk_idx}"/>"></label>
																<input type="text" name="cnt" id="<c:out value="qb${item.pk_idx}"/>" class="num" value="<c:out value="${item.fd_cnt}"/>">
															</div>
															<button type="button" class="plus">+</button>
														</div>

														<div class="price_info">
															<div class="price clear">
																<p id="<c:out value="price${item.pk_idx}"/>">
																	<fmt:formatNumber value="${item.shop_sale_amount*item.fd_cnt}" pattern="#,###" /> 원
																</p>
															</div>
														</div>

														<div class="delete_icon"><button type="button" onclick="basketList.deleteBasketProduct(<c:out value="${item.pk_idx}"/>)" ><img src="/resources/images/main/cart_delete.jpg" width="10" height="10" border="0" alt="" /></button></div>
													</li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</c:if>
								<c:if test="${empty productNormalList}">
									<div class="cart_zero">
										<h4>장바구니에 담긴 일반 상품이 없습니다</h4>
									</div>
								</c:if>

							</c:if>

							<c:if test="${basketSize == 0}">
								<div class="cart_zero">
									<h4>장바구니에 담긴 상품이 없습니다</h4>
								</div>
							</c:if>
							</div>
							<div class="all_chk_wrap clear">
								<div class="all_chk">
									<input id="chk1" type="checkbox" name="acc" class="all_chk_cb">
									<label for="chk1">전체선택<span name="item_select"></span></label>
								</div>
		
								<div class="chc_delete">
									<button type="button">선택삭제</button>
								</div>
							</div>
						</div>
		
						<div class="right_summ">
							<div class="ship_info">
								<h4><img src="/resources/images/main/loc_icon.jpg" width="14" height="20" border="0" alt="" />배송지</h4>
								<p id="default_addr"></p>
								<button type="button" class="ship_change">배송지 변경</button>

								<div class="ship_change_popup">
									<div class="sc_tit">
										<h4>배송지</h4>
										<button type="button" class="sc_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
									</div>
		
									<div class="sc_txt">
										<ul id="sc_list">
											<li class="sc_txt1 clear">
												<h5 class="sc_h5_1">선택</h5>
												<h5 class="sc_h5_2">배송정보</h5>
												<h5 class="sc_h5_3">수정</h5>
											</li>

											<li class="sc_txt2 clear">
												<div class="sc_rdo">
													<input id="scRdo1" type="radio" name="scRdo">
													<label for="scRdo1"></label>
												</div>
		
												<div class="sc_info">
													<div class="sc_info_wrap">
														<span class="sc_sp">기본배송지</span>
														<p class="sc_addr">서울 영등포구 당산동 5가 16-3</p>
														<p class="sc_tel"><span>이엘치과</span> 02-2671-2755</p>
													</div>
												</div>
		
												<div class="sc_modi">
													<button type="button"><img src="/resources/images/main/sc_modi.jpg" width="22" height="22" border="0" alt="" /></button>
												</div>
											</li>
										</ul>
									</div>
		
									<div class="sc_btn">
										<button type="button">+ 새 배송지 추가</button>
									</div>
								</div>



								<div class="sc_modi_popup">
									<div class="sm_tit">
										<h4>배송지 수정</h4>
										<button type="button" class="sm_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
									</div>

									<div class="sm_txt">
										<div class="sm_txt_wrap">
<%--											<span class="sc_sp" id="sc_sp">기본배송지</span>--%>
											<ul>
												<li>
													<p id="sm_addr"></p>
													<div class="form_cont">
														<label for="placeholder_sm1">상세주소를 입력해주세요</label>
														<input type="text" id="placeholder_sm1">
														<input type="hidden" id="placeholder_sm4">
													</div>
												</li>

												<li>
													<p>받으실 분</p>
													<div class="form_cont">
														<label for="placeholder_sm2">받으실 분을 입력해주세요</label>
														<input type="text" id="placeholder_sm2">
													</div>
												</li>

												<li>
													<p>연락처</p>
													<div class="form_cont">
														<label for="placeholder_sm3">연락처를 입력해주세요</label>
														<input type="text" id="placeholder_sm3">
													</div>
												</li>
											</ul>
										</div>
									</div>

									<div class="sm_btn"><button type="button">저장</button></div>
								</div>
							</div>
		
							<div class="pd_cost_result" id="pd_cost_result">
								<ul>
									<li class="pd_cost_1 clear">
										<h5>제품금액</h5>
										<p><strong id="pd_cost_total">0</strong>원</p>
									</li>
		
									<li class="pd_cost_2 clear">
										<h5>배송비</h5>
										<p><strong></strong>원</p>
									</li>
		
									<li class="pd_cost_3 clear">
										<h5>할인금액</h5>
										<p><strong>0</strong>원</p>
									</li>
		
									<li class="pd_cost_4 clear">
										<h5>결제예정금액</h5>
										<p>원</p>
										<strong id="pd_cost_total_result">0</strong>
									</li>
								</ul>
							</div>
		
							<div class="order_btn">
								<button type="button"></button>
							</div>
		
							<div class="order_caution">
								<p>- 포인트는 주문결제에서 사용 가능합니다.</p>
								<p>- ‘입금확인’상태일 때는 주문 내역 상세내역에서 직접 주문<br><span>취소가 가능합니다.</span></p>
								<p>- ‘입금확인’이후 상태에는 고객센터로 문의해주세요.</p>
							</div>
						</div>

					</div>
				</div>
			</article>
			</form>
			<c:if test="${basketSize == 0}">
				<%--
				<article class="cnt2 noti">
					<div class="area">
						<div class="real_area">
							<div class="tit clear">
								<h3>이런 제품들은 어떠세요?</h3>
								<p>MD PICK</p>
							</div>

							<div class="txt">
								<ul class="depth1 bxslider2_1_1">
									<li>
										<ul class="depth2 clear">
											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명</h4>
														<div class="price clear">
															<strong class="percent">10%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>

											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명</h4>
														<div class="price clear">
															<strong class="percent">43%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>

											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명</h4>
														<div class="price clear">
															<strong class="percent">60%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>

											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img4.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명</h4>
														<div class="price clear">
															<strong class="percent">81%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>
										</ul>
									</li>

									<li>
										<ul class="depth2 clear">
											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명</h4>
														<div class="price clear">
															<strong class="percent">10%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>

											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명</h4>
														<div class="price clear">
															<strong class="percent">43%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>

											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명</h4>
														<div class="price clear">
															<strong class="percent">60%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>

											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img4.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명</h4>
														<div class="price clear">
															<strong class="percent">81%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>
										</ul>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</article>

				<article class="cnt3 noti">
					<div class="area">
						<div class="real_area">
							<div class="tit clear">
								<h3>지금 많은 분들이 찾으시는 제품이에요.</h3>
							</div>

							<div class="txt">
								<ul class="depth1 bxslider2_1_2">
									<li>
										<ul class="depth2 clear">
											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명</h4>
														<div class="price clear">
															<strong class="percent">10%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>

											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명</h4>
														<div class="price clear">
															<strong class="percent">43%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>

											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명</h4>
														<div class="price clear">
															<strong class="percent">60%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>

											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img4.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명</h4>
														<div class="price clear">
															<strong class="percent">81%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>
										</ul>
									</li>

									<li>
										<ul class="depth2 clear">
											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명</h4>
														<div class="price clear">
															<strong class="percent">10%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>

											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명</h4>
														<div class="price clear">
															<strong class="percent">43%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>

											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명</h4>
														<div class="price clear">
															<strong class="percent">60%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>

											<li>
												<a href="">
													<div class="img">
														<img src="/resources/images/main/mn_c6_img4.jpg" width="250" height="321" border="0" alt="" />

														<div class="wish_wrap">
															<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
															<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
														</div>
													</div>

													<div class="info">
														<h4 class="pd_tit">[제조사] 제품명</h4>
														<div class="price clear">
															<strong class="percent">81%</strong>
															<p>0,000,000원</p>
														</div>
														<div class="cost"><p>0,000,000원</p></div>
													</div>
												</a>
											</li>
										</ul>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</article>
 				--%>
				<%--  히스토리 영역 시작 --%>
					<layout:historyFrame/>
				<%--  히스토리 영역 끝 --%>
			</c:if>


		</section>


	</jsp:body>
</layout:basicFrame>