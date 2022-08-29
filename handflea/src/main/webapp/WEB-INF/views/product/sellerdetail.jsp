<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>판매 물품 상세 페이지</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/product_style.css">
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
		<input type="text" id="prdt_no" value="${detail_dto.prdt_no}" hidden="hidden">
		<main>
			<div id="prdt-outline">
				<div id="prdt-img">
					<img alt="product_pic" src="${detail_dto.thumbnail_path}">
				</div>
				<div id="prdt-detail">
					<div id="profile">
						<div>
							<div class="detail-img-box">
								<img class="detail-seller-profile" alt="profile" src="${detail_dto.mem_photopath}">
							</div>
							<p>${detail_dto.seller_name}</p>
						</div>
					</div>
					<div>
						<h3>${detail_dto.prdt_name}</h3>
					</div>
					<div class="prdt-element">
						<div class="element-label">
							판매가
						</div>
						<div class="element-value">
							<p id="price">${detail_dto.price}</p> <p>원</p>
						</div>
					</div>
					<div class="prdt-element">
						<div class="element-label">
							배송비
						</div>
						<div class="element-value">
							<p id="delivery">${detail_dto.delivery_price}</p> <p>원</p>
						</div>
					</div>
					<div class="prdt-element">
						<div class="element-label">
							상품 준비 기간
						</div>
						<div class="element-value">
							<p id="price">${detail_dto.prdt_rdy}</p> <p>일</p>
						</div>
					</div>
					<div class="prdt-element">
						<div class="element-label">
							옵션
						</div>
						<div class="element-value">
							<select id="option_no" name="option_no">
								<option value="0" selected="selected">옵션을 선택하세요.</option>
							</select>
						</div>
					</div>
					<div id="button-box">
					<c:if test="${detail_dto.mem_no == login_info.mem_no}">
						<div id="left-button">
							<button id="delete_btn"> 상 품 삭 제 </button>
						</div>
						<div id="right-button">
							<a href="${pageContext.request.contextPath}/product/uform?prdt_no=${detail_dto.prdt_no}">
								<button> 상 품 수 정 </button>
							</a>
						</div>
					</c:if>
					</div>
				</div>
			</div>
			<div id="prdt-desc">
				<h4>상품 설명</h4>
				<div id="prdt-desc-img">
					<c:if test="${detail_dto.desc_img_path != null}">
					<img alt="prdt_desc_img" src="${detail_dto.desc_img_path}">
					</c:if>
				</div>
				<p>${detail_dto.description}</p>
			</div>		
		</main>	
		
		
	<%@ include file="/WEB-INF/views/footer.jsp" %>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#delete_btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/product/delete"
					, {
						prdt_no : ${detail_dto.prdt_no}
						, thumbnail_path : "${detail_dto.thumbnail_path}"
						, desc_img_path : "${detail_dto.desc_img_path}"
					}
					, function(data, status) {
						if( data >= 1 ){
							alert("상품이 삭제 되었습니다.");
							location.href="${pageContext.request.contextPath}/product/sellerlist";
						} else if( data <= 0 ) {
							alert("상품 삭제를 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/product/option"
					, { prdt_no : $("#prdt_no").val() }
					, function(data, status) {
						$.each(JSON.parse(data), function(idx, dto) { 
							$("#option_no").append("<option value='" + dto.option_no + "'>" + dto.option_contents + "</option>");
						});//each
					}//call back function
		);//get
	});//ready
	</script>
	
	</body>
</html>
