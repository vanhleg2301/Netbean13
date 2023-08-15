/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java_39_40_KeThua;

/**  
 *
 * @author DELL
 */
public class Main {
    public static void main(String[] args) {
        System.out.println("Kiem Tra\n--------------");
        ConNguoi cn = new ConNguoi("vanhvanh", 2002);
        
//        cn.an();
//        cn.uong();
//        cn.ngu();
        
        HocSinh hs = new HocSinh("lop 11", "giathuyA", "vanhvan", 2002);
        hs.an();
        hs.ngu();
    }
}
