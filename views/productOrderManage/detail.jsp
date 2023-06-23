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
		<script src="https://js.tosspayments.com/v1"></script>

<%--		<script src="https://tbezauth.settlebank.co.kr/js/SettlePay.js"></script>--%>

		<script type="text/javascript">
			function printIt(printThis){
			    var win = null;
			    win = window.open();
			    self.focus();
			    win.document.open();
			    win.document.write(printThis);
			    win.document.close();
			    win.print();
			    win.close();
			}

			var signInPopup = {
				showMessage: function (msg) {
					$("#pop_alarm_msg").text(msg);
					$("#black").show();
					$(".popup_message_type_1").show();
				}
			};

			$(document).ready(function (){
				let error = '${error}';
				let code = '${code}';
				let errorMessage = '${errorMessage}';
				let successMessage = '${successMessage}';
				if (error) {
					if (errorMessage !== '') {
						signInPopup.showMessage('카드 결제 실패 - ' + errorMessage);
					} else if (code === "508") {
						signInPopup.showMessage('결제 진행 중 문제가 발생했습니다. 고객센터로 연락 부탁드립니다.');
					} else {
						signInPopup.showMessage('카드 결제 진행중에 문제가 발생했습니다. 다시 시도해주세요.');
					}
				} else if (code === "201") {
					signInPopup.showMessage("카드 결제가 정상 처리되었습니다.");
				}

				var $oitBtn2=$("#sub3_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt2 .rt_c2_depth1 > li.rt_c2_li2 .order_info_tit > button");
				var $oitClose2=$("#sub3_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt2 .rt_c2_depth1 > li.rt_c2_li2 .order_info_tit .oit_popup .oit_popup_wrap .oit_close");
				var $ppBtn=$("#sub3_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt2 .rt_c2_depth1 > li.rt_c2_li3 .p_wrap_right > .p_wrap .chk_stat");
				var $ppClose=$("#sub3_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt2 .rt_c2_depth1 > li.rt_c2_li3 .p_wrap_right > .p_wrap .print_popup .pp_close");
				var $s32storeBtn=$("#sub3_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 > div > .pd_tit > p > button");
				var $s32storeClose=$("#sub3_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 > div > .pd_tit .store_popup .store_pu_close");

				$s32storeBtn.on("click", function  () {
					$(this).parent().next().css("display","block");
					$("#black").css("display","block");
				});

				$s32storeClose.on("click", function  () {
					$(this).parent().css("display","none");
					$("#black").css("display","none");
				});

				$("#sub3_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 > div > .pd_tit .store_popup .store_pu_ok").on("click", function  () {
					$s32storeClose.click()
				});

				$("#sub3_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 > div > .pd_tit .store_popup .spu_tab_split .spu_tab_btn > li button").on("click", function  () {
					var tgIdx=$(this).parent().index();

					$(this).parent().addClass("on").siblings().removeClass("on");
					$(this).closest(".spu_tab_split").find(">.spu_tab_cnt>div").eq(tgIdx).show().siblings().hide();
					
					return false;
				});

				$ppBtn.on("click", function  () {
					$(this).next().css("display","block");
					$("#black").css("display","block");
				});

				$ppClose.on("click", function  () {
					$(this).parent().css("display","none");
					$("#black").css("display","none");
				});

				$("#sub3_2 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt2 .rt_c2_depth1 > li.rt_c2_li3 .p_wrap_right > .p_wrap .print_popup .pp_btn .pp_btn2").on("click", function  () {
					$ppClose.click()
				});

				$oitBtn2.on("click", function  () {
					$(this).next().css("display","block")
				});

				$oitClose2.on("click", function  () {
					$(this).closest(".oit_popup").css("display","none")
				});

				$("#black").on("click", function  () {
					$ppClose.click();
					$s32storeClose.click()
				});

				let login_check = '${login_check}';
				if (login_check === 'N') {
					// alert("로그인 후에 이용 가능합니다.");
					location.replace("/access/login");
				}

				let rtn_code = '${rtn_code}';
				let rtn_msg = '${rtn_msg}';
				if (rtn_code != '200') {
					signInPopup.showMessage(rtn_msg);
					$("#btn_ok").on("click", function () {
						location.replace("/order/list");
					});
				} else if (rtn_code == '201') {
					signInPopup.showMessage(rtn_msg);
				}

				$("#copy_btn").on("click", function () {
					var $temp = $("<input>");
					$("body").append($temp);
					$temp.val($("#bank_no").text()).select();
					let result = document.execCommand("copy");
					if (result) {
						signInPopup.showMessage("복사되었습니다.");
					}
					$temp.remove();
				});

				$(".cart_btn").on("click", function () {
					// let pk_idx = $(this).parent().children("input[name='tpsm_idx']").val();
					let tpmm_idx = $(this).parent().children("input[name='tpmm_idx']").val();
					let product_name = $(this).parent().children("input[name='product_name']").val();
					let cnt = 1;

					// let formData = {};
					// formData['list['+0+'].fk_tpsm_idx'] = pk_idx;
					// formData['list['+0+'].cnt'] = cnt;

					var req_data = [{
						tpmm_idx: tpmm_idx,
						cnt: cnt
					}];

					$.ajax({
						url: '/quickOrder/rest/cart/save',
						type: 'post',
						cache: false,
						data: JSON.stringify({cart_list: req_data}),
						dataType: 'json',
						contentType: 'application/json',
						success: function (data) {
							if (data.rtn_cd == '200') {
								//labbit_add_to_cart(data.productInfoList);
								let pd_title = product_name;
								let pd_cnt = 1;
								popAlarm3(pd_title, pd_cnt, data['basket_list_size']);
								labbit_add_to_cart(data.basket_save_list);
							} else {
								alert(data['rtn_msg']);
							}
						}
					});
				});

				$(".buy_btn").on("click", function () {
					let pk_idx = $(this).parent().children("input[name='tpsm_idx']").val();
					let product_name = $(this).parent().children("input[name='product_name']").val();
					let cnt = 1;

					let formData = {};
					formData['list['+0+'].fk_tpsm_idx'] = pk_idx;
					formData['list['+0+'].cnt'] = cnt;

					//google tag manager
					$.ajax({
						url : '/basket/rest/save',
						type : 'post',
						cache : false,
						data : formData,
						dataType : 'json',
						success:function(data){
							if(data.rtn_code == '200'){
								// let pd_title = product_name;
								// let pd_cnt = 1;
								// popAlarm(pd_title, pd_cnt);
								// labbit_add_to_cart(data.productInfoList);
								location.href="/product/basket/list?pk_idx=" + pk_idx;
							}else{
								alert(data.rtn_msg);
							}
						},
						error:function(request,status,error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

						}
					});
				});

				$(".all_cart").on("click", function () {
					var product_name = "";
					var req_data = [];
					// let pkList = "";
					let pd_cnt = 0;
					$("ul.rt_c1_depth1").find("input[name='tpsm_idx']").each(function (index, value) {
						// if (index == 0) {
						// 	product_name = $(value).parent().children("input[name='product_name']").val();
						// 	console.log(product_name);
						// }						
						product_name = $(value).parent().children("input[name='product_name']").val();
						let tpmm_idx = $(this).parent().children("input[name='tpmm_idx']").val();
						let cnt = 1;
						req_data.push({
							tpmm_idx: tpmm_idx,
							cnt: cnt
						})
						pd_cnt++;
						// if (index == 0) {
						// 	pkList += "pk_idx=" + pk_idx;
						// } else {
						// 	pkList += "&pk_idx=" + pk_idx;
						// }
					});
					if(pd_cnt>=1){
						//google tag manager
						$.ajax({
							url: '/quickOrder/rest/cart/save',
							type: 'post',
							cache: false,
							data: JSON.stringify({cart_list: req_data}),
							dataType: 'json',
							contentType: 'application/json',
							success: function (data) {
								if (data.rtn_cd == '200') {
									//labbit_add_to_cart(data.productInfoList);
									let pd_title = product_name;
									let pd_cnt = 1;
									popAlarm3(pd_title, pd_cnt, data['basket_list_size']);
									labbit_add_to_cart(data.basket_save_list);
								} else {
									alert(data['rtn_msg']);
								}
							}
						});
					}else{
						signInPopup.showMessage('제품 정보를 확인해주세요.');
						proc_state = true;
					}
					
				});

				$("#question").on("click", function () {
					location.href = "/member/mypage/question/write";
				});

				$("#card_stat").on("click", function () {
					let card_info_receiptUrl = '${paymentInfo.fd_card_info_receiptUrl}';
					window.open(card_info_receiptUrl, '카드결제내용', 'width=700px,height=800px,scrollbars=yes');
				});

				$("#bank_stat").on("click", function () {
					let trDay = '${productOrderInfo.fd_date}';
					let orderId = '${orderId}';
					$.ajax({
						url: '/order/rest/settlebank/bank/' + orderId + '/' + trDay,
						method: 'POST',
						content: 'application/json',
						accept: '*/*',
						success: function (data) {
							if (data['rtn_code'] == '200') {
								var el = document.getElementsByTagName("body")[0];
								var settleForm = document.createElement("form");
								settleForm.setAttribute("id", "SETTLEBANK_FORM");
								settleForm.setAttribute("name", "SETTLEBANK_FORM");
								settleForm.setAttribute("target", "SETTLEBANK_FORM");
								settleForm.setAttribute("method", "POST");
								settleForm.setAttribute("action", data['action']);

								for (var key in data) {
									settleForm.appendChild(makeFormInput(key, data[key]));
								}

								el.appendChild(settleForm);

								var userAgent = new String(navigator.userAgent);
								var mobilePhones = new Array('iphone', 'ipod', 'android', 'blackberry', 'windows ce', 'nokia', 'webos', 'opera mini', 'sonyericsson', 'opera mobi', 'iemobile', 'windows phone', 'test_app');
								var isMobile = false;

								for (var i = 0; i < mobilePhones.length; ++i) {
									if (userAgent.toLowerCase().indexOf(mobilePhones[i]) > -1) {
										isMobile = true;
										break;
									}
								}
								if (!isMobile) {
									var windowStatus = '';
									if (userAgent.indexOf('Trident') > 0) {
										if (userAgent.indexOf('Trident/4.0') > 0) windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';
										else windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=yes, status=no, titlebar=no, toolbar=no, resizable=no';
									} else if (userAgent.indexOf('AppleWebKit') > 0 && userAgent.indexOf('Chrome') == -1) windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';
									else windowStatus = 'left=100, top=100, height=720, width=420, location=no, menubar=no, scrollbars=auto, status=no, titlebar=no, toolbar=no, resizable=no';

									var mchtPopup = window.open('', 'SETTLEBANK_FORM', windowStatus);
									setTimeout(function () {
										if (mchtPopup == null) alert("팝업 허용 해주세요");
										else settleForm.submit();
									}, 1000);
								} else {
									settleForm.submit();
								}
							} else {
								signInPopup.showMessage(data['rtn_msg']);
							}
						}

					});
				});

				$("#card_btn").on("click", function () {
					$("#pop_alarm_msg_2").text("카드 결제를 진행하시겠습니까?");
					$(".popup_message_type_2").show();
					$("#black").show();
				});

				$(".le_ok").on("click", function () {

					$(".popup_message_type_2").hide();
					$("#black").hide();

					let proc_state = true;
					let orderId = '${orderId}';
					if (orderId != null && orderId != '') {

						if(proc_state){
							proc_state = false;
							// var formData = $("#f_order").serialize();
							$.ajax({
								url : '/order/rest/payment/change/' + orderId,
								type : 'post',
								contentType: 'application/json',
								cache : false,
								dataType : 'json',
								success:function(data){
									if(data.rtn_code != '200'){
										signInPopup.showMessage('결제 실패 다시 시도해주세요.');
										proc_state = true;
									}else{
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
									}
								},
								error:function(request,status,error){
									signInPopup.showMessage('네트워크 환경을 확인해주세요.');
									// $("#alarm_msg").text("네트워크 환경을 확인해주세요.");
									// $("#notice_view").addClass('on');
									proc_state = true;
								}
							});
						}else{
							signInPopup.showMessage('주문 처리 중 입니다.');
							// $("#alarm_msg").text("주문 처리 중 입니다.");
							// $("#notice_view").addClass('on');
						}


					} else {
						$("#pop_alarm_msg_2").text("주문 번호가 잘못되었습니다.");
						$(".popup_message_type_2").show();
						$("#black").show();
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

			});

			function makeFormInput(name, value){

				var settleInput = document.createElement("input");

				settleInput.setAttribute("type", "hidden");
				settleInput.setAttribute("name", name);
				settleInput.setAttribute("value", value);

				return settleInput;
			}

			// [flow:2265] 주문내역 > 상품이미지 클릭시 빠른주문이동 22.05.03
			function moveQuickOrder(idx) {				
				$("#searchSelectIdx").val("DETAIL:" + idx);
				$("#frm_top_search").submit();
			}
			
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub3_2" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<layout:leftMyFrame/>
							</div>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>주문내역 상세</h4>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">

<%--										<h5>[주문내역] TITAN X 외 2</h5>--%>

<%--										<c:forEach var="item" items="${productOrderShopInfoList}">--%>
<%--											<c:set var="shop" value="${item.shopInfo}"/>--%>
										<div class="sp_pd_wrap pd_wrap">
											<div class="sp_pd_tit pd_tit clear">
												<h6>주문목록</h6>
<%--												<p>판매자 : <button><span><c:out value="${shop.fd_shop_name}"/></span><img src="/resources/images/main/info_icon2.jpg" width="16" height="16" border="0" alt="" /></button></p>--%>
	
												<div class="store_popup">
													<button class="store_pu_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>
	
													<div class="spu_tab_split">
														<ul class="spu_tab_btn clear">
															<li class="spu_tab_tab1 on"><button>판매점 정보</button></li>
<%--															<li class="spu_tab_tab2"><button>판매점 공지</button></li>--%>
															<li class="spu_tab_tab3"><button>취소&middot;반품</button></li>
														</ul>
	
														<div class="spu_tab_cnt">
															<div class="spu_tab_cnt1">
																<ul>
																	<li class="clear">
																		<h6>판매점</h6>
																		<p><c:out value="${shop.fd_shop_name}"/></p>
																	</li>
	
																	<li class="clear">
																		<h6>영업시간</h6>
<%--																		<p>am9:00 ~ pm6:00</p>--%>
																		<p><c:out value="${shop.fd_corporate_open_time}"/></p>
																	</li>
	
																	<li class="clear">
																		<h6>이메일</h6>
<%--																		<p><c:out value="${shop.fd_email_info_desc}"/></p>--%>
																		<p></p>
																	</li>
	
																	<li class="clear">
																		<h6>전화번호</h6>
																		<p><c:out value="${shop.fd_tel_nomal_desc}"/></p>
																	</li>
	
																	<li class="clear">
																		<h6>휴무일</h6>
																		<p><c:out value="${shop.fd_corporate_holiday_info}"/></p>
																	</li>
	
																	<li class="clear">
																		<h6>배송방법</h6>
																		<p>택배, 퀵서비스, 직접수령</p>
																	</li>
	
																	<li class="clear">
																		<h6>주소</h6>
																		<p><c:out value="${shop.fd_corporate_addr}"/></p>
																	</li>
																</ul>
															</div>
	
															<div class="spu_tab_cnt3">
																<ul>
																	<li class="clear">
																		<h6>배송정책</h6>
																		<p>주문마감 11시 / 발송까지 주말 제외 최소 3일 이상</p>
																	</li>

																	<li class="li_h100 clear">
																		<h6>A/S 정책</h6>
																		<p>구매일로부터 15일 이내<br>무상 교체해드립니다.</p>
																	</li>

																	<li class="li_h100 clear">
																		<h6>취소/반품</h6>
																		<p>상품 외 문제의 경우<br>택배비 왕복 부담<br><br>교환 및 환불시에는 직접 환불 접수하여야 합니다.<br><br>소비자 변심에 의한 반품되는 경우<br>판매금액의 10% 제외 후 환불됩니다.</p>
																	</li>

																	<li class="clear">
																		<h6>이메일</h6>
<%--																		<p><c:out value="${shop.fd_email_info_desc}"/></p>--%>
																		<p></p>
																	</li>

																	<li class="clear">
																		<h6>전화번호</h6>
																		<p><c:out value="${shop.fd_tel_nomal_desc}"/></p>
																	</li>

																	<li class="clear">
																		<h6>휴무일</h6>
																		<p><c:out value="${shop.fd_corporate_holiday_info}"/></p>
																	</li>

																	<li class="clear">
																		<h6>배송방법</h6>
																		<p>택배, 퀵서비스, 직접수령</p>
																	</li>

																	<li class="clear">
																		<h6>주소</h6>
																		<p><c:out value="${shop.fd_corporate_addr}"/></p>
																	</li>
																</ul>
																<%--
																<a href="/member/mypage/question/write" class="one_inq">1:1문의하기</a>
																<p>판매점에 문의하시면 빠른 답변 가능합니다.</p>
																 --%>
															</div>
														</div>
													</div>
	
													<button class="store_pu_ok">확인</button>
												</div>
											</div>
										
											<div class="sp_pd_list pd_list">
												<ul class="rt_c1_depth1">
														<c:forEach var="product" items="${productInfoList}">
														<li class="clear <c:if test="${product.fd_option_count > 0}">option </c:if> <c:if test="${!empty product.fd_product_insure_code}">insure</c:if> ">
															<div class="img <c:if test="${product.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${product.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
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
																<%-- <a href="/product/detail?req_view_idx=<c:out value="${product.fk_tpsm_idx}"/>"> --%> 
																<a href="javascript:void(0);" onclick="moveQuickOrder(${product.fk_tpmm_idx});" />																
																<c:choose>
																	<c:when test="${!empty product.fd_img_path_thumbnail}">
																		<img src="<c:out value="${product.fd_img_path_thumbnail}"/>" width="250" height="321" border="0" alt="" />
																	</c:when>
																	<c:when test="${!empty product.fd_img_path}">
																		<img src="<c:out value="${product.fd_img_path}"/>" width="250" height="321" border="0" alt="" />
																	</c:when>
																	<c:otherwise>
																		<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																	</c:otherwise>
																</c:choose>
																</a>
															</div>
															<div class="pd_info">
																<ul class="rt_depth2 clear">
																	<li class="rt_depth2_li1 clear" <c:if test="${member_paymentMethod eq 'PM0002'}" >style="width: 65%;display: -webkit-inline-box;"</c:if>> 
																	<%-- productOrderInfo <c:if test="${productOrderInfo.fd_payment_method eq 'PM0001'}"> --%>
																		<h6>제품명</h6>
																		<p><c:out value="${product.fd_product_name}"/></p>
																	</li>
																	<c:if test="${member_paymentMethod eq 'PM0002'}" >
																		<li class="rt_depth2_li3 clear" style="margin-top: 0px;">
																			<h6>결제방식</h6>
																			<p>
																			   <c:if test="${productOrderInfo.fd_payment_method eq 'PM0001'}">선불</c:if>
																			   <c:if test="${productOrderInfo.fd_payment_method eq 'PM0002'}">후불</c:if>
																			</p>
																		</li>
																	</c:if>
																	<li class="rt_depth2_li2 clear">
																		<h6>규격</h6>
																		<p><c:out value="${product.fd_product_standard}"/>  /  <c:out value="${product.fd_product_unit}"/></p>
																	</li>

																	<li class="rt_depth2_li3 clear">
																		<h6>수량</h6>
																		<p><c:out value="${product.fd_cnt}"/>개 <c:if test="${product.cancel_cnt > 0}">(취소 <c:out value="${product.cancel_cnt}"/>개)</c:if></p>
																	</li>

																	<li class="rt_depth2_li4 clear">
																		<h6>가격</h6>
																		<%-- 22.06.08 [Flow: 2569] 가격표출 오류 건 수정 --%>
																		<%-- <p><fmt:formatNumber value="${product.shop_sale_amount}" pattern="#,###"/>원</p> --%>
																		<p><fmt:formatNumber value="${product.fd_product_amount}" pattern="#,###"/>원</p>
																	</li>
																	<li class="rt_depth2_li5 clear">
																		<h6>배송상태</h6>
																		<p><c:out value="${product.fd_state_name}"/> <c:if test="${product.fd_state_code ne 'PP0003' && product.cancel_cnt > 0}">(일부취소)</c:if></p>

																	</li>
																</ul>
															</div>

															<c:if test="${productOrderInfo.fd_order_type eq 'OT1001'}">
															<div class="btn_wrap">
																<input hidden name="product_name" value="${product.fd_product_name}"/>
																<input hidden name="tpsm_idx" value="${product.fk_tpsm_idx}"/>
																<input hidden name="tpmm_idx" value="${product.fk_tpmm_idx}"/>
<%--																<button class="buy_btn">바로구매</button>--%>
																<button class="cart_btn">장바구니 담기</button>
															</div>
															</c:if>
														</li>
														</c:forEach>
												</ul>
											</div>
										</div>
<%--										</c:forEach>--%>
										<c:if test="${productOrderInfo.fd_order_type eq 'OT1001'}">
											<div class="clear">
												<button class="all_cart">전체 상품 다시 담기</button>
											</div>
										</c:if>

									</div>
									<div class="rt_cnt2">
										<ul class="rt_c2_depth1">
											<li class="rt_c2_li1">
												<div class="order_info_tit clear">
													<h4>주문자</h4>
												</div>

												<div class="order_info_txt">
													<ul class="rt_c2_depth2">
														<li class="clear">
															<h5>주문자</h5>
															<p><c:out value="${member.fd_member_name_desc}"/></p>
														</li>

														<li class="clear">
															<h5>연락처</h5>
															<div class="p_wrap">
																<p>
																	<c:choose>
																		<c:when test="${member.fd_tel_nomal_desc.length() == 8}">
																			${fn:substring(member.fd_tel_nomal_desc, 0, 4)}-${fn:substring(member.fd_tel_nomal_desc, 4, 8)}
																		</c:when>
																		<c:when test="${member.fd_tel_nomal_desc.length() == 9}">
																			${fn:substring(member.fd_tel_nomal_desc, 0, 2)}-${fn:substring(member.fd_tel_nomal_desc, 2, 5)}-${fn:substring(member.fd_tel_nomal_desc, 5, 9)}
																		</c:when>
																		<c:when test="${member.fd_tel_nomal_desc.length() == 10 && fn:startsWith(member.fd_tel_nomal_desc, '02')}">
																			${fn:substring(member.fd_tel_nomal_desc, 0, 2)}-${fn:substring(member.fd_tel_nomal_desc, 2, 6)}-${fn:substring(member.fd_tel_nomal_desc, 6, 10)}
																		</c:when>
																		<c:when test="${member.fd_tel_nomal_desc.length() == 10}">
																			${fn:substring(member.fd_tel_nomal_desc, 0, 3)}-${fn:substring(member.fd_tel_nomal_desc, 3, 6)}-${fn:substring(member.fd_tel_nomal_desc, 6, 10)}
																		</c:when>
																		<c:when test="${member.fd_tel_nomal_desc.length() == 11}">
																			${fn:substring(member.fd_tel_nomal_desc, 0, 3)}-${fn:substring(member.fd_tel_nomal_desc, 3, 7)}-${fn:substring(member.fd_tel_nomal_desc, 7, 11)}
																		</c:when>
																		<c:otherwise>
																			${member.fd_tel_nomal_desc}
																		</c:otherwise>
																	</c:choose>
																</p>
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


															</div>
														</li>

														<li class="clear">
															<h5>이메일</h5>
															<p><c:out value="${member.fd_email_info_desc}" /></p>
															<p></p>
														</li>
													</ul>
												</div>
											</li>
											<c:if test="${productOrderInfo.fd_order_type eq 'OT1001'}">
											<li class="rt_c2_li2">
												<div class="order_info_tit clear">
													<h4>받는 사람 정보</h4>
<%--													<p>배송 휴무일 : 빠른배송(휴무없음), 택배배송(일요일)</p>--%>
													<button>배송지 변경 안내</button>
													<div class="oit_popup">
														<div class="oit_popup_wrap">
															<span class="tri"><img src="/resources/images/main/oit_popup_tri.png" width="12" height="10" border="0" alt="" /></span>
															<p>장바구니, 홈에서<br>배송지를 변경할 수 있어요</p>
															<button class="oit_close"><img src="/resources/images/main/oit_popup_close.png" width="11" height="11" border="0" alt="" /></button>
														</div>
													</div>
												</div>

												<div class="order_info_txt">
													<ul class="rt_c2_depth2">
														<li class="clear">
															<h5>받는사람</h5>
															<p><c:out value="${productOrderInfo.fd_addr_name}"/></p>
														</li>

														<li class="clear">
															<h5>받는주소</h5>
															<p><c:out value="${productOrderInfo.fd_addr_desc}"/> <c:out value="${productOrderInfo.fd_addr_detail_desc}"/></p>
														</li>

														<c:if test="${!empty productOrderInfo.fd_ship_req}">
														<li class="clear">
															<h5>배송요청사항</h5>
															<p><c:out value="${productOrderInfo.fd_ship_req}"/></p>
														</li>
														</c:if>
													</ul>
												</div>
											</li>
											</c:if>

											<li class="rt_c2_li3">
												<div class="order_info_tit clear">
													<h4>결제정보</h4>
												</div>

												<div class="order_info_txt">
													<ul class="rt_c2_depth2">
														<li class="clear">
															<h5>제품금액</h5>
															<p><fmt:formatNumber value="${productOrderInfo.fd_product_payment}" pattern="#,###"/>원</p>
														</li>

														<li class="clear">
															<h5>배송비</h5>
															<p><fmt:formatNumber value="${productOrderInfo.fd_delivery_fee}" pattern="#,###"/>원</p>
														</li>

<%--														<li class="clear">--%>
<%--															<h5>제품할인금액</h5>--%>
<%--															<p>-17,831원</p>--%>
<%--														</li>--%>

<%--														<c:if test="${!empty couponList}">--%>

<%--														<c:set var="couponValue" value="0"/>--%>
<%--														<c:forEach var="coupon" items="${conponList}">--%>
<%--															<c:set var="couponValue" value="${couponValue + coupon.fd_coupon_info}"/>--%>
<%--														</c:forEach>--%>


														<li class="clear">
															<h5>쿠폰할인</h5>
															<p><c:if test="${couponValue > 0}">-</c:if><fmt:formatNumber value="${couponValue}" pattern="#,###"/>원</p>
														</li>
<%--														</c:if>--%>

														<li class="clear">
															<h5>포인트사용</h5>
															<p><c:if test="${productOrderInfo.fd_point_info > 0}">-</c:if><fmt:formatNumber value="${productOrderInfo.fd_point_info}" pattern="#,###"/>원</p>
														</li>

														<li class="clear">
															<h5>결제금액</h5>
															<p><fmt:formatNumber value="${productOrderInfo.fd_total_payment}" pattern="#,###"/>원</p>
														</li>

<%--														<li class="clear">--%>
<%--															<h5>적립예정금액</h5>--%>
<%--															<p>617원</p>--%>
<%--														</li>--%>
														<c:if test="${productOrderInfo.fd_payment_method ne 'PM0002'}">
														<li class="clear">
															<h5>결제방법</h5>

															<div class="p_wrap_right" style="margin-top:-5px;">
																<div class="p_wrap pw_1 clear">
																	<%-- <h6>결제방법</h6> --%>
																	<p><c:out value="${productOrderInfo.fd_state_name}"/></p>
<%--																	<c:if test="${productOrderInfo.fd_payment_type_code eq 'PT0002'}">--%>
																	<button class="chk_stat">전표확인</button>
																	<div class="print_popup" style="display:none">
																			<button class="pp_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>
																			<div class="pp_tit">
																				<h3>거래명세서 인쇄 미리보기</h3>
																			</div>
																			<div class="pp_txt" style="position:relative;height:753px;background:#f4f4f4;overflow:auto">
																				<div class="pp_wrap page" id="printme" style="width:1216px;background:#fff;position:absolute;top:3px;left:50%;-webkit-transform:translate(-50%, 0);transform:translate(-50%, 0);color:#000;font-family:ASGM, sans-serif;padding-bottom:10px;">
																					<c:forEach var="item" items="${productOrderInfoList}">
																						<c:set var="shop" value="${item.shopInfo}"/>
																						<fmt:parseDate var="orderDate" value="${productOrderInfo.fd_date}" pattern="yyyyMMdd" />
																						<div class="pp_top" style="width:100%;margin:0 auto 10px;height:307px">
																							<div class="ppt_left" style="float:left;width:49%">
																								<h4 style="font-size:30px;font-family:ASGEB, sans-serif;text-align:center;line-height:1;margin-top:28px;margin-bottom:23px;height:30px">거래명세표</h4>
																								<div class="ppt_tbl">
																									<table style="border:1px solid #000;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;font-size:20px;border-left:0;width:100%;font-size:12px;border-collapse:collapse">
																										<tr style="border-bottom:1px solid #000;height:30px">
																											<th rowspan="7" class="tg_th" style="background:#e8e8e8;width:45px;text-align:center;font-size:16px;line-height:1.3;border:1px solid #000;">공<br>급<br>자</th>
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">등록번호</th>
																											<td colspan="3" style="padding-left:7px"><c:out value="${shop.fd_corporate_registration_number_desc}"/></td>
																										</tr>

																										<tr style="border-bottom:1px solid #000;height:30px">
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">상호</th>
																											<td style="padding-left:7px"><c:out value="${shop.fd_corporate_registration_name}"/></td>
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">성명</th>
																											<td style="padding-left:7px"><c:out value="${shop.fd_corporate_representative_name_desc}"/></td>
																										</tr>

																										<tr style="border-bottom:1px solid #000;height:30px">
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">주소</th>
																											<td colspan="3" style="padding-left:7px"><c:out value="${shop.fd_corporate_addr}"/> <c:out value="${shop.fd_corporate_addr_detail}"/></td>
																										</tr>

																										<tr style="border-bottom:1px solid #000;height:30px">
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">업태</th>
																											<td style="padding-left:7px"><c:out value="${shop.fd_corporate_business_conditions_desc}"/></td>
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">종목</th>
																											<td style="padding-left:7px"><c:out value="${shop.fd_corporate_industry_type_desc}"/></td>
																										</tr>

																										<tr style="border-bottom:1px solid #000;height:30px">
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">전화</th>
																											<td style="padding-left:7px"><c:out value="${shop.fd_tel_nomal_desc}"/></td>
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">팩스</th>
																											<td style="padding-left:7px"></td>
																										</tr>

																										<tr style="border-bottom:1px solid #000;height:30px">
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">이메일</th>
<%--																											<td colspan="3" style="padding-left:7px"><c:out value="${shop.fd_email_info_desc}"/></td>--%>
																											<td colspan="3" style="padding-left:7px"></td>
																										</tr>
																									</table>

																									<div class="tbl_box clear" style="width:100%;border:1px solid #000;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;height:34px;line-height:34px;margin-top:10px;font-family:ASGB, sans-serif;overflow:hidden;">
																										<div class="tbl_tit" style="float:left;width:160px;border-right:1px solid #000;text-align:center;font-size:16px">주문일자</div>
																										<div class="tbl_txt" style="float:left;padding-left:11px;font-size:14px;font-family:ASGM, sans-serif;"><fmt:formatDate value="${orderDate}" pattern="yyyy-MM-dd"/></div>
																									</div>
																								</div>
																							</div>

																							<div class="ppt_right" style="float:left;width:49%;margin-left:2%">
																								<h4 style="text-align:center;line-height:1;margin-top:28px;margin-bottom:23px;height:30px"><img src="/resources/images/main/hd_logo_01.jpg" height="45" border="0" alt="" style="margin-top:-7px;" /></h4>
																								<div class="ppt_tbl">
																									<table style="border:1px solid #000;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;font-size:20px;border-left:0;width:100%;font-size:12px;border-collapse:collapse">
																										<tr style="border-bottom:1px solid #000;height:30px;">
																											<th rowspan="7" class="tg_th" style="background:#e8e8e8;width:45px;text-align:center;font-size:16px;line-height:1.3;border:1px solid #000;">공<br>급<br>받<br>는<br>자</th>
																											<th style="width:70px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">등록번호</th>
																											<td colspan="3" style="padding-left:7px"><c:out value="${member.fd_corporate_registration_number_desc}"/></td>
																										</tr>

																										<tr style="border-bottom:1px solid #000;height:30px">
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">상호</th>
																											<td style="padding-left:7px"><c:out value="${member.fd_corporate_registration_name_desc}"/></td>
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">성명</th>
																											<td style="padding-left:7px"><c:out value="${member.fd_corporate_representative_name_desc}"/></td>
																										</tr>

																										<tr style="border-bottom:1px solid #000;height:30px">
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">주소</th>
																											<td colspan="3" style="padding-left:7px"><c:out value="${member.fd_corporate_addr}"/> <c:out value="${member.fd_corporate_addr_detail}"/></td>
																										</tr>

																										<tr style="border-bottom:1px solid #000;height:30px">
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">업태</th>
																											<td style="padding-left:7px"><c:out value="${member.fd_corporate_business_conditions_desc}"/></td>
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">종목</th>
																											<td style="padding-left:7px"><c:out value="${member.fd_corporate_industry_type_desc}"/></td>
																										</tr>

																										<tr style="border-bottom:1px solid #000;height:30px">
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">전화</th>

																											<td style="padding-left:7px">
																												<c:choose>
																													<c:when test="${member.fd_tel_nomal_desc.length() > 10}">
																														<c:out value="${fn:substring(member.fd_tel_nomal_desc, 0, 3)}-${fn:substring(member.fd_tel_nomal_desc, 3, 7)}-${fn:substring(member.fd_tel_nomal_desc, 7, 11)}"/>
																													</c:when>
																													<c:otherwise>
																														<c:out value="${fn:substring(member.fd_tel_nomal_desc, 0, 2)}-${fn:substring(member.fd_tel_nomal_desc, 2, 6)}-${fn:substring(member.fd_tel_nomal_desc, 6, 10)}"/>
																													</c:otherwise>
																												</c:choose>
																											</td>
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">팩스</th>
																											<td style="padding-left:7px"></td>
																										</tr>

																										<tr style="border-bottom:1px solid #000;height:30px">
																											<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">이메일</th>
																											<td colspan="3" style="padding-left:7px"><c:out value="${member.fd_email_info_desc}"/></td>
																										</tr>
																									</table>

																									<div class="tbl_box clear" style="width:100%;border:1px solid #000;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;height:34px;line-height:34px;margin-top:10px;font-family:ASGB, sans-serif;overflow:hidden;">
																										<div class="tbl_tit" style="float:left;width:160px;border-right:1px solid #000;text-align:center;font-size:16px">주문일자</div>
																										<div class="tbl_txt" style="float:left;padding-left:11px;font-size:14px;font-family:ASGM, sans-serif;"><fmt:formatDate value="${orderDate}" pattern="yyyy-MM-dd"/></div>
																									</div>
																								</div>
																							</div>
																						</div>
																						<div class="pp_mid" style="width:100%;margin:0 auto 0">
																							<div class="ppm_tbl">
																								<table style="border:1px solid #000;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;font-size:7px;letter-spacing:-1px;border-left:0;font-family:ASGM, sans-serif;width:100%;border-collapse:collapse">
																									<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																										<th style="border-left:1px solid #000;text-align:center;font-size:14px;font-weight:normal;font-family:ASGB, sans-serif">No.</th>
																										<th style="border-left:1px solid #000;text-align:center;font-size:14px;font-weight:normal;font-family:ASGB, sans-serif">제품코드</th>
																										<th style="border-left:1px solid #000;text-align:center;font-size:14px;font-weight:normal;font-family:ASGB, sans-serif">상품명</th>
																										<th style="border-left:1px solid #000;text-align:center;font-size:14px;font-weight:normal;font-family:ASGB, sans-serif">제조사명</th>
																										<th style="border-left:1px solid #000;text-align:center;font-size:14px;font-weight:normal;font-family:ASGB, sans-serif">보험코드</th>
																										<th style="border-left:1px solid #000;text-align:center;font-size:14px;font-weight:normal;font-family:ASGB, sans-serif">규격</th>
																										<th style="border-left:1px solid #000;text-align:center;font-size:14px;font-weight:normal;font-family:ASGB, sans-serif">포장단위</th>
																										<th style="border-left:1px solid #000;text-align:center;font-size:14px;font-weight:normal;font-family:ASGB, sans-serif">수량</th>
																										<th style="border-left:1px solid #000;text-align:center;font-size:14px;font-weight:normal;font-family:ASGB, sans-serif">단가</th>
																										<th style="border-left:1px solid #000;text-align:center;font-size:14px;font-weight:normal;font-family:ASGB, sans-serif">금액</th>
																									</tr>
																									<c:forEach var="product" items="${item.productList}" varStatus="status">
																										<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																											<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">${status.index + 1}</td>
																											<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif"><c:out value="${product.fd_product_code}"/></td>
																											<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif"><c:out value="${product.fd_product_name}"/></td>
																											<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif"><c:out value="${product.fd_company_name}"/></td>
																											<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif"><c:out value="${product.fd_product_insure_code}"/></td>
																											<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif"><c:out value="${product.fd_product_standard}"/></td>
																											<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif"><c:out value="${product.fd_product_unit}"/></td>
																											<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif"><c:out value="${product.fd_cnt}"/></td>
																											<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif"><fmt:formatNumber value="${product.fd_product_amount}" pattern="#,###"/></td>
																											<%-- 22.06.08 [Flow: 2569] 가격표출 오류 건 수정 --%>
                                                                                                            <%-- <td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif"><fmt:formatNumber value="${product.shop_sale_amount * product.fd_cnt}" pattern="#,###"/></td> --%>
																											<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif"><fmt:formatNumber value="${product.fd_product_amount * product.fd_cnt}" pattern="#,###"/></td>
																										</tr>
																									</c:forEach>
																									<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																										<td rowspan="3" colspan="5" style="border-left:1px solid #000;text-align:center;font-size:18px;font-family:ASGM, sans-serif">
																											<h4 style="font-size:11px;font-family:ASGEB, sans-serif">입금계좌 안내</h4>
																											<p style="font-size:14px">하나은행 547-910035-44104</p>
																											<p style="font-size:14px">(주)메디밸류</p>
																										</td>
																										<td colspan="2" style="border-left:1px solid #000;text-align:center;font-family:ASGM, sans-serif">구매 합계</td>
																										<td colspan="3" style="border-left:1px solid #000;text-align:center;font-family:ASGM, sans-serif"><fmt:formatNumber value="${productOrderInfo.fd_product_payment}" pattern="#,###"/></td>
																									</tr>

																									<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																										<td colspan="2" style="border-left:1px solid #000;text-align:center;font-family:ASGM, sans-serif">배송비</td>
																										<td colspan="3" style="border-left:1px solid #000;text-align:center;font-family:ASGM, sans-serif"><fmt:formatNumber value="${productOrderInfo.fd_delivery_fee}" pattern="#,###"/></td>
																									</tr>

																									<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																										<td colspan="2" style="border-left:1px solid #000;text-align:center;font-family:ASGM, sans-serif">결제금액</td>
																										<td colspan="3" style="border-left:1px solid #000;text-align:center;font-family:ASGM, sans-serif"><fmt:formatNumber value="${productOrderInfo.fd_total_payment}" pattern="#,###"/></td>
																									</tr>
																								</table>
																							</div>
																						</div>
																						<div class="pp_btm clear" style="width:100%;margin:10px auto 0;border:1px solid #000;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box">
																							<div class="ppb_tbl">
																								<table style="width:100%;border-collapse:collapse">
																									<tr style="width:100%">
																										<th style="font-size:16px;width:10%;text-align:center;border-right:1px solid #000">비고</th>
																										<td style="font-size:12px;line-height:1.5;padding:10px;width:90%"></td>
																									</tr>
																								</table>
																							</div>
																						</div>
																					</c:forEach>
																				</div>

																			</div>
																			<div class="pp_btn">
																				<input class="pp_btn1" type="button" value="인쇄하기" id="print" onclick="javascript:printIt(document.getElementById('printme').innerHTML)"/>
																				<button class="pp_btn2">닫기</button>
																			</div>
																		</div>
<%--																	</c:if>--%>
																	<c:if test="${productOrderInfo.fd_payment_type_code eq 'PT0001'}">
																		<button id="card_stat" class="copy_btn">결제확인</button>
																	</c:if>
<%--																	<c:if test="${productOrderInfo.fd_payment_type_code eq 'PT0003'}">--%>
<%--																		<button id="bank_stat" class="copy_btn">현금영수증확인</button>--%>
<%--																	</c:if>--%>

																</div>
																<c:if test="${productOrderInfo.fd_payment_type_code eq 'PT0002'}">
																<div class="p_wrap pw_2 clear">
																	<h6>계좌번호</h6>
																	<p id="bank_no">547-910035-44104</p>
																	<button id="copy_btn" class="copy_btn">복사하기</button>
																</div>

																<div class="p_wrap pw_3 clear">
																	<h6>계좌은행</h6>
																	<p>하나은행</p>
																</div>

																<div class="p_wrap pw_4 clear">
																	<h6>계좌명</h6>
																	<p>메디밸류</p>
																</div>
																<c:if test="${productOrderInfo.fd_state_code eq 'PP0006'}">
																<div class="p_wrap pw_4 clear">
																	<h6>결제 변경</h6>
<%--																	<p>메디밸류</p>--%>
																	<button id="card_btn" class="copy_btn">카드결제</button>
																</div>
																</c:if>
																</c:if>
															</div>
														</li>
														</c:if>														
													</ul>
												</div>
											</li>
											<li class="rt_c2_li4">
												<div class="order_info_tit clear">
													<h4>세금계산서 정보</h4>
												</div>

												<div class="order_info_txt">
													<ul class="rt_c2_depth2">
														<c:choose>
															<c:when test="${productOrderInfo.fd_tax_yn eq 'Y'}">
														<li class="clear">
															<h5>세금계산서 신청</h5>
															<p>신청</p>
														</li>

														<li class="clear">
															<h5>사업자번호</h5>
															<p><c:out value="${member.fd_corporate_registration_number_desc}"/></p>
														</li>

														<li class="clear">
															<h5>회사명</h5>
															<p><c:out value="${member.fd_corporate_registration_name_desc}"/></p>
														</li>

														<li class="clear">
															<h5>대표자명</h5>
															<p><c:out value="${member.fd_corporate_representative_name_desc}"/></p>
														</li>

														<li class="clear">
															<h5>업태</h5>
															<p><c:out value="${member.fd_corporate_business_conditions_desc}"/></p>
														</li>

														<li class="clear">
															<h5>종목</h5>
															<p><c:out value="${member.fd_corporate_industry_type_desc}"/></p>
														</li>

														<li class="clear">
															<h5>이메일</h5>
															<p><c:out value="${member.fd_email_info_desc}"/></p>
														</li>
															</c:when>
															<c:otherwise>
														<li class="clear">
															<h5>세금계산서 신청</h5>
															<p>미신청</p>
														</li>
															</c:otherwise>
														</c:choose>
													</ul>
												</div>
											</li>
										</ul>

<%--										<div class="clear">--%>
<%--											<button class="order_confirm">주문확인</button>--%>
<%--										</div>--%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>