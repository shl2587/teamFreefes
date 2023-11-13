# freefes

## 참여 인원
  - 한승록 외 4명

## 1. 프로젝트 개요
<strong>1) Back-end</strong>

![image](https://github.com/shl2587/teamFreefes/assets/127282898/320cf1c6-8faf-4e45-832b-bd64bfc1c20b)

<strong>2) Front-end</strong>
![image](https://github.com/shl2587/teamFreefes/assets/127282898/a81423f9-36ed-438d-ae19-734d36a3e846)

<strong>3) Spring 라이브러리</strong>
![image](https://github.com/shl2587/teamFreefes/assets/127282898/a95a3234-98a6-4723-8a1f-34248707b56a)

<strong>4) DataBase 테이블</strong>
![image](https://github.com/shl2587/teamFreefes/assets/127282898/6b21a9d1-8ed2-4157-b6a2-b2955e688a25)

    
## 2. 사용된 주요 기술
<div style="font-size:1.5em">
    1) 구현 기능 </p>
<ul>
    <li>DB구축</li>
        - Crawling 기술 사용
    <li>게시판</li>
        - select를 통한 DB불러오기
          <p>-> 조건 설정을 하면 해당 조건에 대한 DB만 불러옴</p>
</ul>
</div>

![image](https://github.com/shl2587/teamFreefes/assets/127282898/bdf0aa76-517f-4823-b893-6e55677c9a37)

<br><br>

<div style="font-size:1.5em">
<ul>
    <li>페이징</li>
        - 한 페이지당 10개씩 10페이지씩 불러옴
</ul>
</div>

![image](https://github.com/shl2587/teamFreefes/assets/127282898/be2b4ad5-7693-4fcd-bee9-87bc882ec576)

<br><br>

<div style="font-size:1.5em">
<ul>
    <li>검색</li>
        <p>- 조건 설정을 통한 검색</p>
        - Ajax를 통한 페이지 전환 없이 검색 가능
</ul>
</div>

![image](https://github.com/shl2587/teamFreefes/assets/127282898/c9ba93ab-dfc8-45de-b172-f4d90afc0c9b)

<br><br>

<div style="font-size:1.5em">
<ul>
    <li>즐겨찾기</li>
        - Ajax를 통해 페이지 전환 없이 즐겨찾기 가능
          <p>-> 해당 버튼을 클릭하게 되면 비동기 통신으로 DB에 기록되고 삭제
          -> 로그인 하지 않으면 로그인 페이지로 이동
</ul>
</div>

![image](https://github.com/shl2587/teamFreefes/assets/127282898/65be7f10-d916-4cf9-996c-b9eb8b8cb16a)



## 3. 구현 기능 상세 설명
    
