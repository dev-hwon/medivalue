<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:medicashFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/clipboard@2.0.10/dist/clipboard.min.js"></script>

		<script src="https://js.tosspayments.com/v1"></script>
		<%--		<script type="text/javascript" src="https://tbnpg.settlebank.co.kr/resources/js/SettlePG.js"></script>--%>
		<script type="text/javascript">
			// 배포전 접근 제한

			//


			var orderInfo = {
				orderId: '',
				orderProc: 'PP0002',
				medicashProductId: '${medicashProductInfo.pk_idx}',
				orderType: '${medicashPaymentInfo.pk_idx}',
				orderAgree: 'N'
			}

			const bankInfoShow = () => {
				$(".clear .oit_2").show()
			}
			const bankInfoHide = () => {
				$(".clear .oit_2").hide()
			}
			const changeTaxUse = (info) => {
				if(info == 'Y'){
					$('.tax_info_li').show();
					$("#btnModi").show();
				}
				else{
					$('.tax_info_li').hide();
					$("#btnModi").hide();
				}
			}
			const editTaxInfo = () => {
				$(".form_cont_text").hide();
				$("#btnModi").hide();
				$(".form_cont").show();
				$("#btnSave").show();
			}
			const saveTaxInfo = () => {
				$("#text_fd_corporate_registration_number").text($("#fd_corporate_registration_number").val());
				$("#text_fd_corporate_registration_name").text($("#fd_corporate_registration_name").val());
				$("#text_fd_corporate_representative_name").text($("#fd_corporate_representative_name").val());
				$("#text_fd_email_info").text($("#fd_email_info").val());

				$(".form_cont_text").show();
				$("#btnModi").show();
				$(".form_cont").hide();
				$("#btnSave").hide();
			}
			const openTermsPopup = (type) => {
				$("#black").show();
				if(type == 1){
					$("#terms_popup1").show();
				}
				else if(type == 2){
					$("#terms_popup2").show();
				}
				else{
					$(".terms_popup").hide();
				}
			}
			const closeTermsPopup = () => {
				$("#black").hide();
				$(".terms_popup").hide();
			}
			const copyClipBoard = () => {
				let $temp = $("<input>");
				$("body").append($temp);
				$temp.val($("#bank_no").val()).select();
				let result = document.execCommand("copy");
				if (result) {
					alert("복사되었습니다.");
				}
				$temp.remove();
			}
			const onClickPay = () => {
				let dataChk = true;
				let msg = "";

				if($("input[name=payment_agreement_yn]:checked").val() != "Y"){
					orderInfo.orderAgree = 'N';
					msg = '개인정보 수집/제공 동의를 확인해주세요.';
					dataChk = false;
				}
				else{
					orderInfo.orderAgree = 'Y';
				}

				if($("input[name=payType]:checked").length <= 0){
					msg = '선택하신 결제수단이 없습니다.';
					dataChk = false;
				}
				<c:if test="${empty medicashPaymentInfo}">
					msg = '결제수단 정보가 없습니다.';
					dataChk = false;
				</c:if>
				<c:if test="${empty medicashProductInfo}">
					msg = '상품 정보가 없습니다.';
					dataChk = false;
				</c:if>

				if(dataChk == false){
					alert(msg);
					return false;
				}
				else{
					<c:if test="${medicashPaymentInfo.pk_idx == 1}">
						paymentCard();
					</c:if>
					<c:if test="${medicashPaymentInfo.pk_idx == 2}">
						paymentTongJang();
					</c:if>
				}
			}
			const paymentCard = () => {
				let purl = "/medicashMng/toss/payment";
				purl = purl + "?orderId=" + "${orderId}";
				purl = purl + "&total_payment=" + "${medicashProductInfo.fd_amount}";
				purl = purl + "&order_name=" + encodeURI("${medicashProductInfo.fd_product_name}");

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
			const paymentTongJang = () => {
				orderInfo.orderId = "${orderId}";
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
							} else {
								alert('상품 구매에 실패하였습니다.');
							}
							window.close();
						}
					});

				}
			}
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub2_2" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<h3>메디캐시 상품 구매</h3>

						<div class="order_pd">
							<div class="order_pd_tit clear">
								<h4>주문상품</h4>
								<button type="button"><img src="/resources/images/main/order_pd_btn.jpg" width="48" height="28" border="0" alt="" /></button>
							</div>
							<c:if test="${empty medicashProductInfo}">
								<div class="order_pd_txt">
									<h5>상품정보가 없습니다.</h5>
								</div>
							</c:if>
							<c:if test="${!empty medicashProductInfo}">
								<div class="order_pd_txt">
									<h5>[${medicashProductInfo.fd_product_name}] 상품을 주문합니다.</h5>
								</div>
							</c:if>
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
								</div>

								<div class="order_info_txt">
									<ul class="depth2">
										<li class="clear">
											<h5>주문자 명</h5>
											<p>${memberName}</p>
										</li>
										<li class="clear">
											<h5>휴대폰</h5>
											<p>${memberTel}</p>
										</li>
										<li class="clear">
											<h5>이메일</h5>
											<p>${memberEmail}</p>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</article>

			<article class="cnt3">
				<div class="area">
					<div class="real_area clear">

						<div class="left">
							<ul class="depth1">


								<li class="c3_li2">
									<div class="order_info_tit clear">
										<h4>결제수단</h4>
									</div>

									<div class="order_info_txt">
										<ul class="depth2">
											<li class="oit_1">
												<c:if test="${medicashPaymentInfo.pk_idx == 1}">
													<div class="chk_wrap chk_wrap1 clear">
														<div>
															<input type="radio" id="payType1" name="payType" value="card" checked disabled>
															<label for="payType1">신용카드</label>
														</div>
													</div>
												</c:if>
												<c:if test="${medicashPaymentInfo.pk_idx == 2}">
													<div class="chk_wrap chk_wrap2 clear">
														<div>
															<input type="radio" id="payType2" name="payType" value="transfer" checked disabled>
															<label for="payType2">계좌이체</label>
														</div>
													</div>
												</c:if>
											</li>

											<li class="clear oit_2" <c:if test="${medicashPaymentInfo.pk_idx == 2}">style="display: block;" </c:if>>
												<div class="p_wrap">
													<div class="row1">
														<p>하나은행</p>
														<p>예금주 : 메디밸류</p>
														<input type="hidden" class="bank_no" id="bank_no" value="547-910035-44104"/>
														<p>547-910035-44104
															<button class="copy_btn" onclick="copyClipBoard();">복사하기</button>
														</p>

													</div>
													<div class="row2">
														<p>입금기한</p>
														<c:set var="time" value="<%=new java.util.Date(new java.util.Date().getTime() + 60*60*24*1000 *3 )%>" />
														<p><fmt:formatDate value="${time}" pattern="yyyy년 MM월 dd일 00시 00분까지"/></p>
													</div>

												</div>
											</li>
										</ul>
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
												<p><strong><fmt:formatNumber value="${medicashProductInfo.fd_amount}" pattern="#,###" /></strong> 원</p>
											</div>
										</li>
										<li class="pd_cost_5 clear">
											<ul class="depth2">
												<li>
													<div class="pdc_li1 clear">
														<h5>최종결제금액</h5>
														<div class="wrap clear">
															<p>원</p>
															<strong><fmt:formatNumber value="${medicashProductInfo.fd_amount}" pattern="#,###" /></strong>
														</div>
													</div>
												</li>
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
						</div>
						<div class="order_info_txt">
							<div class="chk_wrap">
								<div>
									<input id="chk5" type="checkbox" name="payment_agreement_yn" value="Y">
									<label for="chk5">결제 진행 필수 동의</label>
								</div>
								<div class="p_wrap clear">
									<p>개인정보 수집 이용 및 위탁 동의 (필수)</p>
									<button type="button" class="terms_view" onclick="openTermsPopup(1);">약관보기</button>

									<div class="terms_popup" id="terms_popup1" style="width: 580px;">
										<button type="button" class="terms_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" onclick="closeTermsPopup();"/></button>
										<div class="terms_tit"><h4>개인정보 수집 이용 및 위탁 동의 <span>(필수)</span></h4></div>
										<div class="terms_txt">
												${TE0002.fd_content}
										</div>
										<button type="button" class="terms_btn" onclick="closeTermsPopup();">확인</button>
									</div>
								</div>
								<div class="p_wrap clear">
									<p>결제대행 서비스 약관 동의 (필수)</p>
									<button type="button" class="terms_view" onclick="openTermsPopup(2);">약관보기</button>
									<div class="terms_popup" id="terms_popup2" style="width: 570px;">
										<button type="button" class="terms_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" onclick="closeTermsPopup();"/></button>
										<div class="terms_tit"><h4>결제대행 서비스 약관 동의 <span>(필수)</span></h4></div>
										<div class="terms_txt">
												${TE0004.fd_content}
										</div>
										<button type="button" class="terms_btn" onclick="closeTermsPopup();">확인</button>
									</div>
								</div>
							</div>
						</div>

						<div class="clear">
							<button type="button" class="paying_btn" onclick="onClickPay()">결제하기</button>
						</div>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:medicashFrame>
