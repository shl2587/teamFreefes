<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<div>
	<div class="admin_board_menu">
		<a href="${cpath }/admin_board/admin_board_ask">자주묻는 질문</a>
		<a href="${cpath }/qna/qna_list">1:1 문의함</a>
		<a href="${cpath }/admin_board/surround">주위 시설</a>
	</div>
</div>

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