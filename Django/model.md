# Model
- ORM : 객체 관계 매핑
    - SQL문 없이 DB작업이 가능하다.
    - 장고는 SQL문을 직접 실행할 수 있지만 가능하면 ORM을 사용하는 것이 좋다.
- 장점 
    - 비지니스로직과 데이터베이스 로직을 분리할 수 있다.
    - 재사용성 유지보수성이 증가한다.
    - DBMS에 대한 종속성이 줄어든다.
- 단점
    - DBMS 고유의 기능을 사용할 수 없다.
    - DB의 관계가 복잡할 경우 난이도가 올라간다.

## Model 클래스의 Field 타입
- 문자열 타입
    - CharField, TextField
- 숫자 타입
    - IntegerField, PositiveIntegerField, FloatField
- 날짜 시간 타입
    - DateTimeField, DateField, TimeField
- 파일
    - FileField, ImageField
    - ImageField를 사용하기 위해서는 pillow 패키지를 설치해야 한다.
- 논리형 필드
    - BooleanField
- 모델 간의 관계
    - ForeignKey : 외래키 설정
    - ManyToMany : 다 대 다 관계 설정
    - OneToOneField : 1 대 1 관계 설정
- 기타
    - EmailField
    - URLField

## Model 클래스를 이용한 데이터 CRUD
- 전체 조회
    - model.**objects.all()**
- 조건 조회
    - **filter** : 조건에 만족하는 조회 결과를 **QuerySet**으로 반환
    - **exclude** : 조건에 만족하지 않는 조회 결과를 **QuerySet**으로 반환
        - 조회결과가 1개 이상일 때 사용.
        - 조회결과가 없으면 빈 QuerySet을 반환
    - **get** : 조건 파라미터를 만족하는 조회결과를 **Model** 객체로 반환

