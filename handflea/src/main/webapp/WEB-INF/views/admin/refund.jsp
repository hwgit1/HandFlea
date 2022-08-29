<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>HandFlea</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/admin_style.css">
	</head>
	<body>
	<%@ include file="/WEB-INF/views/admin-header.jsp" %>
	
		<main>
			<h3>환불 신청</h3>
			<div class="list-box">
				<table class="refund-list">
					<tr class="list-top">
						<th class="order-no">주문 번호</th>	<th class="order-name">상품명</th>
						<th class="order-qty">수량</th>		<th class="order-amt">금액</th>	
						<th class="buyer">구매자</th>			<th class="seller">판매자</th>
						<th class="refund">환불 처리</th>
					</tr>
					<c:forEach var="dto" items="${refund_list}">
					<tr>
						<td class="order-no">${dto.detail_no}</td>
						<td class="order-name">${dto.prdt_name}</td>
						<td class="order-qty">${dto.buy_qty}</td>
						<td class="order-amt">${dto.pay_amt}</td>
						<td class="buyer">${dto.mem_name}</td>
						<td class="seller">${dto.seller_name}</td>
						<td class="refund">
							<button class="admin_refund" value="${dto.detail_no}">승인</button>
						</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			
			<hr>
			
			<h3>환불 처리 내역</h3>
			<div class="list-box">
				<table class="refund-list">
					<thead>
						<tr class="list-top">
							<th class="order-no">주문 번호</th>	<th class="order-name">상품명</th>
							<th class="order-qty">수량</th>	<th class="order-amt">금액</th>	
							<th class="buyer">구매자</th>	<th class="seller">판매자</th>
							<th class="refund">환불 처리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${refund_complete_list}">
						<tr>
							<td class="order-no">${dto.detail_no}</td>
							<td class="order-name">${dto.prdt_name}</td>
							<td class="order-qty">${dto.buy_qty}</td>
							<td class="order-amt">${dto.pay_amt}</td>
							<td class="buyer">${dto.mem_name}</td>
							<td class="seller">${dto.seller_name}</td>
							<td class="refund">완료</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$(".admin_refund").click(function() {
			$.get(
					"${pageContext.request.contextPath}/admin/orderrefund",
					{
						detail_no : $(this).val()
					}, 
					function(data, status) {
						if (data >= 1) {
							alert("환불 처리가 완료되었습니다.");
							location.href="${pageContext.request.contextPath}/admin/refund";
						}
					}
			);
		});
	});
	</script>
	</body>
</html>