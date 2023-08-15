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
public class Ngay {
    private int ngay, thang, nam;

    public Ngay(int ngay, int thang, int nam) {
        this.ngay = ngay;
        this.thang = thang;
        this.nam = nam;
    }

    public int getNgay() {
        return ngay;
    }

    public void setNgay(int ngay) {
        this.ngay = ngay;
    }

    public int getThang() {
        return thang;
    }

    public void setThang(int thang) {
        this.thang = thang;
    }

    public int getNam() {
        return nam;
    }

    public void setNam(int nam) {
        this.nam = nam;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Ngay other = (Ngay) obj;
        if (this.ngay != other.ngay) {
            return false;
        }
        if (this.thang != other.thang) {
            return false;
        }
        if (this.nam != other.nam) {
            return false;
        }
        return true;
    }
    
    
    
}
