<%-- 
    Document   : viewEmployee
    Created on : Aug 20, 2016, 2:23:23 PM
    Author     : Lucas
--%>

<%@page import="java.sql.*"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.Employee" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading|View or Delete an Employee</title>
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
         <script src="verifyAdmin.js"></script>
    </head>
    <body onload="">
	<div id="header">
	    <h1>View or Delete an Employee</h1>
	</div>
	<div id="central" align="center">
        <% Employee employee = new Employee();
           ResultSet employeeData = employee.getEmployee(); 
           int employeeCount = 0;
        %>
        <form name="submitForm" action="viewEmployee.jsp" method="POST">
	<table border="1" cellpadding="15%">
	    <thead>
		<tr>
		    <td>First Name</td>
		    <td>Last Name</td>
                    <td>Username</td>
                    <td>Password</td>
                    <td>Administration Rights</td>
                    <td>Book Management Rights</td>
                    <td>Reporting Rights</td>
                    <td>Pricing Rights</td>
		    <td>Delete</td>
		</tr>
	    </thead>
	    <tbody>
                <% while(employeeData.next()) {
                employeeCount = employeeData.getRow();
                %>
                <tr>
                    <td><%= employeeData.getString("first_name")%></td>
                    <td><%= employeeData.getString("last_name")%></td>
                    <td><input type="hidden" name="<%= ("username" + employeeCount)%>" value="<%= employeeData.getString("username")%>"/><%= employeeData.getString("username")%></td>
                    <td><%= employeeData.getString("password")%></td>
                    <td><%= employeeData.getBoolean("admin")%></td>
                    <td><%= employeeData.getBoolean("book_management")%></td>
                    <td><%= employeeData.getBoolean("reporting")%></td>
                    <td><%= employeeData.getBoolean("pricing")%></td>
                    <td>
                            <input type="submit" value="Delete" name="<%= ("deleteButton" + employeeCount)%>"/>
                    </td>
                    
                </tr>
                <% } %>
	    </tbody>
	</table>
        </form>

        <%
            int count=0;
            employeeData.beforeFirst();
            while (employeeData.next()){
                count++;
                if (request.getParameter("deleteButton" + count) != null){
                    employee.fireEmployee(request.getParameter("username" + count));
                    response.setHeader("Refresh", "0; URL=viewEmployee.jsp");
                }
            }
        %>
	</div>
       
    </body>
    
</html>
