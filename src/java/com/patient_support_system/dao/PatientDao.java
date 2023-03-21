package com.patient_support_system.dao;

import com.patient_support_system.entities.Patient;
import java.sql.*;

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
            String query = "INSERT into patient (name, password, date_of_birth, gender) VALUES(?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, patient.getName());
            pstmt.setString(2, patient.getPassword());
            pstmt.setDate(3, patient.getDate_of_birth());
            pstmt.setString(4, patient.getGender());
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
                patient.setPatient_id(set.getInt("patient_id"));
                patient.setName(set.getString("name"));
                patient.setDate_of_birth(set.getDate("date_of_birth"));
                patient.setGender(set.getString("gender"));
                patient.setDate_registered(set.getTimestamp("date_registered"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return patient;
    }
}
