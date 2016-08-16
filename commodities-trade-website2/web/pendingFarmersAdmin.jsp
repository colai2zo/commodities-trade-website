<%-- 
    Document   : pendingFarmersAdmin
    Created on : Aug 11, 2016, 7:36:09 PM
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <title>Commodities Trading|View Pending Farmers</title>
        <script src="verifyAdmin.js"></script>
    </head>
    <body onload="verifyAdmin()">
        <div id="header" align="center">
            <h1>View Pending Farmers</h1>
        </div>
        <div id="central" align="center">
            <table border="1" cellpadding="10" style="width:50%">
            <thead>
                <tr>
                    <th>Channel Partner</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td> </td>
                    <td> </td>
                    <td>
                        <select name="Approve/Decline" id="approveChooser">
                            <option value="Pending">Pending</option>
                            <option value="Approve">Approve</option>
                            <option value="Decline">Decline</option>
                        </select>
                            <form name="submitCoice" action="pendingFarmersAdmin.jsp" method="POST">
                                <input type="submit" value="Submit" name="submitChoice" />
                            </form>
                    </td>
                </tr>
            </tbody>
        </table>
        </div>
    </body>
</html>
