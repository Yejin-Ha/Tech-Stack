# Input & Output
```java
// 모듈 불러오기
import javax.swing.JOptionpane;

public class InputOutput {
    public static void main(String[] args) {
        // java에서 값을 입력받기
        String id = JOptionPane.showInputDialog("Enter a ID");

        Elevator myElevator = new Elevator(Double.parseDouble(id));
        // Double.parseDouble(string) : string을 double 형으로 변환
    }
}
```

# Arguments & Parameter
```java
import javax.swing.JOptionpane;

public class InputOutput {
    // parameter, 매개변수
    // args에 사용자가 입력한 값이 들어간다.
    public static void main(String[] args) {
        // 사용자가 입력한 값들은 다음과 같이 사용 가능하다.
        String id = args[0]; // args의 index는 0부터 시작한다.
        String bright = args[1];

        Elevator myElevator = new Elevator(Double.parseDouble(id));
        Bright myBright = new Bright(Double.parseDouble(bright));
    }
}
```