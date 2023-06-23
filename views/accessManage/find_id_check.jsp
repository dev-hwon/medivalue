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
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				${scriptMsg}

				$(".find_id_login").on("click", function(){
					location.href = '/access/login';
				});
				$("#btn_password").on("click", function(){
					location.href = '/member/find/password';
				});
				$(".find_id_btn").on("click", function(){
					location.href = '/member/find/id';
				})
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub0_1_5" class="sub">
		<article class="cnt1">
			<div class="area">
				<div class="real_area">
					<div class="find_id_wrap">
						<h3>아이디 찾기</h3>
						<span class="icon"><img src="/resources/images/main/find_pw_icon.jpg" width="70" height="53" border="0" alt="" /></span>
						<c:choose>
						<c:when test="${rtn_code eq '200'}">
						<h4>고객님의 <br>아이디 찾기가 완료되었습니다!</h4>
						<p>아이디 : <em id="check_id">${member_id}</em></p>
						<button type="button" class="find_id_login">로그인 하기</button><br/>
						<button type="button" class="find_id_login" id="btn_password">비밀번호 찾기</button>
						</c:when>
						<c:otherwise>
						<h4>고객님의<br>아이디 찾기 입력 정보를 확인해주세요!</h4>
<%--							<p>가입시 등록하신 정보를 확인해주세요.</p>--%>
							<p>${rtn_msg}</p>
						<button class="find_id_btn">아이디 찾기</button>
						<button class="find_id_login">로그인하기</button>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</article>
	</section>
	</jsp:body>
</layout:basicFrame>