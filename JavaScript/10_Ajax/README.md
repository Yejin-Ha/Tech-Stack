# Ajax 폴더 구조
```bash
├── README.md           - 리드미 파일
│
├── static/             - css, script 파일들이 들어있는 폴더 
│   ├── js/             - javascript 파일이 들어있는 폴더
│      ├── emp.js       - reqres.html에 사용되는 js
├── templates/          - 템플릿 폴더
│   ├── reqres.html     - client가 요청시 보여지는 화면 html
├── app.js              - flask를 이용할 python 파일
└── dao.js              - DB에 접근하는 객체 파일
```

1. flask(app.js)를 이용하여 client에게 보여줄 기본 화면(reqres.html)을 기본 경로('/')로 설정한다.
2. client에게 값을 입력받아서 dao.py를 통해 db에 정보가 있는지를 확인한다.
3. db에서 정보를 찾고 flask(app.py)를 통해 화면(reqres.html)에 출력한다.
