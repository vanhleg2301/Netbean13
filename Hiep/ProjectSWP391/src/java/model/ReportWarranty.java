/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Lenovo
 */
public class ReportWarranty {

    private int product_id;
    private int total_warranty;

    public ReportWarranty() {
    }

    public ReportWarranty(int product_id, int total_warranty) {
        this.product_id = product_id;
        this.total_warranty = total_warranty;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getTotal_warranty() {
        return total_warranty;
    }

    public void setTotal_warranty(int total_warranty) {
        this.total_warranty = total_warranty;
    }

}
