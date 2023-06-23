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
		<script type="text/javascript" src="/resources/js/sub2.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				var $floatingBox2=$("#sub2_2 .cnt3 .area .real_area .right .floating_box2");
	
				$(window).on("scroll", function  () {
					$(window).on("resize",function  () {
						var scrollY=$(this).scrollTop();
						var posY=$("#sub2_2 .cnt3 .area .real_area .left .depth1 li.c3_li1").offset().top;
						var s22C3Y=$("#sub2_2 .cnt3").offset().top;
						var s22C4Y=$("#sub2_2 .cnt4").offset().top;
						var pbH2=$floatingBox2.outerHeight();
						var pbtg2=s22C4Y-pbH2-99;
						
	
						if (scrollY>posY-98){
							$floatingBox2.css({"position":"fixed","top":"98px","z-index":"9","bottom":"auto"});
							$("#header .top").css({"position":"absolute","top":posY-98})
						}else if (scrollY<posY-98) {
							$floatingBox2.css({"position":"static"});
						}
	
						if (scrollY>pbtg2-100) {
							$floatingBox2.css({"position":"absolute","top":"auto","bottom":"0"});
						}
					});
					$(window).trigger("resize");
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub2_2" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<h3>주문결제</h3>
	
						<div class="order_pd">
							<div class="order_pd_tit clear">
								<h4>주문상품</h4>
								<button><img src="/resources/images/main/order_pd_btn.jpg" width="48" height="28" border="0" alt="" /></button>
							</div>
	
							<div class="order_pd_detail">
								<div class="cart_pd sale_pd">
									<div class="cart_pd_tit sale_pd_tit clear">
										<h4>특가제품</h4>
									</div>
	
									<div class="cart_pd_list sale_pd_list">
										<ul>
											<li class="clear">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
												</div>
	
												<div class="info">
													<div class="info_box">
														<h4 class="pd_tit">TITAN X (타이탄엑스) 0.1g Bone substitu Regenerating bone Ren Regenerating bone, Renewing lives Regenerating bone, Renewing lives</h4>
														<p class="standard">[규격] 0.5g  /  0.8cc (05-0210)</p>
														<div class="mp_wrap clear">
															<p class="manu">제조사ㅣ리뉴메디칼</p>
															<p class="pack">포장단위ㅣea</p>
														</div>
													</div>
												</div>
	
												<div class="manu_p">
													<p>오라피트</p>
												</div>
	
												<div class="ship_p">
													<p>9/28(화) 도착예정</p>
												</div>
	
												<div class="pack_p">
													<p>1개</p>
												</div>
	
												<div class="price_p">
													<p>0,000,000원</p>
												</div>
											</li>

											<li class="clear">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
												</div>
	
												<div class="info">
													<div class="info_box">
														<h4 class="pd_tit">TITAN X (타이탄엑스) 0.1g Bone substitu Regenerating bone Ren Regenerating bone, Renewing lives Regenerating bone, Renewing lives</h4>
														<p class="standard">[규격] 0.5g  /  0.8cc (05-0210)</p>
														<div class="mp_wrap clear">
															<p class="manu">제조사ㅣ리뉴메디칼</p>
															<p class="pack">포장단위ㅣea</p>
														</div>
													</div>
												</div>
	
												<div class="manu_p">
													<p>오라피트</p>
												</div>
	
												<div class="ship_p">
													<p>9/28(화) 도착예정</p>
												</div>
	
												<div class="pack_p">
													<p>1개</p>
												</div>
	
												<div class="price_p">
													<p>0,000,000원</p>
												</div>
											</li>
										</ul>
									</div>
								</div>
	
								<div class="cart_pd normal_pd">
									<div class="cart_pd_tit sale_pd_tit clear">
										<h4>일반제품</h4>
									</div>
	
									<div class="cart_pd_list normal_pd_list">
										<ul>
											<li class="clear">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
												</div>
	
												<div class="info">
													<div class="info_box">
														<h4 class="pd_tit">TITAN X (타이탄엑스) 0.1g Bone substitu Regenerating bone Ren Regenerating bone, Renewing lives Regenerating bone, Renewing lives</h4>
														<p class="standard">[규격] 0.5g  /  0.8cc (05-0210)</p>
														<div class="mp_wrap clear">
															<p class="manu">제조사ㅣ리뉴메디칼</p>
															<p class="pack">포장단위ㅣea</p>
														</div>
													</div>
												</div>
	
												<div class="manu_p">
													<p>메디밸류</p>
												</div>
	
												<div class="ship_p">
													<p>9/28(화) 도착예정</p>
												</div>
	
												<div class="pack_p">
													<p>1개</p>
												</div>
	
												<div class="price_p">
													<p>0,000,000원</p>
												</div>
											</li>
	
											<li class="clear">
												<div class="img">
													<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
												</div>
	
												<div class="info">
													<div class="info_box">
														<h4 class="pd_tit">TITAN X (타이탄엑스) 0.1g Bone substitu Regenerating bone Ren Regenerating bone, Renewing lives Regenerating bone, Renewing lives</h4>
														<p class="standard">[규격] 0.5g  /  0.8cc (05-0210)</p>
														<div class="mp_wrap clear">
															<p class="manu">제조사ㅣ리뉴메디칼</p>
															<p class="pack">포장단위ㅣea</p>
														</div>
													</div>
												</div>
	
												<div class="manu_p">
													<p>메디밸류</p>
												</div>
	
												<div class="ship_p">
													<p>9/28(화) 도착예정</p>
												</div>
	
												<div class="pack_p">
													<p>1개</p>
												</div>
	
												<div class="price_p">
													<p>0,000,000원</p>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
							
							<div class="order_pd_txt">
								<h5>TITAN X 외 <span>3개</span> 상품을 주문합니다.</h5>
								<p>주문은 <span>2번</span>에 나누어서 배송합니다.</p>
							</div>
						</div>
					</div>
				</div>
			</article>
	
			<article class="cnt2">
				<div class="area">
					<div class="real_area">
						<ul class="depth1">
							<li class="c2_li1">
								<div class="order_info_tit clear">
									<h4>주문자</h4>
									<p>주문자 정보입니다.</p>
								</div>
	
								<div class="order_info_txt">
									<ul class="depth2">
										<li class="clear">
											<h5>보내는 분</h5>
											<p>이엘치과</p>
										</li>
	
										<li class="clear">
											<h5>휴대폰</h5>
											<p>01037320792</p>
										</li>
	
										<li class="clear">
											<h5>이메일</h5>
											<p>eldent@gmail.com</p>
										</li>
									</ul>
								</div>
							</li>
	
							<li class="c2_li2">
								<div class="order_info_tit clear">
									<h4>배송정보</h4>
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
									<ul class="depth2">
										<li class="clear oit_1">
											<h5>배송지</h5>
											<div class="p_wrap">
												<h6>기본배송지</h6>
												<p>서울 영등포구 당산동 5가 16-3</p>
											</div>
										</li>
	
										<li class="clear oit_2">
											<h5>상세정보</h5>
	
											<div class="p_wrap_right">
												<div class="p_wrap pw_1 clear">
													<p>이엘치과, 02-2671-2755</p>
												</div>
												
												<div class="p_wrap pw_2 clear">
													<h6>배송요청사항</h6>
													<div class="pw_2_wrap">
														<div class="form_cont">
															<label for="selboxDirect"></label>
															<input type="text" id="selboxDirect" placeholder="요청사항을 직접 입력해주세요." name="selboxDirect" class="non_tar">
															<button class="ship_req_btn"><img src="/resources/images/main/cart_down.jpg" width="10" height="6" border="0" alt="" /></button>
														</div>
	
														<div id="selectDiv2">
															<ul>
																<li class="ship_req1"><p>배송요청사항 입력하기.</p></li>
																<li class="ship_req2"><p>배송 전 연락 부탁드립니다.</p></li>
																<li class="ship_req3"><p>부재시 경비실에 맡겨주세요.</p></li>
																<li class="ship_req4"><p>부재시 전화 주시거나 문자 남겨주세요.</p></li>
																<li class="ship_req5"><p>안전한 배송 부탁드립니다.</p></li>
															</ul>
														</div>
													</div>
													<div class="ship_req">
														<input type="text">
													</div>
												</div>
												
												<div class="p_wrap pw_3 clear">
													<h6>배송완료 메시지</h6>
													<p>배송직후</p>
												</div>
												
												<div class="p_wrap pw_4 clear">
													<h6>배송희망시간</h6>
													<p>오전 10:00 ~</p>
												</div>
											</div>
										</li>
									</ul>
								</div>
	
								<button class="ship_modi">수정하기</button>
							</li>
						</ul>
					</div>
				</div>
			</article>
	
			<article class="cnt3">
				<div class="area">
					<div class="real_area clear">
						<div class="left">
							<ul class="depth1">
								<li class="c3_li1">
									<div class="order_info_tit clear">
										<h4>쿠폰 / 메디밸류 포인트</h4>
										<p>쿠폰과 메디밸류 포인트 정보입니다.</p>
									</div>
	
									<div class="order_info_txt">
										<ul class="depth2">
											<li class="clear oit_1">
												<h5>쿠폰 적용</h5>
												<div class="p_wrap">
													<div id="selectDiv" class="">
														<button class="coupon_btn"><img src="/resources/images/main/cart_down.jpg" width="12" height="7" border="0" alt="" /></button>
														<div id="selectTit"><p class="non_tar">사용 가능 쿠폰 1개 / 전체 2개</p></div>
														<ul>
															<li class="coupon1 no_cp clear">
																<div class="cp_rdo">
																	<input id="cpRdo1" type="radio" name="cp_rds">
																	<label for="cpRdo1">쿠폰 적용 안 함</label>
																</div>
															</li>
	
															<li class="coupon2 not_cp clear">
																<div class="cp_rdo">
																	<input id="cpRdo2" type="radio" name="cp_rds" disabled>
																	<label for="cpRdo2">사용불가</label>
																</div>
	
																<div class="cp_info">
																	<h6>[메디밸류 가을대전] 위생용품 20%(최대1만원)</h6>
																	<p>위생용품 20%(최대1만원 ~ 10/3 오전 11시)</p>
																	<p>유효기간 2021-10-03까지</p>
																</div>
															</li>
	
															<li class="coupon3 norm_cp clear">
																<div class="cp_rdo">
																	<input id="cpRdo3" type="radio" name="cp_rds">
																	<label for="cpRdo3">50,000원 할인</label>
																</div>
	
																<div class="cp_info">
																	<h6>첫주문감사 5만원 할인쿠폰(30만원 이상 주문시)</h6>
																	<p>30만원 이상 주문시 5만원 할인</p>
																	<p>유효기간 2021-10-03까지</p>
																</div>
															</li>
														</ul>
													</div>
												</div>
											</li>
	
											<li class="clear oit_2">
												<h5>포인트 적용</h5>
	
												<div class="p_wrap_right">
													<div class="p_wrap p_wrap_1 clear">
														<div class="form_cont">
															<label for="placeholder1">0</label>
															<input type="text" id="placeholder1">
														</div>
	
														<button class="all_use">모두사용</button>
													</div>
	
													<div class="p_wrap p_wrap_2 clear">
														<h6>보유 보인트 : <span>108,860</span> 원</h6>
														<p>- 보유 포인트 1천원 이상부터 사용가능</p>
														<p>- 적립금 내역 : 마이페이지 > 적립금</p>
													</div>
												</div>
											</li>
										</ul>
									</div>
								</li>
	
								<li class="c3_li2">
									<div class="order_info_tit clear">
										<h4>결제수단</h4>
										<p>결제수단 관련 정보입니다.</p>
									</div>
	
									<div class="order_info_txt">
										<ul class="depth2">
											<li class="clear oit_1">
												<div class="chk_wrap chk_wrap1 clear">
													<div>
														<input type="radio" id="ex_rd3" name="ex_rds_1">
														<label for="ex_rd3">무통장입금</label>
													</div>
													
													<div class="p_wrap">
														<p>국민은행</p>
														<p>예금주 : 메디밸류</p>
														<p>12345-67-890123<button class="copy_btn">복사하기</button></p>
													</div>
												</div>
	
												<div class="chk_wrap chk_wrap2 clear">
													<div>
														<input type="radio" id="ex_rd4" name="ex_rds_1">
														<label for="ex_rd4">신용카드</label>
													</div>
												</div>
											</li>
	
											<li class="clear oit_2">
												<h5 style="padding-left:0">입금기한</h5>
												<p>2021년 02월 05일 00시 06분까지</p>
											</li>
										</ul>
									</div>
								</li>
	
								<li class="c3_li3">
									<div class="order_info_tit clear">
										<h4>세금계산서 정보</h4>
										<p>세금계산서 정보 입니다.</p>
									</div>
	
									<div class="order_info_txt">
										<ul class="depth2">
											<li class="clear oit_1">
												<h5>세금계산서신청</h5>
												
												<div class="chk_wrap clear">
													<div>
														<input type="radio" id="ex_rd5" name="ex_rds_2">
														<label for="ex_rd5">신청</label>
													</div>
	
													<div>
														<input type="radio" id="ex_rd6" name="ex_rds_2">
														<label for="ex_rd6">미신청</label>
													</div>
												</div>
											</li>
	
											<li class="tax_info_li clear" style="margin-top:32px">
												<h5>사업자번호</h5>
												<p>111-11-11111</p>
											</li>
	
											<li class="tax_info_li clear">
												<h5>회사명</h5>
												<p>이엘치과</p>
											</li>
	
											<li class="tax_info_li clear">
												<h5>대표자명</h5>
												<p>노형태</p>
											</li>
	
											<li class="tax_info_li clear">
												<h5>업태</h5>
												<p>요양기관</p>
											</li>
	
											<li class="tax_info_li clear">
												<h5>종목</h5>
												<p>치과의원</p>
											</li>
	
											<li class="tax_info_li clear">
												<h5>이메일</h5>
												<p>nht777@gmail.com</p>
											</li>
										</ul>
	
										<button class="tax_modi">수정하기</button>
									</div>
								</li>
							</ul>
						</div>
	
						<div class="right">
							<div class="floating_box2">
								<h4>결제금액</h4>
								<div class="pd_cost_result">
									<ul class="depth1">
										<li class="pd_cost_1">
											<div class="pdc_li1 clear">
												<h5>제품금액</h5>
												<p><strong>32,100</strong> 원</p>
											</div>
								
											<ul class="depth2">
												<li class="pdc_li2_1 clear">
													<h6>└ 상품금액</h6>
													<p>32,100원</p>
												</li>
								
												<li class="pdc_li2_2 clear">
													<h6>└ 상품할인금액</h6>
													<p>-3,000원</p>
												</li>
											</ul>
										</li>
								
										<li class="pd_cost_2">
											<div class="pdc_li1 clear">
												<h5>배송비</h5>
												<p><strong>3,000</strong> 원</p>
											</div>
										</li>
								
										<li class="pd_cost_3">
											<div class="pdc_li1 clear">
												<h5>쿠폰할인금액</h5>
												<p><strong>-3,000</strong> 원</p>
											</div>
										</li>
								
										<li class="pd_cost_4">
											<div class="pdc_li1 clear">
												<h5>적립금사용</h5>
												<p><strong>-3,000</strong> 원</p>
											</div>
										</li>
								
										<li class="pd_cost_5 clear">
											<ul class="depth2">
												<li>
													<div class="pdc_li1 clear">
														<h5>최종결제금액</h5>
														<div class="wrap clear">
															<p>원</p>
															<strong>0,032,100</strong>
														</div>
													</div>
												</li>
								
												<li class="clear">
													<div class="pdc_li2 clear">
														<span class="mark">적립</span>
														<p>3,000원</p>
													</div>
												</li>
											</ul>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
			
			<article class="cnt4">
				<div class="area">
					<div class="real_area">
						<div class="order_info_tit clear">
							<h4>개인정보 수집/제공</h4>
							<p>개인정보 수집/제공 정보입니다.</p>
						</div>
	
						<div class="order_info_txt">
							<div class="chk_wrap">
								<div>
									<input id="chk5" type="checkbox">
									<label for="chk5">결제 진행 필수 동의</label>
								</div>
	
								<div class="p_wrap clear">
									<p>개인정보 수집 이용 및 위탁 동의 (필수)</p>
									<button href="" class="terms_view">약관보기</button>
	
									<div class="terms_popup">
										<button class="terms_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
										<div class="terms_tit"><h4>이용약관동의 <span>(필수)</span></h4></div>
										<div class="terms_txt">
											<h5>제1조(목적)</h5>
											<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
											<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
	
											<h5>제1조(목적)</h5>
											<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
											<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
	
											<h5>제1조(목적)</h5>
											<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
											<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
	
											<h5>제1조(목적)</h5>
											<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
											<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
										</div>
	
										<button class="terms_btn">확인</button>
									</div>
								</div>
	
								<div class="p_wrap clear">
									<p>결제대행 서비스 약관 동의 (필수)</p>
									<button href="" class="terms_view">약관보기</button>
	
									<div class="terms_popup">
										<button class="terms_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
										<div class="terms_tit"><h4>이용약관동의 <span>(필수)</span></h4></div>
										<div class="terms_txt">
											<h5>제1조(목적)</h5>
											<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
											<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
	
											<h5>제1조(목적)</h5>
											<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
											<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
	
											<h5>제1조(목적)</h5>
											<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
											<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
	
											<h5>제1조(목적)</h5>
											<p>이 약관은 메디밸류 주식회사 (전자거래 사업자)가 운영하는 메디밸류 사이버몰 (이하 “몰”이라 한다.) 에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다. </p>
											<p>「PC통신, 무선 등을 이용하는 전자거래에 대해서도 그 성질에 반하지않는 한 이 약관을 준용합니다.」 </p>
										</div>
	
										<button class="terms_btn">확인</button>
									</div>
								</div>
							</div>
						</div>
	
						<div class="clear">
							<button class="paying_btn">결제하기</button>
						</div>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>