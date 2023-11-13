<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<main id="wrap">
<div class="admin_board_menu">
	<ul>
		<li><a href="${cpath }/admin_board/admin_board">공지사항</a></li>
		<c:if test="${not empty login && login.role >= 1 }">
			<li><a href="${cpath }/qna/qna_board">1:1 문의함</a></li>
		</c:if>
		<c:if test="${not empty login && login.role == 0 }">
			<li><a href="${cpath }/admin_board/management_qna_list">관리자 문의함</a></li>
		</c:if>
			<li><a href="${cpath }/admin_board/admin_board_ask">자주묻는 질문</a></li>
	</ul>
</div>

<div class="admin_board_title">
<h3 style="color: black; font-size:23px;">고객센터   / 
	<span style="color: #537188; font-size:27px;"> 1:1 문의함</span>
</h3>
<h3><a href="${cpath }/qna/qna_write">
    <button class="qna_write_btn">
    	<i class="fa-solid fa-pen-nib" style="color: #cfcfcf;"></i>
    	<span class="write-icon-text">1:1 문의하기</span>
    </button>
</a></h3>
</div>
<hr>

<div class="qna_board_btn">
<c:if test="${login.role == 1 || login.role == 2}">
	<div id="qna_board_main">
		<table class="qna_board_table">
		  <thead>
		    <tr>
		      <th>번호</th>
		      <th>제목</th>
		      <th>글 수정</th>
		      <th><input type="checkbox" id="selectAll" data-idx="${dto.idx}">전체 선택</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="dto" items="${myList}">
		      <tr>
		        <td>${dto.idx}</td>
		        <td><a href="${cpath}/qna/qna_view/${dto.idx}">${dto.title}</a></td>
		        <c:if test="${empty dto.answer}">
		        <td><a href="${cpath}/qna/qna_modify/${dto.idx}">
		        	<button type="button">
		        		<i class="fa-regular fa-pen-to-square" style="color: #7292ca;"></i>
		        	</button>
		        </a></td>
		        </c:if>
		        <c:if test="${not empty dto.answer }">
		        	<td><button class="complete_answer" onclick="alert('답변 완료')" disabled>답변완료</button></td>
		        </c:if>
		        <td><input type="checkbox" class="deletecheckbox" value="${dto.idx }" data-idx="${dto.idx}"></td>
		      </tr>
		    </c:forEach>
		  </tbody>
		</table>
	</div>
	<div class="delete_btn">
		<button type="button" class="delete-button"  data-idx="${dto.idx}">
			<i class="fa-solid fa-trash fa-bounce" style="color: #434977;"></i>
		</button>
	</div>
</c:if>
</div>

</main>
<script defer src="${cpath }/resources/js/qna_board.js"></script>
</body>
</html>