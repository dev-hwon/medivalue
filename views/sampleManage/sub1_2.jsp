<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css" />
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
		<script type="text/javascript" src="/resources/js/sub1.js"></script>
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub1_2" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area clear">
						<div class="left_filter">
							<div class="wrap">
								<ul class="depth1">
									<li class="filter_1">
										<div class="filter_tit clear">
											<h4>카테고리</h4>
											<button class="updown"><img src="/resources/images/main/filter_up.png" width="12" height="8" border="0" alt="" /></button>
										</div>
										
										<div class="d2_wrap">
											<ul class="depth2">
												<li>
													<input id="filt1_chk1" type="checkbox">
													<label for="filt1_chk1">임플란트</label>
												</li>
												
												<li>
													<input id="filt1_chk2" type="checkbox">
													<label for="filt1_chk2">인상재</label>
												</li>
												
												<li>
													<input id="filt1_chk3" type="checkbox">
													<label for="filt1_chk3">시멘트</label>
												</li>
	
												<li>
													<input id="filt1_chk4" type="checkbox">
													<label for="filt1_chk4">시멘트</label>
												</li>
	
												<li>
													<input id="filt1_chk5" type="checkbox">
													<label for="filt1_chk5">시멘트</label>
												</li>
	
												<li>
													<input id="filt1_chk6" type="checkbox">
													<label for="filt1_chk6">시멘트</label>
												</li>
	
												<li>
													<input id="filt1_chk7" type="checkbox">
													<label for="filt1_chk7">시멘트</label>
												</li>
	
												<li>
													<input id="filt1_chk8" type="checkbox">
													<label for="filt1_chk8">시멘트</label>
												</li>
											</ul>
											
											<button class="more_view">더보기<img src="/resources/images/main/filter_down.png" width="9" height="5" border="0" alt="" /></button>
											<button class="full_view">전체보기<img src="/resources/images/main/filter_view.png" width="5" height="9" border="0" alt="" /></button>
	
											<div class="filt_popup filter_1_popup">
												<div class="filter_pu_tit">
													<h5>카테고리 전체</h5>
												</div>
	
												<div class="filter_pu_txt">
													<ul class="clear">
														<li>
															<input id="f1Chk1" type="checkbox">
															<label for="f1Chk1">인상재</label>
														</li>
	
														<li>
															<input id="f1Chk2" type="checkbox">
															<label for="f1Chk2">시멘트</label>
														</li>
	
														<li>
															<input id="f1Chk3" type="checkbox">
															<label for="f1Chk3">근관재</label>
														</li>
	
														<li>
															<input id="f1Chk4" type="checkbox">
															<label for="f1Chk4">레진/본딩/에칭</label>
														</li>
	
														<li>
															<input id="f1Chk5" type="checkbox">
															<label for="f1Chk5">바(Bur)/연마재</label>
														</li>
	
														<li>
															<input id="f1Chk6" type="checkbox">
															<label for="f1Chk6">트레이/스케일러팁</label>
														</li>
	
														<li>
															<input id="f1Chk7" type="checkbox">
															<label for="f1Chk7">위생/소독/멸균</label>
														</li>
	
														<li>
															<input id="f1Chk8" type="checkbox">
															<label for="f1Chk8">템포관련/덴쳐</label>
														</li>
	
														<li>
															<input id="f1Chk9" type="checkbox">
															<label for="f1Chk9">수술재료/마취</label>
														</li>
	
														<li>
															<input id="f1Chk10" type="checkbox">
															<label for="f1Chk10">스톤/석고</label>
														</li>
	
														<li>
															<input id="f1Chk11" type="checkbox">
															<label for="f1Chk11">아말감/GI</label>
														</li>
	
														<li>
															<input id="f1Chk12" type="checkbox">
															<label for="f1Chk12">기타 치과 재료</label>
														</li>
	
														<li>
															<input id="f1Chk13" type="checkbox">
															<label for="f1Chk13">치과기구</label>
														</li>
	
														<li>
															<input id="f1Chk14" type="checkbox">
															<label for="f1Chk14">마스크/글러브/석션</label>
														</li>
	
														<li>
															<input id="f1Chk15" type="checkbox">
															<label for="f1Chk15">임플란트</label>
														</li>
	
														<li>
															<input id="f1Chk16" type="checkbox">
															<label for="f1Chk16">치과기구</label>
														</li>
	
														<li>
															<input id="f1Chk17" type="checkbox">
															<label for="f1Chk17">마스크/글러브/석션</label>
														</li>
	
														<li>
															<input id="f1Chk18" type="checkbox">
															<label for="f1Chk18">임플란트</label>
														</li>
													</ul>
												</div>
	
												<div class="filter_pu_close">
													<button>닫기</button>
												</div>
											</div>
										</div>
									</li>
						
									<li class="filter_2">
										<div class="filter_tit clear">
											<h4>종류</h4>
											<button class="updown"><img src="/resources/images/main/filter_up.png" width="12" height="8" border="0" alt="" /></button>
										</div>
										
										<div class="d2_wrap">
											<ul class="depth2">
												<li>
													<input id="filt2_chk1" type="checkbox">
													<label for="filt2_chk1">임플란트 엔진</label>
												</li>
												
												<li>
													<input id="filt2_chk2" type="checkbox">
													<label for="filt2_chk2">임플란트 앵글</label>
												</li>
												
												<li>
													<input id="filt2_chk3" type="checkbox">
													<label for="filt2_chk3">임플란트 가이드</label>
												</li>
	
												<li>
													<input id="filt2_chk2" type="checkbox">
													<label for="filt2_chk2">임플란트 앵글</label>
												</li>
												
												<li>
													<input id="filt2_chk3" type="checkbox">
													<label for="filt2_chk3">임플란트 가이드</label>
												</li>
											</ul>
											
											<button class="more_view">더보기<img src="/resources/images/main/filter_down.png" width="9" height="5" border="0" alt="" /></button>
											<button class="full_view">전체보기<img src="/resources/images/main/filter_view.png" width="5" height="9" border="0" alt="" /></button>
	
											<div class="filt_popup filter_2_popup">
												<div class="filter_pu_tit">
													<h5>종류 전체</h5>
												</div>
	
												<div class="filter_pu_txt">
													<ul class="clear">
														<li>
															<input id="f2Chk1" type="checkbox">
															<label for="f2Chk1">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f2Chk2" type="checkbox">
															<label for="f2Chk2">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f2Chk3" type="checkbox">
															<label for="f2Chk3">임플란트 가이드</label>
														</li>
													</ul>
												</div>
	
												<div class="filter_pu_close">
													<button>닫기</button>
												</div>
											</div>
										</div>
									</li>
						
									<li class="filter_3">
										<div class="filter_tit clear">
											<h4>제조사</h4>
											<button class="updown"><img src="/resources/images/main/filter_up.png" width="12" height="8" border="0" alt="" /></button>
										</div>
										
										<div class="d2_wrap">
											<ul class="depth2">
												<li>
													<input id="filt3_chk1" type="checkbox">
													<label for="filt3_chk1">ABCDEFGHJKLMOPQRSTUVWABCDEFGHJKLMOPQRSTUVW</label>
												</li>
																
												<li>
													<input id="filt3_chk2" type="checkbox">
													<label for="filt3_chk2">ABCDEFGHJKLMOPQRSTUVW</label>
												</li>
																
												<li>
													<input id="filt3_chk3" type="checkbox">
													<label for="filt3_chk3">ABCDEFGHJKLMOPQRSTUVW</label>
												</li>
																
												<li>
													<input id="filt3_chk4" type="checkbox">
													<label for="filt3_chk4">ABCDEFGHJKLMOPQRSTUVW</label>
												</li>
																
												<li>
													<input id="filt3_chk5" type="checkbox">
													<label for="filt3_chk5">ABCDEFGHJKLMOPQRSTUVW</label>
												</li>
																
												<li>
													<input id="filt3_chk6" type="checkbox">
													<label for="filt3_chk6">ABCDEFGHJKLMOPQRSTUVW</label>
												</li>
																
												<li>
													<input id="filt3_chk7" type="checkbox">
													<label for="filt3_chk7">ABCDEFGHJKLMOPQRSTUVW</label>
												</li>
											</ul>
											
											<button class="more_view">더보기<img src="/resources/images/main/filter_down.png" width="9" height="5" border="0" alt="" /></button>
											<button class="full_view">전체보기<img src="/resources/images/main/filter_view.png" width="5" height="9" border="0" alt="" /></button>
	
											<div class="filt_popup filter_2_popup">
												<div class="filter_pu_tit">
													<h5>제조사 전체</h5>
												</div>
	
												<div class="filter_pu_txt">
													<ul class="clear">
														<li>
															<input id="f3Chk1" type="checkbox">
															<label for="f3Chk1">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f3Chk2" type="checkbox">
															<label for="f3Chk2">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f3Chk3" type="checkbox">
															<label for="f3Chk3">임플란트 가이드</label>
														</li>
	
														<li>
															<input id="f3Chk4" type="checkbox">
															<label for="f3Chk4">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f3Chk5" type="checkbox">
															<label for="f3Chk5">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f3Chk6" type="checkbox">
															<label for="f3Chk6">임플란트 가이드</label>
														</li>
	
														<li>
															<input id="f3Chk7" type="checkbox">
															<label for="f3Chk7">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f3Chk8" type="checkbox">
															<label for="f3Chk8">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f3Chk9" type="checkbox">
															<label for="f3Chk9">임플란트 가이드</label>
														</li>
	
														<li>
															<input id="f3Chk10" type="checkbox">
															<label for="f3Chk10">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f3Chk11" type="checkbox">
															<label for="f3Chk11">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f3Chk12" type="checkbox">
															<label for="f3Chk12">임플란트 가이드</label>
														</li>
													</ul>
												</div>
	
												<div class="filter_pu_close">
													<button>닫기</button>
												</div>
											</div>
										</div>
									</li>
						
									<li class="filter_4">
										<div class="filter_tit clear">
											<h4>규격</h4>
											<button class="updown"><img src="/resources/images/main/filter_up.png" width="12" height="8" border="0" alt="" /></button>
										</div>
										
										<div class="d2_wrap">
											<ul class="depth2">
												<li>
													<input id="filt4_chk1" type="checkbox">
													<label for="filt4_chk1">0.1g/0.18cc</label>
												</li>
																
												<li>
													<input id="filt4_chk2" type="checkbox">
													<label for="filt4_chk2">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt4_chk3" type="checkbox">
													<label for="filt4_chk3">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt4_chk4" type="checkbox">
													<label for="filt4_chk4">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt4_chk5" type="checkbox">
													<label for="filt4_chk5">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt4_chk6" type="checkbox">
													<label for="filt4_chk6">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt4_chk7" type="checkbox">
													<label for="filt4_chk7">0.25g/0.45cc</label>
												</li>
	
												<li>
													<input id="filt4_chk8" type="checkbox">
													<label for="filt4_chk8">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt4_chk9" type="checkbox">
													<label for="filt4_chk9">0.25g/0.45cc</label>
												</li>
											</ul>
																
											<button class="more_view">더보기<img src="/resources/images/main/filter_down.png" width="9" height="5" border="0" alt="" /></button>
											<button class="full_view">전체보기<img src="/resources/images/main/filter_view.png" width="5" height="9" border="0" alt="" /></button>
	
											<div class="filt_popup filter_2_popup">
												<div class="filter_pu_tit">
													<h5>규격 전체</h5>
												</div>
	
												<div class="filter_pu_txt">
													<ul class="clear">
														<li>
															<input id="f4Chk1" type="checkbox">
															<label for="f4Chk1">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f4Chk2" type="checkbox">
															<label for="f4Chk2">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f4Chk3" type="checkbox">
															<label for="f4Chk3">임플란트 가이드</label>
														</li>
	
														<li>
															<input id="f4Chk4" type="checkbox">
															<label for="f4Chk4">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f4Chk5" type="checkbox">
															<label for="f4Chk5">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f4Chk6" type="checkbox">
															<label for="f4Chk6">임플란트 가이드</label>
														</li>
	
														<li>
															<input id="f4Chk7" type="checkbox">
															<label for="f4Chk7">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f4Chk8" type="checkbox">
															<label for="f4Chk8">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f4Chk9" type="checkbox">
															<label for="f4Chk9">임플란트 가이드</label>
														</li>
	
														<li>
															<input id="f4Chk10" type="checkbox">
															<label for="f4Chk10">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f4Chk11" type="checkbox">
															<label for="f4Chk11">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f4Chk12" type="checkbox">
															<label for="f4Chk12">임플란트 가이드</label>
														</li>
													</ul>
												</div>
	
												<div class="filter_pu_close">
													<button>닫기</button>
												</div>
											</div>
										</div>
									</li>
						
									<li class="filter_5">
										<div class="filter_tit clear">
											<h4>규격</h4>
											<button class="updown"><img src="/resources/images/main/filter_up.png" width="12" height="8" border="0" alt="" /></button>
										</div>
										
										<div class="d2_wrap">
											<ul class="depth2">
												<li>
													<input id="filt5_chk1" type="checkbox">
													<label for="filt5_chk1">0.1g/0.18cc</label>
												</li>
																
												<li>
													<input id="filt5_chk2" type="checkbox">
													<label for="filt5_chk2">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt5_chk3" type="checkbox">
													<label for="filt5_chk3">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt5_chk4" type="checkbox">
													<label for="filt5_chk4">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt5_chk5" type="checkbox">
													<label for="filt5_chk5">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt5_chk6" type="checkbox">
													<label for="filt5_chk6">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt5_chk7" type="checkbox">
													<label for="filt5_chk7">0.25g/0.45cc</label>
												</li>
											</ul>
																
											<button class="more_view">더보기<img src="/resources/images/main/filter_down.png" width="9" height="5" border="0" alt="" /></button>
											<button class="full_view">전체보기<img src="/resources/images/main/filter_view.png" width="5" height="9" border="0" alt="" /></button>
	
											<div class="filt_popup filter_2_popup">
												<div class="filter_pu_tit">
													<h5>규격 전체</h5>
												</div>
	
												<div class="filter_pu_txt">
													<ul class="clear">
														<li>
															<input id="f5Chk1" type="checkbox">
															<label for="f5Chk1">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f5Chk2" type="checkbox">
															<label for="f5Chk2">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f5Chk3" type="checkbox">
															<label for="f5Chk3">임플란트 가이드</label>
														</li>
	
														<li>
															<input id="f5Chk4" type="checkbox">
															<label for="f5Chk4">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f5Chk5" type="checkbox">
															<label for="f5Chk5">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f5Chk6" type="checkbox">
															<label for="f5Chk6">임플란트 가이드</label>
														</li>
	
														<li>
															<input id="f5Chk7" type="checkbox">
															<label for="f5Chk7">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f5Chk8" type="checkbox">
															<label for="f5Chk8">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f5Chk9" type="checkbox">
															<label for="f5Chk9">임플란트 가이드</label>
														</li>
	
														<li>
															<input id="f5Chk10" type="checkbox">
															<label for="f5Chk10">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f5Chk11" type="checkbox">
															<label for="f5Chk11">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f5Chk12" type="checkbox">
															<label for="f5Chk12">임플란트 가이드</label>
														</li>
													</ul>
												</div>
	
												<div class="filter_pu_close">
													<button>닫기</button>
												</div>
											</div>
										</div>
									</li>
						
									<li class="filter_6">
										<div class="filter_tit clear">
											<h4>규격</h4>
											<button class="updown"><img src="/resources/images/main/filter_up.png" width="12" height="8" border="0" alt="" /></button>
										</div>
										
										<div class="d2_wrap">
											<ul class="depth2">
												<li>
													<input id="filt6_chk1" type="checkbox">
													<label for="filt6_chk1">0.1g/0.18cc</label>
												</li>
																
												<li>
													<input id="filt6_chk2" type="checkbox">
													<label for="filt6_chk2">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt6_chk3" type="checkbox">
													<label for="filt6_chk3">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt6_chk4" type="checkbox">
													<label for="filt6_chk4">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt6_chk5" type="checkbox">
													<label for="filt6_chk5">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt6_chk6" type="checkbox">
													<label for="filt6_chk6">0.25g/0.45cc</label>
												</li>
																
												<li>
													<input id="filt6_chk7" type="checkbox">
													<label for="filt6_chk7">0.25g/0.45cc</label>
												</li>
											</ul>
																
											<button class="more_view">더보기<img src="/resources/images/main/filter_down.png" width="9" height="5" border="0" alt="" /></button>
											<button class="full_view">전체보기<img src="/resources/images/main/filter_view.png" width="5" height="9" border="0" alt="" /></button>
	
											<div class="filt_popup filter_2_popup">
												<div class="filter_pu_tit">
													<h5>규격 전체</h5>
												</div>
	
												<div class="filter_pu_txt">
													<ul class="clear">
														<li>
															<input id="f6Chk1" type="checkbox">
															<label for="f6Chk1">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f6Chk2" type="checkbox">
															<label for="f6Chk2">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f6Chk3" type="checkbox">
															<label for="f6Chk3">임플란트 가이드</label>
														</li>
	
														<li>
															<input id="f6Chk4" type="checkbox">
															<label for="f6Chk4">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f6Chk5" type="checkbox">
															<label for="f6Chk5">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f6Chk6" type="checkbox">
															<label for="f6Chk6">임플란트 가이드</label>
														</li>
	
														<li>
															<input id="f6Chk7" type="checkbox">
															<label for="f6Chk7">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f6Chk8" type="checkbox">
															<label for="f6Chk8">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f6Chk9" type="checkbox">
															<label for="f6Chk9">임플란트 가이드</label>
														</li>
	
														<li>
															<input id="f6Chk10" type="checkbox">
															<label for="f6Chk10">임플란트 엔진</label>
														</li>
	
														<li>
															<input id="f6Chk11" type="checkbox">
															<label for="f6Chk11">임플란트 앵글</label>
														</li>
	
														<li>
															<input id="f6Chk12" type="checkbox">
															<label for="f6Chk12">임플란트 가이드</label>
														</li>
													</ul>
												</div>
	
												<div class="filter_pu_close">
													<button>닫기</button>
												</div>
											</div>
										</div>
									</li>
								</ul>
	
								<div class="comments_write">
									<button><img src="/resources/images/main/comment_icon.png" width="13" height="13" border="0" alt="" />검색결과에 의견 남기기</button>
								</div>
	
								<div class="comm_popup">
									<div class="cp_tit">
										<h4>검색결과 설문조사</h4>
										<button class="cp_close"><img src="/resources/images/main/cp_close.png" width="32" height="32" border="0" alt="" /></button>
									</div>
	
									<div class="cp_txt">
										<ul>
											<li class="cp_txt1">
												<h5>메디밸류 스토어 고객의 여러분의 소중한 의견을 듣습니다.</h5>
												<p>더 좋은 검색서비스를 위해, 고객님의 소중한 의견을 듣고 반영하고자 합니다.<br>불편사항이나 바라시는 요청 사항이 있으시면 남겨주세요.</p>
											</li>
	
											<li class="cp_txt2">
												<h5>검색 서비스 및 검색어</h5>
												<div class="clear">
													<div class="cp_sch_1">
														<select name="" id="">
															<option value="">가격비교</option>
															<option value="">가격비교</option>
															<option value="">가격비교</option>
															<option value="">가격비교</option>
														</select>
													</div>
													
													<div class="cp_sch_2">
														<select name="" id="">
															<option value="">타이탄엑스</option>
															<option value="">타이탄엑스</option>
															<option value="">타이탄엑스</option>
															<option value="">타이탄엑스</option>
														</select>
													</div>
												</div>
											</li>
	
											<li class="cp_txt3">
												<h5>불편사항 및 요청사항</h5>
												<textarea name="" id="" cols="30" rows="10"></textarea>
											</li>
										</ul>
									</div>
	
									<div class="cp_btn">
										<button>제출하기</button>
									</div>
								</div>
							</div>
						</div>
						
						<div class="right_cnt">
							<div class="asso clear">
								<h4>연관검색어</h4>
								<p>타이탄엑스</p>
								<p>타이탄X</p>
								<p>타이탄엑스 파우더</p>
								<p>Titan-X</p>
								<p>Trioss</p>
								<p>타이탄X 골이식재</p>
							</div>
	
							<div class="choice_filter clear">
								<h4>선택된 필터</h4>
								<div class="ch_filt_wrap clear">
									<div class="ch_filt"><p>ABCDEFGHJKLMOPQRSTUVWABCDEFGHJKLMOPQRSTUVW</p><button><img src="/resources/images/main/ch_filt_delete.jpg" width="8" height="8" border="0" alt="" /></button></div>
									<div class="ch_filt"><p>ABCDEFGHJKLMOPQRSTUVWABCDEFGHJKLMOPQRSTUVW</p><button><img src="/resources/images/main/ch_filt_delete.jpg" width="8" height="8" border="0" alt="" /></button></div>
									<div class="ch_filt"><p>ABCDEFGHJKLMOPQRSTUVWABCDEFGHJKLMOPQRSTUVW</p><button><img src="/resources/images/main/ch_filt_delete.jpg" width="8" height="8" border="0" alt="" /></button></div>
									<div class="ch_filt"><p>ABCDEFGHJKLMOPQRSTUVWABCDEFGHJKLMOPQRSTUVW</p><button><img src="/resources/images/main/ch_filt_delete.jpg" width="8" height="8" border="0" alt="" /></button></div>
									<div class="ch_filt"><p>ABCDEFGHJKLMOPQRSTUVWABCDEFGHJKLMOPQRSTUVW</p><button><img src="/resources/images/main/ch_filt_delete.jpg" width="8" height="8" border="0" alt="" /></button></div>
									<div class="ch_filt"><p>ABCDEFGHJKLMOPQRSTUVWABCDEFGHJKLMOPQRSTUVW</p><button><img src="/resources/images/main/ch_filt_delete.jpg" width="8" height="8" border="0" alt="" /></button></div>
								</div>
	
								<button class="reset_btn">초기화</button>
							</div>
						
							<div class="result_sch">
								<div class="rs_tit clear">
									<h3><span>'타이탄'</span> 에 대한 검색 결과에요.</h3>
									
									<select name="" id="" class="nis">
										<option value="">메디밸류 랭킹순</option>
										<option value="">낮은 가격순</option>
										<option value="">높은 가격순</option>
										<option value="">이름순</option>
									</select>
								</div>
						
								<div class="rs_txt">
									<ul>
										<li class="clear">
											<h4>결과 내 검색</h4>
											
											<div class="form_cont">
												<label for="placeholder3">검색어를 입력하세요</label>
												<input type="text" id="placeholder3">
												<button class="sch_btn"><img src="/resources/images/main/search_btn4.png" width="13" height="13" border="0" alt="" /></button>
											</div>
									
											<div class="checks">
												<input type="radio" id="ex_rd" name="ex_rds" checked>
												<label for="ex_rd">포함</label>
											</div>
									
											<div class="checks">
												<input type="radio" id="ex_rd2" name="ex_rds">
												<label for="ex_rd2">제외</label>
											</div>
										</li>
									
										<li class="clear">
											<h4>결과 내 카테고리</h4>
											
											<select name="" id="" class="nis">
												<option value="">전체목록보기</option>
												<option value="">전체목록보기</option>
												<option value="">전체목록보기</option>
												<option value="">전체목록보기</option>
											</select>
										</li>
									</ul>
								</div>
							</div>
						
							<div class="pd_list pd_list1">
								<div class="pd_list_tit">
									<h5>진료소장비 - 광중합기/미백기/조명</h5>
								</div>
						
								<div class="pd_list_txt">
									<strong>추천제품</strong>
									
									<ul>
										<li class="clear">
											<div class="img">
												<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
											</div>
						
											<div class="info">
												<div class="info_wrap">
													<h4 class="pd_tit">타이탄 큐어링 라이트 TITAN Curing Light 타이탄 큐어링 라이트 TITAN Curing Light 타이탄 큐어링 라이트 TITAN Curing Light 타이탄 큐어링 라이트 TITAN Curing Light</h4>
													<p class="standard">규격 ㅣ 0.5g  /  0.8cc (05-0210)</p>
													<p class="manu">제조사 ㅣ 리뉴메디칼</p>
													<p class="pack">포장단위 ㅣ ea</p>
												</div>
											</div>
						
											<div class="price_info">
												<div class="price clear">
													<strong class="percent">68%</strong>
													<p>0,000,000원</p>
												</div>
												<div class="cost"><p>0,000,000원</p></div>
						
												<div class="btn_wrap clear">
													<button class="cart_btn">장바구니</button>
													<button class="buy_btn">구매하기</button>
													<span class="bar"></span>
												</div>
						
												<button class="wish_btn on"></button>
											</div>
										</li>
									</ul>
								</div>
							</div>
						
							<div class="pd_list pd_list2">
								<div class="pd_list_tit">
									<h5>임플란트 - 뼈 이식재 - 이종골</h5>
								</div>
						
								<div class="pd_list_txt">
									<strong>일반제품</strong>
									
									<ul>
										<li class="clear">
											<div class="img">
												<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
											</div>
						
											<div class="info">
												<div class="info_wrap">
													<h4 class="pd_tit">타이탄 엑스 TITAN X</h4>
													<p class="standard">규격 ㅣ 0.5g  /  0.8cc (05-0210)</p>
													<p class="manu">제조사 ㅣ 리뉴메디칼</p>
													<p class="pack">포장단위 ㅣ ea</p>
												</div>
											</div>
						
											<div class="price_info">
												<div class="price clear">
													<p>0,000,000원</p>
												</div>
												<div class="cost"><p>0,000,000원</p></div>
						
												<div class="btn_wrap clear">
													<button class="cart_btn">장바구니</button>
													<button class="buy_btn">구매하기</button>
													<span class="bar"></span>
												</div>
						
												<button class="wish_btn"></button>
											</div>
										</li>
						
										<li class="clear">
											<div class="img">
												<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
											</div>
						
											<div class="info">
												<div class="info_wrap">
													<h4 class="pd_tit">타이탄 엑스 TITAN X</h4>
													<p class="standard">규격 ㅣ 0.5g  /  0.8cc (05-0210)</p>
													<p class="manu">제조사 ㅣ 리뉴메디칼</p>
													<p class="pack">포장단위 ㅣ ea</p>
												</div>
											</div>
						
											<div class="price_info">
												<div class="price clear">
													<p>0,000,000원</p>
												</div>
												<div class="cost"><p>0,000,000원</p></div>
						
												<div class="btn_wrap clear">
													<button class="cart_btn">장바구니</button>
													<button class="buy_btn">구매하기</button>
													<span class="bar"></span>
												</div>
						
												<button class="wish_btn"></button>
											</div>
										</li>
						
										<li class="clear">
											<div class="img">
												<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
											</div>
						
											<div class="info">
												<div class="info_wrap">
													<h4 class="pd_tit">타이탄 엑스 TITAN X</h4>
													<p class="standard">규격 ㅣ 0.5g  /  0.8cc (05-0210)</p>
													<p class="manu">제조사 ㅣ 리뉴메디칼</p>
													<p class="pack">포장단위 ㅣ ea</p>
												</div>
											</div>
						
											<div class="price_info">
												<div class="price clear">
													<p>0,000,000원</p>
												</div>
												<div class="cost"><p>0,000,000원</p></div>
						
												<div class="btn_wrap clear">
													<button class="cart_btn">장바구니</button>
													<button class="buy_btn">구매하기</button>
													<span class="bar"></span>
												</div>
						
												<button class="wish_btn"></button>
											</div>
										</li>
									</ul>
								</div>
							</div>
						
							<div class="pd_list pd_list3">
								<div class="pd_list_tit">
									<h5>진료소장비 - 광중합기/미백기/조명</h5>
								</div>
						
								<div class="pd_list_txt">
									<strong>추천제품</strong>
									
									<ul>
										<li class="clear">
											<div class="img">
												<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
											</div>
						
											<div class="info">
												<div class="info_wrap">
													<h4 class="pd_tit">타이탄 큐어링 라이트 TITAN Curing Light</h4>
													<p class="standard">규격 ㅣ 0.5g  /  0.8cc (05-0210)</p>
													<p class="manu">제조사 ㅣ 리뉴메디칼</p>
													<p class="pack">포장단위 ㅣ ea</p>
												</div>
											</div>
						
											<div class="price_info">
												<div class="price clear">
													<strong class="percent">68%</strong>
													<p>0,000,000원</p>
												</div>
												<div class="cost"><p>0,000,000원</p></div>
						
												<div class="btn_wrap clear">
													<button class="cart_btn">장바구니</button>
													<button class="buy_btn">구매하기</button>
													<span class="bar"></span>
												</div>
						
												<button class="wish_btn"></button>
											</div>
										</li>
									</ul>
								</div>
							</div>
	
							<div class="pd_list_paging">
								<ul class="clear">
									<li class="prev2"><button><img src="/resources/images/main/prev_icon2.png" width="10" height="9" border="0" alt="" /></button></li>
									<li class="prev1"><button><img src="/resources/images/main/prev_icon1.png" width="10" height="9" border="0" alt="" /></button></li>
									<li class="on"><button>1</button></li>
									<li><button>2</button></li>
									<li><button>3</button></li>
									<li><button>4</button></li>
									<li><button>5</button></li>
									<li><button>6</button></li>
									<li><button>7</button></li>
									<li><button>8</button></li>
									<li><button>9</button></li>
									<li class="next1"><button><img src="/resources/images/main/next_icon1.png" width="10" height="9" border="0" alt="" /></button></li>
									<li class="next2"><button><img src="/resources/images/main/next_icon2.png" width="10" height="9" border="0" alt="" /></button></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</article>
	
			<article class="my_history">
				<div class="area">
					<div class="real_area">
						<div class="tit clear">
							<h3>MY HISTORY</h3>
							<p>내가 본 제품과 다른 고객이 함께 본 제품을 확인해보세요!</p>
						</div>
	
						<div class="txt">
							<div class="tab_split">
								<ul class="tab_btn clear">
									<li class="tab_btn1 on"><button>최근 본 제품 (13)</button></li>
									<li class="tab_btn2"><button>장바구니 (0)</button></li>
									<li class="tab_btn3"><button>위시리스트 (0)</button></li>
								</ul>
	
								<div class="tab_cnt">
									<div class="tab_cnt1 clear">
										<div class="left">
											<div class="wrap">
												<div class="paging_wrap">
													<p><strong>1</strong> / 13</p>
												</div>
	
												<ul class="bxslider_his1">
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
															
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
															
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
															
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												</ul>
											</div>
											<span class="line"></span>
										</div>
	
										<div class="right">
											<div class="right_tit clear">
												<h4>최근 본 제품의 추천제품</h4>
												<p><strong>1</strong> / 2</p>
											</div>
	
											<ul class="depth1 bxslider_his2">
												<li>
													<ul class="depth2 clear">
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명</h4>
																	<div class="price clear">
																		<strong class="percent">10%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">43%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">60%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
													</ul>
												</li>
										
												<li>
													<ul class="depth2 clear">
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">10%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">43%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">60%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
													</ul>
												</li>
											</ul>
										</div>
									</div>
	
									<div class="tab_cnt2 clear">
										<div class="left">
											<div class="wrap">
												<div class="paging_wrap">
													<p><strong>1</strong> / 13</p>
												</div>
	
												<ul class="bxslider_his3">
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
																			
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
															
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
															
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												</ul>
											</div>
											<span class="line"></span>
										</div>
	
										<div class="right">
											<div class="right_tit clear">
												<h4>장바구니 제품의 추천제품</h4>
												<p><strong>1</strong> / 2</p>
											</div>
	
											<ul class="depth1 bxslider_his4">
												<li>
													<ul class="depth2 clear">
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">10%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">43%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">60%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
													</ul>
												</li>
										
												<li>
													<ul class="depth2 clear">
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">10%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">43%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">60%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
													</ul>
												</li>
											</ul>
										</div>
									</div>
	
									<div class="tab_cnt3 clear">
										<div class="left">
											<div class="wrap">
												<div class="paging_wrap">
													<p><strong>1</strong> / 13</p>
												</div>
	
												<ul class="bxslider_his5">
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
																			
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
															
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												
													<li>
														<a href="">
															<div class="img">
																<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
															</div>
															
															<div class="info">
																<h4 class="pd_tit">[제조사] 제품명</h4>
																<div class="price clear">
																	<strong class="percent">10%</strong>
																	<p>0,000,000원</p>
																</div>
																<div class="cost"><p>0,000,000원</p></div>
															</div>
														</a>
													</li>
												</ul>
											</div>
											<span class="line"></span>
										</div>
	
										<div class="right">
											<div class="right_tit clear">
												<h4>위시리스트</h4>
												<p><strong>1</strong> / 2</p>
											</div>
	
											<ul class="depth1 bxslider_his6">
												<li>
													<ul class="depth2 clear">
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">10%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">43%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">60%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
													</ul>
												</li>
										
												<li>
													<ul class="depth2 clear">
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img1.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">10%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">43%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
										
														<li>
															<a href="">
																<div class="img">
																	<img src="/resources/images/main/mn_c6_img3.jpg" width="250" height="321" border="0" alt="" />
																</div>
										
																<div class="info">
																	<h4 class="pd_tit">[제조사] 제품명</h4>
																	<div class="price clear">
																		<strong class="percent">60%</strong>
																		<p>0,000,000원</p>
																	</div>
																	<div class="cost"><p>0,000,000원</p></div>
																</div>
															</a>
														</li>
													</ul>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>