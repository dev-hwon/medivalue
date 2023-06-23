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
				
				setSelectMonths(); // 현재월에서 최근 6개월까지 select option 생성
// 				selectMonth(); // select에서 선택된 option 값 datepicker에 update
				
				let login_check = '${login_check}';
				if (login_check === 'N') {
					// alert("로그인 후에 이용 가능합니다.");
					location.replace("/access/login")
				}

				let searchString = '${pageHelper.searchString}';
				if (searchString != '') {
					$("#searchLabel").hide();
				}
				
				$(".btnCart").on("click", function(){
					let tpmm_idx = $(this).parent().parent().find(".tpmm_idx").text();
					let product_name = $(this).parent().parent().parent().find(".product_name").text();

					var req_data = [{
						tpmm_idx: tpmm_idx,
						cnt: 1
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
								// cart_list_reload($("#pd_cart_align").val());
								popAlarm3(product_name, 1, data['basket_list_size']);
								labbit_add_to_cart(data.basket_save_list);
							} else {
								alert(data['rtn_msg']);
							}
						}
					});

				});
				
				$(".btn_search").on("click", function(){
					$("#frm").submit();
				});
				
				$(".btn_download").on("click", function(){
					const tmi_idx = '${hMap.fk_tmi_idx}';
					const obj = {
		                    fk_tmi_idx: tmi_idx,
		        			startDate: $("#startDate").val(),
		        			endDate: $("#endDate").val(),
		        			pageSize: 0,
		        			insureCodeYn: $("#insureCodeYn").prop("checked") ? "Y" : "N"
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
	                            link.download = "구매내역_"+utc+'.xlsx';
	                            link.click();
	                        } else {
	                            console.error(xhr.responseText);
	                        }
	                    }
	                }
	                xhr.open('POST', '/excel/downloadPurchaseList.do');
	                xhr.setRequestHeader('Content-Type', 'application/json');
	                xhr.send(JSON.stringify(obj));
	                xhr.responseType = 'blob';
				});

			});
			
			var today = new Date();
			var year = today.getFullYear();
			var month = today.getMonth();
			var day = today.getDate();
			
			function sevenDaysAgo(){
				$("#startDate").datepicker("update", new Date(year, month, day-7));
				$("#endDate").datepicker("update", new Date());
				$("#frm").submit();
			}
			function oneMonthsAgo(){
				$("#startDate").datepicker("update", new Date(year, month-1, day));
				$("#endDate").datepicker("update", new Date());
				$("#frm").submit();
			}
			function threeMonthsAgo(){
				$("#startDate").datepicker("update", new Date(year, month-3, day));
				$("#endDate").datepicker("update", new Date());
				$("#frm").submit();
			}
			function sixMonthsAgo(){
				$("#startDate").datepicker("update", new Date(year, month-6, day));
				$("#endDate").datepicker("update", new Date());
				$("#frm").submit();
			}
			function oneYearsAgo(){
				$("#startDate").datepicker("update", new Date(year-1, month, day));
				$("#endDate").datepicker("update", new Date());
				$("#frm").submit();
			}

			function onInsureCode() {
				$("#frm").submit();
			}
			
			function setSelectMonths(){
				var y = year;
				var m = month + 1;
				$("#sel_month select").append("<option value=''>월 선택</option>");
				for (var i=0; i<6; i++){
					$("#sel_month select").append("<option value="+y+m+">"+y+"년 "+m+"월"+"</option>");
					m = m - 1;
					if(m < 1){
						m = 12;
						y = y -1
					}
				}
			}
			
			function selectMonth(){
				var selMonth = $("#sel_month select option:selected").val();
				var sYear = selMonth.substring(0,4);
				var sMonth = selMonth.substring(4);
				var sDay = new Date(sYear, sMonth, 0).getDate();
				
// 				if ("${startDate}" == "") {
					$("#startDate").datepicker("update", new Date(sYear, sMonth-1, 1));
// 				}
// 				if ("${endDate}" == "") {
					$("#endDate").datepicker("update", new Date(sYear, sMonth-1, sDay));
// 				}
				$("#frm").submit();
			}
			
			/* 장바구니 담기 버튼 클릭 시 */
			function addCart(obj) {
				// const tpsm_idx = obj.tpsm_idx;
				// const product_name = obj.product_name;
				// const cnt = 1;
				//
				// let formData = {};
				// formData['list[0].fk_tpsm_idx'] = tpsm_idx;
				// formData['list[0].cnt'] = cnt;
				// //google tag manager
				// $.ajax({
    			// 	url : '/basket/rest/save',
    			// 	type : 'post',
    			// 	cache : false,
    			// 	data : formData,
    			// 	dataType : 'json',
    			//    	success:function(data){
    			//    		if(data.rtn_code == '200'){
    			//    			popAlarm(product_name, cnt);
				// 			ad_log_naver("3", "1");
				// 			labbit_add_to_cart(data.productInfoList);
    			//    		}else{
    			//    			alert(data.rtn_msg);
    			//    		}
    			//    	},
    			//    	error:function(request,status,error){
    			//         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				// 	}
				// });
			}

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
										<h4>구매내역 조회</h4>
