import requests
from bs4 import BeautifulSoup

url="https://www.mcst.go.kr/kor/s_culture/festival/festivalCalList.jsp"
res = requests.get(url)
res.raise_for_status()
soup = BeautifulSoup(res.text, "lxml")
div = soup.select_one('div.contentWrap')
content = div.select('ul > li > a')

print(content)

