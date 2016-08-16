<%-- 
    Document   : orderhistory.jsp
    Created on : Aug 7, 2016, 4:15:42 PM
    Author     : Peter.Colaizzo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
        tr:nth-child(even){
            background-color: #f2d9e6;
        }
        </style>
       

    <script type="text/javascript" src="jspdf.min.js"></script>
    <script type="text/javascript" src="html2canvas.js"></script>
    <script type="text/javascript">
    function genPDF() {
        html2canvas(document.body, {
            onrendered: function (canvas) {
                var img = canvas.toDataURL("images/png");
                var doc = new jsPDF('landscape');
                doc.addImage(img, "JPEG", 10, 10);
                doc.save("Order_History.pdf");
            }
        })
    }
    </script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="style.css" media="screen" rel="stylesheet" type="text/css" />
        <title>Commodities Trading | Order History</title>
        <script src="verifyPartner.js"></script>
    </head>
    <body onload="verifyPartner()">
        <div id="header" align="center" style="padding-bottom: 20px">
            <h1>Order History</h1>
            <select id="sortChooser" name="Date Sort Chooser" onchange="trySort()">
                <option value="no">Select a Sort Option</option>
                <option value="td">Today</option>
                <option value="lw">Last Week</option>
                <option value="lm">Last Month</option>
                <option value="ly">Last Year</option>
            </select>
            <input type="button" value="Sort" name="Sort" onclick="trySort()"/>
            <input type="submit" value="Download PDF of Page" name="pdfLoad" onClick="genPDF()" />
            <a href="javascript:genPDF()">Gen PDF</a>
        </div>
        
        <script>
            function trySort()
            {
              var table = document.getElementById("myTable");
              var row = table.insertRow(0);
              var cell = table.insertCell(0);
              cell.innerHTML = "TEST";
            }
        </script>
        
        <div id="central" align="center">
            <table id="myTable" border="1" cellpadding="15%" style="width:90%">
                <thead>
                    <tr>
                        <th>Farmer #</th>
                        <th>Order #</th>
                        <th>Description</th>
                        <th>Futures Contract</th>
                        <th>Quantity</th>
                        <th>Strike</th>
                        <th>Cost per Ton</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Test</td>
                        <td>Test</td>
                        <td>Test</td>
                        <td>Test</td>
                        <td>Test</td>
                        <td>Test</td>
                        <td>Test</td>
                        <td>Test</td>
                    </tr>
                </tbody>
            </table>

        </div>
    </body>
    
</html>