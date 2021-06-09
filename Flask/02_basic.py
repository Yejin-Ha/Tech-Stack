'''
flask와 flask-restx가 설치되어 있다는 가정에 다음을 실행할 수 있습니다.

# flask app을 직접 호출하는 방식
1. Flask 클래스와 Resource, Api 클래스 가져오기

2. Flask 클래스의 인스턴스 생성
    - 첫 번째 인수는 애플리케이션 모듈 또는 패키지의 이름
    - __name__은 모듈의 이름을 뜻한다.
    - 단일 모듈을 사용하는 경우 (__name__와 같이) 응용 프로그램으로 시작되었는지 또는 모듈로 가져 왔는지에 따라 이름이 달라 지므로 
        ('__main__'실제 가져 오기 이름과 비교) 사용해야 한다. 
    - Flask가 템플릿, 정적 파일 등을 찾을 위치를 알기 위해 필요하다.

3. Api 클래스에 flask 인스턴스를 매개변수로 넘긴다.
    - swagger doc 개발 API

4. route() 데코레이터를 통해 라우팅 경로를 지정한다.
    - URL의 ('/') 경로를 요청하면 하위에 기재된 코드를 실행하는 것
    - 이런식으로 경로를 설정하여 다른동작을 하게 하는것을 라우팅이라고 한다
    - <>안에 client가 입력한 값을 대입할 수 있다.



- client 가 요청시 정수값을 서버에 전송하게 되는 구조의 구성
- server 는 client가 전송하는 데이터 획득해서 활용
'''

# 다양한 클래스를 import
from flask import Flask
from flask_restx import Api, Resource

# 인스턴스 생성
app = Flask(__name__)
api = Api(app)

# 경로설정
# @api.route('/test')
@api.route('/test/<int:id_no>')     # 입력되는 정수값을 id_no로 받는 parameter 변수
class Test(Resource):
    # get방식의 요청을 처리하는 메소드
    def get(self, id_no):
        print('get --------------')
        return {"hello" : "world"}

    # post 방식의 요청을 처리하는 메소드
    def post(self, id_no):
        print('post ---------------')
        return {"hello":"post"}

if __name__ == '__main__':
    # port번호를 설정하여 local에서 실행시킨다.
    app.run(debug=True, host='127.0.0.1', port=80)


