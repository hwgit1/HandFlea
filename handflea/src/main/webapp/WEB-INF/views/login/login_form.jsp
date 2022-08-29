<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 로그인 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/member_style.css">
	</head>
	<body>
		<main>
			<div>
				<a href="${pageContext.request.contextPath}/main">
					<img alt="logo" src="${pageContext.request.contextPath}/resources/img/logo.png">
				</a>
				<h4>로그인</h4>
			</div>
			<div class="mem-input">
				<input type="text" id="mem_email" name="mem_email" maxlength="20" placeholder="이메일" >
			</div>
			<div class="mem-input">
				<input type="password" id="mem_pwd" name="mem_pwd" maxlength="20" placeholder="비밀번호">
			</div>
			<div class="mem-input">
				<button id="login_btn">로그인</button>
			</div>
			<div class="mem-input">
				<a href="#" id="mem_search">아이디/비밀번호 찾기</a>
			</div>
			
		</main>
		
	<script type="text/javascript">
	$(document).ready(function() {
		$("#login_btn").click(function() {

			$.post(
					"${pageContext.request.contextPath}/login"
					, {
						mem_email : $("#mem_email").val()
						, mem_pwd : $("#mem_pwd").val()
					}
					, function(data, status) {
						if(data == 0){
							alert("아이디와 패스워드가 올바르지 않습니다.");
						} else if(data == 1){
							location.href = "${pageContext.request.contextPath}/main";
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post

		});//click
	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#mem_pwd").keyup(function() {

			if(event.keyCode == 13) {
				$("#login_btn").click();
			}

		});//click
	});//ready
	</script>

	</body>
</html>









