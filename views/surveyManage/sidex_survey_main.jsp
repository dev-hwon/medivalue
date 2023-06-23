<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>메디밸류</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
    <link rel="shortcut icon" href="/resources/images/favicon/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="/resources/images/favicon/favicon.png">
    <link rel="stylesheet" type="text/css" href="/resources/css/sidex_survey.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/slick.css" />
    <script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/resources/js/slick.min.js"></script>
    <script type="text/javascript" src="/resources/js/sidex_survey.js"></script>
    <script type="text/javascript">
        $(function () {
            $("input[name='fd_username']").on("keyup", function () {
                let value = $(this).val().replace(/[^a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]/g,'');
                $(this).val(value);
            });

            $("input[name='fd_tel']").on("keyup", function () {
                let value = $(this).val().replace(/[^0-9\.]/g,'');
                if (value.length > 11) {
                    value = value.slice(0, 11);
                }
                $(this).val(value);
            });
            $("input[name='fd_tel']").on("blur", function () {
                let value = $(this).val().replace(/[^0-9\.]/g,'');
                
                if (value.length > 11) {
                    value = value.slice(0, 11);
                }else  if (value.length >= 3) {
                	let temp_tel_no = value.substring(0,3);
                    if (temp_tel_no !='010' &&  
                    	temp_tel_no !='011' &&
                    	temp_tel_no !='016' &&
                    	temp_tel_no !='017' &&
                    	temp_tel_no!='018' &&
                    	temp_tel_no!='019'
                    ) {
                        alert('휴대전화번호를 입력하셔야 기프트콘 발송이 가능합니다.');
                        return false;
                    }
                }

                blur_tel_duplicate(value);

            });

            $("input[name='fd_email']").on("change", function () {
                let value = $(this).val();
                let emailTest = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
                if (!emailTest.test(value)) {
                    alert("올바른 이메일을 입력해주세요.");
                    $(this).val("");
                }
            });

            $("input[name='fd_license']").on("keyup", function () {
                let value = $(this).val().replace(/[^0-9\.]/g,'');
                $(this).val(value);
            });

            $("input[name='fd_answer_7']").on("click", function () {
                let formData = $("#survey_form").serialize();

                $.ajax({
                    url: "/survey/rest/save",
                    method: "POST",
                    data: formData,
                    success: function (data) {

                        if (data["rtn_cd"] === "200") {
                            location.href="/survey/complete";
                        } else {
                            alert(data["rtn_msg"])
                        }

                    }
                })
            });
        });

        function blur_tel_duplicate(tel) {
            if (tel !== '' && tel.length > 9) {
                $.ajax({
                    url: "/survey/rest/tel/duplicate",
                    method: "POST",
                    data: JSON.stringify({
                        "fd_tel": tel
                    }),
                    contentType: "application/json",
                    success: function (data) {
                        if (data['rtn_cd'] === '200') {
                            if (Boolean(data['duplicate'])) {
                                alert("설문 중복 참여는 불가능해요.");
                                $("input[name='fd_tel']").val("");
                            }
                        } else {
                            alert(data['rtn_msg']);
                        }
                    },
                    error: function () {
                        console.log(error);
                    }
                });
            }
            else {
                alert("연락처는 최소 10자리는 입력해주세요.");
                $("input[name='fd_tel']").val("");
            }
        }
    </script>
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
                        <a href="/survey/login">
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
                <form id="survey_form">
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
                                                    <input type="text" name="fd_username" autocomplete="off" style="ime-mode:active;" placeholder="성명을 입력해주세요.">
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <div class="txt">휴대폰 번호</div>
                                                    <input type="text" name="fd_tel" autocomplete="off" maxlength="15" placeholder="입력된 휴대폰 번호로 모바일 쿠폰 발송됩니다.">
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <div class="txt">e-mail</div>
                                                    <input type="email" name="fd_email" autocomplete="off" placeholder="e-mail을 입력해주세요.">
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <div class="txt">의사면허번호</div>
                                                    <input type="text" name="fd_license" autocomplete="off" placeholder="의사면허번호를 입력해주세요.">
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="agree_wrap">
                                        <label class="comm_check">
                                            <input type="checkbox" name="fd_agreement" value="Y" checked="checked"><span>마케팅 활용 동의 및 광고 수신 동의 <sub>(선택)</sub></span>
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
                                                <input type="radio" name="fd_answer_1" value="1"><span>직원이 자발적으로</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_1" value="2"><span>직원들에게 업무지시로</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_1" value="3"><span>단골 재료상 사장님에게 맡겨서</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_1" value="4"><span>진료 때문에 힘들고 지치지만 원장이 직접</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_1" value="5"><span>구매 및 재고관리 안함</span>
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
                                                <input type="radio" name="fd_answer_2" value="1"><span>쉽고 간편한 구매 AI 어시스턴트 도입</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_2" value="2"><span>단골 재료상 사장님에게 맡겨서 관리</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_2" value="3"><span>힘들고 지치지만 직접 엑셀 차트 관리</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_2" value="4"><span>직원들에게 100% 의지</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_2" value="5"><span>채용하기 어려운 치과재료관리 전담직원 채용</span>
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
                                                <input type="radio" name="fd_answer_3" value="1"><span>인수인계 안 하고 퇴사 했을 때</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_3" value="2"><span>일 떠넘기는 고연차 직원이 많아질 때</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_3" value="3"><span>수동적인 직원의 업무처리방식</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_3" value="4"><span>누락된 업무로 큰 손실을 봤을 때</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_3" value="5"><span>일 할 사람은 많은데 눈치만 보고 있을 때</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_3" value="6"><span>운영 인력이 없어 밤샘 근무할 때</span>
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
                                                <input type="radio" name="fd_answer_4" value="1"><span>병원 운영 AI 어시스턴트 도입</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_4" value="2"><span>메뉴얼과 엑셀을 통한 수작업 관리</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_4" value="3"><span>직원에게 맡김</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_4" value="4"><span>우수 직원 포상제도 도입</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_4" value="5"><span>매일 아침 원장 참석 운영 브리핑</span>
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
                                                <input type="radio" name="fd_answer_5" value="1"><span>스케줄이 꼬이지 않도록 체크해야 하는 예약관리</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_5" value="2"><span>막대한 마케팅 비용 대비 초라한 신규환자 유치</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_5" value="3"><span>진료 후 안내를 까먹어서 문제 발생</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_5" value="4"><span>진료시간을 예측할 수 없어 환자 대기시간 증가</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_5" value="5"><span>제때 수납처리를 못 해서 손실과 컴플레인 발생</span>
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
                                                <input type="radio" name="fd_answer_6" value="1"><span>환자 관리 AI 어시스턴트 도입</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_6" value="2"><span>1억 연봉 실장 영입</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_6" value="3"><span>원장의 친절한 미소</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_6" value="4"><span>직원 서비스 교육</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_6" value="5"><span>출혈을 감수하고 진행하는 할인 이벤트</span>
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
                                                <input type="radio" name="fd_answer_7" value="1"><span>메디밸류 AI 어시스턴트</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_7" value="2"><span>Medivalue AI Assistant</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_7" value="3"><span>메디밸류 AI Assistant</span>
                                            </label>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <label>
                                                <input type="radio" name="fd_answer_7" value="4"><span>Medivalue AI 어시스턴트</span>
                                            </label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                </section>
                </form>
                <div class="layer_popup">
                    <div class="layer_popup_bg"></div>
                    <div class="layer_popup_cont">
                        <div class="layer_popup_inner">
                            <div class="txt">
                                <button type="button" class="btn_close" onclick="closePopup(this);">&#10005;</button>
                                <p>마케팅 및 광고 미동의 시 설문 완료 후<br><span>모바일 쿠폰</span> 보내드리기가 힘들어요 ㅜㅜ</p>
                                <div class="btn" style="align-items: center;justify-content: center;">
<%--                                    <button type="button" class="btn_no" onclick="agreeNoBtn();">마케팅 및 광고수신 동의안함</button>--%>
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