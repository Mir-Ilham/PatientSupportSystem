package com.patient_support_system.servlets;

import com.patient_support_system.dao.AnswerDao;
import com.patient_support_system.entities.Answer;
import com.patient_support_system.dao.QuestionDao;
import com.patient_support_system.entities.Question;
import com.patient_support_system.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class SaveQuestionnaireServlet extends HttpServlet {

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
            ArrayList<Question> questions = new ArrayList<>();
            ArrayList<Answer> answers = new ArrayList<>();
            QuestionDao questionDao = new QuestionDao(ConnectionProvider.getConnection());
            AnswerDao answerDao = new AnswerDao(ConnectionProvider.getConnection());
            questions = questionDao.getAllQuestions();
            Answer answer = null;
            int patientId = Integer.parseInt(request.getParameter("patient-id"));
            for (Question q : questions) {
                String answerText = request.getParameter(Integer.toString(q.getQuestionId()));
                answer = new Answer(patientId, q.getQuestionId(), answerText);
                answers.add(answer);
            }
            
            
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String specialization = request.getParameter("specialization");

            // Insert doctor data into database
            if (answerDao.saveAnswers(answers)) {
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
