<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
	    <link rel="stylesheet" href="/resources/css/event_special_price.css" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>		
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
    	<script type="text/javascript" src="/resources/js/event_first_purchase.js"></script>
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
                		<li>
                			<div>
                				<a href="javascript:scrollToMove('atc_benefit_02');">
                					<div class="tit">혜택 #2</div>
                					<div class="desc">창고대방출<br>땡처리 알뜰 제품 보기</div>
                                    <div class="img"><img src="/resources/images/event_special_price/ico_visual_arrow.png" alt=""></div>
                				</a>
                			</div>
                		</li>
                	</ul>
                </div>
	        </article>
            <article class="atc_benefit_01">
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
	                <div class="content">
	                    <div class="benefit_01_list">
                            <ul>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_01.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">12,000원</div>
                                                    <div class="discount">2,300원</div>
                                                </div>
                                                <div class="tit">소독포 (45cm*45cm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">국산</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">4ea</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_02.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">10,600원</div>
                                                    <div class="discount">2,300원</div>
                                                </div>
                                                <div class="tit">코소독포 (45cm*50cm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">국산</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">4ea</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_03.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">132,200원</div>
                                                    <div class="discount">3,200원</div>
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
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_04.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">12,800원</div>
                                                    <div class="discount">3,200원</div>
                                                </div>
                                                <div class="tit">Green Mixing Tip</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">덴탈인</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">50ea (4묶음)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_05.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">12,800원</div>
                                                    <div class="discount">35,900원</div>
                                                </div>
                                                <div class="tit">Goldies Flexible Diamond Discs (22mm*0.3mm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">덴탈인</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">50ea (4묶음)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_06.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">14,000원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">Metal Suction tip (6mm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">Micron</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">4ea</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="soldout">
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_07.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">00,000원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">-</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="soldout">
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_07.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">00,000원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">-</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_01.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">12,000원</div>
                                                    <div class="discount">2,300원</div>
                                                </div>
                                                <div class="tit">소독포 (45cm*45cm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">국산</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">4ea</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_02.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">10,600원</div>
                                                    <div class="discount">2,300원</div>
                                                </div>
                                                <div class="tit">코소독포 (45cm*50cm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">국산</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">4ea</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_03.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">132,200원</div>
                                                    <div class="discount">3,200원</div>
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
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_04.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">12,800원</div>
                                                    <div class="discount">3,200원</div>
                                                </div>
                                                <div class="tit">Green Mixing Tip</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">덴탈인</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">50ea (4묶음)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_05.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">12,800원</div>
                                                    <div class="discount">35,900원</div>
                                                </div>
                                                <div class="tit">Goldies Flexible Diamond Discs (22mm*0.3mm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">덴탈인</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">50ea (4묶음)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_06.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">14,000원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">Metal Suction tip (6mm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">Micron</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">4ea</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="soldout">
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_07.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">00,000원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">-</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="soldout">
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_07.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">00,000원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">-</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="button_wrap">
                            <a href="javascript:;" onclick="btnMore(this);">특가 제품 <span>더 보기</span></a>
                        </div>
	                </div>
	            </div>
	        </article>
            <article class="atc_benefit_02">
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
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_01.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">12,000원</div>
                                                    <div class="discount">2,300원</div>
                                                </div>
                                                <div class="tit">소독포 (45cm*45cm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">국산</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">4ea</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_02.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">10,600원</div>
                                                    <div class="discount">2,300원</div>
                                                </div>
                                                <div class="tit">코소독포 (45cm*50cm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">국산</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">4ea</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_03.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">132,200원</div>
                                                    <div class="discount">3,200원</div>
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
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_04.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">12,800원</div>
                                                    <div class="discount">3,200원</div>
                                                </div>
                                                <div class="tit">Green Mixing Tip</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">덴탈인</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">50ea (4묶음)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_05.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">12,800원</div>
                                                    <div class="discount">35,900원</div>
                                                </div>
                                                <div class="tit">Goldies Flexible Diamond Discs (22mm*0.3mm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">덴탈인</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">50ea (4묶음)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_06.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">14,000원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">Metal Suction tip (6mm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">Micron</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">4ea</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="soldout">
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_07.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">00,000원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">-</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="soldout">
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_07.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">00,000원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">-</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_01.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">12,000원</div>
                                                    <div class="discount">2,300원</div>
                                                </div>
                                                <div class="tit">소독포 (45cm*45cm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">국산</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">4ea</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_02.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">10,600원</div>
                                                    <div class="discount">2,300원</div>
                                                </div>
                                                <div class="tit">코소독포 (45cm*50cm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">국산</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">4ea</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_03.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">132,200원</div>
                                                    <div class="discount">3,200원</div>
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
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_04.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">12,800원</div>
                                                    <div class="discount">3,200원</div>
                                                </div>
                                                <div class="tit">Green Mixing Tip</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">덴탈인</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">50ea (4묶음)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_05.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">12,800원</div>
                                                    <div class="discount">35,900원</div>
                                                </div>
                                                <div class="tit">Goldies Flexible Diamond Discs (22mm*0.3mm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">덴탈인</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">50ea (4묶음)</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_06.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">14,000원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">Metal Suction tip (6mm)</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">Micron</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">4ea</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="soldout">
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_07.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">00,000원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">-</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li class="soldout">
                                    <div>
                                        <a href="javascript:;">
                                            <div class="img"><img src="/resources/images/event_first_purchase/img_benefit_01_07.jpg" alt=""></div>
                                            <div class="txt">
                                                <div class="price">
                                                    <div class="prime">00,000원</div>
                                                    <div class="discount">100원</div>
                                                </div>
                                                <div class="tit">-</div>
                                                <div class="desc">
                                                    <div class="row">
                                                        <div class="th">제조사</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="th">포장단위</div>
                                                        <div class="td">-</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="btn">
                                                <button class="btn_cart" type="button" onclick="addCart();">장바구니 담기</button>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="button_wrap">
                            <a href="javascript:;" onclick="btnMore(this);">땡처리 제품 <span>더 보기</span></a>
                        </div>
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