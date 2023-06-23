<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:MobileStoreFrame>
    <jsp:attribute name="stylesheet">
	    <link href="/resources/css/mobile/evt.css" rel="stylesheet" >
	</jsp:attribute>
    <jsp:body>
        <!-- 관리자에서 이미지등록시 이미지내용도 입력할수있게... -->
        <div class="m_contents">
            <section class="section sec_top_banner">
                <div class="container container_full">
                    <img src="http://via.placeholder.com/720x180" alt="이미지제목"/>
                </div>
            </section>
            <section class="section sec_top_banner2">
                <div class="container container_full">
                    <img src="http://via.placeholder.com/720x180/5d9cf9/ffffff" alt="이미지제목"/>
                </div>
            </section>
            <section class="section sec_tab_menu">
                <div class="container container_full">
                    <div class="scroller">
                        <ul>
                            <li><button type="button" class="btn_tab active">전체</button></li>
                            <li><button type="button" class="btn_tab">카테고리1</button></li>
                            <li><button type="button" class="btn_tab">카테고리2</button></li>
                            <li><button type="button" class="btn_tab">카테고리3</button></li>
                            <li><button type="button" class="btn_tab">카테고리4</button></li>
                            <li><button type="button" class="btn_tab">카테고리5</button></li>
                            <li><button type="button" class="btn_tab">카테고리6</button></li>
                        </ul>
                    </div>
                </div>
            </section>
            <section class="section sec_goods_list">
                <div class="container container_full">
                    <ul class="row row_gap_4 row_align_stretch">
                        <li class="col col_xs_6 col_sm_4 col_lg_3 col_item">
                            <div class="item_wrap">
                                <a href="">
                                    <div class="item_img g_e_b1_p_img_">
                                        <img src="/resources/images/sample/sample_img.png" alt="">
                                    </div>
                                    <div class="item_info g_e_b1_p_info_">
                                        <div class="tx_goodsName tx_shortening_2" id="tit_${item.pk_idx}">상품명 상품명 상품명 상품명 상품명 상품명 상품명 상품명 상품명 상품명 상품명 </div>
                                        <div class="tx_subinfo">
                                            <span>포장단위</span>
                                            <span>제조사</span>
                                        </div>
                                        <div class="tx_price">
                                            <div class="tx_price_discountPer"><em>40</em>%</div>
                                            <div class="tx_price_origin"><em>999,999,999</em>원</div>
                                            <div class="tx_price_discount"><em>999,999,999</em>원</div>
                                        </div>
                                        <div class="tx_hashtag">
                                            <span>#태그영역</span>
                                            <span>#태그영역</span>
                                        </div>
                                    </div>
                                </a>
                                <div class="item_btnCart g_e_b1_p_cart">
                                    <button type="button" class="btn_cart" >장바구니 담기</button>
                                </div>
                            </div>
                        </li>
                        <li class="col col_xs_6 col_sm_4 col_lg_3 col_empty">
                            <div class="item_wrap item_wrap_empty">
                                <img src="/resources/images/mobile/m_f_logo.svg" alt="" />
                            </div>
                        </li>
                    </ul>
                    <button type="button" class="btn_more_ist">더보기(20)<i class="ic_svg icon_arrow"></i></button>
                </div>
            </section>
            <section class="section sec_caution">
                <div class="container">
                    <div class="tx_tit">꼭 읽어주세요!</div>
                    <div class="tx_conts">
                        본 패키지 상품 구성 0.25g만 해당됩니다.<br />
                        본 패키지 상품 구매시 0.25g 10개와 핸드피스 1개가 배송됩니다.<br />
                        본 패키지 상품의 구매 수량은 1개만 구매 가능합니다.
                    </div>
                </div>
            </section>
        </div>
        <div class="sheetLayer sheetLayer_bottom sheetLayer_select_option">
            <button class="btn_closeSheet"><div class="bar"></div></button>
            <div class="sheet_content">
                <div class="sheet_inner">
                    <div class="sheet_inner_title">규격선택</div>
                    <div class="select_box">
                        <div class="selected">옵션입리다~1</div>
                        <ul>
                            <li><button type="button" value="옵션입리다~1">옵션입리다~1</button></li>
                            <li><button type="button" value="옵션입리다~2">옵션입리다~2</button></li>
                            <li><button type="button" value="옵션입리다~3">옵션입리다~3</button></li>
                            <li><button type="button" value="옵션입리다~4">옵션입리다~4</button></li>
                        </ul>
                    </div>
                    <div class="select_box">
                        <div class="selected">옵션입리다~1</div>
                        <ul>
                            <li><button type="button" value="옵션입리다~1">옵션입리다~1</button></li>
                            <li><button type="button" value="옵션입리다~2">옵션입리다~2</button></li>
                            <li><button type="button" value="옵션입리다~3">옵션입리다~3</button></li>
                            <li><button type="button" value="옵션입리다~4">옵션입리다~4</button></li>
                            <li><button type="button" value="옵션입리다~5">옵션입리다~5</button></li>
                            <li><button type="button" value="옵션입리다~6">옵션입리다~6</button></li>
                        </ul>
                    </div>
                </div>
                <div class="sheet_inner selected_list">
                    <ul>
                        <li>
                            <button type="button" class="btn_del_list"><i class="ic_svg icon_close"></i></button>
                            <div class="tx_selected_option tx_shortening_1">
                                <span>옵션명 1</span><span>옵션명 2</span><span>옵션명 3</span>
                            </div>
                            <div class="li_bot">
                                <div class="tx_adj_option_price"><em>999,999,999</em>원</div>
                                <div class="set_amount">
                                    <button type="button" class="amount_down"><i class="ic_svg icon_minus"></i></button>
                                    <input type="number" class="input_number" name="amount" value="0" min="1" max="999" />
                                    <button type="button" class="amount_up"><i class="ic_svg icon_plus"></i></button>
                                </div>
                            </div>
                        </li>
                        <li>
                            <button type="button" class="btn_del_list"><i class="ic_svg icon_close"></i></button>
                            <div class="tx_selected_option tx_shortening_1">
                                <span>옵션명 1</span><span>옵션명 2</span><span>옵션명 3</span>
                            </div>
                            <div class="li_bot">
                                <div class="tx_adj_option_price"><em>999,999,999</em>원</div>
                                <div class="set_amount">
                                    <button type="button" class="amount_down"><i class="ic_svg icon_minus"></i></button>
                                    <input type="number" class="input_number" name="amount" value="0" min="1" max="999" />
                                    <button type="button" class="amount_up"><i class="ic_svg icon_plus"></i></button>
                                </div>
                            </div>
                        </li>
                        <li>
                            <button type="button" class="btn_del_list"><i class="ic_svg icon_close"></i></button>
                            <div class="tx_selected_option tx_shortening_1">
                                <span>옵션명 1</span><span>옵션명 2</span><span>옵션명 3</span>
                            </div>
                            <div class="li_bot">
                                <div class="tx_adj_option_price"><em>999,999,999</em>원</div>
                                <div class="set_amount">
                                    <button type="button" class="amount_down"><i class="ic_svg icon_minus"></i></button>
                                    <input type="number" class="input_number" name="amount" value="0" min="1" max="999" />
                                    <button type="button" class="amount_up"><i class="ic_svg icon_plus"></i></button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="sheet_bottom">
                <div class="s_b_btn_wrap">
                    <button type="button" class="btn_add_cart"><i class="ic_svg icon_cart"></i></button>
                    <button type="button" class="btn_buy_list"><em>999,999,000</em>원 구매하기</button>
                </div>
            </div>
        </div>
        <script>
            const tab_menu = new Swiper(".area_tab_menu .swiper", {
                loop: true,
                slidesPerView: '4.3',
                centeredSlides: false,
                spaceBetween: 0,
                speed: 400,
                slideToClickedSlide: true,
                // autoplay: {
                // 	delay: 3000,
                // },
                navigation: {
                    prevEl: ".area_tab_menu .tab_menu_prev",
                    nextEl : ".area_tab_menu .tab_menu_next",
                },
            });
            // 시트_열기
            $('.btn_cart').on('click', function(){
                openSheet('.sheetLayer_select_option');
            });
            // 시트_내부작동_갯수
            $('.amount_down').on('click', function(){
                let _input_amount = $(this).parents('.set_amount').find('input[name=amount]');
                let amount = _input_amount.val();
                if( amount > 0 ) {
                    _input_amount.val(amount - 1)
                };
            })
            $('.amount_up').on('click', function(){
                let _input_amount = $(this).parents('.set_amount').find('input[name=amount]');
                let amount = _input_amount.val();
                if( amount < 999 ) {
                    _input_amount.val(+amount + 1)
                };
            });
            $('input[name=amount]').on('input', function(){
                let amount = $(this).val()
                if( amount < 0 ) {
                    $(this).val(0)
                }
                if( amount > 999 ) {
                    $(this).val(999)
                }
            });
        </script>
    </jsp:body>
</layout:MobileStoreFrame>
