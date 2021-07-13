## ELK 설치
- 다운로드
- 압축해제
- 디렉토리 이름 축소
    - ElasticSearch(ES) bin/elasticsearch.bat 실행
- 브라우저로 접속 확인 http://localhost:9200
    - 버전, 실행되는 pc의 이름...

- Kibana bin/Kibana.bat 실행
    - 오랜시간 대기하면서 실행
    - ES가 실행된 상태여야만 정상 실행
    - http://localhost:5601 접속 -> Dev Tools에서 crud
<br>
<br>

## 두 솔루션의 구동 원리
1. json 형식으로 저장
  - 저장 작업은 Kibana에서 한다.
  - 저장은 ElasticSearch(ES)에 저장
2. postman으로 crud 작업식 url
  - http://127.0.0.1:9200
<br>
<br>

## JSON 저장 구조
1. REST API 관점에서 crud
    ```
    POST hello_index/_doc/1  : 방식 table명/_doc/데이터구분을위한pk
    {                       : json 포멧의 데이터 구조
    "message" : "힙합", : message ky로 힙합 저장 및 수정 의미
    "name" : "NAS"
    }
    ```
2. postman 사용시 정보 구성에 있어서 json 포멧 설정 필수
<br>
<br>

## 모르고 하는 CRUD
1. 제공 데이터
    - json 문법이 ok이기 때문에 한번에 데이터를 구분없이 저장하게 되는 구조
        ```
        {"employees":[
            { "firstName":"John", "lastName":"Doe" },
            { "firstName":"Anna", "lastName":"Smith" },
            { "firstName":"Peter", "lastName":"Jones" }
        ]}
        ```
    1. 저장 -> 검색 -> 수정 -> 검색 -> 삭제 -> 검색
    2. 해결해 나가는 방식에 대한 연구
        - 실행 불가? 에러 메시지 확인
        - 방법 모색
    3. 강사님 제공
        ```
        POST _bulk
        { "index" : { "_index" : "employees", "_id" : "1" } }
        { "firstName":"John", "lastName":"Doe" }
        { "index" : { "_index" : "employees", "_id" : "2" } }
        { "firstName":"Anna", "lastName":"Smith" }
        { "index" : { "_index" : "employees", "_id" : "3" } }
        { "firstName":"Peter", "lastName":"Jones" }
        GET employees
        GET employees/_search/?q=Smith
        ```
       - ES : 대용량 데이터를 빠르게 검색 활용 가능하게 해주는 엔진이 이미 내장
       - 대용량 데이터는 사용자들이 crud
       - 해당 문법은 json 포멧이기만 하면 다 허용(정형 구조가 아님)
       - 단 db의 sql 처럼 es에서도 명확하게 구분
           - es 자체적인 문법 학습
           - REST API로 구현된 구조(Rest full application) 
       - 대용량 데이터를 한번에 여러가지를 es에 저장하기 위한 문법
       - _bulk : 다량의 데이터 활용 표현
        ```
        POST _bulk

            "_index" : "employees" : table명이 employees
            "_id" : "1" : id라는 컬럼에 pk값으로 1저장 의미
                        _id es에서 중복되지 않는 데이터 컬럼 의미

            index라는 key로 table과 id값 설정
            하나의 row값을 설정
            "index" : { "_index" : "table명", "_id" : "
        ```

2. ES 특징
    - 작업 절차
        1. 문법 오류가 없는 데이터만 저장
            - table 이라는 index가 생성
            - 각 데이터에 적합한 field의 타입이 자동 적용
            - 저장 데이터 하나의 row로 자동 저장

        2. 초반 table 생성처럼 각 field 별로 타입 지정후에 데이터 저장
            - RDBMS 특징 : table 생성 직후에만 데이터 저장
<br>
<br>

## review : 사용 tool
1. kibana dev tool
   - 자동 완성 기능 사용 필수
2. postman
3. head - 크롭의 확장 plugin
   - 실시간 데이터 확인 및 활용 권장
4. curl : 도스 창 명령어로 crud 작업 가능함을 보여주기만 함
