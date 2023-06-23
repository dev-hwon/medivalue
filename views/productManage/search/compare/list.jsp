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
			var proc_state = true;
			$(document).ready(function (){
				
				var res_option1_val = '${searchAddOption1}';
				var res_option2_val = '${searchAddOption2}';
				var res_option3_val = '${searchAddOption3}';
				var res_option4_val = '${searchAddOption4}';
				
				if(typeof res_option1_val != 'undefined' && res_option1_val !=''){load_filter_check(res_option1_val, 1);}
				if(typeof res_option2_val != 'undefined' && res_option2_val !=''){load_filter_check(res_option2_val, 2);}
				if(typeof res_option3_val != 'undefined' && res_option3_val !=''){load_filter_check(res_option3_val, 3);}
				if(typeof res_option4_val != 'undefined' && res_option4_val !=''){load_filter_check(res_option4_val, 4);}
				
				$("input:checkbox[name='searchOption1']").on("click", function(){
					filter_check(this,1);
					$("#f_add_search").submit();
				});
				$("input:checkbox[name='searchOption2']").on("click", function(){
					filter_check(this,2);
					$("#f_add_search").submit();
				});
				$("input:checkbox[name='searchOption3']").on("click", function(){
					filter_check(this,3);
					$("#f_add_search").submit();
				});
				$("input:checkbox[name='searchOption4']").on("click", function(){
					filter_check(this,4);
					$("#f_add_search").submit();
				});
				$(document).on("click","button[id^='btn_del_filter']",function(){
					var sel_id = $(this).parent().find("p").attr("id").replace("filter_","");
					if(typeof(sel_id) !='undefied'){
						$("#"+sel_id).trigger("click");
						$(this).parent().remove();	
					}
				});

				$("#searchOrderType").on("change",function(){
					$("#f_add_search").submit();
				});
				
				$("#btn_search_medi").on("click",function(){
					$("#f_add_search").attr("action", "/product/search/medi/list");
					$("#f_add_search").submit();
				});
				$("#btn_search_compare").on("click",function(){
					$("#f_add_search").attr("action", "/product/search/compare/list");
					$("#f_add_search").submit();
				});

				$("#btn_result_view").on("click",function(){
					$("#search_write").css("display","block");
					$("#black3").css("display","block");
					$("#req_write_searchText").val($("#searchString").val());
					if($("#searchString").val().trim().length==0){
						$("#req_write_searchText").attr("readonly", false);
					}
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
						   			$("#black3").css("display","none");
						   			//$('#search_write')[0].reset();
						   		}
						   	},
						   	error:function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    }
						});
					}
				});

				$(".cp_close").on("click",function(){
					$("#search_write").css("display","none");
		   			$("#black").css("display","none");		   			
				});

				$("#btn_add_search").on("click",function(){
					$("#f_add_search").submit();
				});
				
				$("#searchAddCategory").on("change", function(){
					$("#f_add_search").submit();
				});
				
				$("button[id^='btn_cart']").on("click",function(){
					var login_check = js_login_check();
					if(login_check){
						var tpsm_idx = $(this).parent().parent().parent().find("input[name='tpsm_idx']").val();
						var pd_title = $(this).parent().parent().parent().children("div.info").children("div.info_wrap").find(".pd_tit").text();
						var pd_cnt = 1;
						if(typeof tpsm_idx != 'undefined' && tpsm_idx !='' && tpsm_idx != '0'){
							var formData = {
									"list[0].fk_tpsm_idx":tpsm_idx,
									"list[0].cnt":pd_cnt
							}
							//google tag manager
							$.ajax({
								url : '/basket/rest/save',
								type : 'post',
								cache : false,
								data : formData,
								dataType : 'json',
							   	success:function(data){
							   		if(data.rtn_code != '200'){
							   			$("#pop_alarm_msg").text(data.rtn_msg);
										$(".popup_message_type_1").show();
							   		}else{
							   			popAlarm(pd_title, pd_cnt);
										ad_log_naver("3", "1");
										labbit_add_to_cart(data.productInfoList);
							   		}							   									   		
							   		proc_state = true;
							   	},
							   	error:function(request,status,error){
							        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							        proc_state = true;
							    }
							});
						}
					}
				});
				
				$("button[id^='btn_wish']").on("click",function(e){
					var login_check = js_login_check();
					if(login_check){
						var tpsm_idx = $(this).parent().parent().find("input[name='tpsm_idx']").val();
						if(typeof tpsm_idx != 'undefined' && tpsm_idx !='' && tpsm_idx != '0'){
							if(proc_state){								
								var wish_state = 'N';
								if(!$(this).hasClass("on")){
									wish_state = 'Y';
								}
								proc_state = false; 
								var formData = {tpsm_idx : tpsm_idx,
												wish_state : wish_state
												};
								$.ajax({   
									url : '/wish/rest/save',
									type : 'post',
									cache : false,
									data : formData,
									dataType : 'json',
								   	success:function(data){
								   		if(data.rtn_code !='200'){
								   			$("#pop_alarm_msg").text(data.rtn_msg);
											$(".popup_message_type_1").show();
											if($(e).hasClass("on")){
												$(e).removeClass("on");
											}
								   		}				   		
								   		proc_state = true;
								   	},
								   	error:function(request,status,error){
								        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								        proc_state = true;
								        if($(e).hasClass("on")){
											$(e).removeClass("on");
										}
								    }
								});
							}else{
								$("#pop_alarm_msg").text("처리중입니다. 잠시만 기다려 주세요.");
								$(".popup_message_type_1").show();								
								return;
							}
						}else{
							$("#pop_alarm_msg").text("제품을 담을수 없습니다.");
							$(".popup_message_type_1").css("display","block");
							if($(this).hasClass("on")){
								$(this).removeClass("on");
							}
						}	
					}else{
						if($(this).hasClass("on")){
							$(this).removeClass("on");
						}
					}
				});
			});
			
			function load_filter_check(check_val, type){
				var temp_option_val = check_val.split("[{|}]");
				if(temp_option_val instanceof Array){
					$("input:checkbox[name='searchOption"+type+"']").each(function(){
						if(temp_option_val.indexOf($(this).val())>-1){
							$(this).prop("checked", true);
							filter_check(this,type);
						}
					});	
				}
			}

			function filter_check(e, search_type){
				var dy_option = "";
				var option_val = [];
				var check_val = $(e).val();
				var temp_name= $(e).attr("name");
				$(document).find("div[id^='filter_check_area_"+search_type+"']").remove();
				if($(e).is(":checked")==false){
					$("input:checkbox[name='"+temp_name+"']:input[value='"+check_val+"']").prop("checked", false);
				}else{
					$("input:checkbox[name='"+temp_name+"']:input[value='"+check_val+"']").prop("checked", true);
				}
				$("input:checkbox[name='"+temp_name+"']").each(function(){
					check_val = $(this).val();
					temp_nam = $(this).attr("name");
					if($(this).is(":checked")){
						if(option_val.indexOf(check_val)<=-1){
							option_val.push(check_val);
							dy_option +="<div class=\"ch_filt\" id=\"filter_check_area_"+search_type+"\">";			
								dy_option +="<p id=\"filter_"+$(this).attr("id")+"\">";
									dy_option += ($(this).parent().find("label").text().trim());
								dy_option +="</p>";
								dy_option +="<button type=\"button\" id='btn_del_filter'>";
									dy_option +="<img src='/resources/images/main/ch_filt_delete.jpg' width='8' height='8' border='0' alt='' />"
								dy_option +="</button>";
							dy_option +="</div>";
							$("input:checkbox[name='"+temp_name+"']:input[value='"+check_val+"']").prop("checked", true);
						}
					}else{
						$("input:checkbox[name='"+temp_name+"']:input[value='"+check_val+"']").prop("checked", false);
						//$("p[id='"+$(this).attr("id")+"']").parent().find("#btn_del_filter").trigger("click");
					}
				});

				$("#select_filter").append(dy_option);
				$(document).find("#searchAddOption"+search_type).remove();
				if(option_val.length>0){
					var input_option = "<input type=\"hidden\" id=\"searchAddOption"+search_type+"\" name=\"searchAddOption"+search_type+"\" value=\""+(Array.from(new Set(option_val)).join('[{|}]'))+"\" / >";
					$("#f_add_search").append(input_option);
				}
				filter_view();
			}

			function filter_view(){
				if($("#select_filter > div.ch_filt").length>0){
					$(".sub .choice_filter").css("display","block");
					//$(".sub .cnt1 .area .real_area .right_cnt .asso").css("display","none")
				}else{
					$(".sub .choice_filter").css("display","none");
				}
			}
		</script>
		${pageNavi.script}
	</jsp:attribute>
	<jsp:body>
		<section id="sub1_3" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area clear">
						<div class="left_filter">
							<div class="wrap">
								<ul class="depth1">
									<li class="filter_1">
										<div class="filter_tit clear">
											<h4>카테고리</h4>
											<button class="updown" type="button"><img src="/resources/images/main/filter_up.png" width="12" height="8" border="0" alt="" /></button>
										</div>
										<div class="d2_wrap">
											<ul class="depth2">
												<c:if test="${!empty group_search_cate_1_list }">
													<c:forEach var="o_item" items="${group_search_cate_1_list}"  varStatus="state">
														<c:if test="${state.index<=5}">
															<li>
																<input id="searchOption1_chk${state.index}" name="searchOption1" type="checkbox" value="${o_item.fk_cate_1_idx}">
																<label for="searchOption1_chk${state.index}">${o_item.cate_name}</label>
															</li>
														</c:if>
													</c:forEach>
												</c:if>
											</ul>
											<c:if test="${group_search_cate_1_list_size>=3 }">
												<button class="more_view" style="display: block;" type="button">더보기<img src="/resources/images/main/filter_down.png" width="9" height="5" border="0" alt="" /></button>
											</c:if>
											<c:if test="${group_search_cate_1_list_size>=5 }">
												<button class="full_view" style="display: block;" type="button">전체보기<img src="/resources/images/main/filter_view.png" width="5" height="9" border="0" alt="" /></button>
											</c:if>
											<div class="filt_popup filter_1_popup">
												<div class="filter_pu_tit">
													<h5>카테고리 전체</h5>
												</div>	
												<div class="filter_pu_txt">
													<ul class="clear">
														<c:if test="${!empty group_search_cate_1_list }">
															<c:forEach var="o_item" items="${group_search_cate_1_list}"  varStatus="state">
																<li>
																	<input id="f1Chk${state.index}" name="searchOption1" type="checkbox" value="${o_item.fk_cate_1_idx }">
																	<label for="f1Chk${state.index}">${o_item.cate_name}</label>
																</li>
															</c:forEach>
														</c:if>
													</ul>
												</div>
												<div class="filter_pu_close">
													<button type="button">닫기</button>
												</div>
											</div>
										</div>
									</li>
									<li class="filter_2">
										<div class="filter_tit clear">
											<h4>종류</h4>
											<button class="updown" type="button"><img src="/resources/images/main/filter_up.png" width="12" height="8" border="0" alt="" /></button>
										</div>
										<div class="d2_wrap">
											<ul class="depth2">
												<c:if test="${!empty group_search_cate_2_list }">
													<c:forEach var="o_item" items="${group_search_cate_2_list}"  varStatus="state">
														<c:if test="${state.index<=5}">
															<li>
																<input id="filt2_chk${state.index}" name="searchOption2" type="checkbox" value="${o_item.fk_cate_2_idx}">
																<label for="filt2_chk${state.index}">${o_item.cate_name}</label>
															</li>
														</c:if>
													</c:forEach>
												</c:if>
											</ul>
											<c:if test="${group_search_cate_2_list_size>=3 }">
												<button class="more_view" style="display: block;" type="button">더보기<img src="/resources/images/main/filter_down.png" width="9" height="5" border="0" alt="" /></button>
											</c:if>
											<c:if test="${group_search_cate_2_list_size>=5 }">
												<button class="full_view" style="display: block;" type="button">전체보기<img src="/resources/images/main/filter_view.png" width="5" height="9" border="0" alt="" /></button>
											</c:if>
											<div class="filt_popup filter_2_popup">
												<div class="filter_pu_tit">
													<h5>종류 전체</h5>
												</div>	
												<div class="filter_pu_txt">
													<ul class="clear">
														<c:if test="${!empty group_search_cate_2_list }">
															<c:forEach var="o_item" items="${group_search_cate_2_list}"  varStatus="state">
																<li>
																	<input id="f2Chk${state.index}" name="searchOption2" type="checkbox" value="${o_item.fk_cate_2_idx }">
																	<label for="f2Chk${state.index}">${o_item.cate_name}</label>
																</li>
															</c:forEach>
														</c:if>
													</ul>
												</div>
												<div class="filter_pu_close">
													<button type="button">닫기</button>
												</div>
											</div>
										</div>
									</li>

									<li class="filter_3">
										<div class="filter_tit clear">
											<h4>제조사</h4>
											<button class="updown" type="button"><img src="/resources/images/main/filter_up.png" width="12" height="8" border="0" alt="" /></button>
										</div>
										<div class="d2_wrap">
											<ul class="depth2">
												<c:if test="${!empty group_search_company_list }">
													<c:forEach var="o_item" items="${group_search_company_list}"  varStatus="state">
														<c:if test="${state.index<=5}">
															<li>
																<input id="filt3_chk${state.index}" name="searchOption3" type="checkbox" value="${o_item.fd_company_info}">
																<label for="filt3_chk${state.index}">${o_item.fd_company_info}</label>
															</li>
														</c:if>
													</c:forEach>
												</c:if>
											</ul>
											<c:if test="${group_search_company_list_size>=3 }">
												<button class="more_view" style="display: block;" type="button">더보기<img src="/resources/images/main/filter_down.png" width="9" height="5" border="0" alt="" /></button>
											</c:if>
											<c:if test="${group_search_company_list_size>=5 }">
												<button class="full_view" style="display: block;" type="button">전체보기<img src="/resources/images/main/filter_view.png" width="5" height="9" border="0" alt="" /></button>
											</c:if>
											<div class="filt_popup filter_3_popup">
												<div class="filter_pu_tit">
													<h5>제조사 전체</h5>
												</div>	
												<div class="filter_pu_txt">
													<ul class="clear">
														<c:if test="${!empty group_search_company_list }">
															<c:forEach var="o_item" items="${group_search_company_list}"  varStatus="state">
																<li>
																	<input id="f3Chk${state.index}" name="searchOption3" type="checkbox" value="${o_item.fd_company_info }">
																	<label for="f3Chk${state.index}">${o_item.fd_company_info}</label>
																</li>
															</c:forEach>
														</c:if>
													</ul>
												</div>
												<div class="filter_pu_close">
													<button type="button">닫기</button>
												</div>
											</div>
										</div>
									</li>

									<li class="filter_4">
										<div class="filter_tit clear">
											<h4>규격</h4>
											<button class="updown" type="button"><img src="/resources/images/main/filter_up.png" width="12" height="8" border="0" alt="" /></button>
										</div>
										<div class="d2_wrap">
											<ul class="depth2">
												<c:if test="${!empty group_search_standard_list }">
													<c:forEach var="o_item" items="${group_search_standard_list}"  varStatus="state">
														<c:if test="${state.index<=5}">
															<li>
																<input id="filt4_chk${state.index}" name="searchOption4" type="checkbox" value="${o_item.fd_product_standard}">
																<label for="filt4_chk${state.index}">${o_item.fd_product_standard}</label>
															</li>
														</c:if>
													</c:forEach>
												</c:if>
											</ul>
											<c:if test="${group_search_standard_list_size>=3 }">
												<button class="more_view" style="display: block;" type="button">더보기<img src="/resources/images/main/filter_down.png" width="9" height="5" border="0" alt="" /></button>
											</c:if>
											<c:if test="${group_search_standard_list_size>=5 }">
												<button class="full_view" style="display: block;" type="button">전체보기<img src="/resources/images/main/filter_view.png" width="5" height="9" border="0" alt="" /></button>
											</c:if>
											<div class="filt_popup filter_4_popup">
												<div class="filter_pu_tit">
													<h5>규격 전체</h5>
												</div>	
												<div class="filter_pu_txt">
													<ul class="clear">
														<c:if test="${!empty group_search_standard_list }">
															<c:forEach var="o_item" items="${group_search_standard_list}"  varStatus="state">
																<li>
																	<input id="f4Chk${state.index}" name="searchOption4" type="checkbox" value="${o_item.fd_product_standard }">
																	<label for="f4Chk${state.index}">${o_item.fd_product_standard}</label>
																</li>
															</c:forEach>
														</c:if>
													</ul>
												</div>
												<div class="filter_pu_close">
													<button type="button">닫기</button>
												</div>
											</div>
										</div>
									</li>
									<%--
										옵션 추가
									--%>
								</ul>
								<div class="comments_write">
									<button id="btn_result_view" type="button"><img src="/resources/images/main/comment_icon.png" width="13" height="13" border="0" alt="" />검색결과에 의견 남기기</button>
								</div>
								<layout:searchWriteFormFrame/>
							</div>
						</div>

						<div class="right_cnt">
							<%-- 
							<div class="asso clear">
								<h4>연관검색어</h4>
								<p>타이탄엑스</p>
								<p>타이탄X</p>
								<p>타이탄엑스 파우더</p>
								<p>Titan-X</p>
								<p>Trioss</p>
								<p>타이탄X 골이식재</p>
							</div>
							--%>
							<div class="choice_filter clear">
								<h4>선택된 필터</h4>
								<div class="ch_filt_wrap clear" id="select_filter">
									<%--
									<div class="ch_filt"><p>ABCDEFGHJKLMOPQRSTUVWABCDEFGHJKLMOPQRSTUVW</p><button type="button"><img src="/resources/images/main/ch_filt_delete.jpg" width="8" height="8" border="0" alt="" /></button></div>
									 --%>
								</div>	
								<button type="button" class="reset_btn">초기화</button>
							</div>
							<form id="f_add_search" name="f_add_search" method="post" action="${action}">
							<div class="result_sch">
								<div class="rs_tit clear">
									<h3><span>'${searchString}'</span> 에 대한 검색 결과에요.</h3>
									<select name="searchOrderType" id="searchOrderType" class="nis">
										<%--	<option value="">메디밸류 랭킹순</option>
										 --%>
										 <option value="search_type" <c:if test="${searchOrderType eq 'search_type'}">selected="selected"</c:if>>검색</option>
										<option value="low_price" <c:if test="${searchOrderType eq 'low_price'}">selected="selected"</c:if>>낮은 가격순</option>
										<option value="high_price" <c:if test="${searchOrderType eq 'high_price'}">selected="selected"</c:if>>높은 가격순</option>
										<option value="p_name" <c:if test="${searchOrderType eq 'p_name'}">selected="selected"</c:if>>이름순</option>
									</select>
								</div>
								<div class="rs_txt">
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
										<li class="clear">
											<h4>결과 내 카테고리</h4>
											<select name="searchAddCategory" id="searchAddCategory" class="nis">
												<option value="">전체목록보기</option>
												<c:if test="${!empty group_search_cate_list }">
													<c:forEach var="o_item" items="${group_search_cate_list}" varStatus="state">
														<option value="${o_item.fk_cate_2_idx}" <c:if test="${o_item.fk_cate_2_idx eq searchAddCategory}">selected="selected"</c:if> >${o_item.cate_1_name} > ${o_item.cate_2_name} </option>
													</c:forEach>
												</c:if>
											</select>
										</li>
									</ul>
								</div>
							</div>
							</form>
							<c:if test="${!empty p_list}">
								<c:set var="check_cate" value=""/>
								<c:set var="check_p_cnt" value="0"/>
								<c:set var="check_p_state" value=""/>
								<c:forEach var="p_item" items="${p_list}" varStatus="state" >
									<c:if test="${check_cate != p_item.fk_cate_2_idx}">
										<c:if test="${check_p_cnt != 0}">
												</ul>
											</div>
										</div>
										<c:set var="check_p_cnt" value="0"/>
										</c:if>
										<div class="pd_list pd_list${state.index}">
											<div class="pd_list_tit">
												<h5>${p_item.cate_1_name} - ${p_item.cate_2_name}</h5>
											</div>
										<c:set var="check_p_state" value=""/>
									</c:if>
									<c:if test="${state.first}">
										<div class=pd_list_txt>											
											<strong>가격비교</strong>
											<ul class="depth1">
									</c:if>
									<c:if test="${!state.first}">
										<c:if test="${check_p_state ne p_item.fd_product_group_purchase_yn}">
										<c:if test="${check_cate == p_item.fk_cate_2_idx}">
											</div>
										</c:if>										
										<div class="pd_list_txt">
											<strong>가격비교</strong>
											<ul class="depth1">
										</c:if>
									</c:if>
										<li class="clear <c:if test="${p_item.fd_option_count > 0}">option </c:if> <c:if test="${!empty p_item.fd_product_insure_code}">insure</c:if>">
											<input type="hidden" name="tpsm_idx" id="tpsm_idx" value="${p_item.tpsm_idx }" />
											<input type="hidden" name="tsmi_idx" id="tsmi_idx" value="${p_item.fk_tsmi_idx }" />
											<div class="img <c:if test="${p_item.fd_event_yn eq 'Y'}">payback</c:if> <c:if test="${p_item.fd_stock_sell_yn eq 'N'}">soldout</c:if>">
												<div class="icon_list">
													<div class="li li_option">
														<div>
															<div class="desc">규격<br>확인</div>
														</div>
													</div>
													<div class="li li_insure">
														<div>
															<div class="desc">보험<br>재료</div>
														</div>
													</div>
												</div>
												<c:if test="${p_item.fd_img_path_thumbnail eq ''}">
													<img style="object-fit: contain;" src="${p_item.fd_img_path}" border="0" alt="" onerror="this.src='/resources/images/dummy/250x321.png'" />
												</c:if>
												<c:if test="${p_item.fd_img_path_thumbnail ne ''}">
													<img style="object-fit: contain;" src="${p_item.fd_img_path_thumbnail}"border="0" alt="" onerror="this.src='/resources/images/dummy/250x321.png'"/>
												</c:if>
											</div>
											
											<div class="info">
												<div class="info_wrap">
													<h4 class="pd_tit">${p_item.fd_product_name}</h4>
													<p class="standard"><c:if test="${p_item.fd_product_standard ne '' }">규격 ㅣ ${p_item.fd_product_standard}</c:if></p>
													<p class="manu"><c:if test="${p_item.fd_company_info ne '' }">제조사 ㅣ ${p_item.fd_company_info}</c:if></p>
													<p class="pack"><c:if test="${p_item.fd_product_unit ne '' }">포장단위 ㅣ ${p_item.fd_product_unit }</c:if></p>
												</div>
											</div>
											<div class="price_comp">
												<h5>가격비교</h5>
												<ul class="depth2">
													<li class="<c:if test="${p_item.edent_amount eq p_item.compare_min_amount }">low_price</c:if>">
														<button type="button" class="clear">
															<h6>eDENT</h6>
															<div class="p_wrap"><p><fmt:formatNumber value="${p_item.edent_amount}" pattern="#,###" />원</p></div>
														</button>
													</li>
													<li class="<c:if test="${p_item.dvmall_amount eq p_item.compare_min_amount }">low_price</c:if>">
														<button type="button" class="clear">
															<h6>DVmall</h6>
															<div class="p_wrap"><p><fmt:formatNumber value="${p_item.dvmall_amount}" pattern="#,###" />원</p></div>
														</button>
													</li>
													<li class="<c:if test="${p_item.seil_amount eq p_item.compare_min_amount }">low_price</c:if>">
														<button type="button" class="clear">
															<h6>SeilGlobal</h6>
															<div class="p_wrap"><p><fmt:formatNumber value="${p_item.seil_amount}" pattern="#,###" />원</p></div>
														</button>
													</li>
												</ul>
											</div>
										</li>
										<c:set var="check_p_cnt" value="${check_p_cnt+1}"/>
										<c:if test="${state.last}">
												</ul>
											</div>
										</div>
										</c:if>
										<c:set var="check_cate" value="${p_item.fk_cate_2_idx}"/>
										<c:if test="${p_item.fd_product_group_purchase_yn eq 'Y'}">
											<c:set var="check_p_state" value="Y"/>
										</c:if>
										<c:if test="${p_item.fd_product_group_purchase_yn ne 'Y'}">
											<c:set var="check_p_state" value="N"/>
										</c:if>
								</c:forEach>
							</c:if>
							<div class="pd_list_paging">
								${pageNavi.navi}
							</div>
						</div>
					</div>
				</div>
			</article>
	
			<%--  히스토리 영역 시작 --%>
			<layout:historyFrame/>
			<%--  히스토리 영역 끝 --%>
		</section>
	</jsp:body>
</layout:basicFrame>