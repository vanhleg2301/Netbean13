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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Comment;
import model.CommentView;

/**
 *
 * @author Lenovo
 */
public class DAOComment extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Comment> getAllComment() {
        ArrayList<Comment> list = new ArrayList<>();
        String sql = "SELECT * FROM comment";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Comment(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getDate(4), rs.getString(5)));
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
            String sql = "SELECT COUNT(*) FROM Comment";
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

    public ArrayList<Comment> pagingComment(int pageNumber, int pageSize) {
        ArrayList<Comment> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM Comment ORDER BY Comment_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Comment(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getDate(4), rs.getString(5)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<CommentView> listCommentProduct(int product_id) {
        ArrayList<CommentView> list = new ArrayList<>();
        String sql = "SELECT c.comment_id, c.product_id,c.customer_id,cus.name,cus.image,c.comment_date,c.comment_content FROM [comment] c join customer cus\n"
                + "on c.customer_id = cus.customer_id and c.product_id = ? "
                + "order by c.comment_date desc";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, product_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CommentView(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getString(4), rs.getString(5),
                        rs.getDate(6), rs.getString(7)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<CommentView> listCommentProductByCode(String code) {
        ArrayList<CommentView> list = new ArrayList<>();
        String sql = "select a.comment_id, a.product_id,a.customer_id,a.name,a.image,a.comment_date,a.comment_content from (SELECT c.comment_id, c.product_id,c.customer_id,cus.name,cus.image,c.comment_date,c.comment_content FROM [comment] c join customer cus\n"
                + "                on c.customer_id = cus.customer_id\n"
                + "                ) as a\n"
                + "				join \n"
                + "				product p \n"
                + "				on p.product_id = a.product_id where p.code like ? \n"
                + "				order by a.comment_date desc";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, code);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CommentView(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getString(4), rs.getString(5),
                        rs.getDate(6), rs.getString(7)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Comment> getComment(int id) {
        ArrayList<Comment> list = new ArrayList<>();
        String sql = "SELECT * FROM comment WHERE comment_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Comment(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getDate(4), rs.getString(5)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Comment> searchComment(String content) {
        ArrayList<Comment> list = new ArrayList<>();
        String sql = "select * from comment n where n.comment_content like '%' + ? + '%'";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, content);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Comment(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getDate(4), rs.getString(5)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertComment(Comment c) {
        String sql = "INSERT INTO [dbo].[comment]\n"
                + "           ([product_id]\n"
                + "           ,[customer_id]\n"
                + "           ,[comment_date]\n"
                + "           ,[comment_content])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, c.getProduct_id());
            ps.setInt(2, c.getCustomer_id());
            ps.setDate(3, c.getComment_date());
            ps.setString(4, c.getComment_content());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateComment(Comment c) {
        String sql = "UPDATE [dbo].[comment]\n"
                + "   SET [product_id] = ?\n"
                + "      ,[customer_id] = ?\n"
                + "      ,[comment_date] = ?\n"
                + "      ,[comment_content] = ?\n"
                + " WHERE comment_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, c.getProduct_id());
            ps.setInt(2, c.getCustomer_id());
            ps.setDate(3, c.getComment_date());
            ps.setString(4, c.getComment_content());
            ps.setInt(4, c.getComment_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int deleteComment(int id) {
        int n = 0;
        String sql = "delete from comment where comment_id= " + id;
        Statement state;
        try {
            state = connection.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

}
