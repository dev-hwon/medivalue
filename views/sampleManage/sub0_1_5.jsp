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
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				
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
						<h4>고객님의<br>아이디 찾기 입력 정보를 확인해주세요!</h4>
						<p>가입시 등록하신 정보를 확인해주세요.</p>
						<button class="find_id_btn">아이디 찾기</button>
						<button class="find_id_login">로그인하기</button>
					</div>
				</div>
			</div>
		</article>
	</section>
	</jsp:body>
</layout:basicFrame>