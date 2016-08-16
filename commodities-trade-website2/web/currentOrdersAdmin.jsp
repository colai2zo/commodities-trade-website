<%-- 
    Document   : currentOrdersAdmin
    Created on : Aug 7, 2016, 1:04:04 PM
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        tr:nth-child(even){
            background-color: #f2d9e6;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading | Current Orders</title>
        <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <script src="verifyAdmin.js"></script>
    </head>
    <body onload="verifyAdmin()">
        <div id="header" align="center">
            <h1>Pending Orders</h1>
        </div>
        
         <script>
            function getText()
            {
                var myTable = document.getElementById("theTable");
                var selectedValue = approveChooser.options[approveChooser.selectedIndex].value;
                (for i=0;i<document.getElementById("theTable").rows.length;i++)
                {
                    if(selectedValue==="Approve")
                        document.getElementById("button").value="Finalize Contract";
                    else if(selectedValue==="Decline")
                        document.getElementById("button").value="Delete Contract";
                }
                
            }
        </script>
        
        <div id="central" align="center">
            <table border="1" style="width:90%" cellpadding="18%" id="theTable">
                <thead>
                    <tr>
                        <th>Channel Partner</th>
                        <th>Farmer #</th>
                        <th>Order #</th>
                        <th>Description</th>
                        <th>Futures Contract</th>
                        <th>Quantity</th>
                        <th>Strike</th>
                        <th>Cost/ton</th>
                        <th>Status</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>A</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <select name="Approve/Decline" id="approveChooser">
                                <option value="Pending">Pending</option>
                                <option value="Approve">Approve</option>
                                <option value="Decline">Decline</option>
                            </select>
                            <form name="submitCoice" action="currentOrdersAdmin.jsp" method="POST">
                                <input type="submit" value="Submit" name="submitChoice" />
                            </form>
                        </td>
                        <td>
                            <form name="toContract" action="contract" method="POST">
                                <input id="button" type="submit" value="Finalize Contract" name="finalizeContract" disabled="disabled"/>
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>

        </div>
    </body>
</html>