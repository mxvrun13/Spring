<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Employee</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel-body">
			<form id="frm" role="form"
				action="${pageContext.request.contextPath }/emp/delete"
				method="post">
				<div class="form-group">
					<label>Employee ID</label> <input id="empno" class="form-control" name="empno"
						value="${employee.empno }" readonly>
				</div>
				<div class="form-group">
					<label>Name</label> <input id="empname" class="form-control" name="empname"
						value="${employee.empname }" readonly>
				</div>
				<div class="form-group">
					<label>Hire Date</label> <input class="form-control"
						name="hiredate"
						value="<fmt:formatDate value="${employee.hiredate }"
							pattern="yyyy-MM-dd" />"
						readonly>
				</div>
				<div class="form-group">
					<label>Department</label> <input id="dept" class="form-control"
						name="department" value="${employee.department }" readonly>
				</div>
				<div class="form-group">
					<label>Salary</label> <input id="salary" class="form-control" name="salary"
						value="${employee.salary }" readonly>
				</div>
				<button id="modifyBtn" type="button" class="btn btn-default">수정</button>
				<button type="submit" class="btn btn-default">삭제</button>
			</form>
		</div>
	</div>
</div>

<script>
	$('#modifyBtn').click(function() {
		if ($(this).text() == '수정') {
			$('#empname').prop('readonly', false);
			$('#dept').prop('readonly', false);
			$('#salary').prop('readonly', false);
			$(this).text('완료')
		} else if ($(this).text() == '완료') {
			if (confirm('정말로 수정하시겠습니까?')) {
				$.ajax({
					url : '${pageContext.request.contextPath }/emp/modify',
					type : 'POST',
					data : {
						empno : $('#empno').val(),
						empname : $('#empname').val(), 
						department : $('#dept').val(), 
						salary : $('#salary').val()
					},
					success : function() {
						alert('수정되었습니다.');
						$('#empname').prop('readonly', true);
						$('#dept').prop('readonly', true);
						$('#salary').prop('readonly', true);
					},
					error : function() {
						alert('에러가 발생했습니다.');
					}
				})
				$(this).text('수정')
			}
		}
	})
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>