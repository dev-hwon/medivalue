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
    <link rel="stylesheet" type="text/css" href="/resources/css/sidex_survey.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/slick.css" />
    <script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/resources/js/slick.min.js"></script>
    <script type="text/javascript" src="/resources/js/sidex_survey.js"></script>
</head>
<body>
    <div id="wrap">
        <div id="container" class="main">
            <main>
                <div class="comm_bg">
                    <img src="/resources/images/sidex_survey/bg_sidex_survey_shape_01_b.png" alt="" class="img_bg_shape_01">
                    <img src="/resources/images/sidex_survey/bg_sidex_survey_shape_02_b.png" alt="" class="img_bg_shape_02">
                    <img src="/resources/images/sidex_survey/bg_sidex_survey_shape_03_b.png" alt="" class="img_bg_shape_03">
                </div>
                <nav>
                    <div class="home">
                        <a href="/sample/sidex_survey_login">
                            <img src="/resources/images/sidex_survey/ico_home.png" alt="">
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
                                <div class="title">원장님 안녕하세요? 메디밸류 AI 어시스턴트입니다 :D<br>설문에 앞서 아래의 인적 사항을 입력 부탁드립니다.</div>
                            </div>
                            <div class="input_txt_wrap">
                                <div class="input_inner">
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
                                        <div class="desc">※ 모바일 쿠폰 배송을 위해 동의 부탁드립니다.</div>
                                    </div>
                                </div>
                                <div class="buttons_wrap">
                                    <button type="button" class="btn_prev" onclick="history.back();">이전</button>
                                    <button type="button" class="btn_next" onclick="validationAgree(this);">다음</button>
                                </div>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">정보 입력 감사합니다 :)<br>아래의 정보가 맞는지 확인부탁드립니다~</div>
                            </div>
                            <div class="input_txt_wrap confirm">
                                <div class="input_inner">
                                    <ul>
                                        <li>
                                            <div>
                                                <label>
                                                    <div class="txt">성명</div>
                                                    <div class="output"></div>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <div class="txt">연락처</div>
                                                    <div class="output"></div>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <div class="txt">e-mail</div>
                                                    <div class="output"></div>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <div class="txt">의사면허번호</div>
                                                    <div class="output"></div>
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="buttons_wrap">
                                    <button type="button" class="btn_prev" onclick="prevSlideBtn();">수정</button>
                                    <button type="button" class="btn_next" onclick="nextSlideBtn();">다음</button>
                                </div>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">귀찮지만 꼭 해야하는<br><span class="point">치과재료 구매와 재고관리</span>는 어떻게 하시나요?</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01"><span>직원이 자발적으로</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01"><span>직원들에게 업무지시로</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01"><span>단골 재료상 사장님에게 맡겨서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01"><span>진료 때문에 힘들고 지치지만 원장이 직접</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_01"><span>구매 및 재고관리 안함</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">가격비교, 구매주기 분석 등 치과 재료 관리를<br>위한 <span class="point">가장 스마트한 방법</span>은 무엇일까요?</div>
                            </div>
                            <div class="input_btn_wrap div_emphs">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02"><span>쉽고 간편한 구매 AI 어시스턴트 도입</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02"><span>단골 재료상 사장님에게 맡겨서 관리</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02"><span>힘들고 지치지만 직접 엑셀 차트 관리</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02"><span>직원들에게 100% 의지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_02"><span>채용하기 어려운 치과재료관리 전담직원 채용</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">치과 운영 중 가장 <span class="point">열받게 만드는 것</span>은?</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_03"><span>인수인계 안 하고 퇴사 했을 때</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_03"><span>일 떠넘기는 고연차 직원이 많아질 때</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_03"><span>수동적인 직원의 업무처리방식</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_03"><span>누락된 업무로 큰 손실을 봤을 때</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_03"><span>일 할 사람은 많은데 눈치만 보고 있을 때</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_03"><span>운영 인력이 없어 밤샘 근무할 때</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">효율적으로 치과를 운영하기 위한 <span class="point">가장 좋은 방법</span>은 무엇일까요?</div>
                            </div>
                            <div class="input_btn_wrap div_emphs">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_04"><span>병원 운영 AI 어시스턴트 도입</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_04"><span>메뉴얼과 엑셀을 통한 수작업 관리</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_04"><span>직원에게 맡김</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_04"><span>우수 직원 포상제도 도입</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_04"><span>매일 아침 원장 참석 운영 브리핑</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title"><span class="point">환자를 관리</span>하면서 가장 힘들었던 상황은?</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_05"><span>스케줄이 꼬이지 않도록 체크해야 하는 예약관리</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_05"><span>막대한 마케팅 비용 대비 초라한 신규환자 유치</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_05"><span>진료 후 안내를 까먹어서 문제 발생</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_05"><span>진료시간을 예측할 수 없어 환자 대기시간 증가</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_05"><span>제때 수납처리를 못 해서 손실과 컴플레인 발생</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">환자들이 만족할 만한 최고의 관리를 위한 <span class="point">가장 똑똑한 방법</span>은 무엇일까요?</div>
                            </div>
                            <div class="input_btn_wrap div_emphs">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_06"><span>환자 관리 AI 어시스턴트 도입</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_06"><span>1억 연봉 실장 영입</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_06"><span>원장의 친절한 미소</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_06"><span>직원 서비스 교육</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_06"><span>출혈을 감수하고 진행하는 할인 이벤트</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="inner">
                            <div class="title_wrap">
                                <div class="title">시행착오 없이 성공적으로 병원 운영을 할 수 있는<br><span class="point">AI 기술 솔루션</span>을 <span class="point">보유한 기업</span>은?</div>
                            </div>
                            <div class="input_btn_wrap">
                                <ul>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_07"><span>메디밸류 AI 어시스턴트</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_07"><span>Medivalue AI Assistant</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_07"><span>메디밸류 AI Assistant</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="rdo_07"><span>Medivalue AI 어시스턴트</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                </section>

                <div class="layer_popup">
                    <div class="layer_popup_bg"></div>
                    <div class="layer_popup_cont">
                        <div class="layer_popup_inner">
                            <div class="txt">
                                <button type="button" class="btn_close" onclick="closePopup(this);">&#10005;</button>
                                <p>마케팅 및 광고 미동의 시 설문 완료 후<br><span>모바일 쿠폰</span> 보내드리기가 힘들어요 ㅜㅜ</p>
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