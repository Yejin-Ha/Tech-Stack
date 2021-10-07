# View
- 함수 기반 View
- 클래스 기반 View


# Templates
- Template 요청 방법
    - **render()** 
        - view에서 template에 처리결과(값들)를 전달할 수 있다.
        - view에서 **DB의 값을 변경한 경우 새로 고침하면 다시 적용**되는 문제가 있다.
    - **redirect()** 
        - view에서 template에 값을 전달할 수 없다.
        - DB의 값을 변경한 경우 **새로 고침해도 다시 적용되지 않는다.**
    - 차이점
        - render는 같은 app으로 template 이동
        - redirect는 다른 app으로 template 이동
- 문법
    - 주석
        ```html
        <!-- 한줄 주석 -->
        {# 주석 내용 #}  

        <!-- 여러 줄 주석 -->
        {% comment %}
        주석 내용
        {% endcomment %}
        ```
        - html 주석(<!--  --! >) 은 사용자의 화면에 보이지만 장고 주석은 화면에 출력되지 않는다.
    - template 변수
        - 변수의 값을 출력한다.
        - 구문: {{변수}}
    - template 필터
        - 템플릿 변수의 값을 특정 형식으로 변환(처리)한다.
        - 변수와 필터를 |를 사용하여 연결한다.
        - {{변수 | 필터}}
        - {{변수 | 필터:argument}}
    - template 태그
        - template에서 python 구문을 작성
        - 구문 : {% 태그 %}
        ```html
        <!-- for in 문 -->
        {% for x in list %}
            반복구문
        {% empty %}
            list가 비어있는 경우
        {% endfor %}

        <!-- 조건문 -->
        {% if 조건 %}
            조건문에는 boolean 연산자가 들어간다.
            논리 연산자로 and, or, not을 사용한다.
        {% elif %}
        {% else %}
        {% endif %}
        ```
