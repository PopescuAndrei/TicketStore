/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wad.ticketstore.dao;

import com.wad.ticketstore.domain.Event;
import com.wad.ticketstore.util.DBManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Andrei
 */
public class EventsDAO {

    public List<Event> findAllEvents() {
        List<Event> listEvents = null;
        Event result = null;
        try {
            Connection conn = DBManager.getConnection();
            String sql = "select * from events";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            listEvents = new ArrayList<>();
            while (rs.next()) {
                result = new Event();
                result.setEventId(rs.getInt("EVENT_ID"));
                result.setEventName(rs.getString("EVENT_NAME"));
                result.setEventDescription(rs.getString("EVENT_DESCRIPTION"));
                result.setLocationId(rs.getInt("LOCATION_ID"));
                result.setEventDate(rs.getDate("EVENT_DATE"));
                result.setEventStart(rs.getString("EVENT_START"));
                result.setEventEnd(rs.getString("EVENT_END"));
                result.setEventCategory(rs.getString("EVENT_CATEGORY"));
                result.setEventImage(rs.getString("EVENT_IMAGE"));
                listEvents.add(result);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listEvents;
    }

    public List<Event> findEventsByCategory(String category) {
        List<Event> listEvents = null;
        Event result = null;
        try {
            Connection conn = DBManager.getConnection();
            String sql = "select * from events where EVENT_CATEGORY = " + "?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, category);
            ResultSet rs = st.executeQuery();
            listEvents = new ArrayList<>();
            while (rs.next()) {
                result = new Event();
                result.setEventId(rs.getInt("EVENT_ID"));
                result.setEventName(rs.getString("EVENT_NAME"));
                result.setEventDescription(rs.getString("EVENT_DESCRIPTION"));
                result.setLocationId(rs.getInt("LOCATION_ID"));
                result.setEventDate(rs.getDate("EVENT_DATE"));
                result.setEventStart(rs.getString("EVENT_START"));
                result.setEventEnd(rs.getString("EVENT_END"));
                result.setEventCategory(rs.getString("EVENT_CATEGORY"));
                result.setEventImage(rs.getString("EVENT_IMAGE"));
                listEvents.add(result);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listEvents;
    }

    public List<Event> findEventsByLocation(String locationId) {
        List<Event> listEvents = null;
        Event result = null;
        try {
            Connection conn = DBManager.getConnection();
            String sql = "select * from events where LOCATION_ID = " + "?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, locationId);
            ResultSet rs = st.executeQuery();
            listEvents = new ArrayList<>();
            while (rs.next()) {
                result = new Event();
                result.setEventId(rs.getInt("EVENT_ID"));
                result.setEventName(rs.getString("EVENT_NAME"));
                result.setEventDescription(rs.getString("EVENT_DESCRIPTION"));
                result.setLocationId(rs.getInt("LOCATION_ID"));
                result.setEventDate(rs.getDate("EVENT_DATE"));
                result.setEventStart(rs.getString("EVENT_START"));
                result.setEventEnd(rs.getString("EVENT_END"));
                result.setEventCategory(rs.getString("EVENT_CATEGORY"));
                result.setEventImage(rs.getString("EVENT_IMAGE"));
                listEvents.add(result);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listEvents;
    }

    public List<Event> findEventsByName(String eventName) {
        List<Event> listEvents = null;
        Event result = null;
        try {
            Connection conn = DBManager.getConnection();
            String sql = "select * from events where EVENT_NAME = " + "?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, eventName);
            ResultSet rs = st.executeQuery();
            listEvents = new ArrayList<>();
            while (rs.next()) {
                result = new Event();
                result.setEventId(rs.getInt("EVENT_ID"));
                result.setEventName(rs.getString("EVENT_NAME"));
                result.setEventDescription(rs.getString("EVENT_DESCRIPTION"));
                result.setLocationId(rs.getInt("LOCATION_ID"));
                result.setEventDate(rs.getDate("EVENT_DATE"));
                result.setEventStart(rs.getString("EVENT_START"));
                result.setEventEnd(rs.getString("EVENT_END"));
                result.setEventCategory(rs.getString("EVENT_CATEGORY"));
                result.setEventImage(rs.getString("EVENT_IMAGE"));
                listEvents.add(result);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listEvents;
    }

    public Event findEventById(String eventId) {
        Event result = null;
        try {
            Connection conn = DBManager.getConnection();
            String sql = "select * from events where EVENT_ID = " + "?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, eventId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result = new Event();
                result.setEventId(rs.getInt("EVENT_ID"));
                result.setEventName(rs.getString("EVENT_NAME"));
                result.setEventDescription(rs.getString("EVENT_DESCRIPTION"));
                result.setLocationId(rs.getInt("LOCATION_ID"));
                result.setEventDate(rs.getDate("EVENT_DATE"));
                result.setEventStart(rs.getString("EVENT_START"));
                result.setEventEnd(rs.getString("EVENT_END"));
                result.setEventCategory(rs.getString("EVENT_CATEGORY"));
                result.setEventImage(rs.getString("EVENT_IMAGE"));
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
