<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
	const memberIdx = ${sessionScope.login.idx}
</script>

<link rel="stylesheet" href="${cpath }/resources/css/mainboardWrite.css" type="text/css" />

<main>
	<div class="write_body">
		<div class="block-align">
		<div id="load_temp_save">
			<div id="temp_load">임시저장글 불러오기</div>
			<div class="block" style="display: none;">
				<div class="hidden_temp">
				<c:if test="${empty list }">
					<div style="padding-top: 5px;" id="no_save">임시저장글이 없습니다.</div>
				</c:if>
				<c:forEach var="dto" items="${list }" varStatus="status">
					<div class="temp_entry">
						<div class="temp_button">
							<strong class="temp_save_title">${dto.title }</strong>
							<div>
								<fmt:formatDate value="${dto.write_date}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초에 저장된 글" />
							</div><br>
							<input type="hidden" class="temp_board_idx" value="${dto.idx }">
						</div>
							<button class="temp_delete" value="${dto.idx }">X</button>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>
		</div>
		<form method="POST" enctype="multipart/form-data" id="form">
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
			<p class="relative">
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
				<span class="title absolute">축제 이름</span>
				<input type="text" id="title" name="title" placeholder="ex) freefes 축제" maxlength="30" required>
			</p>
			<div class="relative">
				<span class="span1">축제 시작일</span>
				<input type="date" name="start_date" min="2023-01-01" required>
				<span class="span2" style="padding-left: 20px;">축제 종료일</span>
				<input type="date" name="end_date" min="2023-01-01" required>
			</div>
			<p><textarea name="content" placeholder="축제 상세 설명(1000자 이내)" maxlength="1000" required></textarea></p>
			<p class="inline relative"><span class="absolute">개최 장소</span><input type="text" name="place" placeholder="ex) 해운대 해수욕장 일대" required></p>
			<p class="inline relative"><span class="absolute">축제 시간</span><input type="text" name="time" placeholder="ex) 13시 ~ 17시"></p>
			<p class="inline relative"><span class="absolute">참고 주소(url)</span><input type="text" name="url" placeholder="ex) https://www.instagram.com/movement_zero/"></p>
			<p class="inline relative"><span class="absolute">참가 비용</span><input type="text" name="fee" placeholder="ex) 성인  5,000원, 초등학생 무료" required></p>
			<p class="inline relative"><span class="absolute">연령 제한</span><input type="text" name="age_limit" placeholder="ex) 전연령 입장가능"></p>
			<p class="inline relative"><span class="absolute">주최자</span><input type="text" name="host_org" placeholder="ex) 부산관광공사"></p>
			<p class="inline relative"><span class="absolute">축제 문의</span><input type="text" name="inquire" placeholder="ex) 관리자 010-0000-0000"></p>
			<p class="inline relative"><span class="absolute">오시는길</span><input type="text" name="way_to_come" placeholder="ex) KTX부산역 xxx번 버스 이용"></p>
	
			<div>
				<p>포스터 사진(필수)</p>
				<label for="poster" class="files">업로드</label>
				<input type="file" id="poster" name="poster" required>
				<input class="poster-name" value="포스터 사진을 하나만 선택해주세요" readonly>
			</div>
			<div>
				<p>축제 사진(선택)</p>
				<label for="photo" class="files">업로드</label>
				<input type="file" id="photo" name="file_list" multiple>
				<input class="photo-name" value="축제 관련 사진들을 선택해주세요 (복수 선택)" readonly>
			</div>
			<p style="text-align: center;">
				<input type="submit" value="제출">
				<span id="temp_save">임시저장</span>
			</p>
		</form>
	</div>
</main>

<script src="${cpath }/resources/js/fes_board_list.js"></script>
<script src="${cpath }/resources/js/temp_board.js"></script>


<script>
	// 시/군/구 불러오는 코드
	local_gov_list()
</script>

</body>
</html>