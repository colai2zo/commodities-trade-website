<%-- 
    Document   : currentOrdersAdmin
    Created on : Aug 7, 2016, 1:04:04 PM
    Author     : Lucas
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        tr:nth-child(even){
            background-color: #f2d9e6;
        }
    </style>
    <%
        DateFormat dateFormat = new SimpleDateFormat("EEEE MMMM d, yyyy");
        Calendar cal = Calendar.getInstance();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading | Current Orders</title>
        <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <script src="verifyAdmin.js"></script>
    </head>
    <body onload="verifyAdmin()">
        <div id="header" align="center">
            <h1>Orders: <%= dateFormat.format(cal.getTime())%> </h1>
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
                        <th colspan="14">Pending Orders</th>
                    </tr>
                    <tr>
                        <th>Channel Partner</th>
                        <th>Farmer #</th>
                        <th>Order #</th>
                        <th>Description</th>
                        <th>Futures</th>
                        <th>Client Month</th> <!--new-->
                        <th>Quantity</th>
                        <th>Cost Per Ton</th> <!--moved-->
                        <th>Strike Shift</th>
                        <th>Current Market</th> <!--new-->
                        <th>Executed Hedge</th> <!--new-->
                        <th>Contract Strike</th> <!--new-->
                        <th>Status</th>
                        <th></th>
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
                        <td></td>
                        <td></td>
                        <td><input type="text" name="hedgeInput" value="" size="20" /></td>
                        <td></td>
                        <td>
                            <form name="submitCoice" action="currentOrdersAdmin.jsp" method="POST">
                                <select name="Approve/Decline" id="approveChooser" onchange="getText()">
                                    <option value="Pending">Pending</option>
                                    <option value="Approve">Approve</option>
                                    <option value="Decline">Decline</option>
                                </select>
                                <input type="submit" value="Submit" name="submitChoice" />
                            </form>
                        </td>
                        <td>
                            <form name="toContract" action="contract" method="POST">
                                <input type="submit" value="Finalize Order" name="finalizeContract" disabled="disabled" style="width:130px; height: 40px"/>
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
            <br><br>
            <table border="1" style="width:90%" cellpadding="18%">
                <thead>
                    <tr>
                        <th colspan="12">Executed Orders</th>
                    </tr>
                    <tr>
                        <th>Channel Partner</th>
                        <th>Farmer #</th>
                        <th>Order #</th>
                        <th>Description</th>
                        <th>Futures</th>
                        <th>Client Month</th> <!--new-->
                        <th>Quantity</th>
                        <th>Cost Per Ton</th> <!--moved-->
                        <th>Strike Shift</th>
                        <th>Current Market</th> <!--new-->
                        <th>Executed Hedge</th> <!--new-->
                        <th>Contract Strike</th> <!--new-->
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
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <br><br>
            <table border="1" style="width:90%" cellpadding="18%">
                <thead>
                    <tr>
                        <th colspan="12">Declined Orders</th>
                    </tr>
                    <tr>
                        <th>Channel Partner</th>
                        <th>Farmer #</th>
                        <th>Order #</th>
                        <th>Description</th>
                        <th>Futures</th>
                        <th>Client Month</th> <!--new-->
                        <th>Quantity</th>
                        <th>Cost Per Ton</th> <!--moved-->
                        <th>Strike Shift</th>
                        <th>Current Market</th> <!--new-->
                        <th>Executed Hedge</th> <!--new-->
                        <th>Contract Strike</th> <!--new-->
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
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>

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
                            <form name="backForm" action="manageBook.jsp" method="POST">
                                <input id="backAndHome" type="submit" value="Go Back" name="backButton" />
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>