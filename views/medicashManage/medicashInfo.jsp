<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<link rel="stylesheet" href="/resources/css/quickorder.css?20220831" />
		<link rel="stylesheet" href="/resources/css/medicash.css?20230418" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">

			var orderInfo = {
				orderId: '',
				orderProc: 'PP0002',
				medicashProductId: 0,
				orderType: '',
				orderAgree: 'N'
			}
			const openLayerPop = (e) => {
				closeLayerPop();
				var target = $("."+e+"_pop.layer_pop");
				target.addClass("on");
			}
			const closeLayerPop = (e) => {
				$("#quick_order").removeClass("tutorial");
				$(e).parents(".layer_pop").removeClass("on");
				$(e).parents(".tutorial_step").removeClass("on");
				// $(".layer_pop").removeClass("on");
				// $(".tutorial_step").removeClass("on");
			}
			const popupShow = () => {
				$(".btn_info_wrap .terms_popup").show();
			}
			const popupHide = () => {
				$(".btn_info_wrap .terms_popup").hide();
			}
			const onPayment = (obj) => {
				$(".paylist li").removeClass("active");
				$(obj.parentElement).addClass("active");

				//$("input[name=mProduct]").prop('checked', false);
				$("#result_txt").text('');
				let p_type_id = obj.id.replace('pay_type_', '');
				$("#hd_pay_type").val(p_type_id);



				if(p_type_id == '2'){
					$.ajax({
						url: "/medicashMng/rest/account/info",
						method: "POST",
						contentType: "application/json",
						success: function (data) {
							if(data.rtn_code == 200){
								$("#account_info_number").text('입금계좌 : ' + data.accountInfo.fd_bank_name + ' ' + data.accountInfo.fd_account_number_format);
								$("#account_info").show();
							}
						}, error: function (error) {
							console.log(error);
						}
					});
				}
				else{
					$("#account_info").hide();
				}
				/*
					$("tfoot .tx_name").text("");
					$("tfoot .tx_msg").html("");
					$("#sel_cash").text("");
					$("#sel_point").text("");
					$("#sel_total").text("");
					$("tfoot tr").hide();
				*/
			}
			const onProduct = (obj) => {
				if($(".paylist li.active").length > 0){
					let p_id = obj.value;
					let p_name = $("#td_product_name_" + p_id).html();
					let p_amt = $("#hd_amount_" + p_id).val();
					let p_pnt = $("#hd_point_" + p_id).val();
					let p_per = $("#hd_percent_" + p_id).val();
					let total_amt = parseInt(p_amt) + parseInt(p_pnt);

					$(".package_name .tx_name").html(p_name);
					$(".selected_package_info .msg_box .tx_name").html(p_name);
					$(".selected_package_info .tx_total_price").text($("#td_amount_result_" + p_id).text());

					if(parseInt(p_per) > 0){
						$(".selected_package_info .tx_msg").html("<i>추가혜택</i>충전금액의 " + p_per + "%를 추가 지급해드려요")
					}
					else{
						$(".selected_package_info .tx_msg").html("");
					}

					$("#sel_cash").text($("#td_amount_result_" + p_id).text());
					$("#sel_point").text($("#td_point_" + p_id).text());
					$("#sel_total").text(total_amt.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원");
				}
				else{
					$("input[name=mProduct]").prop('checked', false);
					alert('결제수단을 선택해 주세요.');
				}
			}
			const payForItMedicash = (obj) => {
				if($(".paylist li.active").length <= 0) {
					alert('결제수단을 선택해 주세요.');
					return false;
				}
				else if($("input[name=mProduct]:checked").length <= 0){
					alert('상품을 선택해 주세요.');
					return false;
				}
				else if(!agreeCheck.checked){
					alert('결제 진행 필수 동의를 체크해주세요.');
					return false;
				}
				else{
					orderInfo.medicashProductId = $("input[name=mProduct]:checked").val();
					orderInfo.orderType = $("#hd_pay_type").val();
					orderInfo.orderAgree = agreeCheck.checked ? "Y":"N";

					if(orderInfo.orderType == 1){
						paymentCard();
					}
					else{
						accountTransfer();
					}

					/*
					else if(orderInfo.orderType == 2){
						accountTransfer();
					}
					else{
						paymentTongJang();
					}
				 	*/
				}
			}
			const payOnLayer = () => {
				let selected_p_id = $("#tb_product input[name=mProduct]:checked").val();

				$(".cash_package_popup .tx_payType").text($(".paylist li.active .tx_pay_type_name").text());
				$(".cash_package_popup .tx_cash").text($("#td_amount_result_" + selected_p_id).text());
				$(".cash_package_popup .tx_point").text($("#td_point_" + selected_p_id).text());
				$("#layer_total").text($("#td_amount_result_" + selected_p_id).text());

				if($("input[name=mProduct]:checked").length > 0){
					$("#pay_type_2").click();
					agreeCheck.checked = false;
					$('.cash_package_popup').addClass('on');
				}
				else{
					alert("상품을 선택해 주세요.");
				}
			}
			const paymentCard = () => {
				let purl = "/medicashMng/toss/payment";
				purl = purl + "?pt=" + orderInfo.orderType;
				purl = purl + "&pd=" + orderInfo.medicashProductId;

				let userAgent = new String(navigator.userAgent);
				let windowStatus = '';
				if (userAgent.indexOf('Trident') > 0) {
					if (userAgent.indexOf('Trident/4.0') > 0) windowStatus = 'left=100, top=100, height=1500, width=1000, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';
					else windowStatus = 'left=100, top=100, height=1500, width=1000, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';
				}
				else if (userAgent.indexOf('AppleWebKit') > 0 && userAgent.indexOf('Chrome') == -1) windowStatus = 'left=100, top=100, height=1500, width=1000, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';
				else windowStatus = 'left=100, top=100, height=1500, width=1000, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';

				let url = window.location.origin + purl;
				var mchtPopup = window.open(url, 'TOSS_PAYMENTS', windowStatus);

				//확인 필요
				setTimeout(function() {
					if (mchtPopup == null) alert("팝업 허용 해주세요");
				}, 1000);
			}
			const accountTransfer = () => {
				orderInfo.orderProc = 'PP0006';
				if(confirm("계좌이체 결제를 진행하시겠습니까?")){
					$.ajax({
						url: "/medicashMng/rest/account/order",
						method: "POST",
						contentType: "application/json",
						data: JSON.stringify(orderInfo),
						success: function (data) {
							if(data.rtn_code == 200){
								alert(data.rtn_msg);
								document.location = "/medicashMng/purchase/list";
							}
						}, error: function (error) {
							console.log(error);
							$('.cash_package_popup').removeClass('on');
						}
					});
				}

			}
			const paymentTongJang = () => {
				$.ajax({
					url: "/medicashMng/rest/mytongjang/order",
					method: "POST",
					contentType: "application/json",
					data: JSON.stringify(orderInfo),
					success: function (data) {
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
					}, error: function (error) {
						console.log(error);
					}
				})
			}
			const makeFormInput = (name, value) => {
				let settleInput = document.createElement("input");
				settleInput.setAttribute("type", "hidden");
				settleInput.setAttribute("name", name);
				settleInput.setAttribute("value", value);
				return settleInput;
			}
			var successPayment = () => {
				if(orderInfo.orderId != ''){
					$.ajax({
						url: "/medicashMng/rest/order/confirm",
						method: "POST",
						contentType: "application/json",
						data: JSON.stringify(orderInfo),
						success: function (data) {
							if (data["rtn_code"] === "200") {
								alert('상품 구매 완료되었습니다.');
								document.location = "/medicashMng/purchase/list";
							} else {
								alert('상품 구매에 실패하였습니다.');
								$('.cash_package_popup').removeClass('on');
							}
						}
					});

				}
			}
			$(document).ready(function (){
				$("input[name=mProduct]").first().click();

			})
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub_cash" class="sub" style="padding-top: 140px;">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<layout:leftMyFrame/>

							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>메디캐시</h4>
										<h4 class="tab_off" onclick="location.href='/medicashMng/purchase/list'">충전 / 취소 내역</h4>
										<div class="btn_info_wrap btn_tooltip">
											<a href="javascript:;">메디캐시 이용안내 ⓘ</a>
											<div class="terms_tooltip">
												<p class="tx_info">선불충전하고, 무료 포인트와 추가 적립 받으세요!</p>
											</div>
											<!-- 아래내용은 안씀 -->
											<div class="terms_popup">
												<div class="bg" onclick="popupHide();"></div>
												<div class="cont">
													<button class="terms_close" onclick="popupHide();"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
													<div class="terms_tit"><h5>메디캐시 이용안내</h5></div>
													<div class="terms_txt">
														<p>‘메디밸류 메디캐시’는 메디밸류 내 선불충전 캐시입니다.</p>
														<p>메디캐시</p>
														<p>메디캐시</p>
														<p>메디캐시</p>
														<p>메디캐시</p>
														<p>메디캐시</p>
													</div>
													<button class="terms_btn" onclick="popupHide();">확인</button>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="right_cont">
									<!-- 상단 배너 -->
									<div class="cash_banner">
										<img src="/resources/images/cash/top_banner.png" alt="" />
									</div>

									<!-- 결제 방식 -->
									<div class="cash_block pay_select" style="display: none;">
										<input type="hidden" id="hd_pay_type" value="${medicashPaymentList.get(0).pk_idx}">
										<p class="tx_tit">결제수단</p>
										<ul class="paylist">
											<c:if test="${!empty medicashPaymentList}">
												<c:forEach var="item" items="${medicashPaymentList}" varStatus="status">
													<li class="<c:if test="${status.index == 0}">active</c:if>"><button type="button" class="btn" id="pay_type_${item.pk_idx}" name="payType" value="0" onclick="onPayment(this);"><i class="${item.fd_ico_code}"></i><span class="tx_pay_type_name">${item.fd_payment_name}</span></button></li>
												</c:forEach>
											</c:if>
										</ul>
										<p class="tx_info">※ 계좌이체를 통한 결제 후 캐시 지급까지 약 30분 이상 소요될 수 있습니다</p>
									</div>

									<!-- 결제 패키지 -->
									<div class="cash_block cash_package">
										<p class="tx_tit">메디캐시 패키지</p>
										<div class="package_table">
											<table>
												<colgroup>
													<col width="70">
													<col>
													<col width="160">
													<col width="170">
													<col width="150">
													<col width="150">
												</colgroup>
												<thead>
													<tr class="thead">
														<th class="tx_checkbox">선택</th>
														<th class="tx_name">상품명</th>
														<th class="tx_cash">충전금</th>
														<th class="tx_point">추가혜택</th>
														<th class="tx_save">적립률</th>
														<th class="tx_price">결제금액</th>
													</tr>
												</thead>
												<tbody id="tb_product">
													<c:if test="${empty medicashProductList}">
														<tr>
															<td colspan="6" style="text-align: center;">구매 가능한 상품이 없습니다.</td>
														</tr>
													</c:if>
													<c:if test="${!empty medicashProductList}">
														<c:forEach var="item" items="${medicashProductList}">
															<tr id="tr_product_${item.pk_idx}">
																<td class="tx_checkbox ipt_radio">
																	<label class="label_radio">
																		<input type="radio" id="mp_${item.pk_idx}" name="mProduct" value="${item.pk_idx}" onclick="onProduct(this);"><span></span>
																	</label>
																	<input type="hidden" id="hd_amount_${item.pk_idx}" value="${item.fd_amount}" />
																	<input type="hidden" id="hd_point_${item.pk_idx}" value="${item.fd_point}" />
																	<input type="hidden" id="hd_percent_${item.pk_idx}" value="${item.fd_point_percent}" />
																</td>
																<td class="tx_name" id="td_product_name_${item.pk_idx}">
																	<c:if test="${item.fd_product_type == 2}"><strong>[첫결제]</strong></c:if>
																	<c:if test="${item.fd_product_type == 3}"><strong>[추천]</strong></c:if>
																	<c:if test="${item.fd_product_type == 4}"><strong>[BEST]</strong></c:if>
																	${item.fd_product_name}
																</td>
																<td class="tx_cash" id="td_amount_result_${item.pk_idx}">${item.pt_fd_amount_result}원</td>
																<td class="tx_point" id="td_point_${item.pk_idx}">${item.pt_fd_point ne "0" ? item.pt_fd_point += "원" : "-"}</td>
																<td class="tx_save" id="td_percent_${item.pk_idx}">
																	<c:choose>
																		<c:when test="${item.fd_use_point_accent == 'Y'}">
																			<p><fmt:formatNumber type="number" value="${item.fd_point_percent / 2}" />% + <fmt:formatNumber type="number" value="${item.fd_point_percent / 2}" />%</p>
																		</c:when>
																		<c:otherwise>
																			<fmt:formatNumber type="number" value="${item.fd_point_percent ne '0' ? item.fd_point_percent : ''}" />
																			${item.fd_point_percent eq '0' ? '-' : '%'}
																		</c:otherwise>
																	</c:choose>
																</td>
																<td class="tx_price" id="td_amount_${item.pk_idx}">${item.pt_fd_amount}원</td>
															</tr>
														</c:forEach>
													</c:if>

												</tbody>
											</table>
										</div>
									</div>
									<!--// -->


									<!-- 토탈 & 결제하기 -->
									<div class="selected_package_info">
										<div class="result">
											<div class="msg_box">
												<p class="tx">선택한 상품</p>
												<p class="tx_name"></p>
												<p class="tx_msg"></p>
											</div>
											<div class="result_dashboard">
												<div class="receipt_list">
													<ul>
														<li>
															<div class="tx_name">충전금</div>
															<div class="tx_val" id="sel_cash"></div>
														</li>
														<li>
															<div class="tx_name">추가혜택</div>
															<div class="tx_val" id="sel_point"></div>
														</li>
														<li>
															<div class="tx_name">지급 방법</div>
															<div class="tx_val">무료포인트</div>
														</li>
													</ul>
													<ul class="total">
														<li>
															<div class="tx_name">총 혜택 금액</div>
															<div class="tx_val" id="sel_total"></div>
														</li>
													</ul>
												</div>

												<div class="area_payment">
													<div class="area_payment_top">
														<div class="tx">총 결제 금액</div>
														<div class="tx_total_price"></div>
													</div>
													<button type="button" onclick="payOnLayer();">결제하기</button>
												</div>
											</div>
										</div>
									</div>

									<!-- 참고 -->
									<div class="cash_block cash_notice">
										<dl class="notice">
											<dt>▶ 참고해주세요</dt>
											<dd>
												<ol>
													<li>본 상품의 결제수단은 ‘계좌이체’입니다.</li>
													<li>무료포인트 아래의 방법으로 사용할 수 있습니다.
														<ul>
															<li>-MV재료 상품 구매 시 사용(5% 제한) <a href="/quickOrder/info?func=quickorder">[MV재료 이용방법 확인]</a></li>
															<li>-MV기공 간편수가 열람 확인 시 사용</li>
														</ul>
													</li>
													<li>결제 후 사용내역이 없을 경우 당월 중 환불이 가능합니다.</li>
													<li>결제 취소는 고객센터를 통해 문의해주시기 바랍니다. <a href="#" onclick="onChatTalk()">[고객센터 문의하기]</a></li>
													<li>메디캐시를 통한 상품 구매시 적립률은 2%, OK 캐시백은 1% 입니다.</li>
													<li>지급 혜택은 내부 사정에 따라 변동 될 수 있습니다.<br>
														<span class="tx_noti tx_red">※ 지급된 포인트를 사용하신 경우 환불이 불가할 수 있습니다.</span>
													</li>
												</ol>
											</dd>
										</dl>
									</div>
									<!--// -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
			<!-- [외주] 메디캐시 : 선택시 결제창 -->
			<!-- 기존 팝업 사용, 클래스 추가(신규) .cash_package_popup, @medicash.css -->
			<div class="layer_pop cash_package_popup">
				<div class="bg_area" onclick="$(this).closest('.layer_pop').removeClass('on');"></div>
				<div class="layer_pop_inner">
					<div class="btn_close_wrap">
						<button type="button" class="btn_close" onclick="$(this).closest('.layer_pop').removeClass('on');"></button>
					</div>
					<div class="cont">
						<div class="head">
							<div class="head_inner">
								<p class="tx_tit">메디캐시 결제</p>
							</div>
						</div>
						<div class="body">
							<div class="body_inner">
								<div class="package_name">
									<p class="tx_name"></p>
								</div>
								<div class="package_cont">
									<ul>
										<li>
											<div class="tx_name">선택한 수단</div>
											<div class="tx_val tx_payType"></div>
										</li>
										<li>
											<div class="tx_name">충전금</div>
											<div class="tx_val tx_cash"></div>
										</li>
										<li class="item_point">
											<div class="tx_name">추가혜택</div>
											<div class="tx_val tx_point"></div>
										</li>
										<li class="item_total_price">
											<div class="tx_name">결제금액</div>
											<div class="tx_val" id="layer_total"></div>
										</li>
									</ul>
								</div>
								<div class="package_common_info">
									<!-- 계좌번호 (계좌이체선택시 노출) -->
									<div id="account_info" style="display: none; margin-bottom:32px;">
										<p class="tx_tit">계좌번호</p>
										<div class="account_info" style="padding-left:24px;">
											<div style="margin-bottom: 4px;" id="account_info_name">예금주 : 메디밸류</div>
											<div id="account_info_number">입금계좌 : </div>
										</div>
									</div>
									<div class="privacy_chk">
										<p class="tx_tit">개인정보 수집/제공</p>
										<label class="label_chk">
											<input type="checkbox" id="agreeCheck"><span>결제 진행 필수 동의</span>
										</label>
										<div class="terms_wrap">
											<ul>
												<li>
													<div>
														<div class="txt">개인정보 수집 이용 및 위탁 동의 (필수)</div>
														<a href="javascript:;" class="btn_terms g_q_o_pop_b_user_agree_view_1" onclick="openLayerPop('personal_terms');">약관보기</a>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="package_agree_desc">
									위 주문 내용을 확인 하였으며, 회원 본인은 결제에 동의합니다.
								</div>
							</div>
						</div>
					</div>

					<div class="btn_wrap">
						<button type="button" class="btn_blue" onclick="payForItMedicash()">결제하기</button>
					</div>
				</div>
			</div>
			<div class="terms_pop personal_terms_pop layer_pop">
				<div class="bg_area" onclick="closeLayerPop(this);"></div>
				<div class="layer_pop_inner">
					<div class="btn_close_wrap">
						<button class="btn_close" onclick="closeLayerPop(this);"></button>
					</div>
					<div class="cont">
						<div class="head">
							<div class="head_inner">
								<div class="title">개인정보 수집 이용 및 위탁 동의</div>
							</div>
						</div>
						<div class="body">
							<div class="body_inner">
								<div class="col">
									<div class="terms_txt">
										<p>개인정보처리방침</p>
										<p>&lt;(주)메디밸류&gt;('http://www.medivalue.co.kr'이하 '회사')은(는) 「개인정보 보호법」 제30조에 따라 정부주체의
											개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립 · 공개합니다. 이
											개인정보처리방침은 2021년 6월 1부터 적용됩니다.</p>
										<h5>제1조(개인정보의 처리 목적)</h5>
										<p>회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 겨우에는
											법률에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.1. 회원가입 및 관리<br>회원 가입의사 확인, 회원제 서비스 제공에 따른 본인
											식별 · 인증, 회원자격 유지 · 관리, 서비스 부정이용 방지, 비인가 사용방지 및 서비스 제공 및 계약의 이행, 각종 고지 · 통지, 서비스 이용 및
											상담, 문의 등 원활한 의사소통 경로 확보, 맞춤형 회원 서비스 제공, 거점 기반 서비스 제공, 고충처리 목적 등으로 개인정보를 처리합니다.<br>2.
											재화 또는 서비스 제공<br>물품배송, 서비스 제공, 계약서 · 청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 요금결제 · 정산을 목적으로
											개인정보를 처리합니다.<br>3. 마케팅 및 광고에의 활용신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회
											제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로
											개인정보를 처리합니다.</p>
										<h5>제2조(개인정보의 처리 및 보유 기간)</h5>
										<p>1. 회사는 법령에 따른 개인정보 보유 · 이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유 · 이용기간 내에서 개인정보를 처리
											· 보유합니다.<br>2. 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br>①홈페이지 회원가입 및 관리: 회원 탈퇴 시까지<br>다만,
											다음의 사유에 해당하는 경우에는 해당 사유 종료시까지<br>-관계 법령 위반에 따른 수사조사 등이 진행 중인 경우에는 해당 수사조사 종료
											시까지<br>-홈페이지 이용에 따른 채권 채무관계 잔존 시에는 해당 채권 채무관계 정산시까지<br>②재화 또는 서비스 제공: 재화·서비스 공급완료 및
											요금결제·정산 완료시까지<br>다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료 시까지<br>-『전자상거래 등에서 소비자 보호에 관한
											법률』<br>①계약 또는 청약철회 등에 관한 기록: 5년<br>②대금결제 및 재화 등의 공급에 관한 기록: 5년<br>③소비자의 불만 또는 분쟁처리에
											관한 기록: 3년<br>④표시·광고에 관한 기록: 6개월<br>-『정보통신 이용촉진 및 정보보호 등에 관한 법률』<br>본인 확인에 대한 기록:
											6개월<br>- 『통신비밀보호법』<br>인터넷 로그기록자료, 접속지 추적자료: 3개월</p>
										<h5>제3조(개인정보의 제3자 제공)</h5>
										<p>1. 회사는 인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」
											제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.<br>2.단, 원활한 서비스 제공을 위해 상품 구매 시 서비스 제공 업체로
											이용자의 개인정보를 제3자 제공에 동의하는 경우에는 서비스 제공 및 배송, 본인확인 등을 위하여 필요한 최소한의 개인정보만을 서비스 제공 업체에게
											제공합니다.<br>판매업체<br>-개인정보를 제공받는 자 : 판매업체<br>-제공받는 자의 개인정보 이용목적 : 서비스 제공 및 배송<br>-제공하는
											개인정보 항목: 로그인ID, 성명, 주소, 전화번호, 메일주소, 구매상품정보, 의료기관명, 의료기관전화번호, 은행계좌정보<br>-제공받는 자의
											보유.이용기간: 구매완료일로부터 5년</p>
										<h5>제4조(개인정보처리 위탁)</h5>
										<p>1. 회사는 활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br>-결제 서비스<br>-위탁받는 자 (수탁자) :
											토스페이먼트(주)<br>-위탁하는 업무의 내용 : 구매 및 요금 결제<br>2. 회사는 위탁계약 체결시 「개인정보 보호법」 제26조에 따라 위탁업무
											수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에
											명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.<br>3. 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보
											처리방침을 통하여 공개하도록 하겠습니다.<br>제5조(정보주체와 법정대리인의 권리·의무 및 그 행사방법)<br>1. 정보주체는 회사에 대해 언제든지
											개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.<br>2. 1항에 따른 권리 행사는 회사에 대해 「개인정보 보호법」 시행령
											제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 회사는 이에 대해 지체 없이 조치하겠습니다.<br>3.제1항에
											따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한
											고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.<br>4.개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조
											제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.<br>5.개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집
											대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.<br>6.회사는 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구
											시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.<br>제6조(처리하는 개인정보의 항목 작성)<br>1. 회사는 다음의 개인정보
											항목을 처리하고 있습니다.<br>-홈페이지 회원 가입 및 관리<br>필수항목 : 로그인ID, 이름, 면허번호, 의료기관명, 생년월일, 이메일, 주소,
											전화번호, 휴대폰, 요양기관기호 및 명칭, 담당자명<br>선택항목 : 추천인<br>-재화 또는 서비스 제공<br>필수항목 : 로그인ID, 이름,
											면허번호, 의료기관명, 생년월일, 이메일, 주소, 전화번호, 휴대폰, 상호, 사업자번호 및 사업자등록정보, 사업자 주소, 은행계좌정보, 요양기관기호 및
											명칭, 담당자명<br>선택항목 : 추천인<br>-회사의 서비스 이용과정에서 IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 블랑 이용기록,
											모바일 기기정보(앱 버전, OS버전), ADID/IDFA(광고식별자)등의 정보가 자동으로 생성되어 수집될 수 있습니다.<br>-진행하는 이벤트에 따라
											수집항목이 상이할 수 있으므로 응모 시 별도 동의를 받으며, 목적 달성 즉시 파기합니다.<br></p>
										<h5>제7조(개인정보의 파기)</h5>
										<p>1.회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.<br>2.이용자로부터
											동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를
											별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다. 별도 보존되는 개인정보는 법률에 의한 경우가 아니고서는 보존목적 이외의 다른
											목적으로 이용되지 않습니다.<br>3.개인정보 파기의 절차 및 방법은 다음과 같습니다.<br>①파기절차<br>회사는 파기 사유가 발생한 개인정보를
											선정하고, 회사의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.<br>②파기방법<br>-회사는 전자적 파일 형태의 정보는 기록을 재생할 수
											없는 기술적 방법을 사용합니다.<br>-종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다</p>
										<h5>제8조(개인정보의 안전성 확보 조치)</h5>
										<p>회사는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.<br>1.관리적 조치: 내부관리계획 수립 시행, 정기적 직원 교육
											등<br>2.기술적 조치: 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정도 등의 암호화, 보안프로그램 설치등<br>3.물리적
											조치: 전산실, 자료보관실 등의 접근 통제</p>
										<h5>제9조(개인정보 자동 수집 장치의 설치•운영 및 거부에 관한 사항)</h5>
										<p>1.(주)메디밸류 은(는) 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를
											사용합니다.<br>2.쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC
											컴퓨터내의 하드디스크에 저장되기도 합니다.<br>-쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기
											검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.<br>-쿠키의 설치•운영 및 거부 : 웹브라우저 상단의
											도구&gt;인터넷 옵션&gt;개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다. 다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에
											어려움이 발생할 수 있습니다.</p>
										<h5>제10조 (개인정보 보호책임자)</h5>
										<p>1. (주)메디밸류 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와
											같이 개인정보 보호책임자를 지정하고 있습니다.<br>-개인정보 보호책임자<br>•성명 :홍하석<br>•직책 :개발<br>•직급 :팀장<br>•연락처 :
											info@medivalue.co.kr,<br>-개인정보 보호 담당부서<br>•부서명 :개발팀<br>•담당자 :홍하석<br>•연락처 :
											info@medivalue.co.kr,<br>2.이용자께서는 회사의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제
											등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 회사는 사용자의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.<br>
										</p>
										<h5>제11조(개인정보 열람청구)</h5>
										<p>정보주체는 ｢개인정보 보호법｣ 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.<br>회사는 정보주체의 개인정보 열람청구가 신속하게
											처리되도록 노력하겠습니다.<br>-개인정보 열람청구 접수·처리 부서<br>•부서명 : 개발팀<br>•담당자 : 홍하석<br>•연락처 :
											info@medivalue.co.kr,</p>
										<h5>제12조(권익침해 구제방법)</h5>
										<p>사용자는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수
											있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다.<br>1. 개인정보분쟁조정위원회 : (국번없이)
											1833-6972 (www.kopico.go.kr)<br>2. 개인정보침해신고센터 : (국번없이) 118
											(privacy.kisa.or.kr)<br>3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr)<br>4. 경찰청 : (국번없이) 182
											(cyberbureau.police.go.kr)<br>「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의
											처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는
											바에 따라 행정심판을 청구할 수 있습니다.<br>※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr) 홈페이지를
											참고하시기 바랍니다.</p>
										<h5>제13조(개인정보 처리방침 변경)</h5>
										<p>본 개인정보 처리방침을 개정할 경우에는 최소 7일전에 홈페이지 또는 이메일을 통해 변경 및 내용 등을 공지하겠습니다. 다만 이용자의 소중한 권리 또는
											의무에 중요한 내용변경이 발생하는 경우 시행일로부터 최소 30일 전에 공지하도록 하겠습니다.<br>이 개인정보처리방침은 2021년 6월 1부터
											적용됩니다.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="btn_wrap">
						<button class="btn_blue" onclick="closeLayerPop(this);">확인</button>
					</div>
				</div>
			</div>
		</section>
	</jsp:body>
</layout:basicFrame>
