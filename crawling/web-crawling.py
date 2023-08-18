# 3_네이버뉴스검색.py

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

url = 'https://www.naver.com'

driver = webdriver.Chrome()
driver.get(url)

query = driver.find_element(By.ID, 'query')
query.send_keys(input('네이버 뉴스 검색어 입력 : '))
query.send_keys(Keys.ENTER)

driver.set_window_position(1920, 100)
driver.maximize_window()

tabList = driver.find_elements(By.CSS_SELECTOR, '#lnb ul > li > a')

newsTab = ''
for tab in tabList:
    # print(tab.text.strip('\n'))
    if tab.text == '뉴스':
        newsTab = tab
        break

if newsTab != '':
    newsTab.click()
    
    linkList = driver.find_elements(
        By.CSS_SELECTOR,
        'ul.list_news > li.bx a.info:not(.press)'
        # a태그 중에서 클래스가 info인데 클래스가 press가 아닌 요소
    )

    newsList = []

    for link in linkList:
        link.click()    # 링크를 클릭했을 때 새 탭에서 열린다
                        # selenium은 첫번째 탭을 주시하고 있는 상태이다

        firstTab = driver.window_handles[0]
        secondTab = driver.window_handles[-1]

        # 두번째 탭으로 전환(switch)하고 나서 원하는 요소를 찾아야 한다
        driver.switch_to.window(window_name=secondTab)
        # print(driver.current_url)

        # 연예 파트는 다르게 처리하기 위해서 if ~ else 로 구분하기
        if 'entertain' in driver.current_url:
            title = driver.find_element(By.CSS_SELECTOR, 'h2.end_tit').text
            category = '연예'
            content = driver.find_element(By.ID, 'articeBody').text
            press = driver.find_element(By.CSS_SELECTOR, 'div.press_logo > a > img')
            press = press.get_attribute('title')

        elif 'sports' in driver.current_url:
            title = driver.find_element(By.CSS_SELECTOR, 'h4.title').text
            category = '스포츠'
            content = driver.find_element(By.ID, 'newsEndContents').text
            press = driver.find_element(By.CSS_SELECTOR, 'span#pressLogo > a > img')
            press = press.get_attribute('alt')

        else:
            title = driver.find_element(By.CSS_SELECTOR, 'div.media_end_head_title').text
            category = driver.find_element(By.CSS_SELECTOR, 'li.Nlist_item._LNB_ITEM.is_active').text
            content = driver.find_element(By.ID, 'dic_area').text
            press = driver.find_element(By.CSS_SELECTOR, '#ct a > img')
            press = press.get_attribute('title')
            # HTML요소의 title 속성은 마우스를 올렸을 때 툴팁이 뜨는 내용이다
            
        news = {
            'category' : category,
            'title' : title,
            'press' : press,
            'content' : content,
        }
        newsList.append(news)

        # 두번째 탭에서 작업이 끝나면 현재 탭을 닫은 후, 이전 탭으로 돌아가야 한다
        driver.close()
        driver.switch_to.window(window_name=firstTab)

    print(len(newsList), '개의 뉴스를 수집했습니다')
    for news in newsList:
        print(news['title'])
        print(news['content'][:50])

else:
    print('관련 뉴스가 없습니다')


# input('엔터키를 누르면 계속합니다')
driver.quit()   # 열려있는 모든 탭 종료 (브라우저 종료)

'''
1) 네이버 메인 페이지에서 검색어를 입력받아서 일반 검색으로 진입
2) 검색 페이지에서 상단의 탭 중에서 text가 뉴스인 항목을 클릭
3) 최대 10개의 뉴스를 찾을 수 있고, 링크는 '네이버뉴스' 링크를 클릭
4) 네이버뉴스 링크는 새탭에서 열리게 되어있음
5) news.naver.com 에서는 [정치,경제,사회,문화,생활과학,IT,세계]가 있음
6) entertain.naver.com 에서는 [연예] 뉴스가 있음
7) 5번과 6번의 뉴스 형식이 다르기때문에 다른 방식으로 접근해야 함
8) 항상 10개의 뉴스가 나오는것은 아니므로, 결과가 아예 없으면 중단해야함
9) 검색된 뉴스의 카테고리, 제목, 내용을 구별하여 list + dict형식으로 저장
10) 내용을 출력할 때는 길이를 100자까지만 출력하기
'''