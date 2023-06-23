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
				var $tdList=$("#sub4_1 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .table_div ul .td .td_list");
				var $tdCdelete=$("#sub4_1 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .table_div ul .td .td_content .td_ques .util_wrap .delete_btn");
				var $tdClose=$("#sub4_1 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup .dep_close");
	
				$tdList.on("click", function  () {
					if ($(this).hasClass("on")) {
						$(this).removeClass("on").next().stop().slideUp();
					}else {
						$(this).addClass("on").next().stop().slideDown();
					}
				});
	
				$tdCdelete.on("click", function  () {
					$("#sub4_1 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup").css("display","block")
					$("#black").css("display","block");
				});
	
				$tdClose.on("click", function  () {
					$("#sub4_1 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup").css("display","none")
					$("#black").css("display","none");
				});
	
				$("#sub4_1 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup .btn_wrap .cancel_btn").on("click", function  () {
					$tdClose.click()
				});
	
				$("#black").on("click", function  () {
					$tdClose.click()
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub4_1" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<h3>고객센터</h3>
							
								<ul>
									<li class="on"><button>1:1문의</button></li>
									<li><button>공지사항</button></li>
									<li><button>이용안내</button></li>
									<li><button>법적고지</button></li>
								</ul>
							
								<div class="banner">
									<h4>주문/배송에<br>도움이 필요하신가요?</h4>
									<button>1:1 문의하기</button>
								</div>
							</div>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>1:1문의</h4>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<div class="table_div">
											<ul>
												<li class="th clear">
													<h5 class="one_th1">번호</h5>
													<h5 class="one_th2">카테고리</h5>
													<h5 class="one_th3">제목</h5>
													<h5 class="one_th4">작성자</h5>
													<h5 class="one_th5">작성일</h5>
													<h5 class="one_th6">상태</h5>
												</li>
											
												<li class="td">
													<div class="td_list clear">
														<p class="one_td1">5</p>
														<p class="one_td2">A/S문의</p>
														<p class="one_td3">구매 건 일부 반품 요청합니다.구매 건 일부 반품 요청합니다.구매 건 일부 반품 요청합니다.구매 건 일부 반품 요청합니다.구매 건 일부 반품 요청합니다.</p>
														<p class="one_td4"><span>이엘치과이엘치과이엘치과이엘치과</span></p>
														<p class="one_td5">2021.09.28</p>
														<p class="one_td6 on">답변완료</p>
													</div>
	
													<div class="td_content">
														<div class="td_ques">
															<h5>주문내역 [TITAN X 외 3건]</h5>
															<div class="img"><img src="/resources/images/main/counsel_img.jpg" width="462" height="261" border="0" alt="" /></div>
															<p>물건이 잘못 배송되었습니다.<br>반품바랍니다.</p>
															<div class="clear">
																<div class="util_wrap clear">
																	<button class="modi_btn">수정</button>
																	<button class="delete_btn">삭제</button>
																</div>
															</div>
														</div>
	
														<div class="td_answ">
															<span class="mark">답변</span>
															<p>메디밸류입니다.<br>반품 처리 진행해드리겠습니다.<br>감사합니다.</p>
														</div>
													</div>
												</li>
											
												<li class="td">
													<div class="td_list clear">
														<p class="one_td1">4</p>
														<p class="one_td2">A/S문의</p>
														<p class="one_td3">구매 건 일부 반품 요청합니다.</p>
														<p class="one_td4"><span>이엘치과이엘치과이엘치과이엘치과이엘치과</span></p>
														<p class="one_td5">2021.09.28</p>
														<p class="one_td6">답변대기중</p>
													</div>
	
													<div class="td_content">
														<div class="td_ques">
															<h5>주문내역 [TITAN X 외 3건]</h5>
															<div class="img"><img src="/resources/images/main/counsel_img.jpg" width="462" height="261" border="0" alt="" /></div>
															<p>물건이 잘못 배송되었습니다.<br>반품바랍니다.</p>
															<div class="clear">
																<div class="util_wrap clear">
																	<button class="modi_btn">수정</button>
																	<button class="delete_btn">삭제</button>
																</div>
															</div>
														</div>
	
														<div class="td_answ">
															<span class="mark">답변</span>
															<p>메디밸류입니다.<br>반품 처리 진행해드리겠습니다.<br>감사합니다.</p>
														</div>
													</div>
												</li>
											
												<li class="td">
													<div class="td_list clear">
														<p class="one_td1">3</p>
														<p class="one_td2">A/S문의</p>
														<p class="one_td3">구매 건 일부 반품 요청합니다.</p>
														<p class="one_td4"><span>이엘치과</span></p>
														<p class="one_td5">2021.09.28</p>
														<p class="one_td6">답변대기중</p>
													</div>
	
													<div class="td_content">
														<div class="td_ques">
															<h5>주문내역 [TITAN X 외 3건]</h5>
															<div class="img"><img src="/resources/images/main/counsel_img.jpg" width="462" height="261" border="0" alt="" /></div>
															<p>물건이 잘못 배송되었습니다.<br>반품바랍니다.</p>
															<div class="clear">
																<div class="util_wrap clear">
																	<button class="modi_btn">수정</button>
																	<button class="delete_btn">삭제</button>
																</div>
															</div>
														</div>
	
														<div class="td_answ">
															<span class="mark">답변</span>
															<p>메디밸류입니다.<br>반품 처리 진행해드리겠습니다.<br>감사합니다.</p>
														</div>
													</div>
												</li>
											
												<li class="td">
													<div class="td_list clear">
														<p class="one_td1">2</p>
														<p class="one_td2">A/S문의</p>
														<p class="one_td3">구매 건 일부 반품 요청합니다.</p>
														<p class="one_td4"><span>이엘치과</span></p>
														<p class="one_td5">2021.09.28</p>
														<p class="one_td6">답변대기중</p>
													</div>
	
													<div class="td_content">
														<div class="td_ques">
															<h5>주문내역 [TITAN X 외 3건]</h5>
															<div class="img"><img src="/resources/images/main/counsel_img.jpg" width="462" height="261" border="0" alt="" /></div>
															<p>물건이 잘못 배송되었습니다.<br>반품바랍니다.</p>
															<div class="clear">
																<div class="util_wrap clear">
																	<button class="modi_btn">수정</button>
																	<button class="delete_btn">삭제</button>
																</div>
															</div>
														</div>
	
														<div class="td_answ">
															<span class="mark">답변</span>
															<p>메디밸류입니다.<br>반품 처리 진행해드리겠습니다.<br>감사합니다.</p>
														</div>
													</div>
												</li>
											
												<li class="td">
													<div class="td_list clear">
														<p class="one_td1">1</p>
														<p class="one_td2">A/S문의</p>
														<p class="one_td3">구매 건 일부 반품 요청합니다.</p>
														<p class="one_td4"><span>이엘치과</span></p>
														<p class="one_td5">2021.09.28</p>
														<p class="one_td6 on">답변완료</p>
													</div>
	
													<div class="td_content">
														<div class="td_ques">
															<h5>주문내역 [TITAN X 외 3건]</h5>
															<div class="img"><img src="/resources/images/main/counsel_img.jpg" width="462" height="261" border="0" alt="" /></div>
															<p>물건이 잘못 배송되었습니다.<br>반품바랍니다.</p>
															<div class="clear">
																<div class="util_wrap clear">
																	<button class="modi_btn">수정</button>
																	<button class="delete_btn">삭제</button>
																</div>
															</div>
														</div>
	
														<div class="td_answ">
															<span class="mark">답변</span>
															<p>메디밸류입니다.<br>반품 처리 진행해드리겠습니다.<br>감사합니다.</p>
														</div>
													</div>
												</li>
											</ul>
										</div>
	
										<div class="delete_popup">
											<button class="dep_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>
											<h5>게시물을 삭제하시겠습니까?</h5>
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
										<button class="write_btn">글쓰기</button>
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