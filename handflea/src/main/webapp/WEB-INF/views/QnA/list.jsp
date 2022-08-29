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
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<h2> QnA 게시판 목록 </h2>
			<div id="qna-list">
				<table>
					<thead>
						<tr>
							<td class="qna_no">번호</td>
							<td class="qna_title">제목</td>
							<td class="qna_writer">작성자</td>
							<td class="qna_view">조회수</td>
							<td class="qna_date">작성일</td>
							<th class="qna_yn"> 답변상태 </th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}">
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
								<c:if test="${dto.answer_yn == 1}">
								<td class="qna_yn">답변 완료</td>
								</c:if>
								
								<c:if test="${dto.answer_yn == 0}">
								<td class="qna_yn">답변 대기</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="pagination">
				<c:if test="${startPageNum > 10}">
					<a href="${pageContext.request.contextPath}/QnA/list?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						&laquo;
					</a>
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
			<div id="board-bottom">
				<div class="search-box">
					<form action="${pageContext.request.contextPath}/QnA/list" method="get">
						<select id="searchOption" name="searchOption">
							<option value="title"
								<c:if test="${search_dto.searchOption == 'title'}">selected="selected"</c:if>
							> 제 목 </option>
							<option value="writer"
								<c:if test="${search_dto.searchOption == 'writer'}">selected="selected"</c:if>
							> 작 성 자 </option>
						</select>
						<input type="text" id="searchWord" name="searchWord"
								value="${search_dto.searchWord}">
						<button type="submit"> 검 색 </button>
					</form>
				</div>
				<div id="button-box">
					<a href="${pageContext.request.contextPath}/QnA/write_form">
						<button> 문의글 작성 </button>
					</a>
				</div>
			</div>
		</main>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>














