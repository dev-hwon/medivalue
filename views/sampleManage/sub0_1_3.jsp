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
		<section id="sub0_1_3" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="find_pw_wrap">
							<h3>비밀번호 찾기</h3>
							
							<span class="icon"><img src="/resources/images/main/find_pw_icon.jpg" width="70" height="53" border="0" alt="" /></span>
							<h4>이메일로 인증 완료 후<br>비밀번호를 재발급 받으세요!</h4>
							<p>입력하신 el***@gmail.com으로 인증번호가 발송되며<br>인증 후 비밀번호가 재발급됩니다.<br>전송량이 많은 경우 이메일 전송이 지연될 수 있습니다.</p>
							<button>인증번호 받기</button>
						</div>
					</div>
				</div>
			</article>
		</section>
	</jsp:body>
</layout:basicFrame>