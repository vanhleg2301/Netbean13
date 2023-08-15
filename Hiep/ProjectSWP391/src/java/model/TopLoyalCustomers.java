/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Lenovo
 */
public class TopLoyalCustomers {
    private int customer_id;
    private double total_price;
    private String name;
    private String image;

    public TopLoyalCustomers() {
    }

    public TopLoyalCustomers(int customer_id, double total_price, String name, String image) {
        this.customer_id = customer_id;
        this.total_price = total_price;
        this.name = name;
        this.image = image;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    
    
    
}
