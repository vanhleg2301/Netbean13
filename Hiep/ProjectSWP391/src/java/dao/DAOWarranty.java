/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.OrderWarranty;
import model.ReportWarranty;
import model.Warranty;

/**
 *
 * @author Lenovo
 */
public class DAOWarranty extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Warranty> getAllWarranty() {
        ArrayList<Warranty> list = new ArrayList<>();
        String sql = "SELECT * FROM warranty";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Warranty(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDate(11), rs.getString(12), rs.getInt(13), rs.getString(14),rs.getString(15),rs.getString(16),rs.getDate(17)));
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
            String sql = "SELECT COUNT(*) FROM Warranty";
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

    public ArrayList<Warranty> pagingWarranty(int pageNumber, int pageSize) {
        ArrayList<Warranty> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM Warranty ORDER BY Warranty_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Warranty(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDate(11), rs.getString(12), rs.getInt(13), rs.getString(14),rs.getString(15),rs.getString(16),rs.getDate(17)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Warranty> getWarranty(int id) {
        ArrayList<Warranty> list = new ArrayList<>();
        String sql = "SELECT * FROM warranty where product_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Warranty(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDate(11), rs.getString(12), rs.getInt(13), rs.getString(14),rs.getString(15),rs.getString(16),rs.getDate(17)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Warranty> getWarrantyForID(int id) {
        ArrayList<Warranty> list = new ArrayList<>();
        String sql = "SELECT * FROM warranty where warranty_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Warranty(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDate(11), rs.getString(12), rs.getInt(13), rs.getString(14),rs.getString(15),rs.getString(16),rs.getDate(17)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertWarranty(Warranty w) {
        String sql = "INSERT INTO [dbo].[warranty]\n"
                + "           ([orderdetail_id]\n"
                + "           ,[product_id]\n"
                + "           ,[customer_id]\n"
                + "           ,[name]\n"
                + "           ,[phone]\n"
                + "           ,[product_name]\n"
                + "           ,[image]\n"
                + "           ,[image_product]\n"
                + "           ,[product_status]\n"
                + "           ,[warranty_date]\n"
                + "           ,[warranty_status]\n"
                + "           ,[warrant_quantity]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, w.getOrderdetail_id());
            ps.setInt(2, w.getProduct_id());
            ps.setInt(3, w.getCustomer_id());
            ps.setString(4, w.getName());
            ps.setString(5, w.getPhone());
            ps.setString(6, w.getProduct_name());
            ps.setString(7, w.getImage());
            ps.setString(8, w.getImage_product());
            ps.setString(9, w.getProduct_status());
            ps.setDate(10, w.getWarranty_date());
            ps.setString(11, w.getWarranty_status());
            ps.setInt(12, w.getWarranty_quantity());
            ps.setString(13, w.getStatus());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateStatus(String status, int warranty_id) {
        String sql = "UPDATE [dbo].[warranty]\n"
                + "    SET  [status] = ?\n"
                + " WHERE warranty_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, warranty_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateWarranty(String status, String image, Date date, int warranty_id) {
        String sql = "UPDATE [dbo].[warranty]\n"
                + "   SET [product_status_admin] = ?\n"
                + "      ,[image_product_admin] = ?\n"
                + "      ,[warranty_date_admin] = ?\n"
                + " WHERE warranty_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, image);
            ps.setDate(3, date);
            ps.setInt(4, warranty_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Warranty> OrderWarrantyCheckFor(int id) {
        ArrayList<Warranty> list = new ArrayList<>();
        String sql = "SELECT * FROM warranty where customer_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Warranty(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDate(11), rs.getString(12), rs.getInt(13), rs.getString(14),rs.getString(15),rs.getString(16),rs.getDate(17)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<OrderWarranty> OrderWarrantyCustomer(int id) {
        ArrayList<OrderWarranty> list = new ArrayList<>();
        String sql = "select * from (select od.orderdetail_id, od.customer_id,od.product_id,od.product_name,od.image,od.quantity_order,o.order_date\n"
                + "                from order_detail od join [order] o\n"
                + "               on od.order_id = o.order_id \n"
                + "                where od.customer_id = ? and  o.[status] = 'Done'\n"
                + "                group by od.orderdetail_id, od.customer_id,od.product_id,od.product_name,od.image,od.quantity_order,o.order_date) as a\n"
                + "				where a.orderdetail_id not in (select orderdetail_id from warranty)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderWarranty(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4),
                        rs.getString(5), rs.getInt(6), rs.getDate(7)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<OrderWarranty> OrderWarrantyIFNULLCustomer(int id) {
        ArrayList<OrderWarranty> list = new ArrayList<>();
        String sql = "select od.orderdetail_id, od.customer_id,od.product_id,od.product_name,od.image,od.quantity_order,o.order_date from order_detail od join [order] o\n"
                + "                on od.order_id = o.order_id \n"
                + "                where od.customer_id = ? and  o.[status] = 'Done'\n"
                + "                group by od.orderdetail_id, od.customer_id,od.product_id,od.product_name,od.image,od.quantity_order,o.order_date";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderWarranty(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4),
                        rs.getString(5), rs.getInt(6), rs.getDate(7)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Warranty> getAllStatusWarrantyCustomer(String status, int id) {
        ArrayList<Warranty> list = new ArrayList<>();
        String sql = "SELECT * FROM warranty where status = ? and customer_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Warranty(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDate(11), rs.getString(12), rs.getInt(13), rs.getString(14),rs.getString(15),rs.getString(16),rs.getDate(17)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Warranty> getAllStatusWarranty(String status) {
        ArrayList<Warranty> list = new ArrayList<>();
        String sql = "SELECT * FROM warranty where status = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Warranty(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDate(11), rs.getString(12), rs.getInt(13), rs.getString(14),rs.getString(15),rs.getString(16),rs.getDate(17)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Warranty> getAllWarrantyforProduct(int id) {
        ArrayList<Warranty> list = new ArrayList<>();
        String sql = "SELECT * FROM warranty where product_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Warranty(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDate(11), rs.getString(12), rs.getInt(13), rs.getString(14),rs.getString(15),rs.getString(16),rs.getDate(17)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Chart
    public int getChartStatusWarranty(String status) {
        int n = 0;
        String sql = "select COUNT(w.status) from warranty  w where w.status = ?";
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

    public ArrayList<ReportWarranty> ReportWarranty(int year) {
        ArrayList<ReportWarranty> list = new ArrayList<>();
        String sql = "select w.product_id, count(w.product_id) from warranty w \n"
                + "where year(w.warranty_date) = ?\n"
                + "group by w.product_id 	"
                + "order by count(w.product_id) desc";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ReportWarranty(rs.getInt(1), rs.getInt(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

}
