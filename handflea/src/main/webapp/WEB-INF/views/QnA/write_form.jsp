<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> QnA 글 쓰기 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/qna_style.css">
		<style type="text/css">
		.write_label {
			color : red;
		}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="write-top">
				<h2>QnA 글 작성</h2>
				<div id="write-button-box">
					<a href="${pageContext.request.contextPath}/QnA/list">
						<button>작성 취소</button>
					</a>
					<button id="write_btn">작성</button>
				</div>
			</div>
			<hr>
			<div id="write-box">
				<div id="write-title">
					<input type="text" id="title" name="title" maxlength="20" placeholder="제목을 입력해주세요">
					<label for="title" id="title_label"></label>
				</div>
				<div id="write-contents">
					<textarea id="contents" name="contents" placeholder="내용을 입력하세요."></textarea>
					<script type="text/javascript">
					CKEDITOR.replace("contents");
					</script>
					<label for="contents" id="contents_label" class="write_label"></label>
				</div>
			</div>
		</main>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#write_btn").click(function() {

			if( $.trim( $("#title").val() ) == "" ){
				$("#title_label").text("제목을 입력 하세요.");
				return;
			}

			if( CKEDITOR.instances.contents.getData() == "" ){
				$("#contents_label").text("내용을 입력 하세요.");
				return;
			}

			$.post(
					"${pageContext.request.contextPath}/QnA/write"
					, {
						title : $("#title").val()
						, contents : CKEDITOR.instances.contents.getData()
					}
					, function(data, status) {
						if(data >= 1){
							alert("게시글이 성공적으로 업로드 되었습니다.");
							location.href="${pageContext.request.contextPath}/QnA/list";
						} else if(data <= 0){
							alert("게시글 작성을 실패 하였습니다.");
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
