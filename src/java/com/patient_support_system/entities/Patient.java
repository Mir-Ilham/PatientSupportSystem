package com.patient_support_system.entities;

import java.sql.Date;
import java.sql.Timestamp;

public class Patient {
    private int patient_id;
    private String name;
    private String password;
    private Date date_of_birth;
    private String gender;
    private Timestamp date_registered;

    public Patient(int patient_id, String name, String password, Date date_of_birth, String gender, Timestamp date_registered) {
        this.patient_id = patient_id;
        this.name = name;
        this.password = password;
        this.date_of_birth = date_of_birth;
        this.gender = gender;
        this.date_registered = date_registered;
    }

    public Patient() {
    }

    public Patient(String name, String password, Date date_of_birth, String gender) {
        this.name = name;
        this.password = password;
        this.date_of_birth = date_of_birth;
        this.gender = gender;
    }

    public int getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(int patient_id) {
        this.patient_id = patient_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(Date date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getDate_registered() {
        return date_registered;
    }

    public void setDate_registered(Timestamp date_registered) {
        this.date_registered = date_registered;
    }
    
    
}
