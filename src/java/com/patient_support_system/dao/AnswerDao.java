package com.patient_support_system.dao;

import com.patient_support_system.entities.Answer;
import java.sql.*;
import java.util.ArrayList;

public class AnswerDao {

    private Connection con;

    public AnswerDao(Connection con) {
        this.con = con;
    }

    // DAO methods
    public boolean saveAnswers(ArrayList<Answer> answers) {
        // Insert answer data into database
        boolean insertedSuccessfully = false;
        for (Answer answer : answers) {
            try {
                String query = "INSERT into answer (patient_id, question_id, answer_text) VALUES(?, ?, ?)";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setInt(1, answer.getPatientId());
                pstmt.setInt(2, answer.getQuestionId());
                pstmt.setString(3, answer.getAnswerText());
                pstmt.executeUpdate();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        insertedSuccessfully = true;
        return insertedSuccessfully;
    }

    public ArrayList<Answer> getAllPatientAnswers(int patientId) {
        // Get all answers of particular particular from database
        // Order by answer id, question id, answer date
        ArrayList<Answer> answers = new ArrayList<Answer>();
        Answer answer = null;

        try {
            String query = "SELECT * FROM answer WHERE patient_id = ? ORDER BY answer_id, question_id, answer_date";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, patientId);

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                answer = new Answer();
                answer.setAnswerId(set.getInt("answer_id"));
                answer.setPatientId(set.getInt("patient_id"));
                answer.setQuestionId(set.getInt("question_id"));
                answer.setAnswerDate(set.getTimestamp("answer_date"));
                answer.setAnswerText(set.getString("answer_text"));
                answers.add(answer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return answers;
    }
}
