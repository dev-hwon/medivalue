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
				var $s33OitBtn=$("#sub3_3 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .order_info_txt .depth1 > li .box .down_btn");
				var $s33storeBtn=$("#sub3_3 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .order_info_txt .depth1 > li .box .store_btn");
				var $s33storeClose=$("#sub3_3 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .order_info_txt .depth1 > li .box .store_popup .store_pu_close");
	
				$s33storeBtn.on("click", function  () {
					$(this).next().css("display","block");
					$("#black").css("display","block");
				});
	
				$s33storeClose.on("click", function  () {
					$(this).parent().css("display","none");
					$("#black").css("display","none");
				});
	
				$("#sub3_3 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .order_info_txt .depth1 > li .box .store_popup .store_pu_ok").on("click", function  () {
					$s33storeClose.click()
				});
	
				$("#black").on("click", function  () {
					$s33storeClose.click()
				});
	
				$("#sub3_3 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .order_info_txt .depth1 > li .box .store_popup .spu_tab_split .spu_tab_btn > li button").on("click", function  () {
					var tgIdx=$(this).parent().index();
	
					$(this).parent().addClass("on").siblings().removeClass("on");
					$(this).closest(".spu_tab_split").find(">.spu_tab_cnt>div").eq(tgIdx).show().siblings().hide();
					
					return false;
				});
	
				$s33OitBtn.on("click", function  () {
					if ($(this).hasClass("on")) {
						$(this).removeClass("on").css("transform","scaleY(1)").parent().next(".box_detail").stop().slideUp();
					}else {
						$(this).addClass("on").css("transform","scaleY(-1)").parent().next(".box_detail").stop().slideDown();
					}
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub3_3" class="sub">
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
										<h4>배송 조회</h4>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<div class="order_info_txt">
											<ul class="depth1">
												<li class="spe_offer">
													<h5>배송 2건 중 1</h5>
													<div class="box clear">
														<h6><img src="/resources/images/main/sale_per.jpg" width="140" height="140" border="0" alt="" />특가제품</h6>
														<strong>9월 28일(화) 도착예정입니다.</strong>
														<button class="store_btn">판매자 : <span>오라피트</span></button>
	
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
	
														<button class="down_btn"><img src="/resources/images/main/sale_down.jpg" width="57" height="32" border="0" alt="" /></button>
													</div>
	
													<div class="box_detail">
														<ul>
															<li class="clear">
																<h6>배송업체</h6>
																<p>대한통운</p>
															</li>
	
															<li class="clear">
																<h6>송장번호</h6>
																<div class="p_wrap clear">
																	<button>0123456789012345</button>
																	<button>0123456789012345</button>
																	<button>0123456789012345</button>
																</div>
															</li>
	
															<li class="clear">
																<h6>담당자</h6>
																<p>한동운</p>
															</li>
	
															<li class="clear">
																<h6>연락처</h6>
																<p>010-5784-8754</p>
															</li>
														</ul>
													</div>
												</li>
	
												<li class="norm_offer">
													<h5>배송 2건 중 2</h5>
													<div class="box clear">
														<h6><img src="/resources/images/main/normal_per.jpg" width="140" height="140" border="0" alt="" />일반제품</h6>
														<strong>9월 29일(수) 도착예정입니다.</strong>
														<button class="store_btn">판매자 : <span>메디밸류</span></button>
	
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
	
														<button class="down_btn"><img src="/resources/images/main/sale_down.jpg" width="57" height="32" border="0" alt="" /></button>
													</div>
	
													<div class="box_detail">
														<ul>
															<li class="clear">
																<h6>배송업체</h6>
																<p>대한통운</p>
															</li>
	
															<li class="clear">
																<h6>송장번호</h6>
																<div class="p_wrap clear">
																	<button>0123456789012345</button>
																	<button>0123456789012345</button>
																	<button>0123456789012345</button>
																</div>
															</li>
	
															<li class="clear">
																<h6>담당자</h6>
																<p>한동운</p>
															</li>
	
															<li class="clear">
																<h6>연락처</h6>
																<p>010-5784-8754</p>
															</li>
														</ul>
													</div>
												</li>
											</ul>
										</div>
									</div>
	
									<div class="rt_cnt2">
										<div class="order_info_tit clear">
											<h4>받는사람</h4>
										</div>
	
										<div class="order_info_txt">
											<ul class="">
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
	
												<li class="clear">
													<h5>연락처</h5>
													<p>02)842-8985, 010-8763-6635</p>
												</li>
											</ul>
										</div>
									</div>
	
									<div class="clear">
										<button class="order_list_go">주문목록으로</button>
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