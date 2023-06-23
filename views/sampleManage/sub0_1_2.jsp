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
		<section id="sub0_1_2" class="sub">
		<article class="cnt1">
			<div class="area">
				<div class="real_area">
					<div class="find_pw_wrap">
						<h3>비밀번호 찾기</h3>
						
						<ul>
							<li class="find_pw_li1">
								<h4>이름</h4>
								<div class="form_cont">
									<input type="text" id="accountName">
									<label for="accountName">고객님의 이름을 입력해주세요.</label>
								</div>
							</li>
										
							<li class="find_pw_li2">
								<h4>아이디</h4>
								<div class="form_cont">
									<input type="text" id="accountId">
									<label for="accountId">아이디를 입력해주세요.</label>
								</div>
							</li>
										
							<li class="find_pw_li3">
								<h4>이메일</h4>
								<div class="form_cont">
									<input type="text" id="accountEmail" >
									<label for="accountEmail">이메일 주소를 입력해주세요.</label>
								</div>
							</li>
										
							<li class="find_pw_li4">
								<a href="">
									<p>찾기</p>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</article>
	</section>
	</jsp:body>
</layout:basicFrame>