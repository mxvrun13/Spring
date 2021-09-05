<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Employee Register</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel-body">
			<form role="form"
				action="${pageContext.request.contextPath }/emp/register"
				method="post">
				<div class="form-group">
					<label>Name</label> <input class="form-control" name="empname">
				</div>
				<div class="form-group">
					<label>Hire Date</label> <input type="date" class="form-control" name="hiredate">
				</div>
				<div class="form-group">
					<label>Department</label> <input class="form-control" name="department">
				</div>
				<div class="form-group">
					<label>Salary</label> <input class="form-control" name="salary">
				</div>
				<button type="submit" class="btn btn-default">등록</button>
				<button type="reset" class="btn btn-default">취소</button>
			</form>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>