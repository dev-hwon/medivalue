<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<layout:MobileStoreFrame>
    <jsp:attribute name="stylesheet">
	    <link href="/resources/css/mobile/address.css" rel="stylesheet" >
	</jsp:attribute>
  <jsp:body>
    <div class="m_contents">
      <form name="form_addr_modify" class="form_addr">
        <input type="hidden" name="zip_code" />

        <div class="inner_wrap">
          <div class="container">
            <div class="tx_form_name">배송지 수정</div>
            <div class="input_wrap">
              <div class="addr_label">수령인</div>
              <div class="addr_input">
                <input type="text" class="input_text" name="receiver" placeholder="받는 분 이름을 입력하세요"/>
              </div>
            </div>
            <div class="input_wrap">
              <div class="addr_label">주소</div>
              <div class="addr_input">
                <input type="text" class="input_text" name="address1" placeholder="받는 분 이름을 입력하세요"/>
                <button type="button" class="btn_search_addr">검색</button>
                <input type="text" class="input_text" name="address2" placeholder="상세 주소를 입력하세요"/>
              </div>
            </div>
            <div class="input_wrap">
              <div class="addr_label">연락처</div>
              <div class="addr_input">
                <input type="text" class="input_text" name="phon" placeholder="받는 분 연락처를 입력하세요"/>
              </div>
            </div>
            <div class="input_wrap">
              <div class="addr_label">배송지명</div>
              <div class="addr_input">
                <input type="text" class="input_text" name="addr_nickname" placeholder="ex) 우리집, 회사, 병원 등"/>
              </div>
            </div>
            <div class="input_wrap input_wrap_checkbox">
              <label class="checkbox">
                <input type="checkbox" class="input_checkbox" name="default_addr" />
                <span class="input_shape"></span>
                <span class="input_checkbox_name">기본 배송지로 저장합니다</span>
              </label>
            </div>
          </div>
        </div>
        <div class="btn_wrap">
          <div class="container">
            <button type="submit" class="btn_submit_addr">저장하기</button>
            <button type="button" class="btn_delete_addr">삭제하기</button>
          </div>
        </div>
      </form>
    </div>
    <script>
      $('.btn_delete_addr').on('click', function(e){
        e.preventDefault();
        let _this = $(this);
        mvLayer.confirm('선택한 배송지를 삭제합니다.', function(res){
          if(res) {
            console.log(res);
          }
        });
      });
    </script>
  </jsp:body>
</layout:MobileStoreFrame>
