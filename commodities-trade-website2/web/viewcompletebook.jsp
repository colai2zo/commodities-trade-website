<%-- 
    Document   : partnerPosition
    Created on : Aug 7, 2016, 2:49:07 PM
    Author     : Lucas
--%>

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
    </head>
    <body>
        <div id="header" align="center">
            <h1>Complete Book</h1><br>
            
            <select id="colSelector" name="selectCol" multiple="multiple" onchange="selectColumns()">
                <option id="CP">Channel Partner</option>
                <option id="tradedate">Trade Date</option>
                <option id="ordernum">Order Number</option>
                <option id="commodity">Commodity</option>
                <option id="deliverycontract">Delivery Contract</option>
                <option id="instrument">Instrument</option>
                <option id="type">Type</option>
                <option id="vol">Volume</option>
                <option id="strike">Strike</option>
                <option id="expiration">Expiration</option>
                <option id="originalmarket">Original Market</option>
                <option id="underlying">Underlying</option>
                <option id="currentvol">Current Volatility</option>
                <option id="delta">Delta</option>
                <option id="gamma">Gamma</option>
                <option id="theta">Theta</option>
                <option id="vega">Vega</option>
                <option id="hedge/trade">Hedge/Trade</option>
                <option id="broker">Broker</option>
                <option id="farmnum">Farmer Number</option>
            </select><br><br>
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
                            <th>Type</th>
                            <th>Volume</th>
                            <th>Strike</th>
                            <th>Expiry Date</th>
                            <th>Original Market</th>
                            <th>Current Underlying</th>
                            <th>Current Volatility</th>
                            <th>Delta</th>
                            <th>Vega</th>
                            <th>Gamma</th>
                            <th>Theta</th>
                            <th>Broker</th>
                            <th>Farmer Number</th>
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
                        </tr>
                    </tbody>
            </table>

        </div>
    </body>
    <script>
        function selectColumns()
        {
            
        }
    </script>
</html>