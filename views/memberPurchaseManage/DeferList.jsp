<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211026"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<link rel="stylesheet" href="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.standalone.min.css" type="text/css" />
		<style type="text/css">
			.d-none {
				display: none;			
			}
			.order_link {
				color: #5A66AB !important;
			}
			
		</style>
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220317"></script>
		<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.min.js"></script>
    	<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				
				$("#startDate").datepicker({
					language: "ko",
					format: "yyyy-mm-dd"
				});
				$("#endDate").datepicker({
					language: "ko",
					format: "yyyy-mm-dd"
				});
				
				let login_check = '${login_check}';
				if (login_check === 'N') {
					// alert("로그인 후에 이용 가능합니다.");
					location.replace("/access/login")
				}

				let searchString = '${pageHelper.searchString}';
				if (searchString != '') {
					$("#searchLabel").hide();
				}
				
				$(".btn_search").on("click", function(){
					$("#frm").submit();
				});
				
				$(".btn_download").on("click", function(){
					
					const tmi_idx = '${hMap.fk_tmi_idx}';
					const obj = {
		                    fk_tmi_idx: tmi_idx,
		        			startDate: $("#startDate").val(),
		        			endDate: $("#endDate").val(),
		        			searchString: $("#searchString_order").val(),
		        			fd_member_idx : '${member_idx}',
		        			pageSize: 0		        			
		                };
					let xhr = new XMLHttpRequest();
	                xhr.onreadystatechange = function () {
	                    if (xhr.readyState === xhr.DONE) {
	                        if (xhr.status === 200 || xhr.status === 201) {
	                            let _data = this.response;
	                            let _blob = new Blob([_data], {type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'});

	                            let link = document.createElement('a');
	                            link.href = window.URL.createObjectURL(_blob);
	                            let utc = new Date().toJSON().slice(0,10).replace(/-/g,'');
	                            link.download = "후불구매내역_"+utc+'.xlsx';
	                            link.click();
	                        } else {
	                            console.error(xhr.responseText);
	                        }
	                    }
	                }
	                xhr.open('POST', '/excel/downloadPurchaseDeferList.do');
	                xhr.setRequestHeader('Content-Type', 'application/json');
	                xhr.send(JSON.stringify(obj));
	                xhr.responseType = 'blob';
				});

			});

		</script>
		${pageNavi.script}
	</jsp:attribute>
	<jsp:body>
		<section id="sub3_1" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<layout:leftMyFrame/>

							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>후불 구매내역 조회</h4>
									</div>
									<div class="search_wrap">
										<form id="frm" name="frm" action="/member/purchase/deferlist" method="post">
										<div class="row">
											<div class="th">
												<p class="tit">조회 기간</p>
											</div>
											<div class="td">
												<div class="comm_date">
													<input type="text" class="inp_date" id="startDate" name="startDate" value="${startDate}" /><span>~</span><input type="text" class="inp_date" id="endDate" name="endDate" value="${endDate}" />
												</div>
												<div class="btn_sch_s">
													<button class="btn_search"></button>
												</div>																								
											</div>
										</div>
										<div class="row">
											<div class="th">
												<p class="tit">주문 조회</p>
											</div>
											<div class="td">												
												<div class="comm_txt">
													<input type="text" class="w_300" id="searchString_order" name="searchString" value="${hMap.searchString}" placeholder="주문번호를 입력하세요." />
												</div>
												<div class="btn_sch_s">
													<button class="btn_search"></button>
												</div>
											</div>
										</div>
										</form>
									</div>
								<div class="right_txt">
									<div class="rt_cnt">
										<div class="comm_ctrl_bar">
											<div class="cnt_wrap">
												<ul>
													<li>
														<div>총 <span class="num"><fmt:formatNumber value="${sum.cnt}" pattern="#,###" /></span>건</div>
													</li>
													<li>
														<div>결제금액 : <span class="num"><fmt:formatNumber value="${sum.total_amount}" pattern="#,###" /></span>원</div>
													</li>
												</ul>
											</div>
											<div class="btn_wrap">
												<button class="btn_download">구매내역 다운로드</button>
											</div>
										</div>
										<div class="comm_tbl">
											<table>
												<colgroup>
													<col style="" />
													<%-- <col style="" /> --%>
													<col style="" />
													<col style="" />
													<col style="" />
													<col style="" />
													<col style="" />
													<col style="" />
													<col style="" />
													<col style="" />
													<col style="" />
													<col style="" />
												</colgroup>
												<thead>
													<tr>
														<th>주문일자</th>														
														<th>주문번호</th>														
														<th>주문품목</th>
														<th>주문금액</th>
														<th>포인트사용</th>
														<th>결제금액</th>
														<th>배송상태</th>														
													</tr>
												</thead>
												<tbody>
													<c:if test="${!empty list}">
													<c:forEach var="item" items="${list}" varStatus="varStatus">
													<tr>														
														<td>
															<fmt:parseDate var="date" value="${item.fd_date}" pattern="yyyymmdd" />
														    <fmt:formatDate value="${date}" pattern="yyyy.mm.dd" />
														</td>
														<td><a href="/order/detail/${item.fd_order_id}" class="order_link">${item.fd_order_id}</a></td>
														<td>${item.fd_cnt}건</td>
														<td><fmt:formatNumber value="${item.fd_product_payment}" pattern="#,###" />원</td>
														<td><fmt:formatNumber value="${item.fd_point_info}" pattern="#,###" />원<c:if test="${(item.fd_state_code eq 'PP0003') && (item.fd_point_info > 0)}"> (취소)</c:if></td>
														<td>
															<c:if test="${item.fd_state_code eq 'PP0003'}">- </c:if><fmt:formatNumber value="${item.fd_total_payment}" pattern="#,###" />원
														</td>
														<td>${item.fd_state_name}</td>													
													</tr>
													</c:forEach>
													</c:if>
													<c:if test="${empty list}">
													<tr>
														<td colspan="10">검색 결과가 없습니다.</td>
													</tr>
													</c:if>
												</tbody>
											</table>
										</div>
									</div>
									
									<div class="pd_list_paging">
										${pageNavi.navi}
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