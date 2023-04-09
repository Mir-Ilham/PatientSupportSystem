package com.patient_support_system.servlets;

import com.patient_support_system.dao.PrescriptionDao;
import com.patient_support_system.entities.Prescription;
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
public class AddPrescriptionServlet extends HttpServlet {

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
            String prescriptionText = request.getParameter("prescription-text");

            // Parse appointment date
            String pattern = "yyyy-MM-dd";
            SimpleDateFormat format = new SimpleDateFormat(pattern);
            java.util.Date utilDate = null;
            try {
                utilDate = format.parse(request.getParameter("end-date"));
            } catch (ParseException ex) {
                ex.printStackTrace();
            }
            java.sql.Date endDate = new java.sql.Date(utilDate.getTime());

            // Creating prescription data object
            Prescription prescription = new Prescription(doctorId, patientId, endDate, prescriptionText);

            // Creating a prescription dao object
            PrescriptionDao dao = new PrescriptionDao(ConnectionProvider.getConnection());

            // Insert prescription data into database
            if (dao.savePrescription(prescription)) {
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
