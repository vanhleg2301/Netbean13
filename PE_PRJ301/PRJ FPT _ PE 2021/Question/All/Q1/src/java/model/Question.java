/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author sonnt
 */
public class Question {
    private String content;
    private int point;
    private ArrayList<Answer> answers = new ArrayList<>();

    public Question() {
    }

    public Question(String content, int point) {
        this.content = content;
        this.point = point;
    }
    
    public boolean isMultipleChoice()
    {
        int numOfCorrectAnswer = 0;
        numOfCorrectAnswer = answers.stream().filter((answer) -> (answer.isIsCorrect())).map((_item) -> 1).reduce(numOfCorrectAnswer, Integer::sum);
        return numOfCorrectAnswer > 1;
    }
    
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public ArrayList<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(ArrayList<Answer> answers) {
        this.answers = answers;
    }
    
    
}
