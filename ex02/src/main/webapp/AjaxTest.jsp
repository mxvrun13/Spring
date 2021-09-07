<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajaxTest.jsp</title>
<script
	src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn1").on("click", function(){
			$.ajax({
				url : "ajax1",
				method : "GET",
				data : {writer : $("#writer").val()},
				//async : false,	// 동기식
				dataType : "json",  //plain=text, json, xml
				success :function(data) {
					$("#result").append(data.content+"<br>");
					$("#result").append(data.writer+"<br>");
				}
			});
			$("#result").append("클릭됨<br>");	// 비동기식일 때 먼저 실행
		})  // on = addEventListner
		
		$("#btn2").on("click", function(){
			$.ajax({
				url : "ajax2",
				method : "POST",
				data : JSON.stringify({writer : $("#writer").val()}),
				contentType : "application/json",
				dataType : "json",
				success :function(data) {
					//$("#result").append($("<p>").append(data.content).append("<br>").append(data.writer));
					$("#result").append($(`<p>\${data.writer}<br>\${data.content}</p>`));
				}
			});
		})
		
		//그룹 이벤트 : 위임 -> 동적으로 추가될 태그에도 미리 이벤트 지정
		//부모 태그에 이벤트 지정
		$("#result").on("click", "p" , function(){
			$(this).remove();
		})
	});
</script>
</head>
<body>
	<input name="writer" id="writer">
	<button type="button" id="btn1">문자열</button>
	<button type="button" id="btn2">파라미터</button>
	<div id="result">
	</div>
</body>
</html>