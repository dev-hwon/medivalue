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
		<section id="mcash" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<h3>내 계정</h3>
							
								<ul>
									<li><button>주문배송 조회</button></li>
									<li><button>배송지관리</button></li>
									<li><button>포인트 쿠폰</button></li>
									<li class="on"><button>메디캐쉬</button></li>
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
										<h4>메디캐쉬</h4>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt">
										<div class="rc1_top">
											<div class="rc1_tit clear">
												<h5>메디캐쉬</h5>
											</div>
											
											<div class="rc1_txt">
												<ul class="clear">
													<li class="clear">
														<h6>현재 메디캐쉬</h6>
														<p>6,857원</p>
													</li>
												<!-- 	<li class="clear">
														<h6>소멸예정 포인트</h6>
														<p>3,000원</p>
													</li> -->
												</ul>
											</div>
										</div>
									</div>
									
									<div class="rt_cnt">
										<div class="rc1_top">
											<div class="rc1_tit clear">
												<h5>캐쉬 구매 내역</h5>
											</div>
										</div>
										<div class="rc1_btm">
											<table>
												<thead>
													<tr>
														<th class="rc1_th1">날짜</th>
														<th class="rc1_th2">내용</th>
														<th class="rc1_th3">금액</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="rc1_td1">
															<p>21.08.11</p>
														</td>
	
														<td class="rc1_td2">
															<p>가나다라마바사아</p>
														</td>
	
														<td class="rc1_td3">
															<p>0</p>
														</td>
													</tr>
												</tbody>
											</table>
											<div class="comm_pagination">
												<ul>
													<li class="start"><button></button></li>
													<li class="prev"><button></button></li>
													<li class="on"><button>1</button></li>
													<li><button>2</button></li>
													<li><button>3</button></li>
													<li><button>4</button></li>
													<li><button>5</button></li>
													<li class="next"><button></button></li>
													<li class="end"><button></button></li>
												</ul>
											</div>
										</div>
									</div>
									
									<div class="rt_cnt">
										<div class="rc1_top">
											<div class="rc1_tit clear">
												<h5>캐쉬 사용 내역</h5>
											</div>
										</div>
										<div class="rc1_btm">
											<table>
												<thead>
													<tr>
														<th class="rc1_th1">날짜</th>
														<th class="rc1_th2">내용</th>
														<th class="rc1_th3">금액</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class="rc1_td1">
															<p>21.08.11</p>
														</td>
	
														<td class="rc1_td2">
															<p>가나다라마바사아</p>
														</td>
	
														<td class="rc1_td3">
															<p>0</p>
														</td>
													</tr>
												</tbody>
											</table>
											<div class="comm_pagination">
												<ul>
													<li class="start"><button></button></li>
													<li class="prev"><button></button></li>
													<li class="on"><button>1</button></li>
													<li><button>2</button></li>
													<li><button>3</button></li>
													<li><button>4</button></li>
													<li><button>5</button></li>
													<li class="next"><button></button></li>
													<li class="end"><button></button></li>
												</ul>
											</div>
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