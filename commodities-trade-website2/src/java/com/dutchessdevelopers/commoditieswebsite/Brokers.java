/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dutchessdevelopers.commoditieswebsite;
import java.sql.*;

/**
 *
 * @author Lucas
 */
public class Brokers {
    //These keys will allow me to gain access to the database.
    String URL = "jdbc:mysql://localhost:3306/commodities_trading?autoReconnect=true&useSSL=false";
    String USERNAME = "root";
    String PASSWORD = "1234";
    
    /** Database Level Variables **/
    Connection connection = null;
    PreparedStatement getBroker = null;
    PreparedStatement deleteBroker = null;
    PreparedStatement insertBroker = null;
    PreparedStatement updateBroker = null;
    ResultSet resultSet = null;
    
    /**
     * DEFAULT CONSTRUCTOR
     * Initializes all database level variables.
     */
    public Brokers(){
        try{
            connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
            getBroker = connection.prepareStatement("SELECT first_name,last_name"
                    + "FROM broker;");
            deleteBroker = connection.prepareStatement("DELETE FROM broker"
                    + "WHERE first_name = ?;");
            insertBroker = connection.prepareStatement("INSERT INTO broker"
                    + "VALUES ?, ?;");
            updateBroker = connection.prepareStatement("UPDATE broker"
                    + "SET (first_name = ?, last_name = ?)"
                    + "WHERE (first_name=?);");   
                    
        }catch(SQLException e){
            System.out.println("ERRROORRRR");
            e.printStackTrace();
        }
    }
    
    /**
     * @Param the columns needed, a string formatted for SQL Select * From code
     * @return a ResultSet object containing the requested information.
     */
    public ResultSet getBroker(){
        try{
            resultSet = getBroker.executeQuery();
        }catch(SQLException e){
            e.printStackTrace();
            System.out.println("ERROR");
        }
        return resultSet;
    }
    
    /**
     * @param the data values for each column in the table.
     * @return 1 if success, 0 if fail.
     */
    public int updateBroker(String oldFirstName, String firstName, String lastName){
        int result=0;
        try{
            //Replace question mark with SQL string that will place the variables.
            updateBroker.setString(1, firstName);
            updateBroker.setString(2,lastName);
            updateBroker.setString(3, oldFirstName);
            result = updateBroker.executeUpdate(); 
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    
    /**
     * @param the data values for each column in the table.
     * @return 1 if success, 0 if fail.
     */
    public int insertBroker(String firstName, String lastName){
        int result=0;
        try{
            //Replace question mark with SQL string that will place the variables.
            insertBroker.setString(1, firstName);
            insertBroker.setString(2,lastName);
            result = insertBroker.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    
    /**
     * @param the name of the broker to be deleted.
     * @return 1 if success, 0 if fail.
     */
    public int deleteBroker(String firstName){
        int result = 0;
        try{
           deleteBroker.setString(1, firstName);
           result = deleteBroker.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
}
