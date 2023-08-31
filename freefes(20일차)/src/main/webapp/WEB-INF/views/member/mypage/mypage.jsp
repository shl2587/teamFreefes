<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<style>
	.all{
		display: flex;
	}
	.all div {
		border: 1px solid #000; /* 테두리 스타일 및 색상을 지정합니다. */
		margin: 5px; /* 테두리와의 간격을 조정할 수 있습니다. */
		padding: 10px; /* 테두리 내부의 내용과의 간격을 조정할 수 있습니다. */
	}
	.all a {
		text-decoration: none; /* 링크의 밑줄을 제거합니다. */
	}
</style>
</head>
<body>

<h1>My Page</h1>
<p>${login }</p>
<hr>

<div class="all">
	<div><a href="${cpath }/member/mypage/modify/${login.idx}">회원 정보 수정</a></div>
	<div><a href="${cpath }/member/mypage/list/${login.idx}">게시글 신청 내역</a></div>
	<div><a href="${cpath }/member/mypage/reply/${login.idx}">댓글 내역</a></div>
	<div><a href="${cpath }/member/mypage/like/${login.idx}">좋아요 내역</a></div>
	<div><a href="${cpath }/message/sendMessage/${login.idx}">쪽지보내기</a></div>
	<div><a href="${cpath }/message/listMessage/${login.idx}">쪽지목록</a></div>
	<div><a href="${cpath }/admin_board/admin_board">고객센터</a></div>
</div>
<hr>