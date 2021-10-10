# Class 기반 View
- view의 각 기능을 클래스로 작성한다.
- 장점
    - 클래스로 구현하므로 객체지향 프로그래밍의 장점을 누릴 수 있다. 특히 반복적인 코드들은 상속을 이용해 효율적으로 작성할 수 있다.
    - 장고에서 제공하는 Generic View를 상속받아 구현할 경우 아주 적은 코드로 view를 작서앟ㄹ 수 있다.
- 단점
    - Generic View는 추상화가 많이 되어 있어 간편한 대신 커스터마이징 하기가 어렵다.
        - 커스터마이징은 Method overriding을 이용해 할 수 있다. 그래서 그 구조를 잘 알지 못하면 어렵다.

- Generic View
    - django.views.generic 모듈에 정의되어 있다.
    - View 개발 과정에서 자주 사용되는 기능들을 추상화하여 미리 구현해 제공해 주는 클래스
    - 제공하는 기능에 따라 다양한 Generic View를 제공한다.
    - View 클래스를 구현할 때 Generic View를 상속받아 구현한다.
        - 기본 기능은 상속받아 사용한다.
        - 커스터마이징 할 부분은 설정은 지정된 변수에 대입하고, 동작은 Method Overriding(재정의)을 통해서 재정의한다.

## Generic View
- Base View
    - view들의 가장 기본 기능들을 구현해 제공하는 view
    - view: 모든 view들의 최상위 view
    - templateView : 설정된 template으로 rendering하는 view
    - redirectView : 주어진 URL로 redirect 방식 이동 처리 하는 view
- Generic Display View
    - model을 이용해 조회한 결과(사용자가 요청한 데이터)를 리스트로 보여주거나 상세 페이지로 보여주는 View들
    - ListVeiw : 조회한 모델 객체 목록을 보여주는 view
        - 목록페이지
    - DetailView : 조회한 하나의 모델 객체를 보여주는 view
        - 상세 페이지
- Generic Edit View
    - 요청 파라미터로 전달된 값들을 이용해 Model을 생성(insert), 수정(update), 삭제(delete)하는 view들
    - FormView : HTML 입력 폼(Form Data) 관련 처리 기능을 제공하는 view
        - template에 입력 form을 만들고 그 form에서 사용자가 입력해 전송한 요청 파라미터 처리
        - validation(입력데이터 검증)과 처리(저장/변경/삭제)를 지원한다.
    - CreateView : 입력 폼을 만들고 그 폼에서 전송된 값을 등록(insert) 처리
    - UpdateView : 수정 폼을 만들고 그 폼에서 전송된 값으로 변경(update) 처리
    - DeleteView : 삭제를 위한 폼을 만들고 그 폼에서 요청한 데이터를 삭제(delete) 처리
