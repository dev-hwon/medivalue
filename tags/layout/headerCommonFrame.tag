<%@ tag language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="black"></div>
<div id="black2"></div>
<div id="black3"></div>
<div id="black4"></div>
<div class="quick_menus">
	<ul>
		<li><button type="button" class="btn_quick_menu btn_open_ch-plugin">1:1<br />문의</button></li>
		<li><a href="/quickOrder/info?func=quickorder" class="btn_quick_menu btn_move_guide">이용<br />방법</a></li>
		<li><button type="button" class="btn_quick_menu btn_totop"><img src="/resources/images/main_renew/ico_quick_totop.png" alt="" /></button></li>
		<li><button type="button" class="btn_quick_menu btn_tobottom"><img src="/resources/images/main_renew/ico_quick_tobottom.png" alt="" /></button></li>
	</ul>
</div>
<script>
	$('.btn_open_ch-plugin').on('click', function(){
		onChatTalk()
	});
	$('.btn_totop').on('click', function(){
		$('html, body').stop().animate({scrollTop : 0}, 800);
	});
	$('.btn_tobottom').on('click', function(){
		$('html, body').stop().animate({scrollTop : $('body').outerHeight() }, 800);
	});
</script>
<!-- 장바구니 아이콘 클릭 시 나오는 팝업  [시작] -->
<!-- 현재 페이지에만 추가되어 있습니다 -->
<!-- 클래스명 on이 추가된 팝업이 나오도록 설정되어 있습니다 -->
<div id="cartPopup1" class="cart_popup on"> <!-- 옵션없음 -->
	<ul class="pop_item">
		<li class="cart_pu_li1">
			<div class="pk_idx d-none" style="display: none;"></div>
			<h3 class="pop_tit">장바구니 제품</h3>
		</li>
		
		<li class="cart_pu_li2 clear">
			<div class="price clear">
				<strong class="pop_price">0원</strong>
				<p></p><%-- 이전금액 --%>
			</div>

			<div class="quan_box clear">
				<button type="button" class="minus">-</button>
				<div class="form_cont">
					<label for="cartP1"></label>
					<input type="text" id="cartP1" class="num pop_cnt" value="1">
				</div>
				<button type="button" class="plus">+</button>
			</div>
		</li>

		<li class="cart_pu_li3 clear">				
			<div class="cau clear">
				<%--
				<span>한정</span>
				<p>최대 3개까지 구매가능</p>
				--%>
			</div>

			<div class="total_price clear">
				<h6>합계</h6>
				<strong class="pop_tot_price">0</strong>
				<span>원</span>
			</div>
		</li>

		<li class="cart_pu_li4 clar">
			<button type="button" class="buy_btn">바로 구매하기</button>
			<button type="button" class="cart_go_btn">장바구니 담기</button>
			<button type="button" class="cancel_btn">취소</button>
		</li>
	</ul>
</div>

<div id="cartPopup2" class="cart_popup"> <!-- 옵션있음 -->
	<h2></h2>
	<ul class="depth1">			
	</ul>

	<div class="cau_wrap clear">
		<div class="cau clear">
			<%--<span>한정></span> --%
			<p><%--최대 3개까지 구매가능</p>--%>
		</div>

		<div class="total_price clear">
			<h6>합계</h6>
			<strong class="pop_tot_price">0</strong>
			<span>원</span>
		</div>
	</div>

	<div class="cart_pu_btn_wrap clear">
		<button class="buy_btn">바로 구매하기</button>
		<button class="cart_go_btn">장바구니 담기</button>
		<button class="cancel_btn">취소</button>
	</div>
</div>
<!-- 장바구니 아이콘 클릭 시 나오는 팝업 [끝] -->

<!-- 규격 종류 많을 때 장바구니 클릭 시 팝업 START -->
<div id="cartPopup3" class="cart_popup"> <!-- 옵션있음 -->
	<h2></h2>
	<ul class="depth1">

	</ul>

	<div class="cau_wrap clear">
		<div class="cau clear">
			<p class="info">선택된 제품만 장바구니에 담겨요.</p>
		</div>

		<div class="total_price clear">
			<h6>합계</h6>
			<strong class="pop_tot_price">0</strong>
			<span>원</span>
		</div>
	</div>

	<div class="cart_pu_btn_wrap clear">
		<button class="buy_btn">바로 구매하기</button>
		<button class="cart_go_btn">장바구니 담기</button>
		<button class="cancel_btn">취소</button>
	</div>
