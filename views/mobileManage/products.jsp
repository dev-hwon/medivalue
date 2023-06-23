<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="robots" content="all" />
	<meta name="format-detection" content="telephone=no">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, target-densityDpi=medium-dpi"/>
	<meta property="og:title" content="메디밸류-스토어">
	<meta property="og:description" content="최초의 의료재료 직거래 커머스 플랫폼">
	<meta name="description" content="최초의 의료재료 직거래 커머스 플랫폼">
	<meta property="og:image" content="/resources/mp4/intro/poster/3-3.jpg">
	<meta name="robots" content="index,follow">
	<title>메디밸류소개 | Products</title>
	<meta name="keywords" content="치과재료 가격비교, 치과의약품, 교정,기구,소장비,치과재료, 알지네이트, 소독용액, 교정재료, 기공재료, 기공용 재료, 치과재료, 최저가치과재료, 치과재료싼곳, 치과재료특판, 임플란트재료, 임플란트기구,임플란트장비, 치과장비, DENTAL,치과재료,치과재료전문업체,덴탈,치자재,인상재,레진,세멘트,근관치료,충전재,에칭,본드,임프레션,트레이,교정기구,치과위생용품판매,특판,치과치재료,미백,임플란트">

	<link rel="shortcut icon" href="/resources/images/favicon/favicon.png" />
	<!-- css -->
	<link href="/resources/css/swiper-bundle.min.css" rel="stylesheet" >
	<link href="/resources/css/intro/mv_common.css" rel="stylesheet" >
	<link href="/resources/css/intro/mv_products.css" rel="stylesheet" >
	<!-- js -->
	<script src="/resources/js/jquery-3.4.1.min.js" ></script>
	<script src="/resources/js/swiper-bundle.min.js"></script>
	<script src="/resources/js/intro/mv_common.js" defer></script>
</head>
<body>
<header>
	<div class="container">
		<div class="row">
			<div class="col col_xs_6 col_sm_3 col_lg_3 col_left"><h1><a href="/"><img src="/resources/images/intro/logo_black.svg" alt="medivalue" /></a></h1></div>
			<div class="col col_xs_6 col_sm_9 col_lg_9 col_right">
				<div class="hidden_xs">
					<a href="/mobile/home">Home</a>
					<a href="/mobile/about">About Medivalue</a>
					<a href="/mobile/products" >Products</a>
					<a href="https://mail.google.com/mail/u/0/?fs=1&tf=cm&source=mailto&to=info@medivalue.co.kr" target="_blank" class="btn_move_contact">Contact Us</a>
				</div>
				<div class="hidden_sm">
					<button type="button" onclick="openSheet('.sheetLayer_move_menu')"><img src="/resources/images/intro/icon_menu_m.png" alt=""></button>
				</div>
			</div>
		</div>
	</div>
