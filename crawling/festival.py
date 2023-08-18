from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver import ActionChains
from time import sleep

driver = webdriver.Chrome()
driver.get('https://www.mcst.go.kr/kor/s_culture/festival/festivalList.jsp?pSeq=&pRo=&pCurrentPage=1&pOrder=01down&pPeriod=&fromDt=20230101&toDt=20231231&pSido=&pSearchType=01&pSearchWord=#searchOrder')

query = driver.find_element(By.ID, 'query')
query.send_keys('pSeq')

# fesivalList 주소이름이 festivalView.jsp
festivalList = driver.find_elements(By.CSS_SELECTOR, '#content > .mediaWrap > li > a')


view = ''
for clickView in festivalList:
    if clickView.text == 'festivalView':
        view = clickView
        break

if view != '':
    view.click()

    linkList = driver.find_elements(
        By.CSS_SELECTOR, 'ul.mediaWrap > dd'
    )

    fesList = []

    for link in linkList:
        link.click()

        firstClick = driver.window_handles[0]
        secondClick = driver.window_handles[-1]

        driver.switch_to.window(window_name=secondClick)

        title = driver.find_element(By.CSS_SELECTOR, 'div.view_title')
        region = driver.find_element(By.CSS_SELECTOR, 'dd.full')
        date = driver.find_element(By.CSS_SELECTOR, 'dt.view_title')
        category = driver.find_element(By.CSS_SELECTOR, 'div.view_title')
        url = driver.find_element(By.CSS_SELECTOR, 'div.view_title')
        place = driver.find_element(By.CSS_SELECTOR, 'div.view_title')
        price = driver.find_element(By.CSS_SELECTOR, 'div.view_title')
        time = driver.find_element(By.CSS_SELECTOR, 'div.view_title')
        agency = driver.find_element(By.CSS_SELECTOR, 'div.view_title')
        question = driver.find_element(By.CSS_SELECTOR, 'div.view_title')

        festival = {
            ''
        }
        fesList.append(festival)




