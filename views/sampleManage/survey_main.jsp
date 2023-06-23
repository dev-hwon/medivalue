<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
    <link rel="shortcut icon" href="https://medivalue.co.kr/resources/images/dentex/favicon/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="https://medivalue.co.kr/resources/images/dentex/favicon/favicon.png">
    <link rel="stylesheet" type="text/css" href="/resources/css/survey.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/slick.css" />
    <script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/resources/js/slick.min.js"></script>
    <script type="text/javascript" src="/resources/js/survey.js"></script>
</head>
<body>
    <div id="wrap">
        <div id="container" class="main">
            <main>
                <nav>
                    <div class="home">
                        <a href="/sample/survey_login">
                            <img src="/resources/images/survey/ico_home.png" alt="">
                        </a>
                    </div>
                    <div class="inner">
                        <div class="progress">
                            <div class="progress_bar"></div>
                        </div>
                        <div class="percent">0%</div>
                    </div>
                </nav>
                <section class="sec_common on">
                    <article>
                        <div class="inner">
                            <div class="ques_wrap">
                                <div class="img">
                                    <img src="/resources/images/survey/img_common.png" alt="">
                                </div>
                                <div class="txt">
                                    선생님은 <span>개원예정</span>이신가요?
                                </div>
                            </div>
                            <div class="input_btn_wrap div_2">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_00" value="1" ><span>네.<br>개원예정입니다.</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_00" value="2" ><span>아니요.<br>이미 개원하였습니다.</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_next" onclick="nextSection()">다음</button>
                            </div>
                        </div>
                    </article>
                </section>
                <section class="sec_before">
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">개원예정의 선생님 반갑습니다 :D<br>설문에 앞서 아래의 인적 사항을 입력 부탁드립니다.</div>
                            </div>
                            <div class="input_txt_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <div class="txt">성명</div>
                                                <input type="text" autocomplete="off" placeholder="성명을 입력해주세요.">
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <div class="txt">연락처</div>
                                                <input type="text" autocomplete="off" placeholder="연락처를 입력해주세요.">
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <div class="txt">e-mail</div>
                                                <input type="email" autocomplete="off" placeholder="e-mail을 입력해주세요.">
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <div class="txt">의사면허번호</div>
                                                <input type="text" autocomplete="off" placeholder="의사면허번호를 입력해주세요.">
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                                <div class="agree_wrap">
                                    <label class="comm_check">
                                        <input type="checkbox"><span>마케팅 활용 동의 및 광고 수신 동의 <sub>(선택)</sub></span>
                                    </label>
                                    <div class="desc">※ 모바일로 스타벅스 쿠폰을 보내기 위해 동의 부탁드립니다.</div>
                                </div>
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="prevSectionBtn(this);">이전</button>
                                <button type="button" class="btn_next" onclick="nextSectionBtn(this);">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">비싸고 <span class="point">좋은 체어</span>만 선택하면 저절로 <span>목표 매출 달성</span>이 가능하다고 생각하시나요?</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_01"><span>네</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_01"><span>아니오</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_01"><span>잘모르겠다</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">점점 치열해지는 치과 개원가에서 <span class="point">대박치과</span>가<br>되기위한 가장 <span class="point">큰 밑거름</span>은 무엇이라고 생각되나요? <sub>(복수선택가능)</sub></div>
                            </div>
                            <div class="input_btn_wrap div_2">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>체어 대수</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>개원자금</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>입지선정</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>인테리어</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>세무 노무</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>고정 재료비</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>마케팅</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>인맥</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">개원이 치과의사의 끝일까요?개원 이후 모르면 죄가 되는<br><span class="point">꼭! 알아두어야 할 요소</span>는 무엇일까요? <sub>(복수선택가능)</sub></div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>운영 비용 절감 노하우</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>세무 관련 이슈</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>직원 채용 이슈</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>구매 업무 프로세스</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>재료관리</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">치과 개원 후 매출을 극대화 하기 위한<br><span class="point">지속적인 치과 운영 방법</span>은 어떤 것이 있을까요?</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_02"><span>최저가 재료구매</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_02"><span>전자 차트관리</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_02"><span>세무 노무</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_02"><span>인력관리</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_02"><span>마케팅</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">재료구매를 온라인은 주문해보신적 있으신가요?<br>온라인 재료몰 구매 이용 시 불편한 점이 있으셨나요? <sub>(복수선택가능)</sub></div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>복잡하고 불편한 화면 디자인</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>광고 또는 이벤트 과다 노출</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span> 자사몰의 자사제품 끼워팔기 및 과도한 홍보</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>사이트 이용 불편시(반품 등)고객센터 연결이 어려움</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>온라인 재료 구매 안해봄</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">기존에 근무하시던 치과에서<br>신규 재료 도입은 어떻게 결정되나요?</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_03"><span>온라인 이벤트 추천</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_03"><span>오프라인 재료상 추천 </span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_03"><span>광고</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_03"><span>세미나</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_03"><span>모름</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">기존에 근무하시던 치과에서<br>주로 재료를구매하시는 분은 누구인가요?</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_04"><span>대표원장</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_04"><span>봉직의</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_04"><span>치위생사</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_04"><span>행정직원</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_04"><span>기타</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">개원을 하시게 된다면<br>원하시는 이벤트나 경품이 있으신가요?</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_05"><span>파격적인 가격할인</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_05"><span>인기 상품 패키지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_05"><span>병원 운영에 필요한 사은품증정</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_05"><span>치과 운영 심층 세미나 참석권</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01_05"><span>기타<input type="text" placeholder="내용을 작성해주세요 :)" onfocus="btnInnerText(this);"></span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next" onclick="location.href='/sample/survey_complete'">다음</button>
                            </div>
                        </div>
                    </article>
                </section>





                <section class="sec_after">
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">개원의 선생님 반갑습니다 :D<br>설문에 앞서 아래의 인적 사항을 입력 부탁드립니다.</div>
                            </div>
                            <div class="input_txt_wrap div_2">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <div class="txt">성명</div>
                                                <input type="text" autocomplete="off" placeholder="성명을 입력해주세요.">
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <div class="txt">연락처</div>
                                                <input type="text" autocomplete="off" placeholder="연락처를 입력해주세요.">
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <div class="txt">e-mail</div>
                                                <input type="email" autocomplete="off" placeholder="e-mail을 입력해주세요.">
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <div class="txt">의사면허번호</div>
                                                <input type="text" autocomplete="off" placeholder="의사면허번호를 입력해주세요.">
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <div class="txt">치과명</div>
                                                <input type="text" autocomplete="off" placeholder="치과명을 입력해주세요.">
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <div class="txt">치과주소 <sub>상세주소 생략</sub></div>
                                                <input type="text" autocomplete="off" placeholder="치과주소를 입력해주세요.">
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                                <div class="agree_wrap">
                                    <label class="comm_check">
                                        <input type="checkbox"><span>마케팅 활용 동의 및 광고 수신 동의 <sub>(선택)</sub></span>
                                    </label>
                                    <div class="desc">※ 모바일로 스타벅스 쿠폰을 보내기 위해 동의 부탁드립니다.</div>
                                </div>
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="prevSectionBtn(this);">이전</button>
                                <button type="button" class="btn_next" onclick="nextSectionBtn(this);">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">원장님의 치과는 대박치과 이신가요?<br>혹시 문제나 어려움이 있으시다면 무엇일까요? <sub>(복수선택가능)</sub></div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>경영 전문 지식 미흡</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>업무 프로세스 부재</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>재료 관리</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>입지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>체어 회전률</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">재료 구매에 인공지능(AI)이 적용된다는걸 아시나요!<br>어떻게 활용하는게 좋으세요? <sub>(복수선택가능)</sub></div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>구매 패턴 분석을 통한 맞춤재료 추천</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>치료 패턴에 맞는 재료</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>재고파악 및 자동주문</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>빠른 배송</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>가격 비교 및 최저가 구매</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">치과 플랫폼 또는 커뮤니티에서<br>필요로 하는 컨텐츠는 무엇인가요? <sub>(복수선택가능)</sub></div>
                            </div>
                            <div class="input_btn_wrap div_2">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>치과계 뉴스</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>임상컨텐츠</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>제품정보</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>경영정보</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>A/S 꿀팁영상</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>구인구직</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">자주 찾는 치과 플랫폼 또는<br>커뮤니티는 어디인가요? <sub>(복수선택가능)</sub></div>
                            </div>
                            <div class="input_btn_wrap div_2">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>KDA(대한치과의사협회)</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>덴올</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>덴트포토</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>주변지인</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>학회</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>네이버, 구글</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>모어덴</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>없음</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">메디밸류에는 <span class="point">가격비교와 빠른주문</span>이 가능한 스토어와 인공지능(AI)을 통한<br><span class="point">구매 예측 프로세스</span>가 준비되어 있어요! 이런 서비스의 긍정적인 효과는 무엇이라고 생각하시나요?</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_01"><span>최저가 구매로 재료비 절감</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_01"><span>가격 비교 시간 절약</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_01"><span>구매 담당자 변경시 인수인계 과정 불필요</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_01"><span>재료 시세 확인과 구매 내역 관리</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_01"><span>구매채널 일원화를 통한 통합 회계관리</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">원장님 병원의<br>재료 구매 경로를 알려주세요.</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_02"><span>대부분 온라인 업체</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_02"><span>온라인 업체 80% / 오프라인 업체 20%</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_02"><span>온라인 업체 50% / 오프라인 업체 50%</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_02"><span>온라인 업체 20% / 오프라인 업체 80%</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_02"><span>대부분 오프라인 도매 업체</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">신규 재료 도입은<br>어떻게 결정되나요?</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_03"><span>온라인 이벤트 추천</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_03"><span>오프라인 재료상 추천</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_03"><span>지인추천</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_03"><span>광고</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_03"><span>세미나</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">치과에서 주로 재료를<br>구매하시는 분은 누구인가요?</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_04"><span>대표원장</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_04"><span>봉직의</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_04"><span>치위생사</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_04"><span>행정직원</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_04"><span>기타</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">비용 절감을 위한 가격 비교는<br>주로 누가하나요?</div>
                            </div>
                            <div class="input_btn_wrap div_2">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_05"><span>대표원장</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_05"><span>봉직의</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_05"><span>치위생사</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_05"><span>행정직원</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_05"><span>오프라인 재료상</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_05"><span>하지않음</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">기존 온라인 재료몰 구매 이용 시<br>불편한 점이 있으셨나요? <sub>(복수선택가능)</sub></div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>복잡하고 불편한 화면 디자인</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>광고 또는 이벤트 과다 노출</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>자사몰의 자사제품 끼워팔기 및 과도한 홍보</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>사이트 이용 불편시(반품 등)고객센터 연결이 어려움</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>온라인 재료 구매 안함</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">온라인 재료몰에서 이벤트 진행시<br>원하시는 이벤트나 경품이 있으신가요?</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_06"><span>파격적인 가격할인</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_06"><span>인기 상품 패키지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_06"><span>병원 운영에 필요한 사은품증정</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_06"><span>치과 운영 심층 세미나 참석권</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02_06"><span>기타<input type="text" placeholder="내용을 작성해주세요 :)" onfocus="btnInnerText(this);"></span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap slick_btn_wrap">
                                <button type="button" class="btn_prev">이전</button>
                                <button type="button" class="btn_next" onclick="location.href='/sample/survey_complete'">다음</button>
                            </div>
                        </div>
                    </article>
                </section>

                <div class="layer_popup">
                    <div class="layer_popup_bg"></div>
                    <div class="layer_popup_cont">
                        <div class="layer_popup_inner">
                            <div class="img">
                                <img src="/resources/images/survey/img_popup.png" alt="">
                            </div>
                            <div class="txt">
                                <p>마케팅 및 광고 미동의시 설문완료후<br><span>모바일쿠폰</span> 보내드리기가 힘들어요 ㅜㅜ</p>
                                <div class="btn">
                                    <button type="button" class="btn_no" onclick="agreeNoBtn();">마케팅 및 광고수신 동의안함</button>
                                    <button type="button" class="btn_yes" onclick="agreeYesBtn();">마케팅 및 광고수신 동의</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>