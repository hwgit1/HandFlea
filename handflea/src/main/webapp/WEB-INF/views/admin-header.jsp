<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>     
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/basic_style.css">
		<script type="text/javascript">
		$(document).ready(function() {
			$("#big-menu").mouseover(function() {
				$(".small-menu").stop().slideDown(300);
			});
			$("#big-menu").mouseout(function() {
				$(".small-menu").stop().slideUp(300);
			});
			$(".small-menu").mouseout(function() {
				$(".small-menu").stop().slideUp(300);
			});
		});
		</script>
		<div id="header">
			<div id="top-header">
				<c:choose>
					<c:when test="${login_info != null && login_info.mem_email != null}">
						<a class="top-item" href="${pageContext.request.contextPath}/logout"> 로그아웃 </a>
						<span class="top-item" style="color: #F2EEA7;">${login_info.mem_name}님</span>
					</c:when>
					<c:otherwise>
					<a class="top-item" href="${pageContext.request.contextPath}/login_form">로그인</a>
					<a class="top-item" href="${pageContext.request.contextPath}/join/form">회원가입</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="middle-header">
				<div id="logo-bar">
					<a href="${pageContext.request.contextPath}/main">
						<img id="logo" alt="LOGO" src="${pageContext.request.contextPath}/resources/img/logo.png">
					</a>
				</div>
				<div id="search-bar">
					<div id="search">
						<input type="text" placeholder="검색 키워드">
						<button>검 색</button>
					</div>
				</div>
				<div id="icon-bar">
				</div>
			</div>
			<div id="bottom-header">
				<div id="navMenu">
					<ul id="admin-big-menu">
						<li>
							<a href="${pageContext.request.contextPath}/admin/member">
								<span>회원 관리</span>
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/admin/refund">
								<span>환불 관리</span>
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/admin/ad_list">
								<span>Q&A</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
