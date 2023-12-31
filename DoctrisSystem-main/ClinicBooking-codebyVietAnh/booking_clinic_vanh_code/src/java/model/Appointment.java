/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author DELL
 */
public class Appointment {

    private int id;
    private Patient patient;
    private Doctor doctor;
    private Account staff;
    private Date date;
    private Time time;
    private String status;
    private double fee;
    private String description;

    public Appointment() {
    }

    public Appointment(int id, Patient patient, Date date, Time time, String status) {
        this.id = id;
        this.patient = patient;
        this.date = date;
        this.time = time;
        this.status = status;
    }

    public Appointment(int id, Patient patient, Doctor doctor, Account staff, Date date, Time time, String status, double fee, String description) {
        this.id = id;
        this.patient = patient;
        this.doctor = doctor;
        this.staff = staff;
        this.date = date;
        this.time = time;
        this.status = status;
        this.fee = fee;
        this.description = description;
    }

    public Appointment(int id, Patient patient, Doctor doctor, Date date, Time time, String status) {
        this.id = id;
        this.patient = patient;
        this.doctor = doctor;
        this.date = date;
        this.time = time;
        this.status = status;
    }

    public Appointment(Date date, Time time, String status) {
        this.date = date;
        this.time = time;
        this.status = status;
    }

    public Appointment(String description, String status, double fee) {
        this.description = description;
        this.status = status;
        this.fee = fee; 
    }

    public Appointment(Date date) {
        this.date = date;
    }
    
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Account getStaff() {
        return staff;
    }

    public void setStaff(Account staff) {
        this.staff = staff;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getFee() {
        return fee;
    }

    public void setFee(double fee) {
        this.fee = fee;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
