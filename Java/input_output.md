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