/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;

/**
 *
 * @author Lenovo
 */
public class DAOBrand extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Brand> getAllBrand() {
        ArrayList<Brand> list = new ArrayList<>();
        String sql = "SELECT * FROM brand";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getInt(1), rs.getString(2)));
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
            String sql = "SELECT COUNT(*) FROM brand";
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

    public ArrayList<Brand> pagingBrand(int pageNumber, int pageSize) {
        ArrayList<Brand> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM brand ORDER BY brand_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Brand> getBrand(int id) {
        ArrayList<Brand> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.brand where brand_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public ArrayList<Brand> searchBrand(String name) {
        ArrayList<Brand> list = new ArrayList<>();
        String sql = "select * from brand b where b.brand_name like '%' + ? + '%'";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertBrand(Brand b) {
        String sql = "INSERT INTO [dbo].[brand]\n"
                + "           ([brand_name])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, b.getBrand_name());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateBrand(Brand b) {
        String sql = "UPDATE [dbo].[brand]\n"
                + "   SET [brand_name] = ?\n"
                + " WHERE brand_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, b.getBrand_name());
            ps.setInt(2, b.getBrand_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int deleteBrand(int id) {
        int n = 0;
        String sql = "delete from brand where brand_id= " + id;
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
