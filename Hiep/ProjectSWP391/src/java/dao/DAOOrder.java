/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Month;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderView;

/**
 *
 * @author Lenovo
 */
public class DAOOrder extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<OrderView> getViewOrder() {
        ArrayList<OrderView> list = new ArrayList<>();
        String sql = "select o.order_id, c.name, o.name_receiver, o.phone_receiver, o.address_receiver, o.total_price, o.order_date, o.payment, o.status from [order] o join customer c\n"
                + "on o.customer_id = c.customer_id \n"
                + "group by o.order_id, c.name, o.name_receiver, o.phone_receiver, o.address_receiver, o.total_price, o.order_date, o.payment, o.status";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderView(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getDouble(6),
                        rs.getDate(7), rs.getString(8), rs.getString(9)));
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
            String sql = "SELECT COUNT(*) FROM order";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                totalRecords = rs.getInt(1);
            }

            // Tính tổng số trang
            totalPages = (int) Math.ceil((double) totalRecords / pageSize);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return totalPages;
    }

    public ArrayList<OrderView> pagingOrder(int pageNumber, int pageSize) {
        ArrayList<OrderView> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "select o.order_id, c.name, o.name_receiver, o.phone_receiver, o.address_receiver, o.total_price, o.order_date, o.payment, o.status from [order] o join customer c\n"
                + "                on o.customer_id = c.customer_id \n"
                + "                group by o.order_id, c.name, o.name_receiver, o.phone_receiver, o.address_receiver, o.total_price, o.order_date, o.payment, o.status\n"
                + "				ORDER BY order_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderView(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getDouble(6),
                        rs.getDate(7), rs.getString(8), rs.getString(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Order> getAllOrder() {
        ArrayList<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM [order]";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getDouble(6),
                        rs.getDate(7), rs.getString(8), rs.getString(9)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public ArrayList<Order> getOrder(int id) {
        ArrayList<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.[order] where order_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getDouble(6),
                        rs.getDate(7), rs.getString(8), rs.getString(9)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertOrder(Order o) {
        String sql = "INSERT INTO [dbo].[order]\n"
                + "           ([customer_id]\n"
                + "           ,[name_receiver]\n"
                + "           ,[phone_receiver]\n"
                + "           ,[address_receiver]\n"
                + "           ,[total_price]\n"
                + "           ,[order_date]\n"
                + "           ,[payment]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, o.getCustomer_id());
            ps.setString(2, o.getName_receiver());
            ps.setString(3, o.getPhone_receiver());
            ps.setString(4, o.getName_receiver());
            ps.setDouble(5, o.getTotal_price());
            ps.setDate(6, o.getOrder_date());
            ps.setString(7, o.getPayment());
            ps.setString(8, o.getStatus());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateOrder(Order o) {
        String sql = "UPDATE [dbo].[order]\n"
                + "   SET [customer_id] = ?\n"
                + "      ,[name_receiver] = ?\n"
                + "      ,[phone_receiver] = ?\n"
                + "      ,[address_receiver] = ?\n"
                + "      ,[total_price] = ?\n"
                + "      ,[order_date] = ?\n"
                + "      ,[payment] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE order_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, o.getCustomer_id());
            ps.setString(2, o.getName_receiver());
            ps.setString(3, o.getPhone_receiver());
            ps.setString(4, o.getName_receiver());
            ps.setDouble(5, o.getTotal_price());
            ps.setDate(6, o.getOrder_date());
            ps.setString(7, o.getPayment());
            ps.setString(8, o.getStatus());
            ps.setInt(9, o.getOrder_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateStatus(String status, int order_id) {
        String sql = "UPDATE [dbo].[order]\n"
                + "    SET  [status] = ?\n"
                + " WHERE order_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, order_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<OrderView> getAllStatusOrder(String status) {
        ArrayList<OrderView> list = new ArrayList<>();
        String sql = "select o.order_id, c.name, o.name_receiver, o.phone_receiver, o.address_receiver, o.total_price, o.order_date, o.payment, o.status from [order] o join customer c\n"
                + "on o.customer_id = c.customer_id and o.status like ? \n"
                + "group by o.order_id, c.name, o.name_receiver, o.phone_receiver, o.address_receiver, o.total_price, o.order_date, o.payment, o.status";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderView(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getDouble(6),
                        rs.getDate(7), rs.getString(8), rs.getString(9)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<OrderView> getAllStatusOrderCustomer(int id, String status) {
        ArrayList<OrderView> list = new ArrayList<>();
        String sql = "select o.order_id, c.name, o.name_receiver, o.phone_receiver, o.address_receiver, o.total_price, o.order_date, o.payment, o.status from [order] o join customer c\n"
                + "on o.customer_id = c.customer_id and c.customer_id = ?  and o.status like ? \n"
                + "group by o.order_id, c.name, o.name_receiver, o.phone_receiver, o.address_receiver, o.total_price, o.order_date, o.payment, o.status";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderView(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getDouble(6),
                        rs.getDate(7), rs.getString(8), rs.getString(9)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<OrderView> getViewOrderCustomer(int id) {
        ArrayList<OrderView> list = new ArrayList<>();
        String sql = "select o.order_id, c.name, o.name_receiver, o.phone_receiver, o.address_receiver, o.total_price, o.order_date, o.payment, o.status from [order] o join customer c\n"
                + "on o.customer_id = c.customer_id and c.customer_id = ?\n"
                + "group by o.order_id, c.name, o.name_receiver, o.phone_receiver, o.address_receiver, o.total_price, o.order_date, o.payment, o.status";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderView(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getDouble(6),
                        rs.getDate(7), rs.getString(8), rs.getString(9)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public double getTotalIncome() {
        double n = 0;
        String sql = "select sum(o.total_price) from [order] o ";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                n = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n;
    }

    public double getTotalIncomeYear(int year) {
        double n = 0;
        String sql = "select sum(o.total_price) from [order] o where  YEAR(o.order_date) = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            rs = ps.executeQuery();
            while (rs.next()) {
                n = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n;
    }

    public int getTotalOrder() {
        int n = 0;
        String sql = "select Count(o.order_id) from [order] o ";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                n = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n;
    }

    public int getChartTotalMoneyForYear(int mounth, int year) {
        int n = 0;
        String sql = "select sum(o.total_price)as totalmoney from [order] o \n"
                + "where  month(o.order_date) = ? and YEAR(o.order_date) = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, mounth);
            ps.setInt(2, year);
            rs = ps.executeQuery();
            while (rs.next()) {
                n = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n;
    }

    public ArrayList<Integer> getChartCategory() {
        ArrayList<Integer> n = new ArrayList<>();
        String sql = "select top 4 count(p.category_id)as total from order_detail od join product p \n"
                + "on od.product_id = p.product_id\n"
                + "group by p.category_id\n"
                + "order by total desc";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                n.add(rs.getInt(1));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n;
    }

    public ArrayList<String> getChartCategoryName() {
        ArrayList<String> n = new ArrayList<>();
        String sql = "select c.category_name from (select top 4 p.category_id, count(p.category_id)as total \n"
                + "from order_detail od join product p \n"
                + "on od.product_id = p.product_id\n"
                + "group by p.category_id\n"
                + "order by total desc) as a \n"
                + "join \n"
                + "category c\n"
                + "on a.category_id = c.category_id";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                n.add(rs.getString(1));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n;
    }

    // Chart 
    public int getChartStatusOrder(String status) {
        int n = 0;
        String sql = "select COUNT(o.status) from [order] o where o.status = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                n = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n;
    }

    public int getChartTotalOrderWeek(int day, int month, int year) {
        int n = 0;
        String sql = "select COUNT(o.order_id) from [order] o"
                + " where DAY(o.order_date) = ? and"
                + "  MONTH(o.order_date) = ? and YEAR(o.order_date) = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, day);
            ps.setInt(2, month);
            ps.setInt(3, year);
            rs = ps.executeQuery();
            while (rs.next()) {
                n = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n;
    }

    public int getChartTotalIncomeWeek(int day, int month, int year) {
        int n = 0;
        String sql = "select Sum(o.total_price) from [order] o "
                + "where DAY(o.order_date) = ? and  MONTH(o.order_date) = ? and YEAR(o.order_date) = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, day);
            ps.setInt(2, month);
            ps.setInt(3, year);
            rs = ps.executeQuery();
            while (rs.next()) {
                n = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n;
    }
    
    

}
