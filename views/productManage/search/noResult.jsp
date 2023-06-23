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
		<script type="text/javascript" src="/resources/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="/resources/js/jquery.nice-select.js"></script>
		<script type="text/javascript" src="/resources/js/common.js?20220121"></script>
		<script type="text/javascript" src="/resources/js/sub1.js"></script>
		<script type="text/javascript" src="/resources/js/bxhis.js"></script>
		<script type="text/javascript">
			$(document).ready(function (){
				$(".bxslider1_1_1").bxSlider({
					auto : false,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});
	
				$(".bxslider1_1_2").bxSlider({
					auto : false,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});
				
				$("#btn_result_view").on("click",function(){
					$("#search_write").css("display","block");
					$("#black").css("display","block");
					$("#req_write_searchText").val($("#searchString").val());
					if($("#searchString").val().trim().length==0){
						$("#req_write_searchText").attr("readonly", false);
					}
				});
				
				$("#btn_search_medi").on("click",function(){
					$("#f_add_search").attr("action", "/product/search/medi/list");
					$("#f_add_search").submit();
				});
				$("#btn_search_compare").on("click",function(){
					$("#f_add_search").attr("action", "/product/search/compare/list");
					$("#f_add_search").submit();
				});
				
				$(".cp_close").on("click",function(){
					$("#search_write").css("display","none");
		   			$("#black").css("display","none");
		   			$('#search_write')[0].reset();
				});
				
				$("#btn_result_write").on("click",function(){
					if($.trim($("#req_write_searchText").val()) ==''){
						$("#pop_alarm_msg").text("검색어를 확인해주세요.");
						$(".popup_message_type_1").css("display","block");
						return;
					}else if($.trim($("#req_write_searchMemo").val()).length <=0){
						$("#pop_alarm_msg").text("불편사항 및 요청사항을 확인해주세요.");
						$(".popup_message_type_1").css("display","block");
						return;
					}else{						
						var formData = $("#f_search_write").serialize();
						$.ajax({   
							url : '/product/search/rest/result/write',
							type : 'post',
							cache : false,
							data : formData,
							dataType : 'json',
						   	success:function(data){		    			   		
						   		if(data.rtn_code !='200'){
						   			$("#pop_alarm_msg").text(data.rtn_msg);
									$(".popup_message_type_1").show();
						   		}else{
						   			$("#search_write").css("display","none");
						   			$("#black").css("display","none");
						   			$('#search_write')[0].reset();
						   		}
						   	},
						   	error:function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    }
						});
					}
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub1_1" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<h3><span>${searchString} ${searchAddString}</span>에 대한 검색결과가 없습니다.</h3>
						<div class="result_sch">
							<form id="f_add_search" name="f_add_search" method="post" action="${action}">
							<ul>
								<li class="clear">
									<h4>결과 내 검색</h4>
									<div class="form_cont">
										<label for="searchAddString"><c:if test="${searchAddString eq ''}">검색어를 입력하세요</c:if></label>
										<input type="hidden" id="searchMainColumn" name="searchColumn" value="${searchColumn}"/>
										<input type="hidden" id="searchMainString" name="searchString" value="${searchString}"/>
										<input type="text" id="searchAddString" name="searchAddString" value="${searchAddString}"/>
										<button class="sch_btn" type="button" id="btn_add_search"><img src="/resources/images/main/search_btn4.png" width="13" height="13" border="0" alt="" /></button>
									</div>
							
									<div class="checks">											
										<input type="radio" id="searchAddOptionState_1" name="searchAddOptionState" <c:if test="${searchAddOptionState ne 'N' }">checked="checked"</c:if> value="Y">
										<label for="searchAddOptionState_1">포함</label>
									</div>
							
									<div class="checks">
										<input type="radio" id="searchAddOptionState_2" name="searchAddOptionState" <c:if test="${searchAddOptionState eq 'N' }">checked="checked"</c:if> value="N">
										<label for="searchAddOptionState_2">제외</label>
									</div>
								</li>
								<%--
								<li class="clear">
									<h4>결과 내 카테고리</h4>
									
									<select name="" id="" class="nis">
										<option value="">전체목록보기</option>
										<option value="">전체목록보기</option>
										<option value="">전체목록보기</option>
										<option value="">전체목록보기</option>
									</select>
								</li>
								 --%>
							</ul>
							</form>
						</div>
					</div>
				</div>
			</article>	
			<article class="cnt2 noti">
				<div class="area">
					<div class="real_area">
						<div class="tit clear">
							<h3>이런 제품들은 어떠세요?</h3>
							<p>MD PICK</p>
							<button type="button" id="btn_result_view" class="comments"><img src="/resources/images/main/comment_icon.png" width="13" height="13" border="0" alt="" />검색결과에 의견 남기기</button>
							<layout:searchWriteFormFrame/>
						</div>
						<div class="txt">
						<c:if test="${!empty menu_list_1}">
							<ul class="depth1 bxslider1_1_1">
							<c:forEach var="mn_item" items="${menu_list_1}" varStatus="state">
								<c:if test="${state.first }">
										<li>
											<ul class="depth2 clear">
								</c:if>
									<li>
										<a href="/product/detail?view_id=${mn_item.fk_tpsm_idx}">
											<div class="img">
												<img src="${mn_item.view_image}" width="250" height="321" border="0" alt="" />
												<div class="wish_wrap">
													<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
													<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
												</div>
											</div>
					
											<div class="info">
												<h4 class="pd_tit">[${mn_item.fd_company_info }] ${mn_item.fd_product_name}</h4>
												<div class="price clear">
													<%--
													<strong class="percent">10%</strong>
													 --%>
													<p><fmt:formatNumber value="${mn_item.shop_product_amount}" pattern="#,###" />원</p>
												</div>
												<div class="cost"><%--<p>0,000,000원</p> --%></div>
											</div>
										</a>
									</li>
									<c:if test="${state.index==3 and !state.last}">
											</ul>
										</li>
										<li>
											<ul class="depth2 clear">
									</c:if>
									<c:if test="${state.last}">
											</ul>
										</li>
									</c:if>
							</c:forEach>
							</ul>
						</c:if>
						</div>
					</div>
				</div>
			</article>
			<c:if test="${!empty menu_list_2}">
				<article class="cnt3 noti">
					<div class="area">
						<div class="real_area">
							<div class="tit clear">
								<h3>지금 많은 분들이 찾으시는 제품이에요.</h3>
							</div>
							<div class="txt">
								<ul class="depth1 bxslider1_1_2">
								<c:forEach var="mn_item" items="${menu_list_2}" varStatus="state">
									<c:if test="${state.first }">
											<li>
												<ul class="depth2 clear">
									</c:if>
										<li>
											<a href="/product/detail?req_view_idx=${mn_item.fk_tpsm_idx}">
												<div class="img">
													<img src="${mn_item.view_image}" width="250" height="321" border="0" alt="" />
													<div class="wish_wrap">
														<button type="button" class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
														<button type="button" class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
													</div>
												</div>
						
												<div class="info">
													<h4 class="pd_tit">[${mn_item.fd_company_info }] ${mn_item.fd_product_name}</h4>
													<div class="price clear">
														<%--
														<strong class="percent">10%</strong>
														 --%>
														<p><fmt:formatNumber value="${mn_item.shop_product_amount}" pattern="#,###" />원</p>
													</div>
													<div class="cost"><%--<p>0,000,000원</p> --%></div>
												</div>
											</a>
										</li>
										<c:if test="${state.index==3 and !state.last}">
												</ul>
											</li>
											<li>
												<ul class="depth2 clear">
										</c:if>
										<c:if test="${state.last}">
												</ul>
											</li>
										</c:if>
								</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</article>
			</c:if>
			<%--  히스토리 영역 시작 --%>
			<layout:historyFrame/>
			<%--  히스토리 영역 끝 --%>
		</section>
	</jsp:body>
</layout:basicFrame>