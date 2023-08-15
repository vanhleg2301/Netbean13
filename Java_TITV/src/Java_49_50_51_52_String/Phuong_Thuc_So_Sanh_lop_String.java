/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java_49_50_51_52_String;

/**
 *
 * @author DELL
 */
public class Phuong_Thuc_So_Sanh_lop_String {
    public static void main(String[] args) {
        String s1 = "Vanhdiep";
        String s2 = "vanhdiep";
        String s3 = "huonghuong";
        
        // so sanh xem co bang nhau ko 
        // Ham equal => có phân biệt chữ hoa và thường
        // so sanh 2 chuỗi giống nhau 
        // giong nhau thi true - khac nhau thi false
        
        System.out.println("s1 equals s2 : "+ s1.equals(s2));
        System.out.println("s1 equals s3 : "+ s1.equals(s3));
        
        
        // Ham equalsIsIgnoreCase() - tuong tu tren / nhung ko phan biet chu Hoa va Thuong
        System.out.println("s1 equals s2 : "+ s1.equalsIgnoreCase(s2));
        System.out.println("s1 equals s3 : "+ s1.equalsIgnoreCase(s3));
        
        
        // Ham compareTo() - 
        //so sanh xem thang nao lon hon '>' '<' '='
        // neu ra gia tri -1 thi sv1 nho hon sv2
        // neu ra gia tri 1 thi sv1 lon hon sv2 
        // neu ra gia tri 0 thi bang nhau 
        
        // Kết quá của phép so sanh trả về là gia trị trong bang mã ASCII
        // cua ký tự đầu tiên khác nhau giữa 2 chuỗi
        String sv1 = "Nguyen Van A";
        String sv2 = "Nguyen Van B";
        String sv3 = "Nguyen Van";
        String sv4 = "Nguyen Van A";
        
        System.out.println("sv1 voi sv2 : " + sv1.compareTo(sv2));
        System.out.println("sv1 voi sv3 : " + sv1.compareTo(sv3));
        System.out.println("sv1 voi sv4 : " + sv1.compareTo(sv4));
        
        // Ham campareToIgnoreCase - tuong tu nhu trên nhưng ko phân biêt chữ hoa 
        System.out.println("sv1 voi sv2 : "+ sv1.compareToIgnoreCase(sv2));
        System.out.println("sv1 voi sv3 : "+ sv1.compareToIgnoreCase(sv3));
        
        
        
        
        //Ham regionMathes(vị trí cần so sánh chuoi 1, chuoi 2
        // , vị trí cần so sánh chuỗi 2, so sanh bao nhieu ký tự ky tu)
        // cho phép so sanh mot doan bat ky trong chuoi
        
        String r1 = "TITV.vn";
        String r2 = "TV.v";
        boolean check = r1.regionMatches(2, r2, 0, 4);
        System.out.println(check);
        
        
        
        // Ham startsWith(...) - Kiểm tra chuỗi bắt đầu bằng .... - trả về true or false
        String sdt = "097852256";
        System.out.println(sdt.startsWith("0978"));
        System.out.println(sdt.startsWith("0123"));
        
        
        // Ham endsWith - kiểm tra chuõi kết thucs bằng cái con mẹ j
        
        String msv = "HE161142";
        System.out.println(msv.endsWith("42"));
        System.out.println(msv.endsWith("45"));
        
        if (msv.endsWith("42")){
            System.out.println("Day La Sinh Vien Fpt");
        }else {
            System.out.println("Day La Mot Con Cho");
        }
    }
}
