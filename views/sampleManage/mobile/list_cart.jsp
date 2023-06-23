<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:MobileStoreFrame>
    <jsp:attribute name="stylesheet">
	    <link href="/resources/css/mobile/list.css" rel="stylesheet" >
	</jsp:attribute>
    <jsp:body>
        <div class="m_contents">
            <section class="area_top_banner cart_banenr">
                <div class="container container_full">
                    <div class="inner_wrap">
                        <div class="tx_tit">나의 장바구니</div>
                        <div class="tx_desc">모바일에서 편리하게 구매해요</div>
                    </div>
                    <img src="/resources/images/mobile/img_cart.png" alt="" class="img_obj" />
                </div>
            </section>
            <section class="area_controller">
                <div class="container">
                    <div class="row row_between">
                        <div class="col col_checkbox">
                            <label class="checkbox">
                                <input type="checkbox" class="input_checkbox" name="input_check_all" />
                                <span class="input_shape"></span>
                                <span class="input_checkbox_name">전체선택</span>
                            </label>
                        </div>
                        <div class="col col_name_btnlist">
                            <ul>
                                <li><button type="button" class="btn_checked_delete">선택삭제</button></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <section class="area_goods_list">
                <div class="container">
                    <ul>
                        <li class="nolist">
                            <div class="tx_nolist">
                                장바구니가 비어있어요<br />
                                원하시는 상품을<br />
                                장바구니에 담아보세요
                            </div>
                            <a href="/sample/list_ai">AI 위시리스트 이동</a>
                        </li>
                        <!-- ::full case::AI_list -->
                        <li class="goods_card">
                            <!-- 라벨없을때 <div class="cd_head nolabels"> nolabels 추가  -->
                            <div class="cd_head nolabels">
                                <!--
                                <div class="labels">
                                    <div class="cd_label label_recom">추천상품</div>
                                    <div class="cd_label label_discount">최대 20% 할인</div>
                                    <div class="cd_label label_added">담은상품</div>
                                    <div class="cd_label label_purchased">구매상품</div>
                                </div>
                                -->
                                <label class="checkbox">
                                    <input type="checkbox" class="input_checkbox" />
                                    <span class="input_shape"></span>
                                </label>
                            </div>
                            <a href="#해당상품상세페이지로" class="cd_info">
                                <div class="info_img"><div class="img_wrap"><img src="/resources/images/mobile/sample_goods_img.jpg" alt="" /></div></div>
                                <div class="info_text">
                                    <div class="tx_cate tx_shortening_2">[마스크/글러브/석션 > 석션재료(팁,홀더,관련부품)] </div>
                                    <div class="tx_tit tx_shortening_2">Aluminium Suction Holder Suction Holder</div>
                                    <div class="tx_subinfo tx_shortening_2">FujiCEM 2RMGI l GC/일본 l 13.3g x 2paste</div>
                                    <div class="tx_options">
                                        <div>컬러옵션: 287dfc</div>
                                        <div>컬러옵션: 287dfc</div>
                                        <div>컬러옵션: 287dfc</div>
                                    </div>
                                    <div class="tx_price">
                                        <span class="tx_p_discount_per"><em>99</em>%</span>
                                        <span class="tx_p_origin_price"><em>9,999,999</em>원</span>
                                        <span class="tx_p_discount_price"><em>3,000</em>원</span>
                                    </div>
                                </div>
                            </a>
                            <div class="cd_foot">
                                <button type="button" class="btn_set btn_set_cnt"><div class="op_val">3</div><i class="op_arrow"></i></button>
                                <a href="" class="btn_set btn_single_buy">주문하기</a>
                            </div>
                        </li>
                        <li class="goods_card">
                            <div class="cd_head nolabels">
                                <label class="checkbox">
                                    <input type="checkbox" class="input_checkbox" />
                                    <span class="input_shape"></span>
                                </label>
                            </div>
                            <a href="#해당상품상세페이지로" class="cd_info">
                                <div class="info_img"><div class="img_wrap"><img src="/resources/images/mobile/sample_goods_img.jpg" alt="" /></div></div>
                                <div class="info_text">
                                    <div class="tx_cate tx_shortening_2">[마스크/글러브/석션 > 석션재료(팁,홀더,관련부품)] </div>
                                    <div class="tx_tit tx_shortening_2">Aluminium Suction Holder Suction Holder</div>
                                    <div class="tx_subinfo tx_shortening_2">FujiCEM 2RMGI l GC/일본 l 13.3g x 2paste</div>
                                    <div class="tx_options">
                                        <div>FujiCEM 2RMGI l GC/일본 l 13.3g</div>
                                        <div>FujiCEM 2RMGI l GC/일본 l 13.3g</div>
                                    </div>
                                    <div class="tx_price">
                                        <span class="tx_p_discount_per"><em>99</em>%</span>
                                        <span class="tx_p_origin_price"><em>9,999,999</em>원</span>
                                        <span class="tx_p_discount_price"><em>1,000</em>원</span>
                                    </div>
                                </div>
                            </a>
                            <div class="cd_foot">
                                <button type="button" class="btn_set btn_set_cnt"><div class="op_val">1</div><i class="op_arrow"></i></button>
                                <a href="" class="btn_set btn_single_buy">주문하기</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </section>
            <section class="area_totalPrice">
                <div class="row row_between">
                    <div class="col col_4 col_left">
                        <div class="tx_tit">총 주문 금액</div>
                        <div class="tx_price"><em>124,342,344</em>원</div>
                    </div>
                    <div class="col col_8 col_right">
                        <a href="#체크상품주문하기" class="btn_order"><em>n</em>개 상품 주문하기</a>
                    </div>
                </div>
            </section>
        </div>
        <layout:MobileStoreFooterFrame />

        <div class="sheetLayer sheetLayer_bottom sheetLayer_autoheight sheetLayer_select_option">
            <button class="btn_closeSheet"><div class="bar"></div></button>
            <div class="sheet_content">
                <div class="sheet_inner">
                    <div class="sheet_inner_title">수량 선택</div>
                    <div class="set_amount">
                        <button type="button" class="amount_down"><img src="/resources/images/mobile/icon_minus.svg" alt="" /></button>
                        <input type="number" class="input_number" name="amount" value="0" />
                        <button type="button" class="amount_up"><img src="/resources/images/mobile/icon_plus.svg" alt="" /></button>
                    </div>
                </div>
            </div>
            <div class="sheet_bottom">
                <div class="s_b_top">
                    <div class="tx_tit">상품금액</div>
                    <div class="tx_total_price"><em>999,999,999</em>원</div>
                </div>
                <div class="s_b_btn_wrap">
                    <button type="button" class="btn_modify_info">수정하기</button>
                </div>
            </div>
            <button class="btn_closeSheet"><img src="/resources/images/intro/icon_close.png" alt="" /></button>
        </div>
        <script>
            let controller = $(".area_controller");
            let goodslist = $(".area_goods_list");
            function fixedController() {
                let current_scroll_value = $(window).scrollTop();
                if (current_scroll_value > goodslist.offset().top) {
                    controller.addClass("fixed_top").css('top', $('header').outerHeight());
                    controller.next().css("margin-top", controller.outerHeight());
                } else {
                    controller.removeClass("fixed_top").attr("style", "");
                    controller.next().attr("style", "");
                }
            }
            $(window).on("load scroll", function () {
                fixedController();
            });

            function checkedEvent() {
                let checked =  $('.area_goods_list input[type=checkbox]:checked');
                let checked_cnt = checked.length;
                if( checked_cnt > 0) {
                    $('.area_totalPrice').addClass('active');
                } else {
                    $('.area_totalPrice').removeClass('active');
                }
                // 상품총금액
                // let totalPrice = 0;
                // $.each(checked, function(index, item){
                //     let _this_goods = $(item).parents('.goods_card');
                //     let _this_goods_price = removeCommas(_this_goods.find('.tx_p_discount_price em').text());
                //     let _this_goods_cnt = _this_goods.find('.btn_set_cnt .op_val').text();
                //     let _this_goods_total_price = _this_goods_price * _this_goods_cnt;
                //     totalPrice = totalPrice + _this_goods_total_price;
                // })
                //
                // $('.area_totalPrice .tx_price em').text(addComma(totalPrice));
                // // 상품총갯수
                $('.area_totalPrice .btn_order em').text(checked_cnt);
            }

            // 리스트상단 전체선택, 선택삭제, 장바구니담기
            $('.area_controller').on('click','input[name=input_check_all]', function(){
                if($(this).prop('checked')) {
                    $('.area_goods_list input[type=checkbox]').prop('checked', true);
                } else {
                    $('.area_goods_list input[type=checkbox]').prop('checked', false);
                }
                checkedEvent();
            }).on('click', '.btn_checked_delete', function(){
                let checked_cnt = $('.area_goods_list input[type=checkbox]:checked').length;
                if( checked_cnt > 0) {
                    mvLayer.confirm('선택한 상품을 삭제합니다.', function(res){
                        console.log(res);
                    });
                } else {
                    mvLayer.alert('선택한 상품이 없습니다.')
                }
            });

            // 상품개별_체크박스
            $('.goods_card input[type=checkbox]').on('click', function(){
                let check_cnt = $('.area_goods_list input[type=checkbox]').length;
                let checked_cnt = $('.area_goods_list input[type=checkbox]:checked').length;
                if( check_cnt === checked_cnt ) {
                    $('input[name=input_check_all]').prop('checked', true);
                } else {
                    $('input[name=input_check_all]').prop('checked', false);
                }
                checkedEvent();
            });

            // 시트_열기
            $('.btn_set_cnt').on('click', function(){
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
