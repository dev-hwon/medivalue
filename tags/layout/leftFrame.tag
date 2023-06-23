<%@ tag language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="left">
	<h3>고객센터</h3>

	<c:set var="reqUri" value="${pageContext.request.requestURI}"/>	

	<ul class="left_menu">
		<%-- 20211202 메뉴 삭제 요청
		<li <c:if test="${fn:indexOf(reqUri, 'memberQuestionManage') >= 0}">class="on"</c:if>><button class="question">1:1문의</button></li>
		 --%>
		<li <c:if test="${fn:indexOf(reqUri, 'notice') >= 0}">class="on"</c:if>><button class="notice">공지사항</button></li>
		<li <c:if test="${(fn:indexOf(reqUri, 'terms') >= 0)}">class="on"</c:if>><button class="terms1" style="line-height:20px;">이용약관<br>개인정보처리방침</button></li>		
<%-- 		<li <c:if test="${fn:indexOf(reqUri, 'explain/info') >= 0}">class="on"</c:if>><button class="useinfo">회사소개</button></li> --%>
<%--		<li <c:if test="${fn:indexOf(reqUri, 'terms') >= 0}">class="on"</c:if>><button class="terms3">법적고지</button></li>--%>
	</ul>

	<div id="banner" class="banner" style="cursor: pointer" onclick="onChatTalk();">
		<h4>주문/배송에<br>도움이 필요하신가요?</h4>
		<button type="button">채팅상담을 통해 문의해주세요.</button>
		<%--
		<button class="question_write">1:1 문의하기</button>
		 --%>
	</div>
</div>