<%-- 
    Document   : brokeroptions
    Created on : Aug 10, 2016, 3:06:56 PM
    Author     : Dino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading|Broker Options</title>
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
         <script src="verifyAdmin.js"></script>
    </head>
    <body onload="">
	<div id="header">
	    <h1>Broker Options</h1>
	    <h2>Please Select From One of The Following Options</h2>
	</div>
	<div id="central" align="center">
 	    <form name="addBrokerForm" action="addbroker.jsp" method="POST">
                <input id="button" type="submit" value="Add a Broker" name="addBrokerButton"/>
            </form>

 	    <form name="editAndViewBrokerForm" action="viewbroker.jsp" method="POST">
                <input id="button" type="submit" value="Edit, View, or Delete a Broker" name="editAndViewButton"/>
            </form>
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
