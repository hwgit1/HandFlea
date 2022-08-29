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
						<c:if test="${login_info.mem_name}">
						<a href="${pageContext.request.contextPath}/mypage/regist">판매자 등록</a>
						</c:if>
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
				<h2>주문 상세</h2>
				<div class="record">
					<h4>주문 정보</h4>
					<div class="list-box">
						<table>
							<tr>
								<td class="list-top">주문 번호</td>
								<td>${order_detail.detail_no}</td>
								<td class="list-top">전화 번호</td>
								<td>${order_detail.pnum}</td>
							</tr>
							<tr>
								<td class="list-top">결제일</td>
								<td>${order_detail.order_date}</td>
								<td class="list-top">배송지</td>
								<td>${order_detail.delivery_addr}</td>
							</tr>
							<tr>
								<td class="list-top">수령인</td>
								<td>${order_detail.mem_name}</td>
								<td class="list-top">배송메모</td>
								<td> - </td>
							</tr>
						</table>
					</div>
				</div>
				<div class="record">
					<h4>상품 정보</h4>
					<div class="list-box">
						<table>
							<tr class="list-top">
								<td>상품명</td>
								<td>옵션/수량</td>
								<td>결제금액</td>
								<td>배송 마감일</td>
								<td>운송장 번호</td>
								<td>상품 상태</td>
							</tr>
							<tr>
								<td>${order_detail.prdt_name}</td>
								<td>${order_detail.option_contents}/${order_detail.buy_qty}</td>
								<td>${order_detail.pay_amt}</td>
								<td>${order_detail.deadline}</td>
								<td>
								<c:choose>
									<c:when test="${login_info.mem_no == seller_no && order_detail.delivery_no == null}">
									<div id="delivery-input">
										<div>
											<select id="delivery_c_no" name="delivery_c_no">
												<option value="0">--택배사 선택--</option>
											</select>
											<br>
											<input type="text" id="delivery_no" name="delivery_no" maxlength="10" placeholder="송장 번호를 '-'없이 입력"><br>
											<label for="delivery_no" id="delivery_no_label"></label>
										</div>
										<div>
											<button id="delivery_btn">등록</button>
										</div>
									</div>
									</c:when>
									<c:when test="${login_info.mem_no != seller_no && order_detail.delivery_no == null }">
									미등록
									</c:when>
									<c:otherwise>
									<p>${order_detail.delivery_c_name}</p>
									<p>${order_detail.delivery_no}</p>
									</c:otherwise>
								</c:choose>
								</td>
								<td>${order_detail.code_name}</td>
							</tr>
						</table>
					</div>
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
	<script type="text/javascript">
	$(document).ready(function() {
		$.get(
				"${pageContext.request.contextPath}/mypage/delivery",
				function(data, status) {
					$.each(JSON.parse(data), function(idx, dto) {
						$("#delivery_c_no").append("<option value='" + dto.delivery_c_no + "'>" + dto.delivery_c_name + "</option>");
					});
				}
		);
		
	});
	</script>
	<script type="text/javascript">
	$(document).ready(function() {
		let onlyNum = /^[0-9]+$/;
		
		$("#delivery_btn").click(function() {
			let delivery_no = $.trim($("#delivery_no").val());
			let delivery_c_no = $("#delivery_c_no").val();
			
			if (delivery_c_no == 0) {
				$("#delivery_no_label").text("택배사를 선택해주세요.");
			} else { $("#delivery_no_label").text(""); }
			
			if (delivery_no == "") {
				$("#delivery_no_label").text("송장 번호를 입력해주세요.");
				return;
			} else { $("#delivery_no_label").text(""); }

			if( ( delivery_no != "" && delivery_no.match(onlyNum) == null )){
				$("#delivery_no_label").text("숫자만 허용 됩니다.");
				return;
			} else { $("#delivery_no_label").text(""); }
			
			$.post(
					"${pageContext.request.contextPath}/order/update",
					{
						detail_no : ${order_detail.detail_no},
						delivery_c_no : delivery_c_no,
						delivery_no : delivery_no
					},
					function(data, status) {
						if (data >= 1) {
							alert("송장 번호를 등록했습니다.");
							location.href="${pageContext.request.contextPath}/mypage/detail?detail_no=${order_detail.detail_no}";
						} else if (data == 0) {
							alert("송장 번호 등록에 실패했습니다.");
						} else {
							alert("서버 에러");
						}
					}
			);
		});
	});
	</script>
	</body>
</html>