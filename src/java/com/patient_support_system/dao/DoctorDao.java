package com.patient_support_system.dao;

import com.patient_support_system.entities.Doctor;
import java.sql.*;
import java.util.ArrayList;

public class DoctorDao {

    private Connection con;

    public DoctorDao(Connection con) {
        this.con = con;
    }

    // DAO methods
    public boolean saveDoctor(Doctor doctor) {
        // Insert doctor data into database
        boolean insertedSuccessfully = false;
        try {
            String query = "INSERT into doctor (name, password, specialization) VALUES(?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, doctor.getName());
            pstmt.setString(2, doctor.getPassword());
            pstmt.setString(3, doctor.getSpecialization());
            pstmt.executeUpdate();
            insertedSuccessfully = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return insertedSuccessfully;
    }

    public Doctor getDoctorByNameAndPassword(String name, String password) {
        // Get doctor data from database using name and password
        Doctor doctor = null;

        try {
            String query = "SELECT * FROM doctor WHERE name = ? AND password = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                doctor = new Doctor();
                doctor.setDoctorId(set.getInt("doctor_id"));
                doctor.setDoctorProfile(set.getString("doctor_profile"));
                doctor.setName(set.getString("name"));
                doctor.setSpecialization(set.getString("specialization"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return doctor;
    }

    public Doctor getDoctorById(int doctorId) {
        // Get doctor data from database using name and password
        Doctor doctor = null;

        try {
            String query = "SELECT * FROM doctor WHERE doctor_id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, doctorId);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                doctor = new Doctor();
                doctor.setDoctorId(set.getInt("doctor_id"));
                doctor.setDoctorProfile(set.getString("doctor_profile"));
                doctor.setName(set.getString("name"));
                doctor.setSpecialization(set.getString("specialization"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return doctor;
    }
    
    public ArrayList<Doctor> getAllDoctors() {
        // Get all doctor data from database
        // ORDER BY specialization, name and doctor id
        ArrayList<Doctor> doctors = new ArrayList<Doctor>();
        Doctor doctor = null;

        try {
            String query = "SELECT * FROM doctor ORDER BY specialization, name, doctor_id";
            Statement statement = con.createStatement();

            ResultSet set = statement.executeQuery(query);

            while (set.next()) {
                doctor = new Doctor();
                doctor.setDoctorId(set.getInt("doctor_id"));
                doctor.setDoctorProfile(set.getString("doctor_profile"));
                doctor.setName(set.getString("name"));
                doctor.setSpecialization(set.getString("specialization"));
                doctors.add(doctor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return doctors;
    }    
}
