# 설치
```
# 다음 명령어로 flask의 설치 여부를 확인하고 install을 권장한다.
conda lisk

pip install flask
pip install flask-restx
```
<br><br>

## http 규약의 학습
1. 용도
    - web상에서 client(브라우저)와 server 통신 규약
2. 적용 영역
    - 모바일 앱 / pc 웹 사이트 등이 모두 다 http 프로토콜 기반의 서비스
3. 개발 관점
    - 대부분 개발 언어들은 http 프로토콜이 이미 잘 구현되어 있는 api(library)들을 상속받아 사용
    - 서비스 로직에 집중해서 개발할 수 있음
4. 필요 정보
    1. server의 ip(주소)
    2. 동일한 시스템에 여러 서버가 존재할 수 도 있음 따라서 port로 서버를 구분
        - 1 + 2 : ip상에는 여러개의 port번호가 존재할 수 있음
    3. 필수 학문
        - http 기반의 통신(요청 / 응답)
        - 요청 방식이 정해진 몇가지
            1. get 방식
                - 서버의 지원을 요청
                - client가 입력한 데이터를 주소줄에 오픈한 상태로 전송
                - 서버에서 사용할 데이터로만 소진
                - 보안 미 고려해도 되는 정보 또는 즐겨찾기용 page 구성시에 주로 사용

            2. post 방식
                - 새로운 데이터를 서버에 저장 요청
                - client가 입력한 데이터를 은닉해서 서버에 전송(서버는 그 해당 데이터를 서버에 저장)
                - 서버에 데이터 전송시에 web query string 값을 요청 body에 저장해서 전송

            3. put 방식
                - 이미 존재하는 데이터를 수정 요청(권장)

            4. delete 방식
                - 존재하는 자원 삭제 요청

            ...

5. url 요청 방식을 사용한 요청 방식 이해
    - url 값으로 직접 요청하는 것도 요청 방식이 이미 지정된 default 방식 사용
    - get 방식<br>
        `http://www.naver.com`<br>
        `http://www.google.com`<br>
        `http://www.daum.net `

6. url 구조
    - web query string이란?
        - client로 인해 서버에 전송되는 데이터 
        > ?key1=value1&key2=value2 ; 
    - 필요성
        - 화면 구성을 구분하기 위한 즐겨찾기용으로 최적인 방식<br>
        `http://ip:port/디렉토리명/../실행파일명.확장자?key1=value1&key2=value2`<br>
        `http://news.naver.com:80/main/read.nhn?mode=LSD&mid=shm&sid1=105&oid=277&aid=0004917217`





