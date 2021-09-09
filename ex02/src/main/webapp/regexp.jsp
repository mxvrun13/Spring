<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regexp</title>
</head>
<body>
	<input type="text" id="pass" name="pass">
	<button type="button" id="btnCheck">확인</button> 
</body>
<script
	src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js">
</script>
<script type="text/javascript">
	var passRule = /^[0-9]{3}-[0-9]{3}$/;//숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
	
	$("#btnCheck").on("click", function(){
		if(!passRule.test($("#pass").val())) {
			alert("error");
			return false;
		}
	});
</script>
</html>