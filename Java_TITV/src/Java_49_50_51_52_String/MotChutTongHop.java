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
public class MotChutTongHop {
    public static void main(String[] args) {
        String targetString = "Java is fun to learn";
        String s1= "JAVA";
        String s2= "Java";
        String s3 = "  Hello Java  ";

        System.out.println("Char at index 2(third position): " + targetString.charAt(2));
        System.out.println("After Concat: "+ targetString.concat("-Enjoy-"));
        System.out.println("Checking equals ignoring case: " +s2.equalsIgnoreCase(s1));
        System.out.println("Checking equals with case: " +s2.equals(s1));
        System.out.println("Checking Length: "+ targetString.length());
        System.out.println("Replace function: "+ targetString.replace("fun", "easy"));
        System.out.println("SubString of targetString: "+ targetString.substring(8));
        System.out.println("SubString of targetString: "+ targetString.substring(8, 12));
        System.out.println("Converting to lower case: "+ targetString.toLowerCase());
        System.out.println("Converting to upper case: "+ targetString.toUpperCase());
        System.out.println("Triming string: " + s3.trim());
        System.out.println("searching s1 in targetString: " + targetString.contains(s1));
        System.out.println("searching s2 in targetString: " + targetString.contains(s2));

        char [] charArray = s2.toCharArray();
        System.out.println("Size of char array: " + charArray.length);
        System.out.println("Printing last element of array: " + charArray[3]);

    }
}




//equals(s)	kiểm tra hai chuỗi giống nhau không (chú ý, toán tử so sánh == kiểm tra hai đối tượng cùng trỏ đến một chuỗi không)
//length()	Trả về chiều dài chuỗi
//concat()	Nối hai chuỗi thành một chuỗi mới, ví dụ:
//String string1 = "Học ";
//String string2 = "Java";
//String string3 = string1.concat(string2);
//string3: "Học Java"
//Có thể nhanh chóng nối hai chuỗi với toán tử +
//
////String string3 =                string1 + string2
//charAt(int index)               trả về ký tự tại vị trí index trong chuỗi, ký tự đầu tiên chỉ số index là 0
//equalsIgnoreCase(s)             kiểm tra hai chuỗi giống nhau (không phân biệt chữ hoa/thường)
//length()                        trả về chiều dài chuỗi
//replace(old,new)                tìm và thay thế ký tự, chuỗi
//substring(int begin)
//substring(int begin, int end)	trả về trích xuất chuỗi con từ begin đến cuối hoặc end
//toLowerCase()/toUpperCase	trả về chuỗi mới bằng cách đổi chữ Hoa thành thường (hoặc thường thành Hoa)
//trim()                          ngắt bỏ khoảng trắng ở đầu và cuỗi
//toCharArray()                   lấy mảng các ký tự
//contains(s)------               kiểm tra có chứa một chuỗi con
//IsEmpty() --------------------- kiểm tra chuỗi có rỗng không.
//split(separator)                chia chuỗi thành mảng với điểm ngắt là ký tự separator. Ví dụ tách chuỗi thành các từ str.split(" ");
