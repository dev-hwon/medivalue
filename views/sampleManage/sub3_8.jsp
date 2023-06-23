<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<link rel="stylesheet" href="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.standalone.min.css" type="text/css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
		<script type="text/javascript" src="/resources/js/sub.js"></script>
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.min.js"></script>
		<script src="/resources/js/jquery/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				
				$("#inp_date_s").datepicker({
					language: "ko",
					format: "yyyy-mm-dd"
				});
				$("#inp_date_e").datepicker({
					language: "ko",
					format: "yyyy-mm-dd"
				});
				
				setSelectMonths(); // 현재월에서 최근 6개월까지 select option 생성
				selectMonth(); // select에서 선택된 option 값 datepicker에 update
			});
			
			var today = new Date();
			var year = today.getFullYear();
			var month = today.getMonth();
			var day = today.getDate();
			
			function sevenDaysAgo(){
				$("#inp_date_s").datepicker("update", new Date(year, month, day-7));
				$("#inp_date_e").datepicker("update", new Date());
			}
			function oneMonthsAgo(){
				$("#inp_date_s").datepicker("update", new Date(year, month-1, day));
				$("#inp_date_e").datepicker("update", new Date());
			}
			function threeMonthsAgo(){
				$("#inp_date_s").datepicker("update", new Date(year, month-3, day));
				$("#inp_date_e").datepicker("update", new Date());
			}
			function sixMonthsAgo(){
				$("#inp_date_s").datepicker("update", new Date(year, month-6, day));
				$("#inp_date_e").datepicker("update", new Date());
			}
			function oneYearsAgo(){
				$("#inp_date_s").datepicker("update", new Date(year-1, month, day));
				$("#inp_date_e").datepicker("update", new Date());
			}
			
			function setSelectMonths(){
				var y = year;
				var m = month + 1;
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
				
				$("#inp_date_s").datepicker("update", new Date(sYear, sMonth-1, 1));
				$("#inp_date_e").datepicker("update", new Date(sYear, sMonth-1, sDay));
				
			};
			
			
			
			
			
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub3_8" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<%-- <layout:leftMyFrame/> --%>
							<div class="left">
								<h3>내 계정</h3>
								<ul class="left_menu">
									<li><button>주문배송 조회</button></li>
									<li><button>배송지관리</button></li>
									<li><button>쿠폰 / 포인트 쿠폰</button></li>
									<li><button>회원정보 수정</button></li>
									<li class="on"><button>구매내역 조회</button></li>
								</ul>
							</div>
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>구매내역 조회</h4>
									</div>
									<div class="search_wrap">
										<div class="row">
											<div class="th">
												<p class="tit">조회기간</p>
											</div>
											<div class="td">
												<div class="comm_sel">
													<select>
														<option>전체</option>
														<option>상품코드</option>
														<option>상품명</option>
														<option>제조사</option>
													</select>
												</div>
												<div class="comm_txt">
													<input type="text" class="w_300" />
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
													<input type="text" class="inp_date" id="inp_date_s" /><span>~</span><input type="text" class="inp_date" id="inp_date_e" />
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
											</div>
										</div>
									</div>
								</div>
								<div class="right_txt">
									<div class="rt_cnt">
										<div class="comm_ctrl_bar">
											<div class="cnt_wrap">
												<ul>
													<li>
														<div>총 <span class="num">0000</span>건</div>
													</li>
													<li>
														<div>결제 금액 : <span class="num">900,000,000</span>원</div>
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
														<th>상품코드</th>
														<th>상품명</th>
														<th>제조사</th>
														<th>규격</th>
														<th>포장단위</th>
														<th>수량</th>
														<th>단가</th>
														<th>합계</th>
														<th>배송조회</th>
														<th>재구매</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="wb_keep">2021.09.14</td>
														<td>88888888888888888888</td>
														<td class="ta_left"><a href="#">12345678912345678912345678912347</a></td>
														<td>MARUCHI/한국</td>
														<td>999999999</td>
														<td>999999999999999999</td>
														<td class="wb_keep">111개</td>
														<td class="wb_keep">1,000,000원</td>
														<td class="wb_keep">1,000,000원</td>
														<td class="wb_keep"><a href="#">배송완료</a></td>
														<td class="wb_keep"><a href="#"><img src="/resources/images/sub/ico_cart.png" alt="" /></a></td>
													</tr>
													<tr>
														<td class="wb_keep">2021.09.14</td>
														<td>88888888888888888888</td>
														<td class="ta_left"><a href="#">12345678912345678912345678912347</a></td>
														<td>MARUCHI/한국</td>
														<td>999999999</td>
														<td>999999999999999999</td>
														<td class="wb_keep">111개</td>
														<td class="wb_keep">1,000,000원</td>
														<td class="wb_keep">1,000,000원</td>
														<td class="wb_keep"><a href="#">배송완료</a></td>
														<td class="wb_keep"><a href="#"><img src="/resources/images/sub/ico_cart.png" alt="" /></a></td>
													</tr>
													<tr>
														<td class="wb_keep">2021.09.14</td>
														<td>88888888888888888888</td>
														<td class="ta_left"><a href="#">12345678912345678912345678912347</a></td>
														<td>MARUCHI/한국</td>
														<td>999999999</td>
														<td>999999999999999999</td>
														<td class="wb_keep">111개</td>
														<td class="wb_keep">1,000,000원</td>
														<td class="wb_keep">1,000,000원</td>
														<td class="wb_keep"><a href="#">배송완료</a></td>
														<td class="wb_keep"><a href="#"><img src="/resources/images/sub/ico_cart.png" alt="" /></a></td>
													</tr>
													<tr>
														<td class="wb_keep">2021.09.14</td>
														<td>88888888888888888888</td>
														<td class="ta_left"><a href="#">12345678912345678912345678912347</a></td>
														<td>MARUCHI/한국</td>
														<td>999999999</td>
														<td>999999999999999999</td>
														<td class="wb_keep">111개</td>
														<td class="wb_keep">1,000,000원</td>
														<td class="wb_keep">1,000,000원</td>
														<td class="wb_keep"><a href="#">배송완료</a></td>
														<td class="wb_keep"><a href="#"><img src="/resources/images/sub/ico_cart.png" alt="" /></a></td>
													</tr>
													<tr>
														<td class="wb_keep">2021.09.14</td>
														<td>88888888888888888888</td>
														<td class="ta_left"><a href="#">12345678912345678912345678912347</a></td>
														<td>MARUCHI/한국</td>
														<td>999999999</td>
														<td>999999999999999999</td>
														<td class="wb_keep">111개</td>
														<td class="wb_keep">1,000,000원</td>
														<td class="wb_keep">1,000,000원</td>
														<td class="wb_keep"><a href="#">배송완료</a></td>
														<td class="wb_keep"><a href="#"><img src="/resources/images/sub/ico_cart.png" alt="" /></a></td>
													</tr>
													
												</tbody>
											</table>
										</div>
										<div class="comm_pagination">
											<ul>
												<li class="start"><button></button></li>
												<li class="prev"><button></button></li>
												<li class="on"><button>1</button></li>
												<li><button>2</button></li>
												<li><button>3</button></li>
												<li><button>4</button></li>
												<li><button>5</button></li>
												<li class="next"><button></button></li>
												<li class="end"><button></button></li>
											</ul>
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
