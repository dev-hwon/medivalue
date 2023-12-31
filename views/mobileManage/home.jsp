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
	<title>메디밸류소개 | Home</title>
	<meta name="keywords" content="치과재료 가격비교, 치과의약품, 교정,기구,소장비,치과재료, 알지네이트, 소독용액, 교정재료, 기공재료, 기공용 재료, 치과재료, 최저가치과재료, 치과재료싼곳, 치과재료특판, 임플란트재료, 임플란트기구,임플란트장비, 치과장비, DENTAL,치과재료,치과재료전문업체,덴탈,치자재,인상재,레진,세멘트,근관치료,충전재,에칭,본드,임프레션,트레이,교정기구,치과위생용품판매,특판,치과치재료,미백,임플란트">

	<link rel="shortcut icon" href="/resources/images/favicon/favicon.png" />
	<!-- css -->
	<link href="/resources/css/swiper-bundle.min.css" rel="stylesheet" >
	<link href="/resources/css/intro/mv_common.css" rel="stylesheet" >
	<link href="/resources/css/intro/mv_home.css" rel="stylesheet" >
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
		<h2 class="tx_blind">의료, 그 이상의 혁신 메디밸류</h2>
		<div class="sec1_scr_obj">
			<div class="thumb_obj"></div>
			<div class="tx_scroll">Scroll Down</div>
		</div>
		<div class="container">
			<div class="row col_gap_0 justify_content_flex_end">
				<div class="col col_xs_12 col_sm_12 col_md_7 col_left">
					<div class="img_default"><img src="/resources/images/intro/home/sec1/fixed_img.png" alt=""></div>
					<div class="ico_plus"><img src="/resources/images/intro/home/sec1/ico_plus.png" alt=""></div>
					<div class="img_rolling"><img src="/resources/images/intro/home/sec1/rolling_1.png" alt=""></div>
					<div class="ico_equal"><img src="/resources/images/intro/home/sec1/ico_equar.png" alt=""></div>
				</div>
				<div class="col col_xs_12 col_sm_12 col_md_5 col_right ft_main_tit">
					의료,<br />그 이상의 혁신<br />메디밸류
				</div>
			</div>
		</div>
		<script>
			let num = 1;
			setInterval(function(){
				if(num>10) num=1;
				$('.img_rolling img').attr('src', '/resources/images/intro/home/sec1/rolling_'+ num +'.png');
				num++;
			}, 900);
		</script>
	</section>
	<!-- <section class="section section_2 plx" data-plxtype="bg" data-plxspeed="0.5" style="background-image:url('/resources/images/introhome/sec2/sec2_bg.jpg')"> -->
	<section class="section section_2" style="background:url('/resources/images/intro/home/sec2/sec2_bg.jpg') no-repeat center; background-size: cover;">
		<h2 class="tx_blind">의료 환경의 시작부터 끝까지 병원의 인프라를 디지털화 하여 디지털 헬스케어를 앞당기다</h2>
		<div class="container">
			<div class="row col_gap_0">
				<div class="col col_xs_12 col_sm_12 col_md_5 col_lg_5 col_left">
					<div class="info_text">
						<div class="tx_logo"><img src="/resources/images/intro/logo_white.svg" alt="medivalue" /></div>
						<div class="tx_title ft_row_tit">의료 환경의<br />시작부터 끝까지</div>
						<div class="tx_summary ft_cont_desc">병원의 인프라를 디지털화 하여<br />디지털 헬스케어를 앞당기다</div>
					</div>
				</div>
				<div class="col col_xs_12 col_sm_12 col_md_7 col_lg_7 col_right">
					<div class="col_right_obj">
						<div class="row col_gap_16">
							<div class="col col_4"><img src="/resources/images/intro/home/sec2/sec2_1.jpg" alt="" class="animated img_sec2_1" data-animate="slideup" data-duration="2" data-delay="1" /></div>
							<div class="col col_4"><img src="/resources/images/intro/home/sec2/sec2_2.jpg" alt="" class="animated img_sec2_2" data-animate="slideup" data-duration="1" /></div>
							<div class="col col_4"><img src="/resources/images/intro/home/sec2/sec2_3.jpg" alt="" class="animated img_sec2_3" data-animate="slideup" data-duration="3" data-delay="3" /></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="section section_3">
		<div class="container">
			<div class="ft_row_tit2">MEDIVALUE<br />Products</div>
			<div class="ft_cont_desc">기술력과 데이터를 바탕으로,<br class="hidden_sm" /> 디지털 의료 혁신의 미래를 만듭니다</div>
			<a href="/mobile/products" class="btn_link">바로가기</a>
		</div>
	</section>

	<section class="section section_4">
		<h2 class="tx_blind">MEDIVALUE Products</h2>
		<div class="container">
			<div class="sec4_arrow hidden_xs">
				<div class="tx_start">start</div>
				<i class="icon_arrow"></i>
				<div class="tx_end">End</div>
			</div>
			<!-- MEDI-TEK -->
			<div class="row col_gap_16 align_items_flex_start sec4_1">
				<div class="col col_xs_12 col_sm_12 col_md_5 col_lg_5 col_left">
					<h3 class="tx_blind">MEDI-TEK</h3>
					<div class="info_text">
						<div class="tx_number">01</div>
						<div class="tx_sector">MEDI-TEK</div>
						<div class="tx_title ft_cont_tit">세계 최초 최첨단<br />의료 기기 개발</div>
						<div class="sec4_swiper_pagination"></div>
					</div>
				</div>
				<div class="col col_xs_12 col_sm_12 col_md_12 col_right">
					<div class="sec4_1_swiper swiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="slide_card">
									<div class="card_img">
										<img src="/resources/images/intro/home/sec4/sec4_card_img1.png" alt="" />
									</div>
									<div class="card_info">
										<div class="tx_title">전자약</div>
										<div class="tx_summary">손상없이, 후유증없이</div>
										<div class="tx_resDate">2024년 출시 예정</div>
										<div class="img_author">
											<img src="/resources/images/intro/home/sec4/img_author1.png" alt="" />
										</div>
										<div class="tx_author_position">product leader</div>
										<div class="tx_author_info">노형태 CEO</div>
										<div class="tx_author_addinfo">이엘치과 대표원장, 서울과학고, 포항공대 생명과학과, 부산대 치과대학, 가톨릭대 치의학대학원</div>
									</div>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="slide_card">
									<div class="card_img">
										<img src="/resources/images/intro/home/sec4/sec4_card_img2.png" alt="" />
									</div>
									<div class="card_info">
										<div class="tx_title">디지털 치료제 및 치료기기</div>
										<div class="tx_summary">홈케어 및 디지털 헬스케어</div>
										<div class="tx_resDate">2023년 출시 예정</div>
										<div class="img_author">
											<img src="/resources/images/intro/home/sec4/img_author2.png" alt="" />
										</div>
										<div class="tx_author_position">product leader</div>
										<div class="tx_author_info">이성만 CTO</div>
										<div class="tx_author_addinfo">티맥스소프트, kt ds, 에누리닷컴, 하나금융융합기술원 AI/DT 본부장</div>
									</div>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="slide_card">
									<div class="card_img">
										<img src="/resources/images/intro/home/sec4/sec4_card_img3.png" alt="" />
									</div>
									<div class="card_info">
										<div class="tx_title">뼈 이식재</div>
										<div class="tx_summary">바이오세라믹 기술을 활용한</div>
										<div class="tx_resDate">2023년 하반기 출시 예정</div>
										<div class="img_author">
											<img src="/resources/images/intro/home/sec4/img_author3.png" alt="" />
										</div>
										<div class="tx_author_position">product leader</div>
										<div class="tx_author_info">김상일 CMO</div>
										<div class="tx_author_addinfo">現 서울시립대학교 신소재공학과 교수, 삼성전자 종합기술원 전문연구원, 美국립고자기장연구소 연구원</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- MEDI-STORE -->
			<div class="row col_gap_16 align_items_flex_start sec4_2">
				<div class="col col_xs_12 col_sm_12 col_md_5 col_lg_5 col_left">
					<h3 class="tx_blind">MEDI-STORE</h3>
					<div class="info_text">
						<div class="tx_number">02</div>
						<div class="tx_sector">MEDI-STORE</div>
						<div class="tx_title ft_cont_tit"><em>3,700개의 병원</em>이 선택한<br />의료기기 구매 플랫폼</div>
					</div>
				</div>
				<div class="col col_xs_12 col_sm_12 col_md_7 col_lg_7 col_right">
					<div class="sec4_2_intro">
						<div class="img_intro"><img src="/resources/images/intro/home/sec4/sec4_2.png" alt="" /></div>
						<div class="tx_title">MV재료</div>
						<div class="tx_summary">국내 최초 실시간 가격비교,<br class="hidden_sm" /> 구매 리드타임을 줄이다</div>
						<a href="https://www.medivalue.co.kr" class="btn_link hidden_xs" target="_blank">MV재료 바로가기</a>
					</div>
					<div class="sec4_2_withus">
						<div class="withus_text">
							<div class="withus_tx_left">
								<div class="tx_title">디지털 의료환경의<br />미래를 함께 준비합니다</div>
								<div class="tx_summary">전국 17개 치과의사 협회가 함께 합니다</div>
							</div>
							<div class="withus_tx_right">
								<button class="btn_allview">전체보기</button>
							</div>
						</div>
						<ul class="withus_list">
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list1.png" alt="강남구 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list2.png" alt="서울여자 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list3.png" alt="인천시 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list4.png" alt="강동구 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list5.png" alt="강서구 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list6.png" alt="구로구 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list7.png" alt="관악구 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list8.png" alt="도봉구 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list9.png" alt="동작구 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list10.png" alt="부천시 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list11.png" alt="서초구 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list12.png" alt="수원시 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list13.png" alt="안양시 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list14.png" alt="양천구 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list15.png" alt="은평구 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list16.png" alt="중구 치과의사회" /></a></li>
							<li><a href="#" class=""><img src="/resources/images/intro/home/sec4/sec4_2_list17.png" alt="충남 치과의사회" /></a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- MEDI-CUBE -->
			<div class="row col_gap_16 align_items_flex_start sec4_3">
				<div class="col col_xs_12 col_sm_12 col_md_5 col_lg_5 col_left">
					<h3 class="tx_blind">MEDI-CUBE</h3>
					<div class="info_text">
						<div class="tx_number">03</div>
						<div class="tx_sector">MEDI-CUBE</div>
						<div class="tx_title ft_cont_tit">의료서비스와<br class="hidden_sm"/> 병원운영의 혁신<br /><em>AI 의료 솔루션</em></div>
					</div>
				</div>
				<div class="col col_xs_12 col_sm_12 col_md_7 col_lg_7 col_right">
					<div class="sec4_3_intro">
						<div class="img_intro"><img src="/resources/images/intro/home/sec4/sec4_3_1.png" alt="" /></div>
						<div class="tx_title">MV기공</div>
						<div class="tx_summary">디지털 덴티스트리의 시작,<br class="hidden_sm"/> 디지털로 만나는 기공의뢰</div>
						<a href="https://dt.medivalue.co.kr" target="_blank" class="btn_link hidden_xs">MV기공 바로가기</a>
					</div>
					<div class="sec4_3_solution">
						<div class="tx_title"><em>AI로 만든</em> 병원운영 솔루션</div>
						<div class="tx_summary">병원 운영의 혁신을 통해,<br class="hidden_sm"/> 환자 건강관리를 선도하다</div>
						<div class="tx_resDate">2023년 출시 예정</div>
						<div class="img_solution"><img src="/resources/images/intro/home/sec4/sec4_3_2.png" alt="" /></div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="section section_5">
		<div class="container">
			<div class="ft_main_tit">의료 환경의<br />시작부터 끝까지</div>
		</div>
	</section>

	<section class="section section_6">
		<h2 class="tx_blind">MEDIVALUE with us</h2>
		<div class="video_wrap">
			<video loop muted poster="/resources/mp4/intro/poster/1-1_1.jpg"><source src="/resources/mp4/intro/1-1_1.mp4" type="video/mp4"></video>
		</div>
		<div class="container">
			<div class="row col_gap_16 sec6_row">
				<div class="col col_xs_12 col_sm_12 col_md_5 col_lg_5 col_left">
					<div class="info_text">
						<div class="tx_title">의료환경의 혁신을<br />위해 함께 연구합니다</div>
						<div class="sec6_swiper_nav">
							<div class="sec6_swiper_prev"></div>
							<div class="sec6_swiper_next"></div>
						</div>
					</div>
				</div>
				<div class="col col_xs_12 col_sm_12 col_md_12 col_right">
					<div class="sec6_swiper swiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="slide_card">
									<div class="card_img">
										<img src="/resources/images/intro/home/sec6/sec6_logo1.png" alt="" />
									</div>
									<div class="card_info">
										<div class="tx_content">
											Collaborative research with Hanyang University’s Department of Artificial Intelligence<br /><br />
											Development of a blockchain-based medical document system<br /><br />
											Development of an artificial intelligence search system
										</div>
									</div>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="slide_card">
									<div class="card_img">
										<img src="/resources/images/intro/home/sec6/sec6_logo2.png" alt="" />
									</div>
									<div class="card_info">
										<div class="tx_content">
											Korea University Institute of Artificial Intelligence<br /><br />
											Development of Medical Material Purchase Pattern Algorithm<br /><br />
											Development of Medical Consumer Sentiment Analysis Algorithm
										</div>
									</div>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="slide_card">
									<div class="card_img">
										<img src="/resources/images/intro/home/sec6/sec6_logo3.png" alt="" />
									</div>
									<div class="card_info">
										<div class="tx_content">
											The University of seoul Materials Research Institute<br /><br />
											Synthesis of bio-ceramic materials<br /><br />
											Synthesis of bio-medical materials
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="section section_7">
		<div class="container">
			<div class="row align_items_flex_start">
				<div class="col col_xs_12 col_sm_12 col_md_6 col_lg_5 col_left">
					<div class="info_text">
						<div class="ft_row_tit"><small>모든 사람들이</small>디지털 의료 혁신의<br />혜택을 받을 수 있게</div>
						<a href="/mobile/about" class="btn_link">메디밸류 소개 바로가기</a>
					</div>
				</div>
				<div class="col col_xs_12 col_sm_12 col_md_6 col_lg_7 col_right">
					<div class="overlap_obj">
						<div class="obj_back">
							<div class="video_wrap"><video loop muted poster="/resources/mp4/intro/poster/1-2.jpg"><source src="/resources/mp4/intro/1-2.mp4" type="video/mp4"></video></div>
						</div>
						<div class="obj_front"><img src="/resources/images/intro/home/sec7/sec7_img.png" alt="" /></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="mv_contact_us">
		<div class="container">
			<div class="ft_row_tit">Contact us</div>
			<div class="ft_cont_summ">
				메디밸류에 대해 더 궁금하신가요?<br />
				여러분이 궁금한 내용에 대해 어떤 것이든 질문해 주세요.
			</div>
			<a href="https://mail.google.com/mail/u/0/?fs=1&tf=cm&source=mailto&to=info@medivalue.co.kr" target="_blank" class="btn_link">Contact us</a>
		</div>
	</div>
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
<div class="obj_items hidden_xs">
	<div class="obj_item obj_item_1"><img src="/resources/images/intro/sec_bg_left.png"></div>
	<div class="obj_item obj_item_2"><img src="/resources/images/intro/sec_bg_left.png"></div>
	<div class="obj_item obj_item_3"><img src="/resources/images/intro/sec_bg_right.png"></div>
	<div class="obj_item obj_item_4"><img src="/resources/images/intro/sec_bg_right.png"></div>
	<!--
    <div class="plx plx_type_item obj_bg_1" data-plxtype="item" data-plxspeed="0.7" ><img src="/resources/images/intro/home/sec_bg_left.png"></div>
    <div class="plx plx_type_item obj_bg_2" data-plxtype="item" data-plxspeed="0.5" ><img src="resources/images/intro/home/sec_bg_left.png"></div>
    <div class="plx plx_type_item obj_bg_3" data-plxtype="item" data-plxspeed="0.8" ><img src="/resources/images/intro/home/sec_bg_right.png"></div>
    <div class="plx plx_type_item obj_bg_4" data-plxtype="item" data-plxspeed="0.6" ><img src="/resources/images/intro/home/sec_bg_right.png"></div>
    -->
