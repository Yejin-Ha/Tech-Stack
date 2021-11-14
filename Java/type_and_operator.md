- Type
    ```java
    System.out.println(3); // Number
    System.out.println("Hello"); // String 문자열
    System.out.println('H'); // Character 문자(1개)
    System.out.println("H"); // String 문자 1개여도 ""이면 Stirng 이다.

    System.out.println("Hello" + "World"); // 문자열 합치기
    System.out.println("Hello \"World\""); // escape
    ```
    - 문자열 관련 메소드
        - length() : 길이 확인 메소드
        - replace(a, b) : a를 b로 교환한다
        ```java
        System.out.println("Hello World".length());
        System.out.println("Hello, [[name]] ..bye".replace("[[name]]", "Yejin"));
        ```
- Operator
    - **Math**를 통해 다양한 연산을 사용 가능하다.
    ```java
    Math.PI // 3.1415926535897
    Math.floor(Math.PI) // 내림
    Math.ceil(Math.PI) // 올림

    ```
