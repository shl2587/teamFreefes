<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="mypage.jsp" %>


<style>
    body {
        font-family: Arial, sans-serif; 
        background-color: #f4f4f4;
    }

    h1.board_list_title_h1  {
        text-align: center;
        font-size: 28px;
        padding: 15px 0;
        color: #07277d;
        border-bottom: 3px solid #07277d;
        margin-bottom: 40px;
    }

    #festivalTable {
        border-collapse: collapse; 
        width: 85%; 
        margin: 20px auto; 
        background-color: #fff;
        box-shadow: 0 0 25px rgba(0,0,0,0.15);
    }

    .board_list_title_th,
    .board_list_region_th,
    .board_list_content_th,
    .board_list_write_date_th,
    .board_list_approve_th,
    .my_boardList_board { 
        padding: 12px; 
        border: 1px solid #ccc;
    }

    .board_list_title_th,
    .board_list_region_th,
    .board_list_content_th,
    .board_list_write_date_th,
    .board_list_approve_th {
        background-color: #07277d; 
        color: white;
    }

    .favorites-row:hover {
        background-color: rgba(7, 39, 125, 0.05);
    }

    .my_boardList_board a {
        color: #007BFF;
        text-decoration: none; 
    }

    .my_boardList_board a:hover {
        text-decoration: underline;
        color: #0056b3;
    }

    .my_fesboard_paging {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 25px 0;
        padding: 12px;
        background-color: #fff;
        box-shadow: 0 0 25px rgba(0,0,0,0.15);
        border-radius: 6px;
    }

    .my_fesboard_paging a {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        background-color: #07277d;
        color: white;
        margin: 0 8px;
        border-radius: 6px;
        text-decoration: none;
        height: 38px;
        width: 38px;
        transition: background-color 0.3s;
    }

    .my_fesboard_paging a:hover {
        background-color: #053c9f;
    }

    .my_fesboard_paging a.prev-next {
        width: 110px; 
    }

    .my_fesboard_paging a:not(:contains("◀")):not(:contains("▶")) {
        line-height: 1.2;
        font-size: 12px;
    }

</style>

<h1 class="board_list_title_h1">게시글 리스트</h1>

<table id="festivalTable">
    <thead>
        <tr>
            <th class="board_list_title_th">제목</th>
            <th class="board_list_region_th">지역</th>
            <th class="board_list_content_th">내용</th>
            <th class="board_list_write_date_th">작성일</th>
            <th class="board_list_approve_th">승인 대기</th>
        </tr>
    </thead>
    <c:forEach var="dto" items="${my_boardList}">
        <tr class="favorites-row">
            <td class="my_boardList_board"><a href="../../../fes_board/mainboard/${dto.idx}">${dto.title}</a></td>
            <td class="my_boardList_board">${dto.region}</td>
            <td class="my_boardList_board"><a href="../../../fes_board/mainboard/${dto.idx}">${dto.content}</a></td>
            <td class="my_boardList_board">${dto.write_date}</div></td>
            <td class="my_boardList_board">
                    <c:if test="${dto.approve == 0}">대기</c:if>
                    <c:if test="${dto.approve == 1}">승인</c:if>
                    <c:if test="${dto.approve == 2}">거절</c:if>
            </td>
        </tr>
    </c:forEach>
</table>

<div class="my_fesboard_paging">
    <c:if test="${fes_my_paging_dto.prev}">
        <a class="prev-next" href="${cpath}/member/mypage/board_list/${login.idx}?request_page=${fes_my_paging_dto.page_begin - 1}">◀이전</a>
    </c:if>
    <c:forEach var="page_number" begin="${fes_my_paging_dto.page_begin}" end="${fes_my_paging_dto.page_end}">
        <a href="${cpath}/member/mypage/board_list/${login.idx}?request_page=${page_number}">[${page_number}]</a>
    </c:forEach>
    <c:if test="${fes_my_paging_dto.next}">
        <a class="prev-next" href="${cpath}/member/mypage/board_list/${login.idx}?request_page=${fes_my_paging_dto.page_end + 1}">다음▶</a>
    </c:if>
</div>