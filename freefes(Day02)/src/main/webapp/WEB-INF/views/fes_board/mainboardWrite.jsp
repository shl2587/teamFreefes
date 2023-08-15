<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div>
	<form method="POST" enctype="multipart/form-data">
		<p>
			<select name="region">				
				<option value="" selected>=== 시/도 선택 ===</option>
				<option value="서울특별시">서울특별시</option>
				<option value="부산광역시">부산광역시</option>
			</select>
			<select>
				<option value="" selected>=== 시/구/군 선택 ===</option>
				<option value="서울특별시">서초구</option>
				<option value="부산광역시">해운대구</option>
			</select>
		</p>
		<p>
			<select name="festival_category">
				<option value="">=== 축제 카테고리 ===</option>
				<option value="nature">자연생태</option>
				<option value="tradition">전통/역사</option>
				<option value="specialties">지역특산물</option>
				<option value="culture">문화/예술</option>
				<option value="unity">주민화합</option>
				<option value="etc">기타</option>
			</select>			
			<input type="text" name="title" placeholder="제목작성" required>
			<label>축제 시작일</label>
			<input type="date" name="start_date" required>
			<label>축제 종료일</label>
			<input type="date" name="end_date" required>
		</p>
		<p><textarea name="content" placeholder="게시글 작성" required></textarea></p>
		<p><input type="file" name="file_name" multiple></p>
		<p><input type="submit" value="저장"></p>
	</form>
</div>

</body>
</html>