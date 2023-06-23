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
		<script type="text/javascript">
			
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub3_5" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<h3>내 계정</h3>
							
								<ul>
									<li><button>주문배송 조회</button></li>
									<li><button>배송지관리</button></li>
									<li class="on"><button>포인트 쿠폰</button></li>
									<li><button>회원정보 수정</button></li>
								</ul>
							
								<div class="banner">
									<h4>주문/배송에<br>도움이 필요하신가요?</h4>
									<button>1:1 문의하기</button>
								</div>
							</div>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>포인트 쿠폰</h4>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<div class="rc1_top">
											<div class="rc1_tit clear">
												<h5>메디밸류 포인트</h5>
												<p>보유하고 계신 포인트의 내역을 한 눈에 확인 하실 수 있습니다.</p>
											</div>
											
											<div class="rc1_txt">
												<ul class="clear">
													<li class="clear">
														<h6>현재 포인트</h6>
														<p>6,857원</p>
													</li>
											
													<li class="clear">
														<h6>소멸예정 포인트</h6>
														<p>3,000원</p>
													</li>
												</ul>
											</div>
										</div>
	
										<div class="rc1_btm">
											<table>
												<thead>
													<tr>
														<th class="rc1_th1">날짜</th>
														<th class="rc1_th2">내용</th>
														<th class="rc1_th3">유효기간</th>
														<th class="rc1_th4">금액</th>
													</tr>
												</thead>
	
												<tbody>
													<tr>
														<td class="rc1_td1">
															<p>21.08.11</p>
														</td>
	
														<td class="rc1_td2">
															<p>[구매적립] TITAN X 외 3건 5% 적립</p>
														</td>
	
														<td class="rc1_td3">
															<p>22.08.11</p>
														</td>
	
														<td class="rc1_td4">
															<p>+1,340원</p>
														</td>
													</tr>
	
													<tr>
														<td class="rc1_td1">
															<p>21.07.21</p>
														</td>
	
														<td class="rc1_td2">
															<p>[이벤트적립금] 메디밸류 첫 이용고객 10% 적립</p>
														</td>
	
														<td class="rc1_td3">
															<p>21.07.21</p>
														</td>
	
														<td class="rc1_td4">
															<p>+5,000원</p>
														</td>
													</tr>
	
													<tr>
														<td class="rc1_td1">
															<p>21.07.21</p>
														</td>
	
														<td class="rc1_td2">
															<p>[이벤트적립금] 메디밸류 첫 이용고객 10% 적립</p>
														</td>
	
														<td class="rc1_td3">
															<p>21.07.21</p>
														</td>
	
														<td class="rc1_td4">
															<p>+5,000원</p>
														</td>
													</tr>
	
													<tr>
														<td class="rc1_td1">
															<p>21.07.21</p>
														</td>
	
														<td class="rc1_td2">
															<p>[이벤트적립금] 메디밸류 첫 이용고객 10% 적립</p>
														</td>
	
														<td class="rc1_td3">
															<p>21.07.21</p>
														</td>
	
														<td class="rc1_td4">
															<p>+5,000원</p>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
	
									<div class="rt_cnt2">
										<div class="rc2_top">
											<div class="rc2_tit clear">
												<h5>쿠폰</h5>
												<p>할인쿠폰은 구매조건에 따라 상품 결제 시 적용할 수 있습니다.</p>
											</div>
	
											<div class="rc2_txt">
												<ul>
													<li class="rc2_txt_li1 clear">
														<h6>사용가능 할인쿠폰</h6>
														<p>2개</p>
													</li>
	
													<li class="rc2_txt_li2 clear">
														<div class="cp_ip_wrap clear">
															<div class="form_cont">
																<label for="ciw1">쿠폰을 입력해주세요</label>
																<input type="text" id="ciw1">
															</div>
	
															<button class="cp_ip">쿠폰등록</button>
														</div>
														
														<p>쿠폰에 하이픈(&quot;-&quot;)이 포함되어 있을경우 하이픈(&quot;-&quot;)을 반드시 입력해주세요.</p>
													</li>
												</ul>
											</div>
										</div>
	
										<div class="rc2_btm">
											<table>
												<thead>
													<tr>
														<th class="rc2_th1">쿠폰명</th>
														<th class="rc2_th2">가능</th>
														<th class="rc2_th3">할인/적립</th>
														<th class="rc2_th4">사용가능기간</th>
														<th class="rc2_th5">사용여부</th>
													</tr>
												</thead>
	
												<tbody>
													<tr>
														<td class="rc2_td1">
															<h6>[메디밸류 오픈기념] 20%쿠폰(최대1만원)</h6>
															<p>메디밸류 오픈기념 20%할인(최대1만원)</p>
														</td>
	
														<td class="rc2_td2">
															<p>할인</p>
														</td>
	
														<td class="rc2_td3 on">
															<p>20%</p>
														</td>
	
														<td class="rc2_td4">
															<p>21.08.11 ~ 21.10.11</p>
														</td>
	
														<td class="rc2_td5 on">
															<p>미사용</p>
														</td>
													</tr>
	
													<tr>
														<td class="rc2_td1">
															<h6>첫 설문 참여 감사 5천원 할인쿠폰(2만원 이상 주문시)</h6>
															<p>2만원 이상 주문 시 5천원 할인</p>
														</td>
	
														<td class="rc2_td2">
															<p>할인</p>
														</td>
	
														<td class="rc2_td3">
															<p>5,000원</p>
														</td>
	
														<td class="rc2_td4">
															<p>21.07.21 ~ 21.09.21</p>
														</td>
	
														<td class="rc2_td5">
															<p>기한초과</p>
														</td>
													</tr>
	
													<tr>
														<td class="rc2_td1">
															<h6>[메디밸류 오픈기념] 20%쿠폰(최대1만원)</h6>
															<p>메디밸류 오픈기념 20%할인(최대1만원)</p>
														</td>
	
														<td class="rc2_td2">
															<p>할인</p>
														</td>
	
														<td class="rc2_td3 on">
															<p>20%</p>
														</td>
	
														<td class="rc2_td4">
															<p>21.08.11 ~ 21.10.11</p>
														</td>
	
														<td class="rc2_td5 on">
															<p>미사용</p>
														</td>
													</tr>
	
													<tr>
														<td class="rc2_td1">
															<h6>첫 설문 참여 감사 5천원 할인쿠폰(2만원 이상 주문시)</h6>
															<p>2만원 이상 주문 시 5천원 할인</p>
														</td>
	
														<td class="rc2_td2">
															<p>할인</p>
														</td>
	
														<td class="rc2_td3">
															<p>5,000원</p>
														</td>
	
														<td class="rc2_td4">
															<p>21.07.21 ~ 21.09.21</p>
														</td>
	
														<td class="rc2_td5">
															<p>기한초과</p>
														</td>
													</tr>
												</tbody>
											</table>
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