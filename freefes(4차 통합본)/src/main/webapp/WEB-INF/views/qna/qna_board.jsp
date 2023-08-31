<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<main id="wrap">
<div class="admin_board_menu">
	<ul>
		<li><a href="${cpath }/admin_board/admin_board">공지사항</a></li>
		<li><a href="${cpath }/qna/${login.role >= 1 ? 'qna_board' : 'qna_list'}">1:1 문의함</a>
		<li><a href="${cpath }/admin_board/admin_board_ask">자주묻는 질문</a></li>
		<li><a href="${cpath }/admin_board/surround">주위 시설</a></li>
	</ul>
</div>

<div class="admin_board_title">
<h3 style="color: black; font-size:23px;">고객센터   / 
	<span style="color: #537188; font-size:27px;"> 1:1 문의함</span>
</h3>
</div>
<hr>

<div class="qna_board_btn">
<c:if test="${login.role == 1 || login.role == 2}">
    <h3><a href="${cpath }/qna/qna_write">
    <button>
    	<i class="fa-solid fa-pen-nib" style="color: #5398a2;"></i>
    	<span class="write-icon-text">1:1 문의하기</span>
    </button>
    </a></h3>
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
		        <td><a href="${cpath}/qna/qna_modify/${dto.idx}">
		        	<button type="button">
		        		<i class="fa-regular fa-pen-to-square" style="color: #7292ca;"></i>
		        	</button>
		        </a></td>
		        <td><input type="checkbox" class="deletecheckbox" value="${dto.idx }" data-idx="${dto.idx}"></td>
		      </tr>
		    </c:forEach>
		  </tbody>
		</table>
	</div>
	<div class="delete_btn">
		<button type="button" class="delete-button"  data-idx="${dto.idx}">
			<i class="fa-solid fa-trash fa-bounce" style="color: #4676c8;"></i>
		</button>
	</div>
</c:if>
</div>

</main>

</body>
</html>