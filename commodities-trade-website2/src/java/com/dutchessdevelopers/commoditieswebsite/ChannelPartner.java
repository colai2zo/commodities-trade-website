/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dutchessdevelopers.commoditieswebsite;
import java.sql.*;
import java.lang.Math;

/**
 * 
 * @author Joey
 */
public class ChannelPartner {
    //These Keys will allow me to gain access to the database.
    String URL = "jdbc:mysql://localhost:3306/commodities_trading";
    String USERNAME = "root";
    String PASSWORD = "1234";
    
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
            getPartners = connection.prepareStatement("SELECT * FROM channel_partners;");

            deletePartners = connection.prepareStatement("DELETE FROM channel_partners"
                    + " WHERE id_code = ?;");
            insertPartners = connection.prepareStatement("INSERT INTO channel_partners"
                    + " (id_code,name,username,password,delta,vega,gamma,theta,timestamp)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");
            updateChannelPartners = connection.prepareStatement("UPDATE channel_partners"
                    + " SET id_code=?, name=?, username=?, password=?, delta=?, vega=?, gamma=?, theta=?, timestamp=?"
                    + " WHERE id_code=?;"); 
                    
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    /**
     * @Param the columns needed, a string formatted for SQL Select * From code
     * @return a ResultSet object containing the requested information.
     */
    public ResultSet getChannelPartners(){
        try{
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
    public int updateChannelPartners(String id_code, String name, String username, String password, double delta, double vega, double gamma, double theta, Timestamp timestamp){
         int result=0;
        try{
            //Replace question mark with SQL string that will place the variables.
            updateChannelPartners.setString(1, id_code);
            updateChannelPartners.setString(2, name);
            updateChannelPartners.setString(3, username);
            updateChannelPartners.setString(4, password);
            updateChannelPartners.setDouble(5, delta);
            updateChannelPartners.setDouble(6, vega);
            updateChannelPartners.setDouble(7, gamma);
            updateChannelPartners.setDouble(8, theta);
            updateChannelPartners.setTimestamp(9, timestamp);
            updateChannelPartners.setString(10, id_code);
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
    public int insertChannelPartners(String id_code, String name, String username, String password, double delta, double vega, double gamma, double theta, Timestamp timestamp){
        int result=0;
        try{
            //Replace question mark with SQL string that will place the variables.
            insertPartners.setString(1, id_code);
            insertPartners.setString(2, name);
            insertPartners.setString(3, username);
            insertPartners.setString(4, password);
            insertPartners.setDouble(5, delta);
            insertPartners.setDouble(6, vega);
            insertPartners.setDouble(7, gamma);
            insertPartners.setDouble(8, theta);
            insertPartners.setTimestamp(9, timestamp);
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
    public int deleteChannelPartner(String id_code){
        int result = 0;
        try{
           deletePartners.setString(1, id_code);
           result = deletePartners.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    
    public String createPassword(){
        String password = "";
        String character = "";
        int numOrLet;
        int letterChoice;
        int numberChoice;
        String[] alphabet = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
        while(password.length() < 7)
        {
            numOrLet = (int)(Math.random()*2) + 1;
            
            //letter
            if(numOrLet == 1)
            {
                letterChoice = (int)(Math.random()*26);
                character = alphabet[letterChoice];
            }
            //number
            else if (numOrLet == 2)
            {
                numberChoice = (int)(Math.random()*10);
                character = Integer.toString(numberChoice);
            }
            password += character;
        }
        return password;
    }

}