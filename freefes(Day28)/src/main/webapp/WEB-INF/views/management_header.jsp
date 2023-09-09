<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<!-- css start -->
<link rel="stylesheet" href="${cpath }/resources/css/management.css" type="text/css" />
<link rel="stylesheet" href="${cpath }/resources/css/admin_board.css" type="text/css" />
<link rel="stylesheet" href="${cpath }/resources/css/qna_board.css" type="text/css" />
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
<!-- end css-->
<meta charset="UTF-8">
<title>freefes</title>
<!-- js start -->
<script>
	const cpath = "${cpath}";
</script>
<script defer src="${cpath }/resources/js/management.js"></script>
<script src="${cpath }/resources/js/qna_board.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- end js -->
</head>
<body>


<header>
		<div id="homepage_logo">
			<a href="${cpath }"><input type="image" 
				src="${cpath }/resources/image/ohmija.png" height="100px"></a>
		</div>
		<div class="header1">
			<c:if test="${empty login}">
			<a href="${cpath }/member/login">login</a>
			</c:if>
			<c:if test="${not empty login}">
				<c:if test="${login.role == 1 || login.role == 2 }">
					<a href="${cpath }/member/logout">로그아웃</a>
					<a href="${cpath }/member/mypage/mypage">마이페이지</a>
				</c:if>
				<c:if test="${login.role == 0}">
					<a href="${cpath }/member/logout">logout</a>
					<a href="${cpath }/admin_board/management_page">manager-page</a>
				</c:if>
			</c:if>
		</div>
		<div class="mng_home_text">
			<a href="${cpath }/admin_board/management_page">Management Page</a>
		</div>
		<div class="header2">
			<ul>
				<div class="dropdown">
				      <button class="dropbtn"> 
				        <span class="dropbtn_icon"></span>
				        	Management-List
				      </button>
			      	<div class="dropdown-content">
				        <a href="${cpath }/admin_board/management_page">Notice</a>
				        <a href="${cpath }/admin_board/management_qna_list">Question</a>
				        <a href="${cpath }/admin_board/exclude_list">Exclude-List</a>
				        <a href="${cpath }/admin_board/addExclude_member">Exclude-User</a>
				        <a href="${cpath }/admin_board/confirm_list">Confirm</a>
		        		<a href="${cpath }/admin_board/management_message_list/${login.idx}">Message</a>
			      	</div>
			     </div>
			     <div class="dropdown">
			      	<button class="dropbtn"> 
				        <span class="dropbtn_icon"></span>
				        	Menu-List
				    </button>
			      	<div class="dropdown-content">
				        <a href="${cpath }">Main-page</a>
				        <a href="${cpath }/fes_board/fes_board_list">Festival-list</a>
				        <a href="${cpath }/admin_board/admin_board">Customer Service</a>
			      	</div>
			    </div>
			</ul>
		</div>
</header>
