
package Java_63_Queue_Dequeue;

import java.util.PriorityQueue;
import java.util.Queue;

//                          PriorityQueue   
// o Main 2 chung ta se su dung PriorityQueue - no se tu sap xep chuoi trong offer truyen vao 
//  Nếu muốn sử dụng cho đối tượng mà mình tự xây dụng ra thì : 
//  phai viet phuong thuc Comperator() hoặc Comperabale(); 
public class Main2 {
    public static void main(String[] args) {
        Queue<String> danhSachSV = new PriorityQueue<String>(); // no se tu sap xep offer ben duoi 
        
        danhSachSV.offer("v1");
        danhSachSV.offer("V2");
        danhSachSV.offer("V3");
        danhSachSV.offer("v4");
        
        // Co the chen vao giua dc 
        
        while(true) {
            String ten = danhSachSV.poll(); // lay ra va xoa // peek lay ra nhung ko xoa
            if(ten == null) {
                break;
            }
            System.out.println(ten);
        }
    }
}
