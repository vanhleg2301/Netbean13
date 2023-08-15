/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.spring23.shopping;

/**
 *
 * @author DELL
 */
public class Product {
    private String productID, productName, description;
    private double price;
    private boolean status;
    private Integer quantity;

    public Product(String productID, String productName, String description, double price, boolean status) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.status = status;
    }

    public Product(String productID, String productName, String description, double price) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.price = price;
    }

    public Product(String productID, String productName, String description, double price, boolean status, Integer quantity) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.status = status;
        this.quantity = quantity;
    }
    
    

    public Product() {
    }

    public Product(String productID, String productName, String description, String price, String status) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
    
    
}
