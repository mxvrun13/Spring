<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Modify</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel-body">
			<form role="form"
				action="${pageContext.request.contextPath }/board/modify"
				method="post">
				<!-- <input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">  -->
				<div class="form-group">
					<label>Title</label> <input class="form-control" name="title"
						value="${board.title }">
				</div>
				<div class="form-group">
					<label>Text Area</label>
					<textarea class="form-control" rows="3" name="content">${board.content }</textarea>
				</div>
				<div class="form-group">
					<label>Writer</label> <input class="form-control" name="writer"
						value="${board.writer }">
				</div>
				<button type="submit" class="btn btn-default">수정</button>
				<button type="submit"
					formaction="${pageContext.request.contextPath }/board/delete"
					class="btn btn-default">삭제</button>
				<a class="btn btn-success"
					href="list?pageNum=${cri.pageNum }&amount=${cri.amount }">목록</a> <input
					type="hidden" value=${board.bno } name="bno">
			</form>
			<div class="form-group"><br>
			<!-- 첨부파일 -->
				<c:forEach var="attach" items="${board.attachList }">
					<p><a href="download?uuid=${attach.uuid }">${attach.fileName }</a></p>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<!-- 댓글 등록 -->
<div class="panel-heading">
	<form id="replyForm">
		<input type="hidden" name="bno" value="${board.bno }"> <input
			name="replyer"> <input name="reply">
		<button type="button" id="saveReply">댓글 등록</button>
	</form>
</div>
<!-- 댓글 목록 -->
<div class="row">
	<div class="col-lg-12">
		<h3>댓글 목록</h3>
		<hr>
		<ul class="chat">
		</ul>
	</div>
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
</div>

<script type="text/javascript">
	let bno = "${board.bno}";
	$(function () {
		//등록처리
		$("#saveReply").on("click", function () {
			$.ajax({
				url: "../reply/",
				method: "POST",
				data: $("#replyForm").serialize(),
				dataType: "json",
				success: function (data) {
					console.log(data);
					$(".chat").append(makeLi(data)); 
				}
			});
		});
		
		function makeLi(data){
			return '<li class="left clearfix">' +
			'	<div>' +
			'			<div class="header">' +
			'				<strong class="primary-font">' + data.replyer + '</strong> ' +
			'				<small	class="pull-right text-muted">' + data.replyDate +
			'</small>' +
			'			</div>' +
			'			<p>' + data.reply + '</p>' +
			'		</div>' +
			'	</li> ';
		}
		
		//목록조회
		$.ajax({
			url: "../reply/",
			data: {bno: bno}, 
			dataType: "json",
			success: function (datas) {
				console.log(datas);
				str = "";
				for (i = 0; i < datas.list.length; i++) {
					str += makeLi(datas.list[i]);
				$(".chat").html(str);
				}
			}
		});
	});
	
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>