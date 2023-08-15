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
public class Test {
    public static void main(String[] args) {
        Ngay ngay1 = new Ngay(4, 10, 2005);
        Ngay ngay2 = new Ngay(12, 10, 2002);
        Ngay ngay3 = new Ngay(4, 10, 2005);
        
        Lop lop1 = new Lop("CSD" ,"khoa hoc may tinh ");
        Lop lop2 = new Lop("DCM" ,"ky thuat phan mem ");
        Lop lop3 = new Lop("ACF" ,"quan tri kinh doanh ");
        
        SinhVien sv1 = new SinhVien("He121002", "Hoang Viet Anh", ngay1, 8, lop2);
        SinhVien sv2 = new SinhVien("He161142", "Phan Ha Anh", ngay2, 4.9, lop3);
        SinhVien sv3 = new SinhVien("He041005", "Phan Ha Phuong", ngay3, 5.2, lop1);
        
        System.out.println("Ten khoa: " + sv1.layTenKhoa());
        System.out.println("Ten khoa: " + sv2.layTenKhoa() + " - Ten Sinh Vien: " + sv2.layHoVaTen() + "Diem Trung Binh: " + sv2.kiemTraDiem());
        System.out.println("Ten Sinh Vien: " + sv3.layHoVaTen() + " - Diem Trung Binh: "+sv3.kiemTraDiem());
        
        System.out.println("sv1 va sv2 cung ngay sinh: " + sv1.kiemTraCungNgaySinh(sv2));
        System.out.println("sv1 va sv3 cung ngay sinh: " + sv1.kiemTraCungNgaySinh(sv3));
        
        System.out.println("Kiem tra cung nam sinh: " + sv1.kiemTraCungNamSinh(sv3));
        
        
        
    }
}
