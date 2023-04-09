package com.patient_support_system.entities;

public class Doctor {
    private int doctorId;
    private String doctorProfile;
    private String name;
    private String password;
    private String specialization;

    public Doctor(int doctorId, String doctorProfile, String name, String specialization) {
        this.doctorId = doctorId;
        this.doctorProfile = doctorProfile;
        this.name = name;
        this.specialization = specialization;
    }

    public Doctor() {
    }

    public Doctor(String name, String password, String specialization) {
        this.name = name;
        this.password = password;
        this.specialization = specialization;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public String getDoctorProfile() {
        return doctorProfile;
    }

    public void setDoctorProfile(String doctorProfile) {
        this.doctorProfile = doctorProfile;
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
    
    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }
    
}
