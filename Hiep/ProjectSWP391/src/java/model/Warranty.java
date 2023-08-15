/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Lenovo
 */
public class Warranty {

    private int warranty_id;
    private int orderdetail_id;
    private int product_id;
    private int customer_id;
    private String name;
    private String phone;
    private String product_name;
    private String image;
    private String image_product;
    private String product_status;
    private Date warranty_date;
    private String  warranty_status;
    private int warranty_quantity;
    private String status;
    private String product_status_admin;
    private String image_product_admin;
    private Date warranty_date_admin;
    

    public Warranty() {
    }

    public Warranty(int warranty_id, int orderdetail_id, int product_id, int customer_id, String name, String phone, String product_name, String image, String image_product, String product_status, Date warranty_date, String warranty_status, int warranty_quantity, String status, String product_status_admin, String image_product_admin, Date warranty_date_admin) {
        this.warranty_id = warranty_id;
        this.orderdetail_id = orderdetail_id;
        this.product_id = product_id;
        this.customer_id = customer_id;
        this.name = name;
        this.phone = phone;
        this.product_name = product_name;
        this.image = image;
        this.image_product = image_product;
        this.product_status = product_status;
        this.warranty_date = warranty_date;
        this.warranty_status = warranty_status;
        this.warranty_quantity = warranty_quantity;
        this.status = status;
        this.product_status_admin = product_status_admin;
        this.image_product_admin = image_product_admin;
        this.warranty_date_admin = warranty_date_admin;
    }

    public int getWarranty_id() {
        return warranty_id;
    }

    public void setWarranty_id(int warranty_id) {
        this.warranty_id = warranty_id;
    }

    public int getOrderdetail_id() {
        return orderdetail_id;
    }

    public void setOrderdetail_id(int orderdetail_id) {
        this.orderdetail_id = orderdetail_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImage_product() {
        return image_product;
    }

    public void setImage_product(String image_product) {
        this.image_product = image_product;
    }

    public String getProduct_status() {
        return product_status;
    }

    public void setProduct_status(String product_status) {
        this.product_status = product_status;
    }

    public Date getWarranty_date() {
        return warranty_date;
    }

    public void setWarranty_date(Date warranty_date) {
        this.warranty_date = warranty_date;
    }

    public String getWarranty_status() {
        return warranty_status;
    }

    public void setWarranty_status(String warranty_status) {
        this.warranty_status = warranty_status;
    }

    public int getWarranty_quantity() {
        return warranty_quantity;
    }

    public void setWarranty_quantity(int warranty_quantity) {
        this.warranty_quantity = warranty_quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getProduct_status_admin() {
        return product_status_admin;
    }

    public void setProduct_status_admin(String product_status_admin) {
        this.product_status_admin = product_status_admin;
    }

    public String getImage_product_admin() {
        return image_product_admin;
    }

    public void setImage_product_admin(String image_product_admin) {
        this.image_product_admin = image_product_admin;
    }

    public Date getWarranty_date_admin() {
        return warranty_date_admin;
    }

    public void setWarranty_date_admin(Date warranty_date_admin) {
        this.warranty_date_admin = warranty_date_admin;
    }
    
}
