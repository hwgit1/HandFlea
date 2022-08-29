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
                  <a class="top-item" href="${pageContext.request.contextPath}/mypage/"> 마이페이지 </a>
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
                  <form action="${pageContext.request.contextPath}/search/searchlist" method="get">
                     <input type="text" placeholder="검색 키워드" id="searchWord" name="searchWord" value="${search_dto.searchWord}">
                     <button type="submit">검 색</button>
                  </form>
               </div>
            </div>
            <div id="icon-bar">
               <a href="${pageContext.request.contextPath}/QnA/list">
                  <div class="icon">
                     <img class="icon_img" alt="QnA" src="${pageContext.request.contextPath}/resources/img/qna.png">
                     <p class="icon_cnts">QnA</p>
                  </div>
               </a>
               <c:if test="${login_info.mem_no != null}">
               <a href="${pageContext.request.contextPath}/chat/">
                  <div class="icon">
                     <img class="icon_img" alt="chatting" src="${pageContext.request.contextPath}/resources/img/chat.png">
                     <p class="icon_cnts">채팅</p>
                  </div>
               </a>
               <a href="${pageContext.request.contextPath}/basket/list">
                  <div class="icon">
                     <img class="icon_img" alt="cart" src="${pageContext.request.contextPath}/resources/img/cart.png">
                     <p class="icon_cnts">장바구니</p>
                  </div>
               </a>
               
               </c:if>
            </div>
         </div>
         <div id="bottom-header">
            <div id="navMenu">
               <ul id="big-menu">
                  <li>
                     <a href="${pageContext.request.contextPath}/product/bigcatelist?bigcate_no=1">
                        <span>디저트</span>
                     </a>
                     <ul class="small-menu">
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=1">빵</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=2">청</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=3">떡</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=4">잼</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=5">캔디류</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=6">초콜릿</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=7">기타</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                     </ul>
                  </li>
                  <li>
                     <a href="${pageContext.request.contextPath}/product/bigcatelist?bigcate_no=2">
                        <span>니트/뜨개</span>
                     </a>
                     <ul class="small-menu">
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=8">장갑</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=9">목도리</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=10">모자</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=11">코스터</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=12">수세미</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=13">매트</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=14">기타</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                     </ul>
                  </li>
                  <li>
                     <a href="${pageContext.request.contextPath}/product/bigcatelist?bigcate_no=3">
                        <span>디자인/아트</span>
                     </a>
                     <ul class="small-menu">
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=15">프로필</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=16">배너</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=17">스티커</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=18">이모티콘</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=19">카톡테마</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=20">배경화면</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=21">템플릿</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=22">기타</a>
                        </li>
                     </ul>
                  </li>
                  <li>
                     <a href="${pageContext.request.contextPath}/product/bigcatelist?bigcate_no=4">
                        <span>캔들/디퓨저</span>
                     </a>
                     <ul class="small-menu">
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=23">캔들</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=24">디퓨저</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=25">기타</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                     </ul>
                  </li>
                  <li>
                     <a href="${pageContext.request.contextPath}/product/bigcatelist?bigcate_no=5">
                        <span>가죽공예</span>
                     </a>
                     <ul class="small-menu">
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=26">지갑</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=27">소품</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=28">가방</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=29">기타</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                     </ul>
                  </li>
                  <li>
                     <a href="${pageContext.request.contextPath}/product/bigcatelist?bigcate_no=6">
                        <span>액세서리</span>
                     </a>
                     <ul class="small-menu">
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=30">귀걸이</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=31">목걸이</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=32">반지</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=33">팔찌</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=34">발찌</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=35">기타</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                     </ul>
                  </li>         
                  <li>
                     <a href="${pageContext.request.contextPath}/product/bigcatelist?bigcate_no=7">
                        <span>잡화/기타</span>
                     </a>
                     <ul class="small-menu">
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=36">잡화</a>
                        </li>
                        <li class="smallcate">
                           <a href="${pageContext.request.contextPath}/product/smallcatelist?smallcate_no=37">기타</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                        <li class="smallcate">
                           <a class="nonecate">test</a>
                        </li>
                     </ul>
                  </li>      
               </ul>
            </div>
         </div>
      </div>