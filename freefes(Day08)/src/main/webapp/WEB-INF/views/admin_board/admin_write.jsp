<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h3>공지사항 작성</h3>
<hr>

<form method="POST">
	<p><input type="text" name="title" placeholder="제목" required autofocus></p>
	<p><textarea name="content" placeholder="내용" required></textarea></p>
	<p><input type="submit"></p>
</form>

</body>
</html>