<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>HandFlea</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/admin_style.css">
	</head>
	<body>
	<%@ include file="/WEB-INF/views/admin-header.jsp" %>
	
	<main>
		<div>
			<h3>회원 관리</h3>
		</div>
		
		<div class="list-box">
			<table id="mem-list">
				<thead>
					<tr class="list-top">
						<th class="mem-no">번호</th>	<th class="mem-name">이름</th>
						<th class="mem-email">이메일</th>	<th class="mem-pnum">전화번호</th>	
						<th class="mem-selleryn">분류</th>	<th class="mem-btn">판매자 권한</th>
					</tr>
					<c:forEach var="dto" items="${mem_list}">
					<tr class="">
						<td class="mem-no">${dto.mem_no}</td>
						<td class="mem-name">${dto.mem_name}</td>
						<td class="mem-email">${dto.mem_email}</td>
						<td class="mem-pnum">${dto.pnum}</td>
						<td class="mem-selleryn">
						<c:choose>
							<c:when test="${dto.seller_yn == 0}">
							<p>구매자</p>
							</c:when>
							<c:otherwise>
							<p>판매자</p>
							</c:otherwise>
						</c:choose>
						</td>
						<td class="mem-btn">
							<c:if test="${dto.seller_yn == 1}">
							<button class="revoke_btn" mem_no="${dto.mem_no}">권한 회수</button>
							</c:if>
						</td>
					</tr>
					</c:forEach>
				</thead>
			</table>
		</div>
	</main>
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$(".revoke_btn").click(function() {
			let mem_no = $(this).attr('mem_no');
			
			$.get(
					"${pageContext.request.contextPath}/admin/revoke", 
					{
						mem_no : mem_no
					},
					function(data, status) {
						if (data == 1) {
							alert("권한이 회수되었습니다.");
							location.href="${pageContext.request.contextPath}/admin/member";
						} else if (data == 0) {
							alert("권한 회수에 실패했습니다.");
						} else {
							alert("서버 에러");
						}
					}
			);
		});
	});
	</script>
	</body>
</html>