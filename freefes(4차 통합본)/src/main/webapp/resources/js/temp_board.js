'use strict'


		
const temp_buttons = document.querySelectorAll('.temp_button')
let temp_board_idx = null
const temp_save = document.getElementById('temp_save')
const load_temp_save = document.getElementById("load_temp_save")
const block = document.querySelector(".block")

const temp_deletes = document.querySelectorAll(".temp_delete")

temp_save.addEventListener('click', saveTempBoard)


// 임시저장글 X버튼 클릭
temp_deletes.forEach(function(e) {
	e.addEventListener('click', function() {
		const deleteIdx = e.getAttribute("value")
		temp_delete(deleteIdx)
	})
})	

// 임시저장글 목록 누르면 자동 입력
temp_buttons.forEach(function(e) {
	e.addEventListener('click', function() {
		const idxInput = e.querySelector('.temp_board_idx')
		temp_board_idx = idxInput.value
		fetchData()
	})
})



// 임시저장글 삭제
async function temp_delete(deleteIdx) {
    const url = cpath + "/fes_board/temp_delete/" + deleteIdx;
    try {
        await fetch(url);
        alert('임시 저장글이 삭제되었습니다');

        // 클릭한 버튼의 부모 요소를 찾아 삭제
        const button = document.querySelector(`.temp_delete[value="${deleteIdx}"]`);
        if (button) {
            const entry = button.closest('.temp_entry');
            if (entry) {
                entry.remove();
            }
        }
    } catch (err) {
        console.error("에러 : ", err);
        alert('오류로 인해 임시 저장글 삭제가 실패했습니다');
    }
}



// 마우스 올리면 목록나옴
load_temp_save.addEventListener("mouseover", function() {
	if (block) {
		block.style.display = "block"
	}
})

// 마우스 벗어나면 목록 사라짐
load_temp_save.addEventListener("mouseout", function() {
	if (block) {
		block.style.display = "none"
	}
})

// 임시저장글 불러오기
async function fetchData() {
	
	if (temp_board_idx === null) {
		return alert("임시 저장 글을 선택하세요!")
	}
	
	await fetch(cpath + "/fes_board/load_temp_board/" + temp_board_idx, {
	    method: "GET",
	    cache: "no-cache"
	})
		.then((resp) => resp.json())
		.then((data) => {
			const form = document.getElementById('form')
			
			// 날짜 포맷하기
			const startDateTimestamp = data.start_date
			const endDateTimestamp = data.end_date
			
			const startDate = new Date(startDateTimestamp)
			const endDate = new Date(endDateTimestamp)
			
			const formattedStartDate = startDate.toISOString().split('T')[0]
			const formattedEndDate = endDate.toISOString().split('T')[0]
			
		    form.querySelector('select[name="region"]').value = data.region
		    form.querySelector('select[name="festival_category"]').value = data.festival_category
		    form.querySelector('input[name="title"]').value = data.title
		    form.querySelector('textarea[name="content"]').value = data.content
		    form.querySelector('input[name="start_date"]').value = formattedStartDate
			form.querySelector('input[name="end_date"]').value = formattedEndDate
		})
}


// 임시저장버튼
async function saveTempBoard(event) {
	
	const form = document.getElementById('form')
	const ob = {
	    region: form.querySelector('select[name="region"]').value,
	    festival_category: form.querySelector('select[name="festival_category"]').value,
	    member: form.querySelector('input[name="member"]').value,
	    title: form.querySelector('input[name="title"]').value,
	    start_date: form.querySelector('input[name="start_date"]').value,
	    end_date: form.querySelector('input[name="end_date"]').value,
	    content: form.querySelector('textarea[name="content"]').value
	}
	
	

	
	// 빈 제목이면 기능을 끝낸다
	if(ob.title === '') {	
		return alert("제목을 입력해주세요!")
	}
	
	// DB에 저장
	try {
		
		const resp = await fetch(cpath + '/fes_board/temp_board_save', {
			method: 'POST',
			cache: 'no-cache',
			headers: {
		        'Content-Type': 'application/json; charset=utf-8'
		    },
			body: JSON.stringify(ob)
		})
		
		const data = await resp.json()
		const dataDate = new Date(data.write_date)
		const write_date = formatDate(dataDate)
		const title = data.title
		const idx = data.idx
		const tempButtonDiv = document.createElement('div')
		tempButtonDiv.style.display = "flex"
        tempButtonDiv.innerHTML = `
            <div class="temp_button">
                <strong class="temp_save_title">${title}</strong>
                <span>${write_date}</span>
                <input type="hidden" class="temp_board_idx" value="${idx}">
                <button class="temp_delete" value="${idx}">X</button>
            </div>`
		block.appendChild(tempButtonDiv)
		
		tempButtonDiv.querySelector('.temp_delete').addEventListener('click', function () {
            const deleteIdx = idx
            temp_delete(deleteIdx)
        })

        tempButtonDiv.addEventListener('click', function () {
            const idxInput = tempButtonDiv.querySelector('.temp_board_idx')
            temp_board_idx = idxInput.value
            fetchData()
        })
        
        alert('임시저장되었습니다')
        
	} catch (error) {
		console.error("에러 : ", error)
		alert('오류로 인해 임시저장에 실패했습니다')
	}
}

function formatDate(date) {
	  const year = date.getFullYear();
	  const month = String(date.getMonth() + 1).padStart(2, '0');
	  const day = String(date.getDate()).padStart(2, '0');
	  const hours = String(date.getHours()).padStart(2, '0');
	  const minutes = String(date.getMinutes()).padStart(2, '0');
	  const seconds = String(date.getSeconds()).padStart(2, '0');

	  return year + '년 ' + month + '월 ' + day + '일 ' + hours + '시 ' + minutes + '분 ' + seconds + '초에 저장된 글';
	}
