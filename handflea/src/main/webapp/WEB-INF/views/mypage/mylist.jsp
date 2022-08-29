<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 내가 작성한 QnA </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/mypage_style.css">	
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="side">
				<div id="profile">
					<h3>My Page</h3>
					<div>
						<img alt="profile_photo" src="${login_info.mem_photopath}">
					</div>
					<p>${login_info.mem_name} 님</p>
					<p style="font-size: small; margin-bottom: 10px;">${login_info.mem_email}</p>
				</div>
				<div id="menu-box">
					<div id="menu-link">
						<h4>나의 쇼핑</h4>
						<a href="${pageContext.request.contextPath}/mypage/order">주문 내역</a>
						<a href="${pageContext.request.contextPath}/basket/list">장바구니</a>
						<h4>나의 활동</h4>
						<a href="${pageContext.request.contextPath}/QnA/mylist">Q&A 문의 내역</a>
						<a href="${pageContext.request.contextPath}/review/mylist">내가 작성한 후기</a>
						<h4>내 정보</h4>
						<a onclick="pwd_ch()">회원정보 변경</a>
						<a href="${pageContext.request.contextPath}/mypage/regist">판매자 등록</a>
						<c:if test="${login_info.seller_yn != null && login_info.seller_yn != '0'}">
						<h4>판매자 메뉴</h4>
						<a href="${pageContext.request.contextPath}/product/sellerlist">상품 등록 / 관리</a>
						<a href="${pageContext.request.contextPath}/mypage/sale">판매 내역</a>
						<a href="${pageContext.request.contextPath}/mypage/adjust">정산</a>
						</c:if>
					</div>
				</div>
			</div>
			<div id="main-content">
				<h4>내가 작성한 QnA</h4>
				<div class="list-box">
					<table class="table table-hover">
						<tr class="list-top">
							<td> QnA번호 </td>
							<td> 제목 </td>
							<td> 작성자 </td>
							<td> 조회수 </td>
							<td> 작성일 </td>
							<td> 답변상태 </td>
						</tr>
						<tbody>
						<c:forEach var="dto" items="${list}">
						<c:if test="${login_info.mem_no == dto.mem_no}"> 
							<tr>
								<td>${dto.qna_no}</td>
								<td>
									<a href="${pageContext.request.contextPath}/QnA/detail?qna_no=${dto.qna_no}">
										${dto.title}
									</a>
								</td>
								<td>${dto.mem_name}</td>
								<td>${dto.view_cnt}</td>
								<td>${dto.write_date}</td>
								<c:if test="${dto.answer_yn == 1}">
								<td>답변 완료</td>
								</c:if>
								<c:if test="${dto.answer_yn == 0}">
								<td>답변 대기</td>
								</c:if>
							</c:if>		
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</main>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	function pwd_ch() {
		var userinput = prompt("비밀번호를 입력해주세요.");
		if ("${login_info.mem_pwd}" == userinput) {
			location.href="${pageContext.request.contextPath}/mypage/myinfo";
		} else {
			alert("비밀번호가 틀렸습니다.");
			location.href="${pageContext.request.contextPath}/mypage/";
		}
	}
	</script>
	</body>
</html>














