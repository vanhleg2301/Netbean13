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
public class ConNguoi {
    private String hoVaTen;
    private int namSinh;

    public ConNguoi(String hoVaTen, int namSinh) {
        this.hoVaTen = hoVaTen;
        this.namSinh = namSinh;
    }

    public ConNguoi() {
    }

    public String getHoVaTen() {
        return hoVaTen;
    }

    public void setHoVaTen(String hoVaTen) {
        this.hoVaTen = hoVaTen;
    }

    public int getNamSinh() {
        return namSinh;
    }

    public void setNamSinh(int namSinh) {
        this.namSinh = namSinh;
    }
    
    
    
    public void an(){
        System.out.println("an cut");
    }
    
    public void uong(){
        System.out.println("uong nuoc");
    }
    
    public void ngu(){
        System.out.println("ngu nhu lon");
    }
}
