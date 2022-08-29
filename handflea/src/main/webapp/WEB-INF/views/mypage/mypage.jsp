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
						<p>진행중인 주문</p>
						<h4>${memorder_cnt} 건</h4>
					</div>
					<div class="order-cnts">
						<p>환불 가능 주문</p>
						<h4>${payback_cnt} 건</h4>
					</div>
					<div class="order-cnts">
						<p>장바구니</p>
						<h4>${basket_cnt} 건</h4>
					</div>
					<c:if test="${login_info.seller_yn == 1}">
					<div class="order-cnts">
						<p>판매중인 주문</p>
						<h4>${seller_order_cnt.cnt} 건</h4>
					</div>
					<div class="order-cnts">
						<p>인출 가능 금액</p>
						<h4>${seller_order_cnt.seller_money} 원</h4>
					</div>
					</c:if>
				</div>
				<div class="record">
					<h4>최근 주문 내역</h4>
					<div class="list-box">
						<table>
							<tr class="list-top">
								<td class="rorder-no">주문 번호</td>
								<td class="rorder-prdt">상품명</td>
								<td class="rorder-amt">주문 금액</td>
								<td class="rorder-con">상품 상태</td>
								<td class="rorder-date">결제일</td>
							</tr>
							<c:forEach var="olist" items="${recent_order_list}">
							<tr>
								<td class="rorder-no">${olist.detail_no}</td>	
								<td class="rorder-prdt">
									<a href="${pageContext.request.contextPath}/mypage/detail?detail_no=${olist.detail_no}">
										<p>${olist.prdt_name}</p>
									</a>
								</td>
								<td class="rorder-amt">${olist.pay_amt}</td>
								<td class="rorder-con">${olist.code_name}</td>
								<td class="rorder-date">${olist.order_date}</td>
							</tr>
							</c:forEach>
							<c:if test="${order_cnt == 0}">
							<tr>
								<td colspan="5">주문 내역이 없습니다.</td>
							</tr>
							</c:if>
						</table>
					</div>
				</div>
				<c:choose>
					<c:when test="${login_info.seller_yn == 0}">
					<div class="record">
						<h4>나의 문의 내역</h4>
						<div class="list-box">
							<table>
								<tr class="list-top">
									<td>번호</td>	<td>문의제목</td>
									<td>문의날짜</td>	<td>상태</td>
								</tr>
								<c:forEach var="qlist" items="${qna_list}">
								<tr>
									<td>${qlist.qna_no}</td>
									<td>${qlist.title}</td>
									<td>${qlist.write_date}</td>
									<td>
									<c:choose>
										<c:when test="${qlist.answer_yn == 1}">
										답변 완료
										</c:when>
										<c:otherwise>
										답변 대기
										</c:otherwise>
									</c:choose>
									</td>
								</tr>
								</c:forEach>
								<c:if test="${qna_cnt == 0}">
								<tr>
									<td colspan="4">문의 내역이 없습니다.</td>
								</tr>
								</c:if>
							</table>
						</div>
					</div>
					</c:when>
					<c:otherwise>
					<div class="record">
						<h4>최근 판매 내역</h4>
						<div class="list-box">
							<table>
								<tr class="list-top">
									<td class="sell-no">주문 번호</td>
									<td class="sell-prdt">상품명</td>
									<td class="sell-date">결제일</td>
									<td class="sell-deadline">배송 마감일</td>
									<td class="sell-con">상품 상태</td>
								</tr>
								<c:forEach var="slist" items="${recent_sell_list}">
								<tr>
									<td class="sell-no">${slist.detail_no}</td>
									<td class="sell-prdt">
										<a href="${pageContext.request.contextPath}/mypage/detail?detail_no=${slist.detail_no}">
											${slist.prdt_name}
										</a>
									</td>
									<td class="sell-date">${slist.order_date}</td>
									<td class="sell-deadline">${slist.deadline}</td>
									<td class="sell-con">${slist.code_name}</td>
								</tr>
								</c:forEach>
								<c:if test="${sell_cnt == 0}">
								<tr>
									<td colspan="5">판매 내역이 없습니다.</td>
								</tr>
								</c:if>
							</table>
						</div>
					</div>
					</c:otherwise>
				</c:choose>
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
	</body>
</html>