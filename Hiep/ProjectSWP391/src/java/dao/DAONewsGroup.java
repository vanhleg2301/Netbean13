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
import model.NewsGroup;

/**
 *
 * @author Lenovo
 */
public class DAONewsGroup extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<NewsGroup> getAllNewsGroup() {
        ArrayList<NewsGroup> list = new ArrayList<>();
        String sql = "SELECT * FROM [news_group]";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new NewsGroup(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalPages(int pageSize) {
        int totalRecords = 0;
        int totalPages = 0;

        try {
            String sql = "SELECT COUNT(*) FROM news_group";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                totalRecords = rs.getInt(1);
            }

            // Tính tổng số trang
            totalPages = (int) Math.ceil((double) totalRecords / pageSize);
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }

        return totalPages;
    }

    public ArrayList<NewsGroup> pagingNewsGroup(int pageNumber, int pageSize) {
        ArrayList<NewsGroup> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM news_group ORDER BY newsgroup_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new NewsGroup(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<NewsGroup> searchNewsGroup(String name) {
        ArrayList<NewsGroup> list = new ArrayList<>();
        String sql = "select * from news_group n where n.newsgroup_name like '%' + ? + '%'";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new NewsGroup(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<NewsGroup> getNewsGroup(int id) {
        ArrayList<NewsGroup> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.[news_group] where newsgroup_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new NewsGroup(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void insertNewsGroup(NewsGroup ng) {
        String sql = "INSERT INTO [dbo].[news_group]\n"
                + "           ([newsgroup_name])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, ng.getNewsgroup_name());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateNewsGroup(NewsGroup ng) {
        String sql = "UPDATE [dbo].[news_group]\n"
                + "   SET [newsgroup_name] = ?\n"
                + " WHERE newsgroup_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, ng.getNewsgroup_name());
            ps.setInt(2, ng.getNewsgroup_id());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int deleteNewsGroup(int id) {
        int n = 0;
        String sql = "delete from news_group where newsgroup_id= " + id;
        Statement state;
        try {
            state = connection.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAONewsGroup.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

}
