<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../management_header.jsp" %>

<main id="wrap">
<div class="management_main_flex">
	<div class="management_title">
		<h3 style="color: #F0B86E; font-size:23px;">Management /
			<span style="color: #FF6969; font-size:27px;">SenddMessage-List</span>
		</h3>
	</div>
</div>
<hr>

<div class="message_dropdown" id="drag_wrap">
    <button class="message_dropbtn" id="drag_btn"> 
	   <span class="message_dropbtn_icon"></span>
	   <i class="fa-solid fa-envelope" style="color: #ff8838;"></i>
    </button>
    <div class="message_dropdown-content">
	   <a href="${cpath }/admin_board/management_message_list/${login.idx}">Message-List</a>
	   <a href="${cpath }/admin_board/management_receivedMessage_list/${login.idx}">ReceiveMessage-List</a>
	   <a class="sendm_btn" id="management_message_openModalBtn" href="${cpath }/admin_board/management_send_message/${login.idx} ">SendMessage</a>
	   <a href="${cpath }/admin_board/management_sendMessage_list/${login.idx}">SendMessage-List</a>
    </div>
</div>

<div id="management_message_main">
	<table class="management_message_table">
	  <thead>
	    <tr>
			<th>Receiver</th>
	      	<th>Title</th>
			<th>Category</th>
			<th>Date</th>
	     	<th>Delete-All<input type="checkbox" id="notice_selectAll" data-idx="${dto.idx}"></th>
	    </tr>
	  </thead>
	  <tbody>
	    <c:forEach var="dto" items="${list}">
	      <tr>
	        <td><div class="receiver">${dto.receiver_nickname}</div></td>
	        <td><div class="title"><a href="${cpath }/admin_board/management_message_view/${dto.idx}">${dto.title}</a></div></td>
	        <td><div class="category">${dto.category}</div></td>
	        <td><div class="date">${dto.date_column}</div></td>
	        <td><input type="checkbox" class="deletecheckbox" value="${dto.idx }" data-idx="${dto.idx}"></td>
	      </tr>
	    </c:forEach>
	  </tbody>
	</table>
</div>





<div class="page_wrap">
   <div class="page_nation">
      <c:if test="${paging_dto.prev && paging_dto.page_begin > 1}">
	      <a class="arrow prev" href="${cpath }/admin_board/management_sendMessage_list?request_page=${paging_dto.page_begin - paging_dto.per_page}"></a>
	  </c:if>
	  <c:forEach var="page_number" begin="${paging_dto.page_begin }" end="${paging_dto.page_end }">
      	  <a href="${cpath }/admin_board/management_sendMessage_list?request_page=${page_number}" class="active">${page_number }</a>
      </c:forEach>
      <c:if test="${paging_dto.next && paging_dto.page_end < paging_dto.total_count}">
      	  <a class="arrow next" href="${cpath }/admin_board/management_sendMessage_list?request_page=${paging_dto.page_end + 1 }"></a>
      </c:if>
   </div>
</div>


</main>
</body>
</html>