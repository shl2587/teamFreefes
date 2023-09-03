<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h3>질문 확인</h3>
<form method="POST" action="verify">
		<input type="text" name="userid" placeholder="아이디" required autofocus>
		<input type="text" name="name" placeholder="이름" required>
		<input type="email" name="email" placeholder="email" required>
		<input type="submit" value="확인" >
</form>

<form method="POST" action="answer">
${userid }
	<input type="hidden" name="userid" value="${userid }">
	<h3>${verify1 }</h3>
	<input type="text" name="answer1" placeholder="1번 질문 답" required>
	<h3>${verify2 }</h3>
	<input type="text" name="answer2" placeholder="2번 질문 답" required>
	<p><input type="submit" value="확인"></p>
</form>
</body>
</html>