<%-- 
    Document   : updatePricing
    Created on : Aug 7, 2016, 2:37:58 PM
    Author     : Joey
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
        <title>Commodities Trading | Update Pricing</title>
        <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <script src="verifyAdmin.js"></script>
    </head>
    <body onload="updatePricing()">
        <div id="header" align="center" style="padding-bottom: 20px">
        <h1>Update Pricing</h1>
        <form name="SubmitForm" action="previewChanges.jsp" method="POST">
        <select id="productChooser" name="Choose Commodity" align="right" onchange="getText()">
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
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><input type="text" name="volatilityInput" value="Data Source" /></td>
                        <td><input type="text" name="vSpreadInput" value="Input" /></td>
                        <td></td>
                        <td><input type="text" name="markUpInput" value="Input" /></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>       
                        <td></td>
                        <td><input type="text" name="volatilityInput" value="Data Source" /></td>
                        <td><input type="text" name="vSpreadInput" value="Input" /></td>
                        <td></td>
                        <td><input type="text" name="markUpInput" value="Input" /></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><input type="text" name="volatilityInput" value="Data Source" /></td>
                        <td><input type="text" name="vSpreadInput" value="Input" /></td>
                        <td></td>
                        <td><input type="text" name="markUpInput" value="Input" /></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><input type="text" name="volatilityInput" value="Data Source" /></td>
                        <td><input type="text" name="vSpreadInput" value="Input" /></td>
                        <td></td>
                        <td><input type="text" name="markUpInput" value="Input" /></td>
                        <td></td>
                    </tr>
                </tbody>
            </table> <br><br>

            <table id="theTable2" border="1" cellpadding="15" style="width:90%">
                <thead>
                    <tr>
                        <th colspan="9">+2</th>
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
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><input type="text" name="volatilityInput" value="Data Source" /></td>
                        <td><input type="text" name="vSpreadInput" value="Input" /></td>
                        <td></td>
                        <td><input type="text" name="markUpInput" value="Input" /></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td> 
                        <td></td>
                        <td><input type="text" name="volatilityInput" value="Data Source" /></td>
                        <td><input type="text" name="vSpreadInput" value="Input" /></td>
                        <td></td>
                        <td><input type="text" name="markUpInput" value="Input" /></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><input type="text" name="volatilityInput" value="Data Source" /></td>
                        <td><input type="text" name="vSpreadInput" value="Input" /></td>
                        <td></td>
                        <td><input type="text" name="markUpInput" value="Input" /></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><input type="text" name="volatilityInput" value="Data Source" /></td>
                        <td><input type="text" name="vSpreadInput" value="Input" /></td>
                        <td></td>
                        <td><input type="text" name="markUpInput" value="Input" /></td>
                        <td></td>
                    </tr>
                </tbody>
            </table> <br><br>

            <table id="theTable3" border="1" cellpadding="15" style="width:90%">
                <thead>
                    <tr>
                        <th colspan="9">-2</th>
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
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><input type="text" name="volatilityInput" value="Data Source" /></td>
                        <td><input type="text" name="vSpreadInput" value="Input" /></td>
                        <td></td>
                        <td><input type="text" name="markUpInput" value="Input" /></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>    
                        <td></td>
                        <td><input type="text" name="volatilityInput" value="Data Source" /></td>
                        <td><input type="text" name="vSpreadInput" value="Input" /></td>
                        <td></td>
                        <td><input type="text" name="markUpInput" value="Input" /></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><input type="text" name="volatilityInput" value="Data Source" /></td>
                        <td><input type="text" name="vSpreadInput" value="Input" /></td>
                        <td></td>
                        <td><input type="text" name="markUpInput" value="Input" /></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><input type="text" name="volatilityInput" value="Data Source" /></td>
                        <td><input type="text" name="vSpreadInput" value="Input" /></td>
                        <td></td>
                        <td><input type="text" name="markUpInput" value="Input" /></td>
                        <td></td>
                    </tr>
                </tbody>
            </table> <br><br>
        </div>
        <div align="center" >
                <input id="button" type="submit" value="Preview Changes" name="Submit Button" />
        </div>    
        </form> 
    </body>
    
    <script>
            var month;
            var today = new Date();
            var currentMon = today.getMonth();
            
            function getText()
            {
                var myTable1 = document.getElementById("theTable1");
                var myTable2 = document.getElementById("theTable2");
                var myTable3 = document.getElementById("theTable3");
                var selectedValue = productChooser.options[productChooser.selectedIndex].value;
                var numOfDays;
                
                for(r=2;r<7;r++)
                {
                    for(c=0;c<8;c++)
                    {
                        if (selectedValue === "select"){
                            myTable1.rows[r].cells[c].innerHTML = "";
                            myTable2.rows[r].cells[c].innerHTML = "";
                            myTable3.rows[r].cells[c].innerHTML = "";
                        }else if(c===0){
                             switch (currentMon + r) {
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
                        myTable1.rows[r].cells[c].innerHTML = month;
                        myTable2.rows[r].cells[c].innerHTML = month;
                        myTable3.rows[r].cells[c].innerHTML = month;
                        }else if(c===1){
                             if ((currentMon + r) < 10  && (currentMon + r) > 2){
                            myTable1.rows[r].cells[c].innerHTML = "November";
                            myTable2.rows[r].cells[c].innerHTML = "November";
                            myTable3.rows[r].cells[c].innerHTML = "November";
                            } else {
                            myTable1.rows[r].cells[c].innerHTML = "January";
                            myTable2.rows[r].cells[c].innerHTML = "January";
                            myTable3.rows[r].cells[c].innerHTML = "January";
                            }
                        }else if(c===2){
                            numOfDays = numberOfDays(currentMon + r,today.getFullYear());
                            for(i=numOfDays;i>0;i--)
                            {
                                    var lastBusDay = lastBusinessDayOfMonth(today.getFullYear(), currentMon + r);
                                    myTable1.rows[r].cells[c].innerHTML = lastBusDay.getDate() + "/" + lastBusDay.getMonth() + "/" + lastBusDay.getFullYear();
                                    myTable2.rows[r].cells[c].innerHTML = lastBusDay.getDate() + "/" + lastBusDay.getMonth() + "/" + lastBusDay.getFullYear();
                                    myTable3.rows[r].cells[c].innerHTML = lastBusDay.getDate() + "/" + lastBusDay.getMonth() + "/" + lastBusDay.getFullYear(); 
                            }
                        }else if(c===3){
                            myTable1.rows[r].cells[c].innerHTML = "Data Source";
                            myTable2.rows[r].cells[c].innerHTML = "Data Source";
                            myTable3.rows[r].cells[c].innerHTML = "Data Source"; 
                        }else if(c===4 || c===5 || c===7){
                            //These are inputs, this statement is to skip editing them
                        }else if(c/5 !== 1 && c/7 !== 1){
                            myTable1.rows[r].cells[c].innerHTML = "Value for " + selectedValue;
                            myTable2.rows[r].cells[c].innerHTML = "Value for " + selectedValue;
                            myTable3.rows[r].cells[c].innerHTML = "Value for " + selectedValue; 
                        }else if(c/5 === 1 || c/7 === 1){
                            myTable1.rows[r].cells[c].innerHTML = "Price for " + selectedValue;
                            myTable2.rows[r].cells[c].innerHTML = "Price for " + selectedValue;
                            myTable3.rows[r].cells[c].innerHTML = "Price for " + selectedValue;
                        }        
                    }
                }
                localStorage["product"] = selectedValue;
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
</html>