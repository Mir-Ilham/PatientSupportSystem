package com.patient_support_system.entities;

import java.sql.Timestamp;

public class Answer {
    private int answerId;
    private int patientId;
    private int questionId;
    private Timestamp answerDate;
    private String answerText;

    public Answer(int answerId, int patientId, int questionId, Timestamp answerDate, String answerText) {
        this.answerId = answerId;
        this.patientId = patientId;
        this.questionId = questionId;
        this.answerDate = answerDate;
        this.answerText = answerText;
    }

    public Answer() {
    }

    public Answer(int patientId, int questionId, String answerText) {
        this.patientId = patientId;
        this.questionId = questionId;
        this.answerText = answerText;
    }

    public int getAnswerId() {
        return answerId;
    }

    public void setAnswerId(int answerId) {
        this.answerId = answerId;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public Timestamp getAnswerDate() {
        return answerDate;
    }

    public void setAnswerDate(Timestamp answerDate) {
        this.answerDate = answerDate;
    }

    public String getAnswerText() {
        return answerText;
    }

    public void setAnswerText(String answerText) {
        this.answerText = answerText;
    }
    
}
