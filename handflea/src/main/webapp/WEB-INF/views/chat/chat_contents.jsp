<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="contents-title">
	<div>
		<img alt="profile" src="${other_photopath}">
	</div>
	<h5>${other_name}</h5>
</div>
<div id="chat-history-box">
<c:forEach var="tmp" items="${chat_detail}">
	<c:choose>
		<c:when test="${login_info.mem_no ne tmp.send_mem_no}">
		<div class="received_chat">
			<div class="received_withd_chat">
				<p>${tmp.chat_contents}</p>
				<span class="time_date">${tmp.chat_date}</span>
			</div>
		</div>
		</c:when>
		<c:otherwise>
		<div class="outgoing_chat">
			<div class="sent_chat">
				<p>${tmp.chat_contents}</p>
				<span class="time_date">${tmp.chat_date}</span>
			</div>
		</div>
		</c:otherwise>
	</c:choose>
</c:forEach>
</div>