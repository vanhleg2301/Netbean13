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
public class OrderView {

    private int order_id;
    private String customer_name;
    private String name_receiver;
    private String phone_receiver;
    private String address_receiver;
    private double total_price;
    private Date order_date;
    private String payment;
    private String status;

    public OrderView() {
    }

    public OrderView(int order_id, String customer_name, String name_receiver, String phone_receiver, String address_receiver, double total_price, Date order_date, String payment, String status) {
        this.order_id = order_id;
        this.customer_name = customer_name;
        this.name_receiver = name_receiver;
        this.phone_receiver = phone_receiver;
        this.address_receiver = address_receiver;
        this.total_price = total_price;
        this.order_date = order_date;
        this.payment = payment;
        this.status = status;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getName_receiver() {
        return name_receiver;
    }

    public void setName_receiver(String name_receiver) {
        this.name_receiver = name_receiver;
    }

    public String getPhone_receiver() {
        return phone_receiver;
    }

    public void setPhone_receiver(String phone_receiver) {
        this.phone_receiver = phone_receiver;
    }

    public String getAddress_receiver() {
        return address_receiver;
    }

    public void setAddress_receiver(String address_receiver) {
        this.address_receiver = address_receiver;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
