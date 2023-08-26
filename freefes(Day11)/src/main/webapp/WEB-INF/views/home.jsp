<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${cpath }/resources/css/home.css" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

<head>
<meta charset="UTF-8">
<title>freefes</title>
</head>
<body>
<script src="https://kit.fontawesome.com/3024c3bdf3.js" crossorigin="anonymous"></script>

<header class="main_header">
	<div class="main_header_left">
		<div id="homepage_logo">
			<a href="${cpath }"><input type="image" 
				src="${cpath }/resources/image/로고.png" height="100px"></a>
		</div>
	</div>
	<div class="main_header_right">
	<!-- 검색 경로를 action으로 설정하고 button으로 모양잡음 -->
		<form method="POST" action="${cpath }/">
			<div class="search_bar">
				<input type="search" name="search" id="search" maxlength="15">
				<button type="submit" style="background: none; border: none;">
					<i class="fa-solid fa-magnifying-glass" style="color: #edeff3;"></i>
				</button>
			</div>
		</form>
		<!-- 로그아웃 상태 -->
		<ul class="login_btn">
		<c:if test="${empty login }">
			<li class="login-icon">
				<a href="${cpath }/member/login">
					<button>
						<i class="fa-solid fa-user login-icon-normal" style="color: #edeff3;"></i>
						<i class="fa-solid fa-user fa-flip login-icon-hover" style="color: #edeff3; display: none;"></i>
					</button>
				</a>
			</li>
		</c:if>
		<!-- 로그인 상태 -->
		<c:if test="${not empty login }">        	
			<li class="login-icon">
				<a href="${cpath }/member/logout">
					<button>
						<i class="fa-solid fa-arrow-right-from-bracket" style="color: #edeff3;"></i>
						<i class="fa-solid fa-arrow-right-from-bracket fa-fade" style="color: #edeff3; display: none"></i>
					</button>
				</a>
			</li>
			<li><a href="${cpath }/member/mypage/mypage">마이페이지</a></li>
		</c:if>
		<!-- 드랍다운 버튼 -->
		</ul>
			<div class="hamburger">
				<button>
					<i class="fa-solid fa-bars active-icon" style="color: #edeff3;" ></i>
					<i class="fa-solid fa-arrow-down inactive-icon" style="color: #edeff3; display: none;"></i>
				</button>
			    <ul class="dropdown-menu">
					<li class="festival"><a href="${cpath}/fes_board/fes_board_list">Festival</a></li>
					<li><a href="${cpath}/admin_board/admin_board">공지사항</a></li>
					<c:if test="${not empty login}">
						<li><h3>나중에 ${nickname }님 환영합니다 형식으로 ㄱ</h3></li>
						<li><a href="${cpath}/member/logout">로그아웃</a></li>
						<li><a href="${cpath}/member/mypage/mypage">마이페이지</a></li>
					</c:if>
					<c:if test="${empty login}">
						<li><a href="${cpath}/member/login">로그인</a></li>
					</c:if>
				</ul>
			</div>
	</div>
</header>
<main>
	<div class="banner">
		<div class="wrap">
			<div class="prev">&lt;</div>
			<div class="next">&gt;</div>
			<c:forEach var="dto" items="${comming_list }" varStatus="status">
				<div class="slide ${status.index == 0 ? 'active' : 'hidden' }" >
					<a href="${cpath }/board/board_view/${dto.idx}">
						<img class="image" alt="${dto.file_name }" src="${cpath }/resources/img/${dto.file_path }">
					</a>
					
					<!-- 개최중인지 상태 -->
					<div class="hold ${dto.is_hold ? 'holding' : 'not_yet' }">
						${dto.is_hold ? "개최중" : dto.remain}
					</div>
				</div>
			</c:forEach>
			<div class="banner_page_wrap">
			<c:forEach var="dto" items="${comming_list }" varStatus="status">
				<div class="banner_page ${status.index == 0 ? 'on' : '' }" id="${status.index }">●</div>
			</c:forEach>
			</div>
		</div>
	</div>
	<div class="main_body2">지도</div>
	<div class="main_body3">요약</div>
	<div class="main_body4">축제순위배너</div>
</main>

<!-- 스크롤 유도 -->
<a href="#">
   <span></span>
   <div class="scroll-text">Scroll</div>
</a>

<footer class="bottom">
	<div id="team_logo"></div>
</footer>



<!-- 덩엉js -->
<script src="${cpath }/resources/js/home.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/color-thief/2.3.0/color-thief.umd.js"></script>

<script>
	setInterval(move_slide, 6000)
	next.onclick = next_click
	prev.onclick = prev_click
	banner_color_change(slide[0])
</script>



</body>
</html>