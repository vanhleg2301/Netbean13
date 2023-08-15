/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java_37_QuanLySinhVien;

/**
 *
 * @author DELL
 */
public class SinhVien {
    private String maSinhVien;
    private String hoVaTen;
    Ngay ngaySinh;
    private double diemTrungBinh;
    Lop lop;

    public SinhVien(String maSinhVien, String hoVaTen, Ngay ngaySinh, double diemTrungBinh, Lop lop) {
        this.maSinhVien = maSinhVien;
        this.hoVaTen = hoVaTen;
        this.ngaySinh = ngaySinh;
        this.diemTrungBinh = diemTrungBinh;
        this.lop = lop;
    }

    public String getMaSinhVien() {
        return maSinhVien;
    }

    public void setMaSinhVien(String maSinhVien) {
        this.maSinhVien = maSinhVien;
    }

    public String getHoVaTen() {
        return hoVaTen;
    }

    public void setHoVaTen(String hoVaTen) {
        this.hoVaTen = hoVaTen;
    }

    public Ngay getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Ngay ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public double getDiemTrungBinh() {
        return diemTrungBinh;
    }

    public void setDiemTrungBinh(double diemTrungBinh) {
        this.diemTrungBinh = diemTrungBinh;
    }

    public Lop getLop() {
        return lop;
    }

    public void setLop(Lop lop) {
        this.lop = lop;
    }
    
    public String layTenKhoa(){
        return this.lop.getTenKhoa();
    }
    
    public String layHoVaTen(){
        return this.getHoVaTen();
    }
    
    public boolean kiemTraDiem(){
        return this.diemTrungBinh >= 5;
//        if(this.diemTrungBinh < 5){
//            return false;
//        }
//        else
//            return true;
    }
    
    public boolean kiemTraCungNgaySinh(SinhVien svKhac){
        return this.ngaySinh.equals(svKhac.ngaySinh);
    }
    
    public boolean kiemTraCungNamSinh(SinhVien svk){
        if(this.ngaySinh.getNam() == svk.ngaySinh.getNam()){
            return true;
        }
        else 
            return false;
    }
    
    
    
}
