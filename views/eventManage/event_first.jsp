<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<layout:basicFrame>	
	<jsp:attribute name="stylesheet">
		<c:set var="check_version_info" value="20220711"/>
		<link rel="stylesheet" href="/resources/css/main.css?v=${check_version_info}"/>
	    <link rel="stylesheet" href="/resources/css/event_first_purchase.css?v=${check_version_info}" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?v=${check_version_info}"></script>
    	<script type="text/javascript" src="/resources/js/event_first_purchase.js?v=${check_version_info}"></script>
    	<script type="text/javascript">
    		$(document).ready(function (){
    			
    		});
    	</script>
	</jsp:attribute>
	<jsp:body>
		<section id="event_first_purchase" class="sub">
	        <article class="atc_visual">
                <div class="text">
                    <div class="txt_01"><img src="/resources/images/event_first_purchase/txt_visual_01.png" alt=""></div>
                </div>
                <div class="image">
                    <div class="img_01"><img src="/resources/images/event_first_purchase/img_visual_01.png" alt=""></div>
                </div>
                <div class="list">
                	<ul>
                		<li>
                			<div>
                				<a href="javascript:scrollToMove('atc_benefit_01');" class="g_e_h_benefit1">
                					<div class="tit">혜택 1</div>
                					<div class="desc">인기상품<br>100원 구매</div>
                				</a>
                			</div>
                		</li>
                		<li>
                			<div>
                				<a href="javascript:scrollToMove('atc_benefit_02');" class="g_e_h_benefit2">
                					<div class="tit">혜택 2</div>
                					<div class="desc">한 달 내내<br>무료배송</div>
                				</a>
                			</div>
                		</li>
                		<li>
                			<div>
                				<a href="javascript:scrollToMove('atc_benefit_02');" class="g_e_h_benefit3">
                					<div class="tit">혜택 3</div>
                					<div class="desc">첫 주문 후<br>한 달 동안 5% 적립</div>
                				</a>
                			</div>
                		</li>
                	</ul>
                </div>
                <div class="button">
                	<a href="javascript:;" onclick="getAllBenefit('${member_yn}');" class="g_e_h_benefit_join">가입하고 혜택 받기 ></a>
                </div>
	        </article>
            <article class="atc_benefit_01" id="atc_benefit_01">
	            <div class="inner">
	                <div class="atc_text">
                        <div class="num">#1</div>
                        <div class="tit">첫 구매 특별 혜택</div>
                        <div class="desc">메디밸류에서 처음 구매하시나요?<br>
                            <b>이벤트 상품 중 하나를 100원에 구매할 수 있어요!</b>
                        </div>
                        <div class="alert">
                        	<b>100원 특가 상품 구매시 [Luminous Zircon Prophy Paste] 1개 증정</b><br>
                        	<span>유효기간: 2023-06 (재고 소진시 이벤트 종료)</span>
                        </div>
                    </div>
	                <div class="content">
	                    <div class="benefit_01_list">
                            <ul>
                            
                            	<%-- 20230131 변경 상품 START --%>
                            	<li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img g_e_b1_p_img_27862"><img src="/resources/images/event_first_purchase/img_benefit_01_14.jpg" alt=""></div>
                                            <div class="txt g_e_b1_p_info_27862">
                                                <div class="price">
                                                    <div class="prime">10,380원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">[ASA Suction tip]</div>
                                                <div class="alert">구매시 [Luminous Zircon Prophy Paste]<br>1개 증정 (60개 수량 한정)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">ASADental</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">100ea (3묶음)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn g_e_b1_p_cart_27862">
                                            	<c:choose>	
                                            		<c:when test="${member_yn eq 'N'}"><button class="btn_cart" type="button" onclick="layerAlertLogin();">장바구니 담기</button></c:when>
                                            		<c:when test="${order_check >=1}">
	                                            		<button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button>
	                                            	</c:when>
                                            		<c:when test="${order_check == 0 and cart_yn eq 'N'}">
                                            			<button class="btn_cart cart_put_new" type="button" onclick="addCart('27862','525238','15','${member_yn}','ASA Suction tip 100ea (3묶음)');">장바구니 담기</button>
                                            			<button class="btn_cart cart_put_re" type="button" onclick="layerAlertChange('27862','525238','15','${member_yn}','ASA Suction tip 100ea (3묶음)');" style="display: none;">장바구니 담기</button>
                                            		</c:when>
                                            		<c:when test="${order_check == 0 and cart_yn eq 'Y'}">
                                            			<button class="btn_cart" type="button" onclick="layerAlertChange('27862','525238','15','${member_yn}','ASA Suction tip 100ea (3묶음)');">장바구니 담기</button>
                                            		</c:when>
                                            		<c:otherwise><button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button></c:otherwise>
                                            	</c:choose>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img g_e_b1_p_img_27863"><img src="/resources/images/event_first_purchase/img_benefit_01_15.jpg" alt=""></div>
                                            <div class="txt g_e_b1_p_info_27863">
                                                <div class="price">
                                                    <div class="prime">12,600원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">[Powder Free Latex Gloves] XS</div>
                                                <div class="alert">구매시 [Luminous Zircon Prophy Paste]<br>1개 증정 (60개 수량 한정)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">King</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">100ea (2묶음)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn g_e_b1_p_cart_27863">
                                            	<c:choose>	
                                            		<c:when test="${member_yn eq 'N'}"><button class="btn_cart" type="button" onclick="layerAlertLogin();">장바구니 담기</button></c:when>
                                            		<c:when test="${order_check >=1}">
	                                            		<button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button>
	                                            	</c:when>
                                            		<c:when test="${order_check == 0 and cart_yn eq 'N'}">
                                            			<button class="btn_cart cart_put_new" type="button" onclick="addCart('27863','525243','15','${member_yn}','[Powder Free Latex Gloves] XS');">장바구니 담기</button>
                                            			<button class="btn_cart cart_put_re" type="button" onclick="layerAlertChange('27863','525243','15','${member_yn}','[Powder Free Latex Gloves] XS');" style="display: none;">장바구니 담기</button>
                                            		</c:when>
                                            		<c:when test="${order_check == 0 and cart_yn eq 'Y'}">
                                            			<button class="btn_cart" type="button" onclick="layerAlertChange('27863','525243','15','${member_yn}','[Powder Free Latex Gloves] XS');">장바구니 담기</button>
                                            		</c:when>
                                            		<c:otherwise><button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button></c:otherwise>
                                            	</c:choose>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img g_e_b1_p_img_27864"><img src="/resources/images/event_first_purchase/img_benefit_01_16.jpg" alt=""></div>
                                            <div class="txt g_e_b1_p_info_27864">
                                                <div class="price">
                                                    <div class="prime">11,800원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">[K-File] <span>25mm, #15</span></div>
                                                <div class="alert">구매시 [Luminous Zircon Prophy Paste]<br>1개 증정 (60개 수량 한정)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">Mani</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">6ea (2박스)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn g_e_b1_p_cart_27864">
                                            	<c:choose>	
                                            		<c:when test="${member_yn eq 'N'}"><button class="btn_cart" type="button" onclick="layerAlertLogin();">장바구니 담기</button></c:when>
                                            		<c:when test="${order_check >=1}">
	                                            		<button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button>
	                                            	</c:when>
                                            		<c:when test="${order_check == 0 and cart_yn eq 'N'}">
                                            			<button class="btn_cart cart_put_new" type="button" onclick="addCart('27864','525239','15','${member_yn}','[K-File] 25mm #15');">장바구니 담기</button>
                                            			<button class="btn_cart cart_put_re" type="button" onclick="layerAlertChange('27864','525239','15','${member_yn}','[K-File] 25mm #15');" style="display: none;">장바구니 담기</button>
                                            		</c:when>
                                            		<c:when test="${order_check == 0 and cart_yn eq 'Y'}">
                                            			<button class="btn_cart" type="button" onclick="layerAlertChange('27864','525239','15','${member_yn}','[K-File] 25mm #15');">장바구니 담기</button>
                                            		</c:when>
                                            		<c:otherwise><button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button></c:otherwise>
                                            	</c:choose>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img g_e_b1_p_img_27865"><img src="/resources/images/event_first_purchase/img_benefit_01_17.jpg" alt=""></div>
                                            <div class="txt g_e_b1_p_info_27865">
                                                <div class="price">
                                                    <div class="prime">10,000원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">[Diamond point FG] <span>21-EX</span></div>
                                                <div class="alert">구매시 [Luminous Zircon Prophy Paste]<br>1개 증정 (60개 수량 한정)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">Mani</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">5ea (1박스)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn g_e_b1_p_cart_27865">
                                            	<c:choose>	
                                            		<c:when test="${member_yn eq 'N'}"><button class="btn_cart" type="button" onclick="layerAlertLogin();">장바구니 담기</button></c:when>
                                            		<c:when test="${order_check >=1}">
	                                            		<button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button>
	                                            	</c:when>
                                            		<c:when test="${order_check == 0 and cart_yn eq 'N'}">
                                            			<button class="btn_cart cart_put_new" type="button" onclick="addCart('27865','525241','15','${member_yn}','[Diamond point FG] 21-EX');">장바구니 담기</button>
                                            			<button class="btn_cart cart_put_re" type="button" onclick="layerAlertChange('27865','525241','15','${member_yn}','[Diamond point FG] 21-EX');" style="display: none;">장바구니 담기</button>
                                            		</c:when>
                                            		<c:when test="${order_check == 0 and cart_yn eq 'Y'}">
                                            			<button class="btn_cart" type="button" onclick="layerAlertChange('27865','525241','15','${member_yn}','[Diamond point FG] 21-EX');">장바구니 담기</button>
                                            		</c:when>
                                            		<c:otherwise><button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button></c:otherwise>
                                            	</c:choose>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img g_e_b1_p_img_27866"><img src="/resources/images/event_first_purchase/img_benefit_01_18.jpg" alt=""></div>
                                            <div class="txt g_e_b1_p_info_27866">
                                                <div class="price">
                                                    <div class="prime">10,800원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">[Mixing Tip] <span>오랄팁 포함</span></div>
                                                <div class="alert">구매시 [Luminous Zircon Prophy Paste]<br>1개 증정 (60개 수량 한정)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">덴탈인</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">50ea (3묶음)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn g_e_b1_p_cart_27866">
                                            	<c:choose>	
                                            		<c:when test="${member_yn eq 'N'}"><button class="btn_cart" type="button" onclick="layerAlertLogin();">장바구니 담기</button></c:when>
                                            		<c:when test="${order_check >=1}">
	                                            		<button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button>
	                                            	</c:when>
                                            		<c:when test="${order_check == 0 and cart_yn eq 'N'}">
                                            			<button class="btn_cart cart_put_new" type="button" onclick="addCart('27866','525240','15','${member_yn}','[Mixing Tip] 오랄팁 포함');">장바구니 담기</button>
                                            			<button class="btn_cart cart_put_re" type="button" onclick="layerAlertChange('27866','525240','15','${member_yn}','[Mixing Tip] 오랄팁 포함');" style="display: none;">장바구니 담기</button>
                                            		</c:when>
                                            		<c:when test="${order_check == 0 and cart_yn eq 'Y'}">
                                            			<button class="btn_cart" type="button" onclick="layerAlertChange('27866','525240','15','${member_yn}','[Mixing Tip] 오랄팁 포함');">장바구니 담기</button>
                                            		</c:when>
                                            		<c:otherwise><button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button></c:otherwise>
                                            	</c:choose>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <%-- 20230131 변경 상품 END --%>

                                <%--
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img g_e_b1_p_img_26608"><img src="/resources/images/event_first_purchase/img_benefit_01_01.jpg" alt=""></div>
                                            <div class="txt g_e_b1_p_info_26608">
                                                <div class="price">
                                                    <div class="prime">12,000원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">소독포<span>(45cm*45cm)</span></div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">국산</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">1ea (4개)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn g_e_b1_p_cart_26608">
                                            	<c:choose>	
                                            		<c:when test="${member_yn eq 'N'}"><button class="btn_cart" type="button" onclick="layerAlertLogin();">장바구니 담기</button></c:when>
                                            		<c:when test="${order_check >=1}">
	                                            		<button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button>
	                                            	</c:when>
                                            		<c:when test="${order_check == 0 and cart_yn eq 'N'}">
                                            			<button class="btn_cart cart_put_new" type="button" onclick="addCart('26608','495580','15','${member_yn}','소독포(45cm*45cm)');">장바구니 담기</button>
                                            			<button class="btn_cart cart_put_re" type="button" onclick="layerAlertChange('26608','495580','15','${member_yn}','소독포(45cm*45cm)');" style="display: none;">장바구니 담기</button>
                                            		</c:when>
                                            		<c:when test="${order_check == 0 and cart_yn eq 'Y'}">
                                            			<button class="btn_cart" type="button" onclick="layerAlertChange('26608','495580','15','${member_yn}','소독포(45cm*45cm)');">장바구니 담기</button>
                                            		</c:when>
                                            		<c:otherwise><button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button></c:otherwise>
                                            	</c:choose>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <%-- <li class="">
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img g_e_b1_p_img_26609"><img src="/resources/images/event_first_purchase/img_benefit_01_02.jpg" alt=""></div>
                                            <div class="txt g_e_b1_p_info_26609">
                                                <div class="price">
                                                    <div class="prime">10,800원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">코소공포<span>(45cm*50cm)</span></div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">국산</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">1ea (4개)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn g_e_b1_p_cart_26609">
                                            	<c:choose>
                                            		<c:when test="${member_yn eq 'N'}"><button class="btn_cart" type="button" onclick="layerAlertLogin();">장바구니 담기</button></c:when>                                            	
	                                            	<c:when test="${order_check >=1}">
	                                            		<button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button>
	                                            	</c:when>
	                                           		<c:when test="${order_check == 0  and cart_yn eq 'N'}">
	                                           			<button class="btn_cart cart_put_new" type="button" onclick="addCart('26609','495586','15','${member_yn}','코소공포(45cm*50cm)');">장바구니 담기</button>
	                                           			<button class="btn_cart cart_put_re" type="button" onclick="layerAlertChange('26609','495586','15','${member_yn}','코소공포(45cm*50cm)');" style="display: none;">장바구니 담기</button>
	                                           		</c:when>
	                                           		<c:when test="${order_check == 0 and cart_yn eq 'Y'}">
                                            			<button class="btn_cart" type="button" onclick="layerAlertChange('26609','495586','15','${member_yn}','코소공포(45cm*50cm)');">장바구니 담기</button>
                                            		</c:when>
	                                           		<c:otherwise><button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button></c:otherwise>
	                                           	</c:choose>
                                            </div>
                                        </a>
                                    </div>
                                </li> -- % >
                                <li class="soldout">
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img g_e_b1_p_img_26612"><img src="/resources/images/event_first_purchase/img_benefit_01_03.jpg" alt=""></div>
                                            <div class="txt g_e_b1_p_info_26612">
                                                <div class="price">
                                                    <div class="prime">13,840원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">ASA Suction tip</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">ASADental</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">100ea (4묶음)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn g_e_b1_p_cart_26612">
                                            	<c:choose>
	                                            	<c:when test="${member_yn eq 'N'}"><button class="btn_cart" type="button" onclick="layerAlertLogin();">장바구니 담기</button></c:when>
	                                            	<c:when test="${order_check >=1}">
	                                            		<button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button>
	                                            	</c:when>
	                                           		<c:when test="${order_check == 0 and cart_yn eq 'N'}">
	                                           			<button class="btn_cart cart_put_new" type="button" onclick="addCart('26612','495604','15','${member_yn}','ASA Suction tip');">장바구니 담기</button>
	                                           			<button class="btn_cart cart_put_re" type="button" onclick="layerAlertChange('26612','495604','15','${member_yn}','ASA Suction tip');" style="display: none;">장바구니 담기</button>
	                                           		</c:when>
	                                           		<c:when test="${order_check == 0 and cart_yn eq 'Y'}">
                                            			<button class="btn_cart" type="button" onclick="layerAlertChange('26612','495604','15','${member_yn}','ASA Suction tip');">장바구니 담기</button>
                                            		</c:when>
	                                           		<c:otherwise><button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button></c:otherwise>
                                           		</c:choose>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <%-- <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img g_e_b1_p_img_26583"><img src="/resources/images/event_first_purchase/img_benefit_01_04.jpg" alt=""></div>
                                            <div class="txt g_e_b1_p_info_26583">
                                                <div class="price">
                                                    <div class="prime">13,200원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">Green Mixing Tip</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">덴탈인</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">50ea (3묶음)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn g_e_b1_p_cart_26583">
                                            	<c:choose>
	                                            	<c:when test="${member_yn eq 'N'}"><button class="btn_cart" type="button" onclick="layerAlertLogin();">장바구니 담기</button></c:when>
	                                            	<c:when test="${order_check >=1}">
	                                            		<button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button>
	                                            	</c:when>
	                                           		<c:when test="${order_check == 0 and cart_yn eq 'N'}">
	                                           			<button class="btn_cart cart_put_new" type="button" onclick="addCart('26583','495445','15','${member_yn}','Green Mixing Tip');">장바구니 담기</button>
	                                           			<button class="btn_cart cart_put_re" type="button" onclick="layerAlertChange('26583','495445','15','${member_yn}','Green Mixing Tip');" style="display: none;">장바구니 담기</button>
	                                           		</c:when>
	                                           		<c:when test="${order_check == 0 and cart_yn eq 'Y'}">
                                            			<button class="btn_cart" type="button" onclick="layerAlertChange('26583','495445','15','${member_yn}','Green Mixing Tip');">장바구니 담기</button>
                                            		</c:when>
	                                           		<c:otherwise><button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button></c:otherwise>
                                           		</c:choose>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img g_e_b1_p_img_26584"><img src="/resources/images/event_first_purchase/img_benefit_01_05.jpg" alt=""></div>
                                            <div class="txt g_e_b1_p_info_26584">
                                                <div class="price">
                                                    <div class="prime">13,200원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">Yellow Mixing Tip</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">덴탈인</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">50ea (3묶음)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn g_e_b1_p_cart_26584">
                                            	<c:choose>
	                                            	<c:when test="${member_yn eq 'N'}"><button class="btn_cart" type="button" onclick="layerAlertLogin();">장바구니 담기</button></c:when>
	                                            	<c:when test="${order_check >=1}">
	                                            		<button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button>
	                                            	</c:when>
	                                           		<c:when test="${order_check == 0 and cart_yn eq 'N'}">
	                                           			<button class="btn_cart cart_put_new" type="button" onclick="addCart('26584','495451','15','${member_yn}','Yellow Mixing Tip');">장바구니 담기</button>
	                                           			<button class="btn_cart cart_put_re" type="button" onclick="layerAlertChange('26584','495451','15','${member_yn}','Yellow Mixing Tip');" style="display: none;">장바구니 담기</button>
	                                           		</c:when>
	                                           		<c:when test="${order_check == 0 and cart_yn eq 'Y'}">
                                            			<button class="btn_cart" type="button" onclick="layerAlertChange('26584','495451','15','${member_yn}','Yellow Mixing Tip');">장바구니 담기</button>
                                            		</c:when>
	                                           		<c:otherwise><button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button></c:otherwise>
	                                           	</c:choose>
                                            </div>
                                        </a>
                                    </div>
                                </li> -- % >
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img g_e_b1_p_img_26610"><img src="/resources/images/event_first_purchase/img_benefit_01_06.jpg" alt=""></div>
                                            <div class="txt g_e_b1_p_info_26610">
                                                <div class="price">
                                                    <div class="prime">14,400원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">Metal Suction tip<span>(6mm)</span></div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">국산</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">1ea (4개)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn g_e_b1_p_cart_26610">
                                            	<c:choose>
	                                            	<c:when test="${member_yn eq 'N'}"><button class="btn_cart" type="button" onclick="layerAlertLogin();">장바구니 담기</button></c:when>
	                                            	<c:when test="${order_check >=1}">
	                                            		<button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button>
	                                            	</c:when>
	                                           		<c:when test="${order_check == 0  and cart_yn eq 'N'}">
	                                           			<button class="btn_cart cart_put_new" type="button" onclick="addCart('26610','495592','15','${member_yn}','Metal Suction tip (6mm)');">장바구니 담기</button>
	                                           			<button class="btn_cart cart_put_re" type="button" onclick="layerAlertChange('26610','495592','15','${member_yn}','Metal Suction tip (6mm)');" style="display: none;">장바구니 담기</button>
	                                           		</c:when>
	                                           		<c:when test="${order_check == 0 and cart_yn eq 'Y'}">
                                            			<button class="btn_cart" type="button" onclick="layerAlertChange('26610','495592','15','${member_yn}','Metal Suction tip (6mm)');">장바구니 담기</button>
                                            		</c:when>
	                                           		<c:otherwise><button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button></c:otherwise>
	                                           	</c:choose>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="soldout">
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img g_e_b1_p_img_27074"><img src="/resources/images/event_first_purchase/img_benefit_01_07.jpg" alt=""></div>
                                            <div class="txt g_e_b1_p_info_27074">
                                                <div class="price">
                                                    <div class="prime">13,200원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">Bite block cover<span>(35*65mm)</span></div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">B&E</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">300pcs (4박스)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn g_e_b1_p_cart_27074">
                                            	<c:choose>
	                                            	<c:when test="${member_yn eq 'N'}"><button class="btn_cart" type="button" onclick="layerAlertLogin();">장바구니 담기</button></c:when>
	                                            	<c:when test="${order_check >=1}">
	                                            		<button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button>
	                                            	</c:when>
	                                           		<c:when test="${order_check == 0  and cart_yn eq 'N'}">
	                                           			<button class="btn_cart cart_put_new" type="button" onclick="addCart('27074','524788','15','${member_yn}','Bite block cover (35*65mm)');">장바구니 담기</button>
	                                           			<button class="btn_cart cart_put_re" type="button" onclick="layerAlertChange('27074','524788','15','${member_yn}','Bite block cover (35*65mm)');" style="display: none;">장바구니 담기</button>
	                                           		</c:when>
	                                           		<c:when test="${order_check == 0 and cart_yn eq 'Y'}">
                                            			<button class="btn_cart" type="button" onclick="layerAlertChange('27074','524788','15','${member_yn}','Bite block cover (35*65mm)');">장바구니 담기</button>
                                            		</c:when>
	                                           		<c:otherwise><button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button></c:otherwise>
	                                           	</c:choose>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img g_e_b1_p_img_27075"><img src="/resources/images/event_first_purchase/img_benefit_01_08.jpg" alt=""></div>
                                            <div class="txt g_e_b1_p_info_27075">
                                                <div class="price">
                                                    <div class="prime">11,200원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">Sensor cover<span>(40*110 mm)</span></div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">국산</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">300장 (4박스)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn g_e_b1_p_cart_27075">
                                            	<c:choose>
	                                            	<c:when test="${member_yn eq 'N'}"><button class="btn_cart" type="button" onclick="layerAlertLogin();">장바구니 담기</button></c:when>
	                                            	<c:when test="${order_check >=1}">
	                                            		<button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button>
	                                            	</c:when>
	                                           		<c:when test="${order_check == 0  and cart_yn eq 'N'}">
	                                           			<button class="btn_cart cart_put_new" type="button" onclick="addCart('27075','524789','15','${member_yn}','Sensor cover (40*110 mm)');">장바구니 담기</button>
	                                           			<button class="btn_cart cart_put_re" type="button" onclick="layerAlertChange('27075','524789','15','${member_yn}','Sensor cover (40*110 mm)');" style="display: none;">장바구니 담기</button>
	                                           		</c:when>
	                                           		<c:when test="${order_check == 0 and cart_yn eq 'Y'}">
                                            			<button class="btn_cart" type="button" onclick="layerAlertChange('27075','524789','15','${member_yn}','Sensor cover (40*110 mm)');">장바구니 담기</button>
                                            		</c:when>
	                                           		<c:otherwise><button class="btn_cart" type="button" onclick="layerAlertNot();">장바구니 담기</button></c:otherwise>
	                                           	</c:choose>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                 --%>
                            </ul>
                        </div>
                        <div class="alert_list">
                            <div class="title">꼭 읽어주세요!</div>
                            <div class="list">
                                <ul>
                                    <li>
                                        <div>본 이벤트 상품은 3만원 이상 주문 시 구매가 가능합니다. (구매 이력이 있을 경우 구매 불가)</div>
                                    </li>
                                    <li>
                                        <div>본 이벤트 상품의 구매 수량은 1개만 가능합니다.</div>
                                    </li>
                                    <li>
                                        <div>본 이벤트 상품을 포함한 주문후 취소시 전체 취소만 가능합니다. (부분취소 불가)</div>
                                    </li>
                                    <li>
                                        <div>본 이벤트 상품은 포인트 사용 및 적립제외 품목입니다.</div>
                                    </li>
                                    <li>
                                        <div>본 이벤트 상품의 구매는 ID당 1회로 제한됩니다.</div>
                                    </li>
                                    <li>
                                        <div>첫 주문후 한 달 동안 무료배송 혜택이 적용됩니다.</div>
                                    </li>
                                </ul>
                            </div>
                        </div>
	                </div>
	            </div>
	        </article>
            <article class="atc_benefit_02" id="atc_benefit_02">
	            <div class="inner">
	                <div class="atc_text">
                        <div class="tit">추가 특별 혜택 두 가지</div>
                    </div>
	                <div class="content">
                        <div class="benefit_02_list">
                            <ul>
                                <li>
                                    <div class="g_e_b2_info">
                                        <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_02_01.png" alt=""></div>
                                        <div class="atc_text">
                                            <div class="num">#2</div>
                                            <div class="sub">특별혜택 두 번째</div>
                                            <div class="tit">한 달 내내 무료배송</div>
                                            <div class="desc">갑자기 병원에서 필요한 재료가 있으신가요?<br>
                                                <b>소량주문도 OK!<br>금액 제한 없는 무료배송으로 재료를 주문 해보세요!</b>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="g_e_b3_info">
                                        <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_02_02.png" alt=""></div>
                                        <div class="atc_text">
                                            <div class="num">#3</div>
                                            <div class="sub">특별혜택 세 번째</div>
                                            <div class="tit">한 달 동안 5% 적립</div>
                                            <div class="desc">한 달 동안 더욱 풍성한 적립!<br>
                                                <b>기간 동안 많은 포인트를 적립해 보세요.</b>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="button_wrap">
                            <a href="javascript:;" onclick="getAllBenefit('${member_yn}');" class="g_e_all_join">모든 혜택 받기 ></a>
                        </div>
                        <div class="alert_list">
                            <div class="title">꼭 읽어주세요!</div>
                            <div class="list">
                                <ul>
                                    <li>
                                        <div>첫 주문 시점부터 무료배송과 5% 적립 혜택이 동시 적용됩니다.</div>
                                    </li>
                                    <li>
                                        <div>상품을 1개만 주문해도 무료배송 혜택이 적용됩니다.</div>
                                    </li>
                                    <li>
                                        <div>적립금은 배송완료 후 지급됩니다.</div>
                                    </li>
                                    <li>
                                        <div>본 혜택은 ID 당 1회로 제한됩니다.</div>
                                    </li>
                                </ul>
                            </div>
                        </div>
	                </div>
	            </div>
	        </article>
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