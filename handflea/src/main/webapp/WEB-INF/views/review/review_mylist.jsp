<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>HandFlea</title>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/mypage_style.css">
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
						<a href="#">내가 작성한 후기</a>
						<h4>내 정보</h4>
						<a onclick="pwd_ch()">회원정보 변경</a>
						<a href="${pageContext.request.contextPath}/mypage/regist">판매자 등록</a>
						<c:if test="${login_info.seller_yn == 1}">
						<h4>판매자 메뉴</h4>
						<a href="${pageContext.request.contextPath}/product/form">상품 등록 / 관리</a>
						<a href="${pageContext.request.contextPath}/mypage/sale">판매 내역</a>
						<a href="${pageContext.request.contextPath}/mypage/adjust">정산</a>
						</c:if>
					</div>
				</div>
			</div>
			<div id="main-content">
				<h2>내가 작성한 후기</h2>
				<div class="list-box">
					<table class="table table-hover">
		            	<tr class="list-top">
			               <td class="review-prdt">상품정보</td>
			               <td class="review-cnts">후기</td>
			               <td class="review-point">평가</td>
			               <td class="review-date">작성일</td>
			            </tr>
			        	<tbody>
						<c:forEach var="dto" items="${list}">
			            <c:if test="${login_info.mem_no == dto.mem_no}">
			            	<tr class="review-list">
			                	<td class="review-prdt">
			                		<div class="review-prdt-box">
			                			<div class="review-prdt-img">
			                				<img alt="product" src="${dto.thumbnail_path}">
			                			</div>
				                		<div class="review-prdt-outline">
				                			<a href="${pageContext.request.contextPath}/product/detail?prdt_no=${dto.prdt_no}">
					                			<p>${dto.prdt_name}</p>
				                			</a>
				                			<p class="review-prdt-opt"><span>옵션</span>${dto.option_contents}</p>
				                		</div>
			                		</div>
			                	</td>
			                	<td class="review-cnts">${dto.review_contents}</td>
			                	<td class="review-point">
			                		<div>
				                	<c:forEach var="i" begin="1" end="${dto.star_point}">
					                	<p class="full-star">★</p>
				                	</c:forEach>
				                	<c:forEach var="i" begin="${dto.star_point + 1}" end="5">
					                	<p class="empty-star">★</p>
				                	</c:forEach>
			                		</div>
			                	</td>
			                	<td class="review-date">${dto.reg_date}</td>
			               </tr>
			            </c:if> 
			            </c:forEach>
			         </tbody>
			      </table>
				</div>
			</div>
		</main>   	
	</body>
</html>