</header>
<div class="main_index">
	<section class="section section_1">
		<div class="sec1_scr_obj">
			<div class="thumb_obj"></div>
			<div class="tx_scroll">Scroll Down</div>
		</div>
		<div class="container">
			<div class="ft_row_tit">의료 환경의<br />시작부터 끝까지</div>
			<div class="row col_gap_16 row_card_arrow">
				<div class="col col_xs_12 col_sm_12 col_md_12 col_top hidden_xs">
					<div class="sec1_arrow">
						<div class="bar_start">Start</div>
						<div class="bar_end">End</div>
						<div class="bar_arrow"></div>
					</div>
				</div>
			</div>
			<div class="row col_gap_16 row_card_wrap">
				<div class="col col_xs_12 col_sm_4 col_md_4 col_left active">
					<div class="card_no">01</div>
					<div class="card_item" style="background-image:url('/resources/images/intro/products/sec1/sec1_1.png');">
						<div class="card_subtit">의료기기 생산</div>
						<div class="card_tit">MEDI-TEK</div>
						<button type="button" onclick="moveTo('.sec2_1')" class="">자세히 보기</button>
					</div>
				</div>
				<div class="col col_xs_12 col_sm_4 col_md_4 col_center">
					<div class="card_no">02</div>
					<div class="card_item" style="background-image:url('/resources/images/intro/products/sec1/sec1_2.png');">
						<div class="card_subtit">의료재료 거래</div>
						<div class="card_tit">MEDI-STORE</div>
						<button type="button" onclick="moveTo('.sec2_2')" class="">자세히 보기</button>
					</div>
				</div>
				<div class="col col_xs_12 col_sm_4 col_md_4 col_right">
					<div class="card_no">03</div>
					<div class="card_item" style="background-image:url('/resources/images/intro/products/sec1/sec1_3.png');">
						<div class="card_subtit">의료 서비스</div>
						<div class="card_tit">MEDI-CUBE</div>
						<button type="button" onclick="moveTo('.sec2_3')" class="">자세히 보기</button>
					</div>
				</div>
			</div>
			<script>
				if ($(window).width() > 768) {
					let num = 0;
					setInterval(function(){
						num++;
						if(num>2) num=0;
						$('.row_card_arrow .bar_arrow').css('left', num * 50 +'%');
						$('.row_card_wrap> div').eq(num).addClass('active').siblings().removeClass('active');
					}, 2500);
				}
			</script>
		</div>
	</section>
	<section class="section section_2">
		<h2 class="tx_blind">Mission</h2>
		<div class="container">
			<div class="sec2_arrow hidden_xs">
				<div class="tx_start">Start</div>
				<i class="icon_arrow"></i>
				<div class="tx_end">End</div>
			</div>
			<div class="row col_gap_0 align_items_flex_start sec2_1">
				<div class="col col_xs_12 col_sm_5 col_md_5 col_left">
					<div class="video_wrap">
						<video loop muted poster="/resources/mp4/intro/poster/3-1_1.jpg"><source src="/resources/mp4/intro/3-1_1.mp4" type="video/mp4"></video>
					</div>
				</div>
				<div class="col col_xs_12 col_sm_2 hidden_xs"></div>
				<div class="col col_xs_12 col_sm_5 col_md_5 col_right">
					<div class="info_text">
						<div class="tx_number">01</div>
						<div class="ft_cont_label">의료기기 생산</div>
						<div class="ft_row_tit">MEDI-TEK</div>
						<div class="ft_cont_summ">
							메디밸류 만의 첨단 의료기기 개발과 신소재 연구개발로 <br class="hidden_xs" />
							의료환경 시작인 의료재료, 의료기기 영역의 새로운 경험을 제공합니다.
						</div>
						<div class="sec2_bottom_info sec2_1_bottom_info">
							<div class="row col_gap_16">
								<div class="col col_xs_12 col_sm_6">
									<div class="tx_inner">
										<div class="tx_inner_tit">전자약</div>
										<div class="tx_inner_desc">손상 없이, <br class="hidden_xs" />후유증 없이</div>
										<div class="tx_inner_subinfo">2024년 출시 예정</div>
									</div>
								</div>
								<div class="col col_xs_12 col_sm_6">
									<div class="tx_inner">
										<div class="tx_inner_tit">디지털 치료제 및 치료기기</div>
										<div class="tx_inner_desc">홈케어 및 <br class="hidden_xs" />디지털 헬스케어</div>
										<div class="tx_inner_subinfo">2023년 출시 예정</div>
									</div>
								</div>
								<div class="col col_xs_12 col_sm_6">
									<div class="tx_inner">
										<div class="tx_inner_tit">뼈 이식재</div>
										<div class="tx_inner_desc">바이오세라믹 <br class="hidden_xs" />기술을 활용한</div>
										<div class="tx_inner_subinfo">2023년 하반기 출시 예정</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row col_gap_0 align_items_flex_start sec2_2">
				<div class="col col_xs_12 col_sm_5 col_md_5 col_left">
					<div class="info_text">
						<div class="tx_number">02</div>
						<div class="ft_cont_label">의료기기 거래</div>
						<div class="ft_row_tit">MEDI-STORE</div>
						<div class="ft_cont_summ">
							의료환경 구축의 필수요소인 의료재료 거래행위를 데이터로 만납니다. <br class="hidden_xs" />
							지출관리부터 재고관리, 수요예측을 통해 병의원별 맞춤화된 구매패턴을 <br class="hidden_xs" />
							추출하여, 의료재료 구매의 자동화를 구현합니다.
						</div>
						<div class="sec2_bottom_info sec2_2_bottom_info">
							<div class="row col_gap_16">
								<div class="col col_xs_12 col_sm_6">
									<div class="tx_inner">
										<div class="tx_inner_tit">MV 재료_의료재료</div>
										<div class="tx_inner_desc">국내 최초 실시간 가격비교, <br class="hidden_xs" />구매 리드타임을 줄이다</div>
										<a href="https://www.medivalue.co.kr"  target="_blank" class="btn_link hidden_xs" >바로가기</a>
									</div>
								</div>
								<div class="col col_xs_12 col_sm_6">
									<div class="tx_inner">
										<div class="tx_inner_tit">MV 재료_기공재료</div>
										<div class="tx_inner_desc">국내 최초 실시간 가격비교, <br class="hidden_xs" />기공재료를 가장 쉽게 만나다</div>
										<a href="https://www.medivalue.co.kr" target="_blank" class="btn_link hidden_xs" >바로가기</a>
									</div>
								</div>
								<div class="col col_xs_12 col_sm_6">
									<div class="tx_inner">
										<div class="tx_inner_tit">EasyM</div>
										<div class="tx_inner_desc">의료기기 등록, 보고, 관리까지 <br class="hidden_xs" />모든걸 한번에 만나다</div>
										<a href="https://www.easy-m.co.kr" target="_blank" class="btn_link" >바로가기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col col_xs_12 col_sm_2 hidden_xs"></div>
				<div class="col col_xs_12 col_sm_5 col_md_5 col_right">
					<div class="video_wrap">
						<video loop muted poster="/resources/mp4/intro/poster/3-2.jpg"><source src="/resources/mp4/intro/3-2.mp4" type="video/mp4"></video>
					</div>
				</div>
			</div>
			<div class="row col_gap_0 align_items_flex_start sec2_3">
				<div class="col col_xs_12 col_sm_5 col_md_5 col_left">
					<div class="video_wrap">
						<video loop muted poster="/resources/mp4/intro/poster/3-3.jpg"><source src="/resources/mp4/intro/3-3.mp4" type="video/mp4"></video>
					</div>
				</div>
				<div class="col col_xs_12 col_sm_2 hidden_xs"></div>
				<div class="col col_xs_12 col_sm_5 col_md_5 col_right">
					<div class="info_text">
						<div class="tx_number">03</div>
						<div class="ft_cont_label">의료서비스</div>
						<div class="ft_row_tit">MEDI-CUBE</div>
						<div class="ft_cont_summ">
							의료서비스, 병원운영의 혁신을 통해 환자 건강관리의 혁신을 선도합니다. <br class="hidden_xs" />
							치료에 필요한 거래부터 환자 관리, 운영 업무까지 연계된 All-in-one <br class="hidden_xs" />
							운영 솔루션을 통해 병원 전체의 생산성을 극대화합니다.
						</div>
						<div class="sec2_bottom_info sec2_3_bottom_info">
							<div class="row col_gap_16 ">
								<div class="col col_xs_12 col_sm_12">
									<div class="tx_inner">
										<div class="tx_inner_tit">MV 기공</div>
										<div class="tx_inner_desc">디지털 덴티스트리의 시작, <br class="hidden_xs" />디지털로 만나는 기공의뢰</div>
										<a href="https://dt.medivalue.co.kr" target="_blank" class="btn_link hidden_xs">바로가기</a>
									</div>
								</div>
								<div class="col col_xs_12 col_sm_12">
									<div class="tx_inner">
										<div class="tx_inner_tit">AI 의료 솔루션</div>
										<div class="tx_inner_desc">병원 운영의 혁신을 통해, <br class="hidden_xs" />환자 건강관리를 선도하다</div>
										<div class="tx_soon">Coming soon</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="section section_3">
		<div class="container">
			<div class="ft_row_tit">의료 환경의<br />시작부터 끝까지</div>
		</div>
	</section>
