<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="mypage.jsp" %>

<table>
    <thead>
        <tr>
            <th>게시판 번호</th>
            <th>축제 카테고리</th>
            <th>축제 이름</th>
        </tr>
    </thead>

    <c:forEach var="dto" items="${fav}">
        <tr class="favorites-row">
            <td>
                <div class="item">${dto.idx}</div>
            </td>
            <td>
                <div class="item">${dto.festival_category}</div>
            </td>
            <td>
                <div class="item">${dto.title}</div>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
