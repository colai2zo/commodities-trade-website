<%-- 
    Document   : viewCP
    Created on : Aug 10, 2016, 2:43:14 PM
    Author     : Dino martinez
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
        <title>Commodities Trading|Channel Partner Page</title>
        <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <script src="verifyAdmin.js"></script>
    </head>
    <body onload="verifyAdmin()">
	<div id="header">
	<h1>View, Edit, and Delete Channel Partners</h1>
	</div>
        <div id="central" align="center">
            <%
                ChannelPartner channelPartner = new ChannelPartner();
                ResultSet cpData = channelPartner.getChannelPartners();
                int cpCount = 0;
                %>
            <form name="submitForm" action="viewCP.jsp" method="POST">
            <table id="cpTable" border="1" cellpadding="15%" style="width:90%">
                <thead>
                    <th>Channel Partner Code</th>
                    <th>Channel Partner Name</th>
                    <th>Username</th>
                    <th>Submit</th>
                    <th>Delete</th>
                </thead>
                <tbody>
                <% while(cpData.next()) {
                cpCount = cpData.getRow();
                %>
                <tr>
                    <td><input type="text" name="<%="code" + cpCount%>" value="<%= cpData.getString("id_code")%>" size="20px" ></td>
                    <td><input type="text" name="<%= ("name" + cpCount)%>" value="<%= cpData.getString("name")%>" size="20px" /></td>
                    <td><input type="text" name="<%= ("username" + cpCount)%>" value="<%= cpData.getString("username")%>" size="20px" /></td>
                    <td>     
                            <input type="submit" value="Update" name="<%= ("submitButton" + cpCount)%>" />
                    </td>
                    <td>
                            <input type="submit" value="Delete" name="<%= ("deleteButton" + cpCount)%>"/>
                    </td>
                    
                </tr>
                <% } %>
	    </tbody>
            </table>
            </form>
            <%
            int count=0;
            cpData.beforeFirst();
            while (cpData.next()){
                count++;
                if(request.getParameter("submitButton" + count) != null){
                    System.out.println("UPDATE");
                    channelPartner.updateChannelPartners(
                            cpData.getString("id_code"),
                            request.getParameter("name" + count),
                            request.getParameter("username" + count),
                            cpData.getString("password"),
                            Double.parseDouble(request.getParameter("delta"+count)),
                            Double.parseDouble(request.getParameter("vega"+count)),
                            Double.parseDouble(request.getParameter("gamma"+count)),
                            Double.parseDouble(request.getParameter("theta"+count)),
                            new Timestamp(Calendar.getInstance().getTime().getTime()));
                    response.setHeader("Refresh", "0; URL=viewCP.jsp");
                }
            }
            count = 0;
            cpData.beforeFirst();
            while (cpData.next()){
                count++;
                if (request.getParameter("deleteButton" + count) != null){
                    System.out.println("DELETION");
                    channelPartner.deleteChannelPartner(request.getParameter("code" + count));
                    response.setHeader("Refresh", "0; URL=viewCP.jsp");
                }
            }
        %>
        </div>
        <div class="fixed">
            <table border="0">
                <tbody>
                    <tr>
                        <td>
                            <form name="homeForm" action="AdminHomePage.jsp" method="POST">
                                <input id="backAndHome" type="submit" value="Return to Home Screen" name="homeButton" />
                            </form>
                        </td>
                        <td>
                            <form name="backForm" action="partnerpage.jsp" method="POST">
                                <input id="backAndHome" type="submit" value="Go Back" name="backButton" />
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>