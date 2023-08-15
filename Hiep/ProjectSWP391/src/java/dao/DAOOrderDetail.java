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
import model.AddWarranty;
import model.OrderDetail;

/**
 *
 * @author Lenovo
 */
public class DAOOrderDetail extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<OrderDetail> getAllOrderDetail() {
        ArrayList<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM [order_detail]";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getDouble(7), rs.getInt(8)));
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
            String sql = "SELECT COUNT(*) FROM order_detail";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

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

    public ArrayList<OrderDetail> pagingOrderDetail(int pageNumber, int pageSize) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM order_detail ORDER BY orderdetail_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getDouble(7), rs.getInt(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<OrderDetail> getOrderDetail(int id) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.[order_detail] where orderdetail_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getDouble(7), rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<AddWarranty> getOrderDetailWarranty(int id) {
        ArrayList<AddWarranty> list = new ArrayList<>();
        String sql = "SELECT od.orderdetail_id,od.order_id,od.product_id,od.customer_id,od.product_name,\n"
                + "od.[image],od.quantity_order,o.name_receiver,o.phone_receiver,o.order_date\n"
                + "FROM dbo.[order_detail] od join [order] o\n"
                + "on od.order_id = o.order_id where od.orderdetail_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new AddWarranty(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getInt(7), rs.getString(8), rs.getString(9), rs.getDate(10)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<OrderDetail> DetailOrderDetail(int id) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.[order_detail] where order_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getDouble(7), rs.getInt(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertOrderDetail(OrderDetail od) {
        String sql = "INSERT INTO [dbo].[order_detail]\n"
                + "           ([order_id]\n"
                + "           ,[customer_id]\n"
                + "           ,[product_id]\n"
                + "           ,[product_name]\n"
                + "           ,[image]\n"
                + "           ,[list_price]\n"
                + "           ,[quantity_order])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, od.getOrder_id());
            ps.setInt(2, od.getCustomer_id());
            ps.setInt(3, od.getProduct_id());
            ps.setString(4, od.getProduct_name());
            ps.setString(5, od.getImage());
            ps.setDouble(6, od.getList_price());
            ps.setInt(7, od.getQuantity_order());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateOrderDetail(OrderDetail od) {
        String sql = "UPDATE [dbo].[order_detail]\n"
                + "   SET [order_id] = ?\n"
                + "      ,[customer_id] = ?\n"
                + "      ,[product_id] = ?\n"
                + "      ,[product_name] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[list_price] = ?\n"
                + "      ,[quantity_order] = ?\n"
                + " WHERE orderdetail_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, od.getOrder_id());
            ps.setInt(2, od.getCustomer_id());
            ps.setInt(3, od.getProduct_id());
            ps.setString(4, od.getProduct_name());
            ps.setString(5, od.getImage());
            ps.setDouble(6, od.getList_price());
            ps.setInt(7, od.getQuantity_order());
            ps.setInt(8, od.getOrderdetail_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getTotalProductSold() {
        int n = 0;
        String sql = "select Sum(quantity_order) from order_detail";
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

}
