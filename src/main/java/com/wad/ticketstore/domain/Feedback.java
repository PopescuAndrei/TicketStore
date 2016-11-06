/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wad.ticketstore.domain;

/**
 *
 * @author Andrei
 */
public class Feedback {

    private int feedbackId;
    String name, message;

    public Feedback() {
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public String getName() {
        return name;
    }

    public String getMessage() {
        return message;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    
}
