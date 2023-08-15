
package Java_54_compareTo_Comparable;

import java.util.Comparator;

public class Main implements Comparable<Main>{ 
    private int maSinhVien;
    private String hoVaten;
    private String tenLop;
    private double diemTrungBinh;

    public Main(int maSinhVien, String hoVaten, String tenLop, double diemTrungBinh) {
        this.maSinhVien = maSinhVien;
        this.hoVaten = hoVaten;
        this.tenLop = tenLop;
        this.diemTrungBinh = diemTrungBinh;
    }

    public int getMaSinhVien() {
        return maSinhVien;
    }

    public void setMaSinhVien(int maSinhVien) {
        this.maSinhVien = maSinhVien;
    }

    public String getHoVaten() {
        return hoVaten;
    }

    public void setHoVaten(String hoVaten) {
        this.hoVaten = hoVaten;
    }

    public String getTenLop() {
        return tenLop;
    }

    public void setTenLop(String tenLop) {
        this.tenLop = tenLop;
    }

    public double getDiemTrungBinh() {
        return diemTrungBinh;
    }

    public void setDiemTrungBinh(double diemTrungBinh) {
        this.diemTrungBinh = diemTrungBinh;
    }
    public String getTen() {
        String s = this.hoVaten.trim();
        if(s.indexOf(" ") >= 0) {
            int vt = s.lastIndexOf(" ");
            return s.substring(vt + 1);
        }else {
            return s;
        }
    }

    @Override
    public int compareTo(Main o) {
        // TH <0
        // TH =0
        // TH >0
        
        // dua tren so sanh ten 
        // ten ada, barack abama, Nguyen Van A, Tran Thi Thanh Yen
        String tenThis = this.getTen();
        String ten0 = o.getTen();
        
        return tenThis.compareTo(ten0);
    }
    
    
}
