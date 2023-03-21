package com.patient_support_system.entities;

public class Doctor {
    private int id;
    private String doctor_profile;
    private String name;
    private String password;
    private String department_name;
    private String specialization;

    public Doctor(int id, String doctor_profile, String name, String password, String department_name, String specialization) {
        this.id = id;
        this.doctor_profile = doctor_profile;
        this.name = name;
        this.password = password;
        this.department_name = department_name;
        this.specialization = specialization;
    }

    public Doctor() {
    }

    public Doctor(String doctor_profile, String name, String password, String department_name, String specialization) {
        this.doctor_profile = doctor_profile;
        this.name = name;
        this.password = password;
        this.department_name = department_name;
        this.specialization = specialization;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDoctor_profile() {
        return doctor_profile;
    }

    public void setDoctor_profile(String doctor_profile) {
        this.doctor_profile = doctor_profile;
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

    public String getDepartment_name() {
        return department_name;
    }

    public void setDepartment_name(String department_name) {
        this.department_name = department_name;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }
    
}
