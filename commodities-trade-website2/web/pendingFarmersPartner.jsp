<%-- 
    Document   : viewFarmersPartner
    Created on : Aug 10, 2016, 3:35:12 PM
    Author     : Joey
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.*" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <title>Commodities Trading|View Pending Farmers</title>
        <script src="verifyPartner.js"></script>
    </head>
    <body onload="verifyPartner()">
        <div id="header" align="center">
            <h1 style="align:center">View Pending Farmers</h1>
        </div>
        <div id="central" align="center">
            <%
                Farmers farmers = new Farmers();
                ResultSet farmData = farmers.getFarmers();
            %>
            <table border="1" cellpadding="15%" style="width:90%">
            <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Time Submitted</th>
                </tr>
            </thead>
            <tbody>
                
                <%
                    while(farmData.next()){
                        int farmCount = farmData.getRow();
                        if(farmData.getString("partner_id").equals(new ChannelPartner().getPartnerIDByUsername(session.getAttribute("username").toString())) //Only Retrieve farmers for this user.
                           &&  farmData.getString("status").equals("pending")){
                %>
                            <tr>
                                <td name=<%=("firstName" + farmCount)%>><%=farmData.getString("first_name")%></td>
                                <td name=<%=("lastName" + farmCount)%>><%=farmData.getString("last_name")%></td>
                                <td name=<%=("timestamp" + farmCount)%>><%=farmData.getTimestamp("timestamp")%></td>
                            </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        </div>
    </body>
</html>
