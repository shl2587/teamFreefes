<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<main id="wrap">
<div class="admin_board_menu">
	<ul>
		<li><a href="${cpath }/admin_board/admin_board">공지사항</a></li>
		<c:if test="${not empty login && login.role >= 1 }">
			<li><a href="${cpath }/qna/qna_board">1:1 문의함</a></li>
		</c:if>
		<c:if test="${not empty login && login.role == 0 }">
			<li><a href="${cpath }/admin_board/management_qna_list">관리자 문의함</a></li>
		</c:if>
			<li><a href="${cpath }/admin_board/admin_board_ask">자주묻는 질문</a></li>
	</ul>
</div>

<div class="admin_board_title">
<h3 style="color: black; font-size:23px;">1:1 문의함   / 
	<span style="color: #537188; font-size:27px;"> 1:1 문의하기</span>
</h3>
</div>
<hr>

<div class="qna_write_form">
<form method="POST">
	<div>
	    <label for="title"></label>
	    <input type="text" name="title" id="q_title" placeholder="문의할 제목을 정해주세요" required autofocus>
	    <label for="category"></label>
	    <select name="category" id="category" onchange="addcategory()" required>
	        <option value="선택">말머리</option>
	        <option value="계정">[계정]</option>
	        <option value="행사">[행사]</option>
	        <option value="기타">[기타]</option>
	    </select>
    </div>
    <div>
	    <label for="question"></label>
	    <textarea name="question" id="question" placeholder="문의 내용을 작성하세요" required></textarea>
    </div>
    <div class="submit_btn"><button type="submit">문의 등록</button></div>
</form>
</div>
</main>

</body>
</html>