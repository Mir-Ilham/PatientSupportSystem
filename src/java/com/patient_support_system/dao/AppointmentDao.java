package com.patient_support_system.dao;

import com.patient_support_system.entities.Appointment;
import java.sql.*;
import java.util.ArrayList;

public class AppointmentDao {

    private Connection con;

    public AppointmentDao(Connection con) {
        this.con = con;
    }

    // DAO methods
    public boolean saveAppointment(Appointment appointment) {
        // Insert appointment data into database
        boolean insertedSuccessfully = false;
        try {
            String query = "INSERT into appointment (doctor_id, patient_id, appointment_date, appointment_time) VALUES(?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, appointment.getDoctorId());
            pstmt.setInt(2, appointment.getPatientId());
            pstmt.setDate(3, appointment.getAppointmentDate());
            pstmt.setTime(4, appointment.getAppointmentTime());
            pstmt.executeUpdate();
            insertedSuccessfully = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return insertedSuccessfully;
    }

    public ArrayList<Appointment> getAllDoctorAppointments(int doctorId) {
        // Get all appointments of particular doctor from database
        // Order by appointment id, appointment date, appointment time
        ArrayList<Appointment> appointments = new ArrayList<Appointment>();
        Appointment appointment = null;

        try {
            String query = "SELECT * FROM appointment WHERE doctor_id = ? ORDER BY appointment_id, appointment_date, appointment_time";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, doctorId);

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                appointment = new Appointment();
                appointment.setAppointmentId(set.getInt("appointment_id"));
                appointment.setDoctorId(set.getInt("doctor_id"));
                appointment.setPatientId(set.getInt("patient_id"));
                appointment.setAppointmentDate(set.getDate("appointment_date"));
                appointment.setAppointmentTime(set.getTime("appointment_time"));
                appointments.add(appointment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return appointments;
    }

    public ArrayList<Appointment> getAllPatientAppointments(int patientId) {
        // Get all appointments of particular patient from database
        // Order by appointment id, appointment date, appointment time
        ArrayList<Appointment> appointments = new ArrayList<Appointment>();
        Appointment appointment = null;

        try {
            String query = "SELECT * FROM appointment WHERE patient_id = ? ORDER BY appointment_id, appointment_date, appointment_time";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, patientId);

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                appointment = new Appointment();
                appointment.setAppointmentId(set.getInt("appointment_id"));
                appointment.setDoctorId(set.getInt("doctor_id"));
                appointment.setPatientId(set.getInt("patient_id"));
                appointment.setAppointmentDate(set.getDate("appointment_date"));
                appointment.setAppointmentTime(set.getTime("appointment_time"));
                appointments.add(appointment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return appointments;
    }
}
