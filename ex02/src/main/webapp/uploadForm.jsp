<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>
	<form method="POST" enctype="multipart/form-data" action="uploadFormAction">
		<input type="file" name="uploadFile" multiple="multiple">
		<button>등록</button>
	</form>
</body>
</html>