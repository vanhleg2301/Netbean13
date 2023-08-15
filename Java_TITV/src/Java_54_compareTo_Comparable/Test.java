/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java_54_compareTo_Comparable;

/**
 *
 * @author DELL
 */
public class Test {
    public static void main(String[] args) {
        Main sv1 = new Main(100, "Vanh", "Lop 2" , 9);
        Main sv2 = new Main(55, "Phuong", "Lop 3" , 7);
        Main sv3 = new Main(89, "Phuong", "Lop 3" , 8);
        Main sv4 = new Main(34, "Phuong", "Lop 3" , 6);
        
        System.out.println(sv1.compareTo(sv2));
        System.out.println(sv1.compareTo(sv3));
        System.out.println(sv1.compareTo(sv4));
        
    }
}
