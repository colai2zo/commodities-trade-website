<%-- 
    Document   : partnerPosition
    Created on : Aug 7, 2016, 2:49:07 PM
    Author     : Lucas
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.ChannelPartner" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading | Channel Partner Position</title>
        <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <script src="verifyAdmin.js"></script>
    </head>
    <body onload="verifyAdmin()">      
        <div id="central" align="center">
            <%
                ChannelPartner channelPartner = new ChannelPartner();
                ResultSet cpData = channelPartner.getChannelPartners();
                int cpCount = 0;
                %>
            <table border="1" style="width:90%" cellpadding="10px">
                <thead>
                    <tr>
                        <th colspan="5">Channel Partner Position</th>
                    </tr>
                    <tr>
                        <th>Channel Partner</th>
                        <th>Delta</th>
                        <th>Gamma</th>
                        <th>Vega</th>
                        <th>Theta</th>
                    </tr>
                </thead>
                <tbody>
                <% while(cpData.next()) {
                cpCount = cpData.getRow();
                %>
                <tr>
                    <td size="20px"><%= cpData.getString("id_code")%></td>
                    <td size="20px"><%= cpData.getString("delta")%></td>
                    <td size="20px"><%= cpData.getString("gamma")%></td>
                    <td size="20px"><%= cpData.getString("vega")%></td>
                    <td size="20px"><%= cpData.getString("theta")%></td>
                </tr>
                <% } %>
	    </tbody>
            </table>

        </div>
        
        
    </body>
</html>