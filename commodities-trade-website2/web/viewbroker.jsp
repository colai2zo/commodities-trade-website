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
           brokers.insertBroker("John", "Joseph");
           brokers.insertBroker("Chex", "Mix");
           System.out.println("VIEWBROKER INSTANTIATION");%>
        <form name="submitForm" action="viewbroker.jsp">
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
                <% while(brokerData.next()) {%>
                <tr>
                    <td><input type="text" name="first" value="<%= brokerData.getString(1)%>" size="20px" /></td>
		    <td><input type="text" name="last" value="<%= brokerData.getString(2)%>" size="20px" /></td>
                    <td>     
                            <input type="submit" value="SubmitUpdatedBroker" name="submitButton" />
                    </td>
		    <td>
                            <input type="submit" value="delete" name="deleteBrokerButton"/>
                    </td>
                </tr>
                <% } %>
	    </tbody>
	</table>
        </form>

        <%
            if(request.getParameter("submitButton") != null){
                brokers.updateBroker(brokerData.getString(1),request.getParameter("first"),request.getParameter("last"));
            }
            if(request.getParameter("deleteBrokerButton") != null){
                brokers.deleteBroker(request.getParameter("first"));
            }
        %>
	</div>
       
    </body>
</html>
