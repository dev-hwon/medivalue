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
		<script type="text/javascript">

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

			});
			
			function popupHide(){
				$(".btn_info_wrap .terms_popup").hide();	
			}
			function popupShow(){
				$(".btn_info_wrap .terms_popup").show();
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
										<h4>메디캐쉬</h4>
<%--										<div class="btn_info_wrap">--%>
<%--											<a href="javascript:;" onclick="popupShow();">메디캐쉬 이용안내 ⓘ</a>--%>
<%--											<div class="terms_popup">--%>
<%--												<div class="bg" onclick="popupHide();"></div>--%>
<%--												<div class="cont">--%>
<%--													<button class="terms_close" onclick="popupHide();"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>--%>
<%--													<div class="terms_tit"><h5>쿠폰 / 포인트 이용안내</h5></div>--%>
<%--													<div class="terms_txt">--%>
<%--														<p>‘메디밸류 포인트’는 메디밸류 내 상품등의 구입, 이벤트 참여 등을 통하여 적립된 비현금성 포인트입니다. ‘쿠폰’은 메디밸류에서 발행하는 비현금성 쿠폰입니다.</p>--%>
<%--														<p>‘메디밸류 포인트’ 및 ‘쿠폰’은 회원탈퇴, 메디밸류의 폐업 등 포인트를 사용할 수 없는 사정이 발생한 경우 자동적으로 소멸되며, 소멸되는 포인트에 대해 보상이 되지 않습니다.</p>--%>
<%--														<p>회원 탈퇴 후 재가입으로 포인트 및 쿠폰은 복원되지 않습니다.</p>--%>
<%--														<p>단, 폐업의 경우에는 회원이 잔여 포인트 및 쿠폰을 사용할 수 있도록 회사가 폐업 전 2개월 이상의 기간전에 미리 고지합니다.</p>--%>
<%--														<p>‘메디밸류 포인트’의 사용은 구매 금액의 5% 이내에서 사용가능합니다.</p>--%>
<%--														<p>‘메디밸류 포인트’는 구매 시 구매 금액의 1%가 적립됩니다.</p>--%>
<%--													</div>--%>
<%--													<button class="terms_btn" onclick="popupHide();">확인</button>--%>
<%--												</div>--%>
<%--											</div>--%>
<%--										</div>--%>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<div class="rc1_top">
											<div class="rc1_tit clear">
												<h5>메디캐쉬</h5>
												<p>보유하고 계신 메디캐쉬 내역을 한 눈에 확인 하실 수 있습니다.</p>
											</div>

											<div class="rc1_txt">
												<ul class="clear">
													<li class="clear">
														<h6>현재 메디캐시</h6>
														<p><fmt:formatNumber value="${memberMedicashInfo.fd_medicash_info}" pattern="#,###" /></p>
													</li>
												</ul>
											</div>
										</div>

										<div class="rc1_btm">
											<div class="rc1_top">
												<div class="rc1_tit clear">
													<h5>캐쉬 구매내역</h5>
												</div>
											</div>

											<table>
												<thead>
													<tr>
														<th class="rc1_th1">날짜</th>
														<th class="rc1_th2">내용</th>
														<th class="rc1_th3"></th>
														<th class="rc1_th4">금액</th>
													</tr>
												</thead>
												<c:if test="${empty medicashInfoLogList}">
												<tbody align="center">
													<tr>
														<td colspan="0"> 메디캐시 구매내역이 없습니다.</td>
													</tr>
												</tbody>
												</c:if>
												<c:if test="${!empty medicashInfoLogList}">
												<tbody>
													<c:forEach var="item" items="${medicashInfoLogList}">
														<tr>
															<fmt:parseDate var="fdDate" value="${item.fd_date}" pattern="yyyyMMdd" />
															<td class="rc1_td1">
																<p><fmt:formatDate value="${fdDate}" pattern="yy.MM.dd"/></p>
															</td>
															<c:choose>
																<c:when test="${item.fd_medicash_status_code eq 'MCT001'}">
																	<td class="rc1_td2">
																		<c:choose>
																			<c:when test="${empty item.fd_memo}">
																				<p>
																					주문번호 - (${item.fd_order_id}) 메디캐쉬 구매 (충전)
																				</p>
																			</c:when>
																			<c:otherwise>
																				<p>
																					주문번호 - (<c:out value="${item.fd_order_id}"/>) <c:out value="${item.fd_memo}"/>
																				</p>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td class="rc1_td3">
																		<p></p>
																	</td>
																	<td class="rc1_td4">
																		<p>
																			<fmt:formatNumber value="${item.fd_medicash_use}" pattern="#,###" />
																		</p>
																	</td>
																</c:when>
																<c:when test="${item.fd_medicash_status_code eq 'MCT004'}">
																	<td class="rc1_td2">
																		<c:choose>
																			<c:when test="${empty item.fd_memo && empty item.fd_order_id}">
																				<p>
																					메디캐쉬 추가
																				</p>
																			</c:when>
																			<c:when test="${empty item.fd_order_id}">
																				<p>
																					메디캐쉬 추가 / <c:out value="${item.fd_memo}"/>
																				</p>
																			</c:when>
																			<c:when test="${empty item.fd_memo}">
																				<p>
																					주문번호 - (<c:out value="${item.fd_order_id}"/>) 메디캐쉬 추가
																				</p>
																			</c:when>
																			<c:otherwise>
																				<p>
																					주문번호 - (<c:out value="${item.fd_order_id}"/>) <c:out value="${item.fd_memo}"/>
																				</p>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td class="rc1_td3">
																		<p></p>
																	</td>
																	<td class="rc1_td4">
																		<p>
																			<fmt:formatNumber value="${item.fd_medicash_use}" pattern="#,###" />
																		</p>
																	</td>
																</c:when>
																<c:when test="${item.fd_medicash_status_code eq 'MCT005'}">
																	<td class="rc1_td2">
																		<c:choose>
																			<c:when test="${empty item.fd_memo && empty item.fd_order_id}">
																				<p>
																					메디캐쉬 환불
																				</p>
																			</c:when>
																			<c:when test="${empty item.fd_order_id}">
																				<p>
																					메디캐쉬 환불 / <c:out value="${item.fd_memo}"/>
																				</p>
																			</c:when>
																			<c:when test="${empty item.fd_memo}">
																				<p>
																					주문번호 - (<c:out value="${item.fd_order_id}"/>) 메디캐쉬 환불
																				</p>
																			</c:when>
																			<c:otherwise>
																				<p>
																					주문번호 - (<c:out value="${item.fd_order_id}"/>) <c:out value="${item.fd_memo}"/>
																				</p>
																			</c:otherwise>
																		</c:choose>
																	</td>
																	<td class="rc1_td3">
																			<%--<p>22.08.11</p>--%>
																		<p></p>
																	</td>
																	<td class="rc1_td4">
																		<p>
																			<fmt:formatNumber value="${item.fd_medicash_use}" pattern="#,###" />
																		</p>
																	</td>
																</c:when>
															</c:choose>
														</tr>
													</c:forEach>
												</tbody>
												</c:if>
											</table>
										</div>
									</div>
									<div class="rt_cnt1">
										<div class="rc1_btm">
											<div class="rc1_top">
												<div class="rc1_tit clear">
													<h5>캐쉬 사용내역</h5>
												</div>
											</div>

											<table>
												<thead>
												<tr>
													<th class="rc1_th1">날짜</th>
													<th class="rc1_th2">내용</th>
													<th class="rc1_th3"></th>
													<th class="rc1_th4">금액</th>
												</tr>
												</thead>
												<c:if test="${empty medicashUseLogList}">
													<tbody align="center">
													<tr>
														<td colspan="0"> 메디캐시 사용내역이 없습니다.</td>
													</tr>
													</tbody>
												</c:if>
												<c:if test="${!empty medicashUseLogList}">
												<tbody>
												<c:forEach var="item" items="${medicashUseLogList}">
													<tr>
														<fmt:parseDate var="fdDate" value="${item.fd_date}" pattern="yyyyMMdd" />
														<td class="rc1_td1">
															<p><fmt:formatDate value="${fdDate}" pattern="yy.MM.dd"/></p>
														</td>
														<c:choose>
															<c:when test="${item.fd_medicash_status_code eq 'MCT002'}">
																<td class="rc1_td2">
																	<c:choose>
																		<c:when test="${empty item.fd_memo}">
																			<p>
																				주문번호 - (${item.fd_order_id}) 메디캐쉬 구매 취소 (차감)
																			</p>
																		</c:when>
																		<c:otherwise>
																			<p>
																				주문번호 - (<c:out value="${item.fd_order_id}"/>) <c:out value="${item.fd_memo}"/>
																			</p>
																		</c:otherwise>
																	</c:choose>
																</td>
																<td class="rc1_td3">
																	<p></p>
																</td>
																<td class="rc1_td4">
																	<p>
																		- <fmt:formatNumber value="${item.fd_medicash_use}" pattern="#,###" />
																	</p>
																</td>
															</c:when>
															<c:when test="${item.fd_medicash_status_code eq 'MCT003'}">
																<td class="rc1_td2">
																	<c:choose>
																		<c:when test="${empty item.fd_memo && empty item.fd_order_id}">
																			<p>
																				메디캐쉬 차감
																			</p>
																		</c:when>
																		<c:when test="${empty item.fd_order_id}">
																			<p>
																				메디캐쉬 차감 / <c:out value="${item.fd_memo}"/>
																			</p>
																		</c:when>
																		<c:when test="${empty item.fd_memo}">
																			<p>
																				주문번호 - (<c:out value="${item.fd_order_id}"/>) 메디캐쉬 차감
																			</p>
																		</c:when>
																		<c:otherwise>
																			<p>
																				주문번호 - (<c:out value="${item.fd_order_id}"/>) <c:out value="${item.fd_memo}"/>
																			</p>
																		</c:otherwise>
																	</c:choose>
																</td>
																<td class="rc1_td3">
																	<p></p>
																</td>
																<td class="rc1_td4">
																	<p>
																		- <fmt:formatNumber value="${item.fd_medicash_use}" pattern="#,###" />
																	</p>
																</td>
															</c:when>
														</c:choose>
													</tr>
												</c:forEach>
												</tbody>
												</c:if>
											</table>
										</div>
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