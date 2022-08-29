<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach var="tmp" items="${chat_list}">
	<div class="chat-list-box${tmp.chat_roomno} chat-list-box">
		<div type="button" class="chat-room" room="${tmp.chat_roomno}" other_no="${tmp.other_no}">
			<div class="chat-people">
				<div class="chat-img">
					<img src="${tmp.mem_photopath}" alt="profile">
				</div>
				<div class="chat-ib">
					<h4>${tmp.other_name}<span class="chat_date">${tmp.chat_date}</span></h4>
					<div class="chat-cnts">
						<div class="chat-cnts-p">
							<p>${tmp.chat_contents}
						</div>
						<c:if test="${tmp.unread > 0}">
						<div class="unread${tmp.chat_roomno} unread">
							<span class="badge">${tmp.unread}</span>
						</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>