# Pycharm을 이용한 Django 프로젝트
1. `New Project` 버튼을 통해 새로운 프로젝트(DjangoProject)를 생성한다.


2. `Setting - Project: DjangoProject - Python Interpreter`로 들어가서 가상환경을 생성한다.
    - 톱니바퀴 버튼을 통해 새로운 가상환경 생성 가능

3. pip와 setuptool을 최신버전으로 업그레이드한다.
    ```
    python -m pip install --upgrade pip
    pip install --upgrade setuptools
    ```
    
4. Django를 설치하고 연결한다.
    - Django 설치
    ```
    pip install Django
    <!-- 원하는 버전이 있다면 다음과 같이 입력한다. -->
    pip install Django=원하는버전
    ```
    - 연결하기
        - `Setting - Project: DjangoProject - Python Interpreter` 로 들어가서 Django가 없다면 `+` 버튼을 누르고 Django를 입력 후 연결한다.

5. Django 프로젝트 생성
    ```
    django-admin startproject <프로젝트 이름(디렉토리명)>
    ```
    - 안되는 프로젝트명도 있던데 이건 구분이 있나? test는 안되고 config, temp, website 등은 다 되더라.. test만 안되나 으잉

6. Django Application 생성
    - 생성한 디렉토리로 이동한다.
    ```
    cd <프로젝트 이름>
    ```
    - application 생성하기
    ```
    python manage.py startapp <App 명>
    ```
    - 실행하기
    ```
    python manage.py runserver
    ```

## Django 특징
- MVT 패턴 구조의 개발
    - Model, View, Template
- ORM을 이용한 database 연동
- 자동으로 구성되는 관리자 기능
- 유연한 url 설계 지원
- 화면 구성을 위한 template system 제공

## VSC
- VSC에서 가상환경 들어가는 방법
    - f1(명령팔레트)을 누른 후 python : select interpreter 를 통해 가상환경을 설정할 수 있다.
- 터미널 단축키
    - ctrl + `

- 프로젝트 생성
    ```
    django-admin startproject config .
    ```
    - config 디렉토리와 manage.py가 생긴다.
- app 생성
    ```
    python manage.py startapp exam
    ```
- 설정 변경
    - config/settings.py
    - 생성한 app 등록
        - INSTALLED_APPS 에 생성한 APP 이름을 문자열로 등록
        - LANGUAGE_CODE = 'ko-kr'
        - TIME_ZONE = 'Asia/Seoul'
- Database에 기본 테이블을 생성
    - python manage.py migrate
- 관리자 계정 생성
    - python manage.py createsuperuser
        - 사용자 이름 : root
        - 이메일 주소 : 적당히 넣기(형식은 맞아야 한다.)
            - a@a.com
        - password : 1111
- 서버 실행
    - python manage.py runserver
- 서버 종료
    - ctrl + c
--------------------

## 코드 작성
- config/url.py
    - exam app에 접근하는 url 패턴을 등록
- exam/urls.py 파일 생성
- exam/views.py -> view 코드를 작성

