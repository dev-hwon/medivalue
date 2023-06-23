<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/slick.css" />
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
	    <link rel="stylesheet" href="/resources/css/intro_counseling.css" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/slick.min.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>		
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
    	<script type="text/javascript" src="/resources/js/intro_counseling.js"></script>
	</jsp:attribute>
	<jsp:body>
		<section id="intro_counseling" class="sub">
	        <article class="atc_visual">
	            <div class="bg">
	                <div class="bg_01"><img src="/resources/images/intro_counseling/bg_visual_01.png" alt=""></div>
	                <div class="bg_02"><img src="/resources/images/intro_counseling/bg_visual_02.png" alt=""></div>
	            </div>
	            <div class="inner">
	                <div class="text">
	                    <div class="tit">
	                        직접 만나기 어려웠던<br>재료 전문가!<br>메디밸류에서 만나보세요.
	                    </div>
	                    <div class="desc">
	                        고객님의 재료에 대한 궁금증<br>검증된 재료전문가와 실시간 상담을 해드립니다.<br>지금 바로 물어보세요.
	                    </div>
	                    <div class="btn">
	                        <button type="button" class="btn_start" onclick="onChatTalk();">상담 시작하기</button>
	                    </div>
	                </div>
	                <div class="image">
	                    <div class="img_01"><img src="/resources/images/intro_counseling/img_visual_01.png" alt=""></div>
	                    <div class="img_02"><img src="/resources/images/intro_counseling/img_visual_02_new.png" alt=""></div>
	                </div>
	            </div>
	        </article>
	        <article class="atc_intro">
	            <div class="inner">
	                <div class="atc_title"><strong>재료전문가</strong> 소개</div>
	                <div class="content">
	                    <div class="text">
	                        <div class="tit">20년 이상의 <strong>재료전문가</strong></div>
	                        <div class="desc">메디밸류의 재료전문가는 20년 이상 의료재료전문 베테랑입니다.<br>검증된 자격과 실무 능력으로 재료에 대한 전문지식을 가지고<br>전문가들이 직접 상담을 진행합니다. 재료에 대한 다양한 질문을<br>메디밸류 채팅을 통해서 물어보세요!</div>
	                    </div>
	                    <div class="image">
	                        <div class="img_01"><img src="/resources/images/intro_counseling/img_intro_01.png" alt=""></div>
	                        <div class="img_02"><img src="/resources/images/intro_counseling/img_intro_02.png" alt=""></div>
	                    </div>
	                </div>
	            </div>
	        </article>
	        <article class="atc_question">
	            <div class="inner">
	                <div class="atc_title"><strong>재료에 대해서 무엇이든 물어보세요!</strong></div>
	                <div class="atc_subtitle">재료에 대한 궁금증을 자세하게 물어보고 확실한 전문가의 상담을 받아보세요.</div>
	                <div class="hashtag">
	                    <ul>
	                        <li><div>#재료 규격</div></li>
	                        <li><div>#제품 추천</div></li>
	                        <li><div>#제품명 찾기</div></li>
	                        <li><div>#대체 상품</div></li>
	                        <li><div>#사진으로 물어보기</div></li>
	                        <li><div>#제품 비교</div></li>
	                    </ul>
	                </div>
	                <div class="content">
	                    <ul>
	                        <li>
	                            <div>
	                                <div class="head">
	                                    <div class="img">
	                                        <img src="/resources/images/intro_counseling/img_question_01.png" alt="">
	                                    </div>
	                                    <div class="txt">
	                                        마이스*치과
	                                    </div>
	                                </div>
	                                <div class="body">
	                                    <div class="box">
	                                        <div class="txt">
	                                            현재 사용하는 제품 대신에<br><strong>가격대 비슷한 상품 추천</strong>부탁드려요.
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </li>
	                        <li>
	                            <div>
	                                <div class="head">
	                                    <div class="img">
	                                        <img src="/resources/images/intro_counseling/img_question_02.png" alt="">
	                                    </div>
	                                    <div class="txt">
	                                        구*회
	                                    </div>
	                                </div>
	                                <div class="body">
	                                    <div class="box">
	                                        <div class="txt">
	                                            <strong>제품의 포장단위</strong>가 1장 단위인지<br>10장 단위인지 알고 싶어요.
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </li>
	                        <li>
	                            <div>
	                                <div class="head">
	                                    <div class="img">
	                                        <img src="/resources/images/intro_counseling/img_question_03.png" alt="">
	                                    </div>
	                                    <div class="txt">
	                                        서울메*치
	                                    </div>
	                                </div>
	                                <div class="body">
	                                    <div class="box">
	                                        <div class="txt">
	                                            안녕하세요. <strong>제품 A와 제품 B의<br>정확한 차이점</strong>을 알고 싶어요!
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </li>
	                        <li>
	                            <div>
	                                <div class="head">
	                                    <div class="img">
	                                        <img src="/resources/images/intro_counseling/img_question_04.png" alt="">
	                                    </div>
	                                    <div class="txt">
	                                        하트 *07
	                                    </div>
	                                </div>
	                                <div class="body">
	                                    <div class="box">
	                                        <div class="txt">
	                                            멸균 불가라고 쓰여있지 않은 제품은<br><strong>멸균 가능한 제품</strong>인 것인가요?
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </li>
	                        <li>
	                            <div>
	                                <div class="head">
	                                    <div class="img">
	                                        <img src="/resources/images/intro_counseling/img_question_05.png" alt="">
	                                    </div>
	                                    <div class="txt">
	                                        이*훈
	                                    </div>
	                                </div>
	                                <div class="body">
	                                    <div class="box">
	                                        <div class="txt">
	                                            <strong>제품의 구성품</strong>이 어떻게 되나요?
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </li>
	                        <li>
	                            <div>
	                                <div class="head">
	                                    <div class="img">
	                                        <img src="/resources/images/intro_counseling/img_question_06.png" alt="">
	                                    </div>
	                                    <div class="txt">
	                                        김*인
	                                    </div>
	                                </div>
	                                <div class="body">
	                                    <div class="box">
	                                        <div class="txt">
	                                            제가 쓰는 제품을 <strong>대체 할 수 있는<br>상품</strong>으로 어떤게 있을까요?
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </article>
	        <article class="atc_howtouse">
	            <div class="inner">
	                <div class="atc_title"><strong>1:1 상담</strong> 이용 방법</div>
	                <div class="atc_subtitle">채팅상담으로 쉽고 간단하게 전문가와 상담하세요.</div>
	                <div class="content">
	                    <div class="tab">
	                        <ul>
	                            <li>
	                                <div>
	                                    <div class="num">
	                                        <div class="circle"><span>1</span></div>
	                                    </div>
	                                    <div class="txt">
	                                        <div class="box">
	                                            <div class="box_txt">
	                                                <div class="title">채팅상담 클릭</div>
	                                                <div class="desc">홈페이지 하단 우측에 채팅상담<br>아이콘을 클릭해주세요.</div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <div class="num">
	                                        <div class="circle"><span>2</span></div>
	                                    </div>
	                                    <div class="txt">
	                                        <div class="box">
	                                            <div class="box_txt">
	                                                <div class="title">상담 요청</div>
	                                                <div class="desc">간단한 인사와 함께 고객님이<br>궁금하신 점을 물어보고<br>잠시 기다려주세요.</div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <div class="num">
	                                        <div class="circle"><span>3</span></div>
	                                    </div>
	                                    <div class="txt">
	                                        <div class="box">
	                                            <div class="box_txt">
	                                                <div class="title">전문가 1:1 상담</div>
	                                                <div class="desc">전문가님이 등장하여 궁금한<br>점을 열심히 상담해드립니다.<br>고민하지말고 지금 시작하세요!</div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </li>
	                        </ul>
	                    </div>
	                    <div class="cnt">
	                        <ul>
	                            <li>
	                                <div>
	                                    <div class="bg">
	                                        <img src="/resources/images/intro_counseling/img_howto_01.png" alt="">
	                                        <div class="ico_chat"></div>
	                                    </div>
	                                    <div class="img ico_cursor">
	                                        <img src="/resources/images/intro_counseling/img_howto_01_01.png" alt="" class="ico_cursor_01">
	                                        <img src="/resources/images/intro_counseling/img_howto_01_02.png" alt="" class="ico_cursor_02">
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <div class="bg">
	                                        <img src="/resources/images/intro_counseling/img_howto_01.png" alt="">
	                                    </div>
	                                    <div class="img">
	                                        <img src="/resources/images/intro_counseling/img_howto_02_none.png" alt="">
	                                    </div>
	                                </div>
	                            </li>
	                            <li>
	                                <div>
	                                    <div class="bg">
	                                        <img src="/resources/images/intro_counseling/img_howto_01.png" alt="">
	                                    </div>
	                                    <div class="img">
	                                        <img src="/resources/images/intro_counseling/img_howto_03_none.png" alt="">
	                                    </div>
	                                </div>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	        </article>
	        <article class="atc_consult">
	            <div class="content">
	                <div class="image"><img src="/resources/images/intro_counseling/img_consult_01.png" alt=""></div>
	                <div class="atc_title">재료전문가 <strong>상담하러가기</strong></div>
	                <div class="atc_subtitle">재료에 대한 어렵고 디테일한 부분들까지 하나하나 해결해드립니다.<br>전문가와 상담하고 주문 시간을 빠르게 줄여보세요.</div>
	                <div class="button">
	                    <button type="button" onclick="onChatTalk();">상담 시작하기</button>
	                </div>
	            </div>
	        </article>
	    </section>
	</jsp:body>
</layout:basicFrame>