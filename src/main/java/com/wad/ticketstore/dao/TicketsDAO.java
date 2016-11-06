/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wad.ticketstore.dao;

import com.wad.ticketstore.domain.Ticket;
import com.wad.ticketstore.util.DBManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Andrei
 */
public class TicketsDAO {

    public String returnPriceById(int eventId) {
        String price = null;
        try {
            Connection conn = DBManager.getConnection();
            String sql = "select * from tickets where EVENT_ID = " + "?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, eventId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                price = Double.toString(rs.getDouble("Price"));
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return price;
    }

    public List<Ticket> findTicketsByEvent(int eventId) {
        List<Ticket> list = null;
        try {
            Connection conn = DBManager.getConnection();
            String sql = "select * from tickets where EVENT_ID = " + "?";
            PreparedStatement st = conn.prepareStatement(sql);
            list = new ArrayList<>();
            st.setInt(1, eventId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Ticket t = new Ticket();
                t.setEventId(eventId);
                t.setTicketId(rs.getInt("TICKET_ID"));
                t.setNoAvailableTickets(rs.getInt("NO_AVAILABLE_TICKETS"));
                t.setCategory(rs.getString("CATEGORY"));
                t.setPrice(rs.getDouble("PRICE"));
                list.add(t);
            }

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(list.size());
        return list;
    }

    public Ticket findOneTicket(int ticketId) {
        Ticket ticket = null;
        try {
            Connection conn = DBManager.getConnection();
            String sql = "select * from tickets where TICKET_ID = " + "?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, ticketId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ticket = new Ticket();
                ticket.setEventId(rs.getInt("EVENT_ID"));
                ticket.setTicketId(rs.getInt("TICKET_ID"));
                ticket.setNoAvailableTickets(rs.getInt("NO_AVAILABLE_TICKETS"));
                ticket.setCategory(rs.getString("CATEGORY"));
                ticket.setPrice(rs.getDouble("PRICE"));
            }

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ticket;
    }
}
