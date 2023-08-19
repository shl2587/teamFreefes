<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>freefes</title>
</head>
<body>

<header class="main_header">
	<div class="main_header_left">
		<div id="homepage_logo">로고</div>
	</div>
	<div class="main_header_right">
		<div class="search_bar">검색창</div>
		<!-- 훗날 c:if로 로그인 로그아웃 -->
		<div class="login_btn"><a href="{cpath}/member/login">로그인</a></div>
		<div class="login_btn"><a href="{cpath}/member/logout">로그아웃</a></div>
		<div class="hamburger">메뉴버튼
			<div class="dropdown">
				<div><a href="${cpath }/board/board_list">Festival</a></div>
				<div><a href="${cpath }/">훗날 로그인시  c:if해서 마이페이지 </a></div>
				<div><a href="${cpath }/"></a></div>
				<div><a href="${cpath }/admin_board/admin_board">공지사항</a></div>
			</div>
		</div>
	</div>
</header>
<hr>

<main>
	<div class="main_body1">배너</div>
	<div class="main_body2">지도</div>
	<div class="main_body3">요약</div>
	<div class="main_body4">축제순위배너</div>
</main>

<footer class="bottom">
	<div id="team_logo"></div>
</footer>
</body>
</html>