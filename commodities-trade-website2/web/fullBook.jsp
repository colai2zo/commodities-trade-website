<%-- 
    Document   : partnerPosition
    Created on : Aug 7, 2016, 2:49:07 PM
    Author     : Lucas
--%>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script src="../jquery.bgiframe.min.js" type="text/javascript"></script>
<script src="../jquery.multiSelect.js" type="text/javascript"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
    th{
    padding: 5px 25px 5px 25px;
    }
    </style>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading | Channel Partner Position</title>
        <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <script src="verifyAdmin.js"></script>
    </head>
    <body onload="verifyAdmin()">
        <div id="header" align="center">
            <h1>Complete Book</h1><br>
            <table border="0" style="padding-left: 10px; padding-right: 10px">
                <tbody>
                    <tr>
                        <td>Select Columns: </td>
                        <td>
                            <select id="colSelector" name="colSelector" multiple="multiple" onchange="selectColumns()">
                                <option value ="CP">Channel Partner</option>
                                <option value="tradedate">Trade Date</option>
                                <option value="ordernum">Order Number</option>
                                <option value="commodity">Commodity</option>
                                <option value="deliverycontract">Delivery Contract</option>
                                <option value="instrument">Instrument</option>
                                <option value="type">Type</option>
                                <option value="vol">Volume</option>
                                <option value="strike">Strike</option>
                                <option value="expiration">Expiration</option>
                                <option value="originalmarket">Original Market</option>
                                <option value="underlying">Underlying</option>
                                <option value="currentvol">Current Volatility</option>
                                <option value="delta">Delta</option>
                                <option value="gamma">Gamma</option>
                                <option value="theta">Theta</option>
                                <option value="vega">Vega</option>
                                <option value="hedge/trade">Hedge/Trade</option>
                                <option value="broker">Broker</option>
                                <option value="farmnum">Farmer Number</option>
                            </select>
                        </td>
                        <td>Sort By: </td>
                        <td>
                            <select name="sortOptions">
                                <option>Date</option>
                                <option>Channel Partner</option>
                                <option>Type</option>
                                <option>Order #</option>
                                <option>Commodity</option>
                                <option>Delivery Contract</option>
                                <option>Instrument</option>
                                <option>Expiry Date</option>
                                <option>Broker</option>
                                <option>Farmer #</option>
                                <option>Status</option>
                            </select>
                        </td>
                        <form name="searchForm" action="fullbook.jsp">
                            <td>
                                <input type="text" name="searchInput" value="" size="20" />
                            </td>
                            <td>
                                <input type="submit" value="Search" name="searchButton" method="POST" />
                            </td>
                        </form>
                    </tr>
                </tbody>
            </table>

            <br><br>
        </div>
        <div id="central" align="center">
            <table border="1" >
                    <thead>
                        <tr>
                            <th>Channel Partner</th>
                            <th>Type (Hedge/Trade)</th>
                            <th>Order Number</th>
                            <th>Date</th>
                            <th>Commodity</th>
                            <th>Delivery Contract</th>
                            <th>Instrument</th>
                            <th>Frequency</th>
                            <th>Volume</th>
                            <th>Strike</th>
                            <th>Expiry Date</th>
                            <th>Original Market</th>
                            <th>Current Underlying</th>
                            <th>Current Volatility</th>
                            <th>Market Price Per Unit</th> <!--new -->
                            <th>Delta</th>
                            <th>Gamma</th> <!--switched -->
                            <th>Vega</th> <!--switched -->
                            <th>Theta</th>
                            <th>MTM</th> <!--new This means "Mark to Market"-->
                            <th>Profit/Loss Total</th> <!--new -->
                            <th>Profit/Loss Per Unit</th> <!--new -->
                            <th>Position (Lots)</th> <!--new -->
                            <th>Broker</th>
                            <th>Farmer Number</th>
                            <th>Status</th> <!--Active, Expired or Unwound-->
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