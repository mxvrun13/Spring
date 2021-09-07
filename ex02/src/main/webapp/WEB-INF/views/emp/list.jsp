<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!-- DataTables CSS -->
<link
	href="${pageContext.request.contextPath }/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="${pageContext.request.contextPath }/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<script
	src="${pageContext.request.contextPath }/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Employees</h1>
	</div>
	<table width="100%" id="emp"
		class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline"
		id="dataTables-example" style="width: 100%;">
		<thead>
			<tr>
				<th width="70px">사원번호</th>
				<th>이름</th>
				<th>입사일</th>
				<th>부서</th>
				<th>월급</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="emp" items="${list }">
				<tr>
					<td>${emp.empno }</td>
					<td><a class="move" href="${emp.empno }">${emp.empname }</a></td>
					<td><fmt:formatDate value="${emp.hiredate }"
							pattern="yyyy-MM-dd" /></td>
					<td>${emp.department }</td>
					<td>${emp.salary }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form id="actionForm" action="list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	</form>
	<div id="pageButton">
		<c:if test="${pageMaker.prev }">
			<a href="${pageMaker.startPage-1 }">이전</a>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }"
			var="num">
			<a href="${num }">${num }</a>
		</c:forEach>
		<c:if test="${pageMaker.next }">
			<a href="${pageMaker.endPage+1 }">다음</a>
		</c:if>
	</div>
	<a class="btn btn-default btn-lg btn-block"
		href="${pageContext.request.contextPath }/emp/registerForm">Register</a>
</div>

<script>
	var actionForm = $("#actionForm")

	$(function() {
		$("#pageButton a").on("click", function(e) {
			e.preventDefault();
			var p = $(this).attr("href")
			$("[name='pageNum']").val(p)
			actionForm.submit();
		})

	});

	$(function() {
		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							var bno = $(this).attr("href");
							actionForm
									.append('<input type="hidden" name="bno" value="'+ bno +'">');
							actionForm.attr("action", "get");
							actionForm.submit();
						})
	});
	//	$(function() {
	//		$("#emp").DataTable();
	//	})
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>