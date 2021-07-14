## test index생성 및 doc를 id 1에 저장 
- 데이터에 따라 field의 속성을 자동으로 설정한다.
- **POST** test/**_doc/1**<br>
  { 저장할 데이터들(json 형식)}

## test index에서 id가 1인 doc 검색
- **GET** test/_doc/1

## id가 1인 데이터 삭제
- **DELETE** test/_doc/1

## 다량의 데이터 한번에 삽입/업데이트 하기
- POST **_bulk**<br>
  { "index" : { "_index" : "test", "_id" : "1" } }
  { "firstName":"John" }
  { "index" : { "_index" : "test", "_id" : "2" } }
  { "firstName":"Anna" }

## F, M값을 보유한 doc 검색
- GET test/**_search/?q=F**
- GET test/**_search/?q=M**

## gender가 M인 데이터 검색
- match : or 역할을 한다.
- GET account/**_search**<br>
{<br>
&nbsp;&nbsp;**"query"**: {<br>
&nbsp;&nbsp;&nbsp;&nbsp;**"match"**: {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"gender": "M"<br>
&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;}<br>
  }

## index 분석
```
<!-- desc my_index -->
GET my_index
```

## index 전체 doc 검색
```
<!-- select * from my_index -->
GET my_index/_search
```

## index에서 검색할 term 사이의 개수 설정하기
- slop : pink와 red 사이에 단어가 0 or 1개인 모든 doc 검색
- match_phrase : AND 역할을 하는 명령어, slop와 같이 사용해야 한다.
  - match_phrase를 사용하지만 slop를 따로 설정하지 않으면 기본값인 0이 설정된다.
```
GET my_index/_search
{
    "query": {
        "match_phrase": {
            "message": {
                "query": "pink red",
                "slop": 1
            }
        }
    }
}
```

## Boolean query
- must : 다음의 쿼리가 참인 doc를 검색
- must_not : 쿼리가 거짓인 도큐먼트를 검색
- should : 검색 결과 중 쿼리에 해당하는 도큐먼트의 점수(score)를 높인다.
- filter : 쿼리가 참인 doc를 검색하지만 should처럼 점수를 높이지 않고 그대로 출력한다.
  - must보다 검색 속도가 빠르다.
```
<!-- 쿼리1에 해당하지만 쿼리2에는 거짓인 doc 중 쿼리3에 참이라면 score를 높이고 쿼리4에 참이라면 score를 높이지 않는다. -->
GET my_index/_search
{
  "query": {
    "bool": {
      "must": [
        { <쿼리1> }, …
      ],
      "must_not": [
        { <쿼리2> }, …
      ],
      "should": [
        { <쿼리3> }, …
      ],
      "filter": [
        { <쿼리4> }, …
      ]
    }
  }
}
```

## Range query
- gte[greater than or equal] - 이상
- gt[greater than] - 초과
- lte[Less than or equal] - 이하
- lt[less than] - 미만
```
<!-- account index에서 age 데이터가 20이상 30 이하인 doc 검색 -->
GET account/_search
{
  "query": {
    "range": {
      "age": {
        "gte": 20,
        "lte": 30
      }
    }
  }
}
```

## index 구조 설정하고 데이터 넣는 방법
- movieCd field의 type은 keyword이다.
- directors field의 peopleNm property의 type은 keyword이다.
  - directors.peopleNm 으로 접근 가능하다. 
```
PUT movie_index
{
    "mappings": {
        "properties": {
            "movieCd": {
                "type": "keyword"
            },
            "movieNm": {
                "type": "text",
                "analyzer": "standard"
            }, 

            ...
            
            "directors": {
                "properties": {
                    "peopleNm": {
                        "type": "keyword"
                    }
                }
            }
        }
    }
}
```

## text와 keyword 구분
- text type : 
- keyword type : 
