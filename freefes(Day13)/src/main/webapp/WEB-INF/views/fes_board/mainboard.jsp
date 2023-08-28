<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>





<div class="">
	<div class="">
		<h3>${board_dto.title }</h3>
		<div>조회수 : ${board_dto.count }</div>
		<div>
			작성일 : 
			<fmt:formatDate value="${board_dto.write_date }" pattern="yyyy-MM-dd"/>
		</div>
		<div class="">
			<img src="">
			<div>
				<span>축제 기간</span>
				<fmt:formatDate value="${board_dto.start_date }" pattern="yyyy-MM-dd"/>
				 ~ 
				<fmt:formatDate value="${board_dto.end_date }" pattern="yyyy-MM-dd"/> 
			</div>
			<label>축제 내용</label>
			<div>
				<span>개최 지역</span>
				${board_dto.region }
			</div>
			<div>
				<span>개최 장소</span>
				${board_dto.place }
			</div>
			<div>
				<span>축제 시간</span>
				${board_dto.time }
			</div>
			<div>
				<span>축제 설명</span>
				${board_dto.content }
				<br>
				참고 사이트 : ${board_dto.url }
			</div>
			<div>
				<span>참가 비용</span>
				<br>
				${board_dto.fee}
			</div>
			<div>
				<span>연령 제한</span>
				${board_dto.age_limit }
			</div>
			<div>
				<span>주최자</span>
				${board_dto.host_org }
			</div>
			<div>
				<span>문의</span>
				${board_dto.inquire }
			</div>
		</div>
		<div><button>관심 축제 등록</button></div>
	</div>
</div>


</body>
</html>