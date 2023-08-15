/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connect.DBContext;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import model.Account;
import model.Appointment;
import model.Patient;

/**
 *
 * @author DELL
 */
public class PatientDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;
    DBContext dbc = new DBContext();
    Connection connection = null;

    
    // Vanh - iter 2
    public List<Patient> getPatientByDoctor(int doctor_id) throws SQLException, IOException {
        List<Patient> list = new ArrayList<>();
        // select distinct - để cho kêt quả trả về 1 bản ghi duy nhất cho mỗi giá trị duy nhất trong cột chỉ định
        String sql1 = "select distinct users.name, users.phone, users.email, a.pdate, patient.DOB, patient.patient_id as lastbooking from appointments \n"
                + "inner join patient on appointments.patient_id = patient.patient_id \n"
                + "inner join users on patient.username = users.username inner join (\n"
                + "select patient_id as pid , max(date) as pdate from appointments group by patient_id\n"
                + ") as a on a.pid = appointments.patient_id where appointments.doctor_id = ?";
        // Câu truy vấn kêt hợp 3 bảng (appointments, patient, users) 
        // bằng inner join 
        // sau đó inner join subquery nhóm patient_id và , date mới nhất từ bảng appointment lưu là a 
        // đến các bảng khác qua cá patient_id nơi mà có doctor_id = ?
        try {
            connection = dbc.getConnection(); // kết nối
            ps = connection.prepareStatement(sql1); // thục hiện truy vấn
            ps.setInt(1, doctor_id); // thiết lập giá trị cho tham số trong sql
            // doctor_id truyền vào để thay thế cho tham số '?' thứ 1 
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getString(1), rs.getInt(2), rs.getString(3));
                Appointment ap = new Appointment(rs.getDate(4));
                list.add(new Patient(a, ap, rs.getDate(5), rs.getInt(6)));
            }
        } catch (SQLException e) {
        }
//        finally {
//            if (connection != null) {
//                connection.close();
//            }
//        }
        return list;
    }

    // Vanh - iter 2
    public Patient getPatientbyid(int patient_id) throws SQLException, IOException {
        String sql = "SELECT u.name, u.email, u.phone, u.gender, p.DOB FROM users u inner join patient p\n"
                + "on u.username = p.username\n"
                + "where p.patient_id = ?";
        try {
            connection = dbc.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, patient_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getString(1), rs.getInt(2), rs.getBoolean(3), rs.getString(4));
                return new Patient(a, rs.getDate(5));
            }
        } catch (SQLException e) {
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
        return null;
    }
}
