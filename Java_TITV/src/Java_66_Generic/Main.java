
package Java_66_Generic;

/**
Generic là tham số hóa các kiểu dữ liệu
* <T> đây là generic 
* 
* E - Element
* K - Key 
* N - Số 
* T - Loại - type
* V - giá trị 
* S, U, V, v.v.. - loại 2, 3, 4
 */
public class Main {
    public static void main(String[] args) {
        Box box = new Box(15);
        System.out.println("gia tri: " + box.getValue());
        
//        Box box = new Box(15.15); => Error 
//        Box box = new Box("String name"); =. error
    }
}
