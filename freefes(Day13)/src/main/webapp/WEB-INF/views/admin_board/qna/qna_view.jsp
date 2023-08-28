<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>

<h3>${dto.idx }번 글</h3>
<hr>
<div class="qna_write_form">
    <div><h3>${dto.title}</h3></div>
    <div>작성자: ${dto.member}</div>
    <div>${dto.content}</div>
    <hr>
    <div><h4>${dto.title }에 대한 답변</h4></div>
	<div>${dto.answer }</div>
	
	 
<c:if test="${isAdmin} ">  
	<form method="POST" action="/qna/answer">
		<label for="answer">답변 작성</label>
		<textarea name="answer" placeholder="답변 내용"></textarea>
		<input type="submit" value="작성 완료">
	</form>
</c:if>

<a href="/qna">1:1문의함으로</a>

</div>
</body>
</html>