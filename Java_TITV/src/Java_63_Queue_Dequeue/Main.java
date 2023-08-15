
package Java_63_Queue_Dequeue;


//                                       Queue
// FIFO
// First in first out 
// Co 3 dang o 3 ham Main Main2 Main3 

import java.util.LinkedList;
import java.util.Queue;

public class Main {
    public static void main(String[] args) {
        Queue<String> danhSachSV = new LinkedList<String>();
        
        // add() và offer() đều là đưa phần tử vào ( offer() trả về dữ kiệu kiểu boolean)
            // add() nếu thêm thêm thành cô trả về true ko thành công thì lỗi 
            // offer() thêm thành công thì trả về true ko thành coong thì trả về false
        // remove() và poll() đều là xoá tương tự như add() và offer() 
        // element() và peek() đều là lấy ra và ko xóa 
        
        danhSachSV.offer("VanhVanh1"); // offer 
        danhSachSV.offer("HuongHuong1");
        danhSachSV.offer("PhuongPhuong1");
        danhSachSV.offer("Jonna1");
        
        while(true) {
            String ten = danhSachSV.poll(); // poll lay ra va xoa khoi queue 
                                            // peek lay ra nhung ko xoa
            if(ten == null) {
                break;
            }
            System.out.println(ten);
            System.out.println(danhSachSV);
            System.out.println("-----------------------");
        }
    }
}
