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
		<section id="sub4_5" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<h3>고객센터</h3>
							
								<ul>
									<li><button>1:1문의</button></li>
									<li><button>공지사항</button></li>
									<li class="on"><button>이용안내</button></li>
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
										<h4>이용안내</h4>
									</div>
								</div>
								<div class="right_txt">
									<div class="rt_cnt1">
										<div class="img">
											<img src="/resources/images/custom/company/company_introduce.jpg" alt="회사시용안내">
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