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
			$(document).ready(function (){

			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub4_4" class="sub">
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
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<table>
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
	
												<tr class="tr_comment">
													<td colspan="5">
														<p>항상 메디밸류를 이용해주셔서 감사합니다.<br><br>추석 연휴를 맞이하여 메디밸류 배송 휴무 일정을 안내해 드리오니,<br>사이트 이용에 참고해 주시기 바랍니다. <br><br>◈ 휴무 : 2021. 9. 20. (월) ~ 9.22. (수)<br><br>※ 휴무 기간동안 문의 사항이 있으신 경우, 이메일(cs@anyprice.com) 및 고객센터 게시판으로 접수 부탁드립니다.<br><br>풍성한 추석 명절 보내시기 바랍니다.<br><br>감사합니다.</p>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
	
									<div class="clear">
										<button class="list_go">목록</button>
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