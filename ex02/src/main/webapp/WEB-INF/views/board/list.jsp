<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!-- DataTables CSS -->
<link href="${pageContext.request.contextPath }/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="${pageContext.request.contextPath }/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<script src="${pageContext.request.contextPath }/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board</h1>
	</div>
	<table width="100%" id="board" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" style="width: 100%;">
		<thead>
			<tr>
				<th width="70px">글 번호</th>
				<th>제목</th>
				<th>내용</th>
				<th width="100px">작성자</th>
				<th width="100px">작성일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${list }">
				<tr>
					<td>${board.bno }</td>
					<td><a href="get?bno=${board.bno }">${board.title }</a></td>
					<td>${board.content }</td>
					<td>${board.writer }</td>
					<td><fmt:formatDate value="${board.regdate }"
							pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a class="btn btn-default btn-lg btn-block" href="${pageContext.request.contextPath }/board/registerForm">Register</a>
</div>

<script>
	$(function() {
		$("#board").DataTable();
	})
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>