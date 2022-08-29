<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HandFlea</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/order_style.css">
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
		<main>
			<h3>결제하기</h3>
			<div id="buyer-info">
				<h5>수령자 정보</h5>
				<table>
					<tr>
						<th>수령인</th>
						<td colspan="2">${buyer_info.mem_name}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="2">${buyer_info.pnum}</td>
					</tr>
					<tr>
						<th>수령 주소</th>
						<td id="buyer-address">(${buyer_info.post_code})${buyer_info.add_1} ${buyer_info.add_2}
						</td>
						<td class="btn-td">
							<button id="addr-change">배송지 변경</button>
						</td>
					</tr>
					<tr class="buyer-addr">
						<th>수령 주소 변경</th>
						<td>
							<div id="addr-input">
								<div>
									<input type="text" id="post_code" name="post_code" placeholder="우편번호" readonly="readonly">
									<button type="button" id="add_btn" name="add_btn" onclick="DaumPostcode()">우편번호 찾기</button>
								</div>
								<div>
									<input type="text" id="add_1" name="add_1" placeholder="도로명 주소" readonly="readonly"">
								</div>
								<div>
									<input type="text" id="add_2" name="add_2" placeholder="상세 주소"">
									<input type="text" id="add_3" name="add_3" placeholder="참고항목" readonly="readonly">
									<label id="add_label" for="add_2"></label>
								</div>
							</div>
						</td>
						<td>
							<div id="addr-input-button">
								<button id="addr-input-btn">변경 저장</button>
							</div>
						</td>
					</tr>
					<tr>
						<th>배송 메모</th>
						<td>
							<select>
								<option>배송시 요청 사항을 선택해주세요.</option>
								<option>부재시 경비실에 맡겨주세요.</option>
								<option>배송 전 문자 주세요.</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			<div id="prdt-info">
				<h5>상품 정보</h5>
				<table id="prdt-info-table">
					<thead>
						<tr class="table-title">
							<th>상품</th>	<th>수량</th>	<th>배송비</th>
							<th>상품 금액</th>	<th>총 주문 금액</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="sum_prdt_qty" value="0" />
						<c:set var="sum_total_price" value="0" />
						<c:forEach var="order" items="${list}">
						<c:set var="sum_prdt_qty" value="${sum_prdt_qty + 1}" />
						<c:set var="sum_total_price" value="${sum_total_price + order.total_price}" />
						<tr class="table-order">
							<td class="table-prdt">
								<div class="order-prdt">
									<div class="order-prdt-img">
										<img alt="product_img" src="${order.thumbnail_path}">
									</div>
									<div class="order-prdt-outline">
										<a href="${pageContext.request.contextPath}/product/detail?prdt_no=${order.prdt_no}">
											<p>${order.prdt_name}</p>
										</a>
										<p><span>옵션</span>${order.option_contents}</p>
									</div>
								</div>
							</td>
							<td class="table-qty">${order.buy_qty}</td>
							<td class="table-dprice">${order.delivery_price}</td>
							<td class="table-prdtprice">${order.price * order.buy_qty}</td>
							<fmt:parseNumber var="total_price" integerOnly="true" type="number" value="${order.total_price}" />
							<td class="table-totalprice">${total_price}</td>
						</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td>
								<p>상품수 : <span id="span_sum_prdt_qty">${sum_prdt_qty}</span></p>
							</td>
							<td colspan="4">
								<fmt:parseNumber var="total_sum" integerOnly="true" type="number" value="${sum_total_price}" />
								최종 결제 금액 : ${total_sum}
							</td>
						</tr>
					</tfoot>
				</table>
			</div>	
			<div id="order-btn-box">
				<button id="order_btn">결제하기</button>
			</div>
		</main>
		
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#addr-change").click(function() {
			var currentRow = $(this).closest('tr');
			var detail = currentRow.next('tr');
			if (detail.is(":visible")) {
				detail.hide();
			} else {
				detail.show();
			}
		});
		
		$("#addr-input-btn").click(function() {
			buyer_addr = '(' + $("#post_code").val() + ')' + $("#add_1").val() + ' ' + $("#add_2").val() + ' ' + $("#add_3").val();
			$("#buyer-address").text("");
			$("#buyer-address").text(buyer_addr);
			var currentRow = $(this).closest('tr');
			currentRow.hide();
		});
	});
	</script>
	<script type="text/javascript">
	let str_basket_no = "";
	$.each( ${arr_basket_no}, function(idx, str) {
		if (idx == 0) {
			str_basket_no = str_basket_no + str;
		} else {
			str_basket_no = str_basket_no + "," + str;
		}
	});
	let buy_now_prdt_no = "${list[0].prdt_no}";
	let buy_now_qty = "${list[0].buy_qty}";
	let buy_now_option_no = "${list[0].option_no}";
	let buyer_addr = $("#buyer-address").text();
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#order_btn").click(function() {
			$.post(
					"${pageContext.request.contextPath}/order/insert",
					{
						delivery_addr : buyer_addr,
						prdt_cnt : ${sum_prdt_qty}, 
						total_pay_amt : ${total_sum},
						str_basket_no : str_basket_no, 
						buy_now_prdt_no : buy_now_prdt_no, 
						buy_now_qty : buy_now_qty,
						buy_now_option_no : buy_now_option_no
					}, 
					function(data, status) {
						if (data >= 1) {
							alert("주문 성공");
							location.href="${pageContext.request.contextPath}/mypage/";
						} else if (data == 0) {
							alert("주문 실패");
						} else {
							alert("서버 에러");
						}
					}
			);
		});
	});
	</script>
	<script type="text/javascript">
	function DaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				let addr = '';
				let extraAddr = '';
				
				if(data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}
				
				if(data.userSelectedType === 'R') {
					if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					
					if(data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== ''?', ' + data.buildingName : data.buildingName);
					}
					
					if(extraAddr !== '') {
						extraAddr = '(' + extraAddr + ')';
					}
					
					document.getElementById("add_3").value = extraAddr;
				} else {
					document.getElementById("add_3").value = '';
				}
				
				document.getElementById("post_code").value = data.zonecode;
				document.getElementById("add_1").value = addr;
				document.getElementById("add_2").focus();
			}
		}).open();
	}
	</script>
</html>