</div>
<footer>
	<div class="container">
		<div class="footer_top">
			<a href="/" class="f_logo"><img src="/resources/images/intro/logo_simple.png" alt="medivalue" /></a>
			<div class="f_menu">
				<ul>
					<li><a href="/mobile/home">Home</a></li>
					<li><a href="/mobile/about">About Medivalue</a></li>
					<li><a href="/mobile/products" >Products</a></li>
				</ul>
			</div>
		</div>
		<div class="footer_bottom">
			<div class="mv_menu hidden_xs">
				<ul>
					<li><a href="https://medivalue.co.kr" target="_blank">MV재료</a></li>
					<li><a href="https://dt.medivalue.co.kr" target="_blank">MV기공</a></li>
					<li><a href="https://www.easy-m.co.kr" target="_blank">EasyM</a></li>
				</ul>
			</div>
			<div class="mv_company_info">
				<ul>
					<li>(주)메디밸류</li>
					<li>노형태</li>
					<li>서울특별시 영등포구 여의공원로 115 세우빌딩, 6층</li>
					<li>info@medivalue.co.kr</li>
					<li>02-780-3921</li>
				</ul>
			</div>
			<div class="mv_copyright">Copyright © MEDIVALUE Corp. All Rights Reserved</div>
		</div>
	</div>
</footer>
<div class="sheetLayer sheetLayer_right sheetLayer_move_menu">
	<div class="sheet_header">Menu</div>
	<div class="sheet_content">
		<div class="sheet_inner">
			<div class="sheet_inner_title">medivalue INTRO</div>
			<ul class="m_move_menu">
				<li><a href="/mobile/home">Home</a></li>
				<li><a href="/mobile/about">About Medivalue</a></li>
				<li><a href="/mobile/products" >Products</a></li>
			</ul>
		</div>
		<div class="sheet_inner">
			<div class="sheet_inner_title">COMPANY INFO</div>
			<div class="m_compnay_info">
				(주)메디밸류 | 노형태 | 서울특별시 영등포구 여의공원로 115 세우빌딩, 6층 | info@medivalue.co.kr | 02-780-3921
			</div>
		</div>
	</div>
	<button class="btn_closeSheet"><img src="/resources/images/intro/icon_close.png" alt="" /></button>
</div>
<script>
	// sec4  arrow fixed
	$(window).on("scroll load", function () {
		let variable_space = 80;
		let arrow = $(".sec2_arrow .icon_arrow");
		let docViewTop = Math.floor($(window).scrollTop()) + variable_space;

		let elemTop = Math.floor($(".sec2_arrow").offset().top);
		let elemBottom = elemTop + $(".sec2_arrow").outerHeight() - 80;

		if (elemTop <= docViewTop && elemBottom >= docViewTop) {
			arrow.addClass("fixed_obj");
		} else {
			arrow.removeClass("fixed_obj");
		}
		if (elemBottom < docViewTop) {
			arrow.css("top", $(".sec2_arrow").outerHeight() - 40);
		} else {
			arrow.attr("style", "");
		}
	});
</script>
</body>
</html>