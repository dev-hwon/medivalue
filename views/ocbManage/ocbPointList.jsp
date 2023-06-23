<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20220718" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<link rel="stylesheet" href="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.standalone.min.css" type="text/css" />		
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?v=20220718"></script>
		<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.min.js"></script>
    	<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>
		<script type="text/javascript">
			$(function(){
				const range = 181; // 181일 (6개월 + 1일)
	            const diff = range * 1000 * 60 * 60 * 24; // 변환
	            $("#inq_p1").datepicker({
	                language: "ko",
	                format: "yyyy-mm-dd",
	                endDate: "+0d",
	            }).on("changeDate", function(){
	                const sDate = $("#inq_p1").datepicker("getDate");
	                const eDate = $("#inq_p2").datepicker("getDate");
	                // $("#inq_p2").datepicker("setStartDate", sDate);
	                if(sDate > eDate){ // 시작 날짜가 끝 날짜보다 클 경우
	                    $("#inq_p2").datepicker("setDate", sDate);
	                }
	                if((eDate - sDate) > diff){ // 시작 날짜와 끝 날짜의 범위가 6개월보다 클 경우
	                    sDate.setMonth(sDate.getMonth() + 6);
	                    $("#inq_p2").datepicker("setDate", sDate);
	                }
	            });
	            $("#inq_p2").datepicker({
	                language: "ko",
	                format: "yyyy-mm-dd",
	                endDate: "+0d",
	            }).on("changeDate", function(){
	                const sDate = $("#inq_p1").datepicker("getDate");
	                const eDate = $("#inq_p2").datepicker("getDate");
	                // $("#inq_p1").datepicker("setStartDate", eDate);
	                if(sDate > eDate){ // 시작 날짜가 끝 날짜보다 클 경우
	                    $("#inq_p1").datepicker("setDate", eDate);
	                }
	                if((eDate - sDate) > diff){ // 시작 날짜와 끝 날짜의 범위가 6개월보다 클 경우
	                    eDate.setMonth(eDate.getMonth() - 6);
	                    $("#inq_p1").datepicker("setDate", eDate);
	                }
	            });
				let startDate = $("#inq_p1").val();
				let endDate = $("#inq_p2").val();
				if (startDate === undefined || startDate === "") {
					$("#inq_p1").datepicker("setDate", "-6M");
					$("#inq_p2").datepicker("setDate", "today");
				}
				if (endDate === undefined || endDate === "") {
					$("#inq_p1").datepicker("setDate", "-6M");
					$("#inq_p2").datepicker("setDate", "today");
				}

				$(".cal_icon").on("click", function () {
					$(this).siblings("input.input_date").focus();
				});

				$(".btn_search").on("click", function () {
					$("#form_ocb").submit();
				});
			});
		</script>
		${pageNavi.script}
	</jsp:attribute>
	<jsp:body>
		<section id="okcash" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<layout:leftMyFrame/>
