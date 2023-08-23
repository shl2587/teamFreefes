<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	div.festival_list {
		display: flex;
		justify-content: center;
	}
</style>

<div>
	<h3>시작 페이지 : ${fes_paging_dto.begin }</h3>
	<h3>끝 페이지 : ${fes_paging_dto.end }</h3>
</div>



<div>
	<div>
		<c:forEach var="board_list" items="${fes_boardList }">
			<div class="festival_list">
				<div>${board_list.idx }</div>
				<div>${board_list.title }</div>
				<div>${board_list.count }</div>
			</div>
		</c:forEach>
	</div>
	<div class="paging">
		<c:forEach var="page_number" begin="${fes_paging_dto.begin }" end="${fes_paging_dto.end }">
			<a href="${cpath }/fes_board/fes_board_list?request_page=${page_number}">[${page_number }]</a>
		</c:forEach>
	</div>
</div>




</body>
</html>