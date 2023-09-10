// 아이디 찾기

   async function send_Auth_IdnumHandler() {
      const send_Auth_Idnum = document.getElementById('send_Auth_Idnum')
      const name = document.querySelector('input[name="find_name"]')
      const email = document.querySelector('input[name="find_email"]')
   const ob = {
         name: name.value,
         email: email.value,
      }
      const url = cpath + '/send_Auth_Idnum'
      const opt = {
         method: 'POST',
         body: JSON.stringify(ob),
         headers: {
            'Content-Type': 'application/json; charset=utf-8'
         }
      }
      const result = await fetch(url, opt).then(resp => resp.json())
      alert(result.message)
      if(result.success != 0){
         window.location.href = '../member/findId'
      }
   }
   send_Auth_Idnum.onclick = send_Auth_IdnumHandler

   const check_Number = document.getElementById('check_Number')
   const name2 =  document.querySelector('input[name="name2"]')

   async function check_NumberHandler(){
      const authNumber =  document.querySelector('input[name="authNumber"]')
      const url = cpath + '/check_Number/' + authNumber.value
      const row =  await fetch(url).then(resp => resp.text())
      if(row != 0){
         authMessage2.innerText = name2.value
         authMessage2.style.color = '#002E7F'
      }
      else{
         alert('인증번호를 확인하세요')
      }
   }
   check_Number.onclick = check_NumberHandler

   const end = document.getElementById('end')   
   async function endHandler(){
      const url = cpath + '/end'
      const row =  await fetch(url).then(resp => resp.text())
      
      const redirectUrl = '../member/login'; 
      window.location.href = redirectUrl; 
   }
   end.onclick = endHandler
   
// 아아디 찾기
   
   