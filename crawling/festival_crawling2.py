from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from time import sleep

import json


def getFestivalData(pCurrentPage):
    url = 'https://www.mcst.go.kr/kor/s_culture/festival/festivalList.jsp?'
    param = {
        'fromDt' : '20230101',
        'toDt' : '20231231',
        'pSearchType' : '01',
        'pOrder' : '01up',
    }
    for key in param:
        url += f'{key}={param[key]}&'

    url += 'pCurrentPage=' + pCurrentPage

    driver.get(url)
    driver.maximize_window()

    dataList = []
    goList = driver.find_elements(By.CSS_SELECTOR, 'a.go')
    for link in goList:
        link.click()

        dtList = driver.find_elements(By.CSS_SELECTOR, 'dt')
        ddList = driver.find_elements(By.CSS_SELECTOR, 'dd.full')

        data = {}vs
        data['title'] = driver.find_element(By.CSS_SELECTOR, 'div.view_title').text
        for dt, dd in zip(dtList, ddList):
            data[dt.text] = dd.text
        dataList.append(data)
        # input()
        # sleep(1)
        driver.implicitly_wait(3)
        driver.back()
    return dataList

options = webdriver.ChromeOptions()
options.add_argument('headless')

driver = webdriver.Chrome(options=options)
result = []

start = 1
last = 5

for i in range(start, last + 1):
    result += getFestivalData(str(i))
print(len(result))
        

f = open('23.json', 'w', 1024, 'utf-8')
json.dump(result, f, ensure_ascii=False, indent=4)