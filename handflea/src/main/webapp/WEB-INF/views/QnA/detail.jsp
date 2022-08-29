<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> QnA 상세 보기 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/qna_style.css">
	</head>
	<body>
	<c:choose>
		<c:when test="${login_info.mem_email == 'admin'}">
			<%@include file="/WEB-INF/views/admin-header.jsp" %>
		</c:when>
		<c:otherwise>
			<%@ include file="/WEB-INF/views/header.jsp" %>
		</c:otherwise>
	</c:choose>
		<main>
			<div id="qna-detail">
				<div id="qna-question">
					<div id="qna-top">
						<h3>${detail_dto.title}</h3>
						<p>${detail_dto.write_date}</p>
					</div>
					<div id="qna-middle">
						<div id="qna-img">
							<img alt="profile" src="${detail_dto.mem_photopath}" >
						</div>
						<div id="qna-profile">
							<p>${detail_dto.mem_name}</p>
						</div>
					</div>
					<div id="qna-bottom">
						<p>${detail_dto.contents}</p>
					</div>
					<c:if test="${detail_dto.mem_no == login_info.mem_no}">
						<div id="qna-button">
							<button id="btn_delete" class="btn btn-danger"> 글 삭제 </button>
							<c:if test="${detail_dto.answer_yn == 0}">
							<a href="${pageContext.request.contextPath}/QnA/update_form?qna_no=${detail_dto.qna_no}">
								<button class="btn btn-primary"> 글 수정 </button>
							</a>
							</c:if>
						</div>
					</c:if>
				</div>
				<div id="qna-reply">
				<c:if test="${login_info.mem_email == 'admin' && detail_dto.answer_yn == 0}">
					<div id="qna-reply-top">
					<h3>답변 작성란</h3>
					</div>
					<div id="qna-reply-bottom">
						<div id="qna-reply-admin">
							<p>HandFlea<br>CS 담당자</p>
						</div>
						<div id="qna-reply-input">
							<textarea id="answer" name="answer" rows="5" cols="100" placeholder="답변을 입력하세요."></textarea>
							<button id="btn_reply">답변<br>등록</button>
						</div>
					</div>
				</c:if>
				<c:if test="${detail_dto.answer_yn == 1}">
					<div id="qna-reply-top">
						<h3>답변</h3>
					</div>
					<div id="qna-reply-bottom">
						<div id="qna-reply-admin">
							<p>HandFlea<br>CS 담당자</p>
						</div>
						<div id="qna-reply-input">
							<p>${detail_dto.answer}</p>
						</div>
					</div>
				</c:if>
				</div>
			</div>
			<div id="list-button">
			<c:choose>
				<c:when test="${login_info.mem_email == 'admin'}">
				<a href="${pageContext.request.contextPath}/admin/ad_list">
					<button>목록으로</button>
				</a>
				</c:when>
				<c:otherwise>
				<a href="${pageContext.request.contextPath}/QnA/list">
					<button>목록으로</button>
				</a>
				</c:otherwise>
			</c:choose>
			</div>
		</main>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#btn_delete").click(function() {
			$.get(
					"${pageContext.request.contextPath}/QnA/delete"
					, {
						qna_no : ${detail_dto.qna_no},
						mem_no : ${detail_dto.mem_no}
					}
					, function(data, status) {
						if( data == 1 ){
							alert("QnA가 삭제 되었습니다.");
							location.href="${pageContext.request.contextPath}/QnA/list";
						} else if( data == 0 ) {
							alert("QnA 삭제를 실패 하였습니다.");
						} else if ( data == 3){
							alert("다른 사람의 게시글을 삭제할 수 없습니다.")
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}
			);
		});
	});
	$(document).ready(function() {
		$("#btn_reply").click(function() {
			$.post(
					"${pageContext.request.contextPath}/admin/reply_insert"
					, {
						qna_no : ${detail_dto.qna_no}
						, answer : $("#answer").val()
					}
					, function(data, status) {
						if( data == 1 ){
							alert("답변이 작성되었습니다.");
							location.href="${pageContext.request.contextPath}/QnA/detail?qna_no=${detail_dto.qna_no}";
						} else if( data == 0 ) {
							alert("답변 작성을 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}
			);
		});//click
	});//ready
	</script>
	</body>
</html>