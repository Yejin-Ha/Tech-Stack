### index(table)생성 및 데이터 저장
- hello_index라는 index(RDBMS에서는 table)에 id가 1인 document(RDBMS에선 row)에 데이터를 저장한다.
  ```
  POST hello_index/_doc/1
  {
    "message" : "힙합",
    "name" : "NAS"
  }
  ```

### select와 동일한 검색
- hello_index라는 index에서 id가 1인 document를 검색
  ```
  GET hello_index/_doc/1
  ```

### document의 데이터를 업데이트
- id가 1인 document의 데이터를 변경한다.
- 실행시 _version이 달라지는 것을 확인할 수 있다.
  ```
  PUT hello_index/_doc/1
  {
    "message": "하예진"
  }
  ```

### pk1 즉 id가 1인 데이터 삭제
  ```
  DELETE hello_index/_doc/1
  ```

### employees index에 다량의 데이터 한번에 삽입/업데이트 하기
- "index" : 데이터를 입력할 index의 정보와 id를 설정한다.
- { "firstName": ...} : 위에서 설정한 index에 
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

### account table 생성 및 데이터 저장
- id가 4인 경우 데이터 누락임에도 다른 데이터 정상 저장 
  ```
  POST _bulk
  {"index":{"_index":"account", "_id":"1"}}
  {"account_number":1,"balance":3926,"firstname":"Amber","lastname":"Duke","age":7,"gender":"M","address":"880 Holmes Lane","employer":"Pyrami","email":"amberduke@pyrami.com","city":"Brogan","state":"IL"}
  {"index":{"_index":"account", "_id":"2"}}
  {"account_number":2,"balance":5282,"firstname":"Hattie","lastname":"Bond","age":7,"gender":"M","address":"271 Bristol Street","employer":"Netagy","email":"hattiebond@netagy.com","city":"Dante","state":"TN"}
  {"index":{"_index":"account", "_id":"3"}}
  {"account_number":3,"balance":7838,"firstname":"Nanette","lastname":"Bates","age":28,"gender":"F","address":"789 Madison Street","employer":"Quility","email":"nanettebates@quility.com","city":"Nogal","state":"VA"}
  {"index":{"_index":"account", "_id":"4"}}
  ```

### F, M값을 보유하고 있는 데이터 검색
  ```
  GET account/_search/?q=F
  GET account/_search/?q=M
  ```

### gender가 M인 데이터 검색
  ```
  GET account/_search
  {
    "query": {
      "match": {
        "gender": "M"
      }
    }
  }

  GET account/_search/?q=gender:M
  ```

### gender가 M이고 state가 TN인 데이터 검색
  ```
  GET account/_search/?q=gender:M AND state:TN
  ```
