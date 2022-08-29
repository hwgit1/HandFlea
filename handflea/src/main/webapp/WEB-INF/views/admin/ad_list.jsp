<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> QnA 게시판 목록 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/qna_style.css">
	</head>
	<body>
	<%@ include file="/WEB-INF/views/admin-header.jsp" %>
	<main>
		<h2> QnA 답변 대기 목록 </h2>
		<div id="qna-list">
			<table>
				<thead>
					<tr>
						<td class="qna_no">번호</td>
						<td class="qna_title">제목</td>
						<td class="qna_writer">작성자</td>
						<td class="qna_view">조회수</td>
						<td class="qna_date">작성일</td>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="dto" items="${list}">
					<c:if test="${dto.answer_yn == 0}">
					<tr>
						<td class="qna_no">${dto.qna_no}</td>
						<td class="qna_title">
							<a href="${pageContext.request.contextPath}/QnA/detail?qna_no=${dto.qna_no}">
								${dto.title}
							</a>
						</td>
						<td class="qna_writer">${dto.mem_name}</td>
						<td class="qna_view">${dto.view_cnt}</td>
						<td class="qna_date">${dto.write_date}</td>
					</tr>
					</c:if>
				</c:forEach>
				</tbody>
			</table>
		</div>
		
		
		<h2> QnA 답변 완료 목록 </h2>
		<div id="qna-list">
			<table>
				<thead>
					<tr>
						<td class="qna_no">번호</td>
						<td class="qna_title">제목</td>
						<td class="qna_writer">작성자</td>
						<td class="qna_view">조회수</td>
						<td class="qna_date">작성일</td>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="dto" items="${list}">
					<c:if test="${dto.answer_yn == 1}">
					<tr>
						<td class="qna_no">${dto.qna_no}</td>
						<td class="qna_title">
							<a href="${pageContext.request.contextPath}/QnA/detail?qna_no=${dto.qna_no}">
								${dto.title}
							</a>
						</td>
						<td class="qna_writer">${dto.mem_name}</td>
						<td class="qna_view">${dto.view_cnt}</td>
						<td class="qna_date">${dto.write_date}</td>
					</tr>
					</c:if>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="pagination">
			<c:if test="${startPageNum > 10}">
				<a href="${pageContext.request.contextPath}/QnA/list?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
					&laquo;
				</a>
				</li>
			</c:if>
			<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
				<c:choose>
					<c:when test="${page_no == userWantPage}">
						<a class="active">${page_no}</a>
					</c:when>
					<c:otherwise>
							<a href="${pageContext.request.contextPath}/QnA/list?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								${page_no}
							</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
					<a href="${pageContext.request.contextPath}/QnA/list?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						&raquo;
					</a>
			</c:if>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>














