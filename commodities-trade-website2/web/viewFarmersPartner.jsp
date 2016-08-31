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
        <title>Commodities Trading|View Farmers</title>
        <script src="verifyPartner.js"></script>
    </head>
    <body onload="verifyPartner()">
        <div id="header" align="center">
            <h1 style="align:center">View Current Farmers</h1>
        </div>
        <div id="central" align="center">
            <%
                Farmers farmers = new Farmers();
                ResultSet farmData = farmers.getFarmers();
            %>
            <table border="1" cellpadding="15%" style="width:90%">
            <thead>
                <tr>
                    <th>Farm ID Number</th>
                    <th>Farm Name</th>
                    <th>Date Added</th>
                </tr>
            </thead>
            <tbody>
                
                <%
                    while(farmData.next()){
                        int farmCount = farmData.getRow();
                        if(farmData.getString("partner_id").equals(new ChannelPartner().getPartnerIDByUsername(session.getAttribute("username").toString()))
                           &&  farmData.getString("status").equals("approve")){
                %>
                            <tr>
                                <td name=<%=("partnerID" + farmCount)%>><%=farmData.getString("farmer_id")%></td>
                                <td name=<%=("firstName" + farmCount)%>><%=farmData.getString("first_name")%></td>
                                <td name=<%=("dateAdded" + farmCount)%>><%=farmData.getString("timestamp")%></td>
                            </tr>
                <%
                        }
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
                            <form name="backForm" action="farmerInfoPartner.jsp" method="POST">
                                <input id="backAndHome" type="submit" value="Go Back" name="backButton" />
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
