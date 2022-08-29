<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 회원 가입 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/member_style.css">
		<style type="text/css">
.mem-input h6 {
	text-align: left;
	padding-top: 10px;
}
.mem-input label {
	text-align: left;
	font-size: small;
	left: auto;
}
.check-input {
	display: flex;
	flex-direction: row;
	align-items: flex-end;
}
.check-input input{
	width: 70%;
	margin-right: 3px;
}
.check-input button {
	width: 30%;
	height: 38px;
	border-radius: 4px;
}
#add-box {
	display: flex;
	flex-direction: row;
}
#add-box > #add_2 {
	width: 70%;
	margin-right: 3px;
}
#add-box > #add_3 {
	width: 30%;
}
#mem_pwd_label, #rempwd_label, #pnum_label, #mem_name_label, #add_2_label, #terms_label {
	color : red;
}
#terms-box {
	width: 30%;
	margin-top: 20px;
	text-align: left;
}
#terms-box > hr {
	border: 0;
	height: 1px;
	background-color: #808080;
	margin: 5px 0;
}
#terms-box > label {
	font-size: small;
}
#join_btn {
	width: 100%;
	border-radius: 5px;
	margin-top: 20px;
	margin-bottom: 50px;
	padding: 5px;
}
input[type="checkbox"] {
	margin-right: 5px;
}
		</style>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	</head>
	<body>
		<main>
			<div>
				<a href="${pageContext.request.contextPath}/main">
					<img alt="logo" src="${pageContext.request.contextPath}/resources/img/logo.png">
				</a>
				<h4>회원가입</h4>
			</div>
			<div class="mem-input">
				<h6>이름</h6>
				<input type="text" id="mem_name" name="mem_name" maxlength="20" placeholder="이름을 입력해주세요">
				<label for="mem_name" id="mem_name_label"></label>
			</div>
			<div class="mem-input">
				<h6>이메일</h6>
				<div class="check-input">
					<input type="text" id="mem_email" name="mem_email" maxlength="40" placeholder="이메일을 입력해주세요">
					<button id="id_btn">중복 체크</button>
				</div>
				<label for="mem_email" id="mem_email_label"></label>
			</div>
			<div class="mem-input">
				<h6>비밀번호</h6>
				<input type="password" id="mem_pwd" name="mem_pwd" maxlength="20" placeholder="비밀번호를 입력해주세요">
				<input type="password" id="rempwd" name="rempwd" maxlength="20" placeholder="비밀번호를 다시 입력해주세요">
				<label for="rempwd" id="rempwd_label"></label>
			</div>
			<div class="mem-input">
				<h6>기본 배송지</h6>
				<div class="check-input">
					<input type="text" id="post_code" name="post_code" readonly="readonly" placeholder="우편번호">
					<button type="button" id="addr_btn" onclick="DaumPostcode()">우편번호 검색</button>
				</div>
				<input type="text" id="add_1" name="add_1" readonly="readonly" placeholder="주소">
				<div id="add-box">
					<input type="text" id="add_2" name="add_2" placeholder="상세주소">
					<input type="text" id="add_3" name="add_3" placeholder="참고항목" readonly="readonly">
				</div>
				<label for="add_2" id="add_2_label"></label>
			</div>
			<div class="mem-input">
				<h6>전화번호</h6>
				<input type="text" id="pnum" name="pnum" maxlength="12" placeholder="휴대전화 번호를 '-'없이 입력해주세요">
				<label for="pnum" id="pnum_label"></label>
			</div>
			<div id="terms-box">
				<input type="checkbox" id="selectAll" name="selectAll" onclick="selectAll(this)"> 필수 내용 모두 동의합니다.
				<hr>
				<input type="checkbox" name="terms" onclick="checkSelectAll()"> 만 14세 이상입니다. (필수)<br>
				<input type="checkbox" name="terms" onclick="checkSelectAll()"> 이용약관 필수 동의 (필수)<br>
				<input type="checkbox" name="terms" onclick="checkSelectAll()"> 개인정보 수집 및 이용 동의 (필수)
				<label id="terms_label"></label>
			</div>
			<div class="mem-input">
				<button id="join_btn">회원가입</button>
			</div>
		</main>
		
	<script type="text/javascript">
	let checkedID = "";
	let onlyNum = /^[0-9]+$/;
	let engLowerAndNum = /^[a-z0-9]+$/;
	let onlyPwd = /^[a-z0-9~!@#$%^&*().]+$/;
	let onlyEmail = /^[a-zA-Z0-9.@]+$/;

	$(document).ready(function() {
		$("#join_btn").click(function() {
			if( $("#mem_name").val() == "" ){//null.
				$("#mem_name_label").text("이름을 입력해 주세요.");
				return;
			} else { $("#mem_name_label").text(""); }
			
			if( checkedID == "" || checkedID != $("#mem_email").val() ){
				$("#mem_email_label").text("아이디 중복 체크를 해 주세요.");
				$("#mem_email_label").css("color", "red");
				return;
			} else { $("#mem_email_label").text(""); }

			if( $("#mem_pwd").val().match(onlyPwd) == null ){//허용되지 않은 글자는 null.
				$("#rempwd_label").text("영문 소문자, 숫자, 특수 문자만 허용 됩니다.");
				return;
			} else { $("#rempwd_label").text(""); }

			if( $("#mem_pwd").val() != $("#rempwd").val() ){
				$("#rempwd_label").text("비밀번호와 비밀번호 확인이 서로 다릅니다.");
				return;
			} else { $("#rempwd_label").text(""); }
			
			if( $("#add_2").val() == "") {
				$("#add_2_label").text("상세주소를 입력해주세요.");
				return;
			} else { $("#add_2_label").text(""); }

			let pnum = $.trim($("#pnum").val());
			
			if (pnum == "") {
				$("#pnum_label").text("전화번호를 입력해주세요.");
				return;
			} else { $("#pnum_label").text(""); }

			if( ( pnum != "" && pnum.match(onlyNum) == null )){
				$("#pnum_label").text("숫자만 허용 됩니다.");
				return;
			} else { $("#pnum_label").text(""); }

			if (!$("#selectAll").is(':checked')) {
				$("#terms_label").text("필수 사항을 모두 체크해야합니다.");
				return;
			} else { $("#terms_label").text(""); }
			
			let tmptel1 = pnum.substring(0, 3);
			let tmptel2 = pnum.substring(3, 7);
			let tmptel3 = pnum.substring(7, 11);

			$.post(
					"${pageContext.request.contextPath}/join/"
					, {
						mem_name : $("#mem_name").val()
						, mem_email : $("#mem_email").val()
						, mem_pwd : $("#mem_pwd").val()
						, tel1 : tmptel1
						, tel2 : tmptel2
						, tel3 : tmptel3
						, post_code : $("#post_code").val()
						, add_1 : $("#add_1").val()
						, add_2 : $("#add_2").val() + ' ' + $("#add_3").val()
					}
					, function(data, status) {
						if(data == 1){
							alert("회원 가입에 성공 하셨습니다. 로그인 해주세요.");
							location.href="${pageContext.request.contextPath}/login_form";
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post

		});//click
	});//ready

	$(document).ready(function() {
		$("#id_btn").click(function() {

			if( $.trim( $("#mem_email").val() ) == "" ){
				return;
			}
			if( $("#mem_email").val().match(onlyEmail) == null ){//허용되지 않은 글자는 null.
				$("#mem_email_label").text("영문 대소문자와 숫자 . @만 허용 됩니다.");
				return;
			} else { $("#mem_email_label").text(""); }

			$.get(
					"${pageContext.request.contextPath}/join/id_chk"
					, { mem_email : $("#mem_email").val() }
					, function(data, status) {
						if(data == 0){
							$("#mem_email_label").text("사용 가능한 아이디 입니다.");
							$("#mem_email_label").css("color", "blue");
							checkedID = $("#mem_email").val();
						} else if(data >= 1){
							$("#mem_email_label").text("이미 사용 중인 아이디 입니다.");
							$("#mem_email_label").css("color", "red");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	
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
	
	function checkSelectAll()  {
		  const checkboxes 
		    = document.querySelectorAll('input[name="terms"]');
		  // 선택된 체크박스
		  const checked 
		    = document.querySelectorAll('input[name="terms"]:checked');
		  // select all 체크박스
		  const selectAll 
		    = document.querySelector('input[name="selectAll"]');
		  
		  if(checkboxes.length === checked.length)  {
		    selectAll.checked = true;
		  }else {
		    selectAll.checked = false;
		  }

		}

		function selectAll(selectAll)  {
		  const checkboxes 
		     = document.getElementsByName('terms');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  })
		}
	</script>
	</body>
</html>













