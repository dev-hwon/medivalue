<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20220114"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<style type="text/css">
			.board-image-area {
				padding-top: 20px;
			}
			#boardImage {
				max-width: 750px;
			}
		</style>
	</jsp:attribute>
	<jsp:attribute name="javascript">
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				var rtn_code = '${rtn_code}';
				if(rtn_code != '200'){
					alert("${rtn_msg}");
					location.href = "/index";
				}
				
				$(".list_go").on("click", function(){
					location.href = "/notice/list";
				});

				$(".terms1").on("click", function(){
					location.href = "/terms/info?tab=1";
				});	
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub4_4" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<layout:leftFrame/>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>공지사항</h4>
									</div>
								</div>
							
								<div class="right_txt">
									<div class="rt_cnt1">
										<table>
											<tbody>
												<tr>
													<td class="notice_td1">
														<p>${num}</p>
													</td>
	
													<td class="notice_td2">
														<p>${contents.fd_title}</p>
													</td>
	
													<td class="notice_td3">
														<p>${contents.fd_reg_id}</p>
													</td>
	
													<td class="notice_td4">
														<p><fmt:formatDate value="${contents.fd_reg_date}" pattern="yyyy.MM.dd"/></p>
													</td>
	
													<td class="notice_td5">
														<p>${contents.fd_view_cnt}</p>
													</td>
												</tr>
	
												<tr class="tr_comment">
													<td colspan="5" style="width: 100%;">
														<p>${content}</p>
														<div class="board-image-area">
														<c:if test="${!empty fileInfo}">
															<c:if test="${fn:endsWith(fileInfo.fd_file_name, '.jpg') || fn:endsWith(fileInfo.fd_file_name, '.JPG') 
															           || fn:endsWith(fileInfo.fd_file_name, '.png') || fn:endsWith(fileInfo.fd_file_name, '.PNG')}">
																<img id="boardImage" src="<c:out value="${fileInfo.fd_file_path}${fileInfo.fd_file_name}"/>" border="0" alt="" />
															</c:if>
														</c:if>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
	
									<div class="clear">
										<button class="list_go">목록</button>
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