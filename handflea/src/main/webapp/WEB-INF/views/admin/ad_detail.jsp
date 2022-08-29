<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> QnA 상세 보기 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> QnA 상세 보기 </h3>
		<hr>
		<table class="table table-hover">
			<tbody>
				<tr>
					<th> QnA 번 호 </th>	<td>${detail_dto.qna_no}</td>
					<th> 제 목 </th>		<td>${detail_dto.title}</td>
				</tr>
				<tr>
					<th> 작 성 자 </th>	<td>${detail_dto.mem_name}</td>
					<th> 작 성 일 </th>	<td>${detail_dto.write_date}</td>
					
				</tr>
				<tr>
					<th> 내 용 </th>		<td colspan="1">${detail_dto.contents}</td>
					<th> 조회수 </th>		<td colspan="1">${detail_dto.view_cnt}</td>
					</tr>
			</tbody>
		</table>
		<hr>
		
		
		
			);
		});

	</script>
	</body>
</html>