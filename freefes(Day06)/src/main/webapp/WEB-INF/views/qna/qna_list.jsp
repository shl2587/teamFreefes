<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h3>고객센터  / 1:1문의함</h3>
<hr>
    <c:forEach var="dto" items="${list }">
        <div>
            <h3><a href="${cpath }/qna/qna_view/${dto.idx }">${dto.title }</a></h3>
            <div>작성자: ${dto.member }</div>
        </div>
    </c:forEach>
    <a href="${cpath }/qna/qna_write">문의글 작성</a>


</body>
</html>