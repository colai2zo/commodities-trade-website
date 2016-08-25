<%-- 
    Document   : updatePricing
    Created on : Aug 7, 2016, 2:37:58 PM
    Author     : Joey
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        tr:nth-child(even){
            background-color: #f2d9e6;
        }
        #noEdit{
            background-color: transparent; text-align: center; border: 0px
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading | Update Pricing</title>
        <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <script src="verifyAdmin.js"></script>
    </head>
    <body>
        <form name="SubmitForm" action="previewChanges.jsp" method="POST">
        <div id="header" align="center" style="padding-bottom: 20px">
        <h1>Update Pricing</h1>
        
            <select id="productChooser" name="Choose Commodity" onchange="getText()">
                <option value="select">Select Product</option>
                <option value="Corn">Corn</option>
                <option value="Wheat">Wheat</option>
                <option value="Soy Bean Meal">Soy Bean Meal</option>
            </select>
        </div>
        
        
        <div id="central" align="center" >
            <table id="theTable1" border="1" cellpadding="15" style="width:90%">
                <thead>
                    <tr>
                        <th colspan="9">Current Market</th>
                    </tr>
                    <tr>
                        <th>Month</th>
                        <th>Futures</th>
                        <th>Expiration</th>
                        <th>Volatility</th>
                        <th>Volatility</th>
                        <th>Volatility Spread</th>
                        <th>Price</th>
                        <th>Markup</th>
                        <th>Final Price</th>
                <tbody>
                    <%  int i = 0;
                        int currentCount = 1;
                        while(i<8){%>
                    <tr>
                        <td><input id="<%= ("monthCurrent" + currentCount)%>" type="text" name="<%= ("monthCurrent" + currentCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                        <td><input id="<%= ("futuresCurrent" + currentCount)%>" type="text" name="<%= ("futuresCurrent" + currentCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                        <td><input id="<%= ("expirationCurrent" + currentCount)%>" type="text" name="<%= ("expirationCurrent" + currentCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                        <td><input id="<%= ("volatilityCurrent" + currentCount)%>" type="text" name="<%= ("volatilityCurrent" + currentCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                        <td><input id="<%= ("volatilityInputCurrent" + currentCount)%>" type="text" name="<%= ("volatilityInputCurrent" + currentCount)%>" value="0" /></td>
                        <td><input id="<%= ("vSpreadInputCurrent" + currentCount)%>" type="text" name="<%= ("vSpreadInputCurrent" + currentCount)%>" value="0" /></td>
                        <td><input id="<%= ("priceCurrent" + currentCount)%>" type="text" name="<%= ("priceCurrent" + currentCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                        <td><input id="<%= ("markupInputCurrent" + currentCount)%>" type="text" name="<%= ("markupInputCurrent" + currentCount)%>" value="0" /></td>
                        <td><input id="<%= ("finalPriceCurrent" + currentCount)%>" type="text" name="<%= ("finalPriceCurrent" + currentCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                    </tr>
                    <% 
                        currentCount++;
                        i++;
                        }
                    %>
                </tbody>
            </table> <br><br>

            <table id="theTable2" border="1" cellpadding="15" style="width:90%">
                <thead>
                    <tr>
                        <th colspan="9">+ <input style="width:15px; text-align:center" type="text" name="futureSet" value="2" size="10" /></th>
                    </tr>
                    <tr>
                        <th>Month</th>
                        <th>Futures</th>
                        <th>Expiration</th>
                        <th>Volatility</th>
                        <th>Volatility</th>
                        <th>Volatility Spread</th>
                        <th>Price</th>
                        <th>Markup</th>
                        <th>Final Price</th>
                <tbody>
                    <%  int j = 0;
                        int futureCount = 1;
                        while(j<8){%>
                    <tr>
                        <td><input id="<%= ("monthFutures" + futureCount)%>" type="text" name="<%= ("monthFutures" + futureCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                        <td><input id="<%= ("futuresFutures" + futureCount)%>" type="text" name="<%= ("futuresFutures" + futureCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                        <td><input id="<%= ("expirationFutures" + futureCount)%>" type="text" name="<%= ("expirationFutures" + futureCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                        <td><input id="<%= ("volatilityFutures" + futureCount)%>" type="text" name="<%= ("volatilityFutures" + futureCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                        <td><input id="<%= ("volatilityInputFutures" + futureCount)%>" type="text" name="<%= ("volatilityInputFutures" + futureCount)%>" value="0" /></td>
                        <td><input id="<%= ("vSpreadInputFutures" + futureCount)%>" type="text" name="<%= ("vSpreadInputFutures" + futureCount)%>" value="0" /></td>
                        <td><input id="<%= ("priceFutures" + futureCount)%>" type="text" name="<%= ("priceFutures" + futureCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                        <td><input id="<%= ("markupInputFutures" + futureCount)%>" type="text" name="<%= ("markupInputFutures" + futureCount)%>" value="0" /></td>
                        <td><input id="<%= ("finalPriceFutures" + futureCount)%>" type="text" name="<%= ("finalPriceFutures" + futureCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                    </tr>
                    <% 
                        futureCount++;
                        j++;
                        }
                    %>
                </tbody>
            </table> <br><br>

            <table id="theTable3" border="1" cellpadding="15" style="width:90%">
                <thead>
                    <tr>
                        <th colspan="9">- <input style="width:15px; text-align:center" type="text" name="pastSet" value="2" size="10" /></th>
                    </tr>
                    <tr>
                        <th>Month</th>
                        <th>Futures</th>
                        <th>Expiration</th>
                        <th>Volatility</th>
                        <th>Volatility</th>
                        <th>Volatility Spread</th>
                        <th>Price</th>
                        <th>Markup</th>
                        <th>Final Price</th>
                <tbody>
                    <%  int k = 0;
                        int pastCount = 1;
                        while(k<8){%>
                    <tr>
                        <td><input id="<%= ("monthPast" + pastCount)%>" type="text" name="<%= ("monthPast" + pastCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                        <td><input id="<%= ("futuresPast" + pastCount)%>" type="text" name="<%= ("futuresPast" + pastCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                        <td><input id="<%= ("expirationPast" + pastCount)%>" type="text" name="<%= ("expirationPast" + pastCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                        <td><input id="<%= ("volatilityPast" + pastCount)%>" type="text" name="<%= ("volatilityPast" + pastCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                        <td><input id="<%= ("volatilityInputPast" + pastCount)%>" type="text" name="<%= ("volatilityInputPast" + pastCount)%>" value="0" /></td>
                        <td><input id="<%= ("vSpreadInputPast" + pastCount)%>" type="text" name="<%= ("vSpreadInputPast" + pastCount)%>" value="0" /></td>
                        <td><input id="<%= ("pricePast" + pastCount)%>" type="text" name="<%= ("pricePast" + pastCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                        <td><input id="<%= ("markupInputPast" + pastCount)%>" type="text" name="<%= ("markupInputPast" + pastCount)%>" value="0" /></td>
                        <td><input id="<%= ("finalPricePast" + pastCount)%>" type="text" name="<%= ("finalPricePast" + pastCount)%>" value="" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                    </tr>
                    <% 
                        pastCount++;
                        k++;
                        }
                    %>
                </tbody>
            </table> <br><br>
        </div>
        <div align="center" >
                <input id="button" type="submit" value="Preview Changes" name="Submit Button" />
                <input id="currentCount" type="hidden" name="currentCount" value="<%= currentCount%>" />
                <input id="futureCount" type="hidden" name="futureCount" value="<%= futureCount%>" />
                <input id="pastCount" type="hidden" name="pastCount" value="<%= pastCount%>" />
        </div>    
        </form> 
                
    <script>
            var month;
            var today = new Date();
            var currentMon = today.getMonth();
            
            function getText()
            {
                var selectedValue = productChooser.options[productChooser.selectedIndex].value;
                var numOfDays;
                var rowCount = 0;
                for(r=2;r<10;r++)
                {
                    rowCount++;
                    for(c=0;c<=8;c++)
                    {
                        if(c===0){
                            var switchChoice = currentMon + r - 1;
                            if(switchChoice > 12)
                                switchChoice -= 12;
                             switch (switchChoice) {
                        case 1:
                            month = "January";
                            break;
                        case 2:
                            month = "February";
                            break;
                        case 3:
                            month = "March";
                            break;
                        case 4:
                            month = "April";
                            break;
                        case 5:
                            month = "May";
                            break;
                        case 6:
                            month = "June";
                            break;
                        case 7:
                            month = "July";
                            break;
                        case 8:
                            month = "August";
                            break;
                        case 9:
                            month = "September";
                            break;
                        case 10:
                            month = "October";
                            break;
                        case 11:
                            month = "November";
                            break;
                        case 12:
                            month = "December";
                            break;
                        }
                        document.getElementById("monthCurrent" + rowCount).value = month;
                        document.getElementById("monthFutures" + rowCount).value = month;
                        document.getElementById("monthPast" + rowCount).value = month;
                        
                        }else if(c===1){
                             if ((currentMon + r - 1) < 10  && (currentMon + r - 1) > 2){
                                 document.getElementById("futuresCurrent" + rowCount).value = "November";
                                 document.getElementById("futuresFutures" + rowCount).value = "November";
                                 document.getElementById("futuresPast" + rowCount).value = "November";
                            } else {
                                document.getElementById("futuresCurrent" + rowCount).value = "January";
                                document.getElementById("futuresFutures" + rowCount).value = "January";
                                document.getElementById("futuresPast" + rowCount).value = "January";
                            }
                        }else if(c===2){
                            numOfDays = numberOfDays(currentMon + r,today.getFullYear());
                            for(i=numOfDays;i>0;i--)
                            {
                                    var lastBusDay = lastBusinessDayOfMonth(today.getFullYear(), currentMon + r - 1);
                                    document.getElementById("expirationCurrent" + rowCount).value = lastBusDay.getDate() + "/" + (lastBusDay.getMonth()+1) + "/" + lastBusDay.getFullYear();
                                    document.getElementById("expirationFutures" + rowCount).value = lastBusDay.getDate() + "/" + (lastBusDay.getMonth()+1) + "/" + lastBusDay.getFullYear();
                                    document.getElementById("expirationPast" + rowCount).value = lastBusDay.getDate() + "/" + (lastBusDay.getMonth()+1) + "/" + lastBusDay.getFullYear(); 
                            }
                        }else if(c===3){
                            document.getElementById("volatilityCurrent" + rowCount).value = "0";
                            document.getElementById("volatilityFutures" + rowCount).value = "5";
                            document.getElementById("volatilityPast" + rowCount).value = "10"; 
                        }else if(c===4 || c===5 || c===7){
                            //These are inputs, this statement is to skip editing them
                        }else if(c===6){
                            document.getElementById("priceCurrent" + rowCount).value = 50;
                            document.getElementById("priceFutures" + rowCount).value = 100;
                            document.getElementById("pricePast" + rowCount).value = 25; 
                        }else if(c===8){
                            /**
                             * This part is not working
                             * I can't get the final price to be equal to the price plus the markup
                             */
                            //parseFloat(document.getElementById("finalPriceCurrent" + rowCount).value) = parseFloat(document.getElementById("priceCurrent").value) + parseFloat(document.getElementById("markupInputCurrent").value);
                            //document.getElementById("finalPriceFutures" + rowCount).value = document.getElementById("priceFutures").value + document.getElementById("markupInputFutures").value;
                            //document.getElementById("finalPricePast" + rowCount).value = document.getElementById("pricePast").value + document.getElementById("markupInputPast").value;
                        }        
                    }
                }
            }
            
            
            function lastBusinessDayOfMonth(year, month) {
            var date = new Date();
            var offset = 0;
            var result = null;
            if ('undefined' === typeof year || null === year) {
                year = date.getFullYear();
            }
            if ('undefined' === typeof month || null === month) {
                month = date.getMonth();
            }
            do {
                result = new Date(year, month, offset);
                offset--;
            } while (0 === result.getDay() || 6 === result.getDay());
            return result;
            }
            
            
            function numberOfDays(iMonth, iYear){
            return 32 - new Date(iYear, iMonth, 32).getDate();
            }
    </script>
    </body>
</html>


