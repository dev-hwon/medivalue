<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<c:set var="check_version_info" value="2023052501"/>
        <link rel="stylesheet" href="/resources/css/common.css?v=${check_version_info}"/>
		<link rel="stylesheet" href="/resources/css/headfoot.css?v=${check_version_info}"/>
		<link rel="stylesheet" href="/resources/css/popup.css?v=${check_version_info}"/>
	    <link rel="stylesheet" href="/resources/css/event/2023/evt_group_purchase.css?v=${check_version_info}" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
		<!--  
    	<script type="text/javascript" src="/resources/js/event_limit_purchase.js"></script>
    	-->
    	<script type="text/javascript">
	        $(document).ready(function (){
	                /* 장바구니 버튼 */
					$(".btn_cart").on("click", function(){
	                    var idx = $(this).val();
						var login_check = js_login_check_cart_btn();
	                    var product_name = "#tit_" + idx;
	                    var tpsm_idx = "#tpsm_idx_" + idx;
	                    var tpmm_idx = "#tpmm_idx_" + idx;
	
						var pd_cnt = 1;
						var pd_title =  $.trim($(product_name).html()); // 상품명
						let formData = {};
						let cart_list = [];
	
						if(login_check){
	
							let cart_obj = {
	                            cnt : 1,
	                            tpsm_idx : $(tpsm_idx).val(), // tpsm_idx,
	                            tpmm_idx : $(tpmm_idx).val(), // tpmm_idx
	                            eventType : "Special"
	                        };
	
	                        cart_list.push(cart_obj);
	                        formData["cart_list"] = cart_list;
	
							$.ajax({
								url: '/quickOrder/rest/cart/event/save',
								type: 'post',
								cache: false,
								data: JSON.stringify(formData),
								contentType: 'application/json',
								dataType: 'json',
								success: function (data) {
									if(data['rtn_cd'] != '200'){
										alert(data['rtn_msg']);
									}else{
										popAlarm_renew(pd_title, pd_cnt, data['basket_list_size']);
										labbit_add_to_cart(data.basket_save_list);
									}
								}
							});
						}
					});
	
	                // 차후 common.js로 옮기던, btm을 바꾸던 해야할 듯 _ads
					function popAlarm_renew(pd_title, pd_cnt, basketSize) {
						const $cartAlarm=$("#header .btm .area .real_area .right > ul > li.hd_r_btn3 .cart_alarm"); // .btm 으로 변경
						const $cartNum=$("#header .btm .area .real_area .right > ul > li.hd_r_btn3 > a .cart_num");
						if (pd_cnt > 1) {
							pd_title = pd_title + " 외";
						}
	
						$cartAlarm.find(".pd_tit").text(ConvertTag(pd_title));
						$cartAlarm.find(".pd_desc").text(pd_cnt + "개 제품을 장바구니에 담았습니다");
	
						let count = basketSize;
						$cartNum.text(count);
	
						$cartAlarm.css("display","block");
						$cartNum.css("display","block");
	
						setTimeout(function() {
							$cartAlarm.css("display","none");
						}, 3000);
					}
	
	                function ConvertTag(str){
	                    str = str.replace("&lt;","<");
	                    str = str.replace("&gt;",">");
	                    str = str.replace("&quot;","\"");
	                    str = str.replace("&#39;","\'");
	                    str = str.replace("&amp;","&");
	                    str = str.replace("&nbsp;", "");
	                    return str;
	                }
	
	                function js_login_check_cart_btn(){
						let location_search = location.search;
						let location_pathname = location.pathname;
						let url = location_pathname + location_search;
	
						url = encodeURIComponent(url);
						var rtn_login_check = true;
	
						if ("${loginInfo}" == null){
							$("#pop_alarm_msg").text("로그인 후 이용해 주세요.");
							$(".popup_message_type_1").css("display","block");
							$("#black").css("display","block");
							$(".one_btn").on("click", function () {
								location.href="/access/login?url=" + url;
							});
							rtn_login_check = false;
						}
						return rtn_login_check;
					}
	    	});
        </script>
	</jsp:attribute>
	<jsp:body>
		<div id="event_group_purchase" class="evt_container">
            <section class="area_visual">
                <div class="image">
                    <img src="/resources/images/event_group_purchase/main.jpg?v=${check_version_info}" alt="모여라! 수원시 치과의사, 호주Maverick사 원재료 사용한 소뼈 이종골 MV-XENO 공동구매 특가! 2023.05.15~2023.06.18" />
                </div>
            </section>
            <section class="area_evt1">
                <div class="inner">
                    <div class="evt_top_text">
                        <div class="tx_tit">#수원시치과의사회<br />MV-XENO 공동구매 특가!</div>
                        <div class="tx_summary">오직 수원시치과의사회 회원분들께만!<br />공동구매를 통해 합리적인 가격으로 만나볼 수 있는 절호의 기회!</div>
                        <div class="tx_period">이벤트기간 : 2023.05.24 ~ 2023.06.09</div>
                    </div>
					<div class="evt_goods_list">
						<ul style="justify-content: ${fn:length(event_list) lt 4 ? "center" : "flex-start" }">
							<c:if test="${!empty event_list }">
								<c:forEach var="item" items="${event_list}" varStatus="status">
									<li <c:if test="${item.fd_stock_sell_yn eq 'N'}">class="soldout"</c:if>>
										<div class="item_wrap">
											<div class="item_img g_e_b1_p_img_${item.fk_tpmm_idx}">
												<img src="${item.fd_img_path ne '' ? item.fd_img_path : "/resources/images/no_img.jpg"}" alt=""></div>
											<div class="item_info g_e_b1_p_info_${item.fk_tpmm_idx}">
												<div class="tx_price">
													<c:if test="${item.tpmm_product_amount ne '' and tpmm_product_amount ne '0'}">
														<div class="tx_price_origin"><fmt:formatNumber value="${item.tpmm_product_amount}" pattern="#,###" /> 원</div>
													</c:if>
													<div class="tx_price_discount">
														<%--
														<fmt:formatNumber value="${item.tpsm_product_amount}" pattern="#,###" />원
														 --%>
														<fmt:formatNumber value="${item.tpsm_product_amount-(item.tpsm_product_amount*0.05)}" pattern="#,###" />원
													</div>
												</div>
												<div class="tx_goodsName" id="tit_${item.pk_idx}">${item.fd_product_name }</div>
												<div class="tx_addinfo">
													<div class="row">
														<div class="th">제조사</div>
														<div class="td">${item.fd_company_name}</div>
													</div>
													<div class="row">
														<div class="th">포장단위</div>
														<div class="td">${item.fd_product_unit}</div>
													</div>
												</div>
											</div>
											<div class="item_btnCart g_e_b1_p_cart_${item.fk_tpmm_idx}">
												<button class="btn_cart" type="button" value="${item.pk_idx}">장바구니 담기</button>
												<input type="hidden" id="tpsm_idx_${item.pk_idx}" name="tpsm_idx" value="${item.fk_tpsm_idx}">
	                                			<input type="hidden" id="tpmm_idx_${item.pk_idx}" name="tpmm_idx" value="${item.fk_tpmm_idx}">
											</div>
										</div>
									</li>
								</c:forEach>
							</c:if>
								<%-- 20230131 변경 상품 START --%>
						</ul>
					</div>
					<div class="alert_list">
						<div class="title">공동구매 유의사항</div>
						<div class="list">
							<ul>
								<li><div>본 공동구매 상품은 메디밸류 가입 후에 구매 가능합니다.</div></li>
								<li><div>공동구매 상품 가격은 5% 포인트 사용이 반영된 가격입니다.</div></li>
								<li><div>본 공동구매를 통해 구입한 상품은 <em>단순변심으로 인한 교환/환불/반품이 불가능</em>합니다.<br />
                                    (제품 파손 및 하자에 의한 교환/반품/환불은 가능)</div></li>
								<li><div>공동구매 기간 동안 <em>신규가입시 추천인코드에 [수원시치과의사회] 입력시 50,000포인트가 지급</em>됩니다.</div></li>
								<li><div>공동구매 기간 동안 <em>기존 메디밸류 가입 치과는 5.24(수)에 자동으로 50,000포인트가 지급</em>됩니다.</div></li>
								<li><div>공동구매 기간 동안 <em>지급된 50,000포인트의 유효기간은 5.24(수)~6.09(금)까지</em>이며<br />해당 기간 이후에는 자동으로 소멸됩니다.</div></li>
								<li><div>포인트 즉시할인 쿠폰은 공동구매 종료 후 일괄 지급됩니다.</div></li>
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