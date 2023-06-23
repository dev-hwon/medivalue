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
		<section id="sub4_3" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<h3>고객센터</h3>
							
								<ul>
									<li><button>1:1문의</button></li>
									<li class="on"><button>공지사항</button></li>
									<li><button>이용안내</button></li>
									<li><button>법적고지</button></li>
								</ul>
							
								<div class="banner">
									<h4>주문/배송에<br>도움이 필요하신가요?</h4>
									<button>1:1 문의하기</button>
								</div>
							</div>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>공지사항</h4>
										
										<div class="util_wrap clear">
											<div class="chk_wrap">
												<input id="uw1" type="checkbox">
												<label for="uw1">이름</label>
											</div>
	
											<div class="chk_wrap">
												<input id="uw2" type="checkbox">
												<label for="uw2">제목</label>
											</div>
	
											<div class="chk_wrap">
												<input id="uw3" type="checkbox">
												<label for="uw3">내용</label>
											</div>
	
											<div class="form_cont">
												<input type="text" id="schIp">
												<label for="schIp">7월 공지사항</label>
												<button></button>
											</div>
										</div>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<table>
											<thead>
												<tr>
													<th class="notice_th1">번호</th>
													<th class="notice_th2">제목</th>
													<th class="notice_th3">작성자</th>
													<th class="notice_th4">작성일</th>
													<th class="notice_th5">조회</th>
												</tr>
											</thead>
	
											<tbody>
												<tr>
													<td class="notice_td1">
														<p>7134</p>
													</td>
	
													<td class="notice_td2">
														<p>[배송] 공지사항입니다.</p>
													</td>
	
													<td class="notice_td3">
														<p>메디밸류</p>
													</td>
	
													<td class="notice_td4">
														<p>2021.09.28</p>
													</td>
	
													<td class="notice_td5">
														<p>2</p>
													</td>
												</tr>
	
												<tr>
													<td class="notice_td1">
														<p>7134</p>
													</td>
	
													<td class="notice_td2">
														<p>[배송] 공지사항입니다.</p>
													</td>
	
													<td class="notice_td3">
														<p>메디밸류</p>
													</td>
	
													<td class="notice_td4">
														<p>2021.09.28</p>
													</td>
	
													<td class="notice_td5">
														<p>2</p>
													</td>
												</tr>
	
												<tr>
													<td class="notice_td1">
														<p>7134</p>
													</td>
	
													<td class="notice_td2">
														<p>[배송] 공지사항입니다.</p>
													</td>
	
													<td class="notice_td3">
														<p>메디밸류</p>
													</td>
	
													<td class="notice_td4">
														<p>2021.09.28</p>
													</td>
	
													<td class="notice_td5">
														<p>2</p>
													</td>
												</tr>
	
												<tr>
													<td class="notice_td1">
														<p>7134</p>
													</td>
	
													<td class="notice_td2">
														<p>[배송] 공지사항입니다.</p>
													</td>
	
													<td class="notice_td3">
														<p>메디밸류</p>
													</td>
	
													<td class="notice_td4">
														<p>2021.09.28</p>
													</td>
	
													<td class="notice_td5">
														<p>2</p>
													</td>
												</tr>
	
												<tr>
													<td class="notice_td1">
														<p>7134</p>
													</td>
	
													<td class="notice_td2">
														<p>[배송] 공지사항입니다.</p>
													</td>
	
													<td class="notice_td3">
														<p>메디밸류</p>
													</td>
	
													<td class="notice_td4">
														<p>2021.09.28</p>
													</td>
	
													<td class="notice_td5">
														<p>2</p>
													</td>
												</tr>
											</tbody>
										</table>
	
										<div class="pd_list_paging">
											<ul class="clear">
												<li class="prev2"><button><img src="/resources/images/main/prev_icon2.png" width="10" height="9" border="0" alt="" /></button></li>
												<li class="prev1"><button><img src="/resources/images/main/prev_icon1.png" width="10" height="9" border="0" alt="" /></button></li>
												<li class="on"><button>1</button></li>
												<li class="next1"><button><img src="/resources/images/main/next_icon1.png" width="10" height="9" border="0" alt="" /></button></li>
												<li class="next2"><button><img src="/resources/images/main/next_icon2.png" width="10" height="9" border="0" alt="" /></button></li>
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