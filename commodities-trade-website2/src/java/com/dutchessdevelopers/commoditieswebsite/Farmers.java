/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dutchessdevelopers.commoditieswebsite;
import java.sql.*;

/**
 *
 * @author Development
 */
public class Farmers {
    //These Keys will allow me to gain access to the database.
    String URL = "jdbc:mysql://localhost:3306/commodities_trading";
    String USERNAME = "root";
    String PASSWORD = "maps827";
    
    /** Database Level Variables **/
    Connection connection = null;
    PreparedStatement getFarmers = null;
    PreparedStatement deleteFarmers = null;
    PreparedStatement insertFarmers = null;
    PreparedStatement updateFarmers = null;
    ResultSet resultSet = null;
    
    /**
     * DEFAULT CONSTRUCTOR
     * Initializes all database level variables.
     */
    public Farmers(){
        try{
            connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
            getFarmers = connection.prepareStatement("SELECT ? FROM farmers;");

            deleteFarmers = connection.prepareStatement("DELETE FROM farmers"
                    + " WHERE order_number = ?;");
            insertFarmers = connection.prepareStatement("INSERT INTO farmers"
                    + " VALUES (?, ?, ?, ?, ?);");
            updateFarmers = connection.prepareStatement("UPDATE farmers"
                    + " SET first_name=?, last_name=?, farmer_id=?, status=?, timestamp=?"
                    + " WHERE farmer_id=?;"); 
                    
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    /**
     * @Param the columns needed, a string formatted for SQL Select * From code
     * @return a ResultSet object containing the requested information.
     */
    public ResultSet getFarmers(String columnsNeeded){
        try{
            getFarmers.setString(1, columnsNeeded);
            resultSet = getFarmers.executeQuery();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return resultSet;
    }
        
    /**
     * @param the data values for each column in the table.
     * @return 1 if success, 0 if fail.
     */
        public int updateFarmers(String first_name, String last_name, int farmer_id, String status, Timestamp timestamp){
        int result=0;
        try{
            //Replace question mark with SQL string that will place the variables.
            updateFarmers.setString(1, first_name);
            updateFarmers.setString(2, last_name);
            updateFarmers.setInt(3, farmer_id);
            updateFarmers.setString(4, status);
            updateFarmers.setTimestamp(5, timestamp);
            updateFarmers.setInt(6, farmer_id);
            result = updateFarmers.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    
    /**
     * @param the data values for each column in the table.
     * @return 1 if success, 0 if fail.
     */
    public int insertFarmers(String first_name, String last_name, int farmer_id, String status, Timestamp timestamp){
        int result=0;
        try{
            //Replace question mark with SQL string that will place the variables.
            insertFarmers.setString(1, first_name);
            insertFarmers.setString(2, last_name);
            insertFarmers.setInt(3, farmer_id);
            insertFarmers.setString(4, status);
            insertFarmers.setTimestamp(5, timestamp);
            result = insertFarmers.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    
    /**
     * @param the id number of the channel partner to be deleted.
     * @return 1 if success, 0 if fail.
     */
    public int deleteFarmers(int order_Number){
        int result = 0;
        try{
           deleteFarmers.setInt(1, order_Number);
           result = deleteFarmers.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
}