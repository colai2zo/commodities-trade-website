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
public class Employee {
    //These Keys will allow me to gain access to the database.
    String URL = "jdbc:mysql://localhost:3306/commodities_trading";
    String USERNAME = "root";
    String PASSWORD = "1234";
    
    /** Database Level Variables **/
    Connection connection = null;
    PreparedStatement getEmployee = null;
    PreparedStatement fireEmployee = null;
    PreparedStatement insertEmployee = null;
    PreparedStatement updateEmployee = null;
    ResultSet resultSet = null;
    
    /**
     * DEFAULT CONSTRUCTOR
     * Initializes all database level variables.
     */
    public Employee(){
        try{
            connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
            getEmployee = connection.prepareStatement("SELECT * FROM employees;");

            fireEmployee = connection.prepareStatement("DELETE FROM employees"
                    + " WHERE username = ?;");
            insertEmployee = connection.prepareStatement("INSERT INTO employees"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");
            updateEmployee = connection.prepareStatement("UPDATE employee"
                    + " SET first_name=?, last_name=?, username=?, password=?, admin=?, book_management=?, reporting=?, pricing=?, timestamp=?"
                    + " WHERE username=?;"); 
                    
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    /**
     * @Param the columns needed, a string formatted for SQL Select * From code
     * @return a ResultSet object containing the requested information.
     */
    public ResultSet getEmployee(/*String columnsNeeded*/){
        try{
            //getEmployee.setString(1, columnsNeeded);
            resultSet = getEmployee.executeQuery();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return resultSet;
    }
    
    /**
     * @param the data values for each column in the table.
     * @return 1 if success, 0 if fail.
     */
    public int updateEmployee(String firstName, String lastName, String username, String password, boolean adminRights, boolean bookManagementRights, boolean reportingRights, boolean pricingRights, Timestamp timestamp){
         int result=0;
        try{
            //Replace question mark with SQL string that will place the variables.
            updateEmployee.setString(1, firstName);
            updateEmployee.setString(2,lastName);
            updateEmployee.setString(3,username);
            updateEmployee.setString(4,password);
            updateEmployee.setBoolean(5,adminRights);
            updateEmployee.setBoolean(6, bookManagementRights);
            updateEmployee.setBoolean(7, reportingRights);
            updateEmployee.setBoolean(8, pricingRights);
            updateEmployee.setTimestamp(9,timestamp);
            updateEmployee.setString(10,username);
            result = updateEmployee.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    
    /**
     * @param the data values for each column in the table.
     * @return 1 if success, 0 if fail.
     */
    public int insertEmployee(String firstName, String lastName, String username, String password, boolean adminRights, boolean bookManagementRights, boolean reportingRights, boolean pricingRights, Timestamp timestamp){
        int result=0;
        try{
            //Replace question mark with SQL string that will place the variables.
            insertEmployee.setString(1, firstName);
            insertEmployee.setString(2,lastName);
            insertEmployee.setString(3,username);
            insertEmployee.setString(4,password);
            insertEmployee.setBoolean(5,adminRights);
            insertEmployee.setBoolean(6, bookManagementRights);
            insertEmployee.setBoolean(7, reportingRights);
            insertEmployee.setBoolean(8, pricingRights);
            insertEmployee.setTimestamp(9,timestamp);
            result = insertEmployee.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    
    /**
     * @param the username of the channel partner to be deleted.
     * @return 1 if success, 0 if fail.
     */
    public int fireEmployee(String username){
        int result = 0;
        try{
           fireEmployee.setString(1, username);
           result = fireEmployee.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    
    /**
     * @return a password made of random integers and letters
     */
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