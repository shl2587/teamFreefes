<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script>
	const cpath = "${cpath}"
</script>
<header class="main_header">
	<div class="main_header_left">
		<div id="homepage_logo">
			<a href="${cpath }"><input type="image" 
				src="${cpath }/resources/image/로고.png" height="100px"></a>
		</div>
	</div>
	<div class="main_header_right">
	<!-- 검색 경로를 action으로 설정하고 button으로 모양잡음 -->
		<div class="search_bar">
			<form id="total_search_form" action="${cpath }/fes_board/fes_board_list">
				<input type="hidden" name="search_method" value="complex">
				<input type="search" name="fes_keyword" class="total_search" maxlength="15">
				<button class="total_search_btn" type="submit" style="background: none; border: none;">
					<i class="fa-solid fa-magnifying-glass" style="color: #edeff3;"></i>
				</button>
			</form>
		</div>
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
			<c:if test="${login.role == 1 || login.role == 2 }">
				<li><a href="${cpath }/member/mypage/mypage/${login.idx}">
					<button><i class="fa-solid fa-address-book" style="color: #f2f5f7;"></i></button>
				</a></li>
			</c:if>
			<c:if test="${login.role == 0 }">
				<li><a href="${cpath }/admin_board/management_page">
					<button><i class="fa-solid fa-address-book" style="color: #f2f5f7;"></i></button>
				</a></li>
			</c:if>
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
					<c:if test="${empty login}">
						<li><a href="${cpath}/member/login">로그인</a></li>
					</c:if>
					<c:if test="${not empty login}">
						<c:if test="${login.role == 1 || login.role == 2 }">
							<li>
							  <h3 style="color: white; font-size:26px;">
							    <span style="color: #FFD6A5;">'${login.nickname}'</span>님 축제를 시작해봐요!
							  </h3>
							</li>
							<li><a href="${cpath}/member/mypage/mypage/${login.idx}">마이페이지</a></li>
						</c:if>
						<c:if test="${login.role == 0 }">
							<li>
							  <h3 style="color: white; font-size:26px;">
							    <span style="color: #FFD6A5;">'${login.nickname}'</span>관리자님 어서오세요.
							  </h3>
							</li>
							<li><a href="${cpath }/admin_board/management_page/">관리자 페이지</a></li>
						</c:if>
						<li><a href="${cpath}/member/logout">로그아웃</a></li>
					</c:if>
					<li><a href="${cpath}/admin_board/admin_board">고객센터</a></li>
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

         <c:set var="filePath" value="${dto.file_path }" />
         <c:set var ="length" value = "${fn:length(filePath)}"/>
         <c:set var="lastDotIndex" value="${fn:indexOf(filePath, '.')}"/>
         <c:set var="fileExtension" value="${fn:substring(filePath, lastDotIndex + 1, length)}" />
            <div class="slide ${status.index == 0 ? 'active' : 'hidden' }" >
               <a href="${cpath }/fes_board/mainboard/${dto.idx}">
                  <img class="image" src="${cpath }/upload/${dto.title }/poster.${fileExtension}">
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
	<!-- 병학 -->
	<div class="map">
		<div>
			<a href="${cpath }/fes_board/fes_board_list?region=강원">
            	<img src="${cpath}/resources/img/강원도.png" style="z-index: 1;">
        	</a>
        	<a href="${cpath }/fes_board/fes_board_list?region=경기도">
				<img src="${cpath }/resources/img/경기도.png" style="z-index: 1;">
			</a>
			<a href="${cpath }/fes_board/fes_board_list?region=서울">
				<img src="${cpath }/resources/img/서울.png" style="z-index: 2; width: 3.8%; height: auto;">
			</a>
			<a href="${cpath }/fes_board/fes_board_list?region=충청북도">
				<img src="${cpath }/resources/img/충청북도.png" style="z-index: 2;">
			</a>
			<a href="${cpath }/fes_board/fes_board_list?region=충청남도">
				<img src="${cpath }/resources/img/충청남도.png" style="z-index: 1; width: 13%; height: auto;">
			</a>
			<a href="${cpath }/fes_board/fes_board_list?region=대전">
				<img src="${cpath }/resources/img/대전.png" style="z-index: 3; width: 3%; height: auto;">
			</a>
			<a href="${cpath }/fes_board/fes_board_list?region=경상북도">
				<img src="${cpath }/resources/img/경상북도.png" style="z-index: 1; width: 13%; height: auto;">
			</a>
			<a href="${cpath }/fes_board/fes_board_list?region=대구">
				<img src="${cpath }/resources/img/대구.png" style="z-index: 2; width: 5.4%; height: auto;">
			</a>
			<a href="${cpath }/fes_board/fes_board_list?region=경상남도">
				<img src="${cpath }/resources/img/경상남도.png" style="z-index: 1; width: 15%; height: auto;">
			</a>
			<a href="${cpath }/fes_board/fes_board_list?region=전라남도">
				<img src="${cpath }/resources/img/전라북도.png" style="width: 15%; height: auto;">
			</a>
			<a href="${cpath }/fes_board/fes_board_list?region=울산">
				<img src="${cpath }/resources/img/울산.png" style="z-index: 2;width: 7%; height: auto;">
			</a>
			<a href="${cpath }/fes_board/fes_board_list?region=부산">
				<img src="${cpath }/resources/img/부산.png" style="z-index: 2;width: 9%; height: auto;">
			</a>
			<a href="${cpath }/fes_board/fes_board_list?region=전라남도">
				<img src="${cpath }/resources/img/전라남도.png" style="z-index: 1;width: 13%; height: auto;">
			</a>
			<a href="${cpath }/fes_board/fes_board_list?region=광주">
				<img src="${cpath }/resources/img/광주.png" style="z-index: 4;width: 4%; height: auto;">
			</a>
			<a href="${cpath }/fes_board/fes_board_list?region=제주도">
				<img src="${cpath }/resources/img/제주도.png" style="z-index: 3;width: 11%; height: auto;">
			</a>
		</div>
	</div>
	<div class="boards_summary">
		<div class="boards_summary_in">
			<div class="main_body3">
				<div class="notice_summary">공지사항</div>
				<div class="recent_notice_list">
					<div>타이틀</div>
					<div>작성일</div>
				</div>
			</div>
			<div style="width: 250px"></div>
			<div class="main_body4">
				<div class="main_body4_menu">
					<div class="count_rank" onclick="ranking('count')">조회순</div>
					<div class="count_rank" onclick="ranking('favorites')">추천순</div>
					<div class="count_rank" onclick="ranking('reply')">댓글순</div>
				</div>
				<div class="festival_ranking">
					<div>
						<div>1위</div>
						<div class="festival_ranking1"></div>
					</div>
					<div>
						<div>2위</div>
						<div class="festival_ranking2"></div>
					</div>
					<div>
						<div>3위</div>
						<div class="festival_ranking3"></div>
					</div>
					<div>
						<div>4위</div>
						<div class="festival_ranking4"></div>
					</div>
					<div>
						<div>5위</div>
						<div class="festival_ranking5"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<!-- 스크롤 유도 -->
<a class="scrollA" href="#">
   <span></span>
   <div class="scroll-text">Scroll</div>
</a>




<!-- 덩엉js -->
<script src="${cpath }/resources/js/home.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/color-thief/2.3.0/color-thief.umd.js"></script>

<script>
	setInterval(move_slide, 6000)
	next.onclick = next_click
	prev.onclick = prev_click
	banner_color_change(slide[0])
	total_search()
</script>

<script src="${cpath }/resources/js/fes_board_list.js"></script>

<script>

</script>

</body>
</html>