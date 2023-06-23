<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
	    <link rel="stylesheet" href="/resources/css/intro_quickorder.css" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>		
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220317"></script>
    	<script type="text/javascript" src="/resources/js/intro_quickorder.js?20220317"></script>
	</jsp:attribute>
	<jsp:body>
		<section id="intro_quickorder" class="sub">
	        <article class="atc_visual">
	            <div class="bg">
	                <div class="bg_00"><img src="/resources/images/intro_quickorder/img_visual_icons.jpg" alt=""></div>
	            </div>
	            <div class="inner">
	                <div class="text">
	                    <div class="tit">
	                        믿을 수 있는 최저가!<br>가격비교와 검색을 한번에<br>빠른주문하기 
	                    </div>
	                    <div class="desc">
	                        복잡한 제품 구매 절차는 NO!<br>하나의 화면에서 한번에 모든 구매가 가능합니다.
	                    </div>
	                    <div class="btn">
	                        <button type="button" class="btn_start" onclick="location.href='/quickOrder/info';">빠른주문하기</button>
	                    </div>
	                </div>
	            </div>
	        </article>
	        <article class="atc_howtobuy">
	            <div class="inner">
	                <div class="atc_title"><strong>매번 대용량으로 구매해야 하는 치과 재료<br>가격비교, 재고 관리 등으로 인해<br>불필요한 시간을 낭비하고 있진 않나요?</strong></div>
	                <div class="atc_subtitle">메디밸류는 고객님들의 불편한 점을 모아서<br>빠른주문하기를 출시하게 되었습니다.</div>
	            </div>
	            <div class="content">
	                <div class="howtobuy">
	                    <ul>
	                        <li><div></div></li>
	                        <li><div></div></li>
	                        <li><div></div></li>
	                        <li><div></div></li>
	                        <li>
	                            <div>
	                                <div class="img">
	                                    <img src="/resources/images/intro_quickorder/img_howtobuy_05.png" alt="">
	                                </div>
	                            </div>
	                        </li>
	                        <li>
	                            <div>
	                                <div class="img">
	                                    <img src="/resources/images/intro_quickorder/img_howtobuy_04.png" alt="">
	                                </div>
	                            </div>
	                        </li>
	                        <li>
	                            <div>
	                                <div class="img">
	                                    <img src="/resources/images/intro_quickorder/img_howtobuy_03.png" alt="">
	                                </div>
	                            </div>
	                        </li>
	                        <li>
	                            <div>
	                                <div class="img">
	                                    <img src="/resources/images/intro_quickorder/img_howtobuy_02.png" alt="">
	                                </div>
	                            </div>
	                        </li>
	                        <li>
	                            <div>
	                                <div class="img">
	                                    <img src="/resources/images/intro_quickorder/img_howtobuy_01.png" alt="">
	                                </div>
	                            </div>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </article>
	        <article class="atc_system">
	            <div class="inner">
	                <div class="atc_title"><strong>쉽고 빠른 주문 시스템</strong></div>
	                <div class="content">
	                    <div class="system">
	                        <ul>
	                        	<li>
	                                <div>
	                                    <div class="img">
	                                        <img src="/resources/images/intro_quickorder/ico_system_03.png" alt="">
	                                    </div>
	                                    <div class="txt">
	                                        <div class="tit">쉬운 제품 검색</div>
	                                        <div class="desc">한눈에 확인하는 재료 정보</div>
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <div class="img">
	                                        <img src="/resources/images/intro_quickorder/ico_system_04.png" alt="">
	                                    </div>
	                                    <div class="txt">
	                                        <div class="tit">최저가 확인</div>
	                                        <div class="desc">유통사별 가격 비교</div>
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <div class="img">
	                                        <img src="/resources/images/intro_quickorder/ico_system_02.png" alt="">
	                                    </div>
	                                    <div class="txt">
	                                        <div class="tit">과다 주문 방지</div>
	                                        <div class="desc">최근 주문내역 자동 확인</div>
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <div class="img">
	                                        <img src="/resources/images/intro_quickorder/ico_system_01.png" alt="">
	                                    </div>
	                                    <div class="txt">
	                                        <div class="tit">통합 주문</div>
	                                        <div class="desc">개별 도매상 재료 한번에 주문</div>
	                                    </div>
	                                </div>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	        </article>
	        <article class="atc_howtouse">
	            <div class="inner">
	                <div class="atc_title"><strong>빠른주문하기 이용 방법</strong></div>
	                <div class="content">
	                    <div class="howtouse">
	                        <ul>
	                            <li>
	                                <div>
	                                    <div class="txt">
	                                        <div class="num"><div class="row"><p>01</p></div></div>
	                                        <div class="tit">
	                                            <div class="row"><p>키워드 검색만으로</p></div>
	                                            <div class="row"><p>재료 요약 정보를 확인하세요.</p></div>
	                                        </div>
	                                        <div class="desc">
	                                            <div class="row"><p>자동완성 검색 기능으로 키워드만 검색해도</p></div>
	                                            <div class="row"><p>제품 요약 정보를 확인할 수 있습니다.</p></div>
	                                        </div>
	                                    </div>
	                                    <div class="img">
	                                        <img src="/resources/images/intro_quickorder/img_howtouse_01_1.png" alt="" class="img_01">
	                                        <img src="/resources/images/intro_quickorder/img_howtouse_01_2.png" alt="" class="img_02">
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <div class="txt">
	                                        <div class="num"><div class="row"><p>02</p></div></div>
	                                        <div class="tit">
	                                            <div class="row"><p>원하는 재료의 규격을</p></div>
	                                            <div class="row"><p>선택하세요.</p></div>
	                                        </div>
	                                        <div class="desc">
	                                            <div class="row"><p>구매 이력이 있다면 최근 주문내역을 통해</p></div>
	                                            <div class="row"><p>재료의 세부 옵션을 쉽고 빠르게 적용할 수 있습니다.</p></div>
	                                        </div>
	                                    </div>
	                                    <div class="img">
	                                        <img src="/resources/images/intro_quickorder/img_howtouse_02_1.png" alt="" class="img_01">
	                                        <img src="/resources/images/intro_quickorder/img_howtouse_02_2.png" alt="" class="img_02">
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <div class="txt">
	                                        <div class="num"><div class="row"><p>03</p></div></div>
	                                        <div class="tit">
	                                            <div class="row"><p>재료상 가격비교를 통해서</p></div>
	                                            <div class="row"><p>최저가 제품을 만나보세요.</p></div>
	                                        </div>
	                                        <div class="desc">
	                                            <div class="row"><p>다양한 재료상의 재료를 가격비교 한 후</p></div>
	                                            <div class="row"><p>최저가 재료를 선택할 수 있습니다.</p></div>
	                                        </div>
	                                    </div>
	                                    <div class="img">
	                                        <img src="/resources/images/intro_quickorder/img_howtouse_03_1.png" alt="" class="img_01">
	                                        <img src="/resources/images/intro_quickorder/img_howtouse_03_2.png" alt="" class="img_02">
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <div class="txt">
	                                        <div class="num"><div class="row"><p>04</p></div></div>
	                                        <div class="tit">
	                                            <div class="row"><p>하나의 화면에서 한번에</p></div>
	                                            <div class="row"><p>편리하게 확인하세요.</p></div>
	                                        </div>
	                                        <div class="desc">
	                                            <div class="row"><p>장바구니를 통해 주문 전 제품 정보를 한번 더 확인하여</p></div>
	                                            <div class="row"><p>수량 조절 및 오주문 방지, 월별 주문 제품 조회 및</p></div>
	                                            <div class="row"><p>구매내역 쉽게 확인하세요.</p></div>
	                                        </div>
	                                    </div>
	                                    <div class="img">
	                                        <img src="/resources/images/intro_quickorder/img_howtouse_04_1.png" alt="" class="img_01">
	                                        <img src="/resources/images/intro_quickorder/img_howtouse_04_2.png" alt="" class="img_02">
	                                        <img src="/resources/images/intro_quickorder/img_howtouse_04_3.png" alt="" class="img_03">
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <div class="txt">
	                                        <div class="num"><div class="row"><p>05</p></div></div>
	                                        <div class="tit">
	                                            <div class="row"><p>마지막 주문 정보를 확인 후</p></div>
	                                            <div class="row"><p>손쉽게 결제하세요.</p></div>
	                                        </div>
	                                        <div class="desc">
	                                            <div class="row"><p>주문한 제품에 대한 내역과 배송정보, 결제정보를</p></div>
	                                            <div class="row"><p>한 화면에서 확인 후 빠르게 결제를 할 수 있습니다.</p></div>
	                                        </div>
	                                    </div>
	                                    <div class="img">
	                                        <img src="/resources/images/intro_quickorder/img_howtouse_05_1.png" alt="" class="img_01">
	                                        <img src="/resources/images/intro_quickorder/img_howtouse_05_2.png" alt="" class="img_02">
	                                    </div>
	                                </div>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	        </article>
	        <article class="atc_more">
	            <div class="atc_wrap">
	                <div class="atc_qorder">
	                    <div class="content">
	                        <div class="atc_title">지금 <strong>빠른주문하기 사용</strong></div>
	                        <div class="atc_subtitle">다양한 의료재료 비교부터 결제까지<br>빠른주문하기를 통해 경험해보세요.</div>
	                        <div class="button">
	                            <button type="button" onclick="location.href='/quickOrder/info';">빠른주문하기 시작</button>
	                        </div>
	                    </div>
	                </div>
	                <div class="atc_inquiry">
	                    <div class="content">
	                        <div class="atc_title">빠른주문하기에 대해<br><strong>더 궁금하신 점이 있으신가요?</strong></div>
	                        <div class="button">
	                            <button type="button" onclick="onChatTalk();">1:1 문의</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </article>
	    </section>
	</jsp:body>
</layout:basicFrame>