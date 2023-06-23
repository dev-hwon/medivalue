<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:MobileStoreFrame>
    <jsp:attribute name="stylesheet">
	    <link href="/resources/css/mobile/home.css" rel="stylesheet" >
	</jsp:attribute>
    <jsp:body>
        <div class="m_contents">
            <section class="area_main_banner">
                <div class="container container_full">
                    <div class="tx_wrap">
                        <div class="tx_tit">메디밸류<br />간편 구매 서비스 OPEN</div>
                        <div class="tx_desc">모바일에서도 빠르고 쉽게 구매하세요 </div>
                    </div>
                </div>
            </section>

            <section class="area_main_service">
                <div class="container">
                    <div class="link_banner link_ai_list">
                        <a href="/m/ai/list">
                            <div class="tx_tit">AI 위시리스트</div>
                            <div class="tx_desc">회원님께 꼭 맞는 상품을 추천해요</div>
                            <img src="/resources/images/mobile/img_thumb.png" alt="" class="img_obj" />
                        </a>
                        <span class="list_cnt">                        	
                        	<c:set var="wish_cnt" value="${requestScope.wish_list_size}"/>
                        	<c:choose>
                        		<c:when test="${wish_cnt > 99}">99+</c:when>
                        		<c:otherwise>${wish_cnt }</c:otherwise>
                        	</c:choose>
                        </span>
                    </div>
                    <div class="link_banner link_cart_list">
                        <a href="/m/basket_cart/list">
                            <div class="tx_tit">나의 장바구니</div>
                            <div class="tx_desc">모바일에서 편리하게 구매해요</div>
                            <img src="/resources/images/mobile/img_cart.png" alt="" class="img_obj" />
                        </a>
                        <span class="list_cnt">
                        	<c:set var="basket_cnt" value="${requestScope.basket_list_size}"/>
                        	<c:choose>
                        		<c:when test="${basket_cnt > 99}">99+</c:when>
                        		<c:otherwise>${basket_cnt }</c:otherwise>
                        	</c:choose>
                        </span>
                    </div>
                </div>
            </section>
            <section class="area_bottom_banner">
                <a href=""><img src="/resources/images/mobile/home/img_bottom_banner.png" alt="" /></a>
            </section>
        </div>
        <layout:MobileStoreFooterFrame />
    </jsp:body>
</layout:MobileStoreFrame>
