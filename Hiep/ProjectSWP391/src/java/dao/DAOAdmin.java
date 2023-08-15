/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin;

/**
 *
 * @author Lenovo
 */
public class DAOAdmin extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Admin> getAllAdmin() {
        ArrayList<Admin> list = new ArrayList<>();
        String sql = "SELECT * FROM admin";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Admin(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
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
            String sql = "SELECT COUNT(*) FROM admin";
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

    public ArrayList<Admin> pagingAdmin(int pageNumber, int pageSize) {
        ArrayList<Admin> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM admin ORDER BY admin_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Admin(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Admin> getAdmin(int id) {
        ArrayList<Admin> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.admin where admin_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Admin(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Admin> searchAdmin(String name) {
        ArrayList<Admin> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.admin a where a.name LIKE '%' + ? + '%'";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Admin(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertAdmin(Admin ad) {
        String sql = "INSERT INTO [dbo].[admin]\n"
                + "           ([role]\n"
                + "           ,[name]\n"
                + "           ,[phone]\n"
                + "           ,[gmail]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, ad.getRole());
            ps.setString(2, ad.getName());
            ps.setString(3, ad.getPhone());
            ps.setString(4, ad.getGmail());
            ps.setString(5, ad.getUsername());
            ps.setString(6, ad.getPassword());
            ps.setString(7, ad.getStatus());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
//

    public void updateAdmin(Admin ad) {
        String sql = "UPDATE [dbo].[admin]\n"
                + "   SET [role] = ?\n"
                + "      ,[name] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[gmail] = ?\n"
                + "      ,[username] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE admin_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, ad.getRole());
            ps.setString(2, ad.getName());
            ps.setString(3, ad.getPhone());
            ps.setString(4, ad.getName());
            ps.setString(5, ad.getUsername());
            ps.setString(6, ad.getPassword());
            ps.setString(7, ad.getStatus());
            ps.setInt(8, ad.getAdmin_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateAdminStatus(int id, String status) {
        String sql = "UPDATE [dbo].[admin]\n"
                + "   SET [status] = ?\n"
                + " WHERE admin_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Admin checkLogin(String user, String pass) {
        String sql = "SELECT * FROM [dbo].[admin] Where [username] = ? and [password] = ? and [status] like 'Active'";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Admin(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int removeAdmin(int id) {
        int n = 0;
        String sql = "delete from admin where admin_id= " + id;
        try {
            ps = connection.prepareStatement(sql);
            n = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return n;
    }

    public void changePassword(String newpass, String username) {
        String sql = "UPDATE [dbo].[admin] SET [password]=? where [username]=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, newpass);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void updatePassword(String email, String newPassword) {
        try {
            // Tạo truy vấn SQL cập nhật mật khẩu mới trong cơ sở dữ liệu
            String query = "UPDATE admin SET password = ? WHERE gmail = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, newPassword);
            statement.setString(2, email);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
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

    public boolean checkUsernameAndEmailExists(String username, String email) {
        try {
            // Tạo truy vấn SQL kiểm tra username và email tồn tại trong cơ sở dữ liệu
            String query = "SELECT COUNT(*) FROM admin WHERE username like ? AND gmail like ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, email);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public void editProfileAdmin(String role, String name, String phone, String gmail, int admin_id) {
        String sql = "UPDATE [dbo].[admin]\n"
                + "   SET [role] = ?\n"
                + "      ,[name] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[gmail] = ?\n"
                + " WHERE admin_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, role);
            ps.setString(2, name);
            ps.setString(3, phone);
            ps.setString(4, gmail);
            ps.setInt(5, admin_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
