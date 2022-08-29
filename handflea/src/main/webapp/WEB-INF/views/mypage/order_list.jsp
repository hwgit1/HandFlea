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
						<a href="${pageContext.request.contextPath}/review/mylist">내가 작성한 후기</a>
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
				<h2>주문 내역</h2>
				<div class="list-box">
					<table>
						<tr class="list-top">
							<td class="order-no">주문 번호</td>
							<td class="order-prdt">상품 정보</td>
							<td class="order-date">결제일</td>
							<td class="order-amt">결제 금액</td>
							<td class="order-delivery">운송장 번호</td>
							<td class="order-con">주문 상태</td>
						</tr>
						<c:forEach var="list" items="${order_list}" varStatus="status">
						<tr class="order-list">
							<td class="order-no">
								<input type="hidden" id="detail_no${status.index}" name="detail_no${status.index}" value="${list.detail_no}">
								${list.detail_no}
							</td>	
							<td class="order-prdt">
								<div class="order-prdt-box">
									<div class="order-prdt-img">
										<img alt="product_img" src="${list.thumbnail_path}">
									</div>
									<div class="order-prdt-outline">
										<a href="${pageContext.request.contextPath}/mypage/detail?detail_no=${list.detail_no}">
											<p>${list.prdt_name}</p>
										</a>
										<div class="order-opt-qty">
											<p><span>옵션</span> ${list.option_contents}</p>
											<p><span>수량</span> ${list.buy_qty}</p>
										</div>
									</div>
								</div>
							</td>
							<td class="order-date">${list.order_date}</td>
							<td class="order-amt">${list.pay_amt} 원</td>
							<td class="order-delivery">
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
							<td class="order-con">
							<c:choose>
								<c:when test="${list.prdt_con == 0}">
								결제 완료
								</c:when>
								<c:when test="${list.prdt_con == 1}">
								${list.code_name}<br>
								<button>배송 조회</button>
								<button class="receipt_btn" value="${list.detail_no}">수령 완료</button>
								</c:when>
								<c:when test="${list.prdt_con == 2}">
								${list.code_name}<br>
								<button class="review_btn" value="${list.detail_no}">후기 작성</button>
								</c:when>
								<c:when test="${list.prdt_con == 3}">
								결제 완료<br>
								<button class="refund_btn" value="${list.detail_no}">환불 요청</button>
								</c:when>
								<c:otherwise>
								${list.code_name}
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
						</c:forEach>
						<c:if test="${order_cnt == 0}">
						<tr>
							<td colspan="6">주문 내역이 없습니다.</td>
						</tr>
						</c:if>
					</table>
				</div>
			</div>
		</main>	
	
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$(".receipt_btn").click(function() {
			var receipt = confirm("물품을 수령하셨습니까?");
			if (receipt) {
				$.get(
						"${pageContext.request.contextPath}/order/receive",
						{
							detail_no : $(this).val()
						},
						function(data, status) {
							if (data >= 1) {
								location.href="${pageContext.request.contextPath}/mypage/order";
							} else {
								alert("에러");
							}
						}
				);
			}
		});
		
		$(".refund_btn").click(function() {
			var refund = confirm("환불하시겠습니까?");
			if (refund) {
				$.get(
						"${pageContext.request.contextPath}/order/refund",
						{
							detail_no : $(this).val()
						}, 
						function(data, status) {
							if (data >= 1) {
								location.href="${pageContext.request.contextPath}/mypage/order";
							} else {
								alert("에러");
							}
						}
				);
			}
		})
	});
	$(document).ready(function() {
		$(".review_btn").click(function() {
			var detail_no = $(this).val();
			var url = "${pageContext.request.contextPath}/review/write_form?detail_no=" + detail_no;
			var review = confirm("후기를 작성하시겠습니까?");
			if (review) {
				window.open(url, "후기 작성", "width = 500, height = 420, location = no, scrollbars = no");
				//location.href="${pageContext.request.contextPath}/review/write_form?detail_no=" + detail_no;
			}
		});
	});
	</script>
	<script>
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
	</body>
</html>