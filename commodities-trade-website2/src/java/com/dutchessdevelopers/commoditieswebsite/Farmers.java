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
    String PASSWORD = "1234";
    
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
            getFarmers = connection.prepareStatement("SELECT * FROM farmers;");

            deleteFarmers = connection.prepareStatement("DELETE FROM farmers"
                    + " WHERE order_number = ?;");
            insertFarmers = connection.prepareStatement("INSERT INTO farmers"
                    + " (first_name,last_name,farmer_id,status,timestamp,partner_id)"
                    + " VALUES (?, ?, ?, ?, ?, ?);");
            updateFarmers = connection.prepareStatement("UPDATE farmers"
                    + " SET first_name=?, last_name=?, farmer_id=?, status=?, timestamp=?, partner_id=?"
                    + " WHERE timestamp=?;"); 
                    
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    /**
     * @Param the columns needed, a string formatted for SQL Select * From code
     * @return a ResultSet object containing the requested information.
     */
    public ResultSet getFarmers(){
        try{
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
        public int updateFarmers(String first_name, String last_name, String farmer_id, String status, Timestamp timestamp, String partner_id, Timestamp oldTimestamp){
        int result=0;
        try{
            //Replace question mark with SQL string that will place the variables.
            updateFarmers.setString(1, first_name);
            updateFarmers.setString(2, last_name);
            updateFarmers.setString(3, farmer_id);
            updateFarmers.setString(4, status);
            updateFarmers.setTimestamp(5, timestamp);
            updateFarmers.setString(6, partner_id);
            updateFarmers.setTimestamp(7, oldTimestamp);
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
    public int insertFarmers(String first_name, String last_name, String farmer_id, String status, Timestamp timestamp, String partner_id){
        int result=0;
        try{
            //Replace question mark with SQL string that will place the variables.
            insertFarmers.setString(1, first_name);
            insertFarmers.setString(2, last_name);
            insertFarmers.setString(3, farmer_id);
            insertFarmers.setString(4, status);
            insertFarmers.setTimestamp(5, timestamp);
            insertFarmers.setString(6, partner_id);
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
    
    /**
     * 
     * @param cpID the id of the channel partner who created the farmer
     * @return the ID for a new farmer for that channel partner
     */
    public String generateFarmerID(String cpID, String status){
            int count = 1000;
            ResultSet r = getFarmers();
            if(status.equals("approve")){
                try{
                r.beforeFirst();
                while(r.next()){
                    if(r.getString("status").equals("approve") &&
                       r.getString("partner_id").equals(cpID)){
                        count++;
                        System.out.println("INCREMENTED");
                    }
                }
                }catch(SQLException e){
                    e.printStackTrace();
                }
                return cpID + Integer.toString(count);
            }else if(status.equals("decline")){
                try{
                r.beforeFirst();
                while(r.next()){
                    if(r.getString("status").equals("decline")){
                        count++;
                        System.out.println("INCREMENTED");
                    }
                }
                }catch(SQLException e){
                    e.printStackTrace();
                }
                return "DECLINED" + Integer.toString(count);
            }else if(status.equals("pending")){
                try{
                r.beforeFirst();
                while(r.next()){
                    if(r.getString("status").equals("pending")){
                        count++;
                        System.out.println("INCREMENTED");
                    }
                }
                }catch(SQLException e){
                    e.printStackTrace();
                }
                return "PENDING" + Integer.toString(count);
            }else{return "";}
        }
}