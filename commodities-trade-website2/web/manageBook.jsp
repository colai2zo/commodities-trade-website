<%-- 
    Document   : mangeBook
    Created on : Aug 7, 2016, 12:09:17 PM
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading | Manage Book</title>
        <script src="verifyAdmin.js"></script>
    </head>
    <body onload="verifyAdmin()">
        <div id="header" align="center">
            <h1>Book Management</h1>
        </div>
        
        <div id="central" align="center">
            <form name="completeBook" action="fullBook.jsp" method="POST">
                <input id="button" type="submit" value="View Complete Book" name="viewFullBook" />
            </form>

            <form name="orders" action="currentOrdersAdmin.jsp" method="POST">
                <input id="button" type="submit" value="View Orders" name="viewPending" />
            </form>
            
            <form name="hedgeTrades" action="hedgeTrades.jsp" method="POST">
                <input id="button" type="submit" value="Hedging Trades" name="hedgeTrades" />
            </form>
            
            <form name="CPPosition" action="partnerPosition.jsp" method="POST">
                <input id="button" type="submit" value="Channel Partner Position" name="CPPosition" />
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
                            <form name="backForm" action="AdminHomePage.jsp" method="POST">
                                <input id="backAndHome" type="submit" value="Go Back" name="backButton" />
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>