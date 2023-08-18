from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from time import sleep
import json

# def nextList():
#     while True:
#         paging = driver.find_element(By.CSS_SELECTOR, 'div.paging > a.next')

#         if paging:
#             paging.click()
#             sleep(1)
#             all_data.extend(collect_festival_data())
#         else:
#             break

driver = webdriver.Chrome()

# fesivalList 주소이름이 festivalView.jsp


# pageList = driver.find_elements(By.CSS_SELECTOR, 'div.paging.pc > a')

url_start = 'https://www.mcst.go.kr/kor/s_culture/festival/festivalList.jsp?pSeq=&pRo=&pCurrentPage='
url_end = '&pOrder=01down&pPeriod=&fromDt=20230101&toDt=20231231&pSido=&pSearchType=01&pSearchWord=#searchOrder'


dataList = []
# 한번에 하면 코드가 멈춰버려서 수동으로 범위제한
for i in range(1, 2):  
    page = str(i)
    url = url_start + page + url_end
    driver.get(url)
    festivalList = driver.find_elements(By.CSS_SELECTOR, 'a.go')
    for festival in festivalList:
        festival.click()
        # print(driver.current_url)
        dtList = driver.find_elements(By.CSS_SELECTOR, 'dt')
        ddList = driver.find_elements(By.CSS_SELECTOR, 'dd')
        fes_title = driver.find_element(By.CSS_SELECTOR, '#content > .contentWrap > .viewWarp > .view_title')

        data = {}   #dictionary
        
        data["title"] = fes_title.text
        for i in range(len(dtList)):
            dt = dtList[i]
            dd = ddList[i-1]
            data[dt.text] = dd.text
            
        dataList.append(data)
        driver.back()
        input()
    
f = open('festival.json', 'w', -1, 'utf-8')
json.dump(dataList, f, indent=4, ensure_ascii=False)

# input()



