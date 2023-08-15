/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;
import model.Product;
import model.User;


/**
 *
 * @author Admin
 */
public class DAO extends DBContext {

    public boolean existed(String email) {
        String sql = "select * from Account where email=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    //register
    public void register(Account a) {
        String sql = "insert into Account values(?,?,?,2)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUserID());
            st.setString(2, a.getEmail());
            st.setString(3, a.getPassword());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //login
    public Account check(String email, String password) {
        String sql = "select * from Account where Email=? and Password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getString("UserID"),
                        rs.getString("Email"),
                        rs.getString("Password"),
                        rs.getInt("Role"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // change password
    public void change(Account a) {
        String sql = "Update Account set Password=? where Email=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getPassword());
            st.setString(2, a.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //get all products
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("Image"),
                        rs.getInt("Price"),
                        rs.getString("Description"),
                        rs.getInt("CateID")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //get feature products
    public List<Product> getFeatureProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select Top 4 * from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("Image"),
                        rs.getInt("Price"),
                        rs.getString("Description"),
                        rs.getInt("CateID")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //get lastest products
    public List<Product> getLastestProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select Top 8 * from Product Order By ID desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("Image"),
                        rs.getInt("Price"),
                        rs.getString("Description"),
                        rs.getInt("CateID")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //get all categories
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("cID"),
                        rs.getString("cName")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public Category getCategoryByID(int id) {
        String sql = "select * from Category where cid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                 return (new Category(rs.getInt("cID"),
                        rs.getString("cName")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //get product detail
    public Product getProductDetail(int id) {
        String sql = "select * from Product where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product c = new Product(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getInt("price"),
                        rs.getString("description"),
                        rs.getInt("CateID"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //get related product
    public List<Product> getRelatedProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where id = '9' "
                + "or id = '3' "
                + "or id = '11' "
                + "or id = '12'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("Image"),
                        rs.getInt("Price"),
                        rs.getString("Description"),
                        rs.getInt("CateID")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //get all product by cid
    public List<Product> getAllProductByCateID(String cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where CateID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("Image"),
                        rs.getInt("Price"),
                        rs.getString("Description"),
                        rs.getInt("CateID")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // search by name
    public List<Product> searchByTitle(String name) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                p.setName(rs.getString("Name"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("Price"));
                p.setDescription(rs.getString("Description"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //search by price
    public List<Product> searchByPrice(int fPrice, int tPrice) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where price between ? and ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, fPrice);
            st.setInt(2, tPrice);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ID"));
                p.setName(rs.getString("Name"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getInt("Price"));
                p.setDescription(rs.getString("Description"));
                list.add(p);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    // sort by price ASC
    public List<Product> SortByPriceAsc() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product Order By Price ASC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("Image"),
                        rs.getInt("Price"),
                        rs.getString("Description"),
                        rs.getInt("CateID")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // sort by price DESC
    public List<Product> SortByPriceDesc() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product Order By Price DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("Image"),
                        rs.getInt("Price"),
                        rs.getString("Description"),
                        rs.getInt("CateID")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // sort by price ASC oder by cid
    public List<Product> SortByPriceAsc(int cateID) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where CateID = ? Order By Price ASC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cateID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("Image"),
                        rs.getInt("Price"),
                        rs.getString("Description"),
                        rs.getInt("CateID")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // sort by price DESC order by cid
    public List<Product> SortByPriceDes(int cateID) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where CateID = ? Order By Price DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cateID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("Image"),
                        rs.getInt("Price"),
                        rs.getString("Description"),
                        rs.getInt("CateID")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // sort by name A - Z
    public List<Product> SortByNameAsc() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product Order By Name ASC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("Image"),
                        rs.getInt("Price"),
                        rs.getString("Description"),
                        rs.getInt("CateID")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // sort by name Z - A
    public List<Product> SortByNameDesc() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product Order By Name DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("Image"),
                        rs.getInt("Price"),
                        rs.getString("Description"),
                        rs.getInt("CateID")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // get profile
    public User getProfile() {
        String sql = "SELECT [UserID]\n"
                + "      ,[Fullname]\n"
                + "      ,[Age]\n"
                + "      ,[Address]\n"
                + "      ,[Phone]\n"
                + "      ,[Gender]\n"
                + "  FROM [dbo].[User]\n"
                + "\n"
                + "  where UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(rs.getString("UserID"),
                        rs.getString("Fullname"),
                        rs.getInt("Age"),
                        rs.getString("Address"),
                        rs.getLong("Phone"),
                        rs.getString("Gender"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    // get list of product order by ID desc
    public List<Product> getAllProductByDescId() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product Order By ID Desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("Image"),
                        rs.getInt("Price"),
                        rs.getString("Description"),
                        rs.getInt("CateID")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //add product 
    public void addProduct(String name, String image, int price, String description, int cateID) {
        String sql = "insert into Product values(?,?,?,?,?) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setInt(3, price);
            st.setString(4, description);
            st.setInt(5, cateID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // delete product
    public void delete(int id) {
        String sql = "delete from Product where ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // update product
    public void updateProduct(Product a) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [Name] = ?\n"
                + "      ,[Image] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[CateID] = ?\n"
                + " WHERE ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getName());
            st.setString(2, a.getImage());
            st.setInt(3, a.getPrice());
            st.setString(4, a.getDescription());
            st.setInt(5, a.getCateID());
            st.setInt(6, a.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    // split page
    public int getNumberPage() {
        String sql = "select count(*) from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 12;
                if (total % 12 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (SQLException e) {
        }
        return 0;
    }
    
    public List<Product> getPaging(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product order by ID\n"
                + "OFFSET ? ROWS \n"
                + "FETCH FIRST 12 ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 12);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("Image"),
                        rs.getInt("Price"),
                        rs.getString("Description"),
                        rs.getInt("CateID")));
            }
            return list;
        } catch (SQLException e) {
        }
        return null;
    }

//    public static void main(String[] args) {
//        DAO dao = new DAO();
//        List<Product> listp = dao.getAllProduct();
//        System.out.println(listp.get(0).getCateID());
//    }
}
