<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HandFlea</title>
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
						<a href="#">내가 작성한 후기</a>
						<h4>내 정보</h4>
						<a onclick="pwd_ch()">회원정보 변경</a>
						<a href="${pageContext.request.contextPath}/mypage/regist">판매자 등록</a>
						<c:if test="${login_info.seller_yn == 1}">
						<h4>판매자 메뉴</h4>
						<a href="${pageContext.request.contextPath}/product/sellerlist">상품 등록 / 관리</a>
						<a href="${pageContext.request.contextPath}/mypage/sale">판매 내역</a>
						<a href="${pageContext.request.contextPath}/mypage/adjust">정산</a>
						</c:if>
					</div>
				</div>
			</div>
			<div id="main-content">
				<h2>주문 받은 상품 목록</h2>
				<div class="list-box">
					<table>
						<tr class="list-top">
							<td class="sale-no">주문 번호</td>
							<td class="sale-prdt">상품명</td>
							<td class="sale-opt-qty">옵션/수량</td>
							<td class="sale-delivery">운송장 번호</td>
							<td class="sale-delivery-con">배송 상태</td>
							<td class="sale-refund">환불 여부</td>
						</tr>
						<c:forEach var="list" items="${sale_list}">
						<tr class="sale-list">
							<td class="sale-no">${list.detail_no}</td>	
							<td class="sale-prdt">
								<a href="${pageContext.request.contextPath}/mypage/detail?detail_no=${list.detail_no}">
									<p>${list.prdt_name}</p>
								</a>
							</td>
							<td class="sale-opt-qty">${list.option_contents}/${list.buy_qty}</td>
							<td class="sale-delivery">
							<c:choose>
								<c:when test="${list.prdt_con == 1 || list.prdt_con == 2}">
								<p>${list.delivery_c_name}</p>
								<p>${list.delivery_no}</p>
								</c:when>
								<c:otherwise>
								<p>미등록</p>
								</c:otherwise>
							</c:choose>
							</td>
							<td class="sale-delivery-con">
							<c:choose>
								<c:when test="${list.prdt_con == 3 || list.prdt_con == 4 || list.prdt_con == 5}">
								상품 준비 중
								</c:when>
								<c:otherwise>
								${list.code_name}
								</c:otherwise>
							</c:choose>
							</td>
							<td class="sale-refund">
							<c:choose>
								<c:when test="${list.prdt_con == 3 || list.prdt_con == 4 || list.prdt_con == 5}">
								${list.code_name}
								</c:when>
								<c:otherwise>
								-
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
						</c:forEach>
						<c:if test="${sale_cnt == 0}">
						<tr>
							<td colspan="6">주문 내역이 없습니다.</td>
						</tr>
						</c:if>
					</table>
				</div>
			</div>
		</main>	
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>