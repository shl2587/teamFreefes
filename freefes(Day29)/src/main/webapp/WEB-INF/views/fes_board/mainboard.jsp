<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
	/* 평점 */
	.starpoint_wrap {
		display: inline-block;
		height: 21.6px;
		scale: 0.9;
	}
	.starpoint_box {
		position: relative;
		background: url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0 0 no-repeat;
		font-size: 0;
		transition: 0.2s;
		padding-bottom: 2px;
	}
	.starpoint_box .starpoint_bg {
		display: block;
		position: absolute;
		top: 0;
		left: 0;
		height: 18px;
		background: url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0 -20px no-repeat;
		pointer-events:none;
		transition: 0.2s;
	}
	.starpoint_box .label_star{
		display: inline-block;
		width: 10px;
		height: 18px;
		box-sizing: border-box;
		margin-bottom: -2px;
	}
	.starpoint_box .star_radio{
		opacity: 0;
		width: 0;
		height: 0;
		position: absolute;
	}
	.starpoint_box .star_radio:nth-of-type(1):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(1):checked ~ .starpoint_bg{width:10%;}
	.starpoint_box .star_radio:nth-of-type(2):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(2):checked ~ .starpoint_bg{width:20%;}
	.starpoint_box .star_radio:nth-of-type(3):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(3):checked ~ .starpoint_bg{width:30%;}
	.starpoint_box .star_radio:nth-of-type(4):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(4):checked ~ .starpoint_bg{width:40%;}
	.starpoint_box .star_radio:nth-of-type(5):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(5):checked ~ .starpoint_bg{width:50%;}
	.starpoint_box .star_radio:nth-of-type(6):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(6):checked ~ .starpoint_bg{width:60%;}
	.starpoint_box .star_radio:nth-of-type(7):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(7):checked ~ .starpoint_bg{width:70%;}
	.starpoint_box .star_radio:nth-of-type(8):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(8):checked ~ .starpoint_bg{width:80%;}
	.starpoint_box .star_radio:nth-of-type(9):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(9):checked ~ .starpoint_bg{width:90%;}
	.starpoint_box .star_radio:nth-of-type(10):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(10):checked ~ .starpoint_bg{width:100%;}

	.blind{
		position: absolute;
		clip: rect(0 0 0 0);
		margin: -1px;
		width: 1px;
		height: 1px;
		overflow: hidden;
	}
	.flex {
		display: flex;
	}
	a {
		text-decoration: none;
		font-weight: bold;
		color: black;
	}
	
	.title {
		margin: 20px 0;
		font-size: 40px;
	}
	.board_contents {
		display: flex;
		width: 1030px;
		min-height: 540px;
		background-color: white;
		margin: auto;
		padding: 140px 0;
	}
	.main {
		background-color: #ebf1eb;
		margin-top: 60px;
		padding-top: 110px;
	}
	.contents_main {
		margin: 0 60px;
	}
	.flex {
		display: flex;
	}

	.counts {
		text-align: right;
	}
	.write_date {
		text-align: right;
		margin-top: 20px;
	}
	.grade {
		margin-left: 2px;
	}
	.real_content {
		margin: 30px 0;
	}
	.real_content > div {
		margin: 13px 0;
	}
	.real_content > div > div {
		font-weight: bold;
		margin-right: 10px;
		width: 90px;
	}
	.real_content > div > p {
		margin: 0;
		width: 350px;
	}
	.poster {
		height: 500px;
		width: 400px;
		margin-left: 60px;
    	display: inline-flex;
    	padding: 20px 0;
    	text-align: right;
    	align-items: center;
	}
	.poster > img {
		max-height: 500px;
		max-width: 400px;
		margin: auto;
	}
	.etc_imgs {
		display: flex;
		height: 200px;
		width: 400px;
		overflow-x: auto;
		margin-left: 60px;
	}
	.etc_imgs > img {
		height: 100%;
	}
</style>


<c:if test="${login.role == 0 }">
	<style>
		#b_favorites {
 			display: none;
 		}
		#b_cancel_favorites {
			display: none;
		}
	</style>
