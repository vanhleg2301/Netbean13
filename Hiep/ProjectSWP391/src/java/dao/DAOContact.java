/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;
import model.Contact;
import utils.Vadidate;

/**
 *
 * @author Lenovo
 */
public class DAOContact extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Contact> getAllContact() {
        ArrayList<Contact> list = new ArrayList<>();
        String sql = "SELECT contact_id,name,gmail,contact_date,contact_content FROM contact";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Contact(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDate(4), rs.getString(5)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalPages(int pageSize) {
        int totalRecords = 0;
        int totalPages = 0;

        try {
            String sql = "SELECT COUNT(*) FROM contact";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                totalRecords = rs.getInt(1);
            }

            // Tính tổng số trang
            totalPages = (int) Math.ceil((double) totalRecords / pageSize);
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return totalPages;
    }

    public ArrayList<Contact> pagingContact(int pageNumber, int pageSize) {
        ArrayList<Contact> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT contact_id,name,gmail,contact_date,contact_content FROM contact ORDER BY contact_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Contact(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDate(4), rs.getString(5)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Contact> getContact(int id) {
        ArrayList<Contact> list = new ArrayList<>();
        String sql = "SELECT contact_id,name,gmail,contact_date,contact_content FROM contact c WHERE c.contact_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Contact(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDate(4), rs.getString(5)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public ArrayList<Contact> searchContact(String name) {
        ArrayList<Contact> list = new ArrayList<>();
        String sql = "select contact_id,name,gmail,contact_date,contact_content from contact n where n.name like '%' + ? + '%'";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Contact(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDate(4), rs.getString(5)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }


    public void insertContact(Contact c) {
        String sql = "INSERT INTO [dbo].[contact]\n"
                + "           ([name]\n"
                + "           ,[gmail]\n"
                + "           ,[contact_content]\n"
                + "           ,[contact_date])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getContact_content());
            ps.setDate(4, c.getContact_date());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int deleteContact(int id) {
        int n = 0;
        String sql = "delete from contact where contact_id= " + id;
        Statement state;
        try {
            state = connection.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

}
