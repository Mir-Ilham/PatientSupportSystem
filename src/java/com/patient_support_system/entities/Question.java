package com.patient_support_system.entities;

public class Question {
    private int questionId;
    private String questionText;

    public Question(int questionId, String questionText) {
        this.questionId = questionId;
        this.questionText = questionText;
    }

    public Question() {
    }

    public Question(String questionText) {
        this.questionText = questionText;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getQuestionText() {
        return questionText;
    }

    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }
}
