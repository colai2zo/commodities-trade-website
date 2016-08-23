
<%-- 
    Document   : hedgeTrades
    Created on : Aug 7, 2016, 2:29:41 PM
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.ChannelPartner" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading | Hedge Trade</title>
        <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <script src="verifyAdmin.js"></script>
    </head>
    <body onload="verifyAdmin()">
        <h1>Hedge Trade</h1>
        <div id='central' align='center'>
            <%
                ChannelPartner channelPartner = new ChannelPartner();
                ResultSet cpData = channelPartner.getChannelPartners();
                int cpCount = 0;
                %>
            <table border="0" cellpadding='15' >
                <tbody>
                    <tr>
                        <td>Channel Partner : </td>
                        <td><select name="selectPartner">
                                <option>Select Channel Partner</option>
                                <% while(cpData.next()){ %>
                                    <option><%= cpData.getString("name") %></option>    
                                <% } %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Action : </td>
                        <td><select name="actionChoice">
                                <option>Select Action</option>
                                <option>Buy</option>
                                <option>Sell</option>
                                <option>Unwind</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Quantity : </td>
                        <td><input type="text" name="quantityInput" value="" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Instrument : </td>
                        <td><select name="instrumentSelect">
                                <option>Select Instrument</option>
                                <option>Futures</option>
                                <option>Call</option>
                                <option>Put</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Commodity : </td>
                        <td><select name="commoditySelect">
                                <option>Select Commodity</option>
                                <option>Corn</option>
                                <option>Wheat</option>
                                <option>Soy Bean Meal</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Futures Month : </td>
                        <td><select name="futuresMonthSelect">
                                <option>Select Futures Month</option>
                                <option>January</option>
                                <option>March</option>
                                <option>May</option>
                                <option>November</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Strike : </td>
                        <td><input type="text" name="strikeInput" value="" size="20" /></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div align='center'>
            <form name="submitHedge" action="manageBook.jsp" method="POST">
                <input id='button' type="submit" value="Submit" name="submitHedge" />
            </form>
        </div>
    </body>
</html>
