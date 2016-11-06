/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wad.ticketstore.dao;

import com.wad.ticketstore.domain.User;
import com.wad.ticketstore.util.DBManager;
import com.wad.ticketstore.util.Encryption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Andrei
 */
public class UserDAO {

    public Boolean insertUser(User user) {
        boolean inserted = false;
        try {
            Connection conn = DBManager.getConnection();
            String sql = "insert into users(USER_NAME, PASSWORD, FIRST_NAME, LAST_NAME, EMAIL, ADDRESS, PHONE_NUMBER)" + " values (?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFirstName());
            statement.setString(4, user.getLastName());
            statement.setString(5, user.getEmail());
            statement.setString(6, user.getAddress());
            statement.setString(7, user.getPhoneNumber());
            statement.execute();
            inserted = true;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return inserted;
    }

    public boolean userExists(String username, String email) {
        boolean found = false;
        try {
            Connection con = DBManager.getConnection();
            String sql = "select user_name,email from users";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                if (username.equals(rs.getString("USER_NAME")) == true) {
                    found = true;
                }
                if (email.equals(rs.getString("EMAIL")) == true) {
                    found = true;
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return found;
    }

    public boolean loginUser(String username, String password) {
        boolean found = false;
        try {
            Connection con = DBManager.getConnection();
            String sql = "select * from USERS where USER_NAME = '" + username + "' and PASSWORD ='" + Encryption.getHash(password) + "'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                if (username.equals(rs.getString("USER_NAME")) == true && Encryption.getHash(password).equals(rs.getString("PASSWORD")) == true) {
                    found = true;
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return found;
    }

    public User getCurrentUser(String username) {
        User user = null;
        try {
            Connection con = DBManager.getConnection();
            String sql = "select * from USERS where USER_NAME = " + "?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setAddress(rs.getString("ADDRESS"));
                user.setEmail(rs.getString("EMAIL"));
                user.setUserName(rs.getString("USER_NAME"));
                user.setPhoneNumber(rs.getString("PHONE"));
                user.setFirstName(rs.getString("FIRST_NAME"));
                user.setLastName(rs.getString("LAST_NAME"));
                user.setPassword(rs.getString("PASSWORD"));
                user.setUserId(rs.getInt("USER_ID"));
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
}
