<%@ tag language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<footer>
	<section class="footer_caution">
		<div class="container container_full">
			<div class="tx_tit">※ 참고해주세요</div>
			<ul>
				<li>메디밸류 <em>간편 구매</em> 서비스 전용 모바일 페이지입니다.</li>
				<li>위시리스트 및 장바구니, 이벤트 상품등을 제공하며 이외 상품은 PC를 통해 확인 가능합니다.</li>
				<li>취소 및 이용 관련 문의는 고객센터를 통해 문의주시기 바랍니다.</li>
			</ul>
		</div>
	</section>
	<section class="footer_menu">
		<div class="container container_full">
			<ul>
				<li><a href="https://medivaluecorp.com/" target="_blank">메디밸류 소개</a></li>
				<li><a href="/sample/policy_use">이용약관</a></li>
				<li><a href="/sample/policy_privacy">개인정보처리방침</a></li>
			</ul>
		</div>
	</section>
	<section class="footer_info">
		<div class="container container_full">
			<div class="f_logo"><img src="/resources/images/mobile/m_f_logo.svg" alt="" /></div>
			<div class="f_company_info">
				<div class="area_top">
					<div class="tx_name">주식회사 메디밸류</div>
					<button type="button" class="btn_layer_inquiry" onclick="openLayer('.mv_modal_layer_inquiry');">입점 및 제휴 문의</button>
				</div>
				<ul>
					<li><div class="tx_info_name">대표</div>
						<div class="tx_info_val">노형태</div></li>
					<li><div class="tx_info_name">주소</div>
						<div class="tx_info_val">서울특별시 영등포구 여의공원로 115 세우빌딩, 6층</div></li>
					<li><div class="tx_info_name">반품 주소지</div>
						<div class="tx_info_val">서울특별시 중구 순화동 151 포스코더샵 406호, 407호</div></li>
					<li><div class="tx_info_name">사업자등록번호</div>
						<div class="tx_info_val">646-81-02195</div></li>
					<li><div class="tx_info_name">통신판매업</div>
						<div class="tx_info_val">제2022-서울영등포-3378호</div></li>
					<li><div class="tx_info_name">의료기기</div>
						<div class="tx_info_val">제2022-3180034-04-70-00395호</div></li>
					<li><div class="tx_info_name">개인정보보호책임자</div>
						<div class="tx_info_val">홍하석</div></li>
					<li><div class="tx_info_name">고객만족센터</div>
						<div class="tx_info_val">02-779-6551 (오전9시 ~ 오후6시)</div></li>
				</ul>
			</div>
			<div class="tx_copyright">COPYRIGHT © medivalue RIGHTS RESERVED</div>
		</div>
	</section>
</footer>

<div class="mv_modal_layer mv_modal_layer_inquiry">
	<div class="inner_wrap">
		<div class="lay_header">메디밸류 입점 및 제휴문의</div>
		<div class="lay_body">
			<div class="img_logo"><img src="/resources/images/mobile/contact_us_logo.svg" alt="medivalue"/></div>
			<div class="tx_cont">
				<em>디지털 의료혁신의 미래</em><br />
				메디밸류와 함께 만들어가실<br />
				기업을 찾습니다<br /><br />
				입점, 제휴, 광고 등 문의하시면<br />
				담당자가 빠르게 답변드리겠습니다
			</div>
			<div class="contact_method">
				<div class="row row_gap_12">
					<div class="col col_6">
						<a href="mailto:info@medivalue.co.kr" class="contact_mail">
							<div class="icon_mail"><img src="/resources/images/mobile/icon_mail.png" alt="" /></div>
							<div class="tx_mail">info@medivalue.co.kr</div>
						</a>
					</div>
					<div class="col col_6">
						<a href="tel:02-779-6551" class="contact_phon">
							<div class="icon_phon"><img src="/resources/images/mobile/icon_phon.png" alt="" /></div>
							<div class="tx_phon">02-779-6551</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<button type="button" class="btn_close_mv_modal"><img src="/resources/images/mobile/icon_close_modal.png" alt="" /></button>
</div>