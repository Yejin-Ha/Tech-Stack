# Class
```java
public class ClassApp {
    public static void main(String[] args) {
        // PI는 Math class에 속한 변수로 다음과 같이 호출할 수 있다.
        System.out.println(Math.PI);

        // floor, ceil는 Math class에 속한 메소드로 다음과 같이 호출할 수 있다.
        System.out.println(Math.floor(1.6));
        System.out.println(Math.ceil(1.6));
    }
}

```

# Instance
```java
import java.io.PrintWriter;

public class InstanceApp {
    public static void main(String[] args) {
        // p1이라는 PrintWriter 인스턴스를 생성한다.
        PrintWriter p1 = new PrintWriter("result.txt");
        // class명 instance명 = new class명(변수);
        p1.write("Hello 1");
        p1.close();
        
        // p2이라는 PrintWriter 인스턴스를 생성한다.
        PrintWriter p2 = new PrintWriter("result2.txt");
        p2.write("Hello 2");
        p2.close();
    }
}
```
### 한번만 사용한다면 class의 method로, 여러번 사용한다면 instance로 생성하는 것을 추천한다.