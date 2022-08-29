<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Handflea</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">	-->
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/chat_style.css">
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<main>
			<div id="chat">
				<div id="chat-list-box">
					<div id="list-title">
						<h3>채팅 내역</h3>
					</div>
					<div id="chat-list">
					</div>
				</div>
				<div id="chat-detail">
					<div id="chat-history" name="contentsList">
					</div>
					<div id="send_form">
					</div>
				</div>
			</div>			
		</main>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
	const FirstChatList = function() {
		$.ajax({
			url : "${pageContext.request.contextPath}/chat/list", 
			method : "get", 
			data : {
			}, 
			success : function(data) {
				$("#chat-list").html(data);
				
				$(".chat-room").on('click', function() {
					let chat_roomno = $(this).attr('room');
					let other_no = $(this).attr("other_no");
					
					$(".chat-list-box").not(".chat-list-box.chat-list.box" + chat_roomno).removeClass("active-chat");
					$(".chat-list-box" + chat_roomno).addClass("active-chat");
					
					let send_msg = "";
					send_msg += "<div id='input-chat'>";
					send_msg += "	<div id='input-text'>";
					send_msg += "		<input type='text' class='form-control' id='write_chat' placeholder='메세지 입력' />";
					send_msg += "	</div>";
					send_msg += "	<div id='input-btn'>";
					send_msg += "		<button id='send_btn' type='button'>전송</button>";
					send_msg += "	</div>";
					send_msg += "</div>";
					
					$("#send_form").html(send_msg);
					$("#send_btn").on('click', function() {
						SendChat(chat_roomno, other_no);
					});
					ChatContentsList(chat_roomno, other_no);
				});
			}
		})
	};
	
	const ChatList = function() {
		$.ajax({
			url : "${pageContext.request.contextPath}/chat/list", 
			method : "get", 
			data : {
			}, 
			success : function(data) {
				$("#chat-list").html(data);
				
				$(".chat-room").on('click', function() {
					let chat_roomno = $(this).attr('room');
					let other_no = $(this).attr("other_no");
					
					$(".chat-list-box").not(".chat-list-box.chat-list.box" + chat_roomno).removeClass("active-chat");
					$(".chat-list-box" + chat_roomno).addClass("active-chat");
					
					let send_msg = "";
					send_msg += "<div id='input-chat'>";
					send_msg += "	<div id='input-text'>";
					send_msg += "		<input type='text' class='form-control' id='write_chat' placeholder='메세지 입력' />";
					send_msg += "	</div>";
					send_msg += "	<div id='input-btn'>";
					send_msg += "		<button id='send_btn' type='button'>전송</button>";
					send_msg += "	</div>";
					send_msg += "</div>";
					
					$('#send_form').html(send_msg);
					$("#send_btn").on('click', function() {
						SendChat(chat_roomno, other_no);
					});
					ChatContentsList(chat_roomno, other_no);
				});
				$('.chat-list-box:first').addClass('active_chat');
			}
		})
	};
	
	const ChatContentsList = function(chat_roomno, other_no) {
		$.ajax({
			url : "${pageContext.request.contextPath}/chat/detail",
			method : "GET",
			data : {
				chat_roomno : chat_roomno,
				other_no : other_no
			},
			success : function(data) {
				$("#chat-history").html(data);
				$("#chat-history-box").scrollTop($("#chat-history-box")[0].scrollHeight);
			},
			error : function() {
				alert("서버 에러");
			}
		})
		
		$(".unread" + chat_roomno).empty();
	};
	
	const SendChat = function(chat_roomno, other_no) {
		let content = $("#write_chat").val();
		content = content.trim();
		
		if (content == "") {
			alert("메세지를 입력하세요.");
			return;
		} 
		
		$.post(
				"${pageContext.request.contextPath}/chat/send",
				{
					chat_roomno : chat_roomno,
					other_no : other_no,
					chat_contents : content
				},
				function(data, status) {
					if (data >= 1) {
						$("#write_chat").val("");
						ChatContentsList(chat_roomno, other_no);
						ChatList();
					} else if (data == 0) {
						alert("메세지 전송 실패");
					} else {
						alert("서버 에러");
					}
				}
		);
		
		/* $.ajax({
			url : "${pageContext.request.contextPath}/chat/send",
			method : "POST", 
			data : {
				chat_roomno : chat_roomno,
				other_no : other_no,
				chat_contents : content
			}, 
			success : function(data) {
				alert("메세지 전송 성공");
				$("#write_chat").val("");
				
				ChatContentsList(chat_roomno, other_no);
				ChatList();
			}, 
			error : function() {
				alert("서버 에러");
			}
		}) */
	};
	
	$(document).ready(function() {
		FirstChatList();
		if (${chat_send.other_no != null}) {
			let send_msg = "";
			send_msg += "<div id='input-chat'>";
			send_msg += "	<div id='input-text'>";
			send_msg += "		<input type='text' class='form-control' id='write_chat' placeholder='메세지 입력' />";
			send_msg += "	</div>";
			send_msg += "	<div id='input-btn'>";
			send_msg += "		<button id='send_btn' type='button'>전송</button>";
			send_msg += "	</div>";
			send_msg += "</div>";
			
			$('#send_form').html(send_msg);
			$("#send_btn").on('click', function() {
				SendChat("${chat_send.chat_roomno}", "${chat_send.other_no}");
			});
			ChatContentsList("${chat_send.chat_roomno}", "${chat_send.other_no}");
		}
	});
	
	</script>
	</body>
</html>