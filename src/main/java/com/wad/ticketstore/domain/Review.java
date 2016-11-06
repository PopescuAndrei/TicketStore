/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wad.ticketstore.domain;

import java.util.Date;

/**
 *
 * @author Andrei
 */
public class Review {
    private int reviewId, eventId;
    private Long date;
    private String reviewMessage,name;

    public Review() {
    }

    public int getReviewId() {
        return reviewId;
    }

    public int getEventId() {
        return eventId;
    }

    public String getReviewMessage() {
        return reviewMessage;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public void setReviewMessage(String reviewMessage) {
        this.reviewMessage = reviewMessage;
    }

    public Long getDate() {
        return date;
    }

    public void setDate(Long date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Review{" + "reviewId=" + reviewId + ", eventId=" + eventId + ", date=" + date + ", reviewMessage=" + reviewMessage + ", name=" + name + '}';
    }
    
    
}
