<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	div.festival_list {
		display: flex;
		justify-content: center;
	}
	div.paging {
		text-align: center;
	}광주
</style>




<div id="b_fes_list">
	<div class="b_search">
		<form>
			<p>
				<select id="local_gov" name="region" >
					<option value="">=== 시 / 도 선택 ===</option>
					<option id="seoul" value="서울">서울특별시</option>
					<option id="busan" value="부산">부산광역시</option>
					<option id="incheon" value="인천">인천광역시</option>
					<option id="daejeon" value="대전">대전광역시</option>
					<option id="gwangju" value="광주">광주광역시</option>
					<option id="deagu" value="대구">대구광역시</option>
					<option id="ulsan" value="울산">울산광역시</option>
					<option id="jeju" value="제주">제주특별자치도</option>
					<option id="gyeonggi" value="경기">경기도</option>
					<option id="gangwon" value="강원">강원도</option>
					<option id="chungcheong_bukdo" value="충청북도">충청북도</option>
					<option id="chungcheong_namdo" value="충청남도">충청남도</option>
					<option id="gyeongsang_bukdo" value="경상북도">경상북도</option>
					<option id="gyeongsang_namdo" value="경상남도">경상남도</option>
					<option id="jeonla_bukdo" value="전라북도">전라북도</option>
					<option id="jeonla_namdo" value="전라남도">전라남도</option>
				</select>
				<select id="region_section" name="region_section">
					<option value="">=== 시 / 군 / 구 선택 ===</option>
				</select>
				<select id="festival_category" name="festival_category">
					<option value="">=== 축제 유형 선택 ===</option>
					<option value="경연사업">경연사업</option>
					<option value="관광특산">관광특산</option>
					<option value="문화예술">문화예술</option>
					<option value="생태자원">생태자원</option>
					<option value="전통역사">전통역사</option>
					<option value="지역특산물">지역특산물</option>
				</select>
			</p>
			<p>
				<label>시작일자</label>
				<input id="start_date" type="date" name="start_date">
				<label>종료일자</label>
				<input id="end_date" type="date" name="end_date">
			</p>
			<p>
				<select id="search_method" name="search_method">
					<option value="">=== 검색 유형 ===</option>
					<option value="complex">제목 / 내용</option>
					<option value="member">작성자</option>
				</select>
				<input id="search" type="search" name="fes_keyword" placeholder="검색어 입력">
				<input id="search_submit" type="submit" value="검색">
			</p>
		</form>
	</div>

	<div id="result_div">
		<c:forEach var="board_list" items="${fes_boardList }">
			<div class="festival_list">
				<a href="${cpath }/fes_board/mainboard/${board_list.idx}">
					${board_list.idx }
					${board_list.title }
					${board_list.count }
				</a>
			</div>
		</c:forEach>
		<a href="${cpath }/fes_board/mainboardWrite/${login.idx}"><button>글쓰기</button></a>
	</div>
	<div class="fes_board_paging">
		<c:if test="${fes_paging_dto.prev && fes_paging_dto.page_begin > 1}">
			<a href="${cpath }/fes_board/fes_board_list?request_page=
				${fes_paging_dto.page_begin - fes_paging_dto.per_page}">
				◀이전
			</a>
		</c:if>
		<c:forEach var="page_number" begin="${fes_paging_dto.page_begin }" end="${fes_paging_dto.page_end }">
			<a href="${cpath }/fes_board/fes_board_list?request_page=${page_number}">
				[${page_number }]
			</a>
		</c:forEach>
		<c:if test="${fes_paging_dto.next && fes_paging_dto.page_end < fes_paging_dto.total_count}">
			<a href="${cpath }/fes_board/fes_board_list?request_page=
				${fes_paging_dto.page_end + 1 }">
				다음▶
			</a>
		</c:if>
	</div>
</div>


<script src="${cpath }/resources/js/fes_board_list.js"></script>


<script>


$(function () {
	local_gov_list()
	const initial_local_gov = "${param.region}"
    const initial_region_section = "${param.region_section}"
    local_gov_list(initial_local_gov, initial_region_section)
})

// document.addEventListener("DOMContentLoaded", function () {
//     const initial_selected_option = document.getElementById("local_gov").value
//     update_region_options(initial_selected_option)
// })

// $("form").on("submit", function () {
//     const selected_option = $("#region_section").val()
//     update_region_options(selected_option)
// })

$(function() {
	$("#festival_category").val("${param.festival_category}").attr("selected", "selected")
	$("#start_date").val("${param.start_date}").attr("selected", "selected")
	$("#end_date").val("${param.end_date}").attr("selected", "selected")
	$("#search_method").val("${param.search_method}").attr("selected", "selected")
	$("#search").val("${param.fes_keyword}")
})

</script>



</body>
</html>