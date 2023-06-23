<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<c:set var="check_version_info" value="2023052301"/>
		<link rel="stylesheet" href="/resources/css/common.css?v=${check_version_info}"/>
		<link rel="stylesheet" href="/resources/css/headfoot.css?v=${check_version_info}"/>
		<link rel="stylesheet" href="/resources/css/popup.css?v=${check_version_info}"/>
		<%-- <link rel="stylesheet" href="/resources/css/main.css?v=${check_version_info}"/> --%>
	    <link rel="stylesheet" href="/resources/css/event/2023/evt_mvxeno.css?v=${check_version_info}" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?v=${check_version_info}"></script>
		<script type="text/javascript" src="/resources/js/event_limit_purchase.js"></script>
		<%--
    	<script type="text/javascript" src="/resources/js/event_first_purchase.js?v=${check_version_info}"></script>
    	 --%>
	</jsp:attribute>
	<jsp:body>
		<div id="event_mvxeno" class="evt_container">
	        <section class="area_visual">
				<img src="/resources/images/event_promotion/event_mvxeno_re.jpg?v=${check_version_info}" alt="MV-XENO 전세계 70개국 수출, 호주 Maverick사 원재료 사용, 웰컴패키지구매시 시중가 124,000원 하이 스피드 옵틱핸드피스 무료증정(보증기간3개월)" />
	        </section>
            <section class="area_evt1">
	            <div class="inner">
	                <div class="evt_top_text">
                        <div class="tx_tit">#웰컴 패키지<br />MV-XENO 첫 구매 혜택</div>
                        <div class="tx_summary">MV-XENO를 처음 구매하시나요?<br />웰컴 패키지 구매시 사은품을 드려요!</div>
                        <div class="tx_info_box">웰컴 패키지 구매시, [시중가 124,000원 핸드피스] 1개 증정!</div>
						<div class="tx_add_info">(하이 스피드 옵틱 핸드피스 KAVO호환 타입/NSK PTL 호환 타입 중 선택)</div>
                    </div>
					<div class="evt_goods_list">
						<ul style="justify-content: ${fn:length(list) lt 3 ? "center" : "flex-start" }">
							<c:if test="${!empty list }">
								<c:forEach var="item" items="${list}" varStatus="status">
									<li>
										<div class="item_wrap">
											<div class="item_img g_e_b1_p_img_${item.fk_tpmm_idx}">
												<img src="${item.fd_img_path ne '' ? item.fd_img_path : "/resources/images/no_img.jpg"}" alt=""></div>
											<div class="item_info g_e_b1_p_info_27862">
												<div class="tx_price">
													<c:if test="${item.fd_view_amount ne '' and fd_view_amount ne '0'}">
														<div class="tx_price_origin"><fmt:formatNumber value="${item.fd_view_amount}" pattern="#,###" /> 원</div>
													</c:if>
													<div class="tx_price_discount"><fmt:formatNumber value="${item.shop_sale_amount}" pattern="#,###" />원</div>
												</div>
												<div class="tx_goodsName">${item.fd_product_name }</div>
												<div class="tx_memo">${item.fd_extra_memo}</div>
												<div class="tx_addinfo">
													<div class="row">
														<div class="th">제조사</div>
														<div class="td">${item.fd_company_info}</div>
													</div>
													<div class="row">
														<div class="th">포장단위</div>
														<div class="td">${item.fd_product_unit}</div>
													</div>
												</div>
											</div>
											<div class="item_btnCart g_e_b1_p_cart_${item.fk_tpmm_idx}">
												<c:choose>
													<c:when test="${member_yn eq 'N'}"><button class="btn_cart" type="button" onclick="layerAlertLogin();">장바구니 담기</button></c:when>
													<c:when test="${order_check >=1}">
														<button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button>
													</c:when>
													<c:when test="${order_check == 0 and cart_yn eq 'N'}">
														<button class="btn_cart cart_put_new" type="button" onclick="addCart('${item.fk_tpmm_idx }','${item.fk_tpsm_idx }','0','${member_yn}','${item.fd_product_name} ${item.fd_product_unit}','${item.shop_sale_amount}');">장바구니 담기</button>
														<button class="btn_cart cart_put_re" type="button" onclick="layerAlertChange('${item.fk_tpmm_idx }','${item.fk_tpsm_idx }','0','${member_yn}','${item.fd_product_name} ${item.fd_product_unit}','${item.shop_sale_amount}');" style="display: none;">장바구니 담기</button>
													</c:when>
													<c:when test="${order_check == 0 and cart_yn eq 'Y'}">
														<button class="btn_cart" type="button" onclick="layerAlertChange('${item.fk_tpmm_idx }','${item.fk_tpsm_idx }','0','${member_yn}','${item.fd_product_name } ${item.fd_product_unit }','${item.shop_sale_amount}');">장바구니 담기</button>
													</c:when>
													<c:otherwise><button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button></c:otherwise>
												</c:choose>
											</div>
										</div>
									</li>
								</c:forEach>
							</c:if>
								<%-- 20230131 변경 상품 START --%>
						</ul>
					</div>
					<div class="alert_list">
						<div class="title">꼭 읽어주세요!</div>
						<div class="list">
							<ul>
								<li><div>본 패키지 상품 구성 0.25g만 해당됩니다.</div></li>
								<li><div>본 패키지 상품 구매시 0.25g 10개와 핸드피스 1개가 배송 됩니다.</div></li>
								<li><div>본 패키지 상품의 구매 수량은 1개만 가능합니다.</div></li>
								<li><div>핸드피스 KAVO 및 NSK PTL 호환 타입 중 1개만 구매 가능합니다.</div></li>
								<li><div>본 패키지 상품의 포인트 사용 및 적립 가능합니다.</div></li>
								<li><div>본 패키지 상품의 구매는 ID당 1회로 제한됩니다.</div></li>
								<li><div>이종 재료 이식용뼈로 골 결손부위의 대체, 수복, 재건을 위해 사용한다.</div></li>
								<li><div>이 제품은 '의료기기'이며, '사용상의 주의사항'과 '사용방법'을 잘 읽고 사용하십시오</div></li>
							</ul>
						</div>
					</div>
	            </div>
	        </section>
            <div class="layer_alert">
                <div class="bg" onclick="layerAlertClose();"></div>
                <div class="cont">
                    <div class="head">
                        <div class="alert_inner">
                            <div class="title">알림메세지</div>
                            <div class="btn"><button class="btn_close" type="button" onclick="layerAlertClose();"><img src="/resources/images/event_first_purchase/ico_layer_alert_close.png" alt=""></button></div>
                        </div>
                    </div>
                    <div class="body">
                        <div class="txt">이미 이벤트 제품이 있습니다.<br>교체하시겠습니까?</div>
                    </div>
                    <div class="foot">
                        <div class="btn">
                            <button type="button" class="btn_cancel" onclick="layerAlertClose();">취소</button>
                            <button type="button" class="btn_ok">확인</button>
                        </div>
                    </div>
                </div>
            </div>
	    </div>
	</jsp:body>
</layout:basicFrame>