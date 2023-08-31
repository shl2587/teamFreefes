<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<main id="wrap">
<div class="admin_board_menu">
	<ul>
		<li><a href="${cpath }/admin_board/admin_board">공지사항</a></li>
		<c:if test="${not empty login }">
			<li><a href="${cpath }/qna/${login.role >= 1 ? 'qna_board' : 'qna_list'}">1:1 문의함</a>
		</c:if>
		<li><a href="${cpath }/admin_board/admin_board_ask">자주묻는 질문</a></li>
		<li><a href="${cpath }/admin_board/surround">주위 시설</a></li>
	</ul>
</div>



<div class="admin_board_title">
	<h3 style="color: black; font-size:23px;">고객센터   / 
		<span style="color: #537188; font-size:27px;"> 공지사항</span>
	</h3>
	</div>
	<hr>

	<div class="admin_board_btn">
	<c:if test="${login.role == 0}">
	    <h3><a href="${cpath }/admin_board/admin_write">
	    <button>
	    	<i class="fa-solid fa-pen-nib" style="color: #5398a2;"></i>
	    	<span class="write-icon-text">글 쓰기</span>
	    </button>
	    </a></h3>
	</c:if>
	</div>

<div id="qna_board_main">
		<table class="qna_board_table">
		  <thead>
		    <tr>
		      <th>번호</th>
		      <th>제목</th>
		      <th>작성일자</th>
		      <c:if test="${login.role == 0 }">
		      <th>공지 수정</th>
		      </c:if>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="dto" items="${list}">
		      <tr>
		        <td>${dto.idx}</td>
		        <td><a href="${cpath}/admin_board/admin_view/${dto.idx}">${dto.title}</a></td>
		        <td><fmt:formatDate value="${dto.write_date }" pattern="yyyy-MM-dd" /></td>
				<c:if test="${login.role == 0 }">
		     	 <td><a href="${cpath}/admin_board/admin_modify/${dto.idx}">
		        	<button type="button">
		        		<i class="fa-regular fa-pen-to-square" style="color: #7292ca;"></i>
		        	</button>
		        </a></td>
		        </c:if>
		      </tr>
		    </c:forEach>
		  </tbody>
		</table>
	</div>

</main>

</body>
</html>