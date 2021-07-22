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
- text type : 띄어쓰기를 기준으로 단어를 구분한다.
- keyword type : 전체를 하나의 단어로 인식한다.(띄어쓰기가 포함되어도 하나로 인식한다.)
- 다음은 text type과 keyword type의 차이를 보여주는 예시이다.
  ```
  <!-- data1은 text type, data2는 keyword type으로 설정한다. -->
  PUT string_index
  {
  "mappings": {
    "properties": {
      "data1" : {
        "type": "text"
      },
      "data2" : {
        "type": "keyword"
        }
      }
    }
  }

  <!-- 동일한 데이터 insert -->
  POST string_index/_doc/1
  {
    "data1":"pink red blue",
    "data2":"pink red blue"
  }

  <!-- data1은 text라서 term단위로 구분되기 때문에 검색 결과가 나온다. -->
  GET string_index/_search
  {
    "query": {
      "match": {
        "data1": "pink"
      }
    }
  }

  <!-- data2는 keyword이기 때문에 term 단위로 구분되지 않아서 pink를 검색하면 데이터가 나오지 않는다. -->
  GET string_index/_search
  {
    "query": {
      "match": {
        "data2": "pink"
      }
    }
  }
  ```


## 다중 field에서 데이터 검색
- multi_match : 여러개의 field를 대상으로 데이터를 검색하는 명령어
  - "query" : 찾을 데이터
  - "fields" : list형식의 field 이름들
```
<!-- movieNm, movieNmEn field에서 family 데이터를 검색 -->
GET movie_search/_search
{
  "query": {
    "multi_match": {
      "query": "family",
      "fields": ["movieNm", "movieNmEn"]
    }
  }
}
```

## prefix query
- 데이터가 일치하거나 포함된 모든 데이터를 검색한다.
```
<!-- '살아남'과 일치하거나 살아남이 포함된 모든 데이터 검색(ex. 살아남은 아이) -->
GET movie_search/_search
{
  "query": {
    "prefix": {
      "movieNm": {
        "value": "살아남"
      }
    }
  }
}
```

## 특정 field의 값 검색
- index 전체에서 원하는 field의 내용을 검색하기
  - "_source" 이용
  - "exists" 를 통해서 값이 존재하는 데이터만 출력 가능하다.
```
<!-- index 전체에서 openDt의 데이터를 5개만 출력한다. -->
GET movie_search/_search
{
  "_source": "openDt",
  "size": 5
}

<!-- openDt의 null이 아닌 데이터만 검색 -->
GET movie_search/_search
{
  "_source": "openDt",
  "query": {
    "exists": {
      "field": "openDt"
    }
  }
}
```

## 원하는 단어 검색하기
- 다음의 문자들로 다양한 검색이 가능하다.
  - "wildcard" 를 통해 검색이 가능하다. 
     - * : 0 ~ 무한대
     - + : 1 ~ 무한대
     - ? : 없거나 하나이거나
```
GET movie_search/_search
{
  "query": {
    "wildcard": {
      "typeNm": {
        "value": "장*"    <!-- typeNm의 value가 장으로 시작하는 데이터를 검색 --!>
        or
        "value": "장?"    <!-- typeNm의 value가 장_인 데이터 검색 --!>
        or
        "value": "장??"   <!-- typeNm의 value가 장__인 데이터 검색 --!>
      }
    }
  }
}
```






