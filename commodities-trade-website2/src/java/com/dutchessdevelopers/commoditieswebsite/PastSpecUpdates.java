/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dutchessdevelopers.commoditeswebsite;
import java.sql.*;

/**
 * 
 * @author Joey
 */
public class PastSpecUpdates {
    //These Keys will allow me to gain access to the database.
    String URL = "jdbc:mysql://localhost:3306/commodities_trading";
    String USERNAME = "root";
    String PASSWORD = "maps827";
    
    /** Database Level Variables **/
    Connection connection = null;
    PreparedStatement getSpecs = null;
    PreparedStatement deleteSpecs = null;
    PreparedStatement insertSpecs = null;
    ResultSet resultSet = null;
    
    /**
     * DEFAULT CONSTRUCTOR
     * Initializes all database level variables.
     */
    public PastSpecUpdates(){
        try{
            connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
            getSpecs = connection.prepareStatement("SELECT ? FROM past_spec_updates;");

            deleteSpecs = connection.prepareStatement("DELETE FROM past_spec_updates"
                    + " WHERE timestamp = ?;");
            insertSpecs = connection.prepareStatement("INSERT INTO past_spec_updates"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
                    
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    /**
     * @Param the columns needed, a string formatted for SQL Select * From code
     * @return a ResultSet object containing the requested information.
     */
    public ResultSet getSpecs(String columnsNeeded){
        try{
            getSpecs.setString(1, columnsNeeded);
            resultSet = getSpecs.executeQuery();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return resultSet;
    }
    
    /**
     * @param the data values for each column in the table.
     * @return 1 if success, 0 if fail.
     */
    public int insertSpecs(String month, String futures, String expiry, double volatility, double volatilitySpread, double price, double markup, double finalPrice, String productName, Timestamp timestamp, int market){
        int result=0;
        try{
            //Replace question mark with SQL string that will place the variables.
            insertSpecs.setString(1, month);
            insertSpecs.setString(2, futures);
            insertSpecs.setString(3,expiry);
            insertSpecs.setDouble(4,volatility);
            insertSpecs.setDouble(5,volatilitySpread);
            insertSpecs.setDouble(6,price);
            insertSpecs.setDouble(7, markup);
            insertSpecs.setDouble(8, finalPrice);
            insertSpecs.setString(9, productName);
            insertSpecs.setTimestamp(10,timestamp);
            insertSpecs.setInt(11, market);
            result = insertSpecs.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    
    /**
     * @param the username of the channel partner to be deleted.
     * @return 1 if success, 0 if fail.
     */
    public int deleteSpecs(String username){
        int result = 0;
        try{
           deleteSpecs.setString(1, username);
           result = deleteSpecs.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
}