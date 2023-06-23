<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			$(".util_wrap .form_cont button").on("click", function(){
				let search_types = [];
				$("input[name=uw]:checked").each(function(i){
					search_types.push($(this).val());
				});
				$("#searchNoticeColumn").val(search_types);
				$("#frm").submit();
			});

			$(".terms1").on("click", function(){
				location.href = "/terms/info?tab=1";
			});
					
		});
		</script>
		${pageNavi.script}
	</jsp:attribute>
	<jsp:body>
		<section id="sub4_3" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<layout:leftFrame/>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>공지사항</h4>
										
										<form id="frm" name="frm" action="/notice/list" method="post">
										<input type="hidden" name="searchNoticeColumn" id="searchNoticeColumn" value="" />
										<div class="util_wrap clear">
											<div class="chk_wrap">
												<input id="uw1" name="uw" value="name" type="checkbox" <c:if test="${fn:indexOf(pageHelper.searchNoticeColumn,'name') > -1}">checked</c:if>>
												<label for="uw1">이름</label>
											</div>
	
											<div class="chk_wrap">
												<input id="uw2" name="uw" value="title" type="checkbox" <c:if test="${fn:indexOf(pageHelper.searchNoticeColumn,'title') > -1}">checked</c:if>>
												<label for="uw2">제목</label>
											</div>
	
											<!-- <div class="chk_wrap">
												<input id="uw3" name="uw" value="conts" type="checkbox" <c:if test="${fn:indexOf(pageHelper.searchNoticeColumn,'conts') > -1}">checked</c:if>>
												<label for="uw3">내용</label>
											</div>  -->
	
											<div class="form_cont">
												<input type="text" id="searchString" name="searchString" value="${pageHelper.searchString}">
												<label for="schIp"></label>
												<button></button>
											</div>
										</div>
										</form>
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
												<c:if test="${!empty list}">
												<c:forEach var="item" items="${list}" varStatus="status">
												<c:set var="num" value="${pageNavi.totalCount - ((pageNavi.nowPage - 1) * pageNavi.pageSize + status.index)}"/>
												<tr>
													<td class="notice_td1">
														<p>${num}</p>
													</td>
	
													<td class="notice_td2">
														<p><a href="/notice/view?idx=${item.pk_idx}&num=${num}">${item.fd_title}</a></p>
													</td>
	
													<td class="notice_td3">
														<p>${item.fd_reg_id}</p>
													</td>
	
													<td class="notice_td4">
														<p><fmt:formatDate value="${item.fd_reg_date}" pattern="yyyy-MM-dd"/></p>
													</td>
	
													<td class="notice_td5">
														<p>${item.fd_view_cnt}</p>
													</td>
												</tr>
												</c:forEach>
												</c:if>
												<c:if test="${empty list}">
												<tr>
													<td colspan="5">게시글이 없습니다.</td>
												</tr>
												</c:if>
											</tbody>
										</table>
										<div class="pd_list_paging">
											${pageNavi.navi}
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