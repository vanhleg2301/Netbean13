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
public class Contact {
    private int contact_id;
    private String name;
    private String email;
    private Date  contact_date;
    private String contact_content;

    public Contact() {
    }

    public Contact(int contact_id, String name, String email, Date contact_date, String contact_content) {
        this.contact_id = contact_id;
        this.name = name;
        this.email = email;
        this.contact_date = contact_date;
        this.contact_content = contact_content;
    }

    public int getContact_id() {
        return contact_id;
    }

    public void setContact_id(int contact_id) {
        this.contact_id = contact_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getContact_date() {
        return contact_date;
    }

    public void setContact_date(Date contact_date) {
        this.contact_date = contact_date;
    }

    public String getContact_content() {
        return contact_content;
    }

    public void setContact_content(String contact_content) {
        this.contact_content = contact_content;
    }
    
    
}
