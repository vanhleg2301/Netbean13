/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;
import model.TopLoyalCustomers;

/**
 *
 * @author Lenovo
 */
public class DAOCustomer extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Customer> getAllCustomer() {
        ArrayList<Customer> list = new ArrayList<>();
        String sql = "SELECT * FROM customer";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getDate(5), rs.getString(6), rs.getBoolean(7),
                        rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Customer> getCustomer(int id) {
        ArrayList<Customer> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.customer where customer_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getDate(5), rs.getString(6), rs.getBoolean(7),
                        rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11)));
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
            String sql = "SELECT COUNT(*) FROM customer";
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

    public ArrayList<Customer> pagingCustomer(int pageNumber, int pageSize) {
        ArrayList<Customer> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM customer ORDER BY customer_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getDate(5), rs.getString(6), rs.getBoolean(7),
                        rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Customer> searchCustomer(String name) {
        ArrayList<Customer> list = new ArrayList<>();
        String sql = "select * from customer c where c.name LIKE '%' + ? + '%'";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getDate(5), rs.getString(6), rs.getBoolean(7),
                        rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Customer> getCustomerUsername(String username) {
        ArrayList<Customer> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.customer where username = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getDate(5), rs.getString(6), rs.getBoolean(7),
                        rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertCustomer(Customer cus) {
        String sql = "INSERT INTO [dbo].[customer]\n"
                + "           ([name]\n"
                + "           ,[phone]\n"
                + "           ,[dob]\n"
                + "           ,[gmail]\n"
                + "           ,[gender]\n"
                + "           ,[address]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, cus.getName());
            ps.setString(2, cus.getPhone());
            ps.setDate(3, cus.getDob());
            ps.setString(4, cus.getGmail());
            ps.setBoolean(5, cus.isGender());
            ps.setString(6, cus.getAddress());
            ps.setString(7, cus.getUsername());
            ps.setString(8, cus.getPassword());
            ps.setString(9, cus.getStatus());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCustomer(Customer cus) {
        String sql = "UPDATE [dbo].[customer]\n"
                + "   SET [name] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[gmail] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[username] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE customer_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, cus.getName());
            ps.setString(2, cus.getPhone());
            ps.setDate(3, cus.getDob());
            ps.setString(4, cus.getGmail());
            ps.setBoolean(5, cus.isGender());
            ps.setString(6, cus.getAddress());
            ps.setString(7, cus.getUsername());
            ps.setString(8, cus.getPassword());
            ps.setString(9, cus.getStatus());
            ps.setInt(10, cus.getCustomer_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCustomerStatus(int id, String status) {
        String sql = "UPDATE [dbo].[customer]\n"
                + "   SET [status] = ?\n"
                + " WHERE customer_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Customer checkLogin(String user, String pass) {
        String sql = "SELECT * FROM [dbo].[customer] Where [username] = ? and [password] = ? and [status] like 'Active'";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Customer(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getDate(5), rs.getString(6), rs.getBoolean(7),
                        rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void changePassword(String newpass, String username) {
        String sql = "UPDATE [dbo].[customer] SET [password]=? where [username]=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, newpass);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public int deleteCustomer(int id) {
        int n = 0;
        String sql = "delete from customer where customer_id= " + id;
        Statement state;
        try {
            state = connection.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int getTotalCustomer() {
        int n = 0;
        String sql = "select COUNT(c.customer_id) as total_customer from customer c ";
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

    public ArrayList<TopLoyalCustomers> Toployalcustomers() {
        ArrayList<TopLoyalCustomers> list = new ArrayList<>();
        String sql = "select top (5) c.customer_id,sum(o.total_price) as total_price, c.name,c.image from [order] o join customer c\n"
                + "                on o.customer_id = c.customer_id\n"
                + "                group by c.customer_id,c.name,c.image\n"
                + "                order by total_price desc";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TopLoyalCustomers(rs.getInt(1), rs.getDouble(2), rs.getString(3), rs.getString(4)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean checkUsernameAndEmailExists(String username, String email) {
        try {
            // Tạo truy vấn SQL kiểm tra username và email tồn tại trong cơ sở dữ liệu
            String query = "SELECT COUNT(*) FROM customer WHERE username like ? AND gmail like ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, email);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public void saveOTP(String email, String otp, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("otp", otp);
        session.setAttribute("email", email);
    }

    public boolean verifyOTP(String email, String otp, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String storedOTP = (String) session.getAttribute("otp");
        return storedOTP != null && storedOTP.equals(otp) && email.equals(session.getAttribute("email"));
    }

    public String getEmailFromSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (String) session.getAttribute("email");
    }

    public void updatePassword(String email, String newPassword) {
        try {
            // Tạo truy vấn SQL cập nhật mật khẩu mới trong cơ sở dữ liệu
            String query = "UPDATE customer SET password = ? WHERE gmail = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, newPassword);
            statement.setString(2, email);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editCustomer(String name, String phone, Date dob, String gmail,
            boolean gender, String address, int customer_id) {
        String sql = "UPDATE [dbo].[customer]\n"
                + "   SET [name] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[gmail] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[address] = ?\n"
                + " WHERE customer_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setDate(3, dob);
            ps.setString(4, gmail);
            ps.setBoolean(5, gender);
            ps.setString(6, address);
            ps.setInt(7, customer_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void uploadImageCustomer(String image, int customer_id) {
        String sql = "UPDATE [dbo].[customer]\n"
                + "   SET [image] = ?\n"
                + " WHERE customer_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, image);
            ps.setInt(2, customer_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertGuestCustomer(String name, String phone, String gmail,
            boolean gender, String address, String username, String password, String status) {
        String sql = "INSERT INTO [dbo].[customer]\n"
                + "           ([name]\n"
                + "           ,[phone]\n"
                + "           ,[gmail]\n"
                + "           ,[gender]\n"
                + "           ,[address]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, gmail);
            ps.setBoolean(4, gender);
            ps.setString(5, address);
            ps.setString(6, username);
            ps.setString(7, password);
            ps.setString(8, status);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
