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
public class Tim_Kiem_Chuoi {
    public static void main(String[] args) {
        String s1 = "Xin chào tất cả các bạn, minh tên là Việt Anh, mình là sinh viên fpt";
        String s2 = "Việt Anh";
        String s3 = "0978522556";
        
        //  Ham indexOf thường - tìm kiếm từ trái sang phải
        System.out.println("Vị trí của s2 trong s1 là : "+s1.indexOf(s2)); // trả về vị trí là số lớn ơn hoặc bằng 0
        System.out.println("Vị trí của s3 trong s1 là : "+s1.indexOf(s3)); // tra vè -1 vì địt tìm thấY 
        
        //System.err.println("Vị trí của s2 trong s1 : " + s1.indexOf(s2, Nếu ở đây là số 0 thì giống với index trên - là số dương thì khác));
        // ví dụ là số 2 thì tìm từ vị trí thứ 2 trở đi --- từ dấu cách sau chữa "Vị"
        System.out.println("Vị trí của s2 trong s1 từ vị trí thứ 2 : " + s1.indexOf(s2, 2));//
        
        char c1 = 'à';        
        System.out.println("Vị trí của c1 trong s1 : " + s1.indexOf(c1));
        System.out.println("Vị trí của c1 trong s1 từ vị trí thứ 2 : " + s1.indexOf(c1, 7));
        
        
        
        // lastIndexOf() - Tìm kiếm từ phải sáng trái
        System.out.println("Vị trí của s2 trong s1 từ phải sang trái là : "+s1.lastIndexOf(s2));
        System.out.println("Vị trí của s2 trong s1 từ phải sang trái là : "+s1.lastIndexOf(s3));
         
        char c2 = 'à';        
        System.out.println("Vị trí của c1 trong s1 : " + s1.lastIndexOf(c1));
        System.out.println("Vị trí của c1 trong s1 từ vị trí thứ 2 : " + s1.lastIndexOf(c1, 7));
    }
}
