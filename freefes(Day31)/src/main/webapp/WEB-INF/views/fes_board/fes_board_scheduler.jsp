<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
.calendar {
    display: flex;
    align-items: center;
    margin: auto 0;
    justify-content: center;
}
.calendar > button {
    background: none;
    border: none;
    padding: 0;
    cursor: pointer;
    font-size: 40px;
}
.calendar_table {
    border-collapse: collapse;
    margin-top: 10px; 
    margin-left: auto;
    margin-right: auto;
    height: 500px;
    width: 900px;
    font-size: 30px;
}
calendar_table_tr > th, 
.calendar_table_td {
    border: 1px solid white;
    padding: 10px;
    text-align: center;
}

.calendar_table_tr > th {
    background-color: #002E7F;
    color: white; 
}
.calendar_table > tr > td {
    border: 1px solid #ccc;
    padding: 5px;
    text-align: center;
    background-color: #fff;
}

#calendar {
    align-items: center;
    height: 500px;
    justify-content: center;
}

.calendar_table_td > a {
    text-decoration: none; /* 밑줄 제거 */
    color: inherit; 
}

.calendar_table_td.sunday a {
    color: red;
}

.calendar_table_td.saturday a {
    color: blue;
}
</style>

<h1>달력</h1>
<div class="calendar">
    <button onclick="back()">⬅️</button>
    <h1 id="calendarTitle"></h1>
    <button onclick="next()">➡️</button>
</div>
<div id="calendar_js"></div>

<script>
    let currentYear
    let currentMonth

    function generateCalendar(year, month) {
        currentYear = year
        currentMonth = month

        let calendarHtml = '<table class="calendar_table">'
        calendarHtml += '<tr class="calendar_table_tr"><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>'

        let startDate = new Date(year, month, 1)
        let endDate = new Date(year, month + 1, 0)
        let currentDate = new Date(startDate)

        while (currentDate <= endDate) {
            calendarHtml += '<tr class="calendar_table_tr">'
            for (let i = 0; i < 7; i++) {
                if (currentDate.getDay() === i && currentDate.getMonth() === month) {
                    let cellClass = currentDate.getDay() === 0 ? "sunday" : (currentDate.getDay() === 6 ? "saturday" : "")
                    let textColor = currentDate.getDay() === 0 ? "red" : (currentDate.getDay() === 6 ? "blue" : "inherit")
                    
                    calendarHtml += '<td class="calendar_table_td ' + cellClass + '"><a href="javascript:dateClicked(\'' + currentDate.toISOString().slice(0, 10) + '\')" style="color:' + textColor + '">' + currentDate.getDate() + '</a></td>'
                    currentDate.setDate(currentDate.getDate() + 1)
                } else {
                    calendarHtml += '<td></td>'
                }
            }
            calendarHtml += '</tr>'
        }

        calendarHtml += '</table>'
        document.getElementById('calendar_js').innerHTML = calendarHtml
        document.getElementById('calendarTitle').innerText = year + '년 ' + (month + 1) + '월'
    }

    function dateClicked(date) {
    	let selectedDate = new Date(date)
        selectedDate.setDate(selectedDate.getDate() + 1)
        let paramdate = selectedDate.toISOString().slice(0, 10)
        window.location.href = "${cpath}/fes_board/fes_board_list?start_date=" + paramdate
    }

    function back() {
        currentMonth--
        if (currentMonth < 0) {
            currentMonth = 11
            currentYear--
        }
        generateCalendar(currentYear, currentMonth)
    }

    function next() {
        currentMonth++
        if (currentMonth > 11) {
            currentMonth = 0
            currentYear++
        }
        generateCalendar(currentYear, currentMonth)
    }

    let today = new Date()
    generateCalendar(today.getFullYear(), today.getMonth())
</script>
</body>
</html>