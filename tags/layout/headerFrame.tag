<%@ tag language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<header id="header" class="main_hd">
	<div class="hd_wrap">
		<%-- 이벤트 영역 시작 --%>
		<div class="event_banner">	
			<div class="real_area">
				<p><span style="font-size: 14px;">메디밸류 사이트는 크롬 및 마이크로소프트 엣지에 최적화되어 있습니다.</span></p>
				<button class="close_btn" type="button"><img src="/resources/images/main/banner_close.png" width="10" height="10" border="0" alt="" /></button>
			</div>	
		</div>
		<%-- 이벤트 영역 끝 --%>
		<div class="top">
			<div class="area">
				<div class="real_area">
					<h1 class="logo"><a href="/index" class="g_c_h_logo"><img src="/resources/images/main/hd_logo.jpg" width="185" height="45" border="0" alt="" /></a></h1>
					<div class="left clear">
						<%--검색 영역 시작 --%>
						<div class="sch_box">
							<form id="frm_search" name="frm_search" action="/product/search/medi/list" method="post">
							<select name="searchColumn" id="searchColumn" class="nis total_sch">
								<option value="p_total" <c:if test="${searchColumn eq 'p_total' }">selected="selected"</c:if> style="outline:none;border:0">통합</option>
								<option value="p_name" <c:if test="${searchColumn eq 'p_name' }">selected="selected"</c:if> style="outline:none;border:0">제품명</option>
								<option value="p_stand" <c:if test="${searchColumn eq 'p_stand' }">selected="selected"</c:if>>규격</option>
								<option value="p_company" <c:if test="${searchColumn eq 'p_company' }">selected="selected"</c:if>>제조사명</option>
							</select>
							<div class="form_cont">
								<label for="searchString"><c:if test="${searchString eq '' or searchString == null}">제품 검색시 가격 비교를 할 수 있습니다.</c:if></label>
								<input type="text" id="searchString" name="searchString" value="${searchString}" autocomplete="off"/>
							</div>
							<div class="input_popup">
								<div class="ip_wrap">
									<div class="ip_left">
										<ul id="view_search_keyword">
											<%--
											<li><button type="button"><span>타이탄</span> 큐어링큐어링큐어링링</button></li>											
											 --%>
										</ul>
									</div>
									<div class="ip_right">
										<h4>추천 제품 키워드</h4>
										<ul id="view_search_recommend">
											<%--
											<li><button type="button">카리스마 레진, 최대 81% 선착순 할인!</button></li>
											 --%>
										</ul>
									</div>
								</div>
								<div class="ip_close">
									<button type="button" id="btn_search_keyword_close">닫기</button>
								</div>
							</div>
							<button id="btn_top_search" class="search_icon" type="button"><img src="/resources/images/main/search_btn2.png" width="15" height="15" border="0" alt="" /></button>
							</form>
						</div>
						<%--검색 영역 끝 --%>
						<button type="button" class="search_icon2"><img src="/resources/images/main/search_btn3.jpg" width="19" height="18" border="0" alt="" /></button>
					</div>
					<div class="right">
						<ul class="clear">
							<li class="hd_r_btn1">
								<a href="/myhome/info" target="_self">
									<span class="icon"><img src="/resources/images/main/hd_icon1.png" width="27" height="24" border="0" alt="" /></span>
									<h3>MY 홈</h3>
								</a>
							</li>
							<li class="hd_r_btn2">
								<a href="/order/list">
									<span class="icon"><img src="/resources/images/main/hd_icon2.png" width="25" height="24" border="0" alt="" /></span>
									<h3>내 계정</h3>
								</a>
								<div class="my_account_pu">
									<ul>
										<li><a href="/order/list">주문배송 조회</a></li>
										<li><a href="/member/addr/list">배송지 관리</a></li>
										<li><a href="/coupon/list">포인트 쿠폰</a></li>
										<li><a href="/member/medicash/list">메디캐쉬</a></li>
										<li><a href="/member/mypage/check">회원정보 수정</a></li>
										<li><a href="/member/purchase/list">구매내역 조회</a></li>
									</ul>
								</div>
							</li>
							<li class="hd_r_btn3">
								<a href="/product/basket/list">
									<span class="icon"><img src="/resources/images/main/hd_icon3.png" width="27" height="24" border="0" alt="" /></span>
									<h3>장바구니</h3>
									<c:if test="${requestScope.basket_user_cnt != null}">
										<span class="cart_num" style="display: block;">${requestScope.basket_user_cnt}</span>
									</c:if>
									<c:if test="${requestScope.basket_user_cnt == null}">
										<span class="cart_num">0</span>
									</c:if>
								</a>
								<div class="cart_alarm">
									<span class="tri"><img src="/resources/images/main/cart_alarm_tri.png" width="21" height="13" border="0" alt="" /></span>
									<h3 class="pd_tit">제품명</h3>
									<p class="pd_desc">제품을 장바구니에 제품을 담았습니다</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="btm">
			<div class="area">
				<div class="real_area clear">
					<div class="full_menu">
						<button class="fm_btn" type="button">
							<img src="/resources/images/main/hd_fullmenu.png" width="17" height="14" border="0" alt="" />
						</button>
						<div class="full_menu_wrap">
							<div class="fmw_login">
								<c:if test="${loginInfo !=null}">
									<button type="button" id="btn_main_logout" class="fmw_login_btn"><img src="/resources/images/main/fmw_login.png" width="23" height="22" border="0" alt="" />${loginInfo.fd_medical_name}</button>
									<button type="button" class="fmw_close"><img src="/resources/images/main/fmw_close.png" width="22" height="22" border="0" alt="" /></button>
								</c:if>
								<c:if test="${loginInfo == null}">
									<button type="button" id="btn_main_login" class="fmw_login_btn"><img src="/resources/images/main/fmw_login.png" width="23" height="22" border="0" alt="" />로그인</button>
									<button type="button" class="fmw_close"><img src="/resources/images/main/fmw_close.png" width="22" height="22" border="0" alt="" /></button>
								</c:if>
							</div>
							<h3>카테고리</h3>							
							<ul>
								<c:if test="${!empty requestScope.common_cate_list}">
									<c:set var="prev_menu" value="0"/>
									<c:forEach var="item" items="${requestScope.common_cate_list}" varStatus="state">
										<c:choose>
											<c:when test="${prev_menu != item.cate_1_idx}">
												<c:if test="${!state.first }">
														</ul>
													</div>
												</li>
											</c:if>
											<c:set var="prev_menu" value="${item.cate_1_idx}"/>
											<li class="gnb${state.index+1}">
												<button type="button" onclick="javascript:location.replace('/product/search/list?cate_idx_1=${item.cate_1_idx}');">${item.cate_1_name}</button>
												<div class="depth2_wrap">
													<h4>${item.cate_1_name}</h4>
													<ul class="dep2">
														<li>
															<button type="button" onclick="javascript:location.replace('/product/search/list?cate_idx_1=${item.cate_1_idx}&amp;cate_idx_2=${item.cate_2_idx}');"><p>${item.cate_2_name}</p></button>
															<%--
															<button type="button">																
																<p><a href="/product/search/list?cate_idx_1=${item.cate_1_idx}" target="_self">${item.cate_2_name}</a></p>
															</button>
															 --%>
														</li>
											</c:when>
											<c:otherwise>
												<li>
													<button type="button" onclick="javascript:location.replace('/product/search/list?cate_idx_1=${item.cate_1_idx}&amp;cate_idx_2=${item.cate_2_idx}');"><p>${item.cate_2_name}</p></button>
												</li>
											</c:otherwise>
										</c:choose>
										<c:if test="${state.last }">
													</ul>
												</div>
											</li>
										</c:if>
									</c:forEach>
								</c:if>
							</ul>
							<%--
							<ul>
								<li class="gnb1">
									<button type="button">치과용 재료</button>
									<div class="depth2_wrap">
										<h4>치과용 재료</h4>
										<ul class="dep2">
											<li>
												<button type="button"><p>소독/미백</p></button>
												<div class="depth3_wrap">
													<h5>소독/미백</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품소독용품소독용품소독용품소독용품소독용품소독용품소독용품소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>치과용 합금</p></button>
												<div class="depth3_wrap">
													<h5>치과용 합금</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>시멘트</p></button>
												<div class="depth3_wrap">
													<h5>시멘트</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>접착재료</p></button>
												<div class="depth3_wrap">
													<h5>접착재료</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>임시치관용 재료</p></button>
												<div class="depth3_wrap">
													<h5>임시치관용 재료</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>수복재료</p></button>
												<div class="depth3_wrap">
													<h5>수복재료</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>			
											<li>
												<button type="button"><p>근관재료</p></button>
												<div class="depth3_wrap">
													<h5>근관재료</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>인상재료</p></button>
												<div class="depth3_wrap">
													<h5>인상재료</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>수술재료</p></button>
												<div class="depth3_wrap">
													<h5>수술재료</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>절삭재료</p></button>
												<div class="depth3_wrap">
													<h5>절삭재료</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>연마재료</p></button>
												<div class="depth3_wrap">
													<h5>연마재료</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>위생재료</p></button>
												<div class="depth3_wrap">
													<h5>위생재료</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>진료용 장비</p></button>
												<div class="depth3_wrap">
													<h5>진료용 장비</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>교정재료</p></button>
												<div class="depth3_wrap">
													<h5>교정재료</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>IMPLANT</p></button>
												<div class="depth3_wrap">
													<h5>IMPLANT</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>진료용 기구 / 덴디폼</p></button>
												<div class="depth3_wrap">
													<h5>진료용 기구 / 덴디폼</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>예방재료</p></button>
												<div class="depth3_wrap">
													<h5>예방재료</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>방사선재료</p></button>
												<div class="depth3_wrap">
													<h5>방사선재료</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>석고 / 덴쳐 관련</p></button>
												<div class="depth3_wrap">
													<h5>석고 / 덴쳐 관련</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>교합재료</p></button>
												<div class="depth3_wrap">
													<h5>교합재료</h5>
													<ul class="dep3">
														<li><button type="button"><p>소독용품</p></button></li>
														<li><button type="button"><p>지혈용품</p></button></li>
														<li><button type="button"><p>미백제 &amp; 보톡스</p></button></li>
														<li><button type="button"><p>미백 &amp; 미용 관련 장비</p></button></li>
														<li><button type="button"><p>미백케이스 &amp; 기타</p></button></li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</li>			
								<li class="gnb2">
									<button type="button">의약품</button>
									<div class="depth2_wrap">
										<h4>의약품</h4>
										<ul class="dep2">
											<li>
												<button type="button"><p>의약품1</p></button>
												<div class="depth3_wrap">
													<h5>의약품1</h5>
													<ul class="dep3">
														<li><button type="button"><p>의약품1_1</p></button></li>
														<li><button type="button"><p>의약품1_2</p></button></li>
														<li><button type="button"><p>의약품1_3</p></button></li>
														<li><button type="button"><p>의약품1_4</p></button></li>
														<li><button type="button"><p>의약품1_4</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>의약품2</p></button>
												<div class="depth3_wrap">
													<h5>의약품2</h5>
													<ul class="dep3">
														<li><button type="button"><p>의약품2_1</p></button></li>
														<li><button type="button"><p>의약품2_2</p></button></li>
														<li><button type="button"><p>의약품2_3</p></button></li>
														<li><button type="button"><p>의약품2_4</p></button></li>
														<li><button type="button"><p>의약품2_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>의약품3</p></button>
												<div class="depth3_wrap">
													<h5>의약품3</h5>
													<ul class="dep3">
														<li><button type="button"><p>의약품3_1</p></button></li>
														<li><button type="button"><p>의약품3_2</p></button></li>
														<li><button type="button"><p>의약품3_3</p></button></li>
														<li><button type="button"><p>의약품3_4</p></button></li>
														<li><button type="button"><p>의약품3_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>의약품4</p></button>
												<div class="depth3_wrap">
													<h5>의약품4</h5>
													<ul class="dep3">
														<li><button type="button"><p>의약품4_1</p></button></li>
														<li><button type="button"><p>의약품4_2</p></button></li>
														<li><button type="button"><p>의약품4_3</p></button></li>
														<li><button type="button"><p>의약품4_4</p></button></li>
														<li><button type="button"><p>의약품4_5</p></button></li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</li>
								<li class="gnb3">
									<button type="button"><p>기공용 재료</p></button>
									<div class="depth2_wrap">
										<h4>기공용 재료</h4>
										<ul class="dep2">
											<li>
												<button type="button"><p>기공용 재료1</p></button>
												<div class="depth3_wrap">
													<h5>기공용 재료1</h5>
													<ul class="dep3">
														<li><button type="button"><p>기공용 재료1_1</p></button></li>
														<li><button type="button"><p>기공용 재료1_2</p></button></li>
														<li><button type="button"><p>기공용 재료1_3</p></button></li>
														<li><button type="button"><p>기공용 재료1_4</p></button></li>
														<li><button type="button"><p>기공용 재료1_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>기공용 재료2</p></button>
												<div class="depth3_wrap">
													<h5>기공용 재료2</h5>
													<ul class="dep3">
														<li><button type="button"><p>기공용 재료2_1</p></button></li>
														<li><button type="button"><p>기공용 재료2_2</p></button></li>
														<li><button type="button"><p>기공용 재료2_3</p></button></li>
														<li><button type="button"><p>기공용 재료2_4</p></button></li>
														<li><button type="button"><p>기공용 재료2_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>기공용 재료3</p></button>
												<div class="depth3_wrap">
													<h5>기공용 재료3</h5>
													<ul class="dep3">
														<li><button type="button"><p>기공용 재료3_1</p></button></li>
														<li><button type="button"><p>기공용 재료3_2</p></button></li>
														<li><button type="button"><p>기공용 재료3_3</p></button></li>
														<li><button type="button"><p>기공용 재료3_4</p></button></li>
														<li><button type="button"><p>기공용 재료3_5</p></button></li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</li>
								<li class="gnb4">
									<button type="button">E-ticket zone</button>
									<div class="depth2_wrap">
										<h4>E-ticket zone</h4>
										<ul class="dep2">
											<li>
												<button type="button"><p>E-ticket zone1</p></button>
												<div class="depth3_wrap">
													<h5>E-ticket zone1</h5>
													<ul class="dep3">
														<li><button type="button"><p>E-ticket zone1_1</p></button></li>
														<li><button type="button"><p>E-ticket zone1_2</p></button></li>
														<li><button type="button"><p>E-ticket zone1_3</p></button></li>
														<li><button type="button"><p>E-ticket zone1_4</p></button></li>
														<li><button type="button"><p>E-ticket zone1_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>E-ticket zone2</p></button>
												<div class="depth3_wrap">
													<h5>E-ticket zone2</h5>
													<ul class="dep3">
														<li><button type="button"><p>E-ticket zone2_1</p></button></li>
														<li><button type="button"><p>E-ticket zone2_2</p></button></li>
														<li><button type="button"><p>E-ticket zone2_3</p></button></li>
														<li><button type="button"><p>E-ticket zone2_4</p></button></li>
														<li><button type="button"><p>E-ticket zone2_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>E-ticket zone3</p></button>
												<div class="depth3_wrap">
													<h5>E-ticket zone3</h5>
													<ul class="dep3">
														<li><button type="button"><p>E-ticket zone3_1</p></button></li>
														<li><button type="button"><p>E-ticket zone3_2</p></button></li>
														<li><button type="button"><p>E-ticket zone3_3</p></button></li>
														<li><button type="button"><p>E-ticket zone3_4</p></button></li>
														<li><button type="button"><p>E-ticket zone3_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>E-ticket zone4</p></button>
												<div class="depth3_wrap">
													<h5>E-ticket zone4</h5>
													<ul class="dep3">
														<li><button type="button"><p>E-ticket zone4_1</p></button></li>
														<li><button type="button"><p>E-ticket zone4_2</p></button></li>
														<li><button type="button"><p>E-ticket zone4_3</p></button></li>
														<li><button type="button"><p>E-ticket zone4_4</p></button></li>
														<li><button type="button"><p>E-ticket zone4_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>E-ticket zone5</p></button>
												<div class="depth3_wrap">
													<h5>E-ticket zone5</h5>
													<ul class="dep3">
														<li><button type="button"><p>E-ticket zone5_1</p></button></li>
														<li><button type="button"><p>E-ticket zone5_2</p></button></li>
														<li><button type="button"><p>E-ticket zone5_3</p></button></li>
														<li><button type="button"><p>E-ticket zone5_4</p></button></li>
														<li><button type="button"><p>E-ticket zone5_5</p></button></li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</li>
								<li class="gnb5">
									<button type="button">공지 / 이벤트</button>
									<div class="depth2_wrap">
										<h4>공지 / 이벤트</h4>
										<ul class="dep2">
											<li>
												<button type="button"><p>공지 / 이벤트1</p></button>
												<div class="depth3_wrap">
													<h5>공지 / 이벤트1</h5>
													<ul class="dep3">
														<li><button type="button"><p>공지 / 이벤트1_1</p></button></li>
														<li><button type="button"><p>공지 / 이벤트1_2</p></button></li>
														<li><button type="button"><p>공지 / 이벤트1_3</p></button></li>
														<li><button type="button"><p>공지 / 이벤트1_4</p></button></li>
														<li><button type="button"><p>공지 / 이벤트1_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>공지 / 이벤트2</p></button>
												<div class="depth3_wrap">
													<h5>공지 / 이벤트2</h5>
													<ul class="dep3">
														<li><button type="button"><p>공지 / 이벤트2_1</p></button></li>
														<li><button type="button"><p>공지 / 이벤트2_2</p></button></li>
														<li><button type="button"><p>공지 / 이벤트2_3</p></button></li>
														<li><button type="button"><p>공지 / 이벤트2_4</p></button></li>
														<li><button type="button"><p>공지 / 이벤트2_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>공지 / 이벤트3</p></button>
												<div class="depth3_wrap">
													<h5>공지 / 이벤트3</h5>
													<ul class="dep3">
														<li><button type="button"><p>공지 / 이벤트3_1</p></button></li>
														<li><button type="button"><p>공지 / 이벤트3_2</p></button></li>
														<li><button type="button"><p>공지 / 이벤트3_3</p></button></li>
														<li><button type="button"><p>공지 / 이벤트3_4</p></button></li>
														<li><button type="button"><p>공지 / 이벤트3_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>공지 / 이벤트4</p></button>
												<div class="depth3_wrap">
													<h5>공지 / 이벤트4</h5>
													<ul class="dep3">
														<li><button type="button"><p>공지 / 이벤트4_1</p></button></li>
														<li><button type="button"><p>공지 / 이벤트4_2</p></button></li>
														<li><button type="button"><p>공지 / 이벤트4_3</p></button></li>
														<li><button type="button"><p>공지 / 이벤트4_4</p></button></li>
														<li><button type="button"><p>공지 / 이벤트4_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>공지 / 이벤트5</p></button>
												<div class="depth3_wrap">
													<h5>공지 / 이벤트5</h5>
													<ul class="dep3">
														<li><button type="button"><p>공지 / 이벤트5_1</p></button></li>
														<li><button type="button"><p>공지 / 이벤트5_2</p></button></li>
														<li><button type="button"><p>공지 / 이벤트5_3</p></button></li>
														<li><button type="button"><p>공지 / 이벤트5_4</p></button></li>
														<li><button type="button"><p>공지 / 이벤트5_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>공지 / 이벤트6</p></button>
												<div class="depth3_wrap">
													<h5>공지 / 이벤트6</h5>
													<ul class="dep3">
														<li><button type="button"><p>공지 / 이벤트6_1</p></button></li>
														<li><button type="button"><p>공지 / 이벤트6_2</p></button></li>
														<li><button type="button"><p>공지 / 이벤트6_3</p></button></li>
														<li><button type="button"><p>공지 / 이벤트6_4</p></button></li>
														<li><button type="button"><p>공지 / 이벤트6_5</p></button></li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</li>
								<li class="gnb6">
									<button type="button">기획상품</button>
									<div class="depth2_wrap">
										<h4>기획상품</h4>
										<ul class="dep2">
											<li>
												<button type="button"><p>기획상품1</p></button>
												<div class="depth3_wrap">
													<h5>기획상품1</h5>
													<ul class="dep3">
														<li><button type="button"><p>기획상품1_1</p></button></li>
														<li><button type="button"><p>기획상품1_2</p></button></li>
														<li><button type="button"><p>기획상품1_3</p></button></li>
														<li><button type="button"><p>기획상품1_4</p></button></li>
														<li><button type="button"><p>기획상품1_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>기획상품2</p></button>
												<div class="depth3_wrap">
													<h5>기획상품2</h5>
													<ul class="dep3">
														<li><button type="button"><p>기획상품2_1</p></button></li>
														<li><button type="button"><p>기획상품2_2</p></button></li>
														<li><button type="button"><p>기획상품2_3</p></button></li>
														<li><button type="button"><p>기획상품2_4</p></button></li>
														<li><button type="button"><p>기획상품2_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>기획상품3</p></button>
												<div class="depth3_wrap">
													<h5>기획상품3</h5>
													<ul class="dep3">
														<li><button type="button"><p>기획상품3_1</p></button></li>
														<li><button type="button"><p>기획상품3_2</p></button></li>
														<li><button type="button"><p>기획상품3_3</p></button></li>
														<li><button type="button"><p>기획상품3_4</p></button></li>
														<li><button type="button"><p>기획상품3_5</p></button></li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</li>
								<li class="gnb7">
									<button type="button">주요서비스</button>
									<div class="depth2_wrap">
										<h4>주요서비스</h4>
										<ul class="dep2">
											<li>
												<button type="button"><p>주요서비스1</p></button>
												<div class="depth3_wrap">
													<h5>주요서비스1</h5>
													<ul class="dep3">
														<li><button type="button"><p>주요서비스1_1</p></button></li>
														<li><button type="button"><p>주요서비스1_2</p></button></li>
														<li><button type="button"><p>주요서비스1_3</p></button></li>
														<li><button type="button"><p>주요서비스1_4</p></button></li>
														<li><button type="button"><p>주요서비스1_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>주요서비스2</p></button>
												<div class="depth3_wrap">
													<h5>주요서비스2</h5>
													<ul class="dep3">
														<li><button type="button"><p>주요서비스2_1</p></button></li>
														<li><button type="button"><p>주요서비스2_2</p></button></li>
														<li><button type="button"><p>주요서비스2_3</p></button></li>
														<li><button type="button"><p>주요서비스2_4</p></button></li>
														<li><button type="button"><p>주요서비스2_5</p></button></li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</li>
								<li class="gnb8">
									<button type="button">Medivalue Point Shop</button>
									<div class="depth2_wrap">
										<h4>Medivalue Point Shop</h4>
										<ul class="dep2">
											<li>
												<button type="button"><p>Medivalue Point Shop1</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop1</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop1_1Medivalue Point Shop1_1Medivalue Point Shop1_1Medivalue Point Shop1_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop1_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop1_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop1_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop1_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop2</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop2</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop2_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop2_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop2_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop2_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop2_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop3</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop3</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop3_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop3_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop3_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop3_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop3_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop4</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop4</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop4_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop4_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop4_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop4_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop4_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop5</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop5</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop5_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop5_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop5_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop5_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop5_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop6</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop6</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop6_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop6_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop6_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop6_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop6_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop7</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop7</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop7_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop7_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop7_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop7_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop7_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop8</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop8</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop8_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop8_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop8_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop8_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop8_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop9</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop9</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop9_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop9_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop9_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop9_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop9_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop10</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop10</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop10_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop10_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop10_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop10_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop10_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop11</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop11</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop11_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop11_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop11_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop11_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop11_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop12</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop12</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop12_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop12_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop12_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop12_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop12_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop13</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop13</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop13_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop13_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop13_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop13_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop13_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop14</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop14</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop14_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop14_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop14_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop14_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop14_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop15</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop15</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop15_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop15_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop15_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop15_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop15_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop16</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop16</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop16_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop16_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop16_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop16_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop16_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop17</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop17</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop17_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop17_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop17_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop17_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop17_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop18</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop18</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop18_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop18_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop18_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop18_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop18_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop19</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop19</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop19_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop19_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop19_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop19_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop19_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop20</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop20</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop20_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop20_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop20_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop20_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop20_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop21</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop21</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop21_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop21_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop21_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop21_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop21_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop22</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop22</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop22_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop22_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop22_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop22_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop22_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop23</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop23</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop23_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop23_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop23_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop23_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop23_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop24</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop24</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop24_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop24_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop24_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop24_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop24_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop25</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop25</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop25_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop25_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop25_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop25_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop25_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop26</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop26</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop26_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop26_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop26_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop26_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop26_5</p></button></li>
													</ul>
												</div>
											</li>
											<li>
												<button type="button"><p>Medivalue Point Shop27</p></button>
												<div class="depth3_wrap">
													<h5>Medivalue Point Shop27</h5>
													<ul class="dep3">
														<li><button type="button"><p>Medivalue Point Shop27_1</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop27_2</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop27_3</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop27_4</p></button></li>
														<li><button type="button"><p>Medivalue Point Shop27_5</p></button></li>
													</ul>
												</div>
											</li>
										</ul>
									</div>
								</li>
							</ul>
							 --%>
							<a href="/product/list?req_munu_idx=10" target="_self">
							<div class="fmw_banner">								
								<button type="button">바로가기
									<img src="/resources/images/main/fmw_banner_arrow.png" width="7" height="9" border="0" alt="" />
								</button>								
							</div>
							</a>
						</div>
					</div>
					<div id="gnb">
						<ul class="clear">
							<c:choose>
								<c:when test="${pageView eq 'search_medi' or pageView eq 'search_compare' }">									
									<li class="<c:if test="${pageView eq 'search_medi' }">on</c:if>"><button type="button" id="btn_search_medi">메디밸류<span></span></button></li>
									<li class="<c:if test="${pageView ne 'search_medi' }">on</c:if>"><button type="button" id="btn_search_compare">가격비교<span></span></button></li>
								</c:when>
								<c:otherwise>
									<li><button id="btn_top_menu" type="button">전체 카테고리<span></span></button></li>
									<c:set var="user_now_page" value="${requestScope['javax.servlet.forward.servlet_path']}" />
									<c:set var="page_check_value" value="${fn:indexOf(user_now_page,'/product/detail')}"/> 
									<c:if test="${page_check_value <= -1}">
										<li><a href="/product/pclist" target="_self"><button type="button">가격비교<span></span></button></a></li>										
									</c:if>
									<li><a href="/product/payback" target="_self"><button type="button">인기상품<span></span></button></a></li>
									<%-- <li><a href="/product/smallEquipment" target="_self"><button type="button">소장비 패키지<span></span></button></a></li> --%>
									<%-- <li><a href="/product/list?req_munu_idx=9" target="_self"><button type="button">특가<span></span></button></a></li> --%>
									<%-- <li><a href="/product/list?req_munu_idx=10" target="_self"><button type="button">베스트<span></span></button></a></li> --%>
									<%-- <li><a href="/product/list?req_munu_idx=11" target="_self"><button type="button">MD추천<span></span></button></a></li> --%>
									<%-- <li><a href="/product/list?req_munu_idx=12" target="_self"><button type="button">기획전<span></span></button></a></li> --%>																		
									<li class="intro"><a href="/company/info" target="_self"><button type="button">회사소개<span></span></button></a></li>
								</c:otherwise>
							</c:choose>
							
						</ul>
					</div>
					<div class="util clear">
						<ul class="util1 clear">
							<c:if test="${loginInfo == null}">
								<li class="util1_1"><button type="button" id="btn_main_top_login">로그인</button></li>
								<li class="util1_2"><button type="button" id="btn_main_top_join">회원가입</button></li>
							</c:if>
							<c:if test="${loginInfo !=null}">
								<li class="util1_1"><button type="button" id="btn_main_top_info">${loginInfo.fd_medical_name}</button></li>
								<li class="util1_2"><button type="button" id="btn_main_top_logout">로그아웃</button></li>
							</c:if>
							<li class="util1_3">
								<button type="button">고객센터</button>
								<div class="as_center_pu">
									<ul>
										<li><a href="#" class="question">1:1 문의</a></li>
										<li><a href="#" class="notice">공지사항</a></li>
										<%--
											<li><a href="#" class="useinfo">이용안내</a></li>
											<li><a href="#" class="terms3">법적고지</a></li>
 										--%>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>