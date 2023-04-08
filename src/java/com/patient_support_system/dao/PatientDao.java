package com.patient_support_system.dao;

import com.patient_support_system.entities.Patient;
import java.sql.*;
import java.util.ArrayList;

public class PatientDao {

    private Connection con;

    public PatientDao(Connection con) {
        this.con = con;
    }

    // DAO methods
    public boolean savePatient(Patient patient) {
        // Insert patient data into database
        boolean insertedSuccessfully = false;
        try {
            String query = "INSERT into patient (name, password, date_of_birth, gender, blood_group) VALUES(?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, patient.getName());
            pstmt.setString(2, patient.getPassword());
            pstmt.setDate(3, patient.getDateOfBirth());
            pstmt.setString(4, patient.getGender());
            pstmt.setString(5, patient.getBloodGroup());
            pstmt.executeUpdate();
            insertedSuccessfully = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return insertedSuccessfully;
    }

    public Patient getPatientByNameAndPassword(String name, String password) {
        // Get patient data from database using name and password
        Patient patient = null;

        try {
            String query = "SELECT * FROM patient WHERE name = ? AND password = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                patient = new Patient();
                patient.setPatientId(set.getInt("patient_id"));
                patient.setName(set.getString("name"));
                patient.setDateOfBirth(set.getDate("date_of_birth"));
                patient.setGender(set.getString("gender"));
                patient.setBloodGroup(set.getString("blood_group"));
                patient.setDateRegistered(set.getTimestamp("date_registered"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return patient;
    }

    public Patient getPatientById(int patientId) {
        // Get patient data from database using patient id
        Patient patient = null;

        try {
            String query = "SELECT * FROM patient WHERE patient_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, patientId);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                patient = new Patient();
                patient.setPatientId(set.getInt("patient_id"));
                patient.setName(set.getString("name"));
                patient.setDateOfBirth(set.getDate("date_of_birth"));
                patient.setGender(set.getString("gender"));
                patient.setBloodGroup(set.getString("blood_group"));
                patient.setDateRegistered(set.getTimestamp("date_registered"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return patient;
    }
    
    public ArrayList<Patient> getAllPatients() {
        // Get all patient data from database
        // Order by patient_id, date_registered, name
        ArrayList<Patient> patients = new ArrayList<Patient>();
        Patient patient = null;

        try {
            String query = "SELECT * FROM patient ORDER BY patient_id, date_registered, name";
            Statement statement = con.createStatement();

            ResultSet set = statement.executeQuery(query);

            if (set.next()) {
                patient = new Patient();
                patient.setPatientId(set.getInt("patient_id"));
                patient.setName(set.getString("name"));
                patient.setDateOfBirth(set.getDate("date_of_birth"));
                patient.setGender(set.getString("gender"));
                patient.setBloodGroup(set.getString("blood_group"));
                patient.setDateRegistered(set.getTimestamp("date_registered"));
                patients.add(patient);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return patients;
    }
}
