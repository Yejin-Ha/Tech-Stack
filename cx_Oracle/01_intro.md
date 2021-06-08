# python, Oracle DB 연동 준비 과정
1. Oracle DB 설치 및 진행
2. python 개발 환경 구축
    - db 벤더사가 제공하기 때문에 다 다르다.
    > anaconda 설치<br>
    > 접속 db에 종속적인 driver 설치(*)
3. python 코드로 db 연동 확인

<br>
<br>

# 설치 명령어
1. 다음의 명령어를 통해 python 연동 oracle driver 설치 여부 확인
    ```
    pip list 
    conda list
    ```
2. cx_Oracle 설치
    ```
    pip install cx_Oracle
    conda install cx_Oracle
    ```
3. python 기반의 db 연동 개발 단계
    - 1단계 : oracle 접속
        - db의 ip/id/pw/개별 db별 별칭(DB service name(dsn))/port
        - 로컬 시스템에서 축약된 표현 : id/pw/dns
            > 다음의 id/pw/dsn 을 통해 연동을 진행하였다.<br>
            > SCOTT/TIGER/XE<br>
            > hr/hr/XE

    - 2단계 : 접속된 DB에 SQL 문장 실행

    - 3단계 : 실행된 SQL 문장 결과값을 활용

    - 4단계 : 사용했던 자원들 반납
        - 모든 USER들이 기본적으로 지켜야 할 매너(로그아웃 필수)
        - 자원 반납 안할 경우에 사용 안하는 DB 접속 기능의 객체들이 쓰레기 상태로 메모리에 잔존

<br>
<br>

# 개발시 고려 사항
- import cx_Oracle 을 통해 driver를 로딩해야 한다.
- connection 객체 생성 
    - 다수의 user가 공유하는 것은 논리적으로 맞지 않아서 주의하기
- connection 객체를 통해 sql문장이 실행 가능한 cursor 생성
- cursor를 통해 sql문장 실행
    - cursor 란 : Oracle 서버에서 할당한 전용 메모리 영역에 대한 포인터
    - 검색된 데이터의 위치를 cursor에 저장한다.
- cursor를 통해 데이터 활용
- 자원 반환(close() 메소드 활용)
    - skip 불가능

- 함수와 독립적으로 개별 구현 가능한 로직
- driver 외에는 전역에서 실행할 수 없다.
