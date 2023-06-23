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
				
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub2_1" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area clear">
						<h3>장바구니</h3>
	
						<div class="left_cart_list">
							<div class="all_chk_wrap clear">
								<div class="all_chk">
									<input id="chk1" type="checkbox" name="acc" class="all_chk_cb">
									<label for="chk1">전체선택<span>(1/4)</span></label>
								</div>
	
								<div class="chc_delete">
									<button>선택삭제</button>
								</div>
							</div>
	
							<div class="cart_pd sale_pd">
								<div class="cart_pd_tit sale_pd_tit clear">
									<div class="sale_pd_chk">
										<input id="saleChk1" type="checkbox" name="acc" class="spc">
										<label for="saleChk1">특가제품</label>
									</div>
									<p><span>9/28(화)</span> 도착예정<button><img src="/resources/images/main/cart_up.jpg" width="8" height="4" border="0" alt="" /></button></p>
								</div>
	
								<div class="cart_pd_list sale_pd_list">
									<ul>
										<li class="clear">
											<div class="pd_chk">
												<input id="chk2" type="checkbox" name="acc" class="spc">
												<label for="chk2"></label>
											</div>
	
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
	
											<div class="quan_box clear">
												<button class="minus">-</button>
												<div class="form_cont">
													<label for="qb1"></label>
													<input type="text" id="qb1" class="num" value="1">
												</div>
												<button class="plus">+</button>
											</div>
	
											<div class="price_info">
												<div class="price clear">
													<p>00,000원</p>
												</div>
											</div>
	
											<div class="delete_icon"><button><img src="/resources/images/main/cart_delete.jpg" width="10" height="10" border="0" alt="" /></button></div>
										</li>
	
										<li class="clear">
											<div class="pd_chk">
												<input id="chk3" type="checkbox" name="acc" class="spc">
												<label for="chk3"> </label>
											</div>
	
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
	
											<div class="quan_box clear">
												<button class="minus">-</button>
												<div class="form_cont">
													<label for="qb2"></label>
													<input type="text" id="qb2" class="num" value="1">
												</div>
												<button class="plus">+</button>
											</div>
	
											<div class="price_info">
												<div class="price clear">
													<p>0,000,000원</p>
												</div>
											</div>
	
											<div class="delete_icon"><button><img src="/resources/images/main/cart_delete.jpg" width="10" height="10" border="0" alt="" /></button></div>
										</li>
									</ul>
								</div>
							</div>
	
							<div class="cart_pd normal_pd">
								<div class="cart_pd_tit normal_pd_tit clear">
									<div class="nom_pd_chk">
										<input id="nomChk1" type="checkbox" name="acc" class="npc">
										<label for="nomChk1">일반제품</label>
									</div>
									<p><span>9/29(수)</span> 도착예정<button><img src="/resources/images/main/cart_up.jpg" width="8" height="4" border="0" alt="" /></button></p>
								</div>
	
								<div class="cart_pd_list normal_pd_list">
									<ul>
										<li class="clear">
											<div class="pd_chk">
												<input id="chk4" type="checkbox" name="acc" class="npc">
												<label for="chk4"></label>
											</div>
	
											<div class="img">
												<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
											</div>
	
											<div class="info">
												<div class="info_box">
													<h4 class="pd_tit">TITAN X (타이탄엑스)</h4>
													<p class="standard">[규격] 0.5g  /  0.8cc (05-0210)</p>
													<div class="mp_wrap clear">
														<p class="manu">제조사ㅣ리뉴메디칼</p>
														<p class="pack">포장단위ㅣea</p>
													</div>
												</div>
											</div>
	
											<div class="quan_box clear">
												<button class="minus">-</button>
												<div class="form_cont">
													<label for="qb3"></label>
													<input type="text" id="qb3" class="num" value="1">
												</div>
												<button class="plus">+</button>
											</div>
	
											<div class="price_info">
												<div class="price clear">
													<p>0,000,000원</p>
												</div>
											</div>
	
											<div class="delete_icon"><button><img src="/resources/images/main/cart_delete.jpg" width="10" height="10" border="0" alt="" /></button></div>
										</li>
	
										<li class="clear">
											<div class="pd_chk">
												<input id="chk5" type="checkbox" name="acc" class="npc">
												<label for="chk5"></label>
											</div>
	
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
	
											<div class="quan_box clear">
												<button class="minus">-</button>
												<div class="form_cont">
													<label for="qb3"></label>
													<input type="text" id="qb3" class="num" value="1">
												</div>
												<button class="plus">+</button>
											</div>
	
											<div class="price_info">
												<div class="price clear">
													<p>0,000,000원</p>
												</div>
											</div>
	
											<div class="delete_icon"><button><img src="/resources/images/main/cart_delete.jpg" width="10" height="10" border="0" alt="" /></button></div>
										</li>
									</ul>
								</div>
							</div>
	
							<div class="all_chk_wrap clear">
								<div class="all_chk">
									<input id="chk1" type="checkbox" name="acc" class="all_chk_cb">
									<label for="chk1">전체선택<span>(1/4)</span></label>
								</div>
	
								<div class="chc_delete">
									<button>선택삭제</button>
								</div>
							</div>
						</div>
	
						<div class="right_summ">
							<div class="ship_info">
								<h4><img src="/resources/images/main/loc_icon.jpg" width="14" height="20" border="0" alt="" />배송지</h4>
								<p>서울 영등포구 여의도동 여의대로 108 파크원타워1 2층 파크원현대치과의원 1012동 3012호</p>
								<button class="ship_change">배송지 변경</button>
	
								<div class="ship_change_popup">
									<div class="sc_tit">
										<h4>배송지</h4>
										<button class="sc_close"><img src="/resources/images/main/sc_close.jpg" width="18" height="17" border="0" alt="" /></button>
									</div>
	
									<div class="sc_txt">
										<ul>
											<li class="sc_txt1 clear">
												<h5 class="sc_h5_1">선택</h5>
												<h5 class="sc_h5_2">배송정보</h5>
												<h5 class="sc_h5_3">수정</h5>
											</li>
	
											<li class="sc_txt2 clear">
												<div class="sc_rdo">
													<input id="scRdo1" type="radio" name="scRdo">
													<label for="scRdo1"></label>
												</div>
	
												<div class="sc_info">
													<div class="sc_info_wrap">
														<span class="sc_sp">기본배송지</span>
														<p class="sc_addr">서울 영등포구 당산동 5가 16-3</p>
														<p class="sc_tel"><span>이엘치과</span> 02-2671-2755</p>
													</div>
												</div>
	
												<div class="sc_modi">
													<button><img src="/resources/images/main/sc_modi.jpg" width="22" height="22" border="0" alt="" /></button>
												</div>
											</li>
	
											<li class="sc_txt2 clear">
												<div class="sc_rdo">
													<input id="scRdo2" type="radio" name="scRdo">
													<label for="scRdo2"></label>
												</div>
	
												<div class="sc_info">
													<div class="sc_info_wrap">
														<p class="sc_addr">대구 중구 공평로 12</p>
														<p class="sc_tel"><span>미르치과병원</span> 053-212-1000</p>
													</div>
												</div>
	
												<div class="sc_modi"><button><img src="/resources/images/main/sc_modi.jpg" width="22" height="22" border="0" alt="" /></button></div>
											</li>
	
											<li class="sc_txt2 clear">
												<div class="sc_rdo">
													<input id="scRdo2" type="radio" name="scRdo">
													<label for="scRdo2"></label>
												</div>
	
												<div class="sc_info">
													<div class="sc_info_wrap">
														<p class="sc_addr">대구 중구 공평로 12</p>
														<p class="sc_tel"><span>미르치과병원</span> 053-212-1000</p>
													</div>
												</div>
	
												<div class="sc_modi"><button><img src="/resources/images/main/sc_modi.jpg" width="22" height="22" border="0" alt="" /></button></div>
											</li>
	
											<li class="sc_txt2 clear">
												<div class="sc_rdo">
													<input id="scRdo2" type="radio" name="scRdo">
													<label for="scRdo2"></label>
												</div>
	
												<div class="sc_info">
													<div class="sc_info_wrap">
														<p class="sc_addr">대구 중구 공평로 12</p>
														<p class="sc_tel"><span>미르치과병원</span> 053-212-1000</p>
													</div>
												</div>
	
												<div class="sc_modi"><button><img src="/resources/images/main/sc_modi.jpg" width="22" height="22" border="0" alt="" /></button></div>
											</li>
	
											<li class="sc_txt2 clear">
												<div class="sc_rdo">
													<input id="scRdo2" type="radio" name="scRdo">
													<label for="scRdo2"></label>
												</div>
	
												<div class="sc_info">
													<div class="sc_info_wrap">
														<p class="sc_addr">대구 중구 공평로 12</p>
														<p class="sc_tel"><span>미르치과병원</span> 053-212-1000</p>
													</div>
												</div>
	
												<div class="sc_modi"><button><img src="/resources/images/main/sc_modi.jpg" width="22" height="22" border="0" alt="" /></button></div>
											</li>
										</ul>
									</div>
	
									<div class="sc_btn">
										<button>+ 새 배송지 추가</button>
									</div>
								</div>
	
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
														<label for="placeholder_sm1">상세주소를 입력해주세요</label>
														<input type="text" id="placeholder_sm1">
													</div>
												</li>
											
												<li>
													<p>받으실 분</p>
													<div class="form_cont">
														<label for="placeholder_sm2">이엘치과</label>
														<input type="text" id="placeholder_sm2">
													</div>
												</li>
											
												<li>
													<p>연락처</p>
													<div class="form_cont">
														<label for="placeholder_sm3">02-2671-2755</label>
														<input type="text" id="placeholder_sm3">
													</div>
												</li>
											</ul>
										</div>
									</div>
	
									<div class="sm_btn"><button>저장</button></div>
								</div>
							</div>
	
							<div class="pd_cost_result">
								<ul>
									<li class="pd_cost_1 clear">
										<h5>제품금액</h5>
										<p><strong>32,100</strong>원</p>
									</li>
	
									<li class="pd_cost_2 clear">
										<h5>배송비</h5>
										<p><strong>3,000</strong>원</p>
									</li>
	
									<li class="pd_cost_3 clear">
										<h5>할인금액</h5>
										<p><strong>-3,000</strong>원</p>
									</li>
	
									<li class="pd_cost_4 clear">
										<h5>결제예정금액</h5>
										<p>원</p>
										<strong>0,032,100</strong>
									</li>
								</ul>
							</div>
	
							<div class="order_btn">
								<button>총 2개 주문하기</button>
							</div>
	
							<div class="order_caution">
								<p>- 포인트는 주문결제에서 사용 가능합니다.</p>
								<p>- ‘입금확인’상태일 때는 주문 내역 상세내역에서 직접 주문<br><span>취소가 가능합니다.</span></p>
								<p>- ‘입금확인’이후 상태에는 고객센터로 문의해주세요.</p>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>