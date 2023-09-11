const grades = document.querySelectorAll(".grade")

window.onload = star()

function star() {
	let percent;
	for(const i in grades) {
		percent = grades[i].innerText * 20
		grades[i].innerHTML = `<div class="starpoint_wrap">
			<div class="starpoint_box">
				<div class="label_star" style="width: 100px"></div>
				<span class="starpoint_bg" style="width: ${percent}%"></span>
			</div>
		</div>`
	}
}

function confirm_delete() {
	const result = confirm("정말 삭제하시겠습니까?")
	
	if(result) {
		window.location = document.getElementById("delete_my_reply").value
	} 
}