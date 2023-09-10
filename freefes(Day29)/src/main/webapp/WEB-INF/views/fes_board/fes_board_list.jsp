<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<link rel="stylesheet" href="${cpath }/resources/css/fes_board_list.css" type="text/css">

<div class="main">
	<div class="b_fes_list">
		<div class="b_search">
			<form class="fes_search_form">
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
				<p class="date_wrap">
					<span class="relative inline">
						<span class="date_span">시작일자</span>
						<input id="start_date" type="date" name="start_date">
					</span>
					<span class="relative inline">
						<span class="date_span">종료일자</span>
						<input id="end_date" type="date" name="end_date">
					</span>
				</p>
				<p>
					<select id="search_method" name="search_method">
						<option value="">=== 검색 유형 ===</option>
						<option value="complex">제목 / 내용</option>
						<option value="member">작성자</option>
					</select>
					<input id="search" type="search" name="fes_keyword" placeholder="검색어 입력">
					<label for="search_submit" class="relative"><img class="search_button" src="${cpath}/resources/image/search.png"></label>
					<input id="search_submit" type="submit">
				</p>
			</form>
		</div>
	
			<div class="result_div">
			<c:forEach var="board_list" items="${fes_boardList }">
			<c:set var="filePath" value="${board_list.file_path }" />
			<c:set var="poster" value="${fn:substring(filePath, 0, fn:indexOf(filePath, '&')) }"/>
				<div class="festival_list">
					<div class="festival_poster">
						<a href="${cpath }/fes_board/mainboard/${board_list.idx }">
							<img src="${cpath }/upload/${board_list.title }/${poster}">
						</a>
					</div>
					<div>
					<a href="${cpath }/fes_board/mainboard/${board_list.idx}">
						<span class="board_idx">${board_list.idx }</span>
						<span class="board_title">${board_list.title }</span><br>
						<span class="board_region">${board_list.region }</span>|
						<span class="board_count">조회수 ${board_list.count }</span>|
						<span class="board_date"><fmt:formatDate value="${board_list.start_date}" pattern="MM월  dd일 ~ " />
						<fmt:formatDate value="${board_list.end_date}" pattern="MM월 dd일" /></span>
					</a>
					<div class="board_grade">${board_list.grade }</div>
					<div class="board_favorites">추천수 ${board_list.favorites }</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<c:if test="${not empty login }">
		<div style="text-align: right; padding-right: 40px;">
			<a href="${cpath }/fes_board/mainboardWrite"><button class="new_submit">새 축제 신청하기</button></a>
		</div>
		</c:if>
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
</div>

<script src="${cpath }/resources/js/fes_board_list.js"></script>


<script>

$(function () {
	local_gov_list()
	const initial_local_gov = "${param.region}"
    const initial_region_section = "${param.region_section}"
    local_gov_list(initial_local_gov, initial_region_section)
})




$(function() {
	$("#festival_category").val("${param.festival_category}").attr("selected", "selected")
	$("#start_date").val("${param.start_date}").attr("selected", "selected")
	$("#end_date").val("${param.end_date}").attr("selected", "selected")
	$("#search_method").val("${param.search_method}").attr("selected", "selected")
	$("#search").val("${param.fes_keyword}")
})

window.onload = star()

</script>



</body>
</html>