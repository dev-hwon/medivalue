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
			$(document).ready(function (){				
				
				$(".terms1").on("click", function(){
					location.href = "/terms/info?tab=1";
				});
				$(".terms2").on("click", function(){
					location.href = "/terms/info?tab=2";
				});
				$(".terms3").on("click", function(){
					location.href = "/terms/info?tab=3";
				});
				$(".terms4").on("click", function(){
					location.href = "/terms/info?tab=4";
				});				
				
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub4_6" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<layout:leftFrame/>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4 <c:if test="${!empty terms_list && terms_list[0].fd_type_code eq 'TE0001'}">class="on"</c:if>><button type="button" class="terms1">이용약관</button></h4>
										<h4 <c:if test="${!empty terms_list && terms_list[0].fd_type_code eq 'TE0013'}">class="on"</c:if>><button type="button" class="terms3">기공 이용약관</button></h4>
										<h4 <c:if test="${!empty terms_list && terms_list[0].fd_type_code eq 'TE0014'}">class="on"</c:if>><button type="button" class="terms4">선정산 이용약관</button></h4>
										<%--<h4><button type="button">기공 이용약관</button></h4>--%>
										<%--<h4><button type="button">선정산 이용약관</button></h4>--%>
										<h4 <c:if test="${!empty terms_list && terms_list[0].fd_type_code eq 'TE0002'}">class="on"</c:if>><button type="button" class="terms2">개인정보처리방침</button></h4>
<%--										<h4 <c:if test="${!empty terms_list && terms_list[0].fd_type_code eq 'TE0003'}">class="on"</c:if>><button type="button" class="terms3">법적고지</button></h4>--%>
									</div>
								</div>
								<c:if test="${!empty terms_list}">
								<div class="right_txt">
									<div class="rt_cnt1">
										<div class="terms_conts">${terms_list[0].fd_content}</div>
									</div>
	
									<select name="sel_terms" id="sel_terms">
										<c:if test="${!empty terms_list}">
										<c:forEach var="item" items="${terms_list}" varStatus="status">
										<fmt:parseDate var="dateString" value="${item.fd_start_date}" pattern="yyyyMMdd" />
<%--										<option value="${status.index}">${terms_list[0].fd_title} (<fmt:formatDate value="${dateString}" pattern="yyyy년 MM월 dd일"/>)</option>--%>
										<option value="${status.index}">${item.fd_title}</option>
										</c:forEach>
										</c:if>
									</select>
								</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>