<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<h3>고객센터  / 공지사항</h3>
<hr>

<%-- <c:if test="${sessionScope.role == 0}"> --%>
    <h3><a href="${cpath }/admin_board/admin_write">공지사항 작성(admin_board에 관리자만 보이게 설정)</a></h3>
<%-- </c:if> --%>

<table>
<c:forEach var="dto" items="${list }">
  <tr>
    <td><a href="view/${dto.idx }">${dto.title }</a></td>
    <td><fmt:formatDate value="${dto.write_date }" pattern="yyyy-MM-dd" /></td>
  </tr>
</c:forEach>
</table>

</body>
</html>