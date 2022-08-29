<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Home</title>
<style type="text/css">
#product {
	width: 100%;
}
.product-list {
	width: 100%;
	padding: 20px 0;
}
.item-box {
	width: 100%;
	display: flex;
	flex-direction: row;
	margin: 10px 0;
}
.item-card {
	width: 23%;
	border: 1px solid #cecece;
}
.item-card > a {
	color: black;
}
.item-card > a > img {
	width: 100%;
	height: auto;
}
.item-detail {
	border-top: 1px solid #cecece;
}
.item-detail > p {
	font-size: small;
}
.item-detail > div {
	display: flex;
	flex-direction: row;
}
.item-detail > div > img {
	width: 18px;
	margin: 0;
}
.item-detail > div > p {
	font-size: small;
	margin: 0;
	margin-left: 3px;
	color: #595959;
}
</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="product">
				<div class="product-list">
					<h3>BEST</h3>
					<div class="item-box">
						<div class="item-card">
							<a href="#">
								<img alt="product_img" src="${pageContext.request.contextPath}/resources/img/lemon.jpg">
								<div class="item-detail">
									<div>
										<img alt="profile" src="${pageContext.request.contextPath}/resources/img/user.png"> <p>판매자명</p>
									</div>
									<h4>상품명</h4>
									<p>10000원</p>
									<p>별점</p>
								</div>
							</a>
						</div>
						<div class="item-card">
							<a href="#">
								<img alt="product_img" src="${pageContext.request.contextPath}/resources/img/lemon.jpg">
								<div class="item-detail">
									<div>
										<img alt="profile" src="${pageContext.request.contextPath}/resources/img/user.png"> <p>판매자명</p>
									</div>
									<h4>상품명</h4>
									<p>10000원</p>
									<p>별점</p>
								</div>
							</a>
						</div>
						<div class="item-card">
							<a href="#">
								<img alt="product_img" src="${pageContext.request.contextPath}/resources/img/lemon.jpg">
								<div class="item-detail">
									<div>
										<img alt="profile" src="${pageContext.request.contextPath}/resources/img/user.png"> <p>판매자명</p>
									</div>
									<h4>상품명</h4>
									<p>10000원</p>
									<p>별점</p>
								</div>
							</a>
						</div>
						<div class="item-card">
							<a href=#>
								<img alt="product_img" src="${pageContext.request.contextPath}/resources/img/lemon.jpg">
								<div class="item-detail">
									<div>
										<img alt="profile" src="${pageContext.request.contextPath}/resources/img/user.png"> <p>판매자명</p>
									</div>
									<h4>상품명</h4>
									<p>10000원</p>
									<p>별점</p>	
								</div>
							</a>
						</div>
					</div>
				</div>
				<div class="product-list">
					<h3>NEW</h3>
					<div class="item-box">
						<div class="item-card">
							<a href="#">
								<img alt="product_img" src="${pageContext.request.contextPath}/resources/img/lemon.jpg">
								<div class="item-detail">
									<div>
										<img alt="profile" src="${pageContext.request.contextPath}/resources/img/user.png"> <p>판매자명</p>
									</div>
									<h4>상품명</h4>
									<p>10000원</p>
									<p>별점</p>
								</div>
							</a>
						</div>
						<div class="item-card">
							<a href="#">
								<img alt="product_img" src="${pageContext.request.contextPath}/resources/img/lemon.jpg">
								<div class="item-detail">
									<div>
										<img alt="profile" src="${pageContext.request.contextPath}/resources/img/user.png"> <p>판매자명</p>
									</div>
									<h4>상품명</h4>
									<p>10000원</p>
									<p>별점</p>
								</div>
							</a>
						</div>
						<div class="item-card">
							<a href="#">
								<img alt="product_img" src="${pageContext.request.contextPath}/resources/img/lemon.jpg">
								<div class="item-detail">
									<div>
										<img alt="profile" src="${pageContext.request.contextPath}/resources/img/user.png"> <p>판매자명</p>
									</div>
									<h4>상품명</h4>
									<p>10000원</p>
									<p>별점</p>
								</div>
							</a>
						</div>
						<div class="item-card">
							<a href="#">
								<img alt="product_img" src="${pageContext.request.contextPath}/resources/img/lemon.jpg">
								<div class="item-detail">
									<div>
										<img alt="profile" src="${pageContext.request.contextPath}/resources/img/user.png"> <p>판매자명</p>
									</div>
									<h4>상품명</h4>
									<p>10000원</p>
									<p>별점</p>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</main>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>
