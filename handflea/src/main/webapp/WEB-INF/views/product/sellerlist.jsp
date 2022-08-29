<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 상품 관리 </title>
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
				<h2>상품 등록 / 관리</h2>
				<div id="board-top">
					<div class="search-box">
						<form action="${pageContext.request.contextPath}/product/sellerlist" method="get">
							<select class="form-control" id="searchOption" name="searchOption">
								<option value="prdt_name"
									<c:if test="${search_dto.searchOption == 'prdt_name'}">selected="selected"</c:if>
									> 상 품 이 름 </option>
							</select>
							<input type="text" class="form-control" id="searchWord" name="searchWord"
									value="${search_dto.searchWord}">
							<button type="submit"> 검 색 </button>
						</form>
					</div>
					<div id="button-box">
						<a href="${pageContext.request.contextPath}/product/form">
							<button> 상 품 등 록 </button>
						</a>
					</div>
				</div>
				<div class="list-box">
					<table>
						<tr class="list-top">
							<td class="seller-prdt">상품명</td>
							<td class="seller-price">가격</td>
						</tr>
						<tbody>
							<c:forEach var="dto" items="${list}">
								<tr>
									<td class="seller-prdt">
										<a href="${pageContext.request.contextPath}/product/sellerdetail?prdt_no=${dto.prdt_no}">
											<div class="seller-prdt-box">
												<div class="seller-prdt-img">
													<img src="${dto.thumbnail_path}" class="img-thumbnail">
												</div>
												<p>${dto.prdt_name}</p>
											</div>
										</a>
									</td>
									<td class="seller-price">${dto.price} 원</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="pagination">
					<c:if test="${startPageNum > 10}">
						<a href="${pageContext.request.contextPath}/product/sellerlist?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
							Previous
						</a>
					</c:if>
					<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
						<c:choose>
							<c:when test="${page_no == userWantPage}">
								<a class="active">${page_no}</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/product/sellerlist?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
									${page_no}
								</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${lastPageNum > endPageNum}">
						<a href="${pageContext.request.contextPath}/product/sellerlist?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
							Next
						</a>
					</c:if>
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
