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
        <div class="addr_list">
          <ul>
            <li>
              <div class="addr_card">
                <div class="container">
                  <div class="cd_info_top">
                    <div class="tx_name"><em>이엘치과(회사)</em><span class="label label_default"></span></div>
                    <div class="tx_phon">010-1234-5678</div>
                  </div>
                  <div class="cd_info_middle">
                    <span class="tx_address1">서울 영등포구 여의공원로 115</span>
                    <span class="tx_address2">6층</span>
                  </div>
                  <div class="cd_info_bottom">
                    <div class="btn_wrap">
                      <a href="addr_modify" class="btn_modify">수정</a>
                      <a href="" class="btn_delete">삭제</a>
                      <!-- 주문페이지에서 넘어올때만 선택하기 출력 -->
                      <a href="order" class="btn_select">선택하기</a>
                    </div>
                  </div>
                </div>
              </div>
            </li>

            <li>
              <div class="addr_card">
                <div class="container">
                  <div class="cd_info_top">
                    <div class="tx_name"><em>혀우너(집)</em><span class="label label_recent"></span></div>
                    <div class="tx_phon">010-1234-5678</div>
                  </div>
                  <div class="cd_info_middle">
                    <div class="tx_address1">서울 영등포구 여의공원로 115</div>
                    <div class="tx_address2">6층</div>
                  </div>
                  <div class="cd_info_bottom">
                    <div class="btn_wrap">
                      <a href="addr_modify" class="btn_modify">수정</a>
                      <a href="" class="btn_delete">삭제</a>
                    </div>
                  </div>
                </div>
              </div>
            </li>
            <li>
              <div class="addr_card">
                <div class="container">
                  <div class="cd_info_top">
                    <div class="tx_name"><em>예나님(친구네)</em><span class="label label_recent"></span></div>
                    <div class="tx_phon">010-1234-5678</div>
                  </div>
                  <div class="cd_info_middle">
                    <div class="tx_address1">서울 영등포구 여의공원로 115</div>
                    <div class="tx_address2">6층</div>
                  </div>
                  <div class="cd_info_bottom">
                    <div class="btn_wrap">
                      <a href="addr_modify" class="btn_modify">수정</a>
                      <a href="" class="btn_delete">삭제</a>
                    </div>
                  </div>
                </div>
              </div>
            </li>
          </ul>
          <div class="btn_wrap">
            <div class="container">
              <a href="/sample/addr_add" class="btn_add_addr">배송지 추가</a>
            </div>
          </div>
        </div>
      </div>
      <script>
        $('.addr_list .btn_delete').on('click', function(e){
          e.preventDefault();
          let _this = $(this);
          mvLayer.confirm('선택한 배송지를 삭제합니다.', function(res){
            if(res) {
              _this.parents('li').remove();
            }
          });
        });
      </script>
    </jsp:body>
</layout:MobileStoreFrame>
