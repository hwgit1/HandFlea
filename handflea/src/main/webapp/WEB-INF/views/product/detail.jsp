<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HandFlea</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/product_style.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
     	<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
		<input type="hidden" id="mem_no" value="${detail_dto.mem_no}">
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
					<h3>${detail_dto.prdt_name}</h3>
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
							구매 후기
						</div>
						<div class="element-value">
							<div class="prdt-review">
								<c:forEach var="i" begin="1" end="${detail_dto.star_point}">
								<p class="full-star">★</p>
								</c:forEach>
								<c:forEach var="i" begin="${detail_dto.star_point + 1}" end="5">
								<p class="empty-star">★</p>
								</c:forEach>
								<p>&nbsp;(${detail_dto.cnt})</p>
							</div>
						</div>
					</div>
					<form id="buy_form">
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
						<div class="prdt-element">
							<div class="element-label">
								수량
							</div>
							<div class="element-value">
								<input type="hidden" id="prdt_no" name="prdt_no" value="${detail_dto.prdt_no}">
								<select id="buy_qty" name="buy_qty">
									<option value="0"> 선 택 </option>
									<c:forEach var="tmp_qty" begin="1" end="10">
										<option value="${tmp_qty}"> ${tmp_qty} </option>
									</c:forEach>
								</select>
							</div>
						</div>
					</form>
					<div class="prdt-element">
						<div class="element-label">
							구매 가격
						</div>
						<div class="element-value">
							<p id="tot_price_span">0</p> <p>원</p>
						</div>
					</div>	
					<div id="button-box">
						<div id="left-button">
							<a href="${pageContext.request.contextPath}/chat/?other_no=${detail_dto.mem_no}">
								<button id="chat_btn">문의하기</button>
							</a>
						</div>
						<div id="right-button">
							<button type="button" id="buy_now_btn">구매하기</button>
							<button type="button" id="jang_btn">장바구니 담기</button>
						</div>
					</div>
				</div>
			</div>
			<div id="prdt-desc">
				<h4>상품 설명</h4>
				<c:if test="${detail_dto.desc_img_path != null}">
				<div id="prdt-desc-img">
					<img alt="prdt_desc_img" src="${detail_dto.desc_img_path}">
				</div>
				</c:if>
				<p>${detail_dto.description}</p>
			</div>
			<hr>
			<div id="prdt-review">
				<h4>상품 후기</h4>
				<div id="review-list">
				<c:forEach var="dto" items="${reviewlist}">
					<div class="review-card">
						<div class="review-top">
							<div class="review-profile">
								<div class="review-profile-img">
									<img alt="profile" src="${dto.mem_photopath}">
								</div>
								<div class="review-outline">
									<p class="writer">${dto.mem_name}</p>
									<p class="write-date">${dto.reg_date}</p>
								</div>
							</div>
							<div class="review-photo">
								<c:if test="${dto.review_photopath != null}">
								<a href="${dto.review_photopath}" data-lightbox="image">
									<img alt="review_photo" src="${dto.review_photopath}">
								</a>
								</c:if>
							</div>
						</div>
						<div class="review-middle">
							<c:if test="${dto.option_contents != null && dto.option_contents != '0'}">
							<p class="review-opt"><span>옵션</span>${dto.option_contents}</p>
							</c:if>
							<c:if test="${dto.option_contents == null || dto.option_contents == '0'}">
							<p class="review-opt"><span>옵션 없음</span></p>
							</c:if>
							<div class="write-star">
								<c:forEach var="i" begin="1" end="${5 - dto.star_point}">
								<p class="empty-star">★</p>
								</c:forEach>
								<c:forEach var="i" begin="${5 - dto.star_point + 1}" end="5">
								<p class="full-star">★</p>
								</c:forEach>
							</div>
						</div>
						<div class="review-bottom">
							<p class="review-cnts">${dto.review_contents}</p>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</main>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
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
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#buy_qty").change(function() {

			$("#tot_price_span").text(
					$("#buy_qty").val() * ${detail_dto.price}
			);

		});//change
	});//ready
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#buy_now_btn").click(function() {

			if("${login_info.mem_no}" == ""){
				alert("로그인 해주세요.");
				return;
			}

			if( $("#buy_qty").val() == 0 ){
				alert("구매 수량을 선택 하세요.");
				return;
			}
			
			$("#buy_form").attr("action", "${pageContext.request.contextPath}/order/list");
			$("#buy_form").submit();
		});//click
	});//ready
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#jang_btn").click(function() {
			let option_no = $("#option_no :selected").val();
			if("${login_info.mem_no}" == ""){
				alert("로그인 해주세요.");
				return;
			}

			if( $("#buy_qty").val() == 0 ){
				alert("구매 수량을 선택 하세요.");
				return;
			}

			$.post(
					"${pageContext.request.contextPath}/basket/insert"
					, {
						prdt_no : ${detail_dto.prdt_no}
						, buy_qty : $("#buy_qty").val()
						, option_no : option_no
					}
					, function(data, status) {
						if(data >= 1){
							let tmp_bool = confirm("장바구니에 추가 하였습니다.\n장바구니로 이동 하시겠습니까?");
							if( tmp_bool == true ) location.href="${pageContext.request.contextPath}/basket/list";
						} else {
							alert("장바구니 추가를 실패 하였습니다.");
						}
					}//call back function
			);//post

		});//click
	});//ready
	</script>
	<script type="text/javascript">
	$(document).ready(function() {
		 //사진확대 
        lightbox.option({
            'resizeDuration' : 200,
            'wrapAround' : false,
            'disableScrolling' : false,
            'fitImagesInViewport' :false,
            'maxWidth' : 600,
            'maxHeight' : 600,
        })		
	});//ready
	</script>
	</body>
</html>