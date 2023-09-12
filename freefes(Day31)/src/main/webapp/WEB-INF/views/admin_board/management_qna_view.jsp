<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../management_header.jsp" %>



<main id="wrap">
<div class="management_main_flex">
	<div class="management_title">
		<h3 style="color: #F0B86E; font-size:23px;">Management /
			<span style="color: #FF6969; font-size:27px;">QnA-Answer</span>
		</h3>
	</div>
	<div class="management_backlist_btn">
	<c:if test="${login.role == 0}">
	    <h3><a href="${cpath }/admin_board/management_qna_list">
	    <button>
	    	<i class="fa-solid fa-list" style="color: black;"></i>
	    	<span class="backlist-icon-text">list</span>
	    </button>
	    </a></h3>
	</c:if>
	</div>
</div>
<hr>



<div class="management_notice_write_form">
	<details>
		<summary>'${dto.nickname}'님의 질문</summary>
			<div>
	            <label for="title"></label>
	            <input type="text" name="title" id="m_title" value="${dto.title}" readonly>
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
		<div><h4>'${dto.nickname }'님 질문에 대한 답변</h4></div>
	</div>
	<c:choose>
	    <c:when test="${login.role == 0}">
	        <form method="POST" action="${cpath}/qna/qna_view/${dto.idx}">
	            <label for="answer"></label>
	            <textarea name="answer" placeholder="답변 내용">${dto.answer}</textarea>
	            <div class="qna_answer_btn"><button type="submit">답변 작성</button></div>
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