<%-- 
    Document   : channelpartnerhome
    Created on : Aug 7, 2016, 9:47:03 AM
    Author     : Dino Martinez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" media="screen" rel="stylesheet" type="text/css" />
        <title>Commodities Trading | channel partner home page</title>
        <script src="verifyPartner.js"></script>
    </head>
    
    <body onload="verifyPartner()">
        <div id="header" align="center" >
        <h1 text-align="center">Channel Partner Home Page</h1>
        </div>
        
        <div id="central" align="center">
        
            <h2>Please select from the following:</h2>
        
        <form name="CheckSpecsForm" action="channelpartnerspecs.jsp" method="POST">
            <input id="button" type="submit" value="View Today's Specs" name="checkSpecsButton" />
        </form>
        
        <form name="PendingOrdersForm" action="currentorderspartner.jsp" method="POST">
            <input id="button" type="submit" value="View Pending Orders" name="pendingOrdersButton" />
        </form>
       
        <form name="OrderHistoryForm" action="orderhistory.jsp" method="POST">
                <input id="button" type="submit" value="Order History" name="orderHistoryButton" />
        </form>
            
        <form name="farmerInfoForm" action="farmerInfoPartner.jsp" method="POST">
            <input id="button" type="submit" value="Farmer Info" name="farmerInfoButton" />
        </form>
            
        <form name="viewPositionForm" action="viewPositionPartner.jsp" method="POST">
            <input id="button" type="submit" value="View My Position" name="viewPositionButton" />
        </form>
            
        </div>
        
    </body>
</html>
