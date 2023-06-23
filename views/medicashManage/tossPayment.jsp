<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!--
<head>
    <title>결제하기</title>
    <script src="https://js.tosspayments.com/v1/payment"></script>
</head>
<body>
<script>
    var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
    var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기

    tossPayments.requestPayment('카드', { // 결제 수단
                                        // 결제 정보
        amount: 15000,
        orderId: 'HXYDSJdj9VEZS78CtifiW',
        orderName: '토스 티셔츠 외 2건',
        customerName: '박토스',
        successUrl: 'http://localhost:8080/success',
        failUrl: 'http://localhost:8080/fail',
        flowMode: 'DIRECT',
        cardCompany : '삼성'
    })
    .catch(function (error) {
        if (error.code === 'USER_CANCEL') {
            // 결제 고객이 결제창을 닫았을 때 에러 처리
        } else if (error.code === 'INVALID_CARD_COMPANY') {
            // 유효하지 않은 카드 코드에 대한 에러 처리
        }
    })
</script>
</body>
-->
<head>
  <title>결제하기</title>
  <script src="https://js.tosspayments.com/v1/payment"></script>
</head>
<body>
  <script>
    var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
    var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기

    tossPayments.requestPayment('카드', { // 결제 수단 파라미터
                                        // 결제 정보 파라미터
        amount: 15000,
        orderId: 'rcp0ah09NBrNdq3g6Q9Jx',
        orderName: '토스 티셔츠 외 2건',
        customerName: '박토스',
        successUrl: '/success',
        failUrl: '/fail',
    })
    .catch(function (error) {
        if (error.code === 'USER_CANCEL') {
            // 결제 고객이 결제창을 닫았을 때 에러 처리
        } else if (error.code === 'INVALID_CARD_COMPANY') {
            // 유효하지 않은 카드 코드에 대한 에러 처리
        }
    })
  </script>
</body>
</html>
