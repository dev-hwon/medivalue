<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<layout:basicFrame>
	<jsp:attribute name="stylesheet">
		<link rel="stylesheet" href="/resources/css/main.css?v=20211021"/>
		<link rel="stylesheet" href="/resources/css/nice-select.css" />
		<style type="text/css">
			.d-none {
				display: none;
			}
			.td_content .td_ques .img img {
				padding: 5px;
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
				
				var $tdList=$("#sub4_1 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .table_div ul .td .td_list");
				var $tdCdelete=$("#sub4_1 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .table_div ul .td .td_content .td_ques .util_wrap .delete_btn");
				var $tdClose=$("#sub4_1 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup .dep_close");
	
				$tdList.on("click", function  () {
					
					if (!$(this).hasClass("on")) {
						
						var view_idx = $(this).parent().attr("id").split("_")[1];
						var formData = {
								view_idx : view_idx
						};
						$.ajax({
							url : '/member/rest/mypage/question/view',
							type : 'post',
							cache : false,
							data : formData,
							dataType : 'json',
						   	success:function(data){
					        	if(data.rtn_code == '200'){
					        		const rid = "#view_" + view_idx;
					        		$(rid + " .td_content .td_ques .img").empty();
					        		
					        		const q_f_list = data.q_f_list;
					        		$.each(q_f_list, function(i){
					        			$(rid + " .td_content .td_ques .img").append("<img src=\"" + q_f_list[i].fd_file_info + "\" width=\"462\" height=\"261\" border=\"0\" alt=\"\" />");
					        		});
					        		
					        		if (data.q_item.fd_contents_answer != "") {
					        			$(rid + " .td_answ").removeClass("d-none");
					        			$(rid + " .awswer_txt").html(data.q_item.fd_contents_answer.replace(/\n/g, '<br/>'));
					        		} else {
					        			$(rid + " .td_answ").addClass("d-none");
					        		}
					        		
					        	}else{
					        		alert(data.rtn_msg);
					        	}
						   	},
						   	error:function(request,status,error){
						   		alert("처리 중 문제가 발생했습니다. 다시 시도해 주세요.");
						    }
						});
					
					}
					
					if ($(this).hasClass("on")) {
						$(this).removeClass("on").next().stop().slideUp();
					}else {
						$(this).addClass("on").next().stop().slideDown();
					}
				});
	
				$tdCdelete.on("click", function  () {
					$("#sub4_1 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup").css("display","block")
					$("#black").css("display","block");
					
					const view_idx = $(this).closest(".td").attr("id").split("_")[1];
					
					$(".delete_popup .btn_wrap .ok_btn").on("click", function() {
						if(typeof(view_idx) !='undefined' && view_idx !='0' && view_idx !=''){
							var formData = {view_idx : view_idx };
							
							$.ajax({   
								url : '/member/rest/mypage/question/delete',
								type : 'post',
								cache : false,
								data : formData,
								dataType : 'json',
							   	success:function(data){
						        	if(data.rtn_code == '200'){
						        		location.replace('/member/mypage/question/list');
						        	}else{
						        		alert(data.rtn_msg);
						        	}
							   	},
							   	error:function(request,status,error){
							   		alert("처리 중 문제가 발생했습니다. 다시 시도해 주세요.");
							    }
							});
						}
					});
				});
	
				$tdClose.on("click", function  () {
					$("#sub4_1 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup").css("display","none")
					$("#black").css("display","none");
				});
	
				$("#sub4_1 .cnt1 .area .real_area .wrap .right .right_txt .rt_cnt1 .delete_popup .btn_wrap .cancel_btn").on("click", function  () {
					$tdClose.click()
				});
	
				$("#black").on("click", function  () {
					$tdClose.click()
				});
				
				$(".write_btn").on("click", function() {
					location.replace('/member/mypage/question/write');
				});
				
				$(".modi_btn").on("click", function() {
					var view_idx = $(this).closest(".td").attr("id").split("_")[1];
					
					if(typeof(view_idx) !='undefined' && view_idx != '0'){
						$("#modify_view_idx").val(view_idx);
						$("#f_question_view").submit();						
					}else{
						alert("처리 중 문제가 발생했습니다. 다시 시도해 주세요.");
					}
				});
			});
		</script>
		${pageNavi.script}
	</jsp:attribute>
	<jsp:body>
		<section id="sub4_1" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<layout:leftFrame/>
							
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>1:1문의</h4>
									</div>
								</div>
								
								<form id="f_question_view" name="f_question_view" action="/member/mypage/question/modify" method="post">
									<input type="hidden" name="modify_view_idx" id="modify_view_idx" value=""/>
								</form>
								
								<div class="right_txt">
									<div class="rt_cnt1">
										<div class="table_div">
											<ul>
												<li class="th clear">
													<h5 class="one_th1">번호</h5>
													<h5 class="one_th2">카테고리</h5>
													<h5 class="one_th3">제목</h5>
													<h5 class="one_th4">작성자</h5>
													<h5 class="one_th5">작성일</h5>
													<h5 class="one_th6">상태</h5>
												</li>
												<c:if test="${!empty  q_list}">
												<c:forEach var="item" items="${q_list}" varStatus="status">
												<li class="td" id="view_${item.pk_idx }">
													<div class="td_list clear">
														<p class="one_td1">${pageNavi.totalCount - ((pageNavi.nowPage - 1) * pageNavi.pageSize + status.index) }</p>
														<p class="one_td2">${item.type_info}</p>
														<p class="one_td3">${item.fd_title}</p>
														<p class="one_td4"><span>${item.fd_reg_id}</span></p>
														<p class="one_td5">${item.fd_reg_date}</p>
														<p class="one_td6 <c:if test='${item.fd_state eq "BQS003"}'>on</c:if>">${item.state_info}</p>
													</div>
	
													<div class="td_content">
														<div class="td_ques">
															<c:if test="${item.order_info ne '' }">
																<h5>주문내역 [${item.order_info}]</h5>
															</c:if>
															
															<div class="img"></div>
															<p>${fn:replace(item.fd_contents_question, newLineChar, "<br/>")}</p>
															<div class="clear">
																<div class="util_wrap clear">
																	<button class="modi_btn">수정</button>
																	<button class="delete_btn">삭제</button>
																</div>
															</div>
														</div>
	
														<div class="td_answ">
															<span class="mark">답변</span>
															<p class="awswer_txt"></p>
														</div>
													</div>
												</li>
												</c:forEach>
												</c:if>
												<c:if test="${empty q_list}">
													<li class="td">
														<div class="td_list clear">
														게시글이 없습니다.
														</div>
													</li>
												</c:if>
											</ul>
										</div>
	
										<div class="delete_popup">
											<button class="dep_close"><img src="/resources/images/main/popup_close.png" width="16" height="16" border="0" alt="" /></button>
											<h5>게시물을 삭제하시겠습니까?</h5>
											<div class="btn_wrap">
												<button class="cancel_btn">취소</button>
												<button class="ok_btn">확인</button>
											</div>
										</div>
	
										<div class="pd_list_paging">
											${pageNavi.navi}
										</div>
									</div>
	
									<div class="clear">
										<button class="write_btn">글쓰기</button>
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