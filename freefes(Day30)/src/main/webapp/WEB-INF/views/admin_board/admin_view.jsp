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