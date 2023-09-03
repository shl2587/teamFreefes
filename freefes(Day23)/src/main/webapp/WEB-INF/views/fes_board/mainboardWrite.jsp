<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
	const cpath = "${cpath}"
	const memberIdx = ${sessionScope.login.idx}
</script>

<div>
	<div id="load_temp_save">
		<div id="temp_load">임시저장글 불러오기</div>
		<div class="block" style="display: none;">
			<c:forEach var="dto" items="${list }" varStatus="status">
				<div style="display: flex;">
					<div class="temp_button">
						<strong class="temp_save_title">${dto.title }</strong>
						<span>
							<fmt:formatDate value="${dto.write_date}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초에 저장된 글" />
						</span>
						<input type="hidden" class="temp_board_idx" value="${dto.idx }">
					</div>
					<button class="temp_delete" value="${dto.idx }">X</button>
				</div>
			</c:forEach>
		</div>
	</div>
	<form method="POST" enctype="multipart/form-data" id="form" action="${cpath }/fes_board/mainboardWrite">
		<input type="hidden" name="member" value="${login.idx }">
		<p>
			<select id="local_gov" name="region" required>
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
			<select id="region_section" name="region_section" required>
				<option value="">=== 시 / 군 / 구 선택 ===</option>
			</select>
		</p>
		<p>
			<select name="festival_category" required>
				<option value="">=== 축제 유형 선택 ===</option>
				<option value="경연사업">경연사업</option>
				<option value="관광특산">관광특산</option>
				<option value="문화예술">문화예술</option>
				<option value="생태자원">생태자원</option>
				<option value="전통역사">전통역사</option>
				<option value="지역특산물">지역특산물</option>
				<option value="etc">기타</option>
			</select>			
			<input type="text" name="title" placeholder="제목작성" required>
			<label>축제 시작일</label>
			<input type="date" name="start_date" required>
			<label>축제 종료일</label>
			<input type="date" name="end_date" required>
		</p>
		<p>
			<input type="text" name="place" placeholder="개최 장소" required>
			<input type="text" name="time" placeholder="축제 시간">
			<input type="text" name="url" placeholder="참고 주소(url)">
			<input type="text" name="fee" placeholder="참가 비용" required>
			<input type="text" name="age_limit" placeholder="연령 제한">
			<input type="text" name="host_org" placeholder="주최자">
			<input type="text" name="inquire" placeholder="축제 문의">
			<input type="text" name="way_to_come" placeholder="오시는길">
		</p>
		<p><textarea name="content" placeholder="게시글 작성" required></textarea></p>
		<p>
			포스터 사진(필수)<br><input type="file" name="poster" required>
		</p>
		<p>
			축제 사진(선택)<br><input type="file" name="file_list" multiple>
		</p>
		<p><input type="submit" value="저장"></p>
	</form>
		<p><button id="temp_save">임시저장</button></p>
</div>

<script src="${cpath }/resources/js/temp_board.js"></script>
<script src="${cpath }/resources/js/fes_board_list.js"></script>


<script>
	// 시/군/구 불러오는 코드
	local_gov_list()
</script>

</body>
</html>