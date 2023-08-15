/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java_65_Map;

import java.util.Scanner;

/**
 *
 * @author DELL
 */
public class CheckValue {
    Scanner sc = new Scanner(System.in);
    
    public int getLimit(int min, int max) {
        while(true) {
            try {
                int i = Integer.parseInt(sc.nextLine());
                if(i < min || i > max){
                    throw new NumberFormatException();
                }
                return i;
            } catch (NumberFormatException ex) {
            }
        }
    }
    
    public int getInt(String first, String last) {
        System.out.println(first);
        while(true) {
            try {
                int i = Integer.parseInt(sc.nextLine());
                return i;
            } catch (NumberFormatException ex) {
                System.err.println(last);
            }
        }
    }
    
    public String getString(String first, String last) {
        while(true) {
            String result = sc.nextLine().trim();
            if(result.length() == 0){
                System.out.println("Please enter correct format: ");
            }else {
                return result;
            }
        }
    }
    
}
