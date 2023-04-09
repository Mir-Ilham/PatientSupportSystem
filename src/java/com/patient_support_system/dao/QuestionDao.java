package com.patient_support_system.dao;

import com.patient_support_system.entities.Question;
import java.sql.*;
import java.util.ArrayList;

public class QuestionDao {

    private Connection con;

    public QuestionDao(Connection con) {
        this.con = con;
    }

    // DAO methods
    public boolean saveQuestion(Question question) {
        // Insert question data into database
        boolean insertedSuccessfully = false;
        try {
            String query = "INSERT into question (question_text) VALUES(?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, question.getQuestionText());
            pstmt.executeUpdate();
            insertedSuccessfully = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return insertedSuccessfully;
    }

    public ArrayList<Question> getAllQuestions() {
        // Get all questions from tha database
        ArrayList<Question> questions = new ArrayList<Question>();
        Question question = null;
        try {
            String query = "SELECT * FROM question";
            Statement statement = con.createStatement();

            ResultSet set = statement.executeQuery(query);

             while (set.next()) {
                question = new Question();
                question.setQuestionId(set.getInt("question_id"));
                question.setQuestionText(set.getString("question_text"));
                questions.add(question);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return questions;
    }
}

