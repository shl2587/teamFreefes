<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<!-- css -->
<link rel="stylesheet" href="${cpath }/resources/css/header.css" type="text/css" />
<link rel="stylesheet" href="${cpath }/resources/css/admin_board.css" type="text/css" />
<link rel="stylesheet" href="${cpath }/resources/css/qna_board.css" type="text/css" />
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
<!-- css -->
<meta charset="UTF-8">
<title>freefes</title>
</head>
<body>
<!-- js -->
<script>
	const cpath = "${cpath}"
	let fes_page_href = window.location.pathname
	fes_page_href = fes_page_href.substr
						(fes_page_href.indexOf('board/') + 6, fes_page_href.length)
</script>
<script defer src="${cpath }/resources/js/qna_board.js"></script>
<script defer src="${cpath }/resources/js/admin_board.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


<header>
		<div id="homepage_logo">
			<a href="${cpath }"><input type="image" 
				src="${cpath }/resources/image/로고.png" height="100px"></a>
		</div>
		<div class="header1">
			<c:if test="${empty login}">
				<a href="${cpath }/member/login">로그인</a>
			</c:if>
			<c:if test="${not empty login}">
				<a href="${cpath }/member/logout">로그아웃</a>
				<a href="${cpath }/member/mypage/mypage/${login.idx }">마이페이지</a>
			</c:if>
		</div>
		<div class="header2">
			<ul>
				<li class="fes_board_list_main_li">
					<a href="${cpath }/">축제일정</a>
				</li>
				<li class="fes_board_list_main_li">
					<a href="${cpath }/">지역축제</a>
				</li>
				<li class="fes_board_list_main_li">
					<a href="#" onclick="redirect_to_page('fes_board_list')">축제게시판</a>
					<ul class="fes_board_list_sub_ul">
						<li>
							<a class="fes_board_list_sub" 
								href="#" onclick="redirect_to_page('fes_board_proceeding')">진행중인 축제</a>
						</li>
						<li>
							<a class="fes_board_list_sub" 
								href="#" onclick="redirect_to_page('fes_board_finish')">종료된 축제</a>
						</li>
						<li>
							<a class="fes_board_list_sub" 
								href="#" onclick="redirect_to_page('fes_board_scheduled')">진행 예정된 축제</a>
						</li>
					</ul>
				</li>
				<li class="fes_board_list_main_li"><a href="${cpath }/admin_board/admin_board">고객센터</a></li>
			</ul>
		</div>
</header>

<script>
	function redirect_to_page(fes_page_href) {
		const fes_list_sub_url = cpath + '/fes_board/' + fes_page_href
		window.location.href = fes_list_sub_url
	}
</script>


















