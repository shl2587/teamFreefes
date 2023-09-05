<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>



<main id="wrap">
<div class="admin_board_menu">
	<ul>
		<li><a href="${cpath }/admin_board/admin_board">공지사항</a></li>
		<li><a href="${cpath }/qna/${login.role >= 1 ? 'qna_board' : 'qna_list'}">1:1 문의함</a>
		<li><a href="${cpath }/admin_board/admin_board_ask">자주묻는 질문</a></li>
		<li><a href="${cpath }/admin_board/surround">주위 시설</a></li>
	</ul>
</div>

<div class="admin_board_title">
<h3 style="color: black; font-size:23px;">공지사항   / 
	<span style="color: #537188; font-size:27px;"> 공지사항 작성</span>
</h3>
</div>
<hr>

<div class="admin_write_form">
	<form method="POST">
		<div>
			<label for="title"></label>
			<input type="text" id="a_title" name="title" placeholder="공지 제목을 정해주세요" required autofocus>
			<label for="horsehead"></label>
			<select name="horsehead" id="horsehead" onchange="addhorsehead()">
				<option value="선택">말머리</option>
				<option value="공지">[공지]</option>
				<option value="이벤트">[이벤트]</option>
			</select>
		</div>
		<div>
			<label for="content"></label>
			<textarea id="a_content" name="content" placeholder="공지 내용을 작성하세요" required></textarea>
		</div>
		<div class="submit_btn"><button type="submit">공지 등록</button></div>
	</form>
</div>
</main>


</body>
</html>