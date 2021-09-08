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
		<h1 class="page-header">Board</h1>
	</div>
	<table width="100%" id="board"
		class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline"
		id="dataTables-example" style="width: 100%;">
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
					<td><a class="move" href="${board.bno }">${board.title } [${board.replycnt }]</a></td>
					<td>${board.content }</td>
					<td>${board.writer }</td>
					<td><fmt:formatDate value="${board.regdate }"
							pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form id="actionForm" action="list" method="get">
		<select name="type">
			<option value="" ${empty pageMaker.cri.type ? 'selected' : "" }>선택</option>
			<option value="T" ${pageMaker.cri.type=="T" ? 'selected' : "" }>제목</option>
			<option value="C" ${pageMaker.cri.type=="C" ? 'selected' : "" }>내용</option>
			<option value="W" ${pageMaker.cri.type=="W" ? 'selected' : "" }>작성자</option>
			<option value="TC" ${pageMaker.cri.type=="TC" ? 'selected': "" }>제목 or 내용</option>
			<option value="TW" ${pageMaker.cri.type=="TW" ? 'selected' : "" }>제목 or 작성자</option>
			<option value="TWC" ${pageMaker.cri.type=="TWC" ? 'selected' : "" }>제목 or 내용 or 작성자</option>
		</select>
		<input name="keyword" value="${pageMaker.cri.keyword }">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<button class="btn btn-default">Search</button>
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
		href="${pageContext.request.contextPath }/board/registerForm">Register</a>
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
		$(".move").on("click", function(e) {
			e.preventDefault();
			var bno = $(this).attr("href");
			actionForm.append('<input type="hidden" name="bno" value="'+ bno +'">');
			actionForm.attr("action", "get");
			actionForm.submit();
		})
	});
	//	$(function() {
	//		$("#board").DataTable();
	//	})
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>