<%-- 
    Document   : farmerInfoPartner
    Created on : Aug 10, 2016, 2:14:45 PM
    Author     : Joey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" media="screen" rel="stylesheet" type="text/css" />
        <title>JSP Page</title>
        <script src="verifyPartner.js"></script>
    </head>
    <body onload="verifyPartner()">
        <div id="header" align="center" >
        <h1 text-align="center">Farmer Information</h1>
        </div>
        
        <div id="central" align="center">
        
            <h2>Please select from the following:</h2>
            <form name="AddFarmerForm" action="farmerSetup.jsp" method="POST">
                <input id="button" type="submit" value="Add Farmer" name="addFarmerButton" />
            </form>

            <form name="viewFarmersForm" action="viewFarmersPartner.jsp" method="POST">
                <input id="button" type="submit" value="View Existing Farmers" name="viewFarmersButton" />
            </form>

            <form name="pendingFamersForm" action="pendingFarmersPartner.jsp" method="POST">
                <input id="button" type="submit" value="View Pending Farmers" name="pendingFarmersButton" />
            </form>
            
        </div>
    </body>
    <script>        
        
    </script>
</html>
