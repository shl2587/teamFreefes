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
<h3 style="color: black; font-size:23px;">고객센터   / 
	<span style="color: #537188; font-size:27px;"> 주위 시설</span>
</h3>
</div>

<hr>


</body>
</main>

</html>