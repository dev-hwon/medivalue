<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20230607"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript">
			var promotion_check = true;
			var signInPopup = {
				showMessage: function (msg) {
					$("#pop_alarm_msg").text(msg);
					$("#black").show();
					$(".popup_message_type_1").show();
				}
			};

			$(document).ready(function(){
				let login_check = '${login_check}';
				if (login_check === 'N') {
					location.replace("/access/login");
				}

				let rtn_code = '${rtn_code}';
				let rtn_msg = '${rtn_msg}';

				if (rtn_code != '200') {
					signInPopup.showMessage(rtn_msg);
				}

				$("#promotion_code").bind("keyup", function() {
					$(this).val($(this).val().toUpperCase());
				});
			});

			function popupHide(){
				$(".btn_info_wrap .terms_popup").hide();
			}

			function popupShow(){
				$(".btn_info_wrap .terms_popup").show();
			}

			/* 포인트 코드 등록 버튼 클릭 시 */
			function registCode(){
				if(promotion_check){
					let promotion_code = $("#promotion_code").val();
					if(typeof(promotion_code) !='undefined' && promotion_code.trim() !=''){
						promotion_check = false;
						var formData = {
								"promotion_code":promotion_code
							};
							$.ajax({
								url : '/promotion/rest/check/info',
								type : 'post',
								cache : false,
								data : formData,
								dataType : 'json',
							   	success:function(data){
							   		if(data.rtn_cd != '200'){
							   			promotion_check = true;
							   			layerAlertCustom(data.rtn_msg,'layerAlertClose()','n');
							   		}else{
							   			promotion_check = true;
							   			layerAlertCustom(data.rtn_msg,'layerAlertMoveClose()','n');
							   			
							   		}
							   	},
							   	error:function(request,status,error){
							        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							        promotion_check = true;
							    }
							});
					}else{
						layerAlertCustom(data.rtn_msg,'layerAlertClose()','n');
						promotion_check = true;
					}
				}else{
					layerAlertCustom(data.rtn_msg,'layerAlertClose()','n');
				}
			}

			function layerAlertCustom(text,btnOkFunc,btnCancelYn){
			    //const text = "유효하지 않은 코드 입니다."; // 본문 텍스트
			    layerAlert(text, btnOkFunc, btnCancelYn);
			}

			function layerAlertMoveClose(){
			    $(".layer_alert").removeClass("on");
			    location.reload();
			}
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub3_5" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<layout:leftMyFrame/>

							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>쿠폰 / 포인트</h4>
										<h4 class="tab_off" onclick="location.href='/ocb/point/list'">OK캐쉬백</h4>
										<div class="btn_info_wrap">
											<a href="javascript:;" onclick="popupShow();">쿠폰 / 포인트 이용안내 ⓘ</a>
											<div class="terms_popup">
												<div class="bg" onclick="popupHide();"></div>
												<div class="cont">
													<button class="terms_close" onclick="popupHide();"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
													<div class="terms_tit"><h5>쿠폰 / 포인트 이용안내</h5></div>
													<div class="terms_txt">
														<p>‘메디밸류 포인트’는 메디밸류 내 상품등의 구입, 이벤트 참여 등을 통하여 적립된 비현금성 포인트입니다. ‘쿠폰’은 메디밸류에서 발행하는 비현금성 쿠폰입니다.</p>
														<p>‘메디밸류 포인트’ 및 ‘쿠폰’은 회원탈퇴, 메디밸류의 폐업 등 포인트를 사용할 수 없는 사정이 발생한 경우 자동적으로 소멸되며, 소멸되는 포인트에 대해 보상이 되지 않습니다.</p>
														<p>회원 탈퇴 후 재가입으로 포인트 및 쿠폰은 복원되지 않습니다.</p>
														<p>단, 폐업의 경우에는 회원이 잔여 포인트 및 쿠폰을 사용할 수 있도록 회사가 폐업 전 2개월 이상의 기간전에 미리 고지합니다.</p>
														<p>‘메디밸류 포인트’의 사용은 구매 금액의 5% 이내에서 사용가능합니다.</p>
														<p>‘메디밸류 포인트’는 구매 시 구매 금액의 1%가 적립됩니다.</p>
													</div>
													<button class="terms_btn" onclick="popupHide();">확인</button>
												</div>
											</div>
										</div>
										
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<div class="rc1_top">
											<div class="rc1_tit clear">
												<h5>메디밸류 포인트</h5>
												<p>보유하고 계신 포인트의 내역을 한 눈에 확인 하실 수 있습니다.</p>
											</div>

											<div class="rc1_txt">
												<ul>
													<li class="clear">
														<h6>현재 포인트</h6>
														<p><fmt:formatNumber value="${mileageInfo.fd_mileage_point}" pattern="#,###" /> 원</p>
													</li>
													
													<!-- 포인트 코드 등록 영역 START -->
													<li class="clear">
														<div class="cd_ip_wrap">
															<div class="form_cont">
																<input type="text" id="promotion_code" name="promotion_code" placeholder="코드를 입력해주세요." value="" style="text-transform: uppercase;"/>
															</div>
															<button class="cd_ip" onclick="registCode();" type="button">코드 등록</button>
														</div>
													</li>
													<!-- 포인트 코드 등록 영역 END -->

													<%-- <li class="clear">
														<h6>소멸예정 포인트</h6>
														<p>3,000원</p>
													</li> --%>
												</ul>
											</div>
										</div>

										<div class="rc1_btm">
											<table>
												<thead>
													<tr>
														<th class="rc1_th1">날짜</th>
														<th class="rc1_th2">내용</th>
