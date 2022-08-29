<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> QnA 답변하기 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
		<style type="text/css">
		.write_label {
			color : red;
		}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> QnA 답변하기 </h3>
		<hr>
		<table class="table table-hover">
			<tbody>
				<tr>
					<th> 제 목 </th>
					<td>
						<input type="text" id="title" name="title" maxlength="20"
								class="form-control">
						<label for="title" id="title_label" class="write_label"></label>
					</td>
				</tr>
				<tr>
					<th> 작 성 자 </th>
					<td>
						${login_info.mem_name}
					</td>
				</tr>
				<tr>
					<th> 내 용 </th>
					<td>
						<textarea class="form-contol" id="contents" name="contents"></textarea>
						<script type="text/javascript">
						CKEDITOR.replace("contents");
						</script>
						<label for="contents" id="contents_label" class="write_label"></label>
					</td>
				</tr>
			</tbody>
		</table>
		<button id="write_btn" class="btn btn-primary float-right"> QnA 답변 완료 </button>
		<a href="${pageContext.request.contextPath}/admin/ad_list">
			<button class="btn btn-warning"> QnA 답변 취소 </button>
		</a>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#write_btn").click(function() {

			

			if( CKEDITOR.instances.contents.getData() == "" ){
				$("#contents_label").text("답변을 입력 하세요.");
				return;
			}

			$.post(
					"${pageContext.request.contextPath}/admin/ad_write_form"
					, {
						contents : CKEDITOR.instances.contents.getData()
					}
					, function(data, status) {
						if(data >= 1){
							alert("답변작성이 완료 되었습니다.");
							location.href="${pageContext.request.contextPath}/admin/ad_list";
						} else if(data <= 0){
							alert("답변작성이 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}
			);
		});
	});
	</script>
	</body>
</html>
