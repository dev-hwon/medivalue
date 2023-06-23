<%@ tag language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<header>
	<section class="header_top">
		<div class="container container_full">
			<div class="row row_between">
				<div class="col">
					<a href="/" class="header_logo"><img src="/resources/images/mobile/m_logo_white.svg" alt="medivalue" /></a>
				</div>
				<div class="col">
					<div class="header_btn_list">
						<a href="#" class="link_home"><img src="/resources/images/mobile/headfoot/icon_home.png" alt="" /></a>
						<a href="#" class="link_event"><img src="/resources/images/mobile/headfoot/icon_event.png" alt="" /></a>
						<a href="#" class="link_cart"><img src="/resources/images/mobile/headfoot/icon_cart.png" alt="" /></a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="header_bottom">
		<c:choose>
			<c:when test="${page_name eq null}"><div class="tx_welcome">안녕하세요 (치과이름)님</div></c:when>
			<c:otherwise>
				<div class="bar_page_controll">
					<button type="button" class="btn_back"><img src="/resources/images/mobile/icon_back_white.svg" alt="" /></button>
					<div class="tx_pagename">${page_name}</div>
				</div>
			</c:otherwise>
		</c:choose>
	</section>
</header>