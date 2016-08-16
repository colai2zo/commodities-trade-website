<%-- 
    Document   : partnerPosition
    Created on : Aug 7, 2016, 2:49:07 PM
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading | Channel Partner Position</title>
        <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <script src="verifyPartner.js"></script>
    </head>
    <body onload="verifyPartner()">      
        <div id="central" align="center">
            <table border="1" style="width:90%" cellpadding="10px">
                <thead>
                    <tr>
                        <th colspan="5">My Channel Partner Position</th>
                    </tr>
                    <tr>
                        <th>Channel Partner</th>
                        <th>Delta</th>
                        <th>Gamma</th>
                        <th>Vega</th>
                        <th>Theta</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>

        </div>
        
        
    </body>
</html>