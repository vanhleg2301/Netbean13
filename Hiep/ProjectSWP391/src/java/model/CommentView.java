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
public class CommentView {
    
    private int comment_id;
    private int product_id;
    private int customer_id;
    private String customer_name;
    private String image;
    private Date comment_date;
    private String comment_content;

    public CommentView() {
    }

    public CommentView(int comment_id, int product_id, int customer_id, String customer_name, String image, Date comment_date, String comment_content) {
        this.comment_id = comment_id;
        this.product_id = product_id;
        this.customer_id = customer_id;
        this.customer_name = customer_name;
        this.image = image;
        this.comment_date = comment_date;
        this.comment_content = comment_content;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
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

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getComment_date() {
        return comment_date;
    }

    public void setComment_date(Date comment_date) {
        this.comment_date = comment_date;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }
    
    
    
}
