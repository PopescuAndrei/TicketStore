/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wad.ticketstore.dao;

import com.wad.ticketstore.domain.Event;
import com.wad.ticketstore.domain.Location;
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
public class LocationsDAO {
    
    public Location findLocationByEvent(int locationId) {
        Location location = null;
        Event result = null;
        try {
            Connection conn = DBManager.getConnection();
            String sql = "select * from locations where LOCATION_ID = " + "?";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, locationId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                location = new Location();
                location.setLocationId(rs.getInt("LOCATION_ID"));
                location.setStreetAddress(rs.getString("STREET_ADDRESS"));
                location.setCity(rs.getString("CITY"));
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return location;
    }
}
