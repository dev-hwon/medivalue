<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
	    <link rel="stylesheet" href="/resources/css/event_special_price.css?v=20230608" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
        <style type="text/css">
            .snb .top_btn {
                height: 200px !important;
            }
        </style>
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>		
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
    	<script type="text/javascript" src="/resources/js/event_first_purchase.js?v=20230608"></script>
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
							url: '/quickOrder/rest/cart/save',
							type: 'post',
							cache: false,
							data: JSON.stringify(formData),
							contentType: 'application/json',
							dataType: 'json',
							success: function (data) {
								if(data['rtn_cd'] != '200'){
									// alert(data['rtn_msg']);
                                    loginPopupLayer();
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

                function loginPopupLayer() {

                    if ("${loginInfo}" == ""){
						$("#pop_alarm_msg").text("로그인 후 이용해 주세요.");
						$(".popup_message_type_1").css("display","block");
						$("#black").css("display","block");
						$(".one_btn").on("click", function () {
							location.href="/access/login?eventPage=true";
						});
						return false;
					}

                    return true

                }

                function js_login_check_cart_btn(){
					let location_search = location.search;
					let location_pathname = location.pathname;
					let url = location_pathname + location_search;

					url = encodeURIComponent(url);
					var rtn_login_check = true;

					rtn_login_check = loginPopupLayer();

					return rtn_login_check;
				}
    	});
        </script>
	</jsp:attribute>
	<jsp:body>
		<section id="event_special_price" class="sub">
	        <article class="atc_visual">
                <div class="text">
                    <div class="txt_01"><img src="/resources/images/event_special_price/txt_visual_01.png" alt=""></div>
                </div>

                <div class="list">
                	<ul>
                		<li>
                			<div>
                				<a href="javascript:scrollToMove('atc_benefit_01');">
                					<div class="tit">혜택 #1</div>
                					<div class="desc">최대 81%<br>파격 특가 제품 보기</div>
                                    <div class="img"><img src="/resources/images/event_special_price/ico_visual_arrow.png" alt=""></div>
                				</a>
                			</div>
                		</li>
                		<%--<li>
                			<div>
                				<a href="javascript:scrollToMove('atc_benefit_02');">
                					<div class="tit">혜택 #2</div>
                					<div class="desc">창고대방출<br>땡처리 알뜰 제품 보기</div>
                                    <div class="img"><img src="/resources/images/event_special_price/ico_visual_arrow.png" alt=""></div>
                				</a>
                			</div>
                		</li>--%>
                	</ul>
                </div>
	        </article>
            <article class="atc_benefit_01" id="atc_benefit_01">
	            <div class="inner">
	                <div class="atc_text">
                        <div class="num">#1</div>
                        <div class="tit">파격특가 놓치면 손해!</div>
                        <div class="desc">상시 업데이트 되는 최대 81% 특가 제품,<br>
                            <b>오직 메디밸류에서만 만날 수 있는 가격에 구매하세요~</b>
                        </div>
                        <div class="img">
                            <img src="/resources/images/event_special_price/img_benefit_01.png" alt="">
                        </div>
                    </div>
	                <div class="content on">
	                    <div class="benefit_01_list">
                            <ul>
                                <c:if test="${!empty sp_list}">
                                    <c:forEach var="item" items="${sp_list}"  varStatus="status">
                                    <li <c:if test="${item.fd_stock_sell_yn eq 'N'}">class="soldout"</c:if>>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img" style="text-align: center;">
                                                <img src="${item.fd_img_path}" alt="${item.fd_product_name}" style="width: auto; height: 247px;" onerror="this.src='/resources/images/dummy/img_ready_for_image.jpg'">
                                            </div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime"><fmt:formatNumber value="${item.tpmm_product_amount}"/>원</div>
                                                    <div class="discount"><fmt:formatNumber value="${item.tpsm_product_amount}"/>원</div>
                                                </div>
                                                <div id="tit_${item.pk_idx}" class="tit">${item.fd_product_name} (${fn:replace(item.fd_product_standard,'&nbsp;','')})</div>
                                                <div class="desc">
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
                                            <div class="btn">
                                                <button class="btn_cart" type="button" value="${item.pk_idx}">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                    <input type="hidden" id="tpsm_idx_${item.pk_idx}" name="tpsm_idx" value="${item.fk_tpsm_idx}">
	                                <input type="hidden" id="tpmm_idx_${item.pk_idx}" name="tpmm_idx" value="${item.fk_tpmm_idx}">
                                </li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </div>
                        <c:if test="${fn:length(sp_list) > 8}">
                            <%--<div class="button_wrap">
                                <a href="javascript:;" onclick="btnMore(this);" class="btn_more">특가 제품 <span>더 보기</span></a>
                                <a href="javascript:;" onclick="scrollToMove('atc_benefit_02');" class="btn_scroll">창고대방출 땡처리 알뜰 제품 보기</a>
                            </div>--%>
                        </c:if>
	                </div>
	            </div>
	        </article>
            <%--<article class="atc_benefit_02" id="atc_benefit_02">
	            <div class="inner">
	                <div class="atc_text">
                        <div class="num">#2</div>
                        <div class="tit">창고대방출 한정수량 땡처리</div>
                        <div class="desc">물류창고 보관상 박스나 비닐 포장 상태만 조금<br>
                            지저분 할 뿐, <b>새제품이니 걱정마시고 알뜰 구매하세요!</b>
                        </div>
                        <div class="img">
                            <img src="/resources/images/event_special_price/img_benefit_02_shadow.png" alt="" class="shadow">
                            <img src="/resources/images/event_special_price/img_benefit_02.png" alt="">
                        </div>
                    </div>
	                <div class="content">
                        <div class="benefit_01_list">
                            <ul>
                                <c:if test="${!empty dp_list}">
                                    <c:forEach var="item" items="${dp_list}"  varStatus="status">
                                    <li <c:if test="${item.fd_stock_sell_yn eq 'N'}">class="soldout"</c:if>>
                                        <div>
                                            <a href="javascript:;">
                                                <div class="img" style="text-align: center;">
                                                    <img src="${item.fd_img_path}" alt="${item.fd_product_name}" style="width: auto; height: 247px;" onerror="this.src='/resources/images/dummy/img_ready_for_image.jpg'">
                                                </div>
                                                <div class="txt">
                                                    <div class="price">
                                                        <div class="prime"><fmt:formatNumber value="${item.tpmm_product_amount}"/>원</div>
                                                        <div class="discount"><fmt:formatNumber value="${item.tpsm_product_amount}"/>원</div>
                                                    </div>
                                                    <div id="tit_${item.pk_idx}" class="tit">${item.fd_product_name} (${item.fd_product_standard})</div>
                                                    <div class="desc">
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
                                                <div class="btn">
                                                    <button class="btn_cart" type="button" value="${item.pk_idx}">장바구니 담기</button>
                                                </div>
                                            </a>
                                        </div>
                                        <input type="hidden" id="tpsm_idx_${item.pk_idx}" name="tpsm_idx" value="${item.fk_tpsm_idx}">
                                        <input type="hidden" id="tpmm_idx_${item.pk_idx}" name="tpmm_idx" value="${item.fk_tpmm_idx}">
                                    </li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </div>
                        <c:if test="${fn:length(dp_list) > 8}">
                            <div class="button_wrap">
                                <a href="javascript:;" onclick="btnMore(this);" class="btn_more">땡처리 제품 <span>더 보기</span></a>
                            </div>
                        </c:if>
                        <div class="alert_list">
                            <div class="title">꼭 읽어주세요!</div>
                            <div class="list">
                                <ul>
                                    <li>
                                        <div>본 이벤트 상품은 한정수량 제품으로 재고 소진시 주문 취소가 될 수 있습니다.</div>
                                    </li>
                                </ul>
                            </div>
                        </div>
	                </div>
	            </div>
	        </article>--%>
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
	    </section>
	</jsp:body>
</layout:basicFrame>