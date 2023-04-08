package com.patient_support_system.entities;

import java.sql.Date;
import java.sql.Timestamp;

public class Patient {
    private int patientId;
    private String name;
    private String password;
    private Date dateOfBirth;
    private String gender;
    private String bloodGroup;
    private Timestamp dateRegistered;

    public Patient(int patientId, String name, Date dateOfBirth, String gender, String bloodGroup, Timestamp dateRegistered) {
        this.patientId = patientId;
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.bloodGroup = bloodGroup;
        this.dateRegistered = dateRegistered;
    }

    public Patient() {
    }

    public Patient(String name, String password, Date dateOfBirth, String gender, String bloodGroup) {
        this.name = name;
        this.password = password;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.bloodGroup = bloodGroup;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
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

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }
    
    public Timestamp getDateRegistered() {
        return dateRegistered;
    }

    public void setDateRegistered(Timestamp dateRegistered) {
        this.dateRegistered = dateRegistered;
    }
    
}