<%--							<div class="left">--%>
<%--								<h3>내 계정</h3>--%>
<%--							--%>
<%--								<ul>--%>
<%--									<li><button>MY 홈 (위시리스트)</button></li>--%>
<%--									<li><button>주문배송 조회</button></li>--%>
<%--									<li><button>배송지 관리</button></li>--%>
<%--									<li class="on"><button>쿠폰 / 포인트</button></li>--%>
<%--									<li><button>회원정보 수정</button></li>--%>
<%--									<li><button>구매내역 조회</button></li>--%>
<%--								</ul>--%>
<%--							--%>
<%--								<div class="banner">--%>
<%--									<h4>주문/배송에<br>도움이 필요하신가요?</h4>--%>
<%--									<button type="button">1:1 문의하기</button>--%>
<%--								</div>--%>
<%--							</div>--%>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4 class="tab_off" onclick="location.href='/coupon/list'">쿠폰 / 포인트</h4>
										<h4>OK캐쉬백</h4>
										<div class="util">
                                            <div class="info">
                                                포인트 조회기간 안내 <a href="javascript:;">i<span class="info_box">OK캐쉬백 포인트 조회는 최대 6개월까지 가능합니다.</span></a>
                                            </div>
                                        </div>
									</div>
								</div>

								<div class="right_txt">
									<div class="rt_cnt">
										<div class="rc1_top">
											<div class="rc1_txt">
												<c:set var="memberOcbPointListCount" value="${memberOcbPointInfo.memberOcbPointListCount}"/>
												<form id="form_ocb">
												<ul class="">
													<li class="">
														<h6>전체 누적 예상 캐쉬백</h6>
														<p><fmt:formatNumber value="${memberOcbPointListCount.totalSavedPoint}" pattern="#,###"/>P</p>
													</li>
													<li class="">
														<h6>조회기간별 포인트</h6>
														<p><fmt:formatNumber value="${memberOcbPointListCount.savedPoint}" pattern="#,###"/>P</p>
													</li>
													<li class="">
														<h6>조회기간</h6>
														<div class="inq_period">
															<div class="form_cont">
																<input class="input_date" name="startDate" type="text" id="inq_p1" value="${startDate}">
																<button class="cal_icon" type="button"><img src="/resources/images/main/order_calen.jpg" width="11" height="11" border="0" alt="" /></button>
															</div>
															<p>~</p>
															<div class="form_cont">
																<input class="input_date" name="endDate" type="text" id="inq_p2" value="${endDate}">
																<button class="cal_icon" type="button"><img src="/resources/images/main/order_calen.jpg" width="11" height="11" border="0" alt="" /></button>
															</div>
															<button class="btn_search" type="button" id=""></button>
														</div>
													</li>
												</ul>
												</form>
											</div>
										</div>
									</div>

									<div class="rt_cnt">
										<div class="rc1_btm">
											<table>
												<thead>
													<tr>
														<th class="rc1_th1">주문일자</th>
														<th class="rc1_th2">적립/취소 일자</th>
														<th class="rc1_th3">주문번호</th>
														<th class="rc1_th4">내용</th>
														<th class="rc1_th5">카드번호</th>
														<th class="rc1_th6">금액</th>
													</tr>
												</thead>
												<tbody>
												<c:set var="memberOcbPointList" value="${memberOcbPointInfo.memberOcbPointList}"/>
												<c:forEach var="memberOcbPoint" items="${memberOcbPointList}">
													<tr>
														<td class="rc1_td1">
															<p><c:out value="${memberOcbPoint.fd_order_date}"/></p>
														</td>
														<td class="rc1_td2">
															<p><c:out value="${memberOcbPoint.fd_reg_date}"/></p>
														</td>
														<td class="rc1_td3">
															<p><c:out value="${memberOcbPoint.fd_order_id}"/></p>
														</td>
														<td class="rc1_td4">
															<p>
																<c:out value="${memberOcbPoint.ocb_point_type_cd_name}"/>
															</p>
														</td>
														<td class="rc1_td5">
															<p>
																<c:out value="${memberOcbPoint.ocb_card_info}"/>
															</p>
														</td>
														<td class="rc1_td6">
															<p>
																<c:out value="${memberOcbPoint.ocb_saved_point}"/>
															</p>
														</td>
													</tr>
												</c:forEach>
<%--													<tr>--%>
<%--														<td class="rc1_td1">--%>
<%--															<p>22.06.03</p>--%>
<%--														</td>--%>
<%--	--%>
<%--														<td class="rc1_td2">--%>
<%--															<p>22.06.10</p>--%>
<%--														</td>--%>
<%--	--%>
<%--														<td class="rc1_td3">--%>
<%--															<p>22061900092</p>--%>
<%--														</td>--%>
<%--														<td class="rc1_td4">--%>
<%--															<p>OK캐쉬백 적립</p>--%>
<%--														</td>--%>
<%--														<td class="rc1_td5">--%>
<%--															<p>0000-0000-0000-0000</p>--%>
<%--														</td>--%>
<%--														<td class="rc1_td6">--%>
<%--															<p>13P</p>--%>
<%--														</td>--%>
<%--													</tr>--%>
												</tbody>
											</table>
<%--											<div class="comm_pagination">--%>
<%--												<ul>--%>
<%--													<li class="start"><button></button></li>--%>
<%--													<li class="prev"><button></button></li>--%>
<%--													<li class="on"><button>1</button></li>--%>
<%--													<li><button>2</button></li>--%>
<%--													<li><button>3</button></li>--%>
<%--													<li><button>4</button></li>--%>
<%--													<li><button>5</button></li>--%>
<%--													<li class="next"><button></button></li>--%>
<%--													<li class="end"><button></button></li>--%>
<%--												</ul>--%>
<%--											</div>--%>
											<div class="comm_pagination">
													${pageNavi.navi}
											</div>
											<div class="info_list">
												<ul>
													<li>배송완료 7일 이후 OK캐쉬백에 적립예정포인트로 적립되며, 최종 적립 시점은 OK캐쉬백 정책에 따릅니다.</li>
													<li>배송완료 7일 이후 부분취소가 발생할 경우, 전체 적립은 취소하고 실결제금액만큼 재적립됩니다.</li>
													<li>누적 예상 캐쉬백은 OK캐쉬백의 적립포인트와 상이할 수 있으므로, OK캐쉬백의 적립포인트 및 적립예정포인트에서 최종 확인해 주시기 바랍니다.</li>
												</ul>
											</div>
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