<%--														<th class="rc1_th3">유효기간</th>--%>
														<th class="rc1_th3"></th>
														<th class="rc1_th4">금액</th>
													</tr>
												</thead>

												<tbody>
													<c:forEach var="item" items="${mileageLogList}">
														<tr>
															<fmt:parseDate var="fdDate" value="${item.fd_date}" pattern="yyyyMMdd" />
															<td class="rc1_td1">
																<p><fmt:formatDate value="${fdDate}" pattern="yy.MM.dd"/></p>
															</td>
															<c:choose>
																<c:when test="${item.fd_mileage_status_code eq 'MM0003'}">
																	<td class="rc1_td2">
																		<p>
																			<c:if test="${item.fd_cnt > 1}">
																				${item.fd_product_name} 외 ${item.fd_cnt} 건 포인트 ${item.fd_mileage_status}
																			</c:if>
																			<c:if test="${item.fd_cnt == 1}">
																				${item.fd_product_name} 포인트 ${item.fd_mileage_status}
																			</c:if>
																			<c:if test="${item.fd_memo ne '' && item.fd_cnt ==0}">
																				${item.fd_memo}
																			</c:if>
																		</p>
																	</td>
																	<td class="rc1_td3">
																			<%--<p>22.08.11</p>--%>
																		<p></p>
																	</td>
																	<td class="rc1_td4">
																		<p>
																			-<fmt:formatNumber value="${item.fd_mileage_use}" pattern="#,###" /> 원
																		</p>
																	</td>
																</c:when>
																<c:when test="${item.fd_mileage_status_code eq 'MM0004'}">
																	<td class="rc1_td2">
																		<p>
																			포인트 ${item.fd_mileage_status}
																		</p>
																	</td>
																	<td class="rc1_td3">
																			<%--<p>22.08.11</p>--%>
																		<p></p>
																	</td>
																	<td class="rc1_td4">
																		<p>
																			<fmt:formatNumber value="${item.fd_mileage_use}" pattern="#,###" /> 원
																		</p>
																	</td>
																</c:when>
																<c:when test="${item.fd_mileage_status_code eq 'MM0005'}">
																	<td class="rc1_td2">
																		<p>
																			포인트 ${item.fd_mileage_status}
																		</p>
																	</td>
																	<td class="rc1_td3">
																			<%--<p>22.08.11</p>--%>
																		<p></p>
																	</td>
																	<td class="rc1_td4">
																		<p>
																			-<fmt:formatNumber value="${item.fd_mileage_use}" pattern="#,###" /> 원
																		</p>
																	</td>
																</c:when>
																<c:when test="${item.fd_mileage_status_code eq 'MM0002'}">
																	<td class="rc1_td2">
																		<p>
																				포인트 ${item.fd_mileage_status}
																		</p>
																	</td>
																	<td class="rc1_td3">
																			<%--<p>22.08.11</p>--%>
																		<p></p>
																	</td>
																	<td class="rc1_td4">
																		<p>

																		</p>
																	</td>
																</c:when>
																<c:otherwise>
																	<td class="rc1_td2">
																		<p>
																				포인트 ${item.fd_mileage_status}
																		</p>
																	</td>
																	<td class="rc1_td3">
																			<%--<p>22.08.11</p>--%>
																		<p></p>
																	</td>
																	<td class="rc1_td4">
																		<p>
																			+<fmt:formatNumber value="${item.fd_mileage_use}" pattern="#,###" /> 원
																		</p>
																	</td>
																</c:otherwise>
															</c:choose>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
	
									<div class="rt_cnt2">
										<div class="rc2_top">
											<div class="rc2_tit clear">
												<h5>쿠폰</h5>
												<p>할인쿠폰은 구매조건에 따라 상품 결제 시 적용할 수 있습니다.</p>
											</div>
	
											<div class="rc2_txt">
												<ul>
													<li class="rc2_txt_li1 clear">
														<h6>사용가능 할인쿠폰</h6>
														<p><c:out value="${couponList.size()}"/>개</p>
													</li>
													<%-- <li class="rc2_txt_li2 clear">
														<div class="cp_ip_wrap clear">
															<div class="form_cont">
																<label for="ciw1">쿠폰을 입력해주세요</label>
																<input type="text" id="ciw1">
															</div>
															<button class="cp_ip">쿠폰등록</button>
														</div>
														<p>쿠폰에 하이픈(&quot;-&quot;)이 포함되어 있을경우 하이픈(&quot;-&quot;)을 반드시 입력해주세요.</p>
													</li> --%>
												</ul>
											</div>
										</div>
	
										<div class="rc2_btm">
											<table>
												<thead>
													<tr>
														<th class="rc2_th1">쿠폰명</th>
														<th class="rc2_th6">사용가능금액</th>
														<th class="rc2_th2">가능</th>
														<th class="rc2_th3">할인</th>
														<th class="rc2_th4">사용가능기간</th>
														<th class="rc2_th5">사용여부</th>
													</tr>
												</thead>
													<c:if test="${!empty couponList}">
												<tbody>
														<c:forEach var="item" items="${couponList}">
															<tr>
																<td class="rc2_td1">
																	<h6><c:out value="${item.fd_coupon_name}" /></h6>
