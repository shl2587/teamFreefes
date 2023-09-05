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
	   .select_img img {
            transition: opacity 0.3s;
        }

        .select_img img[src*="_ov.png"] {
            opacity: 0;
        }
</style>
</head>
<body>

<h1>My Page</h1>
<%-- <p>${login }</p> --%>
<hr>
<div class="select_img">
   <img src="http://sanriokorea.co.kr/wp-content/themes/sanrio/images/new_main_crt1.png">
   <img src="http://sanriokorea.co.kr/wp-content/themes/sanrio/images/new_main_crt1_ov.png">
   <img src="http://sanriokorea.co.kr/wp-content/themes/sanrio/images/new_main_crt2.png">
   <img src="http://sanriokorea.co.kr/wp-content/themes/sanrio/images/new_main_crt2_ov.png">
   <img src="http://sanriokorea.co.kr/wp-content/themes/sanrio/images/new_main_crt3.png">
   <img src="http://sanriokorea.co.kr/wp-content/themes/sanrio/images/new_main_crt3_ov.png">
   <img src="http://sanriokorea.co.kr/wp-content/themes/sanrio/images/new_main_crt4.png">
   <img src="http://sanriokorea.co.kr/wp-content/themes/sanrio/images/new_main_crt4_ov.png">
   <img src="http://sanriokorea.co.kr/wp-content/themes/sanrio/images/new_main_crt5.png">
   <img src="http://sanriokorea.co.kr/wp-content/themes/sanrio/images/new_main_crt5_ov.png">
   <img src="http://sanriokorea.co.kr/wp-content/themes/sanrio/images/new_main_crt8.png">
   <img src="http://sanriokorea.co.kr/wp-content/themes/sanrio/images/new_main_crt8_ov.png">
</div>

<div class="all">
	<div><a href="${cpath }/member/mypage/modify/${login.idx}">회원 정보 수정</a></div>
	<div><a href="${cpath }/member/mypage/list/${login.idx}">게시글 신청 내역</a></div>
	<div><a href="${cpath }/member/mypage/reply_list/${login.idx}">댓글 내역</a></div>
	<div><a href="${cpath }/member/mypage/favorites/${login.idx}">좋아요 내역</a></div>
	<div><a href="${cpath }/message/sendMessage/${login.idx}">쪽지보내기</a></div>
	<div><a href="${cpath }/message/listMessage/${login.idx}">쪽지목록</a></div>
	<div><a href="${cpath }/admin_board/admin_board">고객센터</a></div>
</div>
<hr>