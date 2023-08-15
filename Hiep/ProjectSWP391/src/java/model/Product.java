/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Lenovo
 */
public class Product {

    private int product_id;
    private String product_name;
    private String sub_description;
    private String description;
    private String image;
    private double list_price;
    private double discount;
    private int category_id;
    private int brand_id;
    private String status;
    private String code;

    public Product() {
    }

    public Product(int product_id, String product_name, String sub_description, String description, String image, double list_price, double discount, int category_id, int brand_id, String status, String code) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.sub_description = sub_description;
        this.description = description;
        this.image = image;
        this.list_price = list_price;
        this.discount = discount;
        this.category_id = category_id;
        this.brand_id = brand_id;
        this.status = status;
        this.code = code;
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

    public String getSub_description() {
        return sub_description;
    }

    public void setSub_description(String sub_description) {
        this.sub_description = sub_description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    

}
