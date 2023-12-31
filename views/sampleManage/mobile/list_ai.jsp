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
            <section class="area_top_banner ai_banner">
                <div class="container container_full">
                    <div class="inner_wrap">
                        <div class="tx_tit">AI 위시리스트위시리스트</div>
                        <div class="tx_desc">회원님께 꼭 맞는 상품을 추천해요</div>
                    </div>
                    <img src="/resources/images/mobile/img_thumb.png" alt="" class="img_obj" />
                </div>
            </section>
            <section class="area_category_info">
                <div class="container">
                    <div class="row row_gap_32 row_between">
                        <div class="col col_catelist">
                            <button type="button" class="btn_catelist">카테고리<i class="ic_svg icon_arrow"></i></button>
                            <ul>
                                <li><button type="button" value="">전체보기</button></li>
                                <c:if test="${!empty cate_list}">
                                    <c:forEach var="item" items="${cate_list}" varStatus="status">
                                        <li><button type="button" class="tx_shortening_1" value="${item.fk_cate_2_idx }">${item.cate_1_name}&gt;${item.cate_2_name}</button></li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </div>
                        <div class="col co_right">
                            <div class="selected">전체보기</div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="area_controller">
                <div class="container">
                    <div class="row row_gap_32 row_between">
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
                                <li><button type="button" class="btn_checked_add_cart">장바구니담기</button></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
            <section class="area_goods_list">
                <div class="container">
                    <ul>
                        <!-- :: full case :: AI_list -->
                        <c:if test="${!empty cate_product_list}">
                            <c:forEach var="item" items="${cate_product_list}" varStatus="status">
                                <li class="goods_card">
                                    <!-- 라벨없을때 <div class="cd_head nolabels"> nolabels 추가  -->
                                    <div class="cd_head nolabels">
                                        <div class="labels">
                                            <div class="cd_label label_recom">추천상품</div>
                                            <div class="cd_label label_discount">최대 20% 할인</div>
                                            <div class="cd_label label_added">담은상품</div>
                                            <div class="cd_label label_purchased">구매상품</div>
                                        </div>
                                        <label class="checkbox">
                                            <input type="checkbox" class="input_checkbox input_checkbox_goods" />
                                            <span class="input_shape"></span>
                                        </label>
                                    </div>
                                    <a href="#해당상품상세페이지로" class="cd_info">
                                        <div class="info_img"><div class="img_wrap"><img src="/resources/images/mobile/sample_goods_img.jpg" alt="" /></div></div>
                                        <div class="info_text">
                                            <div class="tx_cate tx_shortening_2">[마스크/글러브/석션 > 석션재료(팁,홀더,관련부품)] </div>
                                            <div class="tx_tit tx_shortening_2">Aluminium Suction Holder Suction Holder</div>
                                            <div class="tx_subinfo tx_shortening_2">FujiCEM 2RMGI l GC/일본 l 13.3g x 2paste</div>
                                            <div class="tx_price">
                                                <span class="tx_p_discount_per"><em>99</em>%</span>
                                                <span class="tx_p_origin_price"><em>9,999,999</em>원</span>
                                                <span class="tx_p_discount_price"><em>9,999,999</em>원</span>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="cd_foot">
                                        <button type="button" class="btn_set btn_set_cnt"><div class="op_val">1</div><i class="op_arrow"></i></button>
                                        <button type="button" class="btn_set btn_set_option"><div class="op_val tx_shortening_1">규격 선택</div><i class="op_arrow"></i></button>
                                    </div>
                                    <div class="cd_foot">
                                        <button type="button" class="btn_add_cart">장바구니 담기</button>
                                    </div>
                                </li>
                            </c:forEach>
                        </c:if>
                        <li class="goods_card">
                            <!-- 라벨없을때 <div class="cd_head nolabels"> nolabels 추가  -->
                            <div class="cd_head">
                                <div class="labels">
                                    <div class="cd_label label_recom">추천상품</div>
                                    <div class="cd_label label_discount">최대 20% 할인</div>
                                    <div class="cd_label label_added">담은상품</div>
                                    <div class="cd_label label_purchased">구매상품</div>
                                </div>
                                <label class="checkbox">
                                    <input type="checkbox" class="input_checkbox input_checkbox_goods" />
                                    <span class="input_shape"></span>
                                </label>
                            </div>
                            <a href="#해당상품상세페이지로" class="cd_info">
                                <div class="info_img"><div class="img_wrap"><img src="/resources/images/mobile/sample_goods_img.jpg" alt="" /></div></div>
                                <div class="info_text">
                                    <div class="tx_cate tx_shortening_2">[마스크/글러브/석션 > 석션재료(팁,홀더,관련부품)] </div>
                                    <div class="tx_tit tx_shortening_2">Aluminium Suction Holder Suction Holder</div>
                                    <div class="tx_subinfo tx_shortening_2">FujiCEM 2RMGI l GC/일본 l 13.3g x 2paste</div>
                                    <div class="tx_price">
                                        <span class="tx_p_discount_per"><em>99</em>%</span>
                                        <span class="tx_p_origin_price"><em>9,999,999</em>원</span>
                                        <span class="tx_p_discount_price"><em>9,999,999</em>원</span>
                                    </div>
                                </div>
                            </a>
                            <div class="cd_foot">
                                <button type="button" class="btn_set btn_set_cnt"><div class="op_val">1</div><i class="op_arrow"></i></button>
                                <button type="button" class="btn_set btn_set_option"><div class="op_val tx_shortening_1">규격 선택</div><i class="op_arrow"></i></button>
                            </div>
                            <div class="cd_foot">
                                <button type="button" class="btn_add_cart">장바구니 담기</button>
                            </div>
                        </li>
                        <li class="goods_card">
                            <!-- 라벨없을때 <div class="cd_head nolabels"> nolabels 추가  -->
                            <div class="cd_head">
                                <div class="labels">
                                    <div class="cd_label label_recom">추천상품</div>
                                    <div class="cd_label label_discount">최대 20% 할인</div>
                                    <div class="cd_label label_purchased">구매상품</div>
                                </div>
                                <label class="checkbox">
                                    <input type="checkbox" class="input_checkbox input_checkbox_goods" />
                                    <span class="input_shape"></span>
                                </label>
                            </div>
                            <a href="#해당상품상세페이지로" class="cd_info">
                                <div class="info_img"><div class="img_wrap"><img src="/resources/images/mobile/sample_goods_img.jpg" alt="" /></div></div>
                                <div class="info_text">
                                    <div class="tx_cate tx_shortening_2">[마스크/글러브/석션 > 석션재료(팁,홀더,관련부품)] </div>
                                    <div class="tx_tit tx_shortening_2">Aluminium Suction Holder Suction Holder</div>
                                    <div class="tx_subinfo tx_shortening_2">FujiCEM 2RMGI l GC/일본 l 13.3g x 2paste</div>
                                    <div class="tx_price">
                                        <span class="tx_p_discount_per"><em>99</em>%</span>
                                        <span class="tx_p_origin_price"><em>9,999,999</em>원</span>
                                        <span class="tx_p_discount_price"><em>9,999,999</em>원</span>
                                    </div>
                                </div>
                            </a>
                            <div class="cd_foot">
                                <button type="button" class="btn_set btn_set_cnt"><div class="op_val">1</div><i class="op_arrow"></i></button>
                                <button type="button" class="btn_set btn_set_option"><div class="op_val tx_shortening_1">규격 선택</div><i class="op_arrow"></i></button>
                            </div>
                            <div class="cd_foot">
                                <button type="button" class="btn_add_cart">장바구니 담기</button>
                            </div>
                        </li>
                    </ul>
                    <button type="button" class="btn_more_ist">더보기(20)<i class="ic_svg icon_arrow"></i></button>
                </div>
            </section>
        </div>
        <layout:MobileStoreFooterFrame />
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

            // 리스트상단_카테고리클릭시
            $('.col_catelist .btn_catelist').on('click', function(){
                $(this).parent().toggleClass('active');
            });
            $('.col_catelist ul li button').on('click', function(){
                let catename = $(this).text();
                $('.area_category_info .selected').text(catename);
                $(this).parents('.col_catelist').removeClass('active');
            });

            // 리스트상단_전체선택, 선택삭제, 장바구니담기
            $('.area_controller').on('click','input[name=input_check_all]', function(){
                if($(this).prop('checked')) {
                    $('.area_goods_list input[type=checkbox]').prop('checked', true);
                } else {
                    $('.area_goods_list input[type=checkbox]').prop('checked', false);
                }
            }).on('click', '.btn_checked_delete', function(){
                let checked_cnt = $('.area_goods_list input[type=checkbox]:checked').length;
                if( checked_cnt > 0) {
                    mvLayer.confirm('선택한 상품을 삭제합니다.', function(res){
                        console.log(res);
                    });
                } else {
                    mvLayer.alert('선택한 상품이 없습니다.')
                }
            }).on('click', '.btn_checked_add_cart', function(){
                let checked_cnt = $('.area_goods_list input[type=checkbox]:checked').length;
                if( checked_cnt > 0) {
                    mvLayer.addCart('선택한 상품을 장바구니에<br /> 담았습니다.')
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
            });
            // 상품개별_장바구니담기
            $('.goods_card .btn_add_cart').on('click', function(){
                mvLayer.addCart('선택한 상품을 장바구니에<br /> 담았습니다.')
            });

            // 시트_열기
            $('.btn_set_cnt, .btn_set_option').on('click', function(){
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