</div>
<!-- 규격 종류 많을 때 장바구니 클릭 시 팝업 END -->

<!-- 최근 본 제품 우측 팝업 [시작] -->
<!-- 클래스명 on이 추가된 팝업이 나오도록 설정되어 있습니다 -->
<c:if test="${empty requestScope.lately_list }">
<div class="last_view1 last_view on"> <!-- 최근 본 제품 없음 -->
	<button class="lastView_close"><img src="/resources/images/main/last_view_close.jpg" width="18" height="18" border="0" alt="" /></button>
	<div class="tit clear">
		<h3>최근 본 제품</h3>
		<button type="button" class="myhome_btn" onclick="javascript:location.replace('/myhome/info');" >MY 홈 보기</button>
	</div>
	<div class="breakdown">
		<h4 class="date">${requestScope.nowDay}</h4>
		<div class="bd_no">
			<span class="icon"><img src="/resources/images/main/last_view_no.jpg" width="66" height="81" border="0" alt="" /></span>
			<p>내역이 없습니다</p>
		</div>
	</div>
	<div class="md">
		<c:if test="${!empty requestScope.common_recom_list}">
			<c:set var="view_cnt" value="5"/>
			<div class="md_tit clear">
				<h4>MD 추천 제품</h4>
				<div class="paging_wrap">
					<p><strong id="lvslider1_view_no">1</strong> / 
						<c:set var="temp_view_cnt" value="${requestScope.common_recom_list_size/view_cnt}"/>																			
						<fmt:parseNumber  var="result_view_cnt" value="${temp_view_cnt+((temp_view_cnt%1>0.5)?(1-(temp_view_cnt%1))%1:-(temp_view_cnt%1))}" integerOnly="true"/>
						${result_view_cnt}
					</p>
				</div>
			</div>
			<div class="md_txt">
				<ul class="lvslider1 depth1">
					<c:forEach var="item" items="${requestScope.common_recom_list}" varStatus="state">
						<c:if test="${state.first }">
							<li>
								<ul class="depth2">
						</c:if>							
								<li>
									<a href="/product/detail?req_view_idx=${item.fk_tpsm_idx}" target="_self" class="clear">
										<input type="hidden" name="tpsm_idx" id="tpsm_idx" value="${item.fk_tpsm_idx}" />
										<div class="img">
											<c:set var="view_image" value="${item.fd_img_path_thumbnail}"/>
											<c:if test="${view_image == null or view_image eq '' }">
												<c:set var="view_image" value="${item.fd_img_path}"/>
											</c:if>
											<img src="${view_image}" onerror="this.src='/resources/images/dummy/83x82.png'" width="83" height="82" border="0" alt="" />
										</div>
										<div class="info">
											<div class="info_box">
												<h4>${item.fd_company_info} ㅣ${item.fd_product_name} ㅣ ${item.fd_product_standard}ㅣ ${item.fd_product_unit}</h4>
												<p class="price"><fmt:formatNumber value="${item.shop_product_amount}" pattern="#,###" />원</p>
											</div>
										</div>
									</a>
									<button type="button" class="wish_btn"><img src="/resources/images/main/wish_icon.png" width="25" height="24" border="0" alt="" /></button>
								</li>		
						<c:if test="${(state.index % view_cnt == view_cnt-1) and !state.last and !state.first}">
								</ul>
							</li>
							<li>
								<ul class="depth2">
						</c:if>
						<c:if test="${state.last}">
								</ul>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</c:if>
	</div>
</div>
</c:if>

