package com.patient_support_system.dao;

import com.patient_support_system.entities.Doctor;
import java.sql.*;

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
            String query = "INSERT into doctor (name, password, department_name, specialization) VALUES(?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, doctor.getName());
            pstmt.setString(2, doctor.getPassword());
            pstmt.setString(3, doctor.getDepartment_name());
            pstmt.setString(4, doctor.getSpecialization());
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
                doctor.setId(set.getInt("doctor_id"));
                doctor.setDoctor_profile(set.getString("doctor_profile"));
                doctor.setName(set.getString("name"));
                doctor.setDepartment_name(set.getString("department_name"));
                doctor.setSpecialization(set.getString("specialization"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return doctor;
    }
}
