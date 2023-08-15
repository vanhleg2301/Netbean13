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
import model.News;
import model.NewsView;

/**
 *
 * @author Lenovo
 */
public class DAONews extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<NewsView> getAllNews() {
        ArrayList<NewsView> list = new ArrayList<>();
        String sql = "SELECT s.news_id,ng.newsgroup_name, s.image,s.title,s.createby,s.content,DAY(s.created_date)\n"
                + "as day ,MONTH(s.created_date) as month ,YEAR(s.created_date) as year,s.modifyby,s.modify_date FROM news s join news_group ng\n"
                + "on s.newsgroup_id = ng.newsgroup_id WHERE ng.newsgroup_id != 5 and ng.newsgroup_id != 6"
                + " and ng.newsgroup_id != 7 and ng.newsgroup_id != 8 and ng.newsgroup_id != 9 and ng.newsgroup_id != 10\n"
                + "order by year desc, month desc, day desc";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new NewsView(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getDate(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<NewsView> getTop3News() {
        ArrayList<NewsView> list = new ArrayList<>();
        String sql = "SELECT Top(3) s.news_id,ng.newsgroup_name, s.image,s.title,s.createby,s.content,DAY(s.created_date)\n"
                + "as day ,MONTH(s.created_date) as month ,YEAR(s.created_date) as year,s.modifyby,s.modify_date FROM news s join news_group ng\n"
                + "on s.newsgroup_id = ng.newsgroup_id WHERE ng.newsgroup_id != 5 and ng.newsgroup_id != 6"
                + " and ng.newsgroup_id != 7 and ng.newsgroup_id != 8 and ng.newsgroup_id != 9 and ng.newsgroup_id != 10\n"
                + "order by year desc, month desc, day desc";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new NewsView(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getDate(11)));
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
            String sql = "SELECT COUNT(*) FROM news WHERE newsgroup_id != 5 and newsgroup_id != 6 and"
            + " newsgroup_id != 9 and newsgroup_id != 7 and newsgroup_id != 8 and newsgroup_id != 10";
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

    public ArrayList<News> pagingNews(int pageNumber, int pageSize) {
        ArrayList<News> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM news WHERE newsgroup_id != 5 and newsgroup_id != 6 and newsgroup_id != 7"
        + " and newsgroup_id != 8 and newsgroup_id != 9 and newsgroup_id != 10 ORDER BY news_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getDate(7), rs.getString(8), rs.getDate(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<NewsView> pagingNewsView(int pageNumber, int pageSize) {
        ArrayList<NewsView> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT s.news_id, ng.newsgroup_name, s.image, s.title, s.createby, s.content, DAY(s.created_date) AS day, MONTH(s.created_date) AS month, YEAR(s.created_date) AS year, s.modifyby, s.modify_date\n"
                + " FROM news s\n"
                + " JOIN news_group ng ON s.newsgroup_id = ng.newsgroup_id\n"
                + " WHERE ng.newsgroup_id != 5 and ng.newsgroup_id != 6"
                + " and ng.newsgroup_id != 7 and ng.newsgroup_id != 8 and "
                + " ng.newsgroup_id != 9 and ng.newsgroup_id != 10\n"
                + " ORDER BY year DESC, month DESC, day DESC, news_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new NewsView(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getDate(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<NewsView> getNewsDetail(int id) {
        ArrayList<NewsView> list = new ArrayList<>();
        String sql = "SELECT s.news_id,ng.newsgroup_name, s.image,s.title,s.createby,s.content,DAY(s.created_date)\n"
                + "as day ,MONTH(s.created_date) as month ,YEAR(s.created_date) as year,s.modifyby,s.modify_date FROM news s join news_group ng\n"
                + "on s.newsgroup_id = ng.newsgroup_id where s.news_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new NewsView(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getDate(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<NewsView> searchNews(String title) {
        ArrayList<NewsView> list = new ArrayList<>();
        String sql = "SELECT s.news_id,ng.newsgroup_name, s.image,s.title,s.createby,s.content,DAY(s.created_date)"
                + " as day ,MONTH(s.created_date) as month ,YEAR(s.created_date) as year,s.modifyby,s.modify_date FROM news s join news_group ng\n"
                + " on s.newsgroup_id = ng.newsgroup_id where s.title like '%' + ? + '%'";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new NewsView(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getDate(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<NewsView> searchNewsGroup(int id) {
        ArrayList<NewsView> list = new ArrayList<>();
        String sql = "SELECT s.news_id,ng.newsgroup_name, s.image,s.title,s.createby,s.content,DAY(s.created_date)"
                + " as day ,MONTH(s.created_date) as month ,YEAR(s.created_date) as year,s.modifyby,s.modify_date FROM news s join news_group ng\n"
                + " on s.newsgroup_id = ng.newsgroup_id where s.newsgroup_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new NewsView(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getDate(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<News> getNews(int id) {
        ArrayList<News> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.news where news_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getDate(7), rs.getString(8), rs.getDate(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<NewsView> getRelatedNews(int id) {
        ArrayList<NewsView> list = new ArrayList<>();
        String sql = "Select b.news_id,b.newsgroup_name, b.image,b.title,b.createby,\n"
                + "b.content, b.day, b.month , b.year, b.modifyby, b.modify_date from \n"
                + "(SELECT s.news_id,ng.newsgroup_name, s.image,s.title,s.createby,s.content,DAY(s.created_date)\n"
                + "as day ,MONTH(s.created_date) as month ,YEAR(s.created_date) as year,s.modifyby,s.modify_date FROM news s join news_group ng\n"
                + "on s.newsgroup_id = ng.newsgroup_id where s.news_id = ?) as a\n"
                + "join \n"
                + "(SELECT s.news_id,ng.newsgroup_name, s.image,s.title,s.createby,s.content,DAY(s.created_date)\n"
                + "as day ,MONTH(s.created_date) as month ,YEAR(s.created_date) as year,s.modifyby,s.modify_date FROM news s join news_group ng\n"
                + "on s.newsgroup_id = ng.newsgroup_id) as b\n"
                + "on a.newsgroup_name = b.newsgroup_name";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new NewsView(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getDate(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void insertNews(News n) {
        String sql = "INSERT INTO [dbo].[news]\n"
                + "           ([newsgroup_id]\n"
                + "           ,[image]\n"
                + "           ,[title]\n"
                + "           ,[content]\n"
                + "           ,[createby]\n"
                + "           ,[created_date]\n"
                + "           ,[modifyby]\n"
                + "           ,[modify_date])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, n.getNewsgroup_id());
            ps.setString(2, n.getImage());
            ps.setString(3, n.getTitle());
            ps.setString(4, n.getContent());
            ps.setString(5, n.getCreateby());
            ps.setDate(6, n.getCreated_date());
            ps.setString(7, n.getModifyby());
            ps.setDate(8, n.getModify_date());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateNews(News n) {
        String sql = " UPDATE [dbo].[news]\n"
                + "   SET [newsgroup_id] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[title] = ?\n"
                + "      ,[content] = ?\n"
                + "      ,[createby] = ?\n"
                + "      ,[created_date] = ?\n"
                + "      ,[modifyby] = ?\n"
                + "      ,[modify_date] = ?\n"
                + "       WHERE news_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, n.getNewsgroup_id());
            ps.setString(2, n.getImage());
            ps.setString(3, n.getTitle());
            ps.setString(4, n.getContent());
            ps.setString(5, n.getCreateby());
            ps.setDate(6, n.getCreated_date());
            ps.setString(7, n.getModifyby());
            ps.setDate(8, n.getModify_date());
            ps.setInt(9, n.getNews_id());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int deleteNews(int id) {
        int n = 0;
        String sql = "delete from news where news_id= " + id;
        Statement state;
        try {
            state = connection.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ArrayList<News> getFooterTitle() {
        ArrayList<News> list = new ArrayList<>();
        String sql = "select * from news where newsgroup_id = 7";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getDate(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public ArrayList<News> getFooterTitleById(int id) {
        ArrayList<News> list = new ArrayList<>();
        String sql = "select * from news where news_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getDate(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public ArrayList<News> getFooter(String image) {
        ArrayList<News> list = new ArrayList<>();
        String sql = "select * from news n where newsgroup_id = 8 and [image] like ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, image);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getDate(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<News> getFooterContent() {
        ArrayList<News> list = new ArrayList<>();
        String sql = "select * from news n where newsgroup_id = 8";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getDate(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void updateFooterTitle(News n) {
        String sql = " UPDATE [dbo].[news]\n"
                + "   SET [title] = ?\n"
                + " WHERE news_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, n.getTitle());
            ps.setInt(2, n.getNews_id());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateFooterChangesTitle(String image, String newimage) {
        String sql = "UPDATE [dbo].[news]\n"
                + "   SET [image] = ?\n"
                + " WHERE image = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, newimage);
            ps.setString(2, image);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateFooter(News n) {
        String sql = "UPDATE [dbo].[news]\n"
                + "   SET [title] = ?\n"
                + "      ,[content] = ?\n"
                + " WHERE news_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, n.getTitle());
            ps.setString(2, n.getContent());
            ps.setInt(3, n.getNews_id());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<News> getBanner() {
        ArrayList<News> list = new ArrayList<>();
        String sql = "select * from news s join news_group sg\n"
                + "on s.newsgroup_id = sg.newsgroup_id\n"
                + "where s.newsgroup_id = 9";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getDate(9)));
            }
        } catch (SQLException e) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public void updateBanner(News n) {
        String sql = " UPDATE [dbo].[news]\n"
                + "   SET [image] = ?\n"
                + "      ,[title] = ?\n"
                + "      ,[content] = ?\n"
                + "       WHERE news_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, n.getImage());
            ps.setString(2, n.getTitle());
            ps.setString(3, n.getContent());
            ps.setInt(4, n.getNews_id());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<News> getContact() {
        ArrayList<News> list = new ArrayList<>();
        String sql = "select * from news s join news_group sg\n"
                + "on s.newsgroup_id = sg.newsgroup_id\n"
                + "where s.newsgroup_id = 10";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getDate(7), rs.getString(8), rs.getDate(9)));
            }
        } catch (SQLException e) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public void updateContact(News n) {
        String sql = " UPDATE [dbo].[news]\n"
                + "   SET [title] = ?\n"
                + "      ,[content] = ?\n"
                + "       WHERE news_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, n.getTitle());
            ps.setString(2, n.getContent());
            ps.setInt(3, n.getNews_id());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAONews.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
