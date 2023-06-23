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
				$(".all_chk_cb").click(function(){
					if($(".all_chk_cb").prop("checked")){
						$("input[name=acc]").prop("checked",true);
					}else{
						$("input[name=acc]").prop("checked",false);
					}
				})
	
				var $termsView=$("#sub0_2 .cnt1 .area .real_area .join_wrap .txt ul li.join_li28 .chk_wrap .terms_chk > button");
				var $termsClose=$("#sub0_2 .cnt1 .area .real_area .join_wrap .txt ul li.join_li28 .chk_wrap .terms_chk .terms_popup .terms_close, #sub0_2 .cnt1 .area .real_area .join_wrap .txt ul li.join_li28 .chk_wrap .terms_chk .terms_popup .terms_btn");
	
	
				$termsView.on("click", function  () {
					$(this).next().css("display","block");
					$("#black").css("display","block");
				});
	
				$termsClose.on("click", function  () {
					$(this).parent().css("display","none");
					$("#black").css("display","none");
				});
	
				$("#black").on("click", function  () {
					$termsClose.click()
				});
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<section id="sub3_7" class="sub">
			<article class="cnt1">
				<div class="area">
					<div class="real_area">
						<div class="wrap clear">
							<div class="left">
								<h3>내 계정</h3>
							
								<ul>
									<li><button>주문배송 조회</button></li>
									<li><button>배송지관리</button></li>
									<li><button>포인트 쿠폰</button></li>
									<li class="on"><button>회원정보 수정</button></li>
								</ul>
							
								<div class="banner">
									<h4>주문/배송에<br>도움이 필요하신가요?</h4>
									<button>1:1 문의하기</button>
								</div>
							</div>
	
							<div class="right">
								<div class="right_tit">
									<div class="rt_tit clear">
										<h4>회원정보수정</h4>
									</div>
								</div>
	
								<div class="right_txt">
									<div class="join_wrap">
										<ul>
											<li class="join_li1 clear">
												<h4>아이디<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
												<div class="form_cont">
													<input type="text" id="joinId">
													<label for="joinId">6자 이상의 영문 혹은 영문과 숫자를 조합</label>
												</div>
												<button class="dup_btn">중복확인</button>
											</li>
														
											<li class="join_li2 clear">
												<h4>비밀번호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
												<div class="form_cont">
													<input type="text" id="joinPw" >
													<label for="joinPw">비밀번호를 입력해주세요</label>
												</div>
											</li>
	
											<li class="join_li3 clear">
												<h4>비밀번호확인<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
												<div class="form_cont">
													<input type="text" id="joinPwRe" >
													<label for="joinPwRe">비밀번호를 한번 더 입력해주세요</label>
												</div>
												<p class="pw_caution">X 비밀번호가 일치하지 않습니다</p>
											</li>
	
											<li class="join_li4 clear">
												<h4>이름<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
												<div class="form_cont">
													<input type="text" id="joinName" >
													<label for="joinName">이름(대표자)를 입력해주세요</label>
												</div>
											</li>
	
											<li class="join_li5 clear">
												<h4>면허번호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
												<div class="form_cont">
													<input type="text" id="joinLic" >
													<label for="joinLic">면허번호를 입력해주세요</label>
												</div>
											</li>
	
											<li class="join_li6 clear">
												<h4>의료기관명<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
												<div class="form_cont">
													<input type="text" id="joinIns" >
													<label for="joinIns">의료기관명을 입력해주세요</label>
												</div>
											</li>
	
											<li class="join_li7 clear">
												<h4>생년월일<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
												<div class="form_cont">
													<input type="text" id="joinBirth" >
													<label for="joinBirth">YYYY / MM / DD</label>
												</div>
												
												<div class="chk_wrap">
													<input id="genderChk1" type="radio" name="gender">
													<label for="genderChk1">남</label>
												</div>
	
												<div class="chk_wrap">
													<input id="genderChk2" type="radio" name="gender">
													<label for="genderChk2">여</label>
												</div>
	
												<div class="chk_wrap">
													<input id="genderChk3" type="radio" name="gender">
													<label for="genderChk3">선택안함</label>
												</div>
											</li>
	
											<li class="join_li8 clear">
												<h4>이메일<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
												<div class="form_cont">
													<input type="text" id="joinEmail">
													<label for="joinEmail">예 : anyprice@gmail.com</label>
												</div>
												<button class="dup_btn">중복확인</button>
											</li>
	
											<li class="join_li9 clear">
												<h4>주소<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
												<div class="form_cont_wrap">
													<div class="form_cont">
														<input type="text" id="joinAddr1">
														<label for="joinAddr1">상세주소를 검색해주세요</label>
													</div>
													<div class="form_cont">
														<input type="text" id="joinAddr2">
														<label for="joinAddr2">나머지 주소를 입력해주세요</label>
													</div>
												</div>
												<button class="addr_sch_btn"><img src="/resources/images/main/addr_sch_btn.jpg" width="13" height="13" border="0" alt="" />검색</button>
											</li>
	
											<li class="join_li10 clear">
												<h4>전화번호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
												<div class="form_cont">
													<input type="text" id="joinTel">
													<label for="joinTel">숫자만 입력해주세요</label>
												</div>
											</li>
	
											<li class="join_li11 clear">
												<h4>휴대폰<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
												<div class="form_cont">
													<input type="text" id="joinMobile">
													<label for="joinMobile">숫자만 입력해주세요</label>
												</div>
												<button class="get_au_btn">인증받기</button>
											</li>
	
											<li class="join_li12 clear">
												<h4>추천인</h4>
												<div class="form_cont">
													<input type="text" id="joinPerson">
													<label for="joinPerson">추천인 아이디를 입력해주세요</label>
												</div>
												<button class="per_sch_btn">검색</button>
											</li>
	
											<li class="join_li13 clear">
												<h4>메일수신여부<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
												<div class="chk_wrap chkw1">
													<input id="mailRecive1" type="radio" name="mailRecive">
													<label for="mailRecive1">수신함</label>
												</div>
	
												<div class="chk_wrap">
													<input id="mailRecive2" type="radio" name="mailRecive">
													<label for="mailRecive2">수신안함</label>
												</div>
											</li>
	
											<li class="join_li14 clear">
												<h4>SMS수신여부<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
												<div class="chk_wrap chkw1">
													<input id="smsRecive1" type="radio" name="smsRecive">
													<label for="smsRecive1">수신함</label>
												</div>
	
												<div class="chk_wrap">
													<input id="smsRecive2" type="radio" name="smsRecive">
													<label for="smsRecive2">수신안함</label>
												</div>
											</li>
	
											<li class="join_li15 clear">
												<h4>상호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
												<div class="form_cont">
													<input type="text" id="joinMu">
													<label for="joinMu">띄어쓰기 없이 입력해주세요</label>
												</div>
											</li>
	
											<li class="join_li16 clear">
												<h4>사업자번호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
												<div class="form_cont">
													<input type="text" id="joinBusiNum">
													<label for="joinBusiNum">사업자번호 입력 시 '-'를 제외하고 입력해주세요</label>
												</div>
											</li>
	
											<li class="join_li17 clear">
												<h4>대표자명<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
												<div class="form_cont">
													<input type="text" id="joinCeo">
													<label for="joinCeo">이름(대표자)를 입력해주세요</label>
												</div>
											</li>
	
											<li class="join_li18 clear">
												<h4>업태<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
												<div class="form_cont">
													<input type="text" id="joinIndus1">
													<label for="joinIndus1">업태를 입력해주세요</label>
												</div>
											</li>
	
											<li class="join_li19 clear">
												<h4>종목<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
												<div class="form_cont">
													<input type="text" id="joinIndus2">
													<label for="joinIndus2">종목을 입력해주세요</label>
												</div>
											</li>
	
											<li class="join_li20 clear">
												<h4>사업자주소<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
												
												<div class="form_cont_wrap">
													<div class="chk_wrap">
														<input id="addrSame" type="checkbox">
														<label for="addrSame">위의 주소와 동일</label>
													</div>
	
													<div class="form_cont">
														<input type="text" id="joinBa1">
														<label for="joinBa1">상세주소를 검색해주세요</label>
													</div>
												
													<div class="form_cont">
														<input type="text" id="joinBa2">
														<label for="joinBa2">나머지 주소를 입력해주세요</label>
													</div>
												</div>
	
												<button class="ba_sch_btn"><img src="/resources/images/main/addr_sch_btn.jpg" width="13" height="13" border="0" alt="" />검색</button>
											</li>
	
											<li class="join_li21 clear">
												<h4>예금주명<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
												<div class="form_cont">
													<input type="text" id="joinDep">
													<label for="joinDep">예금주 명을 입력해주세요</label>
												</div>
											</li>
	
											<li class="join_li22 clear">
												<h4>환불계좌은행<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
												<select name="" id="">
													<option value="">은행을 선택하세요</option>
													<option value="">은행을 선택하세요</option>
													<option value="">은행을 선택하세요</option>
													<option value="">은행을 선택하세요</option>
												</select>
											</li>
	
											<li class="join_li23 clear">
												<h4>환불계좌번호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
												<div class="form_cont">
													<input type="text" id="joinRef">
													<label for="joinRef">계좌번호를 입력해주세요</label>
												</div>
											</li>
	
											<li class="join_li24 clear">
												<h4>요양기관기호<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
												<div class="form_cont">
													<input type="text" id="joinHeal1">
													<label for="joinHeal1">요양기관기호를 입력해주세요</label>
												</div>
											</li>
	
											<li class="join_li25 clear">
												<h4>요양기관명칭<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
												<div class="form_cont">
													<input type="text" id="joinHeal2">
													<label for="joinHeal2">요양기관명칭을 입력해주세요</label>
												</div>
											</li>
	
											<li class="join_li26 clear">
												<h4>담당자명<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
												<div class="form_cont">
													<input type="text" id="joinIn">
													<label for="joinIn">이름(담당자)를 입력해주세요</label>
												</div>
	
												<div class="chk_wrap">
													<input id="inSame1" type="checkbox">
													<label for="inSame1">대표자와 동일</label>
												</div>
											</li>
	
											<li class="join_li27 clear">
												<h4>담당자연락처<span><img src="/resources/images/main/join_mark2.jpg" width="7" height="7" border="0" alt="*" /></span></h4>
	
												<div class="form_cont">
													<input type="text" id="joinInNum">
													<label for="joinInNum">이름(담당자)를 입력해주세요</label>
												</div>
	
												<div class="chk_wrap">
													<input id="inSame2" type="checkbox">
													<label for="inSame2">대표자와 동일</label>
												</div>
											</li>
	
											<li class="join_li28">
												<button class="mem_modi">회원정보 수정</button>
											</li>
										</ul>
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