<%@ tag language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="left">
	<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
	<h3>내 계정</h3>

	<script type="text/javascript">
		$(function () {
			$("#myhome").on("click", function () {
				location.href = "/myhome/info";
			});
			$("#delivery").on("click", function () {
				location.href = "/order/list";
			});

			$("#addr").on("click", function () {
				location.href = "/member/addr/list";
			});

			$("#coupon").on("click", function () {
				location.href = "/coupon/list";
			});

			$("#medicash").on("click", function () {
				location.href = "/medicashMng/info";
			});

			$("#member").on("click", function () {
				location.href = "/member/mypage/check";
			});
			
			$("#purchase").on("click", function () {
				location.href = "/member/purchase/list";
			});

			$("#deferpurchase").on("click", function () {
				location.href = "/member/purchase/deferlist";
			});

			/* $("#banner").on("click", function () {
				location.href = "/member/mypage/question/write";
			}); */
		});

	</script>

	<ul class="left_menu">
		<li style="cursor: pointer" id="myhome"<c:if test="${fn:contains(path, 'myhome/info')}">class="on"</c:if>><button>MY 홈 (위시리스트)</button></li>
		<li style="cursor: pointer" id="delivery"<c:if test="${fn:contains(path, 'order')}">class="on"</c:if>><button>주문배송 조회</button></li>
		<li style="cursor: pointer" id="addr"<c:if test="${fn:contains(path, 'member/addr/list')}">class="on"</c:if>><button >배송지 관리</button></li>
		<li style="cursor: pointer" id="coupon"<c:if test="${fn:contains(path, 'coupon/list')}">class="on"</c:if>><button >쿠폰 / 포인트</button></li>
<%--		<li style="cursor: pointer" id="medicash"<c:if test="${fn:contains(path, 'member/medicash/list')}">class="on"</c:if>><button >메디캐쉬</button></li>--%>
		<li style="cursor: pointer" id="member"<c:if test="${fn:contains(path, 'member/mypage/check')}">class="on"</c:if>><button>회원정보 수정</button></li>
		<li style="cursor: pointer" id="purchase"<c:if test="${fn:contains(path, 'member/purchase/list')}">class="on"</c:if>><button>구매내역 조회</button></li>
		<c:if test="${member_paymentMethod eq 'PM0002'}" > <%-- 후불결제 22.04.22 --%> 
			<li style="cursor: pointer" id="deferpurchase"<c:if test="${fn:contains(path, 'member/purchase/deferlist')}">class="on"</c:if>><button>후불 구매내역 조회</button></li>
		</c:if>
		<li style="cursor: pointer" id="medicash"<c:if test="${fn:contains(path, 'medicashMng/info')}">class="on"</c:if>><button>메디캐시 충전/내역</button></li>
	</ul>

	<div id="banner" class="banner" style="cursor: pointer" onclick="onChatTalk();">
		<h4>주문/배송에<br>도움이 필요하신가요?</h4>
		<button type="button">채팅상담을 통해 문의해주세요.</button>
		<%--
		<button class="question_write">1:1 문의하기</button>
		 --%>
	</div>
</div>