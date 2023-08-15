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
import model.Category;

/**
 *
 * @author Lenovo
 */
public class DAOCategory extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM category";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
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
            String sql = "SELECT COUNT(*) FROM category";
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

    public ArrayList<Category> pagingCategory(int pageNumber, int pageSize) {
        ArrayList<Category> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM category ORDER BY category_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Category> getCategory(int id) {
        ArrayList<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.category where category_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
       public ArrayList<Category> searchCategory(String name) {
        ArrayList<Category> list = new ArrayList<>();
        String sql = "select * from category c where c.category_name like '%' + ? + '%'";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertCategory(Category c) {
        String sql = "INSERT INTO [dbo].[category]\n"
                + "           ([category_name])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, c.getCategory_name());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCategory(Category c) {
        String sql = "UPDATE [dbo].[category]\n"
                + "   SET [category_name] = ?\n"
                + " WHERE category_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, c.getCategory_name());
            ps.setInt(2, c.getCategory_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int deleteCategory(int id) {
        int n = 0;
        String sql = "delete from category where category_id= " + id;
        Statement state;
        try {
            state = connection.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

}
