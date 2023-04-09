package com.patient_support_system.servlets;

import com.patient_support_system.dao.AppointmentDao;
import com.patient_support_system.entities.Appointment;
import com.patient_support_system.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class AddAppointmentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int doctorId = Integer.parseInt(request.getParameter("doctor-id"));
            int patientId = Integer.parseInt(request.getParameter("patient-id"));

            // Parse appointment date
            String pattern = "yyyy-MM-dd";
            SimpleDateFormat format = new SimpleDateFormat(pattern);
            java.util.Date utilDate = null;
            try {
                utilDate = format.parse(request.getParameter("appointment-date"));
            } catch (ParseException ex) {
                ex.printStackTrace();
            }
            java.sql.Date appointmentDate = new java.sql.Date(utilDate.getTime());
            
            // Parse appointment time
            pattern = "HH:mm";
            format = new SimpleDateFormat(pattern);
            java.util.Date utilTime = null;
            try {
                utilTime = format.parse(request.getParameter("appointment-time"));
            } catch (ParseException ex) {
                ex.printStackTrace();
            }
            java.sql.Time appointmentTime = new java.sql.Time(utilTime.getTime());

            // Creating appointment data object
            Appointment appointment = new Appointment(doctorId, patientId, appointmentDate, appointmentTime);

            // Creating a appointment dao object
            AppointmentDao dao = new AppointmentDao(ConnectionProvider.getConnection());

            // Insert appointment data into database
            if (dao.saveAppointment(appointment)) {
                out.println("Done");
            } else {
                out.println("Error");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
