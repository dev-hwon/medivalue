<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/slick.css?v=20230320"/>
		<link rel="stylesheet" href="/resources/css/main.css?v=20230320" />
		<link rel="stylesheet" href="/resources/css/layout.css?v=20230320" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
        <link rel="stylesheet" href="/resources/css/quickorder.css?20220831" />
        <link rel="stylesheet" href="/resources/css/medicash.css?20230418" />

		<style type="text/css">
            .d-none {
                display: none;
            }

            #header .btm .area .real_area .right > ul > li.hd_r_btn3 .cart_alarm {
                top: 45px !important;
                right: -22px !important;
            }
        </style>
	</jsp:attribute>
    <jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/slick.min.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220317"></script>
		<script src="/resources/js/jquery/plugin/cookie/jquery.cookie.js"></script>

        <script type="text/javascript">

        </script>
	</jsp:attribute>
    <jsp:body>

        <!-- 메디캐시 페이지 ID : sub_cash -->
        <section id="quick_order sub_cash" class="sub" style="padding-top: 140px;">
            <article class="cnt1">
                <div class="area">
                    <div class="real_area">
                        <div class="wrap clear">
                            <div class="left">
                                <h3>내 계정</h3>

                                <script type="text/javascript">
                                    $(function () {
                                        $("#myhome").on("click", function () {
                                            location.href = "/myhome/info";
                                        });
                                        $("#delivery").on("click", function () {
                                            location.href = "/order/list";
                                        });

                                        $("#addr").on("click", function () {
                                            location.href = "/member/addr/list";
                                        });

                                        $("#coupon").on("click", function () {
                                            location.href = "/coupon/list";
                                        });

                                        $("#medicash").on("click", function () {
                                            location.href = "/member/medicash/list";
                                        });

                                        $("#member").on("click", function () {
                                            location.href = "/member/mypage/check";
                                        });

                                        $("#purchase").on("click", function () {
                                            location.href = "/member/purchase/list";
                                        });

                                        $("#deferpurchase").on("click", function () {
                                            location.href = "/member/purchase/deferlist";
                                        });

                                        /* $("#banner").on("click", function () {
                                            location.href = "/member/mypage/question/write";
                                        }); */
                                    });

                                </script>
                                <ul class="left_menu">
                                    <li style="cursor: pointer" id="myhome" class="on"><button>MY 홈 (위시리스트)</button></li>
                                    <li style="cursor: pointer" id="delivery"><button>주문배송 조회</button></li>
                                    <li style="cursor: pointer" id="addr"><button>배송지 관리</button></li>
                                    <li style="cursor: pointer" id="purchase"><button>구매내역 조회</button></li>
                                    <li style="cursor: pointer" id="coupon"><button>쿠폰 / 포인트</button></li>
                                    <li style="cursor: pointer" id="member"><button>회원정보 수정</button></li>
                                    <li style="cursor: pointer" id="medicash"><button>메디캐시 충전 / 내역</button></li>
                                </ul>

                                <div id="banner" class="banner" style="cursor: pointer" onclick="onChatTalk();">
                                    <h4>주문/배송에<br>도움이 필요하신가요?</h4>
                                    <button type="button">채팅상담을 통해 문의해주세요.</button>
                                </div>
                            </div>


                            <div class="right">
                                <div class="right_tit">
                                    <div class="rt_tit clear">
                                        <h4>메디캐쉬</h4>
                                        <h4 class="tab_off">충전 / 취소 내역</h4>

                                        <!-- [외주] 메디캐시 : 툴팁 추가(신규) -->
                                        <div class="btn_tooltip">
                                            <p>메디캐시 이용안내 ⓘ</p>
                                            <div class="terms_tooltip" style="/* display: none; */">
                                                <p class="tx_info">선불충전하고, 무료 포인트와 추가 적립 받으세요!</p>
                                            </div>
                                        </div>
                                        <!-- // -->
                                    </div>
                                </div>

                                <div class="right_cont">

                                    <!-- [외주] 메디캐시 : 상단 배너 -->
                                    <div class="cash_banner">
                                        <img src="/resources/images/cash/top_banner.png" alt="" />
                                    </div>
                                    <!--// -->

                                    <!-- [외주] 메디캐시 : 결제 방식 -->
                                    <div class="cash_block pay_select">
                                        <p class="tx_tit">결제수단</p>

                                        <ul class="paylist">
                                            <li><button type="button" class="btn"><i class="ico-1"></i>신용카드</button></li>
                                            <li class="active"><button type="button" class="btn"><i class="ico-2"></i>계좌이체</button></li>
                                            <li><button type="button" class="btn"><i class="ico-3"></i>내통장결제</button></li>
                                        </ul>
                                        <p class="tx_info">※ 계좌이체를 통한 결제 후 캐시 지급까지 약 30분 이상 소요될 수 있습니다</p>
                                    </div>
                                    <!--// -->

                                    <!-- [외주] 메디캐시 : 결제 패키지 -->
                                    <div class="cash_block cash_package">
                                        <p class="tx_tit">메디캐시 패키지</p>

                                        <div class="package_table">
                                            <table>
                                                <colgroup>
                                                    <cols width="70" />
                                                    <cols width="300" />
                                                    <cols width="140" />
                                                    <cols width="100" />
                                                    <cols width="100" />
                                                    <cols width="150" />
                                                </colgroup>
                                                <thead>
                                                <tr class="thead">
                                                    <th></th>
                                                    <th class="tx_name">상품명</th>
                                                    <th class="tx_cash">지급 캐시</th>
                                                    <th class="tx_point">지급 무료포인트</th>
                                                    <th class="tx_save">적립률</th>
                                                    <th class="tx_price">금액</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="ipt_radio">
                                                        <label class="label_radio">
                                                            <input type="radio" name="radio123" value="transfer"><span></span>
                                                        </label>
                                                    </td>
                                                    <td class="tx_name"><a href="#"><strong>[첫결제]</strong> 메디캐시 50만 패키지</a></td>
                                                    <td class="tx_cash">500,000C</td>
                                                    <td class="tx_point">10,000P</td>
                                                    <td class="tx_save">1%</td>
                                                    <td class="tx_price">1,000,000원</td>
                                                </tr>
                                                <tr>
                                                    <td class="ipt_radio">
                                                        <label class="label_radio">
                                                            <input type="radio" name="radio123" value="transfer"><span></span>
                                                        </label>
                                                    </td>
                                                    <td class="tx_name"><a href="#"><strong>[첫결제]</strong> 메디캐시 50만 패키지</a></td>
                                                    <td class="tx_cash">500,000C</td>
                                                    <td class="tx_point">10,000P</td>
                                                    <td class="tx_save"><p>2% + 2%</p></td>
                                                    <td class="tx_price">1,000,000원</td>
                                                </tr>
                                                <tr>
                                                    <td class="ipt_radio">
                                                        <label class="label_radio">
                                                            <input type="radio" name="radio123" value="transfer"><span></span>
                                                        </label>
                                                    </td>
                                                    <td class="tx_name"><a href="#"><strong>[첫결제]</strong> 메디캐시 50만 패키지</a></td>
                                                    <td class="tx_cash">500,000C</td>
                                                    <td class="tx_point">10,000P</td>
                                                    <td class="tx_save">1%</td>
                                                    <td class="tx_price">1,000,000원</td>
                                                </tr>
                                                <tr>
                                                    <td class="ipt_radio">
                                                        <label class="label_radio">
                                                            <input type="radio" name="radio123" value="transfer"><span></span>
                                                        </label>
                                                    </td>
                                                    <td class="tx_name"><a href="#"><strong>[첫결제]</strong> 메디캐시 50만 패키지</a></td>
                                                    <td class="tx_cash">500,000C</td>
                                                    <td class="tx_point">10,000P</td>
                                                    <td class="tx_save">1%</td>
                                                    <td class="tx_price">1,000,000원</td>
                                                </tr>
                                                <tr>
                                                    <td class="ipt_radio">
                                                        <label class="label_radio">
                                                            <input type="radio" name="radio123" value="transfer"><span></span>
                                                        </label>
                                                    </td>
                                                    <td class="tx_name"><a href="#"><strong>[첫결제]</strong> 메디캐시 50만 패키지</a></td>
                                                    <td class="tx_cash">500,000C</td>
                                                    <td class="tx_point">10,000P</td>
                                                    <td class="tx_save">1%</td>
                                                    <td class="tx_price">1,000,000원</td>
                                                </tr>
                                                </tbody>
                                                <tfoot>
                                                <tr>
                                                    <td colspan="6">
                                                        <div class="result">
                                                            <div class="msg_box">
                                                                <p class="tx">선택한 상품</p>
                                                                <p class="tx_name"><a href="#"><strong>[추천]</strong> 메디캐시 50만 패키지</a></p>
                                                                <p class="tx_msg"><i>추가 혜택</i>충전금액의 4%를 추가 지급해드려요</p>
                                                            </div>
                                                            <div class="buying">
                                                                <table class="prices">
                                                                    <tbody>
                                                                    <tr><th>충전금</th><td>5,000,000 원</td></tr>
                                                                    <tr><th>추가 혜택</th><td>5,000,000 원</td></tr>
                                                                    <tr><th>지급 방법</th><td>5,000,000 원</td></tr>
                                                                    <tr class="tb_total"><th>지급 혜택</th><td>5,000,000 원</td></tr>
                                                                    </tbody>
                                                                </table>

                                                                <div class="arr_flow"><!--화살표 --></div>

                                                                <div class="btn-buy">
                                                                    <button type="button" class="btn" onclick="$('.cash_package_popup').addClass('on');">결제하기</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                    <!--// -->

                                    <!-- [외주] 메디캐시 : 참고 -->
                                    <div class="cash_block cash_notice">
                                        <dl class="notice">
                                            <dt>참고해주세요</dt>
                                            <dd>
                                                <ol>
                                                    <li>결제 시 부가세(10%)가 포함된 금액으로 결제됩니다.
                                                    <li>무료포인트 아래의 방법으로 사용할 수 있습니다.
                                                        <ul>
                                                            <li>-MV재료 상품 구매 시 사용(5% 제한) <a href="#">[MV재료 이용방법 확인]</a></li>
                                                            <li>-MV기공 간편수가 열람 확인 시 사용</li>
                                                        </ul>
                                                    </li>
                                                    <li class="tx_blue">무료포인트의 유효기간은 6개월(180일) 입니다.</li>
                                                    <li>결제 후 사용내역이 없을 경우 당월 중 환불이 가능합니다.</li>
                                                    <li>결제 취소는 고객센터를 통해 문의해주시기 바랍니다. <a href="#">[고객센터 문의하기]</a></li>
                                                    <li>메디캐시를 통한 상품 구매시 적립률은 2%, OK 캐시백은 1% 입니다.</li>
                                                    <li>지급 혜택은 내부 사정에 따라 변동 될 수 있습니다.<br>
                                                        <span class="tx_noti tx_red">※ 지급된 포인트를 사용하신 경우 환불이 불가할 수 있습니다.</span>
                                                    </li>
                                                </ol>
                                            </dd>
                                        </dl>
                                    </div>
                                    <!--// -->
                                </div>
                            </div>



                        </div>
                    </div>
                </div>
            </article>


            <!-- 기존 결제 팝업 코드 동일 소스 긁어붙인거라 무시하셔도 됩니다. -->
            <div class="order_pop order_payment_pop layer_pop on">
                <div class="bg_area" onclick="$(this).closest('.layer_pop').removeClass('on');"></div>
                <div class="layer_pop_inner">
                    <div class="btn_close_wrap">
                        <button type="button" class="btn_close" id="btn_order_close" onclick="$(this).closest('.layer_pop').removeClass('on');"></button>
                    </div>
                    <div class="cont">
                        <div class="head">
                            <div class="head_inner">
                                <div class="title">주문결제</div>
                            </div>
                        </div>
                        <div class="body">
                            <div class="body_inner">
                                <div class="row">
                                    <div class="order_prd_wrap">
                                        <div class="order_prd">
                                            <div class="order_box">
                                                <div class="order_head">
                                                    <div class="title" id="order_product_info_cnt">주문제품(<span>1</span>)</div>
                                                    <div class="util">
                                                        <div id="order_total_price" class="txt"></div>
                                                    </div>
                                                </div>
                                                <div class="order_body">
                                                    <div class="order_list">
                                                        <ul>
                                                            <li>
                                                                <div>
                                                                    <div class="txt">
                                                                        <div class="bd">
                                                                            <div class="sub">
                                                                                <ul id="order_product_info_list" class="g_q_o_pop_b_product"><li><div><input hidden="" name="pd_idx" value="78708"><input hidden="" name="pd_cnt" value="1"><input hidden="" name="pd_name" value="천 소독포 +"><div class="row"><div class="title">천 소독포 +</div><div class="stock">1개</div></div><div class="row"><div class="stand">45cm * 50cm</div><div class="price">2,300원</div></div><div class="row"><div class="manu">국산/1장</div></div></div></li></ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="order_info_wrap order_payment_wrap">
                                        <div class="order_info">

                                            <div class="order_box">
                                                <div class="order_head">
                                                    <div class="title">배송정보</div>
                                                </div>
                                                <div class="order_body">
                                                    <div class="order_basic g_q_o_pop_b_order">
                                                        <dl>
                                                            <dt>
                                                                <div class="text">배송지</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text">서울 영등포구 여의공원로 115 (여의도동)</div>
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">상세정보</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text">6층 메디밸류 (07241) / 테스트_붉은달바람기공소</div>
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">배송요청사항</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="row">
                                                                    <div class="comment_wrap">
                                                                        <input id="order_ship_req" type="text" class="inp_basic g_q_o_pop_b_order_req" placeholder="배송요청사항을 직접 입력합니다.">
                                                                        <div class="comment">
                                                                            <ul>
                                                                                <li>
                                                                                    <a href="javascript:;">배송 전 연락 부탁드립니다.</a>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="javascript:;">부재시 경비실에 맡겨주세요.</a>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="javascript:;">부재시 전화 주시거나 문자 남겨주세요.</a>
                                                                                </li>
                                                                                <li>
                                                                                    <a href="javascript:;">안전한 배송 부탁드립니다.</a>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="order_box">
                                                <div class="order_head">
                                                    <div class="title">쿠폰/포인트 적용</div>
                                                    <div class="util">
                                                        <div class="info">
                                                            쿠폰/포인트 사용 안내 <a href="javascript:;">?<span class="info_box">할인쿠폰과 포인트 중 하나의 혜택만 사용하실 수있습니다.</span></a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="order_body">
                                                    <div class="order_basic">
                                                        <dl>
                                                            <dt>
                                                                <div class="text">쿠폰적용</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="row">
                                                                    <select name="" class="sel_basic g_q_o_pop_b_coupon" id="order_coupon_list"><option id="" value="" selected="">사용가능한 쿠폰이 없습니다.</option></select>



                                                                </div>
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">포인트적용</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="row">
                                                                    <input type="text" class="inp_basic g_q_o_pop_b_point" id="order_point_info_input" autocomplete="off" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"><button type="button" class="btn_basic g_q_o_pop_b_point_all_btn">모두사용</button>
                                                                </div>
                                                                <div class="subdesc">
                                                                    <div class="text">현재 포인트 : <span class="color_red" id="order_point_info_text">90,000</span> 원</div>
                                                                    <ul>
                                                                        <li>
                                                                            <div>- 최대 사용 가능 포인트 : <span class="color_red" id="total_max_use_point">115</span> 원</div>
                                                                        </li>
                                                                        <li>
                                                                            <div>- 보유 포인트 1천원 이상부터 사용가능</div>
                                                                        </li>
                                                                        <li>
                                                                            <div>- 모든 제품의 총 결제 금액 5% 까지 사용가능</div>
                                                                        </li>

                                                                    </ul>
                                                                </div>
                                                            </dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="order_box">
                                                <div class="order_head">
                                                    <div class="title">포인트/캐쉬백 적립</div>
                                                    <div class="util">
                                                        <div class="info">
                                                            포인트 적립 안내 <a href="javascript:;">?<span class="info_box">OK캐쉬백 적립시 메디밸류 포인트 적립은 불가합니다.</span></a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="order_body">
                                                    <div class="order_basic order_small g_q_o_pop_b_tax">


                                                        <div class="comm_tab_wrap">
                                                            <div class="radio_wrap point_radio_wrap flex_start radio_button_wrap">
                                                                <label class="label_radio">
                                                                    <input type="radio" name="rdo_point" id="m_point" value="" checked="checked"><span>포인트 적립</span>

                                                                    <div class="tooltip">메디캐시 결제시 2% 적립</div>
                                                                </label>
                                                                <label class="label_radio">
                                                                    <input type="radio" name="rdo_point" id="ocb_point" value=""><span>OK캐쉬백 적립</span>
                                                                </label>
                                                            </div>
                                                            <dl class="save_msg">
                                                                <dt>[메디캐시로 결제 시 적립률 안내]</dt>
                                                                <dd>-포인트 적립 :  2%, OK캐쉬백 적립 : 1%</dd>
                                                            </dl>
                                                            <div class="point_detail_wrap radio_detail_wrap">
                                                                <ul>
                                                                    <li class="active"><div></div></li>
                                                                    <li class="">
                                                                        <div>
                                                                            <dl>
                                                                                <dt>
                                                                                    <div class="text">카드번호</div>
                                                                                </dt>
                                                                                <dd>
                                                                                    <input hidden="" id="current_ocb_card_info" value="">
                                                                                    <div class="row" id="ocb_card_info">
                                                                                        <input type="text" class="inp_basic div_4 ocb_card_number">
                                                                                        <input type="password" class="inp_basic div_4 ocb_card_number">
                                                                                        <input type="password" class="inp_basic div_4 ocb_card_number">
                                                                                        <input type="text" class="inp_basic div_4 ocb_card_number">

                                                                                        <button type="button" id="ocb_info_save" class="btn_basic btn_tooltip ocb_info_save">번호저장</button>
                                                                                    </div>
                                                                                </dd>
                                                                            </dl>
                                                                            <div class="check_2_wrap">
                                                                                <label class="label_check_2">
                                                                                    <input type="checkbox" id="ocb_agreement"><span>적립 진행 필수 동의 / 개인정보 수집 및 이용동의 외 (필수)</span>
                                                                                </label>
                                                                                <a href="javascript:;" class="btn_terms" onclick="openLayerPop('point_terms');">상세보기</a>
                                                                            </div>
                                                                            <div class="subdesc">
                                                                                <ul>
                                                                                    <li>
                                                                                        <div>- 카드번호가 잘못 입력되거나 유효하지 않은 경우 OK캐쉬백 적립이 되지 않습니다.</div>
                                                                                    </li>
                                                                                    <li>
                                                                                        <div>- 배송완료 7일 이후 OK캐쉬백에 적립예정포인트로 적립되며, 최종 적립 시점은 OK캐쉬백 정책에 따릅니다. (<a href="https://www.medivalue.co.kr/ocb/point/list" target="_blank">https://www.medivalue.co.kr/ocb/point/list</a>)</div>
                                                                                    </li>
                                                                                    <li>
                                                                                        <div>- 쿠폰, 포인트 등 각종 할인금액 및 배송비를 제외한 실제 결제금액의 1%(고객 수수료 제외)가 적립됩니다.</div>
                                                                                    </li>
                                                                                    <li>
                                                                                        <div>- 주문취소, 반품 등으로 실결제금액이 변경 됨에 따라 적립금액이 변동 될 수 있습니다.</div>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>



                                                    </div>
                                                </div>
                                            </div>
                                            <div class="order_box">
                                                <div class="order_head">
                                                    <div class="title">세금계산서 정보</div>
                                                    <div class="util">
                                                        <div class="button">
                                                            <button type="button" class="btn_modify g_q_o_pop_b_tax_modify" id="btn_modify_tax_info">수정하기</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="order_body">
                                                    <div class="order_basic order_small g_q_o_pop_b_tax">
                                                        <div class="radio_wrap flex_start" id="order_invoice">
                                                            <label class="label_radio g_q_o_pop_b_tax_apply_y">
                                                                <input type="radio" name="rdo_invoice" id="rdo_invoice_Y" value="Y" checked="checked"><span>신청</span>
                                                            </label>
                                                            <label class="label_radio g_q_o_pop_b_tax_apply_n">
                                                                <input type="radio" name="rdo_invoice" id="rdo_invoice_N" value="N"><span>미신청</span>
                                                            </label>
                                                        </div>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">사업자번호</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="corporate_registration_number_order_info_text">1234567890</div>
                                                                <input class="inp_basic" name="fd_corporate_registration_number" type="text" hidden="" id="corporate_registration_number_order_info_input">
                                                            </dd>
                                                            <dt>
                                                                <div class="text">대표자명</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="corporate_representative_name_info_text">현도익</div>
                                                                <input class="inp_basic" name="fd_corporate_representative_name" type="text" hidden="" id="corporate_representative_name_info_input">
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">회사명</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="corporate_registration_name_info_text">테스트_붉은달바람기공소</div>
                                                                <input class="inp_basic" name="fd_corporate_registration_name" type="text" hidden="" id="corporate_registration_name_info_input">
                                                            </dd>
                                                        </dl>

                                                        <dl>
                                                            <dt>
                                                                <div class="text">이메일</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="fd_email_info_text">hdi233468@naver.com</div>
                                                                <input class="inp_basic" name="fd_email_info" type="text" hidden="" id="fd_email_info_input">
                                                            </dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_info">
                                            <div class="order_box">
                                                <div class="order_head">
                                                    <div class="title">결제금액</div>
                                                </div>
                                                <div class="order_body">
                                                    <div class="order_basic order_bg_box g_q_o_pop_b_payment_area" id="order_payment_info">
                                                        <dl>
                                                            <dt>
                                                                <div class="text">제품금액</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_total_product_price">2,300원</div>
                                                            </dd>
                                                        </dl>
















                                                        <dl>
                                                            <dt>
                                                                <div class="text">배송비</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_delivery_fee">0원</div>
                                                            </dd>
                                                        </dl>


                                                        <dl>
                                                            <dt>
                                                                <div class="text">추가할인금액</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text color_red" id="order_add_discount_amount">0원</div>
                                                            </dd>
                                                        </dl>

                                                        <dl>
                                                            <dt>
                                                                <div class="text">쿠폰할인금액</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text color_red" id="order_coupon_info">0원</div>
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">포인트사용</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text color_red" id="order_point_info">0원</div>
                                                            </dd>
                                                        </dl>
                                                        <dl class="total">
                                                            <dt>
                                                                <div class="text">최종결제금액</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_final_total_product_payment">2,300원</div>
                                                            </dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="order_box">
                                                <div class="paymentMethodDiv" style="display: none;">
                                                    <div class="order_head">
                                                        <div class="title">결제방식</div>
                                                    </div>
                                                    <div class="order_body">
                                                        <div class="order_basic">
                                                            <div class="radio_wrap payment_radio_wrap flex_start">
                                                                <label class="label_radio">
                                                                    <input type="radio" name="payment_method" id="deferred_pay" value="deferred_pay"><span>후불</span>
                                                                </label>
                                                                <label class="label_radio">
                                                                    <input type="radio" name="payment_method" id="advance_pay" value="advance_pay"><span>선불</span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="paymentTypeDiv">
                                                    <div class="order_head">
                                                        <div class="title">결제수단</div>

                                                        <p class="util">메디캐시 : <strong>2,000,000원</strong></p>
                                                    </div>
                                                    <div class="order_body">
                                                        <div class="order_basic">
                                                            <div class="radio_wrap payment_radio_wrap flex_start">
                                                                <label class="label_radio g_q_o_pop_b_payment_bank">
                                                                    <input type="radio" name="rdo_payment" value="transfer"><span>계좌이체</span>
                                                                </label>
                                                                <label class="label_radio g_q_o_pop_b_payment_card">
                                                                    <input type="radio" name="rdo_payment" value="toss_payments"><span>신용카드</span>
                                                                </label>
                                                                <label class="label_radio g_q_o_pop_b_payment_mybnak">
                                                                    <input type="radio" name="rdo_payment" value="settle_bank_mytongjang"><span>내통장결제</span>
                                                                </label>



                                                            </div>

                                                            <div class="payment_detail_wrap g_q_o_pop_b_payment_info">
                                                                <ul>
                                                                    <li class="payment_detail_transfer">
                                                                        <div>
                                                                            <dl>
                                                                                <dt><div class="text">예금주</div></dt>
                                                                                <dd><div class="text">메디밸류</div></dd>
                                                                            </dl>
                                                                            <dl>
                                                                                <dt><div class="text">입금계좌</div></dt>
                                                                                <dd>
                                                                                    <div class="clipboard_wrap">
                                                                                        <div class="txt_clip">하나은행</div>
                                                                                        <input type="text" class="inp_basic inp_clip" value="547-910035-44104" readonly="">
                                                                                    </div>
                                                                                    <button type="button" class="btn_basic btn_clip g_q_o_pop_b_payment_copy" onclick="copyClipBoard(this);">복사하기</button>
                                                                                </dd>
                                                                            </dl>
                                                                        </div>
                                                                    </li>
                                                                    <li class="payment_detail_medicash">
                                                                        <div>
                                                                            <dl>
                                                                                <dt>
                                                                                    <div class="text">보유메디캐쉬</div>
                                                                                </dt>
                                                                                <dd>
                                                                                    <div class="row flex_end">
                                                                                        <div class="text word_keep"><span class="color_orange">10,000,000,000</span>원</div>
                                                                                        <button type="button" class="btn_basic">충전하기</button>
                                                                                        <button type="button" class="btn_basic">새로고침</button>
                                                                                    </div>
                                                                                </dd>
                                                                            </dl>
                                                                            <dl>
                                                                                <dt>
                                                                                    <div class="text">메디캐쉬사용</div>
                                                                                </dt>
                                                                                <dd>
                                                                                    <div class="row">
                                                                                        <input type="text" class="inp_basic"><button type="button" class="btn_basic">모두사용</button>
                                                                                    </div>
                                                                                </dd>
                                                                            </dl>
                                                                        </div>
                                                                    </li>

                                                                </ul>
                                                            </div>


                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="order_box">
                                                <div class="paymentTypeDiv">
                                                    <div class="order_head">
                                                        <div class="title">개인정보 수집/제공</div>
                                                    </div>
                                                    <div class="order_body">
                                                        <div class="order_basic">
                                                            <div class="check_2_wrap">
                                                                <label class="label_check_2 g_q_o_pop_b_user_agree_check">
                                                                    <input type="checkbox" id="order_payment"><span>결제 진행 필수 동의</span>
                                                                </label>
                                                            </div>
                                                            <div class="terms_wrap">
                                                                <ul>
                                                                    <li>
                                                                        <div>
                                                                            <div class="txt">개인정보 수집 이용 및 위탁 동의 (필수)</div>
                                                                            <a href="javascript:;" class="btn_terms g_q_o_pop_b_user_agree_view_1" onclick="openLayerPop('personal_terms');">약관보기</a>
                                                                        </div>
                                                                    </li>
                                                                    <li>
                                                                        <div>
                                                                            <div class="txt">결제대행 서비스 약관 동의 (필수)</div>
                                                                            <a href="javascript:;" class="btn_terms g_q_o_pop_b_user_agree_view_2" onclick="openLayerPop('service_terms');">약관보기</a>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div class="agree_desc">
                                                                위 주문 내용을 확인 하였으며, 회원 본인은 결제에 동의합니다.
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="order_info_wrap order_complete_wrap">
                                        <div class="order_info">
                                            <div class="order_box" id="order_result_delivery_info">
                                                <div class="order_head">
                                                    <div class="title">배송정보</div>
                                                </div>
                                                <div class="order_body">
                                                    <div class="order_basic g_q_o_pop_a_delivery">
                                                        <dl>
                                                            <dt>
                                                                <div class="text">주문번호</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_result_delivery_info_order_id"></div>
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">도착예정일</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="estimate_delivery_day"></div>
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">판매업체</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text">메디밸류</div>
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">배송정보</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text">자체배송</div>
                                                            </dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="order_box" id="order_result_addr_info">
                                                <div class="order_head">
                                                    <div class="title">받는사람 정보</div>
                                                </div>
                                                <div class="order_body">
                                                    <div class="order_basic g_q_o_pop_a_receive">
                                                        <dl>
                                                            <dt>
                                                                <div class="text">받는사람</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_result_addr_info_name"></div>
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">받는주소</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text ellipsis_off" id="order_result_addr_info_detail"></div>
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">연락처</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_result_addr_info_tel_info"></div>
                                                            </dd>
                                                        </dl>








                                                    </div>
                                                </div>
                                            </div>
                                            <div class="order_box">
                                                <div class="order_head">
                                                    <div class="title">세금계산서 정보</div>
                                                </div>
                                                <div class="order_body">
                                                    <div class="order_basic order_small g_q_o_pop_a_tax">
                                                        <div class="radio_wrap flex_start" id="order_result_invoice">
                                                            <label class="label_radio">
                                                                <input checked="checked" type="radio" name="rdo_invoice_result" id="rdo_result_invoice_Y" onclick="return false;"><span>신청</span>
                                                            </label>
                                                            <label class="label_radio">
                                                                <input type="radio" name="rdo_invoice_result" id="rdo_result_invoice_N" onclick="return false;"><span>미신청</span>
                                                            </label>
                                                        </div>
                                                        <dl id="order_result_invoice_1">
                                                            <dt>
                                                                <div class="text">사업자번호</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_result_corporate_registration_number"></div>
                                                            </dd>
                                                            <dt>
                                                                <div class="text">대표자명</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_result_corporate_representative_name"></div>
                                                            </dd>
                                                        </dl>
                                                        <dl id="order_result_invoice_2">
                                                            <dt>
                                                                <div class="text">회사명</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_result_corporate_registration_name"></div>
                                                            </dd>
                                                        </dl>
                                                        <dl id="order_result_invoice_3">
                                                            <dt>
                                                                <div class="text">업태</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_result_corporate_business_conditions"></div>
                                                            </dd>
                                                            <dt>
                                                                <div class="text">종목</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_result_corporate_industry_type"></div>
                                                            </dd>
                                                        </dl>
                                                        <dl id="order_result_invoice_4">
                                                            <dt>
                                                                <div class="text">이메일</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_result_email_info"></div>
                                                            </dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="order_info" id="order_result_payment_info">
                                            <div class="order_box" id="order_result_payment_transfer_info">
                                                <div class="order_head">
                                                    <div class="title">결제정보</div>
                                                    <div class="util">
                                                        <div class="info">입금일은 주문일로 부터 3일</div>
                                                    </div>
                                                </div>
                                                <div class="order_body">
                                                    <div class="order_basic g_q_o_pop_a_payment_info_area">
                                                        <dl>
                                                            <dt>
                                                                <div class="text">입금기한</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="deposit_limit_date"></div>
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">입금금액</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_result_payment_info_amount"></div>
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">입금계좌</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="clipboard_wrap">
                                                                    <div class="txt_clip">하나은행</div>
                                                                    <input type="text" class="inp_basic inp_clip" value="547-910035-44104" readonly="">
                                                                </div>
                                                                <button type="button" class="btn_basic btn_clip g_q_o_pop_a_payment_info_copy" onclick="copyClipBoard(this);">복사하기</button>
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">예금주</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text">메디밸류</div>
                                                            </dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="order_box">
                                                <div class="order_head">
                                                    <div class="title">결제금액</div>
                                                </div>
                                                <div class="order_body">
                                                    <div class="order_basic order_bg_box g_q_o_pop_a_payment_area">

                                                        <div id="order_result_info_text" class="info_wrap">
                                                            <div class="info saving">
                                                                <div class="title">빠른주문하기를 통해<br><span id="order_result_info_saving" class="color_orange">19,000원</span>을 절약했어요.</div>
                                                                <!-- <div class="calc">
                                                                    <dl>
                                                                        <dt><div class="text">└ 최고 금액 대비</div></dt>
                                                                        <dd><div class="text color_orange">- <span class="num">19,000</span>원</div></dd>
                                                                    </dl>
                                                                    <dl>
                                                                        <dt><div class="text">└ 제품 할인 금액</div></dt>
                                                                        <dd><div class="text"><span class="num">0</span>원</div></dd>
                                                                    </dl>
                                                                </div> -->
                                                            </div>
                                                            <div class="info">
                                                                <div class="title">메디밸류를<br>이용해주셔서 감사합니다 :)</div>
                                                            </div>
                                                        </div>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">결제수단</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_result_payment_info_payment_name"></div>
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">제품금액</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_result_payment_info_product"></div>
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">배송비</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text" id="order_result_payment_info_delivery_fee"></div>
                                                            </dd>
                                                        </dl>


                                                        <dl>
                                                            <dt>
                                                                <div class="text">추가할인금액</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text color_orange" id="order_result_payment_info_discount_amount">0원</div>
                                                            </dd>
                                                        </dl>

                                                        <dl>
                                                            <dt>
                                                                <div class="text">쿠폰할인금액</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text color_orange" id="order_result_coupon_info">0원</div>
                                                            </dd>
                                                        </dl>
                                                        <dl>
                                                            <dt>
                                                                <div class="text">적립금사용</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text color_orange" id="order_result_point_info">0원</div>
                                                            </dd>
                                                        </dl>
                                                        <dl class="total">
                                                            <dt>
                                                                <div class="text">총금액</div>
                                                            </dt>
                                                            <dd>
                                                                <div class="text color_blue" id="order_result_payment_info_total"></div>
                                                            </dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn_wrap btn_payment_wrap">
                        <button type="button" class="btn_disable g_q_o_pop_b_close" onclick="closeLayerPop(this);">닫기</button>
                        <button type="button" class="btn_blue btn_payment g_q_o_pop_b_payment_req" onclick="payForIt(this);">결제하기</button>
                    </div>
                    <div class="btn_wrap btn_complete_wrap">
                        <button type="button" class="btn_disable g_q_o_pop_a_deatil" id="btn_order_detail" onclick="">주문상세보기</button>
                        <button type="button" class="btn_blue g_q_o_pop_a_continue" id="btn_order_continue" onclick="closeLayerPop(this);">주문계속하기</button>
                    </div>
                </div>
            </div>

            <!-- [외주] 메디캐시 : 선택시 결제창 -->
            <!-- 기존 팝업 사용, 클래스 추가(신규) .cash_package_popup, @medicash.css -->
            <div class="layer_pop cash_package_popup">
                <div class="bg_area" onclick="$(this).closest('.layer_pop').removeClass('on');"></div>
                <div class="layer_pop_inner">
                    <div class="btn_close_wrap">
                        <button type="button" class="btn_close" onclick="$(this).closest('.layer_pop').removeClass('on');"></button>
                    </div>
                    <div class="cont">
                        <div class="head">
                            <div class="head_inner">
                                <p class="tx_tit"><strong>[BEST]</strong> 메디캐시 3,000만 패키지</p>
                            </div>
                        </div>
                        <div class="body">
                            <div class="body_inner">

                                <div class="package_name">
                                    <p class="tx_name">[BEST] 메디캐시 3,000만 패키지</p>
                                </div>

                                <div class="package_cont">
                                    <p class="txt1">충전 캐시: <span class="tx_cash">30,000,000C</span> + 추가혜택: <span class="tx_point">1,500,000P</span></p>
                                    <p class="txt2">결제 <span>30,000,000</span>원</p>
                                </div>

                                <div class="privacy_chk">
                                    <p class="tx_tit">개인정보 수집/제공</p>
                                    <label class="label_chk">
                                        <input type="checkbox"><span>결제 진행 필수 동의</span>
                                    </label>
                                    <div class="terms_wrap">
                                        <ul>
                                            <li>
                                                <div>
                                                    <div class="txt">개인정보 수집 이용 및 위탁 동의 (필수)</div>
                                                    <a href="javascript:;" class="btn_terms g_q_o_pop_b_user_agree_view_1" onclick="openLayerPop('personal_terms');">약관보기</a>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="agree_desc">
                                        위 주문 내용을 확인 하였으며, 회원 본인은 결제에 동의합니다.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="btn_wrap">
                        <button type="button" class="btn_blue">결제하기</button>
                    </div>
                </div>
            </div>
        </section>
    </jsp:body>
</layout:basicFrame>
