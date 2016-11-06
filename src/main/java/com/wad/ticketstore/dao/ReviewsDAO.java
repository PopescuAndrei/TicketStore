/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wad.ticketstore.dao;

import com.wad.ticketstore.util.DBManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.wad.ticketstore.domain.Review;
import com.wad.ticketstore.domain.Ticket;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 *
 * @author Andrei
 */
public class ReviewsDAO {

    public void insertReview(Review review) {
        try {

            Connection conn = DBManager.getConnection();
            String sql = "insert into reviews (EVENT_ID, REVIEW_MESSAGE, REVIEW_DATE, NAME)" + " values (?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, review.getEventId());
            statement.setString(2, review.getReviewMessage());
            statement.setDate(3, new java.sql.Date(new Date().getTime()));
            statement.setString(4, review.getName());

            statement.execute();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ReviewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Review> findReviewsByEvent(int eventId) {
        List<Review> list = null;
        try {
            Connection conn = DBManager.getConnection();
            String sql = "select * from reviews where EVENT_ID = " + "?";
            PreparedStatement st = conn.prepareStatement(sql);
            list = new ArrayList<>();
            st.setInt(1, eventId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Review r = new Review();
                r.setEventId(eventId);
                r.setReviewMessage(rs.getString("REVIEW_MESSAGE"));
                r.setName(rs.getString("NAME"));
                r.setDate(rs.getDate("REVIEW_DATE").getTime());
                list.add(r);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
