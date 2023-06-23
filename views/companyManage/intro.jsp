<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame2>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/slick.css"/>
		<link rel="stylesheet" href="/resources/css/main.css?v=20220707"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&display=swap" rel="stylesheet">
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/slick.min.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>		
		<script type="text/javascript" src="/resources/js/main.js"></script>
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>		
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript">
			$(function(){
				$(".slide_func > ul").slick({
					slidesToShow: 1,
					slidesToScroll: 1,
					infinite: true,
					autoplay: true,
					autoplaySpeed: 4000,
					swipe: false,
					fade: true,
					arrows: false,
					dots: true,
					customPaging : function(slider, i) {
				          var thumb = $(slider.$slides[i]).find('.nav');
				          return thumb;
				     }
				});
				
				$(".accordion_qna li > div > a").click(function(){
					if($(this).parents("li").hasClass("on")){
						$(".accordion_qna li").removeClass("on");
						$(".accordion_qna li .sub").stop().slideUp(300);
						$(this).siblings(".sub").stop().slideUp(300);
					}else{
						$(".accordion_qna li").removeClass("on");
						$(".accordion_qna li .sub").stop().slideUp(300);
						$(this).parents("li").addClass("on");
						$(this).siblings(".sub").stop().slideDown(300);
					}
				});
				atcClassOn();
			});
			
			$(window).scroll(function(){
				atcClassOn();
			});
			
			function atcClassOn(){
				var scrollY = $(window).scrollTop();
				var windowH = $(window).height();
				var prevNum = windowH / 1.5;
				
				var atcVideoY = $(".atc_video").offset().top;
				var atcStoreY = $(".atc_store").offset().top;
				var atcManageY = $(".atc_management").offset().top;
				var atcNeedsY = $(".atc_needs").offset().top;
				var atcFunctionY = $(".atc_function").offset().top;
				var atcQnaY = $(".atc_qna").offset().top;
				var atcLinkY = $(".atc_link").offset().top;
				var atcBannerY = $(".atc_banner").offset().top;
				
				$(".atc_video").addClass("on");
				
				if(scrollY > atcStoreY - prevNum){
					$(".atc_store").addClass("on");
				}
				if(scrollY > atcManageY - prevNum){
					$(".atc_management").addClass("on");
				}
				if(scrollY > atcNeedsY - prevNum){
					$(".atc_needs").addClass("on");
				}
				if(scrollY > atcFunctionY - prevNum){
					$(".atc_function").addClass("on");
				}
				if(scrollY > atcQnaY - prevNum){
					$(".atc_qna").addClass("on");
				}
				if(scrollY > atcLinkY - prevNum){
					$(".atc_link").addClass("on");
				}
				if(scrollY > atcBannerY - prevNum){
					$(".atc_banner").addClass("on");
				}
			}
			
			function scrollAnchor2(id){
				var scrollY = $(window).scrollTop();
				var headHeight = $("#header .hd_wrap").height();
				var anchorTop = $("."+id).offset().top;
				var thisTop = anchorTop - headHeight;
				var thisTop2 = anchorTop - headHeight*2;
				if(scrollY > 0){
					$("html, body").stop().animate({
						scrollTop : thisTop
					}, 300);
				}else{
					$("html, body").stop().animate({
						scrollTop : thisTop2
					}, 300);
				}
			}
			
			<%-- 메뉴 폰트 컬러 적용 --%>
			$(function(){
				$("#header .btm .area .real_area #gnb ul li:nth-child(5)").addClass("color_blue");
			});
			
		</script>
	</jsp:attribute>
	<jsp:body>
		<style>
			@font-face {
			    font-family: 'GmarketSansBold';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			.font_gbatang{font-family: 'Gowun Batang';}
			.font_gsans{font-family: 'GmarketSansBold';}
		</style>
		<section id="intro" class="sub">
			<article class="atc_video">
				<div class="video">
					<video loop autoplay muted>
						<source src="/resources/mp4/vod_intro.mov" type="video/mp4">
						<!-- <source src="/resources/mp4/vod_intro.mp4" type="video/mp4"> -->
					</video>
					<div class="masking"></div>
				</div>
				<div class="text">
					<div class="desc">디지털 의료 인프라<br>혁신을 선도하는</div>
					<div class="tit">메디밸류</div>
				</div>
				<div class="control">
					<a href="javascript:;" onclick="scrollAnchor2('atc_store');">
						<div class="arrow"></div>
						<div class="arrow"></div>
						<div class="arrow"></div>
					</a>
				</div>
			</article>
			<article class="atc_store">
				<div class="text">
					<div class="title font_gsans">medivalue</div>
					<div class="desc">메디밸류는 기술력과 데이터를 바탕으로 의료환경의 미래를 준비합니다.</div>
				</div>
				<div class="inner">
					<div class="gall_list">
						<ul>
							<li>
								<div>
									<div class="img">
										<img src="/resources/images/sub/ico_intro_store_01.png" alt="" />
									</div>
									<div class="txt">
										<p class="tit">Data-feeding system</p>
										<p class="desc">의료재료 데이터<br>피딩 시스템 구축</p>
									</div>
								</div>
							</li>
							<li>
								<div>
									<div class="img">
										<img src="/resources/images/sub/ico_intro_store_02.png" alt="" />
									</div>
									<div class="txt">
										<p class="tit">하이테크 바이오 소재</p>
										<p class="desc">고품질 재료를, 경제적인 가격에<br>바이오 신소재 개발</p>
									</div>
								</div>
							</li>
							<li>
								<div>
									<div class="img">
										<img src="/resources/images/sub/ico_intro_store_03.png" alt="" />
									</div>
									<div class="txt">
										<p class="tit">가격비교 플랫폼</p>
										<p class="desc">의료재료 실시간 가격비고와<br>최저가 구매 스토어 제공</p>
									</div>
								</div>
							</li>
							<li>
								<div>
									<div class="img">
										<img src="/resources/images/sub/ico_intro_store_04.png" alt="" />
									</div>
									<div class="txt">
										<p class="tit">병원 운영 자동화 솔루션</p>
										<p class="desc">인공지능을 통한<br>병원 운영 자동화 솔루션 제공</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</article>
			<article class="atc_management">
				<div class="text">
					<div class="title">최고의 전문가들이 만들어가는 의료 인프라 혁신</div>
					<div class="desc">
						타사에서도 메디밸류와 같은 최신 디지털 의료 인프라를 구축하려고 노력했지만, 기술적 기능 구현이 불가하여 중도 포기했습니다. 하지만 메디밸류는 가능합니다.
					</div>
				</div>
				<div class="inner">
					<div class="ceo">
						<div class="tit"><p class="font_gbatang">의료의 시작과 끝까지 모두가<br>편리할 수 있도록 연구하겠습니다.</p></div>
						<div class="name font_gbatang">CEO 노형태</div>
						<div class="history"></div>
					</div>
					<div class="manage_list col4 sty1">
						<ul>
							<li>
								<div>
									<div class="name">
										<span class="tit">이성만</span>
										<span class="sub">CTO</span>
									</div>
									<div class="history">티맥스소프트, kt ds, 에누리닷컴,<br>하나금융융합기술원 AI/DT 본부장</div>
									<div class="desc">차별화된 기술력으로<br>혁신적인 디지털 헬스케어 환경을<br>만들어 갑니다.</div>
								</div>
							</li>
							
							
							<li>
								<div>
									<div class="name">
										<span class="tit">김상일</span>
										<span class="sub">CMO</span>
									</div>
									<div class="history">서울과학고, KAIST,<br>UW-Madison. Ph.D</div>
									<div class="desc">기술을 통해 가치를 제공할 수<br>있도록 노력하겠습니다.</div>
								</div>
							</li>
							<li>
								<div>
									<div class="name">
										<span class="tit">김성민</span>
										<span class="sub">COO</span>
									</div>
									<div class="history">국민대학교 MBA</div>
									<div class="desc">기술이 의료환경을 이끌 수<br>있는 미래를 위해 노력하겠습니다.</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="manage_list col4 sty2">
						<ul>
							<li>
								<div>
									<div class="name">
										<span class="tit">석준희</span>
										<span class="sub">연구총괄</span>
									</div>
									<div class="history">서울과학고, Stanford Univ,<br>Ph.D 고려대학교 인공지능 센터장</div>
									<div class="desc">기술 혁신이 가져올의료환경의<br>변화를 꿈꾸고 있습니다.</div>
								</div>
							</li>
							<li>
								<div>
									<div class="name">
										<span class="tit">김영훈</span>
										<span class="sub">Advisory prof.</span>
									</div>
									<div class="desc">서울과학고, 서울대학교,<br>Ph.D, 한양대학교 교수</div>
								</div>
							</li>
						</ul>
					</div>
					<%--
					<div class="manage_list2 col3 sty2">
						<ul style="text-align:center;">
							<li style="display: inline-block;">
								<div>
									<div class="name">
										<span class="tit">김영훈</span>
										<span class="sub">Advisory prof.</span>
									</div>
									<div class="history">서울과학고, 서울대학교,<br>Ph.D, 한양대학교 교수</div>
								</div>
							</li>
						</ul>
					</div>
					--%>
				</div>
			</article>
			<article class="atc_needs">
				<div class="text">
					<div class="title">원장님들의 니즈로 만들어진 플랫폼</div>
				</div>
				<div class="inner">
					<div class="gall_list">
						<ul>
							<li>
								<div>
									<div class="img">
										<img src="/resources/images/sub/ico_intro_needs_01.png" alt="" />
									</div>
									<div class="txt">
										<p class="tit">최저가</p>
										<p class="desc">메디밸류에서 최저가로<br>재료를 구매하세요.</p>
									</div>
								</div>
							</li>
							<li>
								<div>
									<div class="img">
										<img src="/resources/images/sub/ico_intro_needs_02.png" alt="" />
									</div>
									<div class="txt">
										<p class="tit">가격비교</p>
										<p class="desc">다양한 업체들의<br>가격을 비교해보세요.</p>
									</div>
								</div>
							</li>
							<li>
								<div>
									<div class="img">
										<img src="/resources/images/sub/ico_intro_needs_03.png" alt="" />
									</div>
									<div class="txt">
										<p class="tit">A/S</p>
										<p class="desc">오프라인에서 받던<br>치과장비 A/S를 받아보세요.</p>
									</div>
								</div>
							</li>
							<li>
								<div>
									<div class="img">
										<img src="/resources/images/sub/ico_intro_needs_04.png" alt="" />
									</div>
									<div class="txt">
										<p class="tit">다양한 이벤트</p>
										<p class="desc">메디밸류에서 준비한<br>특가/이벤트를 만나보세요.</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="needs_list">
						<ul>
							<li>
								<div class="txt">
									<div class="num">01</div>
									<div class="tit">최저가 맞춤 견적</div>
									<div class="desc">
										재료상에게 특정 온라인 업체에 가격을 맞춰달라고 노래를 부르는데, 어느새 가격이 올라있는 것들도 있었어요. AS때문에 어쩔수 없어 말도 못하고 있었는데, 이제 가격의 <strong>기준을 맞춰서 견적</strong>을 받아보고 있으니 좋습니다.</div>
									<div class="name">동탄 T치과 Y원장</div>
								</div>
								<div class="img img01"></div>
							</li>
							<li class="dark">
								<div class="img img02"></div>
								<div class="txt">
									<div class="num">02</div>
									<div class="tit">가격비교</div>
									<div class="desc">
										매번 사야하는 재료 목록이 20종류가 넘었어요. 코로나로 비용을 아껴 보려고 각 사이트를 돌아다니다가 알리익스프레스까지 확인하고 다녔는데, 이곳에서 한번에 비교하니 <strong>시간과 노력이 매우 절약</strong>되네요.
									</div>
									<div class="name">서울 G치과 J원장</div>
								</div>
							</li>
							<li>
								<div class="txt">
									<div class="num">03</div>
									<div class="tit">쉽고 빠른 치과장비 A/S</div>
									<div class="desc">
										오프라인은 재료비용이 비싸 온라인몰 위주로 구매를 하다보니 치과장비에 문제가 생겼을 때 제조사 a/s를 받을 수 밖에 없었는데 느리고 불친절한 대응에 불만이 많이 있었습니다. 메디밸류에서 오프라인 a/s까지 서비스를 해줘 제조사 a/s 대응이 느릴때 <strong>쉽고 빠르게 치과장비 문제를 해결</strong>하고 있습니다.
									</div>
									<div class="name">서울 P치과 S원장</div>
								</div>
								<div class="img img03"></div>
							</li>
							<li class="dark">
								<div class="img img04"></div>
								<div class="txt">
									<div class="num">04</div>
									<div class="tit">다양한 이벤트</div>
									<div class="desc">
										각 온라인 업체의 이벤트가 모아져 있고, <strong>특가나 무료상품</strong>까지 있으니 매일 전시회가 열리는 기분이라고 할까요? 직원이 필요한 물건이 있다고 하면 일단 여기부터 확인하고 있습니다.</div>
									<div class="name">김해 L치과 L원장</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</article>
			<article class="atc_function" style="display:none;">
				<%--<div class="text">
					<div class="title">메디밸류 주요기능</div>
				</div>
				<div class="inner">
					<div class="slide_func">
						<ul>
							<li>
								<div>
									<div class="img">
										<img src="/resources/images/sub/img_func_01.png" alt="" />
									</div>
									<div class="txt">
										<p class="tit">25,000여종의 같은 제품 다른 가격을<br>직접 확인해 보세요.</p>
										<p class="subtit">가격비교 방법</p>
										<p class="desc">메인 홈페이지에서 제품명 검색하세요  →  가격비교 선택 → 제품의 사이트별 가격을 비교하세요.</p>
									</div>
									<div class="nav">가격비교</div>
								</div>
							</li>
							<li>
								<div>
									<div class="img">
										<img src="/resources/images/sub/img_func_02.png" alt="" />
									</div>
									<div class="txt">
										<p class="tit">실시간 가격 비교와 함께 온오프라인<br>최저가 구매가 가능한 스토어를 만나보세요.</p>
										<p class="subtit"></p>
										<p class="desc">메디밸류가 실시간으로 분석해 온오프라인 최저가로 구매기회를 제공합니다.<br>최저가를 제안하는 메디밸류 스토어에서 빠르게 만나보세요.</p>
									</div>
									<div class="nav">최저가</div>
								</div>
							</li>
							<li>
								<div>
									<div class="img">
										<img src="/resources/images/sub/img_func_03.png" alt="" />
										<div class="ani_box">
											<div class="line"></div>
											<div class="line"></div>
											<div class="line"></div>
											<div class="line"></div>
										</div>
									</div>
									<div class="txt">
										<p class="tit">평균 경력 15년 이상의 A/S팀의 빠르고<br>신속한 대응을 받아보세요.</p>
										<p class="subtit">A/S 신청 방법</p>
										<p class="desc">1. 홈페이지 우측 하단의 채널 톡으로 A/S 신청<br>2. 상황에 맞는 A/S를 메디밸류가 진단하여 A/S를 직접수리, 수리접수 대행등을 접수<br>3. 평균 경력 15년 이상의 A/S팀의 빠르고 신속한 대응</p>
									</div>
									<div class="nav">A/S제공</div>
								</div>
							</li>
							<li>
								<div>
									<div class="img">
										<img src="/resources/images/sub/img_func_03.png" alt="" />
										<div class="ani_box">
											<div class="line"></div>
											<div class="line"></div>
											<div class="line"></div>
											<div class="line"></div>
										</div>
									</div>
									<div class="txt">
										<p class="tit">복잡하고 어려운 제품명을<br>쉽게 검색하세요.</p>
										<p class="subtit"></p>
										<p class="desc">의료재료 데이터(이미지/텍스트) 피딩 시스템 구축으로<br>원하시는 제품을 쉽게 만나보세요.</p>
									</div>
									<div class="nav">손쉬운 검색</div>
								</div>
							</li>
							<li>
								<div>
									<div class="img">
										<img src="/resources/images/sub/img_func_05.png" alt="" />
									</div>
									<div class="txt">
										<p class="tit">이미 수많은 클리닉에서<br>메디밸류 솔루션을 이용하고 있습니다.</p>
										<p class="subtit"></p>
										<p class="desc">2021년 6월 런칭 이후 5개월 만에 1,300곳 이상의 클리닉이<br>메디밸류 솔루션을 통해 다양한 서비스를 제공받고 있습니다.</p>
									</div>
									<div class="nav">솔루션 제공</div>
								</div>
							</li>
						</ul>
					</div>
				</div>--%>
			</article>
			<article class="atc_banner" style="display:none;">
				<%--<div class="text">
					<div class="title">진행중인 이벤트</div>
				</div>
				<div class="img">
					<img src="/resources/images/main/img_visual_slide02.jpg?v20211206">
					<a href="/product/smallEquipment" class="btn_link"></a>
				</div>--%>
			</article>
			<article class="atc_qna">
				<div class="text">
					<div class="title">자주 묻는 질문과 답변</div>
				</div>
				<div class="inner">
					<div class="accordion_qna">	
						<ul>
							<li>
								<div>
									<a href="javascript:;">가격비교를 어떻게 하나요?</a>
									<div class="sub">
										<p>메디밸류의 검색창을 이용하여 비교하고자 하는 제품을 검색한 후에 가격비교 탭을 클릭하면 실시간 가격비교가 가능합니다.</p>
									</div>
								</div>
							</li>
							<li>
								<div>
									<a href="javascript:;">메디밸류 서비스 이용은 어떻게 하나요?</a>
									<div class="sub">
										<p>메디밸류 홈페이지의 회원가입 후 승인처리가 되면 바로 이용 가능합니다.</p>
									</div>
								</div>
							</li>
							<li>
								<div>
									<a href="javascript:;">메디밸류 서비스 이용료는 어떻게 되나요?</a>
									<div class="sub">
										<p>무료입니다.</p>
									</div>
								</div>
							</li>
							<li>
								<div>
									<a href="javascript:;">최저가 구매가 가능하다고 하는데 나중에 가격이 올라가는 거 아닌가요? </a>
									<div class="sub">
										<p>가격비교 서비스를 기본적으로 제공하고 있기때문에 다른 자사몰들과는 달리 최저가 신고 보상제도를 운영하지 않더라도 항시 최저가임을 확인하실 수 있습니다.</p>
									</div>
								</div>
							</li>
							<li>
								<div>
									<a href="javascript:;">A/S는 어디까지 해주시는 건가요?</a>
									<div class="sub">
										<p>아쉽게도 현재 서울 및 수도권에 치과장비 A/S를 제공하고 있으며, 기존 오프라인 재료업체에게 받으시던 대부분의 A/S를 제공합니다. 수도권 외 지역은 순차적으로 A/S 범위를 확대하겠습니다.</p>
									</div>
								</div>
							</li>
							<li>
								<div>
									<a href="javascript:;">A/S 비용은 어떻게 되나요?</a>
									<div class="sub">
										<p>무료입니다. 제품 수리시 발생하는 재료비만 고객분들의 승인 후 수리 및 비용이 발생합니다.</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</article>
			<article class="atc_link">
				<!-- <div class="video">
					<video loop autoplay muted>
						<source src="/resources/mp4/vod_intro_link.mp4" type="video/mp4">
					</video>
				</div> -->
				<div class="img">
					<img src="/resources/images/sub/img_intro_link_01.jpg" alt="" class="img01" />
					<img src="/resources/images/sub/img_intro_link_02.jpg" alt="" class="img02" />
				</div>
				<div class="inner">
					<div class="text">
						<div class="title">최저가 구매가 가능한 메디밸류 입니다.</div>
						<div class="desc">
							원장님들과 직원분들 모두 행복한 치과가 될 수 있도록<br>메디밸류가 함께 하겠습니다.
						</div>
					</div>
					<div class="button">
						<a href="/">메디밸류 만나보기 &#10095;</a>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame2>