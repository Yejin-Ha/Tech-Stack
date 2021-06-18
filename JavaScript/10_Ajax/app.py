from flask import Flask, request, render_template
from dao import EmpDAO

# 웹상에서 서비스할 수 있는 python 객체를 생성한다는 의미
app = Flask(__name__)

# 기본 경로 설정
@app.route("/", methods=['get'])
def get():
    print('get')
    return render_template('reqres.html')

@app.route('/getdata', methods=['get'])
def getdata():
    print('getdata')
    return '{"name":"재석", "age":49}'

@app.route('/getemp', methods=['post'])
def getemp():
    empno = request.form.get('empno')
    print(empno)

    dao = EmpDAO()  
    data = dao.empone(empno) 
    return data

# flask를 실행하는 부분
if __name__ == "__main__":
    app.run(debug=True, port="5000", host="127.0.0.1")
