<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Modify</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel-body">
			<form role="form" action="${pageContext.request.contextPath }/board/modify" method="post">
				<div class="form-group">
					<label>Title</label> <input class="form-control" name="title" value="${board.title }">
				</div>
				<div class="form-group">
					<label>Text Area</label> <textarea class="form-control" rows="3" name="content">${board.content }</textarea>
				</div>
				<div class="form-group">
					<label>Writer</label> <input class="form-control" name="writer" value="${board.writer }">
				</div>
				<button type="submit" class="btn btn-default">수정</button>
				<button type="submit" formaction="${pageContext.request.contextPath }/board/delete" class="btn btn-default">삭제</button>
				<input type="hidden" value=${board.bno } name="bno">
			</form>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>