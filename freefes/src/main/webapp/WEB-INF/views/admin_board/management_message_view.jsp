<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../management_header.jsp" %>


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


<div class="receive_message_modal">
  <div class="receive_message_modal-wrap">
    <div class="management_modal-content">
      <div class="receive_message_modal-header">
        <h2 class="management_modal-title">Message</h2>
      </div>
      <div class="receive_message_modal-body">
        <div class="message-info">
        	<div><label for="categoryInput">Category :</label></div>
	        <input type="text" value="${dto.category}" readonly>
        </div>
        <div class="message-info">
        	<div><label for="categoryInput">Writer :</label></div>
         	<input type="text" value="${dto.writer}" readonly>
        </div>
        <div class="message-info">
        	<div><label for="categoryInput">Receiver :</label></div>
         	<input type="text" value="${dto.receiver}" readonly>
        </div>
        <div class="message-info">
        	<div><label for="categoryInput">Title :</label></div>
        	<input type="text" value="${dto.title}" readonly>
        </div>
        <div class="message-content">
        	<div><label for="categoryInput">Content :</label></div>
        	<textarea readonly>${dto.content}</textarea>
        </div>
      </div>
      <div class="receive_message_modal-footer">
      	<a class="move_send_btn" id="management_message_openModalBtn" href="${cpath }/admin_board/management_send_message/${login.idx} "><button>SendMessage</button></a>
        <a href="${cpath }/admin_board/management_receivedMessage_list"><button type="button" class="exit-btn" id="management_message_viewCloseModalBtn">Close</button></a>
      </div>
    </div>
  </div>
</div>


<!-- 필수 모달-->
<div class="management_modal" id="management_message_sendMessageModal">
  <div class="management_modal-dialog">
    <div class="management_modal-content">
      <div class="management_modal-header">
        <h2 class="management_modal-title">Send Message</h2>
        <button type="button" class="management_close" id="management_message_closeModalBtn">&times;</button>
      </div>
      <form id="management_message_sendMessageForm" action="${cpath}/admin_board/management_send_message/${login.idx}" method="POST">
        <div class="management_modal-body">
          <input type="hidden" name="writer" value="${login.idx}">
           <select name="category">
             <option value="qna/user">문의글/계정</option>
             <option value="qna/event">문의글/행사</option>
             <option value="etcetera">기타</option>
             <option value="nickname">닉네임</option>
           </select>
          <input type="text" name="receiver_nickname" placeholder="Reciever">
          <div class="input-group">
            <input class="modal-content-title" type="text" name="title" placeholder="title">
          </div>
          <textarea name="content" placeholder=" 300자 이하로 작성해주세요."></textarea>
        </div>
        <div class="management_modal-footer">
          <input type="submit" value="POST">
          <button type="button" class="btn" id="management_message_cancelModalBtn">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>


</main>
</body>
</html>