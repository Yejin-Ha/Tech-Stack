# Class
객체를 사용하게 해주는 설계도
- 객체(Object) : 메모리에 사용 가능하게 생성된 데이터 집합
- 객체 지향 프로그램 방식의 주 목적 
- 클래스를 설계 후 데이터 표현을 위한 재사용
> 객체는 class를 통해서만 생성 가능함

<br>

- 변수
    1. 멤버 변수 : 클래스 영역에서 선언된 경우
        - 클래스 변수 : 객체를 통틀어 하나만 생성되고 `모든 객체가 공유`하는 변수
            ```python
            class Test:
                name = 'Yejin'      # name은 클래스 변수
            ```
        - 인스턴스 변수 : 인스턴스별로 별도로 생성되는 변수
            - self가 적용된 변수는 모두 instance 변수
            ```python
            def fun():
                name = 'Yejin'      # name은 인스턴스 변수
            ```
    2. private 변수
        - 외부에서 호출이 불가능한 변수
        - 유효성 로직 실행이 필수인 경우에 사용한다.
        - \_\_로 선언한다.
        - 권장사항 : private변수를 선언시 set/get 메소드도 추가로 구현하는 것을 권장함
        ```python
        class Test:
            def __init__(self, name):
                self.__name = name      # private 변수 선언
        ```
<br>
<br>

## 특별한 메소드
1. \_\_init\_\_
    - 생성자(객체 생성시 호출되는 기능)
    - 클래스 내에 멤버 변수를 선언할 때 사용된다.
    - 선언 문법 : self.변수명

2. \_\_del\_\_
    - 객체 삭제시 자동 호출되는 함수
    - 메모리에서 삭제하는 코드

3. \_\_str\_\_
    - print() 실행시 자동으로 실행되는 함수

4. \_\_len\_\_
    - 길이 반환 로직으로 재정의를 권장함

```python
class Book:
    def __init__(self, title, pages):
        self.title = title
        print('__init__ 메소드를 실행합니다.')

    def __del__(self):
        print('삭제합니다.')

    def __str__(self):
        return '책의 이름은 %s입니다.' % (self.title)

    def __len__(self):
        return self.pages

book = Test('python', 500)       # '__init__ 메소드를 실행합니다.' 가 출력된다.
print(book)        # '책의 이름은 python입니다.' 가 출력된다.
print(len(book))        # 500 이 출력된다. 
del book       # '삭제합니다.' 가 출력된다.
```
<br>
<br>

## 메소드 재정의(Overriding / Override)
이미 존재하는 메소드의 로직을 수정하는 방식
> ex. +( \_\_add__ ), ==( \_\_eq__ ), ... etc
```python
class SpecialMethod:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __add__(self, you):
        return SpecialMethod(self.x + you.x, self.y + you.y)

    def __eq__(self, you):
        return self.x == you.x and self.y == you.y

n1 = SpecialMethod(10, 20)
n2 = SpecialMethod(30, 40)

print(n1 + n2)      # (40, 60) 출력
print(n1 == n2)     # False 출력
```
<br>
<br>

# Class Inheritance(클래스 상속)
## 상속
코드의 재사용성을 위한 구조
이미 존재하는 클래스를 상속받아 새로운 자식 클래스 생성
- 상속 문법 
    - class 자식클래스명(부모클래스명)
    - 자식 생성자에서 부모 생성자 호출 - super().\_\_init__(인수)
    ```python
    class Parent:
        def __init__(self, name):
            self.name = name

    class Child(Parent):
        def __init__(self, name, age):
            super().__init__(name)  # Parent 클래스의 __init__ 함수를 재사용
            self.age = age
    ```
- 매소드 재정의
    ```python
    class Parent:
        def __init__(self, name):
            self.name = name
        
        def eat(self):
            print('부모 클래스')

    class Child(Parent):
        def __init__(self, name, age):
            super().__init__(name)  # Parent 클래스의 __init__ 함수를 재사용
            self.age = age

        # 부모 클래스의 eat()메소드를 자식 클래스에서 재정의한다.
        def eat(self):
            print('자식 클래스')
    ```
- 다형성 
    - 코드의 재사용성 및 간결성을 위함
    
