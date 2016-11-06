/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.wad.ticketstore.dao;

import com.wad.ticketstore.domain.Purchase;
import com.wad.ticketstore.domain.Ticket;
import com.wad.ticketstore.domain.User;
import com.wad.ticketstore.util.DBManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Andrei
 */
public class PurchaseDAO {

    public void commitPurchase(String username, HashMap<Ticket, Integer> shoppingCart, int quantity) {
        User user = new UserDAO().getCurrentUser(username);
        try {
            Connection conn = DBManager.getConnection();
            for (Map.Entry<Ticket, Integer> pair : shoppingCart.entrySet()) {
                String sql = "insert into PURCHASES(USER_ID, TICKET_ID, VALUE)" + " values (?,?,?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setInt(1, user.getUserId());
                statement.setInt(2, pair.getKey().getTicketId());
                statement.setDouble(3, quantity);
                statement.execute();
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Purchase> getAllPurchasesForUser(String username) {
        User user = new UserDAO().getCurrentUser(username);
        List<Purchase> purchaseList = null;
        try {
            Connection conn = DBManager.getConnection();
            String sql = "select * PURCHASES WHERE USER_ID = " + user.getUserId();
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Purchase p = new Purchase();
                p.setPurchaseId(rs.getInt("PURCHASE_ID"));
                p.setTicketId(rs.getInt("TICKET_ID"));
                p.setUserId(user.getUserId());
                p.setValue(rs.getDouble("VALUES"));
                purchaseList.add(p);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return purchaseList;
    }
}
