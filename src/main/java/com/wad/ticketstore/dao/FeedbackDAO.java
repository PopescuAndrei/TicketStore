/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wad.ticketstore.dao;

import com.wad.ticketstore.domain.Feedback;
import java.util.List;
import com.wad.ticketstore.util.DBManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Andrei
 */
public class FeedbackDAO {

    public List<Feedback> findFeedbackByEvent(String eventId) {
        List<Feedback> list = null;

        try {
            Connection conn = DBManager.getConnection();
            String sql = "select * from feedback where EVENT_ID = " + "?";
            PreparedStatement st = conn.prepareStatement(sql);
            list = new ArrayList<>();
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback();
                //f.getName(eventId);
                //f.getMessage(eventId);

                list.add(f);
            }

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(list.size());

        return list;
    }

    //insert feedback
    public void insert(Feedback feedback) {

        try {
            Connection conn = DBManager.getConnection();
            String sql = "insert into feedback (NAME, MESSAGE)" + " values (?,?)";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, feedback.getName());
            st.setString(2, feedback.getMessage());
            st.execute();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
