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
	<h3 style="color: black; font-size:23px;">공지사항 / No.${dto.idx }  
		<span style="color: #537188; font-size:27px;">${dto.title }</span>
	</h3>
</div>
<hr>


<div class="admin_write_form">
	<div>
		<label for="content"></label>
		<textarea id="a_content" name="content" readonly required>${dto.content }</textarea>
	</div>
</div>

</body>
</html>