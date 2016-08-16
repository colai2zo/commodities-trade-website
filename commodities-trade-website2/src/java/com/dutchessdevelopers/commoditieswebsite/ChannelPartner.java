/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dutchessdevelopers.commoditieswebsite;
import java.sql.*;

/**
 * 
 * @author Joey
 */
public class ChannelPartner {
    //These Keys will allow me to gain access to the database.
    String URL = "jdbc:mysql://localhost:3306/commodities_trading";
    String USERNAME = "root";
    String PASSWORD = "maps827";
    
    /** Database Level Variables **/
    Connection connection = null;
    PreparedStatement getPartners = null;
    PreparedStatement deletePartners = null;
    PreparedStatement insertPartners = null;
    PreparedStatement updateChannelPartners = null;
    ResultSet resultSet = null;
    
    /**
     * DEFAULT CONSTRUCTOR
     * Initializes all database level variables.
     */
    public ChannelPartner(){
        try{
            connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
            getPartners = connection.prepareStatement("SELECT ? FROM channel_partners;");

            deletePartners = connection.prepareStatement("DELETE FROM channel_partners"
                    + "WHERE id_number = ?;");
            insertPartners = connection.prepareStatement("INSERT INTO channel_partners"
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");
            updateChannelPartners = connection.prepareStatement("UPDATE channel_partners"
                    + "SET id_number=?, first_name=?, last_name=?, username=?, password=?, delta=?, vega=?, gamma=?, theta=?, timestamp=?"
                    + "WHERE id_number=?;"); 
                    
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    /**
     * @Param the columns needed, a string formatted for SQL Select * From code
     * @return a ResultSet object containing the requested information.
     */
    public ResultSet getChannelPartners(String columnsNeeded){
        try{
            getPartners.setString(1, columnsNeeded);
            resultSet = getPartners.executeQuery();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return resultSet;
    }
    
    /**
     * @param the data values for each column in the table.
     * @return 1 if success, 0 if fail.
     */
    public int updateChannelPartners(int ID_Number, String firstName, String lastName, String username, String password, double delta, double vega, double gamma, double theta, Timestamp timestamp){
         int result=0;
        try{
            //Replace question mark with SQL string that will place the variables.
            updateChannelPartners.setInt(1,ID_Number);
            updateChannelPartners.setString(2, firstName);
            updateChannelPartners.setString(3, lastName);
            updateChannelPartners.setString(4, username);
            updateChannelPartners.setString(5, password);
            updateChannelPartners.setDouble(6, delta);
            updateChannelPartners.setDouble(7, vega);
            updateChannelPartners.setDouble(8, gamma);
            updateChannelPartners.setDouble(9, theta);
            updateChannelPartners.setTimestamp(10, timestamp);
            updateChannelPartners.setInt(11,ID_Number);
            result = updateChannelPartners.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    
    /**
     * @param the data values for each column in the table.
     * @return 1 if success, 0 if fail.
     */
    public int insertChannelPartners(int ID_Number, String firstName, String lastName, String username, String password, double delta, double vega, double gamma, double theta, Timestamp timestamp){
        int result=0;
        try{
            //Replace question mark with SQL string that will place the variables.
            insertPartners.setInt(1,ID_Number);
            insertPartners.setString(2, firstName);
            insertPartners.setString(3, lastName);
            insertPartners.setString(4, username);
            insertPartners.setString(5, password);
            insertPartners.setDouble(6, delta);
            insertPartners.setDouble(7, vega);
            insertPartners.setDouble(8, gamma);
            insertPartners.setDouble(9, theta);
            insertPartners.setTimestamp(10, timestamp);
            result = insertPartners.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    
    /**
     * @param the id number of the channel partner to be deleted.
     * @return 1 if success, 0 if fail.
     */
    public int deleteChannelPartner(int ID_Number){
        int result = 0;
        try{
           deletePartners.setInt(1, ID_Number);
           result = deletePartners.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
}