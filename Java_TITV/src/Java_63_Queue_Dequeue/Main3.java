
package Java_63_Queue_Dequeue;
//                                            DeQueue
// co the chen vao dau hoac chen vao cuoi 
// *hang doi co 2 dau 
// addFirst-Last || offerFisrt-Last
// .....
import java.util.ArrayDeque;
import java.util.Deque;

public class Main3 {
    public static void main(String[] args) {
        Deque<String> danhSachSV = new ArrayDeque<String>(); 
        
        danhSachSV.offer("v1");
        danhSachSV.offer("V2");
        danhSachSV.offer("V3");
        danhSachSV.offer("v4");
        danhSachSV.offerLast("v5");
        danhSachSV.offerFirst("V6");       
        /*
        B1 : v1 > V2 > V3 > v4 
        B2 : v1 > V2 > V3 > v4 > v5
        B3 : V6 > v1 > V2 > V3 > v4 > v5
        */
        while(true) {
            String ten = danhSachSV.poll(); // lay ra va xoa // peek la ra ko xoa 
            if(ten == null) {
                break;
            }
            System.out.println(ten);
        }
    }
}
