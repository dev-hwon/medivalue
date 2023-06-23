<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="layout" 	tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c"  		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Medivalue</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width">
    <link rel="shortcut icon" href="/resources/images/favicon/favicon.png" />
    <script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
    	var proc_state = true;
    	$(document).ready(function (){
    		$("#btn_reject").on("click",function(){
    			if(proc_state){
    				proc_state = false;
    				var formData = {
    						mail_type : '${mail_type}',
    						user_info : '${user_info}'
    				};
        			$.ajax({
    					url : '/external/reject/rest/email',
    					type : 'post',
    					cache : false,
    					data : formData,
    					dataType : 'json',
    					success:function(data){
    						alert(data.rtn_msg);
    						proc_state = true;
    					},
    					error:function(request,status,error){
    						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    						proc_state = true;
    					}
    				});
    			}else{
    				alert("처리중 입니다. 잠시만 기다려주세요.");
    				return;
    			}
    		});
    	});
    </script>
    <style>
    	*{margin:0; padding:0; border:0; box-sizing:border-box;}
    	img{display:block;}
    	#wrap{}
    	.container{width:100%; max-width:364px; margin:0 auto; padding:20px 0 10px 0;}
    	.logo{}
    	.logo img{width:100%;}
    	.content{}
    	.content img{width:100%;}
    	.button{display:flex; justify-content: space-around;}
    	.button a{display:block; width:17.6%;}
    	.button img{width:100%;}
    	.copyright{}
    	.copyright img{width:100%;}
    </style>
</head>
<body>
    <div id="wrap">
    	<div class="container">
    		<div class="logo">
    			<a href="/" target="_blank"><img src="/resources/images/mail/refuse/img_mail_refuse_logo.jpg" alt="medivalue logo"></a>
    		</div>
    		<div class="content">
    			<img src="/resources/images/mail/refuse/img_mail_refuse_content.jpg" alt="">
    		</div>
    		<div class="button">
    			<a href="javascript:;" id="btn_reject"><img src="/resources/images/mail/refuse/btn_ok.jpg" alt=""></a>
    			<a href="javascript:window.close();"><img src="/resources/images/mail/refuse/btn_close.jpg" alt=""></a>
    		</div>
    		<div class="copyright">
    			<img src="/resources/images/mail/refuse/img_mail_refuse_copyright.jpg" alt="">
    		</div>
    	</div>
    </div>
</body>
</html>