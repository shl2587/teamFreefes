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
<h3 style="color: black; font-size:23px;"> 
	<span style="color: #537188; font-size:27px;">No.${dto.idx } '${dto.nickname }'님의 문의</span>
</h3>
</div>
<hr>


<div class="qna_write_form">
	<details>
		<summary>${dto.nickname}님의 질문</summary>
			<div>
	            <label for="title"></label>
	            <input type="text" name="title" id="q_title" value="${dto.title}" readonly>
	            <label for="category"></label>
	            <input type="text" name="category" id="category" value="${dto.category}" readonly>
	        </div>
	        <div>
	            <label for="question"></label>
	            <textarea name="question" id="question" readonly>${dto.question}</textarea>
	        </div>	
	</details>


<!-- 답변 작성 후 그 내용이 다시 readonly 상태로 보이게 redirect 시키는 core -->
<!-- c:choose=switch  c:when=case  c:othewise=default  -->
<!-- choose와 otherwise는 속성x when은 속성이 필수. -->
	<div class="view_question_list">
		<div><h4>${dto.nickname }님 질문에 대한 답변</h4></div>
		<div><a href="${cpath }/qna/qna_board">
			<i class="fa-solid fa-list" style="color: #5f95bf;"></i>
		</a></div>
	</div>
	<c:choose>
	    <c:when test="${login.role == 0}">
	        <form method="POST" action="${cpath}/qna/qna_view/${dto.idx}">
	            <label for="answer"></label>
	            <textarea name="answer" placeholder="답변 내용">${dto.answer}</textarea>
	            <div class="submit_btn"><button type="submit">답변 작성</button></div>
	        </form>
	    </c:when>
	    <c:otherwise>
	        <label for="answer"></label>
	        <textarea name="answer" id="answer" class="last_answer" placeholder="아직 답변이 없습니다." readonly>${dto.answer}</textarea>
	    </c:otherwise>
	</c:choose>
</div>
</main>

</body>
</html>