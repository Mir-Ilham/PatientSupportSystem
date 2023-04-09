package com.patient_support_system.dao;

import com.patient_support_system.entities.Prescription;
import java.sql.*;
import java.util.ArrayList;

public class PrescriptionDao {

    private Connection con;

    public PrescriptionDao(Connection con) {
        this.con = con;
    }

    // DAO methods
    public boolean savePrescription(Prescription prescription) {
        // Insert prescription data into database
        boolean insertedSuccessfully = false;
        try {
            String query = "INSERT INTO prescription (doctor_id, patient_id, end_date, prescription_text) VALUES(?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, prescription.getDoctorId());
            pstmt.setInt(2, prescription.getPatientId());
            pstmt.setDate(3, prescription.getEndDate());
            pstmt.setString(4, prescription.getPrescriptionText());
            pstmt.executeUpdate();
            insertedSuccessfully = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return insertedSuccessfully;
    }

    public ArrayList<Prescription> getAllDoctorPrescriptions(int doctorId) {
        // Get all prescriptions of particular doctor from database
        // Order by prescription id and date prescribed
        ArrayList<Prescription> prescriptions = new ArrayList<Prescription>();
        Prescription prescription = null;

        try {
            String query = "SELECT prescription_id, patient_id, date_prescribed FROM prescription "
                    + "WHERE doctor_id = ? "
                    + "ORDER BY prescription_id, date_prescribed";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, doctorId);

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                prescription = new Prescription();
                prescription.setPrescriptionId(set.getInt("prescription_id"));
                prescription.setPatientId(set.getInt("patient_id"));
                prescription.setDatePrescribed(set.getTimestamp("date_prescribed"));
                prescriptions.add(prescription);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return prescriptions;
    }

    public ArrayList<Prescription> getAllPatientPrescriptions(int patientId) {
        // Get all prescriptions of particular doctor from database
        // Order by prescription id and date prescribed
        ArrayList<Prescription> prescriptions = new ArrayList<Prescription>();
        Prescription prescription = null;

        try {
            String query = "SELECT prescription_id, doctor_id, date_prescribed FROM prescription "
                    + "WHERE patient_id = ? "
                    + "ORDER BY prescription_id, date_prescribed";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, patientId);

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                prescription = new Prescription();
                prescription.setPrescriptionId(set.getInt("prescription_id"));
                prescription.setDoctorId(set.getInt("doctor_id"));
                prescription.setDatePrescribed(set.getTimestamp("date_prescribed"));
                prescriptions.add(prescription);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return prescriptions;
    }
    
    public Prescription getPrescriptionById(int prescriptionId) {
        // Get a prescription using prescription id from database 
        Prescription prescription = null;

        try {
            String query = "SELECT * FROM prescription WHERE prescription_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, prescriptionId);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                prescription = new Prescription();
                prescription.setPrescriptionId(set.getInt("prescription_id"));
                prescription.setDoctorId(set.getInt("doctor_id"));
                prescription.setPatientId(set.getInt("patient_id"));
                prescription.setDatePrescribed(set.getTimestamp("date_prescribed"));
                prescription.setEndDate(set.getDate("end_date"));
                prescription.setPrescriptionText(set.getString("prescription_text"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return prescription;
    }
}
