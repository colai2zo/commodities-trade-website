<%-- 
    Document   : previewChanges
    Created on : Aug 7, 2016, 6:23:54 PM
    Author     : Lucas
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.CurrentSpecs" %>
<%@page import="com.dutchessdevelopers.commoditieswebsite.PastSpecUpdates" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
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
        <div id="header">
        <h1>Preview Price Changes</h1>
        <br>
        </div>
        
        <div id="central" align="center" >
            <table border="1" cellpadding="15%" style="width:90%" >
            <thead>
                <tr>
                    <th colspan="5">Current Market</th>
                </tr>
                <tr>
                    <th>Month</th>
                    <th>Futures</th>
                    <th>Expiration</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
            <% 
                CurrentSpecs cs = new CurrentSpecs();
                int currentCount = 1;
                while(currentCount < Integer.parseInt(request.getParameter("currentCount"))){ 
            %>
                <tr>
                    <td><input type="text" name="" value="<%= request.getParameter("monthCurrent" + currentCount)%>" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                    <td><input type="text" name="" value="<%= request.getParameter("futuresCurrent" + currentCount)%>" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                    <td><input type="text" name="" value="<%= request.getParameter("expirationCurrent" + currentCount)%>" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                    <td><input type="text" name="" value="<%= request.getParameter("finalPriceCurrent" + currentCount)%>" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                    <td>
                        <input style="width:100px; padding-top: 10px; padding-bottom: 10px;" type="text" name="Quantity Input" value="0" readonly/>
                    </td>
                </tr>
                <%
                    currentCount++;
                    }
                %>
            </tbody>
        </table>
            <br><br>
            <table border="1" cellpadding="15%" style="width:90%">
            <thead>
                <tr>
                    <th colspan="5">+ <%= request.getParameter("futureSet")%></th>
                </tr>
                <tr>
                    <th>Month</th>
                    <th>Futures</th>
                    <th>Expiration</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
            <% 
                int futureCount = 1;
                while(futureCount < Integer.parseInt(request.getParameter("futureCount"))){ 
            %>
                <tr>
                    <td><input type="text" name="" value="<%= request.getParameter("monthFutures" + futureCount)%>" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                    <td><input type="text" name="" value="<%= request.getParameter("futuresFutures" + futureCount)%>" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                    <td><input type="text" name="" value="<%= request.getParameter("expirationFutures" + futureCount)%>" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                    <td><input type="text" name="" value="<%= request.getParameter("finalPriceFutures" + futureCount)%>" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                    <td>
                        <input style="width:100px; padding-top: 10px; padding-bottom: 10px;" type="text" name="Quantity Input" value="0" readonly/>
                    </td>
                </tr>
            <%
                futureCount++;
                }
            %>
            </tbody>
        </table>
            <br><br>
            <table border="1" cellpadding="15%" style="width:90%">
            <thead>
                <tr>
                    <th colspan="5">- <%= request.getParameter("pastSet")%></th>
                </tr>
                <tr>
                    <th>Month</th>
                    <th>Futures</th>
                    <th>Expiration</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
            <% 
                int pastCount = 1;
                while(pastCount < Integer.parseInt(request.getParameter("pastCount"))){ 
            %>
                <tr>
                    <td><input type="text" name="" value="<%= request.getParameter("monthPast" + pastCount)%>" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                    <td><input type="text" name="" value="<%= request.getParameter("futuresPast" + pastCount)%>" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                    <td><input type="text" name="" value="<%= request.getParameter("expirationPast" + pastCount)%>" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                    <td><input type="text" name="" value="<%= request.getParameter("finalPricePast" + pastCount)%>" readonly style="background-color: transparent; text-align: center; border: 0px"/></td>
                    <td>
                        <input style="width:100px; padding-top: 10px; padding-bottom: 10px;" type="text" name="Quantity Input" value="0" readonly/>
                    </td>
                </tr>
            <%
                pastCount++;
                }
            %>
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
                            <form name="SubmitForm" action="previewChanges.jsp" method="POST">
                                <input id="button" type="submit" value="Save Changes" name="Submit Button"/>
                            </form>
                        </td>
                        <td>
                            <form name="saveAndReturnForm" action="PreviewChanges.jsp" method="POST">
                                <input id="button" type="submit" value="Save and Return to Edit" name="saveAndContinueButton" />
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
            <%
                if(request.getParameter("SubmitForm") != null || request.getParameter("saveAndReturnForm") != null)
                {
                    Timestamp currentTimestamp = new Timestamp(Calendar.getInstance().getTime().getTime());
                    for(int i = 1; i<=currentCount; i++)
                    {
                        cs.insertSpecs(request.getParameter("monthCurrent" + i),
                                request.getParameter("futuresCurrent" + i), 
                                request.getParameter("exprationCurrent" + i),
                                Double.parseDouble(request.getParameter("volatilityInputCurrent" + i)), 
                                Double.parseDouble(request.getParameter("vSpreadInputCurrent" + i)), 
                                Double.parseDouble(request.getParameter("priceCurrent" + i)),
                                Double.parseDouble(request.getParameter("markupInputCurrent" + i)),
                                Double.parseDouble(request.getParameter("finalPriceCurrent" + i)),
                                request.getParameter("productChooser"),
                                currentTimestamp, 0);
                    }
                    for(int i = 1; i<=futureCount; i++)
                    {
                        cs.insertSpecs(request.getParameter("monthFutures" + i),
                                request.getParameter("futuresFutures" + i), 
                                request.getParameter("exprationFutures" + i),
                                Double.parseDouble(request.getParameter("volatilityInputFutures" + i)), 
                                Double.parseDouble(request.getParameter("vSpreadInputFutures" + i)), 
                                Double.parseDouble(request.getParameter("priceFutures" + i)),
                                Double.parseDouble(request.getParameter("markupInputFutures" + i)),
                                Double.parseDouble(request.getParameter("finalPriceFutures" + i)),
                                request.getParameter("productChooser"),
                                currentTimestamp,
                                Integer.parseInt(request.getParameter("futureSet")));
                    }
                    for(int i = 1; i<=pastCount; i++)
                    {
                        cs.insertSpecs(request.getParameter("monthPast" + i),
                                request.getParameter("futuresPast" + i), 
                                request.getParameter("exprationPast" + i),
                                Double.parseDouble(request.getParameter("volatilityInputPast" + i)), 
                                Double.parseDouble(request.getParameter("vSpreadInputPast" + i)), 
                                Double.parseDouble(request.getParameter("pricePast" + i)),
                                Double.parseDouble(request.getParameter("markupInputPast" + i)),
                                Double.parseDouble(request.getParameter("finalPricePast" + i)),
                                request.getParameter("productChooser"),
                                currentTimestamp, 
                                -Integer.parseInt(request.getParameter("pastSet")));
                    }
                    
                }
            %>
        </div>
        </body>

    
</html>

