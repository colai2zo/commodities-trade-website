Skip to content
This repository
Search
Pull requests
Issues
Gist
 @colai2zo
 Unwatch 1
  Star 0
  Fork 0 colai2zo/commodities-trade-website
 Code  Issues 0  Pull requests 0  Wiki  Pulse  Graphs  Settings
Branch: master Find file Copy pathcommodities-trade-website/commodities-trade-website2/web/channelpartnerspecs.jsp
4b4f4ee  7 hours ago
 Dino updated channel partner specs page
0 contributors
RawBlameHistory     262 lines (256 sloc)  9.66 KB
<%-- 
    Document   : channelpartnerspecs.jsp
    Created on : Aug 7, 2016, 11:59:11 AM
    Author     : Dino Martinez
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
        <title>Commodities Trading | today's specs</title>
        <script src="verifyPartner.js"></script>
    </head>
    <body>
        <div id="header" align="center" style="padding-bottom: 20px">
        <h1>Trading Partner Offers</h1>
        <h3>Today's specs</h3>
        <select name="Choose Farmer" align="left">
            <option>Farmer 1</option>
        </select>
        <select id="productChooser" name="Choose Commodity" align="right" onchange="setText()">
            <option value="default">Please Select a Commodity</option>
            <option value="Corn">Corn</option>
            <option value="Wheat">Wheat</option>
            <option value="Soy Bean Meal">Soy Bean Meal</option>
        </select>
        </div>
        
        <form name="SubmitForm" action="submitoffer.jsp" method="POST" style="padding-top: 20px;">
        <div id="central" align="center" >
            <table id="theTable1" border="1" cellpadding="15%" style="width:90%" >
            <thead>
                <tr>
                    <th colspan="6">Current Market</th>
                </tr>
                <tr>
                    <th>Month</th>
                    <th>Futures</th>
                    <th>Market</th>
                    <th>Expiration</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <input style="width:100px; padding-top: 10px; padding-bottom: 10px;" type="text" name="Quantity Input" value="0"/>
                    </td>
                </tr>
                <tr>
                   <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <input style="width:100px; padding-top: 10px; padding-bottom: 10px;" type="text" name="Quantity Input" value="0"/>
                    </td>
                </tr>
                <tr>
                   <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <input style="width:100px; padding-top: 10px; padding-bottom: 10px;" type="text" name="Quantity Input" value="0"/>
                    </td>
                </tr>
            </tbody>
        </table>
            <br><br>
            <table id="theTable2" border="1" cellpadding="15%" style="width:90%">
            <thead>
                <tr>
                    <th colspan="6">+ 2</th>
                </tr>
                <tr>
                    <th>Month</th>
                    <th>Futures</th>
                    <th>Market</th>
                    <th>Expiration</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td> 
                        <input style="width:100px; padding-top: 10px; padding-bottom: 10px;" type="text" name="Quantity Input" value="0"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <input style="width:100px; padding-top: 10px; padding-bottom: 10px;" type="text" name="Quantity Input" value="0"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <input style="width:100px; padding-top: 10px; padding-bottom: 10px;" type="text" name="Quantity Input" value="0"/>
                    </td>
                </tr>
            </tbody>
        </table>
            <br><br>
            <table id="theTable3" border="1" cellpadding="15%" style="width:90%">
            <thead>
                <tr>
                    <th colspan="6">- 2</th>
                </tr>
                <tr>
                    <th>Month</th>
                    <th>Futures</th>
                    <th>Market</th>
                    <th>Expiration</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td> 
                        <input style="width:100px; padding-top: 10px; padding-bottom: 10px;" type="text" name="Quantity Input" value="0"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <input style="width:100px; padding-top: 10px; padding-bottom: 10px;" type="text" name="Quantity Input" value="0"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <input style="width:100px; padding-top: 10px; padding-bottom: 10px;" type="text" name="Quantity Input" value="0"/>
                    </td>
                </tr>
            </tbody>
            </table><br><br>
        
            <input id="button" type="submit" value="Submit Offer" name="Submit Button"/>
        </form>
        </div>
    </body>
    
     <script>
            var month;
            var currentMon = new Date().getMonth();
            
            function setText()
            {
                var myTable1 = document.getElementById("theTable1");
                var myTable2 = document.getElementById("theTable2");
                var myTable3 = document.getElementById("theTable3");
                var selectedValue = productChooser.options[productChooser.selectedIndex].value;
                
                for(c=0;c<5;c++)
                {
                    for(r=2;r<5;r++)
                    {
                        if(selectedValue !== "default" && c!== 0 && c!== 1){
                        myTable1.rows[r].cells[c].innerHTML = selectedValue;
                        myTable2.rows[r].cells[c].innerHTML = selectedValue;
                        myTable3.rows[r].cells[c].innerHTML = selectedValue;
                      } else if (c === 0){
                        switch (currentMon + r - 1) {
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
                      } else if (c === 1){
                         if ((currentMon + r - 1) < 10  && (currentMon + r - 1) > 2){
                            myTable1.rows[r].cells[c].innerHTML = "November";
                            myTable2.rows[r].cells[c].innerHTML = "November";
                            myTable3.rows[r].cells[c].innerHTML = "November";
                        } else {
                            myTable1.rows[r].cells[c].innerHTML = "January";
                            myTable2.rows[r].cells[c].innerHTML = "January";
                            myTable3.rows[r].cells[c].innerHTML = "January";
                        }
                      }
                    }
                }
            }
        </script>
</html>
Contact GitHub API Training Shop Blog About
© 2016 GitHub, Inc. Terms Privacy Security Status Help