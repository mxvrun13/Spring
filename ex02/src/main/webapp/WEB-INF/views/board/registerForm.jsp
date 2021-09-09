<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel-body">
			<form role="form" id="frm" 
				action="${pageContext.request.contextPath }/board/register"
				method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label>Title</label> <input class="form-control" name="title">
				</div>
				<div class="form-group">
					<label>Text Area</label>
					<textarea class="form-control" rows="3" name="content"></textarea>
				</div>
				<div class="form-group">
					<label>Writer</label> <input class="form-control" name="writer"
						value="${board.writer }">
				</div>
				<button type="submit" id="btnRegister" class="btn btn-default">등록</button>
				<button type="reset" class="btn btn-default">취소</button>
			</form>
			<div class="form-group">
				<label>File</label> <input type="file" class="form-control" name="uploadFile" multiple="multiple">
				<button type="button" id="uploadBtn" class="btn btn-default">첨부 파일 등록</button>
			</div>
			<ul id="uploaded"></ul>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		$("#uploadBtn").on("click", function(e) {
			var formData = new FormData(document.frm);
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			for (i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					return;
				}
				formData.append("uploadFile", files[i]);
			}
			//formData
			$.ajax({
				processData : false,
				contentType : false,
				url : "../uploadAjaxAction",
				data : formData,
				method : "POST",
				success : function(datas) {
					var str ="";
					for(i=0; i<datas.length; i++) {
						var obj = datas[i];
						var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
					    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					      
						str += "<li "
						str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
						str += "<span> "+ obj.fileName+"</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
						str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='../resources/img/attach.png'></a>";
						str += "</div>";
						str +"</li>";
					}
					$("#uploaded").html(str);
					alert("uploaded");
				}
			});
		});
		
		//등록버튼 이벤트
		$("#btnRegister").on("click", function(){
			var str = "";
			$("#uploaded li").each(function(i, obj){
				var jobj = $(obj);
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			    str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			    str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			    str += "<input type='hidden' name='attachList["+i+"].fileType' value='1'>"; 
			});
			$("#frm").append(str).submit();
		})
		
		$("#uploaded").on("click", "button", function(e){
			if(confirm("Remove this file?")) {
				var targetLi = $(this).closest("li");
				targetLi.remove();
			}
		})
	});
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>