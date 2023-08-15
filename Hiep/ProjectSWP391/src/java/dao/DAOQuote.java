/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Quote;

/**
 *
 * @author Lenovo
 */
public class DAOQuote extends DBContext {
   PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Quote> getAllQuote() {
        ArrayList<Quote> list = new ArrayList<>();
        String sql = "select n.news_id, n.newsgroup_id, "
                + "n.content,n.createby from news n where newsgroup_id = 5";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Quote(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Quote> getTop1Quote() {
        ArrayList<Quote> list = new ArrayList<>();
        String sql = "select Top(1) n.news_id, n.newsgroup_id, "
                + "n.content,n.createby from news n where newsgroup_id=5";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Quote(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4)));
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
            String sql = " SELECT COUNT(*) FROM news where newsgroup_id=5";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                totalRecords = rs.getInt(1);
            }
            totalPages = (int) Math.ceil((double) totalRecords / pageSize);
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return totalPages;
    }

    public ArrayList<Quote> pagingQuote(int pageNumber, int pageSize) {
        ArrayList<Quote> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT news_id,newsgroup_id,content,createby FROM news"
                + " where newsgroup_id = 5"
                + " ORDER BY news_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Quote(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Quote> getQuoteById(int id) {
        ArrayList<Quote> list = new ArrayList<>();
        String sql = "SELECT news_id,newsgroup_id,content,createby FROM news where newsgroup_id= 5 and news_id= ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Quote(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Quote> searchQuote(String name) {
        ArrayList<Quote> list = new ArrayList<>();
        String sql = "SELECT * FROM news q where newsgroup_id=5 and q.content LIKE '%' + ? + '%'";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Quote(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertQuote(Quote quote) {
        String sql = "INSERT INTO [dbo].[news]\n"
                + "           ([newsgroup_id]"
                + "           ,[content]\n"
                + "           ,[createby])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, quote.getNewsgroup_id());
            ps.setString(2, quote.getContent());
            ps.setString(3, quote.getAuthor());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateQuote(Quote quote) {
        String sql = "UPDATE [dbo].[news]\n"
                + "   SET [content] = ?\n"
                + "      ,[createby] = ?\n"
                + " WHERE news_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, quote.getContent());
            ps.setString(2, quote.getAuthor());
            ps.setInt(3, quote.getNews_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int removeQuote(int id) {
        int n = 0;
        String sql = "delete from news where news_id= " + id;
        try {
            ps = connection.prepareStatement(sql);
            n = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n;
    }
}
