<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TossPayments</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<script src="/resources/js/jquery-3.4.1.min.js"></script>
<script src="https://js.tosspayments.com/v1/brandpay"></script>


<script type="text/javascript">
    var clientKey = '${client_key}';
    var customerKey = '${memberId}';
    var orderId = '${orderId}';

    // BrandPay 객체 초기화
    var brandpay = BrandPay(clientKey, customerKey, {
        //redirectUrl: window.location.origin + '/payment/rest/external/medipay/confirmPayment',
        redirectUrl: 'https://medivalue.co.kr/payment/rest/external/medipay/confirmPayment',
    })

    function requestPayment() {
        brandpay
        .requestPayment({
            amount: '${total_payment}', // 결제 금액
            orderId: orderId, // 주문에 대한 고유한 ID 값
            orderName: '${order_name}', // 결제에 대한 주문명
        })
        .then(res => {
            // 결제 승인 요청
            res.customerKey = customerKey;

            var formData = {
                customerKey : res.customerKey,
                paymentKey : res.paymentKey,
                orderId  : res.orderId,
                orderName  : '${order_name}',
                amount : res.amount,
                methodId : res.methodId
            };

            $.ajax({
                url : '/payment/rest/external/medipay/success',
                type : 'post',
                cache : false,
                data : formData,
                dataType : 'json',
                success:function(data){
                    window.location.href = '/quickOrder/external/medipay/success?paymentKey=' + data.paymentKey + '&amount=' + data.amount + '&orderId=' + data.orderId;
                },
                error:function(request,status,error){
                        console.log(error);
                }
            });
        })
        .catch(err => {
            if (err.code == 'USER_CANCEL') {
                console.log('사용자 취소')
            } else {
                console.log('기타 에러 상황', err.code, err.message)

                window.location.href = '/quickOrder/external/medipay/fail?message=' + err.message;
            }
        })
    }

    $(document).ready(function () {
        requestPayment();
    });

</script>
</head>
<body>
</body>
</html>

