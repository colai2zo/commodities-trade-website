<%-- 
    Document   : previewChanges
    Created on : Aug 7, 2016, 6:23:54 PM
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
        <title>Commodities Trading | Preview Changes</title>
        <link href="style.css" media="screen" rel="stylesheet" type="text/css" />
        <script src="verifyAdmin.js"></script>
    </head>
    <body onload="verifyAdmin(); getText();">
        <h1>Preview Price Changes</h1>
        <br>
        </div>
        
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
            
            <table border="0">
                <tbody>
                    <tr>
                        <td>
                            <form name="returnToUpdate" action="updatePricing.jsp" method="POST">
                                <input id="button" type="submit" value="Return to Edit" name="return" />
                            </form>
                        </td>
                        <td>
                            <form name="SubmitForm" action="AdminHomePage.jsp" method="POST">
                                <input id="button" type="submit" value="Save Changes" name="Submit Button"/>
                            </form>
                        </td>
                        <td>
                            <form name="saveAndReturnForm" action="updatePricing.jsp" method="POST">
                                <input id="button" type="submit" value="Save and Return to Edit" name="saveAndContinueButton" />
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>

    <script>
            function getText()
            {
                var myTable1 = document.getElementById("theTable1");
                var myTable2 = document.getElementById("theTable2");
                var myTable3 = document.getElementById("theTable3");
                var selectedValue = localStorage["product"];
                
                for(c=0;c<5;c++)
                {
                    for(r=2;r<5;r++)
                    {
                        if(selectedValue !== "default"){
                        myTable1.rows[r].cells[c].innerHTML = selectedValue;
                        myTable2.rows[r].cells[c].innerHTML = selectedValue;
                        myTable3.rows[r].cells[c].innerHTML = selectedValue;
                    }
                    }
                }
            }
    </script>
</html>