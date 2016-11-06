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
public class Ticket {

    private int ticketId, eventId, noAvailableTickets;
    private double price;
    private String category;

    public Ticket() {
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    
    public int getTicketId() {
        return ticketId;
    }

    public int getEventId() {
        return eventId;
    }

    public int getNoAvailableTickets() {
        return noAvailableTickets;
    }


    public double getPrice() {
        return price;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public void setNoAvailableTickets(int noAvailableTickets) {
        this.noAvailableTickets = noAvailableTickets;
    }

    public void setPrice(double price) {
        this.price = price;
    }


}
