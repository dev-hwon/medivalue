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
				$(".s9bxs1").bxSlider({
					auto : true,
					autoHover : true,
					autoControls : false,
					pause: 4000,
					controls : true,
					pager: false,
					touchEnabled : false
				});

				setTimeout(function() {
					$("#sub9 .cnt2").addClass("active");
				}, 500);

				var $detSch=$("#sub9 .cnt1 .area .real_area .top .sch_wrap .sch_wrap_top .detail_sch");
				var $schBtm=$("#sub9 .cnt1 .area .real_area .top .sch_wrap .sch_wrap_btm");
				var $filterBtn=$("#sub9 .cnt1 .area .real_area .top .sch_wrap .sch_wrap_btm > div > ul > li > button");
				var $s9allchk=$("#sub9 .cnt1 .area .real_area .top .sch_wrap .sch_wrap_btm .cate .cate_tit .chk_wrap_wrap .chk_wrap #allchk");
				var $s9allchkno=$("#sub9 .cnt1 .area .real_area .top .sch_wrap .sch_wrap_btm .cate .cate_tit .chk_wrap_wrap .chk_wrap #allchkno");
				var $tlc2=$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.td .td_list .tlc2");
				var $s9Dpu=$("#sub9 .cnt1 .area .real_area .btm .btm_btm .delete_popup");
				var $s9DepClose=$("#sub9 .cnt1 .area .real_area .btm .btm_btm .delete_popup .dep_close");
				var $cateLi=$("#sub9 .cnt1 .area .real_area .top .sch_wrap .sch_wrap_btm .cate ul li")
				var $s9qbPlus=$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.td .td_list .one_td6 .quan_box .plus");
				var $s9qbMinus=$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.td .td_list .one_td6 .quan_box .minus");

				$detSch.on("click", function  () {
					if ($(this).hasClass("on")) {
						$(this).removeClass("on");
						$schBtm.stop().slideUp();
					}else {
						$(this).addClass("on");
						$schBtm.stop().slideDown();
					}
				});

				$filterBtn.on("click", function  () {
					if ($(this).parent().hasClass("on")) {
						$(this).parent().removeClass("on");
					}else {
						$(this).parent().addClass("on");
					}

					if ($(this).parent().hasClass("inq_month")) {
						$(".inq_recen").removeClass("on")
					}else if ($(this).parent().hasClass("inq_recen")) {
						$(".inq_month").removeClass("on")
					}
				});

				$s9allchk.click(function(){
					if($s9allchk.prop("checked")){
						$cateLi.addClass("on");
						$filterBtn.on("click", function  () {
							$s9allchk.prop("checked",false);
						});
					}else{
						$cateLi.removeClass("on");
					}
				})

				$s9allchkno.click(function(){
					if($s9allchkno.prop("checked")){
						$cateLi.removeClass("on");
						$filterBtn.on("click", function  () {
							$s9allchkno.prop("checked",false);
						});
					}else{
						$cateLi.addClass("on");
					}
				})

				$(".all_chk_mh").click(function(){
					if($(".all_chk_mh").prop("checked")){
						$("input[name=mhn]").prop("checked",true);

						$tlc2.on("click", function  () {
							$(".all_chk_mh").prop("checked",false);
						});
					}else{
						$("input[name=mhn]").prop("checked",false);
					}
				})

				$(".all_chk_mh2").click(function(){
					if($(".all_chk_mh2").prop("checked")){
						$("input[name=mhn]").prop("checked",true);

						$tlc2.on("click", function  () {
							$(".all_chk_mh2").prop("checked",false);
						});
					}else{
						$("input[name=mhn]").prop("checked",false);
					}
				})

				$(".tlc2").on("click", function  () {
					if ($(".tlc2:checked").length == $(".tlc2").length) {
						$(".all_chk_mh").prop("checked",true);
						$(".all_chk_mh2").prop("checked",true);
					}
				});

				$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.th .mh_th1 .chc_delete button, #sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.td .td_list .one_td7 button").on("click", function  () {
					$s9Dpu.css("display","block");
					$("#black").css("display","block");
				});

				$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.td .td_list .one_td7 button").on("click", function  () {
					var $th7Idx=$(this).parents(".td").index()
					
					$("#sub9 .cnt1 .area .real_area .btm .btm_btm .delete_popup .btn_wrap .ok_btn").on("click", function  () {
						$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li").eq($th7Idx).css("display","none");
						$s9Dpu.css("display","none");
						$("#black").css("display","none");
					});
				});

				$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.th .mh_th1 .chc_delete button").on("click", function  () {
					var $ched=$("#sub9 .cnt1 .area .real_area .btm .btm_btm .table_div ul li.td .td_list .one_td1 input[name=mhn]:checked")
					
					$("#sub9 .cnt1 .area .real_area .btm .btm_btm .delete_popup .btn_wrap .ok_btn").on("click", function  () {
						$ched.parents(".td").css("display","none");
						$(".all_chk_mh").prop("checked",false);
						$s9Dpu.css("display","none");
						$("#black").css("display","none");
					});
				});

				$s9DepClose.on("click", function  () {
					$s9Dpu.css("display","none");
					$("#black").css("display","none");
				});

				$("#sub9 .cnt1 .area .real_area .btm .btm_btm .delete_popup .btn_wrap .cancel_btn").on("click", function  () {
					$s9DepClose.click();
				});

				$("#black").on("click", function  () {
					$s9DepClose.click();
				});

				$s9qbPlus.on("click", function  () {
					var s9n =$(this).index(this);
					var s9num = $(this).prev().find(".num:eq("+s9n+")").val();
					s9num = $(this).prev().find(".num:eq("+s9n+")").val(s9num*1+1); 
					var $s9ccc2= $(this).prev().find(".num").val();

					if ($s9ccc2>1) {
						$s9qbMinus.css("color","#232323")
					}else {
						$s9qbMinus.css("color","#b2b2b2")
					}
				});
				
				$s9qbMinus.click(function(){ 
					var s9n = $(this).index(this);
					var s9num = $(this).next().find(".num:eq("+s9n+")").val();
					s9num = $(this).next().find(".num:eq("+s9n+")").val(s9num*1-1);
					var $s9ccc2= $(this).next().find(".num").val();

					if ($s9ccc2<1) {
						alert("최소 수량은 1개 입니다.");
						$(this).next().find(".num").val(1);
					}

					if ($s9ccc2>1) {
						$s9qbMinus.css("color","#232323")
					}else {
						$s9qbMinus.css("color","#b2b2b2")
					}
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub9" class="sub">
		<article class="cnt1">
			<div class="area">
				<div class="real_area">
					<div class="top">
						<div class="tit">
							<h3>안녕하세요, <span>00치과</span>님</h3>
							<p>오늘도 메디밸류와 함께 힘찬 하루 보내세요</p>
							<p>오늘도 메디밸류와 함께 힘찬 하루 보내세요</p>
						</div>

						<div class="sch_wrap">
							<form id="frm_my_s" name="frm_my_s" action="/myhome/info" method="post">
							<div class="sch_wrap_top clear">
								<h4>제품검색</h4>
								<div class="form_cont">
									<label for="`">제품명을 입력해주세요</label>
									<input type="text" id="pdTit1">
									<!-- 211005 수정 시작 -->
									<button class="sch_btn"><img src="/resources/images/main/search_btn4.png" width="13" height="13" border="0" alt="" /></button>
									<!-- 211005 수정 끝 -->
								</div>
								<button class="detail_sch">상세검색</button>
							</div>

							<div class="sch_wrap_btm">
								<div class="inq_peri">
									<h4>조회기간</h4>
									<ul class="clear">
										<li class="inq_recen on"><button>최근 3개월</button></li>
										<li class="inq_month"><button>9월</button></li>
										<li class="inq_month"><button>8월</button></li>
										<li class="inq_month"><button>7월</button></li>
										<li class="inq_month"><button>6월</button></li>
										<li class="calen clear">
											<div class="form_cont">
												<label for="inq_p1">2021.08.07</label>
												<input type="text" id="inq_p1">
												<button class="cal_icon"><img src="/resources/images/main/order_calen.jpg" width="11" height="11" border="0" alt="" /></button>
											</div>
											<p>~</p>
											<div class="form_cont">
												<label for="inq_p2">2021.08.07</label>
												<input type="text" id="inq_p2">
												<button class="cal_icon"><img src="/resources/images/main/order_calen.jpg" width="11" height="11" border="0" alt="" /></button>
											</div>
										</li>
									</ul>
								</div>

								<div class="cate">
									<div class="cate_tit clear">
										<h4>카테고리</h4>
										<div class="chk_wrap_wrap">
											<div class="chk_wrap">
												<input id="allchk" type="radio" name="ac" checked>
												<label for="allchk">전체선택</label>
											</div>
											
											<div class="chk_wrap">
												<input id="allchkno" type="radio" name="ac">
												<label for="allchkno">전체제외</label>
											</div>
										</div>
									</div>

									<ul class="clear">
										<li class="first on"><button>인상재</button></li>
										<li class="on"><button>시멘트</button></li>
										<li class="on"><button>근관재</button></li>
										<li class="on"><button>레진/본딩/에칭</button></li>
										<li class="on"><button>바(Bur)/연마재</button></li>
										<li class="on"><button>트레이스/스케일팁</button></li>
										<li class="on"><button>위생/소독/멸균</button></li>
										<li class="on"><button>템포관련/덴쳐</button></li>
										<li class="first on"><button>수술재료/마취</button></li>
										<li class="on"><button>반사선재/교합관련</button></li>
										<li class="on"><button>스톤/석고</button></li>
										<li class="on"><button>아말감/GI</button></li>
										<li class="on"><button>기타 치과 재료</button></li>
										<li class="on"><button>치과기구</button></li>
										<li class="on"><button>마스크/글러브/석션</button></li>
										<li class="on"><button>임플란트</button></li>
									</ul>
								</div>
							</div>
						</div>
						</form>
					</div>

					<div class="btm">
						<div class="btm_top clear">
							<div class="slt_wrap">
								<select name="" id="">
									<option value="">메디밸류 추천순</option>
									<option value="">이름순</option>
									<option value="">가격순</option>
									<option value="">구매일자순</option>
								</select>
								
								<select name="" id="">
									<option value="">500개씩 보기</option>
									<option value="">100개씩 보기</option>
									<option value="">50개씩 보기</option>
									<option value="">10개씩 보기</option>
								</select>
							</div>
						</div>

						<div class="btm_btm">
							<div class="table_div">
								<ul>
									<li class="th clear">
										<div class="mh_th1 all_chk_wrap clear">
											<div class="all_chk">
												<input id="mhchk1" type="checkbox" name="mhn" class="all_chk_mh">
												<label for="mhchk1">전체선택</label>
											</div>

											<div class="chc_delete">
												<button>선택삭제</button>
											</div>
										</div>
										<h5 class="mh_th2">제품명</h5>
										<h5 class="mh_th3">최근 구매일</h5>
										<h5 class="mh_th4">가격</h5>
										<h5 class="mh_th5">수량</h5>
									</li>
								
									<li class="td">
										<div class="td_list clear">
											<div class="one_td1 pd_chk">
												<input id="tdListChk1" type="checkbox" name="mhn" class="tlc2">
												<label for="tdListChk1"></label>
											</div>

											<div class="one_td2 img">
												<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
											</div>

											<div class="one_td3 info">
												<div class="info_box">
													<span>마스크/글러브/석션</span>
													<h4 class="pd_tit">TITAN X (타이탄엑스) 0.1g Bone substitu Regenerating bone Ren Regenerating bone, Renewing lives Regenerating bone, Renewing lives</h4>
													<p class="standard">[규격] 0.5g  /  0.8cc (05-0210)</p>
													<div class="mp_wrap clear">
														<p class="manu">제조사ㅣ리뉴메디칼</p>
														<p class="pack">포장단위ㅣea</p>
													</div>
												</div>
											</div>

											<div class="one_td4">
												<p>2021.08.20</p>
											</div>

											<div class="one_td5">
												<p>90,032,100원</p>
											</div>

											<div class="one_td6">
												<div class="quan_box clear">
													<button class="minus">-</button>
													<div class="form_cont">
														<label for="qb2"></label>
														<input type="text" id="qb2" class="num" value="1">
													</div>
													<button class="plus">+</button>
												</div>

												<button class="cart_go">장바구니 담기</button>
											</div>

											<div class="one_td7">
												<button><img src="/resources/images/main/ship_delete.jpg" width="19" height="19" border="0" alt="" /></button>
											</div>
										</div>
									</li>

									<li class="td">
										<div class="td_list clear">
											<div class="one_td1 pd_chk">
												<input id="tdListChk2" type="checkbox" name="mhn" class="tlc2">
												<label for="tdListChk2"></label>
											</div>

											<div class="one_td2 img">
												<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
											</div>

											<div class="one_td3 info">
												<div class="info_box">
													<span>마스크/글러브/석션</span>
													<h4 class="pd_tit">TITAN X (타이탄엑스) 0.1g Bone s</h4>
													<p class="standard">[규격] 0.5g  /  0.8cc (05-0210)</p>
													<div class="mp_wrap clear">
														<p class="manu">제조사ㅣ리뉴메디칼</p>
														<p class="pack">포장단위ㅣea</p>
													</div>
												</div>
											</div>

											<div class="one_td4">
												<p>2021.08.20</p>
											</div>

											<div class="one_td5">
												<p>0,032,100원</p>
											</div>

											<div class="one_td6">
												<div class="quan_box clear">
													<button class="minus">-</button>
													<div class="form_cont">
														<label for="qb2"></label>
														<input type="text" id="qb2" class="num" value="1">
													</div>
													<button class="plus">+</button>
												</div>

												<button class="cart_go">장바구니 담기</button>
											</div>

											<div class="one_td7">
												<button><img src="/resources/images/main/ship_delete.jpg" width="19" height="19" border="0" alt="" /></button>
											</div>
										</div>
									</li>

									<li class="td">
										<div class="td_list clear">
											<div class="one_td1 pd_chk">
												<input id="tdListChk3" type="checkbox" name="mhn" class="tlc2">
												<label for="tdListChk3"></label>
											</div>

											<div class="one_td2 img">
												<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
											</div>

											<div class="one_td3 info">
												<div class="info_box">
													<span>마스크/글러브/석션</span>
													<h4 class="pd_tit">TITAN X (타이탄엑스) 0.1g Bone substitu Regenerating bone Ren Regenerating bone, Renewing lives Regenerating bone, Renewing lives</h4>
													<p class="standard">[규격] 0.5g  /  0.8cc (05-0210)</p>
													<div class="mp_wrap clear">
														<p class="manu">제조사ㅣ리뉴메디칼</p>
														<p class="pack">포장단위ㅣea</p>
													</div>
												</div>
											</div>

											<div class="one_td4">
												<p>2021.08.20</p>
											</div>

											<div class="one_td5">
												<p>0,032,100원</p>
											</div>

											<div class="one_td6">
												<div class="quan_box clear">
													<button class="minus">-</button>
													<div class="form_cont">
														<label for="qb2"></label>
														<input type="text" id="qb2" class="num" value="1">
													</div>
													<button class="plus">+</button>
												</div>

												<button class="cart_go">장바구니 담기</button>
											</div>

											<div class="one_td7">
												<button><img src="/resources/images/main/ship_delete.jpg" width="19" height="19" border="0" alt="" /></button>
											</div>
										</div>
									</li>

									<li class="td">
										<div class="td_list clear">
											<div class="one_td1 pd_chk">
												<input id="tdListChk4" type="checkbox" name="mhn" class="tlc2">
												<label for="tdListChk4"></label>
											</div>

											<div class="one_td2 img">
												<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
											</div>

											<div class="one_td3 info">
												<div class="info_box">
													<span>마스크/글러브/석션</span>
													<h4 class="pd_tit">TITAN X (타이탄엑스) 0.1g Bone substitu Regenerating bone Ren Regenerating bone, Renewing lives Regenerating bone, Renewing lives</h4>
													<p class="standard">[규격] 0.5g  /  0.8cc (05-0210)</p>
													<div class="mp_wrap clear">
														<p class="manu">제조사ㅣ리뉴메디칼</p>
														<p class="pack">포장단위ㅣea</p>
													</div>
												</div>
											</div>

											<div class="one_td4">
												<p>2021.08.20</p>
											</div>

											<div class="one_td5">
												<p>0,032,100원</p>
											</div>

											<div class="one_td6">
												<div class="quan_box clear">
													<button class="minus">-</button>
													<div class="form_cont">
														<label for="qb2"></label>
														<input type="text" id="qb2" class="num" value="1">
													</div>
													<button class="plus">+</button>
												</div>

												<button class="cart_go">장바구니 담기</button>
											</div>

											<div class="one_td7">
												<button><img src="/resources/images/main/ship_delete.jpg" width="19" height="19" border="0" alt="" /></button>
											</div>
										</div>
									</li>

									<li class="td">
										<div class="td_list clear">
											<div class="one_td1 pd_chk">
												<input id="tdListChk5" type="checkbox" name="mhn" class="tlc2">
												<label for="tdListChk5"></label>
											</div>

											<div class="one_td2 img">
												<img src="/resources/images/main/mn_c6_img2.jpg" width="250" height="321" border="0" alt="" />
											</div>

											<div class="one_td3 info">
												<div class="info_box">
													<span>마스크/글러브/석션</span>
													<h4 class="pd_tit">TITAN X (타이탄엑스) 0.1g Bone substitu Regenerating bone Ren Regenerating bone, Renewing lives Regenerating bone, Renewing lives</h4>
													<p class="standard">[규격] 0.5g  /  0.8cc (05-0210)</p>
													<div class="mp_wrap clear">
														<p class="manu">제조사ㅣ리뉴메디칼</p>
														<p class="pack">포장단위ㅣea</p>
													</div>
												</div>
											</div>

											<div class="one_td4">
												<p>2021.08.20</p>
											</div>

											<div class="one_td5">
												<p>0,032,100원</p>
											</div>

											<div class="one_td6">
												<div class="quan_box clear">
													<button class="minus">-</button>
													<div class="form_cont">
														<label for="qb2"></label>
														<input type="text" id="qb2" class="num" value="1">
													</div>
													<button class="plus">+</button>
												</div>

												<button class="cart_go">장바구니 담기</button>
											</div>

											<div class="one_td7">
												<button><img src="/resources/images/main/ship_delete.jpg" width="19" height="19" border="0" alt="" /></button>
											</div>
										</div>
									</li>

									<li class="th last_th clear">
										<div class="mh_th1 all_chk_wrap clear">
											<div class="all_chk">
												<input id="mhchk2" type="checkbox" name="mhn" class="all_chk_mh2">
												<label for="mhchk2">전체선택</label>
											</div>

											<div class="chc_delete">
												<button>선택삭제</button>
											</div>
										</div>
									</li>
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
								<ul class="clear">
									<li class="prev2"><button><img src="/resources/images/main/prev_icon2.png" width="10" height="9" border="0" alt="" /></button></li>
									<li class="prev1"><button><img src="/resources/images/main/prev_icon1.png" width="10" height="9" border="0" alt="" /></button></li>
									<li class="on"><button>1</button></li>
									<li class="next1"><button><img src="/resources/images/main/next_icon1.png" width="10" height="9" border="0" alt="" /></button></li>
									<li class="next2"><button><img src="/resources/images/main/next_icon2.png" width="10" height="9" border="0" alt="" /></button></li>
								</ul>
							</div>

							<div class="clear">
								<div class="table_btn_wrap clear">
									<button class="cart_go_btn">장바구니 담기</button>
									<button class="buy_go_btn">바로 구매하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>

		<article class="cnt2 noti">
			<div class="area">
				<div class="real_area">
					<div class="tit">
						<h3>혹시 이 제품 필요하지 않으세요?</h3>
						<p>구매내역 분석을 통한 AI PICK</p>
					</div>
					
					<div class="txt">
						<ul class="depth1 s9bxs1">
							<li>
								<ul class="depth2 clear">
									<li>
										<a href="">
											<div class="img">
												<img src="/resources/images/main/mn_c2_img1.png" width="250" height="321" border="0" alt="" />
					
												<div class="wish_wrap">
													<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
													<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
												</div>
											</div>
					
											<div class="info">
												<h4 class="pd_tit">[제조사] 제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명제품명</h4>
												<div class="price clear">
													<strong class="percent">75%</strong>
													<p>0,000,000원</p>
												</div>
												<div class="cost"><p>0,000,000원</p></div>
											</div>
										</a>
									</li>
					
									<li>
										<a href="">
											<div class="img">
												<img src="/resources/images/main/mn_c2_img2.png" width="250" height="321" border="0" alt="" />
					
												<div class="wish_wrap">
													<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
													<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
												</div>
											</div>
					
											<div class="info">
												<h4 class="pd_tit">[제조사] 제품명</h4>
												<div class="price clear">
													<strong class="percent">43%</strong>
													<p>0,000,000원</p>
												</div>
												<div class="cost"><p>0,000,000원</p></div>
											</div>
										</a>
									</li>
					
									<li>
										<a href="">
											<div class="img">
												<img src="/resources/images/main/mn_c2_img3.png" width="250" height="321" border="0" alt="" />
					
												<div class="wish_wrap">
													<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
													<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
												</div>
											</div>
					
											<div class="info">
												<h4 class="pd_tit">[제조사] 제품명</h4>
												<div class="price clear">
													<strong class="percent">60%</strong>
													<p>0,000,000원</p>
												</div>
												<div class="cost"><p>0,000,000원</p></div>
											</div>
										</a>
									</li>
					
									<li> 
										<a href="">
											<div class="img">
												<img src="/resources/images/main/mn_c2_img4.png" width="250" height="321" border="0" alt="" />
					
												<div class="wish_wrap">
													<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
													<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
												</div>
											</div>
					
											<div class="info">
												<h4 class="pd_tit">[제조사] 제품명</h4>
												<div class="price clear">
													<strong class="percent">81%</strong>
													<p>0,000,000원</p>
												</div>
												<div class="cost"><p>0,000,000원</p></div>
											</div>
										</a>
									</li>
								</ul>
							</li>
					
							<li>
								<ul class="depth2 clear">
									<li>
										<a href="">
											<div class="img">
												<img src="/resources/images/main/mn_c2_img1.png" width="250" height="321" border="0" alt="" />
					
												<div class="wish_wrap">
													<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
													<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
												</div>
											</div>
					
											<div class="info">
												<h4 class="pd_tit">[제조사] 제품명</h4>
												<div class="price clear">
													<strong class="percent">75%</strong>
													<p>0,000,000원</p>
												</div>
												<div class="cost"><p>0,000,000원</p></div>
											</div>
										</a>
									</li>
					
									<li>
										<a href="">
											<div class="img">
												<img src="/resources/images/main/mn_c2_img2.png" width="250" height="321" border="0" alt="" />
					
												<div class="wish_wrap">
													<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
													<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
												</div>
											</div>
					
											<div class="info">
												<h4 class="pd_tit">[제조사] 제품명</h4>
												<div class="price clear">
													<strong class="percent">43%</strong>
													<p>0,000,000원</p>
												</div>
												<div class="cost"><p>0,000,000원</p></div>
											</div>
										</a>
									</li>
					
									<li>
										<a href="">
											<div class="img">
												<img src="/resources/images/main/mn_c2_img3.png" width="250" height="321" border="0" alt="" />
					
												<div class="wish_wrap">
													<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
													<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
												</div>
											</div>
					
											<div class="info">
												<h4 class="pd_tit">[제조사] 제품명</h4>
												<div class="price clear">
													<strong class="percent">60%</strong>
													<p>0,000,000원</p>
												</div>
												<div class="cost"><p>0,000,000원</p></div>
											</div>
										</a>
									</li>
					
									<li> 
										<a href="">
											<div class="img">
												<img src="/resources/images/main/mn_c2_img4.png" width="250" height="321" border="0" alt="" />
					
												<div class="wish_wrap">
													<button class="wish_btn"><img src="/resources/images/main/sub_like_icon.png" width="26" height="24" border="0" alt="" /></button>
													<button class="cart_btn"><img src="/resources/images/main/sub_cart_icon.png" width="27" height="24" border="0" alt="" /></button>
												</div>
											</div>
					
											<div class="info">
												<h4 class="pd_tit">[제조사] 제품명</h4>
												<div class="price clear">
													<strong class="percent">81%</strong>
													<p>0,000,000원</p>
												</div>
												<div class="cost"><p>0,000,000원</p></div>
											</div>
										</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</article>
	</section>
	</jsp:body>
</layout:basicFrame>