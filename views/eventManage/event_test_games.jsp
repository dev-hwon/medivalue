<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<c:set var="check_version_info" value="2023052501"/>
        <link rel="stylesheet" href="/resources/css/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="/resources/css/common.css?v=${check_version_info}"/>
		<link rel="stylesheet" href="/resources/css/headfoot.css?v=${check_version_info}"/>
		<link rel="stylesheet" href="/resources/css/popup.css?v=${check_version_info}"/>
	    <link rel="stylesheet" href="/resources/css/event/2023/evt_test.css?v=${check_version_info}" />
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/swiper-bundle.min.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
	</jsp:attribute>
	<jsp:body>

		<div id="event_test" class="evt_container">
			<div class="container">
				<section>
					<h3>※ 숫자 업/다운</h3>

				</section>
				<section>
					<h3>※ 숫자 업/다운</h3>
					<form action="#" name="frm" onsubmit="">
						<b>숫자입력 : </b>
						<input type="text" name="num" size="5" onkeydown="if(event.keyCode==13) check(value); " >
					</form>
					<button type="button" onclick="reset()">초기화</button>
					<div id="out"></div>
				</section>
			</div>
        </div>
		<script>
			let randomNumber;
			let cnt = 0;
			let out = document.getElementById('out');
			let frm = document.querySelector('form[name=frm]');
			window.onload = function() {
				randomNumber = parseInt(Math.random()*100)+1;
			}
			function check(value) {
				if(value === "") {
					out.innerHTML+=": 값을 입력해 주세요.<br />";
					return;
				}
				cnt++;
				if(value > randomNumber) {
					out.innerHTML+=":"+value+"보다 작습니다.<br />";
				} else if ( value < randomNumber) {
					out.innerHTML+=":"+value+"보다 큽니다.<br />";
				} else {
					out.innerHTML="<h4>축하합니다...정답은"+ randomNumber +"입니다.</h4>";
				}

				if(cnt > 10) {
					out.innerHTML="<h4>다음기회에</h4>";
				}
				frm.num.value ='';
				frm.num.focus();
			}
			function reset() {
				frm.num.value ='';
				frm.num.focus();
				cnt = 0;
				randomNumber = parseInt(Math.random()*100)+1;
				out.innerHTML="";
			}
		</script>
	</jsp:body>
</layout:basicFrame>
