<%-- 
    Document   : setupEmployee
    Created on : Aug 7, 2016, 12:18:14 PM
    Author     : Joey
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.Employee" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading|Setup Employee</title>
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
         <script src="verifyAdmin.js"></script>
    </head>
    <body onload="verifyAdmin()">
        <div id="header">
            <h1>Employee Setup</h1>
            <h2>Enter the following information to setup an employee:</h2>
        </div>
        <%Employee employees = new Employee();%>
        <div id="central" align="center">
            <form name="employeeInfoForm" action="setupEmployee.jsp" method="post">
                <table border="0" cellpadding="5">
                    <tbody>
                        <tr>
                            <td>First Name: </td>
                            <td>
                                <input type="text" name="firstNameInput" value="" size="50" style="padding:10px 0px 10px 0px"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Last Name: </td>
                            <td>
                                <input type="text" name="lastNameInput" value="" size="50" style="padding:10px 0px 10px 0px"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Username: </td>
                            <td><input type="text" name="userNameInput" value="" size="50" style="padding:10px 0px 10px 0px"/></td>
                        </tr>
                        <tr>
                            <td>Password: </td>
                            <td><input type="text" name="passwordInput" value="<%= employees.createPassword()%>" size="50" style="padding:10px 0px 10px 0px" /></td>
                        </tr>
                        <tr>
                            <td colspan="2"><b>Rights:</b> </td>
                        </tr>
                        <tr>
                            <td>All</td>
                            <td><input type="checkbox" name="adminCheckBox" value="ON" onchange="checkAll(this)" />
                        </tr>
                        <tr>
                            <td>Book Management</td>
                            <td><input type="checkbox" name="bookManagementBox" value="ON" />
                        </tr>
                        <tr>
                            <td>Pricing</td>
                            <td><input type="checkbox" name="pricingCheckBox" value="ON" />
                        </tr>
                    </tbody>
                </table>
                <input id="button" type="submit" value="Create Employee" name="submitEmployeeInfoButton" onclick="formSubmission()" />
            </form>
            <form name="returnForm" action="AdminHomePage.jsp" method="post">
                <input id="button" type="submit" value="Back to Home" name="returnButton"/>
            </form>
            
            <%
            if(request.getParameter("submitEmployeeInfoButton") != null){
                Boolean allChecked = false;
                Boolean bookManagementChecked = false;
                Boolean reportingChecked = false;
                Boolean pricingChecked = false;
                Timestamp currentTimestamp = new Timestamp(Calendar.getInstance().getTime().getTime());
                
                if(request.getParameter("adminCheckBox") != null)
                    allChecked = true;
                if(request.getParameter("bookManagementBox") != null)
                    bookManagementChecked = true;
                if(request.getParameter("reportingCheckBox") != null)
                    reportingChecked = true;
                if(request.getParameter("pricingCheckBox") != null)
                    pricingChecked = true;
                
                employees.insertEmployee(request.getParameter("firstNameInput"), request.getParameter("lastNameInput"), request.getParameter("userNameInput"), request.getParameter("passwordInput"), allChecked, bookManagementChecked, reportingChecked, pricingChecked, currentTimestamp);
                System.out.println("INSERTION");
            }
            %>
        </div>
        <script>        
        function checkAll(ele) {
            var checkboxes = document.getElementsByName('adminCheckBox');
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].type === 'checkbox') {
                    checkboxes[i].checked = ele.checked;
                }
            }
        }
        function formSubmission(){
            if(document.getElementByName("nameInput").value === "" || document.getElementByName("userNameInput").value === "" || document.getElementByName("passwordInput").value === "")
            {
                window.alert("Please fill in all text fields to create employee.");
                document.getElementById("button").type = "";
                document.location.href = "setupEmployee.jsp";
            }
            else{
                window.alert("The employee has been added to the database.");
                document.getElementById("button").type = "submit";
                document.location.href = "AdminHomePage.jsp";
            }
        }   
    </script>
    </body>
    
</html>
