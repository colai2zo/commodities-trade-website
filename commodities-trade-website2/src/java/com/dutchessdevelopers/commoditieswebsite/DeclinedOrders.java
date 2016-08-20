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
public class DeclinedOrders {
    //These Keys will allow me to gain access to the database.
    String URL = "jdbc:mysql://localhost:3306/commodities_trading";
    String USERNAME = "root";
    String PASSWORD = "maps827";
    
    /** Database Level Variables **/
    Connection connection = null;
    PreparedStatement getOrders = null;
    PreparedStatement deleteOrders = null;
    PreparedStatement insertOrders = null;
    ResultSet resultSet = null;
    
    /**
     * DEFAULT CONSTRUCTOR
     * Initializes all database level variables.
     */
    public DeclinedOrders(){
        try{
            connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
            getOrders = connection.prepareStatement("SELECT ? FROM declined_orders;");

            deleteOrders = connection.prepareStatement("DELETE FROM declined_orders"
                    + " WHERE order_number = ?;");
            insertOrders = connection.prepareStatement("INSERT INTO declined_orders"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?);");
                    
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    /**
     * @Param the columns needed, a string formatted for SQL Select * From code
     * @return a ResultSet object containing the requested information.
     */
    public ResultSet getDeclinedOrders(String columnsNeeded){
        try{
            getOrders.setString(1, columnsNeeded);
            resultSet = getOrders.executeQuery();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return resultSet;
    }
    
    /**
     * @param the data values for each column in the table.
     * @return 1 if success, 0 if fail.
     */
    public int insertDeclinedOrders(int farmer_id, int order_number, String description, String futures_contract, String quantity, int strike, double cost_per_ton, Timestamp timestamp){
        int result=0;
        try{
            //Replace question mark with SQL string that will place the variables.
            insertOrders.setInt(1, farmer_id);
            insertOrders.setInt(2, order_number);
            insertOrders.setString(3, description);
            insertOrders.setString(4, futures_contract);
            insertOrders.setString(5, quantity);
            insertOrders.setInt(6, strike);
            insertOrders.setDouble(7, cost_per_ton);
            insertOrders.setTimestamp(8, timestamp);
            result = insertOrders.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    
    /**
     * @param the id number of the channel partner to be deleted.
     * @return 1 if success, 0 if fail.
     */
    public int deleteDeclinedOrders(int order_Number){
        int result = 0;
        try{
           deleteOrders.setInt(1, order_Number);
           result = deleteOrders.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
}