<%--										<h4 class="off" onclick="location.href='/member/purchase/cancelList'">취소내역 조회</h4>--%>
									</div>
									<div class="search_wrap">
										<form id="frm" name="frm" action="/member/purchase/list" method="post">
										<div class="row">
											<div class="th">
												<p class="tit">제품검색</p>
											</div>
											<div class="td">
												<div class="comm_sel">
													<select id="searchType" name="searchType">
														<option value="p_all">전체</option>
														<option value="p_code" <c:if test="${hMap.searchType eq 'p_code'}">selected</c:if>>상품코드</option>
														<option value="p_name" <c:if test="${hMap.searchType eq 'p_name'}">selected</c:if>>상품명</option>
														<option value="p_info" <c:if test="${hMap.searchType eq 'p_info'}">selected</c:if>>제조사</option>
													</select>
												</div>
												<div class="comm_txt">
													<input type="text" class="w_300" id="purchase_searchString" name="searchString" value="${hMap.searchString}"/>
												</div>
												<div class="btn_sch_s">
													<button class="btn_search"></button>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="th">
												<p class="tit">기간검색</p>
											</div>
											<div class="td">
												<div class="comm_date">
													<input type="text" class="inp_date" id="startDate" name="startDate" value="${startDate}" /><span>~</span><input type="text" class="inp_date" id="endDate" name="endDate" value="${endDate}" />
												</div>
												<div class="btn_sch_s">
													<button class="btn_search"></button>
												</div>
												<div class="comm_rdo">
													<label><input type="radio" name="rdo_period" value="" onclick="sevenDaysAgo();"><span>7일</span></label>
													<label><input type="radio" name="rdo_period" value="" onclick="oneMonthsAgo();"><span>1개월</span></label>
													<label><input type="radio" name="rdo_period" value="" onclick="threeMonthsAgo();"><span>3개월</span></label>
													<label><input type="radio" name="rdo_period" value="" onclick="sixMonthsAgo();"><span>6개월</span></label>
													<label><input type="radio" name="rdo_period" value="" onclick="oneYearsAgo();"><span>12개월</span></label>
												</div>
												<div class="comm_sel" id="sel_month">
													<select onchange="selectMonth();"></select>
												</div>
												<div class="comm_chk">
													<label><input type="checkbox" id="insureCodeYn" name="insureCodeYn" <c:if test="${insureCodeYn eq 'Y'}">checked</c:if> onclick="onInsureCode()" value="Y"><span>보험여부</span></label>
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
														<th>주문/취소일자</th>
														<%-- <th>상품코드</th> --%>
														<th>상품명</th>
														<th>제조사</th>
														<th>규격</th>
														<th>포장단위</th>
														<th>보혐코드</th>
														<th>수량</th>
														<th>단가</th>
														<th>합계</th>
														<th>배송상태</th>
														<th>재구매</th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${!empty list}">
													<c:forEach var="item" items="${list}" varStatus="varStatus">
													<tr>
														<td class="wb_keep">${item.fd_date}</td>
														<%-- <td>${item.fd_medi_product_code}</td> --%>
														<td class="ta_left product_name">${item.fd_product_name}</td>
														<td>${item.fd_company_info}</td>
														<td>${item.fd_product_standard}</td>
														<td>${item.fd_product_unit}</td>
														<td>
															<c:if test="${empty item.fd_product_insure_code}"> - </c:if>
															<c:if test="${!empty item.fd_product_insure_code}">${item.fd_product_insure_code}</c:if>
														</td>
														<td class="wb_keep product_cnt"><fmt:formatNumber value="${item.fd_cnt}" pattern="#,###" />개</td>
														<td class="wb_keep"><fmt:formatNumber value="${item.fd_product_amount}" pattern="#,###" />원</td>
														<td class="wb_keep"><fmt:formatNumber value="${item.fd_amount}" pattern="#,###" />원</td>
														<td class="wb_keep">${item.fd_state_name}</td>
														<td class="wb_keep">
															<a href="#"><img src="/resources/images/sub/ico_cart.png" alt="" class="btnCart"/></a>
															<div class="tpsm_idx d-none">${item.fk_tpsm_idx}</div>
															<div class="tpmm_idx d-none">${item.fk_tpmm_idx}</div>
														</td>
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