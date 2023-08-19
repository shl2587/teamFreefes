<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h3>1:1 문의하기</h3>
<hr>

<form method="POST" action="${cpath}/qna/qna_write">
    <label for="category">카테고리:</label>
    <select name="category" id="category" required>
        <option value="">선택</option>
        <option value="계정">계정</option>
        <option value="행사">행사</option>
        <option value="기타">기타</option>
    </select><br>
    <label for="title">제목:</label>
    <input type="text" name="title" id="title" required><br>
    <label for="question">질문:</label>
    <textarea name="question" id="question" required></textarea><br>
    <input type="submit" value="작성 완료">
</form>

</body>
</html>