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
public class HocSinh extends ConNguoi {
    private String tenlop, tentruong;

    public HocSinh() {
    }

    public HocSinh(String tenlop, String tentruong, String hoVaTen, int namSinh) {
        super(hoVaTen, namSinh);
        this.tenlop = tenlop;
        this.tentruong = tentruong;
    }

    public HocSinh(String tenlop, String tentruong) {
        this.tenlop = tenlop;
        this.tentruong = tentruong;
    }

    public String getTenlop() {
        return tenlop;
    }

    public void setTenlop(String tenlop) {
        this.tenlop = tenlop;
    }

    public String getTentruong() {
        return tentruong;
    }

    public void setTentruong(String tentruong) {
        this.tentruong = tentruong;
    }
    
    
}
