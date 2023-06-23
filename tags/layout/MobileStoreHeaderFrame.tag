<%@ tag language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<header>
	<section class="header_top">
		<div class="container">
			<div class="row row_between row_gap_32">
				<div class="col">
					<a href="/m/main" class="header_logo"><img src="/resources/images/mobile/m_logo_white.svg" alt="medivalue" /></a>
				</div>
				<div class="col">
					<div class="header_btn_list">
						<a href="/m/main" class="link_home"><img src="/resources/images/mobile/headfoot/icon_home.png" alt="" /></a>
						<a href="#" class="link_event"><img src="/resources/images/mobile/headfoot/icon_event.png" alt="" /></a>
						<a href="/m/basket_cart/list" class="link_cart"><img src="/resources/images/mobile/headfoot/icon_cart.png" alt="" /></a>
						<c:if test="${loginInfo == null}">
							<a href="/m/basket_cart/list" class="link_cart"><img src="/resources/images/mobile/headfoot/icon_login.png" alt="" /></a>
						</c:if>
						<c:if test="${loginInfo !=null}">
							<a href="/m/basket_cart/list" class="link_cart"><img src="/resources/images/mobile/headfoot/icon_logout.png" alt="" /></a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="header_bottom">
		<div class="container container_full">
			<c:choose>
				<c:when test="${page_name eq null}">
					<div class="tx_welcome">
						<c:if test="${loginInfo != null}">${loginInfo.fd_medical_name}님</c:if> 안녕하세요
					</div>
				</c:when>
				<c:otherwise>
					<div class="bar_page_controll">
						<button type="button" class="btn_back"><i class="ic_svg icon_back_white"></i></button>
						<div class="tx_pagename">${page_name}</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</section>
</header>