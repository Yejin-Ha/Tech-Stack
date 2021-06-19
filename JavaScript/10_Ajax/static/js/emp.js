function myAjax() {
    // 비동기 통신 객체 생성
    const xhttp = new XMLHttpRequest();

    // 정상 응답이 된 경우에 한해서만 자동 실행되는 로직
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {   // 정상 응답 완료 여부 검증
            // this.responseTest : xml 포멧의 문자열을 제외한 서버가 응답한 모든 데이터를 받음
            data = this.responseText;
            //key로 value 사용 가능한 json 객체로 변환
            data = JSON.parse(data);

            document.getElementById("uname").value = data.name;
            document.getElementById("uage").value = data.age;
        }
    };
    //http://127.0.0.1:5000/reqres.html -> http://127.0.0.1:5000/getdata
    // 서버단에 요청하는 방식과 url 세팅
    xhttp.open("GET", "getdata");
    // 실제 요청 실행
    xhttp.send();
}

function myAjax2() {
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            data = this.responseText;
            data = JSON.parse(data);
            document.getElementById("ename").value = data.ename;
            document.getElementById("sal").value = data.sal;
        }
    };

    // POST방식인 경우 client가 전송하는 데이터들(web query string)들 key1=value1&key2=value2
    // send("key1=value1& ...")
    xhttp.open("POST", "getemp");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
    xhttp.send("empno=" + document.getElementById("empno").value); // "empno=value" -> empno를 식별자로 사용한다.
}
