<%-- 
    Document   : AdminHomePage
    Created on : Aug 7, 2016, 9:45:35 AM
    Author     : Joey Colaizzo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading|Admin</title>
        <script src="verifyAdmin.js"></script>
    </head>
    <body onload="verifyAdmin()">
        <div id="header">
            <% String username = session.getAttribute("username").toString(); %>
            <h1 style="text-align: center"><%= username %>'s Administrator Page</h1>
        </div>
        <div id="central" align="center">
            <h2 style="text-align: center">Choose from the following
            administrator options:</h2>
            
            <form name="CPSetupForm" action="partnerpage.jsp" method="POST">
                <input id="button" type="submit" value="Channel Partner Page" name="CPPageButton"/>
            </form>
            
            <form name="updateDailyPricingForm" action="updatePricing.jsp" method="POST">
                <input id="button" type="submit" value="Update Today's Pricing" name="updatePricingButton" />
            </form>
            
            <form name="bookManagementForm" action="manageBook.jsp" method="POST">
                <input id="button" type="submit" value="Book Management" name="bookManagementButton" />
            </form>
            
            <form name="reportingForm" action="reporting.jsp" method="POST">
                <input id="button" type="submit" value="Reporting" name="reportingButton" />
            </form>
            
            <form name="employeeOptionsForm" action="employeeOptions.jsp" method="POST">
                <input id="button" type="submit" value="Employee Options" name="employeeOptionsButton" />
            </form>
            
            <form name="pendingFarmersAdmin" action="pendingFarmersAdmin.jsp" method="POST">
                <input id='button' type="submit" value="View Pending Farmers" name="viewFarmers" />
            </form>
        </div>
    </body>   
</html>
