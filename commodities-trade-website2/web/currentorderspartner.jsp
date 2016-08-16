<%-- 
    Document   : currentorderspartner.jsp
    Created on : Aug 7, 2016, 3:34:23 PM
    Author     : Peter.Colaizzo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
    tr:nth-child(even) {
    background-color: #f2d9e6;
    }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" media="screen" rel="stylesheet" type="text/css" />
        <title>Commodities Trading | current orders</title>
        <script src="verifyPartner.js"></script>
    </head>
    <body onload="verifyPartner()">
         <div id="header" align="center" style="padding-bottom: 20px">
        <h1>Pending Orders</h1>
        </div>
        
        <div id="central" align="center">
            <table border="1" cellpadding="10%" style="width:90%">
                <thead>
                    <tr>
                        <th>Farmer #</th>
                        <th>Order #</th>
                        <th>Description</th>
                        <th>Futures Contract</th>
                        <th>Quantity</th>
                        <th>Strike</th>
                        <th>Cost per Ton</th>
                        <th>Status</th>
                        <th>View Contract</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <input id="button" align="center" type="submit" value="View this contract" name="viewContractButton" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </div>
    </body>
</html>
