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
public class AddWarranty {

    private int orderdetail_id;
    private int order_id;
    private int product_id;
    private int customer_id;
    private String product_name;
    private String image;
    private int quantity_order;
    private String name;
    private String phone;
    private Date order_date;

    public AddWarranty() {
    }

    public AddWarranty(int orderdetail_id, int order_id, int product_id, int customer_id, String product_name, String image, int quantity_order, String name, String phone, Date order_date) {
        this.orderdetail_id = orderdetail_id;
        this.order_id = order_id;
        this.product_id = product_id;
        this.customer_id = customer_id;
        this.product_name = product_name;
        this.image = image;
        this.quantity_order = quantity_order;
        this.name = name;
        this.phone = phone;
        this.order_date = order_date;
    }

    public int getOrderdetail_id() {
        return orderdetail_id;
    }

    public void setOrderdetail_id(int orderdetail_id) {
        this.orderdetail_id = orderdetail_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
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

    public int getQuantity_order() {
        return quantity_order;
    }

    public void setQuantity_order(int quantity_order) {
        this.quantity_order = quantity_order;
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

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

}
