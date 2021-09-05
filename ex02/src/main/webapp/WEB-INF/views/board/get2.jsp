<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<h3>게시글 상세 보기</h3>
<form role="form"
	action="${pageContext.request.contextPath }/board/modify"
	method="post">
	<table class="table">
		<tr>
			<th>제목</th>
			<td colspan="3"><input type="text" class="form-control"
				value="${board.title }" name="title"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" class="form-control"
				value="${board.writer }" name="writer"></td>
			<th>작성일자</th>
			<td><fmt:formatDate value="${board.regdate }"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3"><textarea class="form-control" rows="3" name="content">${board.content }</textarea></td>
		</tr>
	</table>
	<button type="submit" class="btn btn-default">Submit Button</button>
	<button type="reset" class="btn btn-default">Reset Button</button>
	<input type="hidden" value=${board.bno } name="bno">
</form>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>