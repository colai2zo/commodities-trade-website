<%-- 
    Document   : partnerpage
    Created on : Aug 10, 2016, 2:27:47 PM
    Author     : Dino martinez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading|Channel Partner Page</title>
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
         <script src="verifyPartner.js"></script>
    </head>
    <body onload="verifyAdmin()">
	<div id="header">
	    <h1>Channel Partner Options</h1>
	    <h2>Choose from the following options.</h1>
	</div>
	<div id="central" align="center">
 	    <form name="addCPForm" action="partnerSetup.jsp" method="POST">
                <input id="button" type="submit" value="Channel Partner Setup" name="setupCPButton"/>
            </form>

            <form name="editAndViewCPForm" action="viewCP.jsp" method="POST">
                <input id="button" type="submit" value="Edit and View a Channel Partner" name="editAndViewButton" />
            </form>
            
            <form name="brokerOptionsForm" action="brokeroptions.jsp" method="POST">
                <input id="button" type="submit" value="Broker Options" name="brokerOptionsButton" />
            </form>
	</div>
    </body>
</html>
