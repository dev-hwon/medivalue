<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:MobileStoreFrame>
    <jsp:attribute name="stylesheet">
	    <link href="/resources/css/mobile/order.css" rel="stylesheet" >
	</jsp:attribute>
    <jsp:body>
        <div class="m_contents">
            <form name="form_my_order">
                <section class="section sec_goods_info">
                    <div class="sec_header">
                        <div class="container">
                            <div class="row row_between row_gap_32">
                                <div class="col col_left"><div class="tx_sec_tit">주문정보</div></div>
                                <div class="col col_right">
                                    <div class="tx_save_info">총 <span class="tx_price"><em>99,999,999</em>원</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sec_contents">
                        <div class="container">
                            <div class="row row_between">
                                <div class="col col_left col_goods_default">
                                    <div class="item_tit">AF Ject 석션팁사용 전 멸균가능 외 5건</div>
                                </div>
                                <div class="col col_right">
                                    <button type="button" class="btn_expand" data-target=".order_goods_list"><i class="icon_arrow"></i></button>
                                </div>
                            </div>
                            <div class="order_goods_list">
                                <ul>
                                    <li>
                                        <div class="row row_between">
                                            <div class="col col_8">
                                                <div class="item_tit">Central Vacuum Holder Central Vacuum Holder</div>
                                                <div class="item_subinfo">Central Vacuum Holder Central Vacuum Holder</div>
                                            </div>
                                            <div class="col col_4">
                                                <div class="item_cnt">2개</div>
                                                <div class="item_price"><em>99,999,,999</em></div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="row row_between">
                                            <div class="col col_8">
                                                <div class="item_tit">Central Vacuum Holder Central Vacuum Holder</div>
                                                <div class="item_subinfo">Central Vacuum Holder Central Vacuum Holder</div>
                                            </div>
                                            <div class="col col_4">
                                                <div class="item_cnt">2개</div>
                                                <div class="item_price"><em>99,999,,999</em></div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="row row_between">
                                            <div class="col col_8">
                                                <div class="item_tit">Central Vacuum Holder Central Vacuum Holder</div>
                                                <div class="item_subinfo">Central Vacuum Holder Central Vacuum Holder</div>
                                            </div>
                                            <div class="col col_4">
                                                <div class="item_cnt">2개</div>
                                                <div class="item_price"><em>99,999,,999</em></div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="row row_between">
                                            <div class="col col_8">
                                                <div class="item_tit">Central Vacuum Holder Central Vacuum Holder</div>
                                                <div class="item_subinfo">Central Vacuum Holder Central Vacuum Holder</div>
                                            </div>
                                            <div class="col col_4">
                                                <div class="item_cnt">2개</div>
                                                <div class="item_price"><em>99,999,,999</em></div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- 배송정보 -->
                <section class="section sec_addr">
                    <div class="sec_header">
                        <div class="container">
                            <div class="row row_between">
                                <div class="col"><div class="tx_sec_tit">배송정보</div></div>
                                <div class="col"><a href="" class="link_addr_manage">배송지 변경</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="sec_contents">
                        <div class="container">
                            <div class="addr_info">
                                <div class="tx_name">이엘치과(회사)</div>
                                <div class="tx_phon">010-1234-7855</div>
                                <div class="tx_address">서울 영등포구 여의공원로 115 6층 서울 영등포구 여의공원로 115 6층 서울 영등포구 여의공원로 </div>
                                <div class="tx_req"><input type="text" value="" name="req" placeholder="배송 요청 사항을 입력해 주세요" /></div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- 세금계산서 정보 -->
                <section class="section sec_bill">
                    <div class="sec_header">
                        <div class="container">
                            <div class="row row_between">
                                <div class="col col_left"><div class="tx_sec_tit">세금계산서 정보</div></div>
                                <div class="col col_right">
                                    <div class="tx_save_info"><em>신청</em>(바른연세미소고운치과)</div>
                                    <button type="button" class="btn_expand" data-target=".sec_bill .sec_contents"><i class="icon_arrow"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sec_contents" style="display: none;">
                        <div class="container">
                            <ul>
                                <li>
                                    <label class="radio">
                                        <input type="radio" class="input_radio" name="input_radio_isBill" value="1" checked/>
                                        <span class="input_shape"></span>
                                        <span class="input_radio_name">세금계산서 신청</span>
                                    </label>
                                    <button type="button" class="btn_modify_business_info">수정</button>
                                    <div class="my_business_info">
                                        <!-- 네임값은 맞춰야할듯... -->
                                        <label><span>사업자번호 : </span><input type="text" name="busiNo" value="123456" readonly /></label>
                                        <label><span>대표자명 : </span><input type="text" name="busiCeo" value="혀우너" readonly /></label>
                                        <label><span>회사명 : </span><input type="text" name="busiName" value="바른연세미소고운치과" readonly /></label>
                                        <label><span>이메일 : </span><input type="text" name="busiMail" value="ddsdfff@gmail.com" readonly /></label>
                                    </div>
                                </li>
                                <li>
                                    <label class="radio">
                                        <input type="radio" class="input_radio" name="input_radio_isBill" value="0"/>
                                        <span class="input_shape"></span>
                                        <span class="input_radio_name">세금계산서 미신청</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                </section>
                <!-- 포인트 적립 -->
                <section class="section sec_save_point">
                    <div class="sec_header">
                        <div class="container">
                            <div class="row row_between">
                                <div class="col"><div class="tx_sec_tit">포인트 적립</div></div>
                                <div class="col">
                                    <div class="tx_save_info"><em>메디밸류 포인트 적립</em></div>
                                    <button type="button" class="btn_expand" data-target=".sec_save_point .sec_contents"><i class="icon_arrow"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sec_contents" style="display: none;">
                        <div class="container">
                            <ul>
                                <li>
                                    <label class="radio">
                                        <input type="radio" class="input_radio" name="input_radio_save_point" value="1" checked/>
                                        <span class="input_shape"></span>
                                        <span class="input_radio_name">메디밸류 포인트 적립</span>
                                    </label>
                                </li>
                                <li>
                                    <label class="radio">
                                        <input type="radio" class="input_radio" name="input_radio_save_point" value="0"/>
                                        <span class="input_shape"></span>
                                        <span class="input_radio_name">OK캐쉬백 적립</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="sec_tip">
                        <div class="container">
                            <div class="inner_wrap">
                                <span class="tx_deco">TIP</span>
                                <div class="tx_inner">
                                    메디캐시 결제시 포인트 적립 2%, OK캐쉬백 적립 1%<br />
                                    이외 결제수단 선택시 포인트 적립 1%, OK캐쉬백 적립 1%
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- 포인트 사용 -->
                <section class="section sec_use_point">
                    <div class="sec_header">
                        <div class="container">
                            <div class="row row_between">
                                <div class="col"><div class="tx_sec_tit">포인트 사용</div> </div>
                                <div class="col"><div class="tx_save_info">사용가능 포인트 <em>999,999원</em></div></div>
                            </div>
                        </div>
                    </div>
                    <div class="sec_contents">
                        <div class="container">
                            <div class="input_wrap">
                                <input type="number" name="use_point" placeholder="사용할 포인트를 입력해주세요" />
                                <button type="button" class="btn_use_point" >사용</button>
                            </div>
                            <label class="checkbox">
                                <input type="checkbox" class="input_checkbox" name="use_point_max" />
                                <span class="input_shape"></span>
                                <span class="input_checkbox_name color_red">최대 포인트 사용</span>
                            </label>
                        </div>
                    </div>
                    <div class="sec_tip">
                        <div class="container">
                            <div class="inner_wrap">
                                <span class="tx_deco">TIP</span>
                                <div class="tx_inner">
                                    사용가능한 포인트만 보여집니다.<br />
                                    - 보유 포인트 1천원 이상부터 사용가능<br />
                                    - 모든 제품의 총 결제 금액 5% 까지 사용가능
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- 쿠폰 사용 -->
                <section class="section sec_use_coupon">
                    <div class="sec_header">
                        <div class="container">
                            <div class="row row_between">
                                <div class="col"><div class="tx_sec_tit">쿠폰 사용</div></div>
                                <div class="col">
                                    <div class="tx_save_info">사용가능한 쿠폰 <em>1개</em></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sec_contents">
                        <div class="container">
                            <div class="input_wrap">
                                <div class="select_box">
                                    <div class="selected">옵션입리다~1</div>
                                    <ul>
                                        <li><button type="button" value="쿠폰1">쿠폰1</button></li>
                                        <li><button type="button" value="쿠폰2">쿠폰2</button></li>
                                        <li><button type="button" value="쿠폰3">쿠폰3</button></li>
                                    </ul>
                                </div>
                                <button type="button" class="btn_use_coupon">사용</button>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- 결제수단 -->
                <section class="section sec_payment_method">
                    <div class="sec_header">
                        <div class="container">
                            <div class="row row_between">
                                <div class="col"><div class="tx_sec_tit">결제수단</div></div>
                                <div class="col"></div>
                            </div>
                        </div>
                    </div>
                    <div class="sec_contents">
                        <div class="container">
                            <div class="method_list">
                                <ul>
                                    <li>
                                        <label class="radio">
                                            <input type="radio" class="input_radio" name="input_radio_method" value="0" checked />
                                            <span class="input_shape"></span>
                                            <span class="input_radio_name">메디캐시 사용</span>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="radio">
                                            <input type="radio" class="input_radio" name="input_radio_method" value="1"/>
                                            <span class="input_shape"></span>
                                            <span class="input_radio_name">계좌이체</span>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="radio">
                                            <input type="radio" class="input_radio" name="input_radio_method" value="2"/>
                                            <span class="input_shape"></span>
                                            <span class="input_radio_name">신용카드</span>
                                        </label>
                                    </li>
                                    <li>
                                        <label class="radio">
                                            <input type="radio" class="input_radio" name="input_radio_method" value="3"/>
                                            <span class="input_shape"></span>
                                            <span class="input_radio_name">내통장 결제</span>
                                        </label>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="section sec_payment_method_info">
                    <div class="method_add_info">
                        <ul>
                            <li class="method_0">
                                <div class="sec_sub_header">
                                    <div class="container">
                                        <div class="row row_between">
                                            <div class="col">
                                                <div class="tx_sec_tit">메디캐시 사용</div>
                                                <div class="mv_tooltip">
                                                    <button type="button" class="btn_show_tt"><i class="icon_help"></i></button>
                                                    <div class="tt_content">충전시 최대 5%, 사용시 최대 2% 적립 혜택</div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="tx_save_info">메디캐시 <span class="tx_price"><em>99,999,999</em>원</span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="sec_sub_contents">
                                    <div class="container">
                                        <div class="input_wrap">
                                            <input type="number" name="use_cash" placeholder="사용할 캐시를 입력해주세요" />
                                            <%--  추후 페이지 처리시 다시추가예정
                                            <button type="button" class="btn_charge_point" >충전</button>--%>
                                            <button type="button" class="btn_use_cash" >사용</button>
                                        </div>
                                        <label class="checkbox">
                                            <input type="checkbox" class="input_checkbox" name="use_cash_max" />
                                            <span class="input_shape"></span>
                                            <span class="input_checkbox_name color_red">최대 캐시 사용</span>
                                        </label>
                                    </div>
                                </div>
                            </li>
                            <li class="method_1">
                                <div class="sec_sub_header">
                                    <div class="container">
                                        <div class="row row_between">
                                            <div class="col"><div class="tx_sec_tit">계좌이체 사용</div></div>
                                            <div class="col"><button type="button" class="btn_copy_account">복사</button></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="sec_sub_contents">
                                    <div class="container">
                                        <div class="account_info">
                                            <ul>
                                                <li>
                                                    <span class="tx_name">예금주</span>
                                                    <span class="tx_val">메디밸류</span>
                                                </li>
                                                <li>
                                                    <span class="tx_name">입금계좌</span>
                                                    <span class="tx_val">하나은행 | 547-910035-44104</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="method_2"></li>
                            <li class="method_3"></li>
                        </ul>
                    </div>
                    <div class="sec_contents_add">
                        <div class="container">
                            <label class="checkbox">
                                <input type="checkbox" class="input_checkbox" name="payment_method_reuse" />
                                <span class="input_shape"></span>
                                <span class="input_checkbox_name">다음에도 이 결제수단을 사용합니다</span>
                            </label>
                        </div>
                    </div>
                </section>
                <!-- 최종 결제 금액 -->
                <section class="section sec_payment_final">
                    <div class="sec_header">
                        <div class="container">
                            <div class="row row_between">
                                <div class="col"><div class="tx_sec_tit">최종 결제 금액</div></div>
                                <div class="col">
                                    <div class="tx_save_info"><span class="tx_price"><em>99,999,999</em>원</span></div>
                                </div>
                            </div>
                            </div>
                    </div>
                    <div class="sec_contents">
                        <div class="container">
                            <div class="payment_final_detail">
                                <ul>
                                    <li>
                                        <span class="tx_name">상품금액</span>
                                        <span class="tx_price"><em>999,999</em>원</span>
                                    </li>
                                    <li>
                                        <span class="tx_name">상품할인</span>
                                        <span class="tx_price"><em>999,999</em>원
                                             <button type="button" class="btn_expand" data-target=".discount_detail"><i class="icon_arrow"></i></button>
                                        </span>
                                        <div class="discount_detail">
                                            <ul>
                                                <li>
                                                    <span class="tx_name">즉시할인</span>
                                                    <span class="tx_price"><em>999,999</em>원</span>
                                                </li>
                                                <li>
                                                    <span class="tx_name">포인트 사용</span>
                                                    <span class="tx_price"><em>999,999</em>원</span>
                                                </li>
                                                <li>
                                                    <span class="tx_name">쿠폰 사용</span>
                                                    <span class="tx_price"><em>999,999</em>원</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="tx_name">배송비</span>
                                        <span class="tx_price"><em>999,999</em>원</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="sec_tip">
                        <div class="container">
                            <div class="inner_wrap">
                                메디밸류를 통해 10,000원이나 저렴하게 구매할 수
                                있어요
                            </div>
                        </div>
                    </div>
                </section>
                <!-- 동의 1 -->
                <section class="section sec_agree_default">
                    <div class="sec_header">
                        <div class="container">
                            <div class="row row_between">
                                <div class="col"><div class="tx_sec_tit">결제 진행 필수 동의(필수)</div></div>
                                <div class="col">
                                    <label>
                                        <input type="checkbox" class="input_checkbox_agree" />
                                        <span class="input_shape"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sec_contents">
                        <div class="container">
                            <div class="tx_agree">위 주문 내용을 확인 했으며 회원 본인은 결제에 동의합니다</div>
                        </div>
                    </div>
                </section>
                <!-- 동의 2 -->
                <section class="section sec_agree_marketing">
                    <div class="sec_header">
                        <div class="container">
                            <div class="row row_between">
                                <div class="col"><div class="tx_sec_tit">마케팅 수신 동의(선택)</div></div>
                                <div class="col">
                                    <label>
                                        <input type="checkbox" class="input_checkbox_agree" />
                                        <span class="input_shape"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sec_contents">
                        <div class="container">
                            <div class="tx_agree">동의하면 프로모션, 할인행사 등 유용한 정보를 받으실 수 있어요</div>
                        </div>
                    </div>
                </section>

                <button type="submit" class="btn_submit_my_order">위 내용으로 결제를 진행합니다.</button>
            </form>
        </div>
        <script>
            let order = $('form[name=form_my_order]');
            $('.btn_expand', order).on('click', function(){
                let target = $(this).data('target');
                $(this).toggleClass('active')
                $(target).stop().slideToggle();
            });

            // 세금계산서 _ 값설정 임의로..처리
            function isReqBill() {
                let _value = $('input[name=input_radio_isBill]:checked').val();
                return +_value === 1;
            }
            function reqBill() {
                if( isReqBill() ) {
                    $('.my_business_info').show();
                    $('.btn_modify_business_info').show();
                    $('.sec_bill .tx_save_info').html('<em>신청</em>('+ $("input[name=busiName]").val() +')');
                } else {
                    $('.my_business_info').hide();
                    $('.btn_modify_business_info').hide();
                    $('.sec_bill .tx_save_info').html('<em>미신청</em>');
                }
            }
            reqBill();
            $('input[name=input_radio_isBill]').on('click', function(){
                reqBill();
            });
            $('.btn_modify_business_info').on('click', function(){
                let _this = $(this);
                let business_info = $('.my_business_info');
                if(business_info.hasClass('edit_mode')) {
                    mvLayer.confirm('입력한 정보를 저장합니다', function(res){
                        if(res) {
                            business_info.removeClass('edit_mode');
                            business_info.find('input').attr('readonly', true);
                            _this.text('수정').removeClass('on');
                        }
                    });
                } else {
                    business_info.addClass('edit_mode');
                    business_info.find('input').attr('readonly', false);
                    _this.text('저장').addClass('on');
                }
            });

            // 결제방법선택
            function paymentMethod(){
                let payment_method = $('input[name=input_radio_method]:checked').val();
                $('.method_add_info li.method_'+ payment_method).show().siblings().hide();
            }
            paymentMethod()
            $('input[name=input_radio_method]').on('click', function(){
                paymentMethod()
            });

            // 계좌번호 복사
            $('.btn_copy_account').on('click', function(){
                let account_number = '547-910035-44104';
                $('body').append('<input class="copy-area"  value="' + account_number +'">').find('.copy-area').select();
                document.execCommand('copy');
                $(".copy-area").remove();
                mvLayer.alert(account_number +' 복사되었습니다.')
            });
        </script>
    </jsp:body>
</layout:MobileStoreFrame>
