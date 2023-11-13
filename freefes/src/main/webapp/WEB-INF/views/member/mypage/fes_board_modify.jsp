<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>

<link rel="stylesheet" href="${cpath }/resources/css/fes_board_modify.css" type="text/css" />

<main>
	<div class="write_body">
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
				<input type="text" id="title" name="title" value="${fes_board_dto.title }" disabled>
			</p>
			<div class="relative">
				<span class="span1">축제 시작일</span>
				<input type="date" name="start_date" min="2023-01-01" value="<fmt:formatDate value="${fes_board_dto.start_date}" pattern="yyyy-MM-dd" />" required>
				<span class="span2" style="padding-left: 20px;">축제 종료일</span>
				<input type="date" name="end_date" min="2023-01-01" value="<fmt:formatDate value="${fes_board_dto.end_date}" pattern="yyyy-MM-dd" />" required>
			</div>
			<p><textarea name="content" placeholder="축제 상세 설명(1000자 이내)" maxlength="1000" required>${fes_board_dto.content }"</textarea></p>
			<p class="inline relative"><span class="absolute">개최 장소</span><input type="text" name="place" placeholder="ex) 해운대 해수욕장 일대" value="${fes_board_dto.place }" required></p>
			<p class="inline relative"><span class="absolute">축제 시간</span><input type="text" name="time" placeholder="ex) 13시 ~ 17시" value="${fes_board_dto.time }"></p>
			<p class="inline relative"><span class="absolute">참고 주소(url)</span><input type="text" name="url" placeholder="ex) https://www.instagram.com/movement_zero/" value="${fes_board_dto.url }"></p>
			<p class="inline relative"><span class="absolute">참가 비용</span><input type="text" name="fee" placeholder="ex) 성인  5,000원, 초등학생 무료" value="${fes_board_dto.fee }" required></p>
			<p class="inline relative"><span class="absolute">연령 제한</span><input type="text" name="age_limit" placeholder="ex) 전연령 입장가능" value="${fes_board_dto.age_limit }"></p>
			<p class="inline relative"><span class="absolute">주최자</span><input type="text" name="host_org" placeholder="ex) 부산관광공사" value="${fes_board_dto.host_org }"></p>
			<p class="inline relative"><span class="absolute">축제 문의</span><input type="text" name="inquire" placeholder="ex) 관리자 010-0000-0000" value="${fes_board_dto.inquire }"></p>
			<p class="inline relative"><span class="absolute">오시는길</span><input type="text" name="way_to_come" placeholder="ex) KTX부산역 xxx번 버스 이용" value="${fes_board_dto.way_to_come }"></p>
		
			<p style="text-align: center;">
				<input type="submit" value="제출">
			</p>
		</form>
	</div>
</main>

<script src="${cpath }/resources/js/fes_board_list.js"></script>


<script>
	// 시/군/구 불러오는 코드
	local_gov_list()
	
	document.addEventListener("DOMContentLoaded", onPageLoad);
	function onPageLoad() {
		  const fullRegion = "${fes_board_dto.region}".split(' ');
		  const region = fullRegion[0];
		  const region_section = fullRegion[1];

		  document.querySelector('select[name="region"]').value = region;
		  update_region_section(region);
		  document.querySelector('select[name="region_section"]').value = region_section;
		  document.querySelector('select[name="festival_category"]').value = "${fes_board_dto.festival_category}";
	}
</script>

</body>
</html>