/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java_66_Generic;

/**
 *
 * @author DELL
 */
public class MainGeneric {
    public static void main(String[] args) {
        BoxGeneric b1 = new BoxGeneric<Integer>(15);
        System.out.println(b1.getValue());
        
        BoxGeneric b2 = new BoxGeneric<String>("Vanhvanh");
        System.out.println(b2.getValue());
        
        BoxGeneric b3 = new BoxGeneric<Double>(100.34);
        System.out.println(b3.getValue());
        
    }
}
