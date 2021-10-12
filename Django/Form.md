# Form
- 주요 역할
  - HTML의 입력폼 생성

- Django Form 처리 방식
  - 하나의 URL로 입력폼 제공과 폼 처리를 같이 한다.
    - GET 방식 요청 : 입력폼을 보여준다.
    - POST 방식 요청
      - 입력폼을 받아 유효성 검증을 한다.
      - 유효성 검증 성공 : 해당 데이터를 모델로 저장하고 SUCCESS_URL로 redirect 방식으로 이동
      - 유효성 검증 실패 : 오류 메세지와 함께 입력폼을 다시 보여둔다.(render()를 통해 이동)

## Form 클래스 정의
- 구현
  - app/forms.py(모듈)에 구현한다.
  - FormField 클래스
    - Model의 Fields들과 유사
      - Model Field : Database컬럼들과 유사
      - Form Field : HTML 입력폼과 유사
      - 