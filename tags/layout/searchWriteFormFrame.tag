<%@ tag language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="search_write">
	<div class="cp_tit">
		<h4>검색결과 설문조사</h4>
		<button class="cp_close"><img src="/resources/images/main/cp_close.png" width="32" height="32" border="0" alt="" /></button>
	</div>
	<div class="cp_txt">
		<form name="f_search_write" id="f_search_write" method="post" action="/search/write">
		<ul>
			<li class="cp_txt1">
				<h5>메디밸류 스토어 고객의 여러분의 소중한 의견을 듣습니다.</h5>
				<p>더 좋은 검색서비스를 위해, 고객님의 소중한 의견을 듣고 반영하고자 합니다.<br>불편사항이나 바라시는 요청 사항이 있으시면 남겨주세요.</p>
			</li>
			<li class="cp_txt2">
				<h5>검색 서비스 및 검색어</h5>
				<div class="clear">
					<div class="cp_sch_1">
						<select name="req_write_searchType" id="req_write_searchType">
							<option value="SR0001">제품검색</option>
							<option value="SR0002">가격비교</option>
						</select>
					</div>
					<div class="cp_sch_2">
						<input class="input_text" type="text" id="req_write_searchText" name="req_write_searchText" value=""/>
						<%-- 
						<select name="req_write_searchText" id="req_write_searchText">
						<option value="">타이탄엑스</option>
						</select>
						--%>
					</div>
				</div>
			</li>
			<li class="cp_txt3">
				<h5>불편사항 및 요청사항</h5>
				<textarea name="req_write_searchMemo" id="req_write_searchMemo" cols="30" rows="10"></textarea>
			</li>
		</ul>
		</form>
	</div>
	<div class="cp_btn">
		<button id="btn_result_write" type="button">제출하기</button>
	</div>
</div>