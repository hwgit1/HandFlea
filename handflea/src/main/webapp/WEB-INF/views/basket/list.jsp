<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 장바구니 목록 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/order_style.css">
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<h3> 장바구니 목록 </h3>
			<div id="basket">
				<table>
					<thead>
						<tr>
							<th class="basket-chk"> 선택 </th>
							<th class="basket-prdt"> 상품명 </th>
							<th class="basket-price"> 단가 </th>
							<th class="basket-qty"> 구매 수량 </th>
							<th class="basket-amt"> 구매 금액 </th>
							<th class="basket-deliamt"> 배송비</th>
							<th class="basket-delete"> 삭제 </th>
						</tr>
					</thead>
					<tbody>
						<c:set var="sum_product_class_qty" value="0" />
						<c:set var="sum_buy_amt" value="0" />
						<c:set var="sum_delivery_amt" value="0" />
						<c:set var="sum_buy_allamt" value="0" />
						
						<c:forEach var="dto" items="${list}" varStatus="status">
							<c:set var="sum_product_class_qty" value="${sum_product_class_qty + 1}" />
							<c:set var="sum_buy_amt" value="${sum_buy_amt + (dto.price * dto.buy_qty)}" />
							<c:set var="sum_delivery_amt" value="${sum_delivery_amt + dto.delivery_price}" />
							<c:set var="sum_buy_allamt" value="${sum_buy_allamt + (dto.price * dto.buy_qty) + dto.delivery_price}" />
							<tr>
								<td class="basket-chk">
									<input type="checkbox" class="order_check_box form-control" checked="checked" id="${dto.price}" name="${dto.delivery_price}" value="${dto.buy_qty}">
									<input type="hidden" id="basket_no${status.index}" name="basket_no${status.index}" value="${dto.basket_no}">
								</td>
								<td class="basket-prdt">
									<div class="order-prdt">
										<div class="order-prdt-img">
											<img src="${dto.thumbnail_path}" class="img-thumbnail">
										</div>
										<div class="order-prdt-outline">
											<a href="${pageContext.request.contextPath}/product/detail?prdt_no=${dto.prdt_no}">
												${dto.prdt_name}
											</a>
											<p><span>옵션</span>${dto.option_contents}</p>
										</div>
									</div>
								</td>
								<td class="basket-price"> ${dto.price} 원 </td>
								<td class="basket-qty">
									<select id="buy_qty" name="buy_qty">
										<c:forEach var="tmp_qty" begin="1" end="10">
											<option value="${tmp_qty}"
												<c:if test="${dto.buy_qty == tmp_qty}"> selected="selected"</c:if>
											> ${tmp_qty} </option>
										</c:forEach>
									</select>
									<button type="button" class="qty_chg_btn" value="${dto.basket_no}">변경</button>
								</td>
								<td class="basket-amt"> ${dto.price * dto.buy_qty} 원 </td>
								<td class="basket-deliamt"> ${dto.delivery_price} 원 </td>
								<td class="basket-delete">
									<button class="basket_delete_btn" value="${dto.basket_no}"> X </button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="basket-total">
				<div id="chk-sum">
					<div>
						<p>선택 상품 금액</p>
						<span id="span_sum_buy_amt"> ${sum_buy_amt}</span> 원 
					</div>
					<div>
						<img alt="+" src="${pageContext.request.contextPath}/resources/img/plus.png">
					</div>
					<div>
						<p>배송비</p>
						<span id="span_sum_delivery_amt"> ${sum_delivery_amt} </span> 원
					</div>
				</div>
				<div id="total-sum">
					<p>총 주문 금액</p>
					<span id="span_sum_total_buy_allamt"> ${sum_buy_allamt}</span> 원
				</div>
				<div id="basket-order">
					<button id="order_btn" class="btn btn-danger btn-large"> 주문하기 </button>
				</div>
			</div>
		</main>
	<%@ include file="/WEB-INF/views/footer.jsp" %>

	<script type="text/javascript">
	$(document).ready(function() {
		$(".qty_chg_btn").click(function() {

			//alert( $(this).val() + " : " + $(this).prev().val() );

			$.get(
					"${pageContext.request.contextPath}/basket/update_buy_qty"
					, {
						basket_no : $(this).val()
						, buy_qty : $(this).prev().val()
					}
					, function(data, status) {
						if(data >= 1){
							alert("구매 수량을 수정 하였습니다.");
							location.href="${pageContext.request.contextPath}/basket/list";
						} else {
							alert("구매 수량 수정을 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>

	<script type="text/javascript">
	let arr_basket_no = new Array();
	$(document).ready(function() {
		$("#order_btn").click(function() {

			let checks = $("input[type=checkbox]");
			for(let i = 0; i < checks.length; i++){

				if( checks[i].checked == true ) {
					arr_basket_no.push($("#basket_no" + i).val());
				}//if
				
			}//for

			if(arr_basket_no.length <= 0){
				alert("선택된 상품이 없습니다.");
				return;
			}

			location.href="${pageContext.request.contextPath}/order/list?arr_basket_no="+arr_basket_no;

		});//click
	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$(".basket_delete_btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/basket/delete"
					, {
						basket_no : $(this).val()
					}
					, function(data, status) {
						if(data >= 1){
							alert("장바구니를 삭제 하였습니다.");
							location.href="${pageContext.request.contextPath}/basket/list";
						} else {
							alert("장바구니 삭제를 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$(".order_check_box").click(function() {
			//alert($(this).val() + " : " + $(this).attr("name") + " : " + $(this).attr("id"));

			if( $(this).prop("checked") == true ) {
				$("#span_sum_delivery_amt").text(
					parseInt($("#span_sum_delivery_amt").text()) + parseInt($(this).attr("name"))
				);
				$("#span_sum_buy_amt").text(
						parseInt($("#span_sum_buy_amt").text()) + ( $(this).attr("id")  * $(this).val() )
				);
				$("#span_sum_total_buy_allamt").text(
						parseInt($("#span_sum_total_buy_allamt").text())
						+ parseInt( parseInt($(this).attr("name")) + ($(this).attr("id") * $(this).val()))
				);
			} else if( $(this).prop("checked") == false ) {
				$("#span_sum_delivery_amt").text(
						parseInt($("#span_sum_delivery_amt").text()) - parseInt($(this).attr("name"))
				);
				$("#span_sum_buy_amt").text(
						$("#span_sum_buy_amt").text() - ( $(this).attr("id")  * $(this).val() )
				);
				$("#span_sum_total_buy_allamt").text(
						parseInt($("#span_sum_total_buy_allamt").text())
						- parseInt( parseInt($(this).attr("name")) + ($(this).attr("id") * $(this).val()))
				);
			}//if

		});//click
	});//ready
	</script>

	</body>
</html>
