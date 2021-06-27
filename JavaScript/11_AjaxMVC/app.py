from flask import Flask, request, render_template
from dao import EmpDAO
from dto import EmpDTO

app = Flask(__name__)


@app.route("/", methods=['get'])
def get():
    print('get')
    return render_template('index.html')


@app.route('/getdata', methods=['get'])
def getdata():
    print('getdata')
    return '{"name":"재석", "age":49}'


@app.route('/getemp', methods=['post'])
def getemp():
    return EmpDAO().empone(request.form.get('empno'))


@app.route('/insert', methods=['post'])
def insertemp():
    # empno=123&ename=asd&sal=1000
    dao = EmpDAO()
    dto = EmpDTO(request.form.get('empno'), request.form.get('ename'), request.form.get('sal'))
    print(dto)
    dao.empinsert(dto)
    return dao.empone(request.form.get('empno'))


if __name__ == "__main__":
    app.run(debug=True, port="5000", host="127.0.0.1")