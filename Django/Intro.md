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
