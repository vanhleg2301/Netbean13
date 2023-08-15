/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java_49_50_51_52_String;

import java.util.Locale;

/**
 *
 * @author DELL
 */
public class Cat_Noi_ThayThe_ChuyenDoi {
    public static void main(String[] args) {
        String s1 = "VanhVanh";
        String s2 = ".com";
    
    // Hàm Concat 0
    // dùng để nối chuỗi 
        System.out.println(s1.concat(s2));
    
    // Hàm replace - 
        String s5 = "vAnH.Vn";
        String s6 = s5.replaceAll("vAnH","Diep       ");
        System.out.println("s6 = " + s6);
    
    // Hàm toLowerCase - hàm chuyển về viết thường
    // hàm toupperCase - hàm chuyển về viết hoa
        String s7 = s1.concat(s2).toLowerCase();
        System.out.println("s7 = "+s7);
        
        String s8 = s1.concat(s2).toUpperCase();
        System.out.println("s8 = "+ s8);
        
        
     // Hàm trim - xóa khoảng trắng ở đầu chuỗi 
     
        String s9 = "      Xin chào mọi nười, tôi là Vanh    ";
        String s10 = s9.trim();
        System.out.println("s10 = " + s10);
        
        
     // Hàm subString - Cắt chuỗi 
        String s11 = "Xin chào mọi người, tôi là Vanh";
        
        String s12 = s11.substring(14);
        System.out.println("s12 = " + s12);
        
        String s13 = s11.substring(4, 19);
        System.out.println("s13 = " + s13);
    }
}
