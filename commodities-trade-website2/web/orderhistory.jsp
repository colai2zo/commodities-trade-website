<%-- 
    Document   : orderhistory.jsp
    Created on : Aug 7, 2016, 4:15:42 PM
    Author     : Peter.Colaizzo
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.*" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
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
        <%
            Orders orders = new Orders();
            ResultSet orderData = orders.getOrders();
            String username = "";
            String pID = "";
            try{
                username = session.getAttribute("username").toString();
                pID = new ChannelPartner().getPartnerIDByUsername(username);
            }catch(java.lang.NullPointerException e){
                e.printStackTrace();
                response.sendRedirect("login.jsp");
            }
        %>
        <div id="header" align="center" style="padding-bottom: 20px">
            <h1>Order History</h1>
            <form name="DateRangeChooser" action="orderhistory.jsp" method="POST">
            <select id="sortChooser" name="DateSortChooser">
                <option value="no">Select a Sort Option</option>
                <option value="td">Today</option>
                <option value="lw">Last Week</option>
                <option value="lm">Last Month</option>
                <option value="ly">Last Year</option>
            </select>
            <input type="button" value="Sort" name="Sort" onclick="trySort()"/>
            <input type="submit" value="Download PDF of Page" name="pdfLoad" onClick="genPDF()" />
            <a href="javascript:genPDF()">Gen PDF</a>
            </form>
        </div>
        
        <script>
            function trySort()
            {
                <%
                    String dateRange = request.getParameter("DateSortChooser");
                    Timestamp dateRangeTimeStamp = new Timestamp(0);
                    long currentTime = Calendar.getInstance().getTime().getTime();
                    if(dateRange.equals("td")){
                        dateRangeTimeStamp = new Timestamp(currentTime - 1000*60*60*24);
                    } else if(dateRange.equals("lw")){
                        dateRangeTimeStamp = new Timestamp(currentTime - 1000*60*60*24*7);
                    } else if(dateRange.equals("lm")){
                        dateRangeTimeStamp = new Timestamp(currentTime - 1000*60*60*24*30);
                    } else if(dateRange.equals("ly")){
                        dateRangeTimeStamp = new Timestamp(currentTime - 1000*60*60*24*365);
                    }
                    response.setHeader("Refresh", "0; URL=viewCP.jsp");
                %>
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
                    <%
                        while(orderData.next()){
                            if(orderData.getString("farmer_id").indexOf(pID) >= 0 && !orderData.getString("status").equals("pending") && orderData.getTimestamp("timestamp").after(dateRangeTimeStamp)){
                    %>
                                <tr>
                                    <td><%= orderData.getString("farmer_id")%></td>
                                    <td><%= orderData.getString("order_number")%></td>
                                    <td><%= orderData.getString("description")%></td>
                                    <td><%= orderData.getString("futures_contract")%></td>
                                    <td><%= orderData.getString("quantity")%></td>
                                    <td><%= orderData.getString("strike")%></td>
                                    <td><%= orderData.getString("cost_per_ton")%></td>
                                    <td><%= orderData.getString("status")%></td>
                                    <td>
                                        <input id="button" align="center" type="submit" value="View this contract" name="viewContractButton" />
                                    </td>
                                </tr>
                    <%        }
                        }
                    %>
                    
                </tbody>
            </table>

        </div>
        <div class="fixed">
            <table border="0">
                <tbody>
                    <tr>
                        <td>
                            <form name="homeForm" action="channelpartnerhome.jsp" method="POST">
                                <input id="backAndHome" type="submit" value="Return to Home Screen" name="homeButton" />
                            </form>
                        </td>
                        <td>
                            <form name="backForm" action="channelpartnerhome.jsp" method="POST">
                                <input id="backAndHome" type="submit" value="Go Back" name="backButton" />
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
    
</html>