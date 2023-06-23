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

			$(document).ready(function (){
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
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub3_2" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<h3>내 계정</h3>
							
								<ul>
									<li class="on"><button>주문배송 조회</button></li>
									<li><button>배송지관리</button></li>
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
										<h4>주문내역 상세</h4>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<h5>[주문내역] TITAN X 외 2</h5>
										
										<div class="sp_pd_wrap pd_wrap">
											<div class="sp_pd_tit pd_tit clear">
												<h6>특가제품</h6>
												<p>판매자 : <button><span>(주)리뉴메디칼</span><img src="/resources/images/main/info_icon2.jpg" width="16" height="16" border="0" alt="" /></button></p>
	
												<div class="store_popup">
													<button class="store_pu_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>
	
													<div class="spu_tab_split">
														<ul class="spu_tab_btn clear">
															<li class="spu_tab_tab1 on"><button>판매점 정보</button></li>
															<li class="spu_tab_tab2"><button>판매점 공지</button></li>
															<li class="spu_tab_tab3"><button>취소&middot;반품</button></li>
														</ul>
	
														<div class="spu_tab_cnt">
															<div class="spu_tab_cnt1">
																<ul>
																	<li class="clear">
																		<h6>판매점</h6>
																		<p>(주)리뉴메티칼</p>
																	</li>
	
																	<li class="clear">
																		<h6>영업시간</h6>
																		<p>am9:00 ~ pm6:00</p>
																	</li>
	
																	<li class="clear">
																		<h6>이메일</h6>
																		<p>renew-medical@hanmail.net</p>
																	</li>
	
																	<li class="clear">
																		<h6>전화번호</h6>
																		<p>01052316724</p>
																	</li>
	
																	<li class="clear">
																		<h6>휴무일</h6>
																		<p>토요일 12시까지 운영, 일요일, 공휴일 휴무</p>
																	</li>
	
																	<li class="clear">
																		<h6>배송방법</h6>
																		<p>택배, 퀵서비스, 직접수령</p>
																	</li>
	
																	<li class="clear">
																		<h6>주소</h6>
																		<p>경기도 부천시 오정로 40 2~3층 리뉴메디칼</p>
																	</li>
																</ul>
															</div>
	
															<div class="spu_tab_cnt2">
																<ul>
																	<li class="clear">
																		<p>[공지] 퀵서비스와 방문수령 관련 안내 사항</p>
																	</li>
	
																	<li class="clear">
																		<p>[공지] 퀵서비스와 방문수령 관련 안내 사항</p>
																	</li>
	
																	<li class="clear">
																		<p>[공지] 퀵서비스와 방문수령 관련 안내 사항</p>
																	</li>
	
																	<li class="clear">
																		<p>[공지] 퀵서비스와 방문수령 관련 안내 사항</p>
																	</li>
	
																	<li class="clear">
																		<p>[공지] 퀵서비스와 방문수령 관련 안내 사항</p>
																	</li>
	
																	<li class="clear">
																		<p>[공지] 퀵서비스와 방문수령 관련 안내 사항</p>
																	</li>
	
																	<li class="clear">
																		<p>[공지] 퀵서비스와 방문수령 관련 안내 사항</p>
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
																		<p>renew-medical@hanmail.net</p>
																	</li>
	
																	<li class="clear">
																		<h6>전화번호</h6>
																		<p>01052316724</p>
																	</li>
	
																	<li class="clear">
																		<h6>휴무일</h6>
																		<p>토요일 12시까지 운영, 일요일, 공휴일 휴무</p>
																	</li>
	
																	<li class="clear">
																		<h6>배송방법</h6>
																		<p>택배, 퀵서비스, 직접수령</p>
																	</li>
	
																	<li class="clear">
																		<h6>주소</h6>
																		<p>경기도 부천시 오정로 40 2~3층 리뉴메디칼</p>
																	</li>
																</ul>
	
																<a href="" class="one_inq">판매점 1:1문의하기</a>
																<p>판매점에 문의하시면 빠른 답변 가능합니다.</p>
															</div>
														</div>
													</div>
	
													<button class="store_pu_ok">확인</button>
												</div>
											</div>
										
											<div class="sp_pd_list pd_list">
												<ul class="rt_c1_depth1">
													<li class="clear">
														<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
										
														<div class="pd_info">
															<ul class="rt_depth2 clear">
																<li class="rt_depth2_li1 clear">
																	<h6>제품명</h6>
																	<p>TITAN X TITAN X TITAN X TITAN X TITAN X TITAN X TITAN X TITAN X TITAN X TITAN X TITAN X TITAN X TITAN X TITAN X TITAN X TITAN X TITAN X TITAN X</p>
																</li>
																
																<li class="rt_depth2_li2 clear">
																	<h6>규격</h6>
																	<p>0.5g  /  0.8cc (05-0210)</p>
																</li>
	
																<li class="rt_depth2_li3 clear">
																	<h6>수량</h6>
																	<p>1개</p>
																</li>
																
																<li class="rt_depth2_li4 clear">
																	<h6>가격</h6>
																	<p>32,000원</p>
																</li>
																<li class="rt_depth2_li5 clear">
																	<h6>배송현황</h6>
																	<p>배송완료</p>
																</li>
															</ul>
														</div>
										
														<div class="btn_wrap">
															<button class="buy_btn">바로구매</button>
															<button class="cart_btn">장바구니 담기</button>
														</div>
													</li>
										
													<li class="clear">
														<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
										
														<div class="pd_info">
															<ul class="rt_depth2 clear">
																<li class="rt_depth2_li1 clear">
																	<h6>제품명</h6>
																	<p>TITAN X</p>
																</li>
																
																<li class="rt_depth2_li2 clear">
																	<h6>규격</h6>
																	<p>0.5g  /  0.8cc (05-0210)</p>
																</li>
	
																<li class="rt_depth2_li3 clear">
																	<h6>수량</h6>
																	<p>1개</p>
																</li>
																
																<li class="rt_depth2_li4 clear">
																	<h6>가격</h6>
																	<p>32,000원</p>
																</li>
																<li class="rt_depth2_li5 clear">
																	<h6>배송현황</h6>
																	<p>배송완료</p>
																</li>
															</ul>
														</div>
										
														<div class="btn_wrap">
															<button class="buy_btn">바로구매</button>
															<button class="cart_btn">장바구니 담기</button>
														</div>
													</li>
										
													<li class="clear">
														<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
										
														<div class="pd_info">
															<ul class="rt_depth2 clear">
																<li class="rt_depth2_li1 clear">
																	<h6>제품명</h6>
																	<p>TITAN X</p>
																</li>
																
																<li class="rt_depth2_li2 clear">
																	<h6>규격</h6>
																	<p>0.5g  /  0.8cc (05-0210)</p>
																</li>
	
																<li class="rt_depth2_li3 clear">
																	<h6>수량</h6>
																	<p>1개</p>
																</li>
																
																<li class="rt_depth2_li4 clear">
																	<h6>가격</h6>
																	<p>32,000원</p>
																</li>
																<li class="rt_depth2_li5 clear">
																	<h6>배송현황</h6>
																	<p>배송완료</p>
																</li>
															</ul>
														</div>
										
														<div class="btn_wrap">
															<button class="buy_btn">바로구매</button>
															<button class="cart_btn">장바구니 담기</button>
														</div>
													</li>
										
													<li class="clear">
														<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
										
														<div class="pd_info">
															<ul class="rt_depth2 clear">
																<li class="rt_depth2_li1 clear">
																	<h6>제품명</h6>
																	<p>TITAN X</p>
																</li>
																
																<li class="rt_depth2_li2 clear">
																	<h6>규격</h6>
																	<p>0.5g  /  0.8cc (05-0210)</p>
																</li>
	
																<li class="rt_depth2_li3 clear">
																	<h6>수량</h6>
																	<p>1개</p>
																</li>
																
																<li class="rt_depth2_li4 clear">
																	<h6>가격</h6>
																	<p>32,000원</p>
																</li>
																<li class="rt_depth2_li5 clear">
																	<h6>배송현황</h6>
																	<p>배송완료</p>
																</li>
															</ul>
														</div>
										
														<div class="btn_wrap">
															<button class="buy_btn">바로구매</button>
															<button class="cart_btn">장바구니 담기</button>
														</div>
													</li>
										
													<li class="clear">
														<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
										
														<div class="pd_info">
															<ul class="rt_depth2 clear">
																<li class="rt_depth2_li1 clear">
																	<h6>제품명</h6>
																	<p>TITAN X</p>
																</li>
																
																<li class="rt_depth2_li2 clear">
																	<h6>규격</h6>
																	<p>0.5g  /  0.8cc (05-0210)</p>
																</li>
	
																<li class="rt_depth2_li3 clear">
																	<h6>수량</h6>
																	<p>1개</p>
																</li>
																
																<li class="rt_depth2_li4 clear">
																	<h6>가격</h6>
																	<p>32,000원</p>
																</li>
																<li class="rt_depth2_li5 clear">
																	<h6>배송현황</h6>
																	<p>배송완료</p>
																</li>
															</ul>
														</div>
										
														<div class="btn_wrap">
															<button class="buy_btn">바로구매</button>
															<button class="cart_btn">장바구니 담기</button>
														</div>
													</li>
										
													<li class="clear">
														<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
										
														<div class="pd_info">
															<ul class="rt_depth2 clear">
																<li class="rt_depth2_li1 clear">
																	<h6>제품명</h6>
																	<p>TITAN X</p>
																</li>
																
																<li class="rt_depth2_li2 clear">
																	<h6>규격</h6>
																	<p>0.5g  /  0.8cc (05-0210)</p>
																</li>
	
																<li class="rt_depth2_li3 clear">
																	<h6>수량</h6>
																	<p>1개</p>
																</li>
																
																<li class="rt_depth2_li4 clear">
																	<h6>가격</h6>
																	<p>32,000원</p>
																</li>
																<li class="rt_depth2_li5 clear">
																	<h6>배송현황</h6>
																	<p>배송완료</p>
																</li>
															</ul>
														</div>
										
														<div class="btn_wrap">
															<button class="buy_btn">바로구매</button>
															<button class="cart_btn">장바구니 담기</button>
														</div>
													</li>
												</ul>
											</div>
										</div>
										
										<div class="nm_pd_wrap pd_wrap">
											<div class="nm_pd_tit pd_tit clear">
												<h6>일반제품</h6>
												<p>판매자 : <button><span>(주)메디밸류</span><img src="/resources/images/main/info_icon2.jpg" width="16" height="16" border="0" alt="" /></button></p>
	
	
												<div class="store_popup">
													<button class="store_pu_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>
	
													<div class="spu_tab_split">
														<ul class="spu_tab_btn clear">
															<li class="spu_tab_tab1 on"><button>판매점 정보</button></li>
															<li class="spu_tab_tab2"><button>판매점 공지</button></li>
															<li class="spu_tab_tab3"><button>취소&middot;반품</button></li>
														</ul>
	
														<div class="spu_tab_cnt">
															<div class="spu_tab_cnt1">
																<ul>
																	<li class="clear">
																		<h6>판매점</h6>
																		<p>(주)리뉴메티칼</p>
																	</li>
	
																	<li class="clear">
																		<h6>영업시간</h6>
																		<p>am9:00 ~ pm6:00</p>
																	</li>
	
																	<li class="clear">
																		<h6>이메일</h6>
																		<p>renew-medical@hanmail.net</p>
																	</li>
	
																	<li class="clear">
																		<h6>전화번호</h6>
																		<p>01052316724</p>
																	</li>
	
																	<li class="clear">
																		<h6>휴무일</h6>
																		<p>토요일 12시까지 운영, 일요일, 공휴일 휴무</p>
																	</li>
	
																	<li class="clear">
																		<h6>배송방법</h6>
																		<p>택배, 퀵서비스, 직접수령</p>
																	</li>
	
																	<li class="clear">
																		<h6>주소</h6>
																		<p>경기도 부천시 오정로 40 2~3층 리뉴메디칼</p>
																	</li>
																</ul>
															</div>
	
															<div class="spu_tab_cnt2">
																<ul>
																	<li class="clear">
																		<p>[공지] 퀵서비스와 방문수령 관련 안내 사항</p>
																	</li>
	
																	<li class="clear">
																		<p>[공지] 퀵서비스와 방문수령 관련 안내 사항</p>
																	</li>
	
																	<li class="clear">
																		<p>[공지] 퀵서비스와 방문수령 관련 안내 사항</p>
																	</li>
	
																	<li class="clear">
																		<p>[공지] 퀵서비스와 방문수령 관련 안내 사항</p>
																	</li>
	
																	<li class="clear">
																		<p>[공지] 퀵서비스와 방문수령 관련 안내 사항</p>
																	</li>
	
																	<li class="clear">
																		<p>[공지] 퀵서비스와 방문수령 관련 안내 사항</p>
																	</li>
	
																	<li class="clear">
																		<p>[공지] 퀵서비스와 방문수령 관련 안내 사항</p>
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
																		<p>renew-medical@hanmail.net</p>
																	</li>
	
																	<li class="clear">
																		<h6>전화번호</h6>
																		<p>01052316724</p>
																	</li>
	
																	<li class="clear">
																		<h6>휴무일</h6>
																		<p>토요일 12시까지 운영, 일요일, 공휴일 휴무</p>
																	</li>
	
																	<li class="clear">
																		<h6>배송방법</h6>
																		<p>택배, 퀵서비스, 직접수령</p>
																	</li>
	
																	<li class="clear">
																		<h6>주소</h6>
																		<p>경기도 부천시 오정로 40 2~3층 리뉴메디칼</p>
																	</li>
																</ul>
	
																<a href="" class="one_inq">판매점 1:1문의하기</a>
																<p>판매점에 문의하시면 빠른 답변 가능합니다.</p>
															</div>
														</div>
													</div>
	
													<button class="store_pu_ok">확인</button>
												</div>
											</div>
										
											<div class="nm_pd_list pd_list">
												<ul class="rt_c1_depth1">
													<li class="clear">
														<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
										
														<div class="pd_info">
															<ul class="rt_depth2 clear">
																<li class="rt_depth2_li1 clear">
																	<h6>제품명</h6>
																	<p>TITAN X</p>
																</li>
																
																<li class="rt_depth2_li2 clear">
																	<h6>규격</h6>
																	<p>0.5g  /  0.8cc (05-0210)</p>
																</li>
	
																<li class="rt_depth2_li3 clear">
																	<h6>수량</h6>
																	<p>1개</p>
																</li>
																
																<li class="rt_depth2_li4 clear">
																	<h6>가격</h6>
																	<p>32,000원</p>
																</li>
																<li class="rt_depth2_li5 clear">
																	<h6>배송현황</h6>
																	<p>배송완료</p>
																</li>
															</ul>
														</div>
										
														<div class="btn_wrap">
															<button class="buy_btn">바로구매</button>
															<button class="cart_btn">장바구니 담기</button>
														</div>
													</li>
										
													<li class="clear">
														<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
										
														<div class="pd_info">
															<ul class="rt_depth2 clear">
																<li class="rt_depth2_li1 clear">
																	<h6>제품명</h6>
																	<p>TITAN X</p>
																</li>
																
																<li class="rt_depth2_li2 clear">
																	<h6>규격</h6>
																	<p>0.5g  /  0.8cc (05-0210)</p>
																</li>
	
																<li class="rt_depth2_li3 clear">
																	<h6>수량</h6>
																	<p>1개</p>
																</li>
																
																<li class="rt_depth2_li4 clear">
																	<h6>가격</h6>
																	<p>32,000원</p>
																</li>
																<li class="rt_depth2_li5 clear">
																	<h6>배송현황</h6>
																	<p>배송완료</p>
																</li>
															</ul>
														</div>
										
														<div class="btn_wrap">
															<button class="buy_btn">바로구매</button>
															<button class="cart_btn">장바구니 담기</button>
														</div>
													</li>
	
													<li class="clear">
														<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
										
														<div class="pd_info">
															<ul class="rt_depth2 clear">
																<li class="rt_depth2_li1 clear">
																	<h6>제품명</h6>
																	<p>TITAN X</p>
																</li>
																
																<li class="rt_depth2_li2 clear">
																	<h6>규격</h6>
																	<p>0.5g  /  0.8cc (05-0210)</p>
																</li>
	
																<li class="rt_depth2_li3 clear">
																	<h6>수량</h6>
																	<p>1개</p>
																</li>
																
																<li class="rt_depth2_li4 clear">
																	<h6>가격</h6>
																	<p>32,000원</p>
																</li>
																<li class="rt_depth2_li5 clear">
																	<h6>배송현황</h6>
																	<p>배송완료</p>
																</li>
															</ul>
														</div>
										
														<div class="btn_wrap">
															<button class="buy_btn">바로구매</button>
															<button class="cart_btn">장바구니 담기</button>
														</div>
													</li>
										
													<li class="clear">
														<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
										
														<div class="pd_info">
															<ul class="rt_depth2 clear">
																<li class="rt_depth2_li1 clear">
																	<h6>제품명</h6>
																	<p>TITAN X</p>
																</li>
																
																<li class="rt_depth2_li2 clear">
																	<h6>규격</h6>
																	<p>0.5g  /  0.8cc (05-0210)</p>
																</li>
	
																<li class="rt_depth2_li3 clear">
																	<h6>수량</h6>
																	<p>1개</p>
																</li>
																
																<li class="rt_depth2_li4 clear">
																	<h6>가격</h6>
																	<p>32,000원</p>
																</li>
																<li class="rt_depth2_li5 clear">
																	<h6>배송현황</h6>
																	<p>배송완료</p>
																</li>
															</ul>
														</div>
										
														<div class="btn_wrap">
															<button class="buy_btn">바로구매</button>
															<button class="cart_btn">장바구니 담기</button>
														</div>
													</li>
	
													<li class="clear">
														<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
										
														<div class="pd_info">
															<ul class="rt_depth2 clear">
																<li class="rt_depth2_li1 clear">
																	<h6>제품명</h6>
																	<p>TITAN X</p>
																</li>
																
																<li class="rt_depth2_li2 clear">
																	<h6>규격</h6>
																	<p>0.5g  /  0.8cc (05-0210)</p>
																</li>
	
																<li class="rt_depth2_li3 clear">
																	<h6>수량</h6>
																	<p>1개</p>
																</li>
																
																<li class="rt_depth2_li4 clear">
																	<h6>가격</h6>
																	<p>32,000원</p>
																</li>
																<li class="rt_depth2_li5 clear">
																	<h6>배송현황</h6>
																	<p>배송완료</p>
																</li>
															</ul>
														</div>
										
														<div class="btn_wrap">
															<button class="buy_btn">바로구매</button>
															<button class="cart_btn">장바구니 담기</button>
														</div>
													</li>
										
													<li class="clear">
														<div class="img"><img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" /></div>
										
														<div class="pd_info">
															<ul class="rt_depth2 clear">
																<li class="rt_depth2_li1 clear">
																	<h6>제품명</h6>
																	<p>TITAN X</p>
																</li>
																
																<li class="rt_depth2_li2 clear">
																	<h6>규격</h6>
																	<p>0.5g  /  0.8cc (05-0210)</p>
																</li>
	
																<li class="rt_depth2_li3 clear">
																	<h6>수량</h6>
																	<p>1개</p>
																</li>
																
																<li class="rt_depth2_li4 clear">
																	<h6>가격</h6>
																	<p>32,000원</p>
																</li>
																<li class="rt_depth2_li5 clear">
																	<h6>배송현황</h6>
																	<p>배송완료</p>
																</li>
															</ul>
														</div>
										
														<div class="btn_wrap">
															<button class="buy_btn">바로구매</button>
															<button class="cart_btn">장바구니 담기</button>
														</div>
													</li>
												</ul>
											</div>
										</div>
										
										<div class="clear">
											<button class="all_cart">전체 상품 다시 담기</button>
										</div>
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
															<p>이엘치과</p>
														</li>
	
														<li class="clear">
															<h5>연락처</h5>
															<div class="p_wrap">
																<p>02-732-4874</p>
																<p>010-2732-4874</p>
															</div>
														</li>
	
														<li class="clear">
															<h5>이메일</h5>
															<p>kkim1102@gmail.com</p>
														</li>
													</ul>
												</div>
											</li>
	
											<li class="rt_c2_li2">
												<div class="order_info_tit clear">
													<h4>받는 사람 정보</h4>
													<p>배송 휴무일 : 빠른배송(휴무없음), 택배배송(일요일)</p>
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
															<p>이엘치과</p>
														</li>
	
														<li class="clear">
															<h5>받는주소</h5>
															<p>서울 영등포구 당산동 5가 16-31, 명화빌딩 3층</p>
														</li>
	
														<li class="clear">
															<h5>배송요청사항</h5>
															<p>직접 받고 부재 시 문 앞</p>
														</li>
													</ul>
												</div>
											</li>
	
											<li class="rt_c2_li3">
												<div class="order_info_tit clear">
													<h4>결제정보</h4>
												</div>
	
												<div class="order_info_txt">
													<ul class="rt_c2_depth2">
														<li class="clear">
															<h5>제품금액</h5>
															<p>30,160원</p>
														</li>
	
														<li class="clear">
															<h5>배송비</h5>
															<p>0원</p>
														</li>
	
														<li class="clear">
															<h5>제품할인금액</h5>
															<p>-17,831원</p>
														</li>
	
														<li class="clear">
															<h5>쿠폰할인</h5>
															<p>-3,000원</p>
														</li>
	
														<li class="clear">
															<h5>적립금사용</h5>
															<p>-3,000원</p>
														</li>
	
														<li class="clear">
															<h5>결제금액</h5>
															<p>12,000원</p>
														</li>
	
														<li class="clear">
															<h5>적립예정금액</h5>
															<p>617원</p>
														</li>
	
														<li class="clear">
															<h5>결제금액</h5>
															
															<div class="p_wrap_right">
																<div class="p_wrap pw_1 clear">
																	<p>무통장입금</p>
																	<button class="chk_stat">전표확인</button>
	
																	<div class="print_popup" style="display:none">
																		<button class="pp_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>
																		<div class="pp_tit">
																			<h3>거래명세서 인쇄 미리보기</h3>
																		</div>
	
																		<div class="pp_txt" style="position:relative;height:753px;background:#f4f4f4;overflow:auto">
																			<div class="pp_wrap page" id="printme" style="width:1216px;background:#fff;position:absolute;top:3px;left:50%;-webkit-transform:translate(-50%, 0);transform:translate(-50%, 0);color:#000;font-family:ASGM, sans-serif;padding-bottom:10px;">
																				<div class="pp_top" style="width:100%;margin:0 auto 10px;height:307px">
																					<div class="ppt_left" style="float:left;width:49%">
																						<h4 style="font-size:30px;font-family:ASGEB, sans-serif;text-align:center;line-height:1;margin-top:28px;margin-bottom:23px;height:30px">거래명세표</h4>
																						<div class="ppt_tbl">
																							<table style="border:1px solid #000;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;font-size:20px;border-left:0;width:100%;font-size:12px;border-collapse:collapse">
																								<tr style="border-bottom:1px solid #000;height:30px">
																									<th rowspan="7" class="tg_th" style="background:#e8e8e8;width:45px;text-align:center;font-size:16px;line-height:1.3;border:1px solid #000;">공<br>급<br>자</th>
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">등록번호</th>
																									<td colspan="3" style="padding-left:7px">일이삼사오육칠팔</td>
																								</tr>
																				
																								<tr style="border-bottom:1px solid #000;height:30px">
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">상호</th>
																									<td style="padding-left:7px">일이삼사오육칠팔</td>
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">성명</th>
																									<td style="padding-left:7px">김김김</td>
																								</tr>
																				
																								<tr style="border-bottom:1px solid #000;height:30px">
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">주소</th>
																									<td colspan="3" style="padding-left:7px">서울 영등포구 국제금융로 7길</td>
																								</tr>
																				
																								<tr style="border-bottom:1px solid #000;height:30px">
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">업태</th>
																									<td style="padding-left:7px">일이삼사오육칠팔</td>
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">종목</th>
																									<td style="padding-left:7px">의료서비스</td>
																								</tr>
																				
																								<tr style="border-bottom:1px solid #000;height:30px">
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">전화</th>
																									<td style="padding-left:7px">02-0000-0000</td>
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">팩스</th>
																									<td style="padding-left:7px">0000-0000</td>
																								</tr>
																				
																								<tr style="border-bottom:1px solid #000;height:30px">
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">이메일</th>
																									<td colspan="3" style="padding-left:7px">name@gmail.com</td>
																								</tr>
																							</table>
																				
																							<div class="tbl_box clear" style="width:100%;border:1px solid #000;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;height:34px;line-height:34px;margin-top:10px;font-family:ASGB, sans-serif;overflow:hidden;">
																								<div class="tbl_tit" style="float:left;width:160px;border-right:1px solid #000;text-align:center;font-size:16px">주문일자</div>
																								<div class="tbl_txt" style="float:left;padding-left:11px;font-size:14px;font-family:ASGM, sans-serif;">2020-03-12</div>
																							</div>
																						</div>
																					</div>
																				
																					<div class="ppt_right" style="float:left;width:49%;margin-left:2%">
																						<h4 style="text-align:center;line-height:1;margin-top:28px;margin-bottom:23px;height:30px"><img src="/resources/images/main/hd_logo.jpg" width="125" height="30" border="0" alt="" /></h4>
																						<div class="ppt_tbl">
																							<table style="border:1px solid #000;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;font-size:20px;border-left:0;width:100%;font-size:12px;border-collapse:collapse">
																								<tr style="border-bottom:1px solid #000;height:30px;">
																									<th rowspan="7" class="tg_th" style="background:#e8e8e8;width:45px;text-align:center;font-size:16px;line-height:1.3;border:1px solid #000;">공<br>급<br>받<br>는<br>자</th>
																									<th style="width:70px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">등록번호</th>
																									<td colspan="3" style="padding-left:7px">일이삼사오육칠팔</td>
																								</tr>
																				
																								<tr style="border-bottom:1px solid #000;height:30px">
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">상호</th>
																									<td style="padding-left:7px">일이삼사오육칠팔</td>
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">성명</th>
																									<td style="padding-left:7px">김김김</td>
																								</tr>
																				
																								<tr style="border-bottom:1px solid #000;height:30px">
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">주소</th>
																									<td colspan="3" style="padding-left:7px">서울 영등포구 국제금융로 7길</td>
																								</tr>
																				
																								<tr style="border-bottom:1px solid #000;height:30px">
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">업태</th>
																									<td style="padding-left:7px">일이삼사오육칠팔</td>
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">종목</th>
																									<td style="padding-left:7px">의료서비스</td>
																								</tr>
																				
																								<tr style="border-bottom:1px solid #000;height:30px">
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">전화</th>
																									<td style="padding-left:7px">02-0000-0000</td>
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">팩스</th>
																									<td style="padding-left:7px">0000-0000</td>
																								</tr>
																				
																								<tr style="border-bottom:1px solid #000;height:30px">
																									<th style="width:60px;text-align:center;border-right:1px solid #000;border-left:1px solid #000;font-weight:normal;font-family:ASGB, sans-serif;">이메일</th>
																									<td colspan="3" style="padding-left:7px">name@gmail.com</td>
																								</tr>
																							</table>
																				
																							<div class="tbl_box clear" style="width:100%;border:1px solid #000;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;height:34px;line-height:34px;margin-top:10px;font-family:ASGB, sans-serif;overflow:hidden;">
																								<div class="tbl_tit" style="float:left;width:160px;border-right:1px solid #000;text-align:center;font-size:16px">주문일자</div>
																								<div class="tbl_txt" style="float:left;padding-left:11px;font-size:14px;font-family:ASGM, sans-serif;">2020-03-12</div>
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
																								<th style="border-left:1px solid #000;text-align:center;font-size:14px;font-weight:normal;font-family:ASGB, sans-serif">규격</th>
																								<th style="border-left:1px solid #000;text-align:center;font-size:14px;font-weight:normal;font-family:ASGB, sans-serif">포장단위</th>
																								<th style="border-left:1px solid #000;text-align:center;font-size:14px;font-weight:normal;font-family:ASGB, sans-serif">수량</th>
																								<th style="border-left:1px solid #000;text-align:center;font-size:14px;font-weight:normal;font-family:ASGB, sans-serif">단가</th>
																								<th style="border-left:1px solid #000;text-align:center;font-size:14px;font-weight:normal;font-family:ASGB, sans-serif">금액</th>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔구십일십이</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">일이삼사오육칠팔</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																								<td style="border-left:1px solid #000;text-align:center;font-size:12px;font-family:ASGM, sans-serif">0000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td rowspan="3" colspan="5" style="border-left:1px solid #000;text-align:center;font-size:18px;font-family:ASGM, sans-serif">
																									<h4 style="font-size:11px;font-family:ASGEB, sans-serif">입금계좌 안내</h4>
																									<p style="font-size:14px">하나은행 123-45-456789</p>
																									<p style="font-size:14px">(주)메디밸류</p>
																								</td>
																								<td colspan="2" style="border-left:1px solid #000;text-align:center;font-family:ASGM, sans-serif">구매 합계</td>
																								<td colspan="2" style="border-left:1px solid #000;text-align:center;font-family:ASGM, sans-serif">00000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td colspan="2" style="border-left:1px solid #000;text-align:center;font-family:ASGM, sans-serif">배송비</td>
																								<td colspan="2" style="border-left:1px solid #000;text-align:center;font-family:ASGM, sans-serif">00000000000</td>
																							</tr>
																				
																							<tr style="border-bottom:1px solid #000;height:30px;line-height:30px">
																								<td colspan="2" style="border-left:1px solid #000;text-align:center;font-family:ASGM, sans-serif">결제금액</td>
																								<td colspan="2" style="border-left:1px solid #000;text-align:center;font-family:ASGM, sans-serif">00000000000</td>
																							</tr>
																						</table>
																					</div>
																				</div>
	
																				<div class="pp_btm clear" style="width:100%;margin:10px auto 0;border:1px solid #000;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box">
																					<div class="ppb_tbl">
																						<table style="width:100%;border-collapse:collapse">
																							<tr style="width:100%">
																								<th style="font-size:16px;width:10%;text-align:center;border-right:1px solid #000">비고</th>
																								<td style="font-size:12px;line-height:1.5;padding:10px;width:90%">내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내내용</td>
																							</tr>
																						</table>
																					</div>
																				</div>
																			</div>
																		</div>
	
																		<div class="pp_btn">
																			<input class="pp_btn1" type="button" value="인쇄하기" id="print" onclick="javascript:printIt(document.getElementById('printme').innerHTML)"/>
																			<button class="pp_btn2">닫기</button>
																		</div>
																	</div>
																</div>
																
																<div class="p_wrap pw_2 clear">
																	<h6>계좌번호</h6>
																	<p>85-871674-841358-82</p>
																	<button class="copy_btn">복사하기</button>
																</div>
																
																<div class="p_wrap pw_3 clear">
																	<h6>계좌은행</h6>
																	<p>국민은행</p>
																</div>
	
																<div class="p_wrap pw_4 clear">
																	<h6>계좌명</h6>
																	<p>메디밸류</p>
																</div>
															</div>
														</li>
													</ul>
												</div>
											</li>
	
											<li class="rt_c2_li4">
												<div class="order_info_tit clear">
													<h4>세금계산서 정보</h4>
												</div>
	
												<div class="order_info_txt">
													<ul class="rt_c2_depth2">
														<li class="clear">
															<h5>세금계산서 신청</h5>
															<p>신청</p>
														</li>
	
														<li class="clear">
															<h5>사업자번호</h5>
															<p>1234567890</p>
														</li>
	
														<li class="clear">
															<h5>회사명</h5>
															<p>이엘치과</p>
														</li>
	
														<li class="clear">
															<h5>대표자명</h5>
															<p>김건우</p>
														</li>
	
														<li class="clear">
															<h5>업태</h5>
															<p>요양</p>
														</li>
	
														<li class="clear">
															<h5>종목</h5>
															<p>치과</p>
														</li>
	
														<li class="clear">
															<h5>이메일</h5>
															<p>kkim1102@gmail.com</p>
														</li>
													</ul>
												</div>
											</li>
										</ul>
	
										<div class="clear">
											<button class="order_confirm">주문확인</button>
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