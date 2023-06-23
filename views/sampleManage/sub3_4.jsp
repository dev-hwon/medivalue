<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				var $sTd5=$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 table tbody tr td.ship_td5 button");
				var $s34Smclose=$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .sc_modi_popup .sm_tit .sm_close");
				var $depBtn=$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 table tbody tr td.ship_td6 button");
				var $depClose=$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup .dep_close");
				var $okBtn=$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup .btn_wrap .ok_btn");
				var $tableTr=$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 table tbody tr");
	
				$depBtn.on("click", function  () {
					var $bnbn=$(this).parents("tr").index();
	
					$okBtn.on("click", function  () {
						$tableTr.eq($bnbn).css("display","none");
						$depClose.click();
					});
					
				});
	
				$depBtn.on("click", function  () {
					$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup").css("display","block");
					$("#black").css("display","block");
				});
	
				$depClose.on("click", function  () {
					$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup").css("display","none");
					$("#black").css("display","none");
				});
	
				$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup .btn_wrap .cancel_btn").on("click", function  () {
					$depClose.click()
				});
	
				$sTd5.on("click", function  () {
					if ($(this).parent().hasClass("on")) {
						$(this).closest("table").next(".sc_modi_popup").css("display","block").find(".sc_sp").css("display","none").next().find("input[type='checkbox']").prop("checked", true);
						$("#black").css("display","block");
					}else {
						$(this).closest("table").next(".sc_modi_popup").css("display","block").find(".sc_sp").css("display","inline-block").next().find("input[type='checkbox']").prop("checked", false);
						$("#black").css("display","block");
					}
				});
	
				$s34Smclose.on("click", function  () {
					$(this).closest(".sc_modi_popup").css("display","none");
					$("#black").css("display","none");
				});
	
				$("#sub3_4 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .sc_modi_popup .sm_btn button").on("click", function  () {
					$s34Smclose.click()
				});
	
				$("#black").on("click", function  () {
					$s34Smclose.click()
					$depClose.click()
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub3_4" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<h3>마이페이지</h3>
							
								<ul>
									<li><button>주문배송 조회</button></li>
									<li class="on"><button>배송지관리</button></li>
									<li><button>포인트 쿠폰</button></li>
									<li><button>회원정보 수정</button></li>
								</ul>
							
								<div class="banner">
									<h4>주문/배송에<br>도움이 필요하신가요?</h4>
									<button>1:1 문의하기</button>
								</div>
							</div>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>배송지 관리</h4>
										<button class="ship_add"><span>+</span> 배송지 추가</button>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<table>
											<thead>
												<tr>
													<th class="ship_th1">선택</th>
													<th class="ship_th2">주소</th>
													<th class="ship_th3">받으실분</th>
													<th class="ship_th4">연락처</th>
													<th class="ship_th5">수정</th>
													<th class="ship_th6"></th>
												</tr>
											</thead>
	
											<tbody>
												<tr>
													<td class="ship_td1">
														<div class="chk_wrap">
															<input id="ship1" type="radio" name="ship">
															<label for="ship1"> </label>
														</div>
													</td>
	
													<td class="ship_td2">
														<div class="p_wrap on">
															<p>서울 영등포구 당산동 5가 16-3<span class="mark">기본배송지</span></p>
														</div>
													</td>
	
													<td class="ship_td3">
														<p>이엘치과</p>
													</td>
	
													<td class="ship_td4">
														<p>010-8754-9874</p>
													</td>
	
													<td class="ship_td5 on">
														<button><img src="/resources/images/main/ship_change.jpg" width="23" height="18" border="0" alt="" /></button>
													</td>
	
													<td class="ship_td6 on">
														<button><img src="/resources/images/main/ship_delete.jpg" width="19" height="19" border="0" alt="" /></button>
													</td>
												</tr>
	
												<tr>
													<td class="ship_td1">
														<div class="chk_wrap">
															<input id="ship2" type="radio" name="ship">
															<label for="ship2"> </label>
														</div>
													</td>
	
													<td class="ship_td2">
														<div class="p_wrap">
															<p>서울 영등포구 여의대방로 376 나라키움 2층 205호 한연세라벤더치과 교정과 치과의원 데스크<span class="mark">기본배송지</span></p>
														</div>
													</td>
	
													<td class="ship_td3">
														<p>한연세라벤더치과 교정과 치과의원</p>
													</td>
	
													<td class="ship_td4">
														<p>0507-1397-2877</p>
													</td>
	
													<td class="ship_td5">
														<button><img src="/resources/images/main/ship_change.jpg" width="23" height="18" border="0" alt="" /></button>
													</td>
	
													<td class="ship_td6">
														<button><img src="/resources/images/main/ship_delete.jpg" width="19" height="19" border="0" alt="" /></button>
													</td>
												</tr>
	
												<tr>
													<td class="ship_td1">
														<div class="chk_wrap">
															<input id="ship3" type="radio" name="ship">
															<label for="ship3"> </label>
														</div>
													</td>
	
													<td class="ship_td2">
														<div class="p_wrap">
															<p>서울 영등포구 여의대방로 376 나라키움 2층 205호 한연세라벤더치과 교정과 치과의원 데스크<span class="mark">기본배송지</span></p>
														</div>
													</td>
	
													<td class="ship_td3">
														<p>한연세라벤더치과 교정과 치과의원</p>
													</td>
	
													<td class="ship_td4">
														<p>0507-1397-2877</p>
													</td>
	
													<td class="ship_td5">
														<button><img src="/resources/images/main/ship_change.jpg" width="23" height="18" border="0" alt="" /></button>
													</td>
	
													<td class="ship_td6">
														<button><img src="/resources/images/main/ship_delete.jpg" width="19" height="19" border="0" alt="" /></button>
													</td>
												</tr>
											</tbody>
										</table>
	
										<div class="sc_modi_popup">
											<div class="sm_tit">
												<h4>배송지 수정</h4>
												<button class="sm_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
											</div>
	
											<div class="sm_txt">
												<div class="sm_txt_wrap">
													<span class="sc_sp">기본배송지</span>
													
													<ul>
														<li>
															<p>서울 영등포구 당산동 5가 16-3</p>
															<div class="form_cont">
																<label for="sc_md_ip1">3층</label>
																<input type="text" id="sc_md_ip1">
															</div>
														</li>
													
														<li>
															<p>받으실 분</p>
															<div class="form_cont">
																<label for="sc_md_ip2">이엘치과</label>
																<input type="text" id="sc_md_ip2" value="">
															</div>
														</li>
													
														<li>
															<p>연락처</p>
															<div class="form_cont">
																<label for="sc_md_ip3">02-2671-2755</label>
																<input type="text" id="sc_md_ip3">
															</div>
														</li>
	
														<li>
															<div class="chk_wrap">
																<input id="ship_save1" type="checkbox">
																<label for="ship_save1">기본배송지로 저장</label>
															</div>
														</li>
													</ul>
												</div>
											</div>
	
											<div class="sm_btn"><button>저장</button></div>
										</div>
	
										<div class="delete_popup">
											<button class="dep_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>
											<h5>배송지를 삭제하시겠습니까?</h5>
											<div class="btn_wrap">
												<button class="cancel_btn">취소</button>
												<button class="ok_btn">확인</button>
											</div>
										</div>
	
										<div class="pd_list_paging">
											<ul class="clear">
												<li class="prev2"><button><img src="/resources/images/main/prev_icon2.png" width="10" height="9" border="0" alt="" /></button></li>
												<li class="prev1"><button><img src="/resources/images/main/prev_icon1.png" width="10" height="9" border="0" alt="" /></button></li>
												<li class="on"><button>1</button></li>
												<li class="next1"><button><img src="/resources/images/main/next_icon1.png" width="10" height="9" border="0" alt="" /></button></li>
												<li class="next2"><button><img src="/resources/images/main/next_icon2.png" width="10" height="9" border="0" alt="" /></button></li>
											</ul>
										</div>
									</div>
	
									<div class="clear">
										<button class="save_ship">기본배송지로 저장</button>
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