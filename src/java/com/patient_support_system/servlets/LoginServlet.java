package com.patient_support_system.servlets;

import com.patient_support_system.dao.DoctorDao;
import com.patient_support_system.dao.PatientDao;
import com.patient_support_system.entities.Doctor;
import com.patient_support_system.entities.Message;
import com.patient_support_system.entities.Patient;
import com.patient_support_system.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

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
        // Fetch name, password and user-type from request
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String user_type = request.getParameter("user-type");

        response.setContentType("text/html;charset=UTF-8");
        if (user_type.equals("admin")) {
            if (name.equals("ADMIN") && password.equals("PASS")) {
                // Login success
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", "admin");
                response.sendRedirect("admin_dashboard.jsp");
            } else {
                // Login error
                Message msg = new Message("Invalid details ! try again", "error", "alert-danger");
                HttpSession session = request.getSession();
                session.setAttribute("msg", msg);
                response.sendRedirect("login_page.jsp");
            }
        } else if (user_type.equals("doctor")) {
            DoctorDao dao = new DoctorDao(ConnectionProvider.getConnection());
            Doctor doctor = dao.getDoctorByNameAndPassword(name, password);
            if (doctor == null) {
                // Login error
                Message msg = new Message("Invalid details ! try again", "error", "alert-danger");
                HttpSession session = request.getSession();
                session.setAttribute("msg", msg);
                response.sendRedirect("login_page.jsp");
            } else {
                // Login success
                HttpSession session = request.getSession();
                session.setAttribute("currentDoctor", doctor);
                response.sendRedirect("doctor_dashboard.jsp");
            }
        } else if (user_type.equals("patient")) {
            PatientDao dao = new PatientDao(ConnectionProvider.getConnection());
            Patient patient = dao.getPatientByNameAndPassword(name, password);
            if (patient == null) {
                // Login error
                Message msg = new Message("Invalid details ! try again", "error", "alert-danger");
                HttpSession session = request.getSession();
                session.setAttribute("msg", msg);
                response.sendRedirect("login_page.jsp");
            } else {
                // Login success
                HttpSession session = request.getSession();
                session.setAttribute("currentPatient", patient);
                response.sendRedirect("patient_dashboard.jsp");
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
