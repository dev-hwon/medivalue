<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script language="javascript">
	alert('인증되지 않은 사용자 혹은 세션이 만료 되었습니다.\n로그인 하여주시기 바랍니다.');
	location.href = '/access/login';
</script>