</c:if>

<!-- 로그인이 비어있지 않고 login.idx와 favorites_result.member의 값이 같으면-->
<c:if test="${not empty login && check_favorites != 0 }">
	<style>
		#b_favorites {
	 		display: none;
	 	}
	</style>
</c:if>

<c:if test="${empty login || check_favorites == 0 }">
	<style>
		#b_cancel_favorites {
			display: none;
		}
	</style>
</c:if>


<c:set var="filePath" value="${board_view.file_path }" />
<c:set var="imges" value="${fn:split(filePath, '&') }"/>


<div class="main">
	<div class="board_contents">
		<div class="festival_imgs">
			<div class="poster">
				<img src="${cpath }/upload/${board_view.title}/${imges[0]}">
			</div>
			<c:if test="${not empty imges[1] }">
				<div class="etc_imgs">
					<c:forEach var="img" items="${imges }" varStatus="imgIdx">
						<c:if test="${imgIdx.index != 0 }">
							<img src="${cpath }/upload/${board_view.title }/${img }">
						</c:if>
					</c:forEach>
				</div>
			</c:if>
		</div>
		<div class="contents_main">
			<div class="write_date">
				작성일
				<fmt:formatDate value="${board_view.write_date }" pattern="yyyy-MM-dd" />
			</div>
			<h3 class="title">${board_view.title }</h3>
			<div class="counts">
				<div>조회수 <span style="color: #b31919">${board_view.count }</span> | 추천수<span style="color: #b31919"> ${board_view.favorites }</span></div>
				<div>평점 <span class="grade">${board_view.grade }</span><span style="color: #b31919">${board_view.grade }</span>점</div>
			</div>
			<div class="real_content">
				<div class="flex">
					<div>축제 기간</div>
					<p>
					<fmt:formatDate value="${board_view.start_date }"
						pattern="yyyy-MM-dd" />
					~
					<fmt:formatDate value="${board_view.end_date }" pattern="yyyy-MM-dd" />
					</p>
				</div>
				<div class="flex">
					<div>개최 지역</div> <p>${board_view.region }</p>
				</div>
				<div class="flex">
					<div>개최 장소</div> <p>${board_view.place }</p>
				</div>
				<div class="flex">
					<div>축제 시간</div> <p>${board_view.time }</p>
				</div>
				<c:if test="${board_view.content != '축제 설명' }">
				<div class="flex">
					<div>축제 설명</div> <p>${board_view.content }</p>
				</div>
				</c:if>
				<div class="flex">
					<div>참고 사이트</div>
					<p><a href="${board_view.url }">${board_view.url }</a>
				</div>
				<div class="flex">
					<div>참가 비용</div> <p>${board_view.fee}</p>
				</div>
				<div class="flex">
					<div>연령 제한</div> <p>${board_view.age_limit }</p>
				</div>
				<div class="flex">
					<div>주최자</div> <p>${board_view.host_org }</p>
				</div>
				<div class="flex">
					<div>문의</div> <p>${board_view.inquire }</p>
				</div>
			</div>
		</div>                                                                                                                                                                                                                                                                                                               
	</div>
		
		<c:if test="${empty login }">
			<div><a href="${cpath }/member/login">로그인하고 댓글 달기</a></div>
		</c:if>
		
		<c:if test="${not empty login }">
		<div>
			<button id="b_favorites">☆</button>
			<button id="b_cancel_favorites">★</button>
		</div>
		<div class="reply">
			<form method="post" action="${cpath }/member/mypage/reply_write">
				<p>
					<input type="hidden" value="${login.idx }" name="member">
				</p>
				<p>
					<input type="hidden" value="${board_view.idx }" name="board">
				</p>
				<div class="flex">
					<p>기대감 점수 : </p>
					<div class="starpoint_wrap">
					  	<div class="starpoint_box">
					    	<label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
						    <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
						    <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
						    <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
						    <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
						    <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
						    <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
						    <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
						    <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
						    <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
						    <input type="radio" name="grade" id="starpoint_1" class="star_radio" value="0.5" ${my_reply.starPoint == 1 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_2" class="star_radio" value="1" ${my_reply.starPoint == 2 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_3" class="star_radio" value="1.5" ${my_reply.starPoint == 3 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_4" class="star_radio" value="2" ${my_reply.starPoint == 4 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_5" class="star_radio" value="2.5" ${my_reply.starPoint == 5 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_6" class="star_radio" value="3" ${my_reply.starPoint == 6 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_7" class="star_radio" value="3.5" ${my_reply.starPoint == 7 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_8" class="star_radio" value="4" ${my_reply.starPoint == 8 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_9" class="star_radio" value="4.5" ${my_reply.starPoint == 9 ? 'checked' : '' }>
						    <input type="radio" name="grade" id="starpoint_10" class="star_radio" value="5" ${my_reply.starPoint == 10 ? 'checked' : '' }>
						    <span class="starpoint_bg"></span>
					  	</div>
					</div>
				</div>
				<div class="flex">
					<p>
						<textarea name="content" placeholder="기대감을 표현해주세요">${my_reply.content }</textarea>
					</p>
					<p><input type="submit" value="입력"></p>
				</div>
			</form>
		</div>
		</c:if>
		
		<c:forEach var="reply_dto" items="${reply_list }">
			<div>${reply_dto.write_date } | <span>${reply_dto.nickname }</span></div>
			<div class="grade">
				${reply_dto.grade }
			</div>
			<div>${reply_dto.content }</div>
			<c:if test="${reply_dto.member == login.idx }">
				<button id="delete_my_reply" onclick="confirm_delete()" value="${cpath}/member/mypage/reply_delete/${reply_dto.idx}">x</button>
			</c:if>
		</c:forEach>
</div>

<script src="${cpath }/resources/js/reply.js"></script>

<script>

const fes_board_idx = "${board_view.idx}"
const login = "${session.login}"
const login_role = "${sessionScope.login.role}"


if (login != "" || login_role != 0) {
	$(document).ready(function() {
	
		const favorites_key = "favorites"
		const favorites = JSON.parse(localStorage.getItem(favorites_key)) || {}
		
		
			
		const update_favorites = () => {
			if (favorites[fes_board_idx]) {
				$("#b_favorites").hide()
				$("#b_cancel_favorites").show()
			} else {
				$("#b_favorites").show()
				$("#b_cancel_favorites").hide()
			}
		}
		
	
		$("#b_favorites").click(function() {
			$.ajax({
				url: "${cpath}/fes_board/favorites/" + fes_board_idx,
				type: "GET",
				success: function(data) {
					console.log(data)
					favorites[fes_board_idx] = true
					localStorage.setItem(favorites_key, JSON.stringify(favorites))
					update_favorites()
					alert("축제 리스트에 추가되었습니다!!!")
					location.reload()
				},
				error: function(error) {
					alert("이미 지난 축제이거나 없는 축제입니다. 다시 확인 부탁드립니다.")
				}
			})
		})
			
		$("#b_cancel_favorites").click(function() {
			$.ajax({
				url: "${cpath}/fes_board/favorites_delete/" + fes_board_idx,
	            type: "GET",
	            success: function(data) {
	                delete favorites[fes_board_idx]
	                
	                localStorage.setItem(favorites_key, JSON.stringify(favorites)) // 웹 스토리지에 저장
	                
	                update_favorites() 
	                
	                alert("축제 리스트에서 제외되었습니다. 다른 축제를 찾으러 가볼까요?")
	                location.reload()
	            },
				error: function(error) {
					alert("이미 리스트에서 제외된 축제입니다.")
				}
			})
		})
	})
}
else if (login == "") {
	$("#b_favorites").click(function() {
		let result = confirm("로그인 후 사용 가능합니다. 로그인 페이지로 이동하시겠습니까?")
		if (result === true) {
			location.href = '${cpath}/member/login'
		}
		else {
			location.href = '${cpath}/fes_board/mainboard/' + fes_board_idx
		}
	})
}
</script>

</body>
</html>