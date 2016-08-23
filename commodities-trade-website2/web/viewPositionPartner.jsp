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
        <script src="verifyPartner.js"></script>
    </head>
    <body onload="verifyPartner()">      
        <div id="central" align="center">
            <%
                ChannelPartner channelPartner = new ChannelPartner();
                ResultSet cpData = channelPartner.getChannelPartners();
            %>
            <table border="1" style="width:90%" cellpadding="10px">
                <thead>
                    <tr>
                        <th colspan="5">My Channel Partner Position</th>
                    </tr>
                    <tr>
                        <th>Delta</th>
                        <th>Gamma</th>
                        <th>Vega</th>
                        <th>Theta</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        while(cpData.next()){
                            if(cpData.getString("id_code").equals(new ChannelPartner().getPartnerIDByUsername(session.getAttribute("username").toString()))){
                    %>
                        <tr>
                            <td><%=cpData.getDouble("delta")%></td>
                            <td><%=cpData.getDouble("gamma")%></td>
                            <td><%=cpData.getDouble("vega")%></td>
                            <td><%=cpData.getDouble("theta")%></td>
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