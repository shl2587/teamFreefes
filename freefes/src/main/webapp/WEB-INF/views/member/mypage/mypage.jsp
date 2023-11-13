<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<style>
	.all{
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
		gap: 10px;
 		padding: 10px; 
	}
	.all div {
		background-color: #07277d;
		border-radius: 5px;
		padding: 10px 20px;
		transition: background-color 0.3s;
	}
	.all div:hover {
		background-color: #053c9f;
	}
	.all a {
		text-decoration: none;
		color: white;
		font-weight: bold;
		font-size: 16px;
	}

	.my_profile{
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
		align-items: center;
		background-color: #07277d;
		padding: 20px;
	}

	.my_profile > div {
		display: flex;
		color: white;
		flex-direction: column;
		align-items: center;
		gap: 10px;
		padding: 10px;
		font-size: 20px;
	}

	.my_profile_photo{
		border-radius: 50%;
		overflow: hidden;
		width: 220px;
		height: 200px;
		background: gray;  /* 임시 배경 색상 */
	}
	
	.my_profile > div > div {
		color: white;
		font-weight: bold;
		font-size: 25px;
		text-align: center;
		margin: 5px;
	}
	
	.Mypage_title_h1 h1 {
		text-align: center;
		font-size: 32px;
		margin-top: 20px;
	}
	.Mypage_title_h1{
		margin-right:130px; 
		color: white;
	}
img.profile_img_mypage {
	margin-top: -46px;
}
	
	
</style>
</head>



<div class="my_profile">
<h1 class="Mypage_title_h1">My Page</h1>
	<div class="my_profile_photo">
		<img class="profile_img_mypage" src="${login.profile_img }">
	</div>
	
	<div class="my_profile_userid">
		<div class="my_profile_userid_img">Ⓜ️</div>
		<div class="my_profile_userid_ment">
			user의 아이디
		</div>
			${login.userid }
	</div>
	
	<div class="my_profile_nickname">
		<div class="my_profile_userid_img">📝</div>
		<div class="my_profile_nickname_ment">user의 닉네임</div>
		${login.nickname }
		</div>
		
	<div class="my_profile_birth">
		<div class="my_profile_userid_img">🎂</div>
		<div class="my_profile_birth_ment">user의 생일</div>
		${login.birth}
	</div>
	
</div>

<div class="all">
	<div><a href="${cpath }/member/mypage/modify/${login.idx}">회원 정보 수정</a></div>
	<div><a href="${cpath }/member/mypage/board_list/${login.idx}">게시글 리스트</a></div>
	<div><a href="${cpath }/member/mypage/reply_list/${login.idx}">댓글 리스트</a></div>
	<div><a href="${cpath }/member/mypage/favorites/${login.idx}">좋아요 리스트</a></div>
	<div><a href="${cpath }/message/sendMessage/${login.idx}">쪽지보내기</a></div>
	<div><a href="${cpath }/message/listMessage/${login.idx}">쪽지목록</a></div>
	<div><a href="${cpath }/admin_board/admin_board">고객센터</a></div>
</div>


</body>
</html>