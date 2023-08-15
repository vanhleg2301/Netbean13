/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

public class Validate {

    public static String capitalizeFirstLetter(String s) {
        s = s.toLowerCase();
        String[] ss;
        String s1 = "";
        ss = s.split(" ");
        
        for (int i = 0; i < ss.length; i++) {
            if (ss[i].length() != 0) {
                s1 += Character.toUpperCase(ss[i].charAt(0));
                if (ss[i].length() > 1) {
                    s1 += ss[i].substring(1);
                }
                if (i < ss.length) {
                    s1 += " ";
                }
            }
        }
        return s1;
    }
}
