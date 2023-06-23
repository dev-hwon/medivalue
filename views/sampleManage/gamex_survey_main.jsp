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
    <link rel="shortcut icon" href="/resources/images/favicon/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="/resources/images/favicon/favicon.png">
    <link rel="stylesheet" type="text/css" href="/resources/css/gamex_survey.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/slick.css" />
    <script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/resources/js/slick.min.js"></script>
    <script type="text/javascript" src="/resources/js/gamex_survey.js"></script>
</head>
<body>
    <div id="wrap">
        <div id="container" class="main">
            <main>
                <nav>
                    <div class="home">
                        <a href="/sample/gamex_survey_login">
                            <img src="/resources/images/gamex_survey/ico_home.png" alt="">
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
                            <div class="title_wrap">
                                <div class="title">안녕하세요, 원장님 반갑습니다~!<br>경품 발송을 위한 정보를 입력해주세요.</div>
                            </div>
                            <div class="input_txt_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <div class="txt">이름</div>
                                                <input type="text" autocomplete="off" placeholder="이름을 입력해주세요.">
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <div class="txt">휴대폰</div>
                                                <div class="div3">
                                                    <input type="text" autocomplete="off" placeholder="" value="010" class="inp_sel" readonly>
                                                    <input type="text" autocomplete="off" placeholder="" maxlength="4" class="inp_tel inp_tel_1" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                                                    <input type="text" autocomplete="off" placeholder="" maxlength="4" class="inp_tel inp_tel_2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" readonly>
                                                </div>
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
                                        <input type="checkbox" checked><span>마케팅 활용 동의 및 광고 수신 동의 <sub>(선택)</sub></span>
                                    </label>
                                </div>
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="history.back();">이전</button>
                                <button type="button" class="btn_next" onclick="validationAgree(this);">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="ques_wrap">
                                <div class="img">
                                    <img src="/resources/images/gamex_survey/img_common.png" alt="">
                                </div>
                                <div class="txt">
                                    원장님은 <span>개원</span>하셨나요?
                                </div>
                            </div>
                            <div class="input_btn_wrap div_2 btn_big">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_00" value="1" ><span>네.<br>개원했습니다.</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_00" value="2" class="rdo_not_open"><span>아니요.<br>개원 예정입니다.</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="prevSlideBtn();">이전</button>
                                <button type="button" class="btn_next" onclick="goToNextSlideBtnForkOpen(this);">다음</button>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">현재 어디에서 치과재료를<br>구매하고 계신가요? (중복선택가능)</div>
                            </div>
                            <div class="input_btn_wrap div_2">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name="" class="chk_medivalue"><span>메디밸류</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>이덴트</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>DV몰</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>세일글로발</span>
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
                                                <input type="checkbox" name=""><span>오프라인 재료상</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li class="li_full li_etc">
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>기타 (클릭 후 직접 입력)</span>
                                                <div class="inp_etc_wrap">
                                                    <input type="text" class="inp_etc" placeholder="내용을 입력하세요.">
                                                    <button type="button" class="btn_uncheck" onclick="etcUncheckBtn(this)"></button>
                                                </div>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="prevSlideBtn();">이전</button>
                                <button type="button" class="btn_next" onclick="goToNextSlideBtnFork(this);">다음</button>
                            </div>
                        </div>
                    </article>
                    <article class="validationMax3">
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">메디밸류를 사용하시는<br>가장 큰 이유는 무엇인가요? (3개 선택 가능)</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>구매 전에 재료 가격비교를 할 수 있어서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>재료 구매 시간을 단축할 수 있어서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>의료재료비를 아낄 수 있어서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>재료구매 전 과정(검색, 가격비교, 장바구니)을 한 화면에서 볼 수 있어서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li class="li_etc">
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>기타 (클릭 후 직접 입력)</span>
                                                <div class="inp_etc_wrap">
                                                    <input type="text" class="inp_etc" placeholder="내용을 입력하세요.">
                                                    <button type="button" class="btn_uncheck" onclick="etcUncheckBtn(this)"></button>
                                                </div>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="prevSlideBtn();">이전</button>
                                <button type="button" class="btn_next" onclick="goToNextSlideBtn(this);">다음</button>
                            </div>
                        </div>
                    </article>
                    <article class="validationMax3">
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">메디밸류를 사용하시지 않는<br>가장 큰 이유는 무엇인가요? (3개 선택 가능)</div>
                            </div>
                            <div class="input_btn_wrap div_2">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>인지도가 없어서 </span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>치과재료가 많이 없을 것 같아서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>의약품이 없어서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>지금 사용하는 곳보다 가격이 비쌀 것 같아서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>지금 사용하는 곳이 마음에 들어서 </span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>이미 사용했는데 별로여서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li class="li_full li_etc">
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>기타 (클릭 후 직접 입력)</span>
                                                <div class="inp_etc_wrap">
                                                    <input type="text" class="inp_etc" placeholder="내용을 입력하세요.">
                                                    <button type="button" class="btn_uncheck" onclick="etcUncheckBtn(this)"></button>
                                                </div>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="goToPrevSlideBtn(this);">이전</button>
                                <button type="button" class="btn_next" onclick="nextSlideBtn();">다음</button>
                            </div>
                        </div>
                    </article>
                    <article class="validationMax3">
                        <div class="inner inner_big">
                            <div class="title_wrap">
                                <div class="title">현재 사용하는 치과재료 구매처의<br>어떤 점 때문에 계속 이용하고 계신가요? (3개 선택 가능)</div>
                            </div>
                            <div class="input_btn_wrap div_3">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>이벤트나 혜택이 많아서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>가격이 저렴해서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>배송이 빨라서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>후불 결제가 가능해서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>후기를 바로 볼 수 있어서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>예치금을 사용할 수 있어서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>멤버쉽 혜택을 누릴 수 있어서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>무이자 할부가 가능해서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>재료 입고 요청 시 바로 수급이 되어서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>거래처 담당자와 오랫동안 거래를 해왔어서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>무상 A/S를 지원해서</span>
                                            </label>
                                        </div>
                                    </li>

                                    <li class="li_etc">
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>기타 (클릭 후 직접 입력)</span>
                                                <div class="inp_etc_wrap">
                                                    <input type="text" class="inp_etc" placeholder="내용을 입력하세요.">
                                                    <button type="button" class="btn_uncheck" onclick="etcUncheckBtn(this)"></button>
                                                </div>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="goToPrevSlideBtnFork(this);">이전</button>
                                <button type="button" class="btn_next" onclick="nextSlideBtn();">다음</button>
                            </div>
                        </div>
                    </article>
                    <article class="validationMax3">
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">처음 들어본 브랜드의 인상재 재료를 사용 결정을 할 때,<br>어떤 요소를 가장 중요하게 보시나요? (3개 선택 가능)</div>
                            </div>
                            <div class="input_btn_wrap div_2">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>기존 제품보다 저렴한지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>샘플 사용 후 기존 제품보다 사용하기 편리한지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>제조사가 어느 곳인지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>어떤 성분이 들어있는지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li class="li_full">
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>동료 의사들의 추천 또는 후기가 괜찮은지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li class="li_full li_etc">
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>기타 (클릭 후 직접 입력)</span>
                                                <div class="inp_etc_wrap">
                                                    <input type="text" class="inp_etc" placeholder="내용을 입력하세요.">
                                                    <button type="button" class="btn_uncheck" onclick="etcUncheckBtn(this)"></button>
                                                </div>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="goToPrevSlideBtnForkOpen(this);">이전</button>
                                <button type="button" class="btn_next" onclick="nextSlideBtn();">다음</button>
                            </div>
                        </div>
                    </article>
                    <article class="validationMax3">
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">처음 들어본 브랜드의 MTA 신제품 사용 결정을 할 때,<br>어떤 요소를 가장 중요하게 보시나요? (3개 선택 가능)</div>
                            </div>
                            <div class="input_btn_wrap div_2">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>특허받은 신기술인지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>제조사가 어느 곳인지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>원재료 등 어떤 성분이 들어있는지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>기존 재료보다 경화시간, 흐름도 등이 우수한지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>식품의약품안전처 허가를 받은 곳인지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>검증된 곳에 관련 논문이 등재되었는지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>임상 치료 사례를 통해 부작용이 없는지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li class="li_etc">
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>기타 (클릭 후 직접 입력)</span>
                                                <div class="inp_etc_wrap">
                                                    <input type="text" class="inp_etc" placeholder="내용을 입력하세요.">
                                                    <button type="button" class="btn_uncheck" onclick="etcUncheckBtn(this)"></button>
                                                </div>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="prevSlideBtn();">이전</button>
                                <button type="button" class="btn_next" onclick="nextSlideBtn();">다음</button>
                            </div>
                        </div>
                    </article>

                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">서울 e치과는 메디밸류에서 치과재료비를 연간 492만원을 절감했습니다. (실사례)<br>메디밸류의 어떤 점이 이걸 가능하게 했을까요? (중복선택가능)</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>한번에 대형 온라인 3사몰 가격비교를 통해 최저가로 구매해서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>초대형 도매상과 직거래로 거품이 빠진 가격으로 구매해서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>첫 구매 100원, 특가와 이벤트 제품을 저렴하게 구매해서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>재료 구매하고 OK캐쉬백 포인트로 현금 또는 항공마일리지로 전환하여 사용이 가능해서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="checkbox" name=""><span>빠른주문하기로 담당자의 업무 효율을 증가시켜 실질 인건비가 절감돼서</span>
                                            </label>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="prevSlideBtn();">이전</button>
                                <button type="button" class="btn_next" onclick="nextSlideBtn();">다음</button>
                            </div>
                        </div>
                    </article>
                    <article class="tutorial ready">
                        <div class="inner">
                            <div class="txt_wrap">
                                <div class="logo">
                                    <img src="/resources/images/gamex_survey/ico_logo_s.png" alt="">
                                </div>
                                <div class="desc">여기서 잠깐! 5초 만에 이해하는</div>
                                <div class="title">빠른주문하기 미리보기</div>
                            </div>
                            <div class="img_wrap">
                                <img src="/resources/images/gamex_survey/img_tutorial_00.png" alt="">
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="prevSlideBtn();">이전</button>
                                <button type="button" class="btn_next" onclick="nextSlideBtn();">다음</button>
                            </div>
                        </div>
                    </article>
                    <article class="tutorial nav_hide ready">
                        <div class="inner">
                            <div class="img_tutorial_wrap">
                                <img src="/resources/images/gamex_survey/img_tutorial_01.jpg" alt="">
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="prevSlideBtn();">이전</button>
                                <button type="button" class="btn_next" onclick="nextSlideBtn();">다음</button>
                            </div>
                        </div>
                    </article>
                    <article class="tutorial nav_hide ready">
                        <div class="inner">
                            <div class="img_tutorial_wrap">
                                <img src="/resources/images/gamex_survey/img_tutorial_02.jpg" alt="">
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="prevSlideBtn();">이전</button>
                                <button type="button" class="btn_next" onclick="nextSlideBtn();">다음</button>
                            </div>
                        </div>
                    </article>
                    <article class="tutorial nav_hide ready">
                        <div class="inner">
                            <div class="img_tutorial_wrap">
                                <img src="/resources/images/gamex_survey/img_tutorial_03.jpg" alt="">
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="prevSlideBtn();">이전</button>
                                <button type="button" class="btn_next" onclick="nextSlideBtn();">다음</button>
                            </div>
                        </div>
                    </article>
                    <article class="tutorial nav_hide ready">
                        <div class="inner">
                            <div class="img_tutorial_wrap">
                                <img src="/resources/images/gamex_survey/img_tutorial_04.jpg" alt="">
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="prevSlideBtn();">이전</button>
                                <button type="button" class="btn_next" onclick="nextSlideBtn();">다음</button>
                            </div>
                        </div>
                    </article>
                    <article class="tutorial nav_hide ready">
                        <div class="inner">
                            <div class="img_tutorial_wrap">
                                <img src="/resources/images/gamex_survey/img_tutorial_05.jpg" alt="">
                            </div>
                            <div class="button_wrap">
                                <button type="button" class="btn_prev" onclick="prevSlideBtn();">이전</button>
                                <button type="button" class="btn_next" onclick="location.href='/sample/gamex_survey_complete'">다음</button>
                            </div>
                        </div>
                    </article>
                </section>

                <div class="layer_popup">
                    <div class="layer_popup_bg"></div>
                    <div class="layer_popup_cont">
                        <button type="button" class="btn_close" onclick="closePopup(this);">&#10005;</button>
                        <div class="txt">
                            <img src="/resources/images/gamex_survey/img_popup.png" alt="">
                            <p>마케팅 및 광고 미동의시 설문 완료 후<br>경품 발송 해드리기 힘들어요. ㅜㅜ</p>
                        </div>
                        <div class="btn">
                            <button type="button" class="btn_no" onclick="agreeNoBtn();">마케팅 및 광고수신 동의안함</button>
                            <button type="button" class="btn_yes" onclick="agreeYesBtn();">마케팅 및 광고수신 동의</button>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>