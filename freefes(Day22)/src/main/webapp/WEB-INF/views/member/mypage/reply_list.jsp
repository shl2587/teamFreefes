<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mypage.jsp" %>

<table>
    <thead>
        <tr>
            <th>제목</th>
            <th>장소</th>
            <th>지역</th>
            <th>내용</th>
            <th>댓글작성 날짜</th>
        </tr>
    </thead>

    <c:forEach var="dto" items="${Rep}">
        <tr class="favorites-row">
            <td>
                <div class="item">${dto.board}</div>
            </td>
            <td>
                <div class="item">${dto.content}</div>
            </td>
            <td>
                <div class="item">${dto.grade}</div>
            </td>
            <td>
                <div class="item">${dto.write_date}</div>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>