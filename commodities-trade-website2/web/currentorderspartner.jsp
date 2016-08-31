<%-- 
    Document   : currentorderspartner.jsp
    Created on : Aug 7, 2016, 3:34:23 PM
    Author     : Peter.Colaizzo
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.*" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
    tr:nth-child(even) {
    background-color: #f2d9e6;
    }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" media="screen" rel="stylesheet" type="text/css" />
        <title>Commodities Trading | current orders</title>
        <script src="verifyPartner.js"></script>
    </head>
    <body onload="verifyPartner()">
         <div id="header" align="center" style="padding-bottom: 20px">
         <%
            Orders orders = new Orders();
            ResultSet orderData = orders.getOrders();
            String username = "";
            String pID = "";
            try{
                username = session.getAttribute("username").toString();
                pID = new ChannelPartner().getPartnerIDByUsername(username);
            }catch(java.lang.NullPointerException e){
                response.sendRedirect("login.jsp");
            }
         %>
        <h1>Pending Orders</h1>
        </div>
        
        <div id="central" align="center">
            <table border="1" cellpadding="10%" style="width:90%">
                <thead>
                    <tr>
                        <th>Farmer #</th>
                        <th>Farmer Name</th>
                        <th>Order #</th>
                        <th>Description</th>
                        <th>Futures</th>
                        <th>Client Month</th>
                        <th>Quantity</th>
                        <th>Strike</th>
                        <th>Cost per Ton</th>
                        <th>Status</th>
                        <th>View Confirmation</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        while(orderData.next()){
                            if(orderData.getString("farmer_id").indexOf(pID) >= 0 && orderData.getString("status").equals("pending")){
                    %>
                                <tr>
                                    <td><%= orderData.getString("farmer_id")%></td>
                                    <td><%= orderData.getString("first_name") + " " + orderData.getString("last_name") %></td>
                                    <td><%= orderData.getString("order_number")%></td>
                                    <td><%= orderData.getString("description")%></td>
                                    <td><%= orderData.getString("futures_contract")%></td>
                                    <td>Client Month</td>
                                    <td><%= orderData.getString("quantity")%></td>
                                    <td><%= orderData.getString("strike")%></td>
                                    <td><%= orderData.getString("cost_per_ton")%></td>
                                    <td><%= orderData.getString("status")%></td>
                                    <td>
                                        <input id="button" align="center" type="submit" value="View Confirmation" name="viewContractButton" />
                                    </td>
                                </tr>
                    <%        }
                        }
                    %>
                    
                </tbody>
            </table>

        </div>
        <div class="fixed">
            <table border="0">
                <tbody>
                    <tr>
                        <td>
                            <form name="homeForm" action="channelpartnerhome.jsp" method="POST">
                                <input id="backAndHome" type="submit" value="Return to Home Screen" name="homeButton" />
                            </form>
                        </td>
                        <td>
                            <form name="backForm" action="channelpartnerhome.jsp" method="POST">
                                <input id="backAndHome" type="submit" value="Go Back" name="backButton" />
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
