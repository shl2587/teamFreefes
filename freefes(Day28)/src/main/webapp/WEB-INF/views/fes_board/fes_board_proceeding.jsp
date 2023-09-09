<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script src="${cpath }/resources/js/fes_board_list.js"></script>

<div >
	<div class="result_div">
		<c:forEach var="scheduled_list" items="${fes_schedule_list }">
			<div class="festival_list">
				<div class="festival_poster">
					<img src="">
				</div>
				<div>
					<a href="${cpath }/fes_board/mainboard/${scheduled_list.idx}">
						<span>${scheduled_list.idx }</span>
						<span>${scheduled_list.title }</span>
					</a>
					<span>조회수 : ${scheduled_list.count }</span>
					<div>
						<img src="${scheduled_list.file_path }">
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<form method="POST" class="fes_search_form">
		<select class="search_method" name="search_method">
			<option value="">=== 검색 유형 ===</option>
			<option value="complex">제목 / 내용</option>
			<option value="member">작성자</option>
		</select>
		<input class="search" type="search" name="fes_keyword" placeholder="검색어 입력">
		<input class="search_submit" type="submit" value="검색">
	</form>
	<div class="fes_board_paging">
		<c:if test="${fes_paging_dto.prev && fes_paging_dto.page_begin > 1}">
			<a href="${cpath }/fes_board/fes_board_proceeding?request_page=
				${fes_paging_dto.page_begin - fes_paging_dto.per_page}">
				◀이전
			</a>
		</c:if>
		<c:forEach var="page_number" begin="${fes_paging_dto.page_begin }" end="${fes_paging_dto.page_end }">
			<a href="${cpath }/fes_board/fes_board_proceeding?request_page=${page_number}">
				[${page_number }]
			</a>
		</c:forEach>
		<c:if test="${fes_paging_dto.next && fes_paging_dto.page_end < fes_paging_dto.total_count}">
			<a href="${cpath }/fes_board/fes_board_proceeding?request_page=
				${fes_paging_dto.page_end + 1 }">
				다음▶
			</a>
		</c:if>
	</div>
</div>



</body>
</html>