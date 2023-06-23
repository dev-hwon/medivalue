<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:surveyFrame>
    <jsp:attribute name="javascript">
        <script>
            $(function () {

                $("input[name='surven_username_type_1']").on("keyup", function () {
                    let value = $(this).val().replace(/[^a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]/g,'');
                    $(this).val(value);
                });

                $("input[name='survey_phone_type_1']").on("keyup", function () {
                    let value = $(this).val().replace(/[^0-9\.]/g,'');
                    if (value.length > 11) {
                        value = value.slice(0, 11);
                    }
                    $(this).val(value);
                });
                $("input[name='survey_phone_type_1']").on("change", function () {
                    let value = $(this).val().replace(/[^0-9\.]/g,'');
                    if (value.length > 11) {
                        value = value.slice(0, 11);
                    }
                    blur_tel_duplicate(value);
                });

                $("input[name='survey_email_type_1']").on("change", function () {
                    let value = $(this).val();
                    let emailTest = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
                    if (!emailTest.test(value)) {
                        $(".notice_popup_txt").text("올바른 이메일 주소를 입력해주세요.");
                        $("#notice_popup").addClass("on");
                        $(this).val("");
                    }
                });

                $("input[name='survey_licence_number_type_1']").on("keyup", function () {
                    let value = $(this).val().replace(/[^0-9\.]/g,'');
                    $(this).val(value);
                });

                $("input[name='surven_username_type_2']").on("keyup", function () {
                    let value = $(this).val().replace(/[^a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]/g,'');
                    $(this).val(value);
                })

                $("input[name='survey_phone_type_2']").on("keyup", function () {
                    let value = $(this).val().replace(/[^0-9\.]/g,'');
                    if (value.length > 11) {
                        value = value.slice(0, 11);
                    }
                    $(this).val(value);
                });
                $("input[name='survey_phone_type_2']").on("change", function () {
                    let value = $(this).val().replace(/[^0-9\.]/g,'');
                    if (value.length > 11) {
                        value = value.slice(0, 11);
                    }
                    blur_tel_duplicate(value);
                });

                $("input[name='survey_email_type_2']").on("change", function () {
                    let value = $(this).val();
                    // $(this).val(value);
                    let emailTest = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
                    if (!emailTest.test(value)) {
                        $(".notice_popup_txt").text("올바른 이메일 주소를 입력해주세요.");
                        $("#notice_popup").addClass("on");
                        $(this).val("");
                    }
                });

                $("input[name='survey_licence_number_type_2']").on("keyup", function () {
                    let value = $(this).val().replace(/[^0-9\.]/g,'');
                    $(this).val(value);
                });

                $(".btn_survey_complete").on("click", function () {

                    // rdo_00 - survey_type
                    let survey_type = $("input[name='rdo_00']:checked").val();
                    let survey_value = {};
                    if (survey_type === '1') {

                        let survey_username = $("input[name='surven_username_type_1']").val();
                        let survey_phone = $("input[name='survey_phone_type_1']").val();
                        let survey_email = $("input[name='survey_email_type_1']").val();
                        let survey_licence_number = $("input[name='survey_licence_number_type_1']").val();

                        // 마케팅 활용 동의 및 광고 수신 동의
                        let survey_market_agreement_check = 'N';
                        if ($("input[name='survey_market_agreement_check_type_1']").prop("checked")) {
                            survey_market_agreement_check = 'Y';
                        } else {
                            survey_username = "";
                            survey_phone = "";
                            survey_email = "";
                            survey_licence_number = "";
                        }

                        let survey_answer_1 = $("input[name='rdo_01_01']:checked").val();

                        let survey_answer_2 =
                        $("input[name='chk_01_01']:checked").map(function () {
                            return $(this).val();
                        }).get().join();

                        let survey_answer_3 =
                        $("input[name='chk_01_02']:checked").map(function () {
                            return $(this).val();
                        }).get().join();

                        let survey_answer_4 = $("input[name='rdo_01_02']:checked").val();

                        let survey_answer_5 =
                            $("input[name='chk_01_03']:checked").map(function () {
                                return $(this).val();
                            }).get().join();

                        let survey_answer_6 = $("input[name='rdo_01_03']:checked").val();

                        let survey_answer_7 = $("input[name='rdo_01_04']:checked").val();

                        let survey_answer_8 = $("input[name='rdo_01_05']:checked").val();
                        let survey_answer_8_text = '';

                        if (survey_answer_8 === '5') {
                            survey_answer_8_text = $("input[name='rdo_01_05_text']").val();
                            survey_answer_8_text = survey_answer_8_text.trim();
                            if (survey_answer_8_text == null || survey_answer_8_text === '') {
                                $(".notice_popup_txt").text("기타문구를 작성해주세요!");
                                $("#notice_popup").addClass("on");
                                return;
                            }
                        }

                        survey_value = {
                            "fd_type": survey_type,
                            "fd_username": survey_username,
                            "fd_tel": survey_phone,
                            "fd_email": survey_email,
                            "fd_licence_number": survey_licence_number,
                            "fd_market_agreement_check": survey_market_agreement_check,
                            "fd_answer_1": survey_answer_1,
                            "fd_answer_2": survey_answer_2,
                            "fd_answer_3": survey_answer_3,
                            "fd_answer_4": survey_answer_4,
                            "fd_answer_5": survey_answer_5,
                            "fd_answer_6": survey_answer_6,
                            "fd_answer_7": survey_answer_7,
                            "fd_answer_8": survey_answer_8,
                            "fd_answer_8_text": survey_answer_8_text
                        };

                    } else {
                        let survey_username = $("input[name='surven_username_type_2']").val();
                        let survey_phone = $("input[name='survey_phone_type_2']").val();
                        let survey_email = $("input[name='survey_email_type_2']").val();
                        let survey_licence_number = $("input[name='survey_licence_number_type_2']").val();
                        let survey_medical_name = $("input[name='survey_medical_name_type_2']").val();
                        let survey_medical_address = $("input[name='survey_medical_address_type_2']").val();

                        // 마케팅 활용 동의 및 광고 수신 동의
                        let survey_market_agreement_check = 'N';
                        if ($("input[name='survey_market_agreement_check_type_2']").prop("checked")) {
                            survey_market_agreement_check = 'Y';
                        } else {
                            survey_username = "";
                            survey_phone = "";
                            survey_email = "";
                            survey_licence_number = "";
                            survey_medical_name = "";
                            survey_medical_address = "";
                        }

                        let survey_answer_1 =
                            $("input[name='chk_02_01']:checked").map(function () {
                                return $(this).val();
                            }).get().join();

                        let survey_answer_2 =
                            $("input[name='chk_02_02']:checked").map(function () {
                                return $(this).val();
                            }).get().join();

                        let survey_answer_3 =
                            $("input[name='chk_02_03']:checked").map(function () {
                                return $(this).val();
                            }).get().join();

                        let survey_answer_4 =
                            $("input[name='chk_02_04']:checked").map(function () {
                                return $(this).val();
                            }).get().join();

                        let survey_answer_5 = $("input[name='rdo_02_01']:checked").val();
                        let survey_answer_6 = $("input[name='rdo_02_02']:checked").val();
                        let survey_answer_7 = $("input[name='rdo_02_03']:checked").val();
                        let survey_answer_8 = $("input[name='rdo_02_04']:checked").val();
                        let survey_answer_9 = $("input[name='rdo_02_05']:checked").val();

                        let survey_answer_10 =
                            $("input[name='chk_02_05']:checked").map(function () {
                                return $(this).val();
                            }).get().join();

                        let survey_answer_11 = $("input[name='rdo_02_06']:checked").val();
                        let survey_answer_11_text = '';

                        if (survey_answer_11 === '5') {
                            survey_answer_11_text = $("input[name='rdo_02_06_text']").val();
                            survey_answer_11_text = survey_answer_11_text.trim();
                            if (survey_answer_11_text == null || survey_answer_11_text === '') {
                                $(".notice_popup_txt").text("기타문구를 작성해주세요!");
                                $("#notice_popup").addClass("on");
                                return;
                            }
                        }

                        survey_value = {
                            "fd_type": survey_type,
                            "fd_username": survey_username,
                            "fd_tel": survey_phone,
                            "fd_email": survey_email,
                            "fd_licence_number": survey_licence_number,
                            "fd_medical_name": survey_medical_name,
                            "fd_medical_address": survey_medical_address,
                            "fd_market_agreement_check": survey_market_agreement_check,
                            "fd_answer_1": survey_answer_1,
                            "fd_answer_2": survey_answer_2,
                            "fd_answer_3": survey_answer_3,
                            "fd_answer_4": survey_answer_4,
                            "fd_answer_5": survey_answer_5,
                            "fd_answer_6": survey_answer_6,
                            "fd_answer_7": survey_answer_7,
                            "fd_answer_8": survey_answer_8,
                            "fd_answer_9": survey_answer_9,
                            "fd_answer_10": survey_answer_10,
                            "fd_answer_11": survey_answer_11,
                            "fd_answer_11_text": survey_answer_11_text
                        };
                    }

                    console.log("=== === === insert survey === === ===");
                    console.log(JSON.stringify(survey_value));
                    console.log("=== === === insert survey === === ===");

                    $.ajax({
                        url: "/survey/rest/save",
                        method: "POST",
                        contentType: "application/json",
                        accept: "*/*",
                        data: JSON.stringify(survey_value),
                        success: function (data) {
                            if (data['rtn_cd'] == '200') {
                                location.href = '/survey/complete';
                            } else {
                                $(".notice_popup_txt").text(data['rtn_msg']);
                                $("#notice_popup").addClass("on");
                            }
                        },
                        error: function (error) {
                            console.log(error);
                        }
                    })

                });

            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div id="wrap">
            <div id="container" class="main">
                <main>
                    <nav>
                        <div class="home">
                            <a href="/survey/home">
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
                                                    <input autocomplete="off" type="radio" name="rdo_00" value="1" ><span>네.<br>개원예정입니다.</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input autocomplete="off" type="radio" name="rdo_00" value="2" ><span>아니요.<br>이미 개원하였습니다.</span>
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
                        <article class="ready">
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
                                                    <input type="text" name="surven_username_type_1" autocomplete="off" placeholder="성명을 입력해주세요.">
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <div class="txt">연락처</div>
                                                    <input type="text" name="survey_phone_type_1" autocomplete="off" placeholder="연락처를 입력해주세요.">
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <div class="txt">e-mail</div>
                                                    <input type="email" name="survey_email_type_1" autocomplete="off" placeholder="e-mail을 입력해주세요.">
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <div class="txt">의사면허번호</div>
                                                    <input type="text" name="survey_licence_number_type_1" autocomplete="off" placeholder="의사면허번호를 입력해주세요.">
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="agree_wrap">
                                        <label class="comm_check">
                                            <input type="checkbox" name="survey_market_agreement_check_type_1" checked><span>마케팅 활용 동의 및 광고 수신 동의 <sub>(선택)</sub></span>
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
                                                    <input type="radio" name="rdo_01_01" value="1"><span>네</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_01" value="2"><span>아니오</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_01" value="3"><span>잘모르겠다</span>
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
                                                    <input type="checkbox" name="chk_01_01" value="1"><span>체어 대수</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_01" value="2"><span>개원자금</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_01" value="3"><span>입지선정</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_01" value="4"><span>인테리어</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_01" value="5"><span>세무 노무</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_01" value="6"><span>고정 재료비</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_01" value="7"><span>마케팅</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_01" value="8"><span>인맥</span>
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
                                    <div class="title">개원이 치과의사의 끝일까요? 개원 이후 모르면 죄가 되는<br><span class="point">꼭! 알아두어야 할 요소</span>는 무엇일까요? <sub>(복수선택가능)</sub></div>
                                </div>
                                <div class="input_btn_wrap">
                                    <ul>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_02" value="1"><span>운영 비용 절감 노하우</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_02" value="2"><span>세무 관련 이슈</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_02" value="3"><span>직원 채용 이슈</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_02" value="4"><span>구매 업무 프로세스</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_02" value="5"><span>재료관리</span>
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
                                                    <input type="radio" name="rdo_01_02" value="1"><span>최저가 재료구매</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_02" value="2"><span>전자 차트관리</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_02" value="3"><span>세무 노무</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_02" value="4"><span>인력관리</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_02" value="5"><span>마케팅</span>
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
                                    <div class="title">온라인 재료몰 구매 이용 시 불편한 점이 있으셨나요? <sub>(복수선택가능)</sub></div>
                                </div>
                                <div class="input_btn_wrap">
                                    <ul>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_03" value="1"><span>복잡하고 불편한 화면 디자인</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_03" value="2"><span>광고 또는 이벤트 과다 노출</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_03" value="3"><span> 자사몰의 자사제품 끼워팔기 및 과도한 홍보</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_03" value="4"><span>사이트 이용 불편시(반품 등)고객센터 연결이 어려움</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_01_03" value="5"><span>온라인 재료 구매 안해봄</span>
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
                                                    <input type="radio" name="rdo_01_03" value="1"><span>온라인 이벤트 추천</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_03" value="2"><span>오프라인 재료상 추천 </span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_03" value="3"><span>광고</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_03" value="4"><span>세미나</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_03" value="5"><span>모름</span>
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
                                    <div class="title">기존에 근무하시던 치과에서<br>주로 재료를 구매하시는 분은 누구인가요?</div>
                                </div>
                                <div class="input_btn_wrap">
                                    <ul>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_04" value="1"><span>대표원장</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_04" value="2"><span>봉직의</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_04" value="3"><span>치위생사</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_04" value="4"><span>행정직원</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_04" value="5"><span>기타</span>
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
                                                    <input type="radio" name="rdo_01_05" value="1"><span>파격적인 가격할인</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_05" value="2"><span>인기 상품 패키지</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_05" value="3"><span>병원 운영에 필요한 사은품증정</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_05" value="4"><span>치과 운영 심층 세미나 참석권</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_01_05" value="5"><span>기타<input type="text" name="rdo_01_05_text" placeholder="내용을 작성해주세요 :)" onfocus="btnInnerText(this);"></span>
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="button_wrap slick_btn_wrap">
                                    <button type="button" class="btn_prev">이전</button>
                                    <button type="button" class="btn_next btn_survey_complete">다음</button>
                                </div>
                            </div>
                        </article>
                    </section>





                    <section class="sec_after">
                        <article class="ready">
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
                                                    <input type="text" name="surven_username_type_2" autocomplete="off" placeholder="성명을 입력해주세요.">
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <div class="txt">연락처</div>
                                                    <input type="text" name="survey_phone_type_2" autocomplete="off" placeholder="연락처를 입력해주세요.">
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <div class="txt">e-mail</div>
                                                    <input type="email" name="survey_email_type_2" autocomplete="off" placeholder="e-mail을 입력해주세요.">
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <div class="txt">의사면허번호</div>
                                                    <input type="text" name="survey_licence_number_type_2" autocomplete="off" placeholder="의사면허번호를 입력해주세요.">
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <div class="txt">치과명</div>
                                                    <input type="text" name="survey_medical_name_type_2" autocomplete="off" placeholder="치과명을 입력해주세요.">
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <div class="txt">치과주소 <sub>상세주소 생략</sub></div>
                                                    <input type="text" name="survey_medical_address_type_2" autocomplete="off" placeholder="치과주소를 입력해주세요.">
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="agree_wrap">
                                        <label class="comm_check">
                                            <input type="checkbox" name="survey_market_agreement_check_type_2" checked><span>마케팅 활용 동의 및 광고 수신 동의 <sub>(선택)</sub></span>
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
                                                    <input type="checkbox" name="chk_02_01" value="1"><span>경영 전문 지식 미흡</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_01" value="2"><span>업무 프로세스 부재</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_01" value="3"><span>재료 관리</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_01" value="4"><span>입지</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_01" value="5"><span>체어 회전률</span>
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
                                                    <input type="checkbox" name="chk_02_02" value="1"><span>구매 패턴 분석을 통한 맞춤재료 추천</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_02" value="2"><span>치료 패턴에 맞는 재료</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_02" value="3"><span>재고파악 및 자동주문</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_02" value="4"><span>빠른 배송</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_02" value="5"><span>가격 비교 및 최저가 구매</span>
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
                                                    <input type="checkbox" name="chk_02_03" value="1"><span>치과계 뉴스</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_03" value="2"><span>임상컨텐츠</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_03" value="3"><span>제품정보</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_03" value="4"><span>경영정보</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_03" value="5"><span>A/S 꿀팁영상</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_03" value="6"><span>구인구직</span>
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
                                                    <input type="checkbox" name="chk_02_04" value="1"><span>KDA(대한치과의사협회)</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_04" value="2"><span>덴올</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_04" value="3"><span>덴트포토</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_04" value="4"><span>주변지인</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_04" value="5"><span>학회</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_04" value="6"><span>네이버, 구글</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_04" value="7"><span>모어덴</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" id="chk_02_04_id" name="chk_02_04" value="8"><span>없음</span>
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
                                    <div class="title">메디밸류에는 <span class="point">가격비교와 빠른주문</span>이 가능한 스토어와 인공지능(AI)을 통한<br><span class="point">구매 예측 프로세스</span>가 준비 되어 있어요! 이런 서비스의 긍정적인 효과는 무엇이라고 생각하시나요?</div>
                                </div>
                                <div class="input_btn_wrap">
                                    <ul>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_01" value="1"><span>최저가 구매로 재료비 절감</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_01" value="2"><span>가격 비교 시간 절약</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_01" value="3"><span>구매 담당자 변경시 인수인계 과정 불필요</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_01" value="4"><span>재료 시세 확인과 구매 내역 관리</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_01" value="5"><span>구매채널 일원화를 통한 통합 회계관리</span>
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
                                                    <input type="radio" name="rdo_02_02" value="1"><span>대부분 온라인 업체</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_02" value="2"><span>온라인 업체 80% / 오프라인 업체 20%</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_02" value="3"><span>온라인 업체 50% / 오프라인 업체 50%</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_02" value="4"><span>온라인 업체 20% / 오프라인 업체 80%</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_02" value="5"><span>대부분 오프라인 도매 업체</span>
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
                                                    <input type="radio" name="rdo_02_03" value="1"><span>온라인 이벤트 추천</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_03" value="2"><span>오프라인 재료상 추천</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_03" value="3"><span>지인추천</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_03" value="4"><span>광고</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_03" value="5"><span>세미나</span>
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
                                                    <input type="radio" name="rdo_02_04" value="1"><span>대표원장</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_04" value="2"><span>봉직의</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_04" value="3"><span>치위생사</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_04" value="4"><span>행정직원</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_04" value="5"><span>기타</span>
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
                                                    <input type="radio" name="rdo_02_05" value="1"><span>대표원장</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_05" value="2"><span>봉직의</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_05" value="3"><span>치위생사</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_05" value="4"><span>행정직원</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_05" value="5"><span>오프라인 재료상</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_05" value="6"><span>하지않음</span>
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
                                                    <input type="checkbox" name="chk_02_05" value="1"><span>복잡하고 불편한 화면 디자인</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_05" value="2"><span>광고 또는 이벤트 과다 노출</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_05" value="3"><span>자사몰의 자사제품 끼워팔기 및 과도한 홍보</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_05" value="4"><span>사이트 이용 불편시(반품 등)고객센터 연결이 어려움</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="checkbox" name="chk_02_05" value="5"><span>온라인 재료 구매 안함</span>
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
                                                    <input type="radio" name="rdo_02_06" value="1"><span>파격적인 가격할인</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_06" value="2"><span>인기 상품 패키지</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_06" value="3"><span>병원 운영에 필요한 사은품증정</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_06" value="4"><span>치과 운영 심층 세미나 참석권</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label>
                                                    <input type="radio" name="rdo_02_06" value="5"><span>기타<input type="text" name="rdo_02_06_text" placeholder="내용을 작성해주세요 :)" onfocus="btnInnerText(this);"></span>
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="button_wrap slick_btn_wrap">
                                    <button type="button" class="btn_prev">이전</button>
                                    <button type="button" class="btn_next btn_survey_complete">다음</button>
                                </div>
                            </div>
                        </article>
                    </section>

                    <div class="layer_popup" id="market_agreement">
                        <div class="layer_popup_bg"></div>
                        <div class="layer_popup_cont">
                            <div class="layer_popup_inner">
                                <div class="img">
                                    <img src="/resources/images/survey/img_popup.png" alt="">
                                </div>
                                <div class="txt">
                                	<button type="button" class="btn_close" onclick="closePopup(this);">&#10005;</button>
                                    <p>마케팅 및 광고 미동의시 설문완료후<br><span>모바일쿠폰</span> 보내드리기가 힘들어요 ㅜㅜ</p>
                                    <div class="btn">
                                        <button type="button" class="btn_no" onclick="agreeNoBtn();">마케팅 및 광고수신 동의안함</button>
                                        <button type="button" class="btn_yes" onclick="agreeYesBtn();">마케팅 및 광고수신 동의</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="layer_popup" id="input_check">
                        <div class="layer_popup_bg"></div>
                        <div class="layer_popup_cont">
                            <div class="layer_popup_inner">
                                <div class="img">
                                    <img src="/resources/images/survey/img_popup.png" alt="">
                                </div>
                                <div class="txt">
<%--                                    <p>마케팅 및 광고 미동의시 설문완료후<br><span>모바일쿠폰</span> 보내드리기가 힘들어요 ㅜㅜ</p>--%>
                                    <p>인적사항 미입력시 <br><span>이벤트 참여가</span> 불가능해요 ㅜㅜ</p>
                                    <div class="btn">
                                        <button type="button" class="btn_no" onclick="inputNoBtn();">익명으로 진행</button>
                                        <button type="button" class="btn_yes" onclick="inputYesBtn();">취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="layer_popup" id="notice_popup">
                        <div class="layer_popup_bg"></div>
                        <div class="layer_popup_cont">
                            <div class="layer_popup_inner">
                                <div class="img">
                                    <img src="/resources/images/survey/img_popup.png" alt="">
                                </div>
                                <div class="txt">
                                    <p class="notice_popup_txt"></p>
                                    <div class="btn" style="justify-content: center">
                                        <button type="button" class="btn_yes" onclick="popUpBtn();">확인</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </jsp:body>
</layout:surveyFrame>