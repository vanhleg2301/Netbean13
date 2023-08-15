/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Lenovo
 */
public class OrderDetail {
    private int orderdetail_id;
    private int order_id;
    private int customer_id;
    private int product_id;
    private String product_name;
    private String image;
    private double list_price;
    private int quantity_order;

    public OrderDetail() {
    }

    public OrderDetail(int orderdetail_id, int order_id, int customer_id, int product_id, String product_name, String image, double list_price, int quantity_order) {
        this.orderdetail_id = orderdetail_id;
        this.order_id = order_id;
        this.customer_id = customer_id;
        this.product_id = product_id;
        this.product_name = product_name;
        this.image = image;
        this.list_price = list_price;
        this.quantity_order = quantity_order;
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

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
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

    public double getList_price() {
        return list_price;
    }

    public void setList_price(double list_price) {
        this.list_price = list_price;
    }

    public int getQuantity_order() {
        return quantity_order;
    }

    public void setQuantity_order(int quantity_order) {
        this.quantity_order = quantity_order;
    }

    
    
  
      
}
