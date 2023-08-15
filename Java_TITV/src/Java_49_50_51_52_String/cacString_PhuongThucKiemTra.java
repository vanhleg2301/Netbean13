/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java_49_50_51_52_String;

import java.util.Scanner;

/**
 *
 * @author DELL
 */
public class cacString_PhuongThucKiemTra {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String s;
        
        System.out.println("Nhap Vao Chuoi");
        s= sc.nextLine();
        System.out.println("-----------------");
        
        // Ham lengrh()
        System.out.println(s.length()); // lay do dai cua chuoi - tra ve 1 con so 
        int doDai = s.length();
        
        // Ham charAt(vi tri) - lay ra 1 ki tu o mot vi tri bat ki cua chuoi
        for(int i = 0; i<doDai; i++){
            System.out.println("vi tri " + i + " la : " + s.charAt(i));
        }
        
        // Ham getChars(vi tri bat dau, vi tri ket thuc
        // , manng luu du lieu, vi tri bat dau luu cua mang ) - 
        char[] arrayChar = new char[100];
        s.getChars(2, 4, arrayChar, 0);
        for (int i = 0; i<arrayChar.length; i++){
            System.out.println("gia tri cua mang tai" + i + " la : " + arrayChar);
           
        }
        
//        // Ham getBytes
//        // co 3 cach lay ra gia tri tuong ung trong bang ma ASCII
//        // cua cac ky tu thanh 1 mang
//        byte[] arrayByte = s.getBytes();
//        for (byte b : arrayByte){
//            System.out.println(b);
//        }
    }
}
