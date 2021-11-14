# 변수 Variable
```java
public class Variable {
    public static void main(String[] args) {
        // 변수를 선언할 때는 앞에 type을 함께 선언한다.
        int a = 1; // Number -> integer

        double b = 1.1; // real number -> double (실수)
        
        String c = "YJ"; // String type 선언
        System.out.println("Hello, " + c + "..." + c + "...bye");

        // 형변환
        String d = Integer.toString(1);
        System.out.println(d); // 1이 출력된다.
        System.out.println(d.getClass()); // d의 data type 확인
    }
}
```
- 변수를 선언할 때는 타입을 함께 선언해야 한다.
- 변수는 값에 이름을 부여하는 것으로 직관적으로 이해할 수 있는 변수명을 갖는것을 추천한다.
- casting : 변수의 타입을 다른 타입으로 변환하는 것  