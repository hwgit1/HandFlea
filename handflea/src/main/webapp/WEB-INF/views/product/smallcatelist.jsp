<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> MainPage </title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/product_style.css">
	</head>
	<body>
		<%@ include file="/WEB-INF/views/header.jsp" %>
			<main>
				<div id="product">
					<div class="product-list">
						<h3>&nbsp;&nbsp;${list[0].smallcate_name}</h3><br>
						<div class="item-box">
						<c:forEach var="dto" items="${list}">
							<div class="item-card">
								<a href="${pageContext.request.contextPath}/product/detail?prdt_no=${dto.prdt_no}">
									<img alt="product_img" src="${dto.thumbnail_path}">
									<div class="item-detail">
										<div>
											<div class="img-box">
												<img class="seller-profile" alt="profile" src="${dto.mem_photopath}">
											</div>
											<p class="seller-name">${dto.seller_name}</p>
										</div>
										<h4>${dto.prdt_name}</h4>
										<p>${dto.price}원</p>
										<div class="item-review">
											<c:forEach var="i" begin="1" end="${dto.star_point}">
											<p class="full-star">★</p>
											</c:forEach>
											<c:forEach var="i" begin="${dto.star_point + 1}" end="5">
											<p class="empty-star">★</p>
											</c:forEach>
											<p>(${dto.cnt})</p>
										</div>
									</div>
								</a>
							</div>
						</c:forEach>	
						</div>
					</div>
				</div>	
			</main>
			
		<%@ include file="/WEB-INF/views/footer.jsp" %>	
		<script type="text/javascript">
		
		</script>
	</body>
</html>