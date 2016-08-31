<%-- 
    Document   : channelpartnerspecs.jsp
    Created on : Aug 7, 2016, 11:59:11 AM
    Author     : Dino Martinez
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.*" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
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
        <%
            Farmers farmers = new Farmers();
            ResultSet farmData = farmers.getFarmers();
            CurrentSpecs currentSpecs = new CurrentSpecs();
            ResultSet specData = currentSpecs.getSpecs();
            Orders orders = new Orders();
            ResultSet orderData = orders.getOrders();
            String username = "";
            String pID = "";
            try{
                username = session.getAttribute("username").toString();
                pID = new ChannelPartner().getPartnerIDByUsername(username);
            }catch(java.lang.NullPointerException e){
                response.sendRedirect("login.jsp");
            }
            
        %>
        <form name="SubmitForm" action="channelpartnerspecs.jsp" method="POST" style="padding-top: 20px;">
        <div id="header" align="center" style="padding-bottom: 20px">
        <h1>Trading Partner Offers</h1>
        <h3>Today's Pricing</h3>
        <select name="ChooseFarmer" align="left">
            <option>Select A Farmer</option>
            <%
                while(farmData.next()){
                    if(farmData.getString("partner_id").equals(pID) && farmData.getString("status").equals("approve")){
            %>
                        <option><%= farmData.getString("first_name") + " " + farmData.getString("last_name") + " (" + farmData.getString("farmer_id") + ")"%></option>
            <%        
                    }
                }
            %>
            
        </select>
        <select id="productChooser" name="ChooseCommodity" align="right" onchange="setText()">
            <option value="default">Select a Commodity</option>
            <option value="Corn">Corn</option>
            <option value="Wheat">Wheat</option>
            <option value="Soy Bean Meal">Soy Bean Meal</option>
        </select>
        </div>
        
        <div id="central" align="center" >
            <table id="theTable1" border="1" cellpadding="15%" style="width:90%" >
            <thead>
                <tr>
                    <th colspan="7">Current Market</th>
                </tr>
                <tr>
                    <th>Month</th>
                    <th>Futures</th>
                    <th>Market</th>
                    <th>Indicative Strike</th>
                    <th>Expiration</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    specData.beforeFirst();
                    while(specData.next()){
                        if(specData.getInt("market") == 0){
                            count++;
                %>
                            <tr>
                                <td><%= specData.getString("month")%><input type="hidden" name="<%= "month" + count%>" value="<%= specData.getString("month")%>" /></td>
                                <td><%= specData.getString("futures")%><input type="hidden" name="<%= "futures" + count%>" value="<%= specData.getString("futures")%>" /></td>
                                <td><%= specData.getString("expiration")%><input type="hidden" name="<%= "expiration" + count%>" value="<%= specData.getString("expiration")%>" /></td>
                                <td><%= specData.getString("final_price")%><input type="hidden" name="<%= "price" + count%>" value="<%= specData.getString("final_price")%>" /></td>
                                <td>
                                    <input style="width:100px; padding-top: 10px; padding-bottom: 10px;" type="text" name="<%= "quantity" + count%>" value="0"/>
                                </td>
                            </tr>
                <%        
                        }
                    }
                %>
            </tbody>
        </table>
            <br><br>
            <table id="theTable2" border="1" cellpadding="15%" style="width:90%">
            <thead>
                <tr>
                    <th colspan="7">Strike Shift: + 2</th>
                </tr>
                <tr>
                    <th>Month</th>
                    <th>Futures</th>
                    <th>Market</th>
                    <th>Indicative Strike</th>
                    <th>Expiration</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <%
                    count = 0;
                    specData.beforeFirst();
                    while(specData.next()){
                        if(specData.getInt("market") > 0){
                            count++;
                %>
                            <tr>
                                <td><%= specData.getString("month")%><input type="hidden" name="<%= "monthPlus" + count%>" value="<%= specData.getString("month")%>" /></td>
                                <td><%= specData.getString("futures")%><input type="hidden" name="<%= "futuresPlus" + count%>" value="<%= specData.getString("futures")%>" /></td>
                                <td><%= specData.getString("expiration")%><input type="hidden" name="<%= "expirationPlus" + count%>" value="<%= specData.getString("expiration")%>" /></td>
                                <td><%= specData.getString("final_price")%><input type="hidden" name="<%= "pricePlus" + count%>" value="<%= specData.getString("final_price")%>" /></td>
                                <td>
                                    <input style="width:100px; padding-top: 10px; padding-bottom: 10px;" type="text" name="<%= "quantityPlus" + count%>" value="0"/>
                                </td>
                            </tr>
                <%        
                        }
                    }
                %>
            </tbody>
        </table>
            <br><br>
            <table id="theTable3" border="1" cellpadding="15%" style="width:90%">
            <thead>
                <tr>
                    <th colspan="7">Strike Shift: - 2</th>
                </tr>
                <tr>
                    <th>Month</th>
                    <th>Futures</th>
                    <th>Market</th>
                    <th>Indicative Strike</th>
                    <th>Expiration</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <%
                    count = 0;
                    specData.beforeFirst();
                    while(specData.next()){
                        if(specData.getInt("market") < 0){
                            count++;
                %>
                            <tr>
                                <td><%= specData.getString("month")%><input type="hidden" name="<%= "monthMinus" + count%>" value="<%= specData.getString("month")%>" /></td>
                                <td><%= specData.getString("futures")%><input type="hidden" name="<%= "futuresMinus" + count%>" value="<%= specData.getString("futures")%>" /></td>
                                <td><%= specData.getString("expiration")%><input type="hidden" name="<%= "expirationMinus" + count%>" value="<%= specData.getString("expiration")%>" /></td>
                                <td><%= specData.getString("final_price")%><input type="hidden" name="<%= "priceMinus" + count%>" value="<%= specData.getString("final_price")%>" /></td>
                                <td>
                                    <input style="width:100px; padding-top: 10px; padding-bottom: 10px;" type="text" name="<%= "quantityMinus" + count%>" value="0"/>
                                </td>
                            </tr>
                <%        
                        }
                    }
                %>
            </tbody>
            </table><br><br>
        
            <input id="button" type="submit" value="Submit Offer" name="SubmitButton"/>
            </div>
        </form>
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
        
        <%  int countM = 0, countP = 0, countN = 0; //count for at market, plus, and minus
            int orderNum = orders.generateOrderID();
            
            if(request.getParameter("SubmitButton") != null){
                specData.beforeFirst();
                while(specData.next()){ //go through all possible orders for todays specs
                    if(specData.getString("description").equals(request.getParameter("ChooseProduct"))){ //only go through the ones for the current product.
                        if(specData.getInt("market")==0){ //go through all for current market
                            countM++; // increments counter. we use this counter to identify the names of the elements in the current market.
                            if(!request.getParameter("quantity"+countM).equals("0")){ //checks to see if text input was changed
                                orders.insertOrders(request.getParameter("ChooseFarmer"),
                                                    orderNum, 
                                                    request.getParameter("ChooseCommodity"), 
                                                    request.getParameter("futures" + countM), 
                                                    request.getParameter("quantity"+countM), 
                                                    0, 
                                                    0, 
                                                    new Timestamp(Calendar.getInstance().getTime().getTime()), 
                                                    "pending");
                                orderNum++;
                            }
                        }
                        
                        else if(specData.getInt("market") > 0){ //go through all for current market
                            countP++; // increments counter. we use this counter to identify the names of the elements in the current market.
                            if(!request.getParameter("quantityPlus"+countM).equals("0")){ //checks to see if text input was changed
                                orders.insertOrders(request.getParameter("ChooseFarmer"),
                                                    orderNum, 
                                                    request.getParameter("ChooseCommodity"), 
                                                    request.getParameter("futuresPlus" + countP), 
                                                    request.getParameter("quantityPlus"+countP), 
                                                    0, 
                                                    0, 
                                                    new Timestamp(Calendar.getInstance().getTime().getTime()), 
                                                    "pending");
                                orderNum++;
                            }
                        }
                        
                        else if(specData.getInt("market") < 0){ //go through all for current market
                            countN++; // increments counter. we use this counter to identify the names of the elements in the current market.
                            if(!request.getParameter("quantityMinus"+countN).equals("0")){ //checks to see if text input was changed
                                orders.insertOrders(request.getParameter("ChooseFarmer"),
                                                    orderNum, 
                                                    request.getParameter("ChooseCommodity"), 
                                                    request.getParameter("futuresMinus" + countN), 
                                                    request.getParameter("quantityMinus"+countN), 
                                                    0, 
                                                    0, 
                                                    new Timestamp(Calendar.getInstance().getTime().getTime()), 
                                                    "pending");
                                orderNum++;
                            }
                        }
                    }  
                }
            }
        %>
    </body>
</html>
