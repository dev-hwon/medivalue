<%@ tag language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${loginInfo != null and loginInfo ne '' }">
<c:set var="view_cnt" value="3"/>
<article class="my_history">
	<div class="area">
		<div class="real_area">
			<div class="tit clear">
				<h3>MY HISTORY</h3>
				<p>내가 본 제품과 다른 고객이 함께 본 제품을 확인해보세요!</p>
			</div>
			<div class="txt">
				<div class="tab_split">
					<ul class="tab_btn clear">
						<li class="tab_btn1 on"><button type="button">최근 본 제품 (<span class=".lately_cnt">${requestScope.lately_list_size}</span>)</button></li>
						<li class="tab_btn2"><button type="button">장바구니 (<span class=".basket_cnt">${requestScope.basket_list_size}</span>)</button></li>
						<li class="tab_btn3"><button type="button">위시리스트 (<span class=".wish_cnt">${requestScope.wish_list_size}</span>)</button></li>
					</ul>
					<div class="tab_cnt">
						<div class="tab_cnt1 clear">
							<div class="left">
								<div class="wrap">
									<div class="paging_wrap">
										<p><strong id="bxslider_his1_view_no">1</strong> / ${requestScope.lately_list_size}</p>
									</div>
									<ul class="bxslider_his1">
										<c:if test="${!empty requestScope.lately_list}">
											<c:forEach var="item" items="${requestScope.lately_list}" varStatus="state">
												<li class="<c:if test="${item.fd_option_count > 0}">option </c:if><c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
													<a href="/product/detail?req_view_idx=${item.fk_tpsm_idx}" target="_self">
														<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
															<div class="icon_list">
																<div class="li li_option">
																	<div>
																		<div class="tit"><strong><c:out value="${item.fd_option_count + 1}"/></strong>개</div>
																		<div class="desc">규격선택</div>
																	</div>
																</div>
																<div class="li li_insure">
																	<div>
																		<div class="desc">보험<br>재료</div>
																	</div>
																</div>
															</div>
															<c:if test="${item.fd_img_path_thumbnail ne '' }">
																<img src="${item.fd_img_path_thumbnail}" onerror="this.src='/resources/images/dummy/250x321.png'" width="250" height="321" border="0" alt="" />	
															</c:if>
															<c:if test="${item.fd_img_path_thumbnail eq '' }">
																<img src="${item.fd_img_path}" onerror="this.src='/resources/images/dummy/250x321.png'" width="250" height="321" border="0" alt="" />
															</c:if>
														</div>
														<div class="info">
															<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name} ${item.fd_product_standard} ${item.fd_product_unit} </h4>
															<div class="price clear">
																<%--<strong class="percent"> 10% </strong>--%>
																<p><fmt:formatNumber value="${item.shop_amount}" pattern="#,###" />원</p>
															</div>
															<div class="cost"><p><%-- 0,000,000원--%></p></div>
														</div>
													</a>
												</li>
											</c:forEach>
										</c:if>
									</ul>
								</div>
								<span class="line"></span>
							</div>
							<div class="right">
								<div class="right_tit clear">
									<h4>최근 본 제품</h4>
									<p>
										<strong id="bxslider_his2_view_no">1</strong> /
										<c:set var="temp_view_cnt" value="${requestScope.lately_list_size/view_cnt}"/>																			
										<fmt:parseNumber  var="result_view_cnt" value="${temp_view_cnt+((temp_view_cnt%1>0.5)?(1-(temp_view_cnt%1))%1:-(temp_view_cnt%1))}" integerOnly="true"/>
										${result_view_cnt}
									</p>
								</div>
								<ul class="depth1 bxslider_his2">
									<c:if test="${!empty requestScope.lately_list}">
										<c:forEach var="item" items="${requestScope.lately_list}" varStatus="state">
											<c:if test="${state.first }">
												<li>
													<ul class="depth2 clear">
											</c:if>
												<li class="<c:if test="${item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
													<a href="/product/detail.do?req_view_idx=${item.fk_tpsm_idx}" target="_self">
														<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
															<div class="icon_list">
																<div class="li li_option">
																	<div>
																		<div class="tit"><strong><c:out value="${item.fd_option_count + 1}"/></strong>개</div>
																		<div class="desc">규격선택</div>
																	</div>
																</div>
																<div class="li li_insure">
																	<div>
																		<div class="desc">보험<br>재료</div>
																	</div>
																</div>
															</div>
															<c:set var="view_image" value="${item.fd_img_path_thumbnail}"/>
															<c:if test="${view_image == null or view_image eq '' }">
																<c:set var="view_image" value="${item.fd_img_path}"/>
															</c:if>
															<img src="${view_image}" onerror="this.src='/resources/images/dummy/250x321.png'" width="250" height="321" border="0" alt="제품이미지" />
															<div class="wish_wrap">
																<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
																<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
															</div>
														</div>
														<div class="info">
															<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name} ${item.fd_product_standard}</h4>
															<div class="price clear">																
																<%--<strong class="percent"> 10% </strong>--%>
																<p><fmt:formatNumber value="${item.shop_amount}" pattern="#,###" />원</p>
															</div>
															<div class="cost"><%-- <p>0,000,000원</p>--%></div>
														</div>
													</a>
												</li>
												<c:if test="${(state.index % view_cnt == view_cnt-1) and !state.last and !state.first}">
													</ul>
												</li>
												<li>
													<ul class="depth2 clear">
												</c:if>
												<c:if test="${state.last}">
													</ul>
												</li>
											</c:if>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="tab_cnt2 clear">
							<div class="left">
								<div class="wrap">
									<div class="paging_wrap">
										<p><strong id="bxslider_his3_view_no">1</strong> / ${requestScope.lately_list_size}</p>
									</div>
									<ul class="bxslider_his3">
										<c:if test="${!empty requestScope.lately_list}">
											<c:forEach var="item" items="${requestScope.lately_list}" varStatus="state">
											<li class="<c:if test="${item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
												<a href="/product/detail?req_view_idx=${item.fk_tpsm_idx}" target="_self">
													<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
														<div class="icon_list">
															<div class="li li_option">
																<div>
																	<div class="tit"><strong><c:out value="${item.fd_option_count + 1}"/></strong>개</div>
																	<div class="desc">규격선택</div>
																</div>
															</div>
															<div class="li li_insure">
																<div>
																	<div class="desc">보험<br>재료</div>
																</div>
															</div>
														</div>
														<c:if test="${item.fd_img_path_thumbnail ne '' }">
															<img src="${item.fd_img_path_thumbnail}" onerror="this.src='/resources/images/dummy/250x321.png'" width="250" height="321" border="0" alt="" />	
														</c:if>
														<c:if test="${item.fd_img_path_thumbnail eq '' }">
															<img src="${item.fd_img_path}" onerror="this.src='/resources/images/dummy/250x321.png'" width="250" height="321" border="0" alt="" />
														</c:if>
													</div>
													<div class="info">
														<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name} ${item.fd_product_standard} ${item.fd_product_unit} </h4>
														<div class="price clear">
															<%--<strong class="percent"> 10% </strong>--%>
															<p><fmt:formatNumber value="${item.shop_amount}" pattern="#,###" />원</p>
														</div>
														<div class="cost"><p><%-- 0,000,000원--%></p></div>
													</div>
												</a>
											</li>	
											</c:forEach>
										</c:if>
									</ul>
								</div>
								<span class="line"></span>
							</div>
							<div class="right">
								<div class="right_tit clear">
									<h4>장바구니 제품의 추천제품</h4>
									<p><strong id="bxslider_his4_view_no">1</strong> /									 
									 	<c:set var="temp_view_cnt" value="${requestScope.basket_list_size/view_cnt}"/>																			
										<fmt:parseNumber  var="result_view_cnt" value="${temp_view_cnt+((temp_view_cnt%1>0.5)?(1-(temp_view_cnt%1))%1:-(temp_view_cnt%1))}" integerOnly="true"/>
										${result_view_cnt}
									 </p>
								</div>
								<ul class="depth1 bxslider_his4">
									<c:if test="${!empty requestScope.basket_list}">
										<c:forEach var="item" items="${requestScope.basket_list}" varStatus="state">
											<c:if test="${state.first }">
												<li>
													<ul class="depth2 clear">
											</c:if>
												<li class="<c:if test="${item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
													<a href="/product/detail?req_view_idx=${item.fk_tpsm_idx}" target="_self">
														<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
															<div class="icon_list">
																<div class="li li_option">
																	<div>
																		<div class="tit"><strong><c:out value="${item.fd_option_count + 1}"/></strong>개</div>
																		<div class="desc">규격선택</div>
																	</div>
																</div>
																<div class="li li_insure">
																	<div>
																		<div class="desc">보험<br>재료</div>
																	</div>
																</div>
															</div>
															<c:set var="view_image" value="${item.fd_img_path_thumbnail}"/>
															<c:if test="${view_image == null or view_image eq '' }">
																<c:set var="view_image" value="${item.fd_img_path}"/>
															</c:if>
															<img src="${view_image}" onerror="this.src='/resources/images/dummy/250x321.png'" width="250" height="321" border="0" alt="제품이미지" />
															<div class="wish_wrap">
																<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
																<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
															</div>
														</div>
														<div class="info">
															<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name} ${item.fd_product_standard}</h4>
															<div class="price clear">																
																<%--<strong class="percent">10%</strong>--%>
																<p><fmt:formatNumber value="${item.shop_amount}" pattern="#,###" />원</p>
															</div>
															<div class="cost"><%-- <p>0,000,000원</p>--%></div>
														</div>
													</a>
												</li>
												<c:if test="${(state.index % view_cnt == view_cnt-1) and !state.last and !state.first}">
													</ul>
												</li>
												<li>
													<ul class="depth2 clear">
												</c:if>
												<c:if test="${state.last}">
													</ul>
												</li>
											</c:if>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</div>
						<div class="tab_cnt3 clear">
							<div class="left">
								<div class="wrap">
									<div class="paging_wrap">
										<p><strong id="bxslider_his5_view_no">1</strong> / ${requestScope.lately_list_size}</p>
									</div>
									<ul class="bxslider_his5">
										<c:if test="${!empty requestScope.lately_list}">
											<c:forEach var="item" items="${requestScope.lately_list}" varStatus="state">
												<li class="<c:if test="${item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
													<a href="/product/detail?req_view_idx=${item.fk_tpsm_idx}" target="_self">
														<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
															<div class="icon_list">
																<div class="li li_option">
																	<div>
																		<div class="tit"><strong><c:out value="${item.fd_option_count + 1}"/></strong>개</div>
																		<div class="desc">규격선택</div>
																	</div>
																</div>
																<div class="li li_insure">
																	<div>
																		<div class="desc">보험<br>재료</div>
																	</div>
																</div>
															</div>
															<c:if test="${item.fd_img_path_thumbnail ne '' }">
																<img src="${item.fd_img_path_thumbnail}" onerror="this.src='/resources/images/dummy/250x321.png'" width="250" height="321" border="0" alt="" />	
															</c:if>
															<c:if test="${item.fd_img_path_thumbnail eq '' }">
																<img src="${item.fd_img_path}" onerror="this.src='/resources/images/dummy/250x321.png'" width="250" height="321" border="0" alt="" />
															</c:if>
														</div>
														<div class="info">
															<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name} ${item.fd_product_standard} ${item.fd_product_unit} </h4>
															<div class="price clear">
																<%--<strong class="percent"> 10% </strong>--%>
																<p><fmt:formatNumber value="${item.shop_amount}" pattern="#,###" />원</p>
															</div>
															<div class="cost"><p><%-- 0,000,000원--%></p></div>
														</div>
													</a>
												</li>
											</c:forEach>
										</c:if>
									</ul>
								</div>
								<span class="line"></span>
							</div>
							<div class="right">
								<div class="right_tit clear">
									<h4>위시리스트</h4>
									<p><strong id="bxslider_his6_view_no">1</strong> /
										<c:set var="temp_view_cnt" value="${requestScope.wish_list_size/view_cnt}"/>																			
										<fmt:parseNumber  var="result_view_cnt" value="${temp_view_cnt+((temp_view_cnt%1>0.5)?(1-(temp_view_cnt%1))%1:-(temp_view_cnt%1))}" integerOnly="true"/>
										${result_view_cnt }
									</p>
								</div>
								<ul class="depth1 bxslider_his6">
									<c:if test="${!empty requestScope.wish_list}">
										<c:forEach var="item" items="${requestScope.wish_list}" varStatus="state">
											<c:if test="${state.first }">
												<li>
													<ul class="depth2 clear">
											</c:if>
												<li class="<c:if test="${item.fd_option_count > 0}">option </c:if> <c:if test="${!empty item.fd_product_insure_code}">insure</c:if>">
													<a href="/product/detail?req_view_idx=${item.fk_tpsm_idx}" target="_self">													
														<div class="img <c:if test="${item.fd_event_yn eq 'Y'}">payback </c:if> <c:if test="${item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
															<div class="icon_list">
																<div class="li li_option">
																	<div>
																		<div class="tit"><strong><c:out value="${item.fd_option_count + 1}"/></strong>개</div>
																		<div class="desc">규격선택</div>
																	</div>
																</div>
																<div class="li li_insure">
																	<div>
																		<div class="desc">보험<br>재료</div>
																	</div>
																</div>
															</div>
															<c:set var="view_image" value="${item.fd_img_path_thumbnail}"/>
															<c:if test="${view_image == null or view_image eq '' }">
																<c:set var="view_image" value="${item.fd_img_path}"/>
															</c:if>
															<img src="${view_image}" onerror="this.src='/resources/images/dummy/250x321.png'" width="250" height="321" border="0" alt="제품이미지" />
															<div class="wish_wrap">
																<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
																<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
															</div>
														</div>
														<div class="info">
															<h4 class="pd_tit">[${item.fd_company_info}] ${item.fd_product_name} ${item.fd_product_standard}</h4>
															<div class="price clear">																
																<%--<strong class="percent">10%</strong>--%>
																<p><fmt:formatNumber value="${item.shop_amount}" pattern="#,###" />원</p>
															</div>
															<div class="cost"><%-- <p>0,000,000원</p>--%></div>
														</div>
													</a>
												</li>
												<c:if test="${(state.index % view_cnt == view_cnt-1) and !state.last and !state.first}">
													</ul>
												</li>
												<li>
													<ul class="depth2 clear">
												</c:if>
												<c:if test="${state.last}">
													</ul>
												</li>
											</c:if>
										</c:forEach>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</article>
</c:if>