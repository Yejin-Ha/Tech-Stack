# Module 모듈
### 1. 함수나 변수들을 모아 놓은 library를 의미
    - 외부 lbrary들 사용하는 방법
    - 외부에 내 코드를 공유하는 방법
### 2. 모듈 사용 방법 
    - 모듈의 파일 확장자 : py
    - 모듈 사용 문법
        a. import file명
        b. from file명 import 함수명
        c. import file명 as 별명
        ```python
        # a
        import mymath
        # b
        from mymath import add
        #c
        import mymath as mth
        ```

```python
%%writefile file명.py
<-- 코드 블럭 -->
# 코드를 file명.py로 저장하는 방법
```