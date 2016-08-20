<%-- 
    Document   : viewbroker
    Created on : Aug 10, 2016, 3:43:14 PM
    Author     : Dino
--%>
<%@page import="java.sql.*"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.Brokers" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading|View, Edit, or Delete a Broker</title>
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
         <script src="verifyAdmin.js"></script>
    </head>
    <body onload="">
	<div id="header">
	    <h1>View, Edit, or Delete a Broker</h1>
	</div>
	<div id="central" align="center">
	    <select name="Choose Channel Partner" align="left">
            <option>Channel Partner 1</option>
            </select> <br>
        <% Brokers brokers = new Brokers();
           ResultSet brokerData = brokers.getBroker(); 
           int brokerCount = 0;
           //brokers.insertBroker("Chex", "Mix");
           System.out.println("VIEWBROKER INSTANTIATION");%>
        <form name="submitForm" action="viewbroker.jsp" method="POST">
	<table border="1" cellpadding="15%">
	    <thead>
		<tr>
		    <td>First Name</td>
		    <td>Last Name</td>
                    <td>Submit</td>
		    <td>Delete</td>
		</tr>
	    </thead>
	    <tbody>
                <% while(brokerData.next()) {
                brokerCount = brokerData.getRow();
                %>
                <tr>
                    <td><input type="text" name="<%= ("first" + brokerCount)%>" value="<%= brokerData.getString("first_name")%>" size="20px" /></td>
                    <td><input type="text" name="<%= ("last" + brokerCount)%>" value="<%= brokerData.getString("last_name")%>" size="20px" /></td>
                    <td>     
                            <input type="submit" value="Update" name="<%= ("submitButton" + brokerCount)%>" />
                    </td>
                    <td>
                            <input type="submit" value="Delete" name="<%= ("deleteButton" + brokerCount)%>"/>
                    </td>
                    
                </tr>
                <% } %>
	    </tbody>
	</table>
        </form>

        <%
            int count=0;
            brokerData.beforeFirst();
            while (brokerData.next()){
                count++;
                if(request.getParameter("submitButton" + count) != null){
                    System.out.println("UPDATE");
                    brokers.updateBroker(brokerData.getString("first_name"),request.getParameter("first" + count),request.getParameter("last" + count));
                    response.setHeader("Refresh", "0; URL=viewbroker.jsp");
                }
            }
            count = 0;
            brokerData.beforeFirst();
            while (brokerData.next()){
                count++;
                if (request.getParameter("deleteButton" + count) != null){
                    System.out.println("DELETION");
                    brokers.deleteBroker(request.getParameter("first" + count));
                    response.setHeader("Refresh", "0; URL=viewbroker.jsp");
                }
            }
        %>
	</div>
       
    </body>
    
</html>
