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
import model.Brand;
import model.Product;
import model.ProductView;

/**
 *
 * @author Lenovo
 */
public class DAOProduct extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<ProductView> getAllProduct() {
        ArrayList<ProductView> list = new ArrayList<>();
        String sql = "select a.product_id, a.product_name, a.image, a.list_price, a.discount,a.category_name, b.brand_name, a.status,a.code from \n"
                + "(select p.product_id, p.product_name, p.image, p.list_price, p.discount,c.category_name, p.brand_id, p.status from product p  join category  c\n"
                + "on p.category_id = c.category_id \n"
                + "group by p.product_id, p.product_name, p.image, p.list_price, p.discount,c.category_name, p.brand_id, p.status) as a\n"
                + "\n"
                + "join \n"
                + "\n"
                + "brand b \n"
                + "on  a.brand_id = b.brand_id \n"
                + "group by a.product_id, a.product_name, a.image, a.list_price, a.discount,a.category_name, b.brand_name, a.status";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductView(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDouble(4), rs.getDouble(5),
                        rs.getString(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public ArrayList<ProductView> pagingProductView(int pageNumber, int pageSize) {
        ArrayList<ProductView> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "select a.product_id, a.product_name, a.image, a.list_price, a.discount,a.category_name, b.brand_name, a.status from \n"
                + "                (select p.product_id, p.product_name, p.image, p.list_price, p.discount,c.category_name, p.brand_id, p.status from product p  join category  c\n"
                + "                on p.category_id = c.category_id \n"
                + "                group by p.product_id, p.product_name, p.image, p.list_price, p.discount,c.category_name, p.brand_id, p.status) as a\n"
                + "                join\n"
                + "                brand b\n"
                + "                on  a.brand_id = b.brand_id \n"
                + "                group by a.product_id, a.product_name, a.image, a.list_price, a.discount,a.category_name, b.brand_name, a.status\n"
                + "				ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductView(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<ProductView> pagingProductViewWarranty(int pageNumber, int pageSize) {
        ArrayList<ProductView> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "select c.product_id, c.product_name, c.image, c.list_price, c.discount, c.category_name, c.brand_name, c.status  from (select a.product_id, a.product_name, a.image, a.list_price, a.discount,a.category_name, b.brand_name, a.status from \n"
                + "(select p.product_id, p.product_name, p.image, p.list_price, p.discount,c.category_name, p.brand_id, p.status from product p  join category  c \n"
                + "on p.category_id = c.category_id \n"
                + "group by p.product_id, p.product_name, p.image, p.list_price, p.discount,c.category_name, p.brand_id, p.status) as a \n"
                + "join\n"
                + "brand b\n"
                + "on  a.brand_id = b.brand_id) as c \n"
                + "join warranty w \n"
                + "on w.product_id = c.product_id \n"
                + "ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductView(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getDouble(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<ProductView> searchProduct(String name) {
        ArrayList<ProductView> list = new ArrayList<>();
        String sql = "select a.product_id, a.product_name, a.image, a.list_price, a.discount,a.category_name, b.brand_name, a.status from \n"
                + "(select p.product_id, p.product_name, p.image, p.list_price, p.discount,c.category_name, p.brand_id, p.status from product p  join category  c\n"
                + "on p.category_id = c.category_id \n"
                + "group by p.product_id, p.product_name, p.image, p.list_price, p.discount,c.category_name, p.brand_id, p.status) as a\n"
                + "\n"
                + "join \n"
                + "\n"
                + "brand b \n"
                + "on  a.brand_id = b.brand_id where a.product_name LIKE '%' + ? + '%' \n"
                + "group by a.product_id, a.product_name, a.image, a.list_price, a.discount,a.category_name, b.brand_name, a.status";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductView(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getDouble(4), rs.getDouble(5),
                        rs.getString(6), rs.getString(7), rs.getString(8)));
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public ArrayList<Product> getViewProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from product";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDouble(6), rs.getDouble(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public ArrayList<Product> getProduct(int id) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.product where product_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDouble(6), rs.getDouble(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public ArrayList<Product> getProductByCode(String code) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM dbo.product where code like ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, code);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDouble(6), rs.getDouble(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public void insertProduct(Product p) {
        String sql = "INSERT INTO [dbo].[product]\n"
                + "           ([product_name]\n"
                + "           ,[sub_description]\n"
                + "           ,[description]\n"
                + "           ,[image]\n"
                + "           ,[list_price]\n"
                + "           ,[discount]\n"
                + "           ,[category_id]\n"
                + "           ,[brand_id]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, p.getProduct_name());
            ps.setString(2, p.getSub_description());
            ps.setString(3, p.getDescription());
            ps.setString(4, p.getImage());
            ps.setDouble(5, p.getList_price());
            ps.setDouble(6, p.getDiscount());
            ps.setInt(7, p.getCategory_id());
            ps.setInt(8, p.getBrand_id());
            ps.setString(9, p.getStatus());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void updateProduct(Product p) {
        String sql = "UPDATE [dbo].[product]\n"
                + "   SET [product_name] = ?\n"
                + "      ,[sub_description] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[list_price] = ?\n"
                + "      ,[discount] = ?\n"
                + "      ,[category_id] = ?\n"
                + "      ,[brand_id] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE product_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, p.getProduct_name());
            ps.setString(2, p.getSub_description());
            ps.setString(3, p.getDescription());
            ps.setString(4, p.getImage());
            ps.setDouble(5, p.getList_price());
            ps.setDouble(6, p.getDiscount());
            ps.setInt(7, p.getCategory_id());
            ps.setInt(8, p.getBrand_id());
            ps.setString(9, p.getStatus());
            ps.setInt(10, p.getProduct_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<Product> searchProductByCategory(int category_id, int pageNumber, int pageSize) {
        ArrayList<Product> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM product WHERE category_id = ? and [status] like 'Stocking' ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, category_id);
            ps.setInt(2, offset);
            ps.setInt(3, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDouble(6), rs.getDouble(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> searchProductByBrand(int brand_id, int pageNumber, int pageSize) {
        ArrayList<Product> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM product WHERE brand_id = ? and [status] like 'Stocking' ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, brand_id);
            ps.setInt(2, offset);
            ps.setInt(3, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDouble(6), rs.getDouble(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> searchProductByName(String product_name, int pageNumber, int pageSize) {
        ArrayList<Product> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM product WHERE product_name and [status] like 'Stocking' LIKE ? ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + product_name + "%");
            ps.setInt(2, offset);
            ps.setInt(3, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDouble(6), rs.getDouble(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public ArrayList<Product> searchProductByPriceRange(double minPrice, double maxPrice, int pageNumber, int pageSize) {
        ArrayList<Product> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM product WHERE list_price >= ? AND list_price <= ? and [status] like 'Stocking' ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setDouble(1, minPrice);
            ps.setDouble(2, maxPrice);
            ps.setInt(3, offset);
            ps.setInt(4, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDouble(6), rs.getDouble(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> searchProductByPriceGreater(double minPrice, int pageNumber, int pageSize) {
        ArrayList<Product> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM product WHERE list_price >= ? and [status] like 'Stocking'  ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setDouble(1, minPrice);
            ps.setInt(2, offset);
            ps.setInt(3, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDouble(6), rs.getDouble(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalPages(int pageSize) {
        int totalRecords = 0;
        int totalPages = 0;

        try {
            String sql = "SELECT COUNT(*) FROM product";
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

    public ArrayList<Product> pagingProduct(int pageNumber, int pageSize) {
        ArrayList<Product> list = new ArrayList<>();
        int offset = (pageNumber - 1) * pageSize;
        String sql = "SELECT * FROM product where [status] like 'Stocking' ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDouble(6), rs.getDouble(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalPagesByCategory(int categoryId, int pageSize) {
        int totalRecords = 0;
        int totalPages = 0;

        try {
            String sql = "SELECT COUNT(*) FROM product WHERE category_id = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
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

    public int getTotalPagesByBrand(int brandId, int pageSize) {
        int totalRecords = 0;
        int totalPages = 0;

        try {
            String sql = "SELECT COUNT(*) FROM product WHERE brand_id = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, brandId);
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

    public int getTotalPagesByName(String productName, int pageSize) {
        int totalRecords = 0;
        int totalPages = 0;

        try {
            String sql = "SELECT COUNT(*) FROM product WHERE product_name LIKE ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + productName + "%");
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

    public int getTotalPagesByPriceRange(double minPrice, double maxPrice, int pageSize) {
        int totalRecords = 0;
        int totalPages = 0;

        try {
            String sql = "SELECT COUNT(*) FROM product WHERE list_price >= ? AND list_price <= ?";
            ps = connection.prepareStatement(sql);
            ps.setDouble(1, minPrice);
            ps.setDouble(2, maxPrice);
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

    public int getTotalPagesByPriceGreater(double minPrice, int pageSize) {
        int totalRecords = 0;
        int totalPages = 0;

        try {
            String sql = "SELECT COUNT(*) FROM product WHERE list_price > ?";
            ps = connection.prepareStatement(sql);
            ps.setDouble(1, minPrice);
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

    public int deleteProduct(int id) {
        int n = 0;
        String sql = "delete from product where product_id=" + id;
        Statement state;
        try {
            state = connection.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ArrayList<Product> getFeaturedProductsProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT  top (12) *\n"
                + "  FROM [dbo].[product]\n"
                + "  where discount is null or discount = 0 and status like 'Stocking' order by product_id desc";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDouble(6), rs.getDouble(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Product> getBestSellingProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "	\n"
                + "select  p.product_id, p.product_name,p.sub_description ,p.description, p.image,p.list_price, p.discount,p.category_id,p.brand_id,p.status,p.code  from (select top (10) p.product_id, count(od.quantity_order) as quantity from product p join order_detail od \n"
                + "                on p.product_id = od.product_id and status like 'Stocking'\n"
                + "                group by p.product_id\n"
                + "				order by quantity desc\n"
                + "				) as a\n"
                + "				join \n"
                + "				product p\n"
                + "				on  a.product_id = p.product_id";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDouble(6), rs.getDouble(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Product> getFlashSalesProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT *\n"
                + "  FROM [dbo].[product]\n"
                + "  where discount is not null and discount !=0 and  status like 'Stocking'";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDouble(6), rs.getDouble(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalProduct() {
        int n = 0;
        String sql = "select COUNT(product.brand_id) as total_product from product";
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

    public ArrayList<Product> getRelatedProducts(int id) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select p.product_id,p.product_name,p.sub_description,p.description, p.image,"
                + "p.list_price,p.discount,p.category_id,p.brand_id,p.status,p.code from"
                + "(SELECT * FROM dbo.product where product_id = ? ) as a\n"
                + "\n"
                + "join \n"
                + "\n"
                + "product p \n"
                + "\n"
                + "on a.category_id = p.category_id";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDouble(6), rs.getDouble(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Product> getRelatedProductsByCode(String code) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select p.product_id,p.product_name,p.sub_description,p.description, p.image,"
                + "p.list_price,p.discount,p.category_id,p.brand_id,p.status,p.code from"
                + "(SELECT * FROM dbo.product where code like ? ) as a\n"
                + "\n"
                + "join \n"
                + "\n"
                + "product p \n"
                + "\n"
                + "on a.category_id = p.category_id";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, code);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getDouble(6), rs.getDouble(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

}
