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
						<a href="${pageContext.request.contextPath}/mypage/regist">판매자 등록</a>
						<c:if test="${login_info.seller_yn != null && login_info.seller_yn != '0'}">
						<h4>판매자 메뉴</h4>
						<a href="${pageContext.request.contextPath}/product/sellerlist">상품 등록 / 관리</a>
						<a href="${pageContext.request.contextPath}/mypage/sale">판매 내역</a>
						<a href="${pageContext.request.contextPath}/mypage/adjust">정산</a>
						</c:if>
					</div>
				</div>
			</div>
			<div id="main-content">
				<div id="order-box">
					<div class="order-cnts">
						<p>전체 판매 완료 내역</p>
						<h4>${complete_order} 건</h4>
					</div>
					<div class="order-cnts">
						<p>인출 가능 금액</p>
						<h4>${seller_dto.seller_money} 원</h4>
					</div>
					<div class="order-cnts">
						<p>정산 내역</p>
						<h4>${total_adjust} 건</h4>
					</div>
				</div>
				<div id="withdraw-info">
					<div id="withdraw-account">
						<p>${seller_dto.bank_name}</p>
						<p>${seller_dto.seller_account_no}</p>
					</div>
					<div id="withdraw-money">
						<input type="text" id="withdraw" name="withdraw" placeholder="인출 금액 입력">
						<button id="withdraw_btn">인출</button>
					</div>
				</div>
				<hr>
				<div class="record">
					<h4>정산 내역</h4>
					<div class="adjust-box">
					<c:forEach var="list" items="${adjust_list}">
						<c:choose>
							<c:when test="${list.deposit > 0}">
							<div class="adjust-detail">
								<div class="adjust-prdt">
									<p>${list.reg_date}</p>
									<p>${list.prdt_name}</p>
								</div>
								<div class="adjust-money">
									<p class="deposit">입금</p>
									<p class="deposit">${list.deposit}원</p>
									<p class="balance">잔액 ${list.balance}원</p>
								</div>
							</div>
								</c:when>
								<c:otherwise>
							<div class="adjust-detail">
								<div class="adjust-prdt">
									<p>${list.reg_date}</p>
									<p></p>
								</div>
								<div class="adjust-money">
									<p class="withdraw">인출</p>
									<p class="withdraw">${list.withdraw}원</p>
									<p class="balance">잔액 ${list.balance}원</p>
								</div>
							</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
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
		let onlyNum = /^[0-9]+$/;
		$("#withdraw_btn").click(function() {
			let withdraw = $.trim($("#withdraw").val());
			let fundage = ${seller_dto.seller_money};
			
			if( ( withdraw != "" && withdraw.match(onlyNum) == null )){
				alert("숫자만 허용 됩니다.");
				return;
			}
			
			if (fundage < withdraw) {
				alert("인출 가능 금액보다 큽니다.");
				return;
			}
			
			$.post(
					"${pageContext.request.contextPath}/mypage/withdraw",
					{
						fundage : fundage,	
						withdraw : withdraw
					},
					function(data, status) {
						if (data == 1) {
							alert("인출이 완료되었습니다.");
							location.href="${pageContext.request.contextPath}/mypage/adjust";
						} else if (data == 0) {
							alert("인출에 실패했습니다.");
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