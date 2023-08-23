<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>





<div class="">
	<div class="">
		<h3>${dto.title }</h3>
		<div>${dto.count }</div>
		<div>${dto.write_date }</div>
		<div class="">
			<img src="">
			<div>
				<label>축제 기간</label>
				<div>${dto.start_date } ~ ${dto.end_date }</div>
				<label>개최 지역</label>
				<div>${dto.region }</div>
				<label>축제 내용</label>
				<div>${dto.content }</div>
			</div>
		</div>
		<div><button>관심 축제 등록</button></div>
	</div>
	<a href="${cpath }/fes_board/mainboardWrite"><button>글쓰기</button></a>
</div>


</body>
</html>