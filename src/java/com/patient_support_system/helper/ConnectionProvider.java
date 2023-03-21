package com.patient_support_system.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) {
                // Load driver class
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Create a connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patient_support_system", "ilham", "23498Devel$");
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return con;
    }
}
