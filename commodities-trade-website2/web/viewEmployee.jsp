<%-- 
    Document   : viewEmployee
    Created on : Aug 20, 2016, 2:23:23 PM
    Author     : Lucas
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.Employee" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading|View, Edit or Delete an Employee</title>
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
         <script src="verifyAdmin.js"></script>
    </head>
    <body onload="">
	<div id="header">
	    <h1>View, Edit or Delete an Employee</h1>
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
                    <td>Submit</td>
		    <td>Delete</td>
		</tr>
	    </thead>
	    <tbody>
                <% while(employeeData.next()) {
                employeeCount = employeeData.getRow();
                boolean admin = employeeData.getBoolean("admin");
                boolean book = employeeData.getBoolean("book_management");
                boolean reporting = employeeData.getBoolean("reporting");
                boolean pricing = employeeData.getBoolean("pricing");
                String checkboxValue = "unchecked";
                
                System.out.println(checkboxValue);
                %>
                <tr>
                    <td><%= employeeData.getString("first_name")%></td>
                    <td><%= employeeData.getString("last_name")%></td>
                    <td><input type="hidden" name="<%= ("username" + employeeCount)%>" value="<%= employeeData.getString("username")%>"/><%= employeeData.getString("username")%></td>
                    <td><%= employeeData.getString("password")%></td>
                    <%
                        if(admin)
                            checkboxValue = "checked";
                        else if(admin == false)
                            checkboxValue = "unchecked";
                    %>
                    <td style="text-align: center"><input type="checkbox" name="<%= ("adminRights" + employeeCount)%>" value="ON" <%= checkboxValue%>/></td>
                    <%
                        if(book)
                            checkboxValue = "checked";
                        else if(book == false)
                            checkboxValue = "unchecked";
                    %>
                    <td style="text-align: center"><input type="checkbox" name="<%= ("bookRights" + employeeCount)%>" value="ON" <%= checkboxValue%>/></td>
                    <%
                        if(reporting)
                            checkboxValue = "checked";
                        else if(reporting == false)
                            checkboxValue = "unchecked";
                    %>
                    <td style="text-align: center"><input type="checkbox" name="<%= ("reportingRights" + employeeCount)%>" value="ON" <%= checkboxValue%>/></td>
                    <%
                        if(pricing)
                            checkboxValue = "checked";
                        else if(pricing == false)
                            checkboxValue = "unchecked";
                    %>
                    <td style="text-align: center"><input type="checkbox" name="<%= ("pricingRights" + employeeCount)%>" value="ON" <%= checkboxValue%>/></td>
                    <td>
                        <input type="submit" value="Submit" name="<%= ("submitButton" + employeeCount)%>" />
                    </td>
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
                if (request.getParameter("submitButton" + count) != null){
                    Boolean adminChecked = false;
                    Boolean bookManagementChecked = false;
                    Boolean reportingChecked = false;
                    Boolean pricingChecked = false;
                    Timestamp currentTimestamp = new Timestamp(Calendar.getInstance().getTime().getTime());

                    if(request.getParameter("adminRights" + count) != null)
                        adminChecked = true;
                    if(request.getParameter("bookRights" + count) != null)
                        bookManagementChecked = true;
                    if(request.getParameter("reportingRights" + count) != null)
                        reportingChecked = true;
                    if(request.getParameter("pricingRights" + count) != null)
                        pricingChecked = true;
                
                    employee.updateEmployee(employeeData.getString("first_name"), employeeData.getString("last_name"), employeeData.getString("username"), employeeData.getString("password"), adminChecked, bookManagementChecked, reportingChecked, pricingChecked, currentTimestamp);
                    response.setHeader("Refresh", "0; URL=viewEmployee.jsp");
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
                            <form name="backForm" action="employeeOptions.jsp" method="POST">
                                <input id="backAndHome" type="submit" value="Go Back" name="backButton" />
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
    
</html>
