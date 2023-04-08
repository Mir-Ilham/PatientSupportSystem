package com.patient_support_system.entities;

import java.sql.Date;
import java.sql.Timestamp;

public class Prescription {
    private int prescriptionId;
    private int doctorId;
    private int patientId;
    private Timestamp datePrescribed;
    private Date endDate;
    private String prescriptionText;

    public Prescription(int prescriptionId, int doctorId, int patientId, Timestamp datePrescribed, Date endDate, String prescriptionText) {
        this.prescriptionId = prescriptionId;
        this.doctorId = doctorId;
        this.patientId = patientId;
        this.datePrescribed = datePrescribed;
        this.endDate = endDate;
        this.prescriptionText = prescriptionText;
    }

    public Prescription() {
    }

    public Prescription(int doctorId, int patientId, Date endDate, String prescriptionText) {
        this.doctorId = doctorId;
        this.patientId = patientId;
        this.endDate = endDate;
        this.prescriptionText = prescriptionText;
    }

    public int getPrescriptionId() {
        return prescriptionId;
    }

    public void setPrescriptionId(int prescriptionId) {
        this.prescriptionId = prescriptionId;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public Timestamp getDatePrescribed() {
        return datePrescribed;
    }

    public void setDatePrescribed(Timestamp datePrescribed) {
        this.datePrescribed = datePrescribed;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getPrescriptionText() {
        return prescriptionText;
    }

    public void setPrescriptionText(String prescriptionText) {
        this.prescriptionText = prescriptionText;
    }
    
}
