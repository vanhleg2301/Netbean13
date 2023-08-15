/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java_62_Stack;

import java.util.Scanner;
import java.util.Stack;

/*
----- LIFO
----- Last in first out 
 */
import java.util.Scanner;
import java.util.Stack;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        Stack<String> stackChuoi = new Stack<String>();
        
//        stackChuoi.push("giaTri") => dua gia tri vao Stack
//        stackChuoi.pop() => lay gia tri ra 
//        stackChuoi.peek() => lay gia tri ra ma ko xoa no ra khoi stack 
//        stackChuoi.clear => xoa tat ca phan tu trong stack
//        stackChuoi.contains("giaTri") => xac dinh gia tri co ton tai trong stack hay ko 
//        stackChuoi.size() => lay ra do lon cua stack
        System.out.println("Nhap vao chuoi: ");
        String s = sc.nextLine();
        // TITV
        for (int i = 0; i < s.length(); i++) {
            stackChuoi.push(s.charAt(i)+""); // dua tung ki tung vào 
        }
        System.out.println("Day la Chuoi Dao Nguoc : ");
            for (int i = 0; i < s.length(); i++) {
                System.out.print(stackChuoi.pop()); // lay tung gia tri ra 
        }
        System.out.println("\n-------------------------------");  
        
        
        
        // Chuyen tu he thap phan sang he nhi phan
        Stack<String> stackSoDu = new Stack<String>();
        System.out.println("Vi Du 2 : " + "\n" + "Nhap 1 so nguyen duong tu ban phim ");
        int x = sc.nextInt();
        System.out.println("---------PhanTichSo---------");
        while (x > 0) {
            int soDu = x%2;
            
            System.out.println(soDu);
            stackSoDu.push(soDu + "");
            x = x/2;
        }
        System.out.println("So nhi phan la : ");
        int n = stackSoDu.size();
        for(int i = 0; i < n; i++) {
            System.out.print(stackSoDu.pop());
        } 
        System.out.println();
    }
}

