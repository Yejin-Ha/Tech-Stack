## 1. Python
- 구글의 3대 개발 언어 중 하나로 채택되었다.
- 인터프리터 언어

- 프로그래밍 언어 실행방식에 따른 구분
  - 컴파일 언어 : 컴파일러가 번역
    - java, c, c++, c#
  - 인터프리터 언어 : 컴파일 없이 바로 번역 및 실행
    - python, javascript, R, Rupy
 
- 특징
  - 들여쓰기로 구분
  - 쉽게 라이브러리 추가가 가능
  - 문자열을 유니코드로 처리함으로 한글, 중국어, 영어 문제없이 처리
  - 기본적으로 UTF-8로 처리
  
- python shell
  - REPL = Read, Eval, Print loop


```javascript
python --version

# flask, django(web을 구현) + python을 같이 할 수 있는 사람을 많이 채용한다.
# swagger를 통해 개발자들이 소통한다. -> 사용할 줄 알아야 한다.
# window + E = 내문서
# window + R = 실행
```

- Encoding : 컴퓨터가 이해할 수 있는 숫자체계
- ASCII, Unicode
- 유니코드에서 한국어를 입력하려면 UTF-8을 사용해야된다.

- 한글 encoding
  - 완성형(EUC-KR)
  - 확장형(CP-949)
  - 사실상 둘은 동의어로 사용된다.
  - 모두 아스키코드와 호환된다.
  - 한글과 영어만 취급한다.
  - 유니코드(UTF-8)는 한국어 영어 중국어 등등을 포함한다.

- api = 

- 가상환경
  - conda create -n 가상환경 : 가상환경 생성
  - conda create -n 가상환경 python=3.6 : 3.6 버전의 python이 있는 가상환경 생성
  - conda activate 가상환경 : 생성된 가상환경으로 이동한다.
  