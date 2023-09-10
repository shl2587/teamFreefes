const send_Auth_pwnum = document.getElementById('send_Auth_pwnum')
const userid = document.querySelector('input[name="userid"]')
const name = document.querySelector('input[name="name"]')
const email = document.querySelector('input[name="email"]')

async function send_Auth_pwnumHandler() {
   
const ob = {
      userid: userid.value,
      name: name.value,
      email: email.value,
   }      
   const url = cpath + '/send_Auth_pwnum'
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
      document.querySelector('.hidden').classList.remove('hidden');
   }
}
send_Auth_pwnum.onclick = send_Auth_pwnumHandler   

const check_Number = document.getElementById('check_Number')

   async function check_NumberHandler2(){
   const authNumber =  document.querySelector('input[name="authNumber"]')
   const url = cpath + '/check_Number/' + authNumber.value
   const row =  await fetch(url).then(resp => resp.text())
   const authMessage = document.getElementById('authMessage')
   if(row != 0){
      window.location.href = '../member/repw'; 
   }
   else{
      alert('인증번호를 확인하세요')
   }
}
check_Number.onclick = check_NumberHandler2

const end = document.getElementById('end')   
async function endHandler(){
   const url = cpath + '/end'
   const row =  await fetch(url).then(resp => resp.text())
   
   const redirectUrl = '../member/login'; 
   window.location.href = redirectUrl; 
}
end.onclick = endHandler