<c:if test="${!empty requestScope.lately_list }">
	<div class="last_view2 last_view on"> <!-- 최근 본 제품 있음 -->
		<button type="button" class="lastView_close"><img src="/resources/images/main/last_view_close.jpg" width="18" height="18" border="0" alt="" /></button>
		<div class="tit clear">
			<h3>최근 본 제품</h3>
			<button type="button" class="myhome_btn" onclick="javascript:location.replace('/myhome/info');" >MY 홈 보기</button>
		</div>

		<div class="breakdown">
			<ul class="depth1">
				<c:set var="menu_prev_date" value=""></c:set>
				<c:forEach var="item" items="${requestScope.lately_list}" varStatus="state">
				<c:choose>
				<c:when test="${menu_prev_date ne item.view_date}">
				<c:if test="${!state.first}">
			</ul>
			</li>
			</c:if>
			<li>
				<h4 class="date">
						${item.strView_date}
				</h4>
				<c:set var="menu_prev_date" value="${item.view_date}"/>
				<ul class="depth2 clear">
					<li>
						<div class="img">
							<div class="icon_list">
								<div class="li li_option">
									<div>
										<div class="desc">규격<br>확인</div>
									</div>
								</div>
								<div class="li li_insure">
									<div>
										<div class="desc">보험<br>재료</div>
									</div>
								</div>
							</div>
							<a href="/product/detail?req_view_idx=${item.fk_tpsm_idx}" target="_self">
								<c:set var="menu_image" value="${item.fd_img_path_thumbnail}"/>
								<c:if test="${menu_image eq '' }">
									<c:set var="menu_image" value="${item.fd_img_path}"/>
								</c:if>
								<img src="${menu_image}" onerror="this.src='/resources/images/dummy/83x82.png'" width="83" height="82" border="0" alt="" />
							</a>
						</div>
					</li>
					</c:when>
					<c:otherwise>
					<li>
						<div class="img">
							<div class="icon_list">
								<div class="li li_option">
									<div>
										<div class="desc">규격<br>확인</div>
									</div>
								</div>
								<div class="li li_insure">
									<div>
										<div class="desc">보험<br>재료</div>
									</div>
								</div>
							</div>
							<a href="/product/detail?req_view_idx=${item.fk_tpsm_idx}" target="_self">
								<c:set var="menu_image" value="${item.fd_img_path_thumbnail}"/>
								<c:if test="${menu_image eq '' }">
									<c:set var="menu_image" value="${item.fd_img_path}"/>
								</c:if>
								<img src="${menu_image}" onerror="this.src='/resources/images/dummy/83x82.png'" width="83" height="82" border="0" alt="" />
							</a>
						</div>
					</li>
					</c:otherwise>
					</c:choose>

					<c:if test="${state.last}">
					<ul>
			</li>
			</c:if>
			</c:forEach>
			</ul>
		</div>
	
		<div class="md">
			<c:if test="${!empty requestScope.common_recom_list}">
			<c:set var="view_cnt" value="2"/>
				<div class="md_tit clear">
					<h4>MD 추천 제품</h4>
					<div class="paging_wrap">
						<p><strong  id="lvslider1_view_no">1</strong> / 
							<c:set var="temp_view_cnt" value="${requestScope.common_recom_list_size/view_cnt}"/>																			
							<fmt:parseNumber  var="result_view_cnt" value="${temp_view_cnt+((temp_view_cnt%1>0.5)?(1-(temp_view_cnt%1))%1:-(temp_view_cnt%1))}" integerOnly="true"/>
							${result_view_cnt}
						</p>
					</div>
				</div>
				<div class="md_txt">
					<ul class="lvslider1 depth1">
						<c:forEach var="item" items="${requestScope.common_recom_list}" varStatus="state">
							<c:if test="${state.first }">
								<li>
									<ul class="depth2">
							</c:if>							
									<li>
										<a href="/product/detail?req_view_idx=${item.fk_tpsm_idx}" target="_self" class="clear">
											<input type="hidden" name="tpsm_idx" id="tpsm_idx" value="${item.fk_tpsm_idx}" />
											<div class="img">
												<div class="icon_list">
												<div class="li li_option">
													<div>
														<div class="desc">규격<br>확인</div>
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
												<img src="${view_image}" onerror="this.src='/resources/images/dummy/83x82.png'" width="83" height="82" border="0" alt="" />
											</div>
											<div class="info">
												<div class="info_box">
													<h4>${item.fd_company_info} ㅣ${item.fd_product_name} ㅣ ${item.fd_product_standard}ㅣ ${item.fd_product_unit}</h4>
													<p class="price"><fmt:formatNumber value="${item.shop_product_amount}" pattern="#,###" />원</p>
												</div>
											</div>
										</a>
										<button type="button" class="wish_btn"><img src="/resources/images/main/wish_icon.png" width="25" height="24" border="0" alt="" /></button>
									</li>		
							<c:if test="${(state.index % view_cnt == view_cnt-1) and !state.last and !state.first}">
									</ul>
								</li>
								<li>
									<ul class="depth2">
							</c:if>
							<c:if test="${state.last}">
									</ul>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</c:if>
		</div>
	</div>
</c:if>
<!-- 최근 본 제품 우측 팝업 [끝] -->