<%--																	<p>메디밸류 오픈기념 20%할인(최대1만원)</p>--%>
																</td>
																<td class="rc2_td6">
																	<p>
																		<c:if test="${item.fd_use_min_amount eq '0'}">
																		    -
																		</c:if>
																		<c:if test="${item.fd_use_min_amount ne '0'}">
																			<fmt:formatNumber value="${item.fd_use_min_amount}" pattern="#,###" />원 이상 주문시
																		</c:if>

																	</p>
																</td>
																<td class="rc2_td2">
																	<p>할인</p>
																</td>

																<td class="rc2_td3 on">
																	<p>
																		<c:choose>
																			<c:when test="${item.fd_coupon_type eq 'UC0001'}">
																				${item.fd_coupon_info}
																			</c:when>
																			<c:otherwise>
																				<fmt:formatNumber value="${item.fd_coupon_info}" pattern="#,###" />
																			</c:otherwise>
																		</c:choose>
																	</p>
																</td>
																<fmt:parseDate var="startDate" value="${item.fd_date}" pattern="yyyyMMdd" />
																<fmt:parseDate var="expireDate" value="${item.fd_expire_date}" pattern="yyyyMMdd" />

																<td class="rc2_td4">
																	<p><fmt:formatDate value="${startDate}" pattern="yy.MM.dd" /> ~ <fmt:formatDate value="${expireDate}" pattern="yy.MM.dd" /></p>
																</td>

																<td class="rc2_td5 on">
<%--																	<c:if test="${item.fd_coupon}">--%>

<%--																	</c:if>--%>
																	<p>미사용</p>

																</td>
															</tr>
														</c:forEach>
												</tbody>
													</c:if>
												<tbody align="center">
													<c:if test="${empty couponList}">
														<tr>
															<td colspan="5"> 쿠폰 사용 내역이 없습니다.</td>
														</tr>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>

			<div class="layer_alert">
                <div class="bg" onclick="layerAlertClose();"></div>
                <div class="cont">
                    <div class="head">
                        <div class="alert_inner">
                            <div class="title">알림메세지</div>
                            <div class="btn"><button class="btn_close" type="button" onclick="layerAlertClose();"><img src="/resources/images/event_first_purchase/ico_layer_alert_close.png" alt=""></button></div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="txt"></div>
                    </div>
                    <div class="foot">
                        <div class="btn">
                            <button type="button" class="btn_cancel" onclick="layerAlertClose();">취소</button>
                            <button type="button" class="btn_ok">확인</button>
                        </div>
                    </div>
                </div>
            </div>

		</section>
	</jsp:body>
</layout:basicFrame>