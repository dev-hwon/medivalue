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
		<script type="text/javascript" src="/resources/js/gsap.min.js"></script>
		<script type="text/javascript" src="/resources/js/ScrollTrigger.min.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>		
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
    	<script type="text/javascript" src="/resources/js/intro_quickorder.js"></script>
	</jsp:attribute>
	<jsp:body>
		<section id="intro_quickorder" class="sub">
	        <article class="atc_visual">
	            <div class="bg">
	                <div class="bg_01"><img src="/resources/images/intro_quickorder/img_visual_bg.jpg" alt=""></div>
	                <div class="bg_02"><img src="/resources/images/intro_quickorder/img_visual_shape.png" alt=""></div>
	                <div class="bg_03"><img src="/resources/images/intro_quickorder/img_visual_shadow.png" alt="" class="img_shdow"><img src="/resources/images/intro_quickorder/img_visual_glow.png" alt="" class="img_glow"><img src="/resources/images/intro_quickorder/img_visual_text.png" alt="" class="img_txt"></div>
	            </div>
	            <div class="inner">
	                <div class="text">
	                    <div class="tit">
	                        의료재료 최저가 가격비교<br>원스톱 구매 서비스!<br>빠른주문하기 
	                    </div>
	                    <div class="desc">
	                        기존의 재료 구매에서 어려운 점이 있으셨나요?<br>이제부터는 구매의 모든 과정이 쉬워집니다.
	                    </div>
	                    <div class="btn">
	                        <button type="button" class="btn_start" onclick="location.href='/quickOrder/info';">빠른주문하기</button>
	                    </div>
	                </div>
	            </div>
	        </article>
	        <article class="atc_howtobuy">
	            <div class="inner">
	                <div class="atc_title"><strong>재료구매, 어떻게 하고있나요?</strong></div>
	                <div class="atc_subtitle">재료 구매 때문에 골치 아프신 적이 다들 있지 않으신가요?<br>메디밸류는 고객님들의 불편한 점을 모아서<br>빠른주문하기를 출시하게 되었습니다.</div>
	            </div>
	            <div class="content">
	                <div class="howtobuy">
	                    <ul>
	                        <li>
	                            <div>
	                                <div class="img">
	                                    <img src="/resources/images/intro_quickorder/img_howtobuy_01.png" alt="">
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
	                                    <img src="/resources/images/intro_quickorder/img_howtobuy_03.png" alt="">
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
	                                    <img src="/resources/images/intro_quickorder/img_howtobuy_05.png" alt="">
	                                </div>
	                            </div>
	                        </li>
	                        <li><div></div></li>
	                        <li><div></div></li>
	                        <li><div></div></li>
	                        <li><div></div></li>
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
	                                        <img src="/resources/images/intro_quickorder/ico_system_01.png" alt="">
	                                    </div>
	                                    <div class="txt">
	                                        <div class="tit">통합 주문</div>
	                                        <div class="desc">개별도매상 한번에 주문</div>
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
	                                        <img src="/resources/images/intro_quickorder/ico_system_03.png" alt="">
	                                    </div>
	                                    <div class="txt">
	                                        <div class="tit">쉬운 제품 검색</div>
	                                        <div class="desc">한눈에 확인되는 재료 정보</div>
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
	                                        <div class="desc">대형 유통사의 가격비교</div>
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
	                                            <div class="row"><p>쉽고 정확한 검색으로</p></div>
	                                            <div class="row"><p>제품 요약정보를 확인하세요.</p></div>
	                                        </div>
	                                        <div class="desc">
	                                            <div class="row"><p>단순 키워드로 간편하게 체크 자동완성 검색으로</p></div>
	                                            <div class="row"><p>제품 요약 정보를 확인하실 수 있습니다.</p></div>
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
	                                            <div class="row"><p>원하는 제품의 규격을</p></div>
	                                            <div class="row"><p>정확히 선택하세요.</p></div>
	                                        </div>
	                                        <div class="desc">
	                                            <div class="row"><p>다양한 제품의 규격들 중 내가 원하는 규격을 쉽게 찾고</p></div>
	                                            <div class="row"><p>주문한 제품일 경우 주문했던 내역까지 볼 수 있습니다.</p></div>
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
	                                            <div class="row"><p>최저가를 만나보세요.</p></div>
	                                        </div>
	                                        <div class="desc">
	                                            <div class="row"><p>업체별 가격을 한눈에, 재료상별 의료 재료를 쉽고 빠르게</p></div>
	                                            <div class="row"><p>가격 비교와 최저가를 바로 확인할 수 있습니다.</p></div>
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
	                                            <div class="row"><p>한 화면에서 한번에</p></div>
	                                            <div class="row"><p>편리하게 확인하세요.</p></div>
	                                        </div>
	                                        <div class="desc">
	                                            <div class="row"><p>장바구니를 통해 주문 전 제품 정보를 한 번 더 확인하여</p></div>
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
	                                            <div class="row"><p>마지막 주문 정보를 확인후</p></div>
	                                            <div class="row"><p>결제까지 쉽게 하세요.</p></div>
	                                        </div>
	                                        <div class="desc">
	                                            <div class="row"><p>주문한 제품에 대한 내역과 배송정보, 결제정보를</p></div>
	                                            <div class="row"><p>한 화면에서 확인 후 빠르게 결제를 하실 수 있습니다.</p></div>
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
	                        <div class="atc_subtitle">의료재료들을 한번에<br>비교하고 한번에 주문하고 결제까지 하세요.</div>
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