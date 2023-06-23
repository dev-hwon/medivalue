<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:MobileStoreFrame>
    <jsp:attribute name="stylesheet">
		<c:set var="check_version_info" value="2023052501"/>
	    <link rel="stylesheet" href="/resources/css/event/2023/evt_medicash_m.css?v=${check_version_info}" />
	</jsp:attribute>
	<jsp:body>
		<!-- 관리자에서 이미지등록시 이미지내용도 입력할수있게... -->
		<div class="m_contents">
			<section class="area_visual" style="font-size: 32px;">
				<div class="container ">
					<div class="tx_tit">
						<span class="tr_delay_1">똑</span><span class="tr_delay_2">똑</span><span class="tr_delay_3">하</span><span class="tr_delay_4">게</span><br />
						<span class="tr_delay_2">메</span><span class="tr_delay_3">디</span><span class="tr_delay_4">캐</span><span class="tr_delay_5">시</span><br />
						<span class="tr_delay_3">충</span><span class="tr_delay_4">전</span><span class="tr_delay_5">하</span><span class="tr_delay_6">고</span><br />
						<span class="tr_delay_4">혜</span><span class="tr_delay_5">택</span><span class="tr_delay_6">까</span><span class="tr_delay_7">지</span>
					</div>
					<div class="tx_hash">
						<span class="tr_delay_1">#쉬운결제</span>
						<span class="tr_delay_3">#선불충전</span>
						<span class="tr_delay_5">#추가혜택</span>
					</div>
					<div class="obj_card tr_delay_2"><img src="/resources/images/event/medicash/m/m_visual_card.png?v=3" alt="최대 150만 포인트 적립, 구매 시 2배 포인트 적립" /></div>
				</div>
				<div class="visual_obj">
					<div class="obj_item obj_1"><img src="/resources/images/event/medicash/obj_coin_x2.png" alt="" /></div>
					<div class="obj_item obj_2"><img src="/resources/images/event/medicash/obj_gift_md_x2.png" alt="" /></div>
					<div class="obj_item obj_3"><img src="/resources/images/event/medicash/obj_gift_sm_x2.png" alt="" /></div>
					<div class="obj_item obj_4"><img src="/resources/images/event/medicash/obj_ball_lg_x2.png" alt="" /></div>
					<div class="obj_item obj_5"><img src="/resources/images/event/medicash/obj_ball_md_x2.png" alt="" /></div>
					<div class="obj_item obj_6"><img src="/resources/images/event/medicash/obj_ball_sm_x2.png" alt="" /></div>
				</div>
				<script>
					setTimeout(function(){
						$('.area_visual').addClass('active');
					}, 500);
				</script>
			</section>
			<section class="area_contents">
				<div class="cash_card">
					<div class="swiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide"><img src="/resources/images/event/medicash/m/cash_step_card_1_x2.png" alt="매번 번거로운 카드결제 말고 이젠 미리충전해 놓고 사용할 수 있어요" /></div>
							<div class="swiper-slide"><img src="/resources/images/event/medicash/m/cash_step_card_2_x2.png" alt="필요한 금액만큼 충전하고 충전금액의 최대 5% 추가포인트를 받아요" /></div>
							<div class="swiper-slide"><img src="/resources/images/event/medicash/m/cash_step_card_3_x2.png" alt="메디캐시로 구매하면 최대 2배의 적립혜택까지!" /></div>
						</div>
					</div>
					<div class="btn_prev"><i class="icon_arrow d_left"></i></div>
					<div class="btn_next"><i class="icon_arrow"></i></div>
				</div>
			</section>
			<section class="area_caution">
				<div class="container">
					<div class="inner_wrap">
						<div class="tx_tit">※ 참고해주세요</div>
						<div class="tx_cont">
							메디캐시를 통한 상품 구매시 적립률은 포인트적립 2%, OK 캐시백적립 1% 입니다<br />
							지급 혜택은  포인트로 제공되며 내부 사정에 따라 사전 고지없이 변경 또는 종료 될 수 있습니다<br />
							기타 이용 문의는 고객센터로 문의주시기 바랍니다
						</div>
						<a href="">고객센터 문의하기<i class="icon_arrow_blue"></i></a>
					</div>
				</div>
			</section>
			<section class="area_fixed_footer">
				<div class="cash_link">
					<a href="#충전"><i class="icon_cash"></i>메디캐시 충전하기<i class="icon_arrow_white"></i></a>
				</div>
			</section>
		</div>
		<script>
			const cash_card = new Swiper(".cash_card .swiper", {
				loop: true,
				slidesPerView: 1.2,
				centeredSlides: false,
				spaceBetween: 32,
				speed: 400,
				slideToClickedSlide: true,
				autoplay: {
					delay: 2500,
				},
				navigation: {
					prevEl : ".cash_card .btn_prev",
					nextEl : ".cash_card .btn_next",
				},
			});
		</script>
	</jsp:body>
</layout:MobileStoreFrame>