</div>
<script>
	// 협력리스트 더보기
	$('.sec4_2_withus .btn_allview').on('click', function(){
		$('.withus_list li').fadeIn();
	});
	// sec4  title fixed
	$(".section_4 .row").each(function (index, item) {
		let variable_space = 80;
		$(window).on("scroll load", function () {
			let elemTop = Math.floor($(item).offset().top);
			let elemBottom =
					elemTop +
					$(item).outerHeight() -
					$(item).find(".info_text").outerHeight();
			let docViewTop = Math.floor($(window).scrollTop()) + variable_space;

			if (elemTop <= docViewTop && elemBottom >= docViewTop) {
				$(item).find(".info_text").addClass("fixed_obj");
			} else {
				$(item).find(".info_text").removeClass("fixed_obj");
			}
			if (elemBottom < docViewTop) {
				$(item)
						.find(".info_text")
						.css(
								"top",
								$(item).outerHeight() - $(item).find(".info_text").outerHeight()
						);
			} else {
				$(item).find(".info_text").attr("style", "");
			}
		});
	});

	// sec4  arrow fixed
	$(window).on("scroll load", function () {
		let variable_space = 80;
		let arrow = $(".sec4_arrow .icon_arrow");
		let docViewTop = Math.floor($(window).scrollTop()) + variable_space;

		let elemTop = Math.floor($(".sec4_arrow").offset().top);
		let elemBottom = elemTop + $(".sec4_arrow").outerHeight() - 80;

		if (elemTop <= docViewTop && elemBottom >= docViewTop) {
			arrow.addClass("fixed_obj");
		} else {
			arrow.removeClass("fixed_obj");
		}
		if (elemBottom < docViewTop) {
			arrow.css("top", $(".sec4_arrow").outerHeight() - 40);
		} else {
			arrow.attr("style", "");
		}
	});

	// sec4_1 swiper
	let sec4_swiper_menu = ["전자약", "디지털 치료기기", "뼈 이식재"];
	const sec4_swiper = new Swiper(".sec4_1_swiper", {
		loop: true,
		speed: 400,
		autoplay: {
			delay: 3000,
		},
		pagination: {
			el: ".sec4_swiper_pagination",
			clickable: true,
			renderBullet: function (index, className) {
				return (
						'<div class="' +
						className +
						'"><span class="tx_pagination">' +
						sec4_swiper_menu[index] +
						"</span></div>"
				);
			},
		},
		breakpoints: {
			0: {
				slidesPerView: 1.2,
				centeredSlides: true,
				spaceBetween: 20,
			},
			360: {
				slidesPerView: 1.3,
				centeredSlides: true,
				spaceBetween: 20,
			},
			768: {
				slidesPerView: 2,
				centeredSlides: true,
				spaceBetween: 20,
			},
			992: {
				slidesPerView: 3,
				spaceBetween: 80,
			},
		},
	});

	const sec6_swiper = new Swiper(".sec6_swiper", {
		loop: true,
		speed: 400,
		navigation: {
			nextEl: ".sec6_swiper_next",
			prevEl: ".sec6_swiper_prev",
		},
		breakpoints: {
			0: {
				slidesPerView: 1.2,
				spaceBetween: 20,
			},
			360: {
				slidesPerView: 1.2,
				spaceBetween: 20,
			},
			768: {
				initialSlide: 1,
				slidesPerView: 2,
				centeredSlides: true,
				spaceBetween: 20,
			},
			992: {
				slidesPerView: 3,
				spaceBetween: 80,
			},
		},
	});
</script>
<div class="popup popup_intro">
	<div class="dimm"></div>
	<div class="popup_cont">
		<img src="/resources/images/intro/home/img_popup.jpg" alt="" />
		<button type="button" class="btn_close_popup">확인</button>
	</div>
</div>
<script>
	$('.btn_close_popup').on('click', function(){
		$(this).parents('.popup').fadeOut(function(){ $(this).remove(); })
	})
</script>
</body>
</html>