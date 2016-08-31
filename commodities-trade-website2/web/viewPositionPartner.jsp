<%-- 
    Document   : partnerPosition
    Created on : Aug 7, 2016, 2:49:07 PM
    Author     : Lucas
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.ChannelPartner" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading | Channel Partner Position</title>
        <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <script src="verifyPartner.js"></script>
    </head>
    <body onload="verifyPartner()">      
        <div id="central" align="center">
            <%
                ChannelPartner channelPartner = new ChannelPartner();
                ResultSet cpData = channelPartner.getChannelPartners();
            %>
            
            <% 
                while(cpData.next()){
                    if(cpData.getString("id_code").equals(new ChannelPartner().getPartnerIDByUsername(session.getAttribute("username").toString()))){
            %>
            <table border="1" style="width: 50%" cellpadding="10px">
                <thead>
                    <tr>
                        <th colspan="6" style="font-size: 25px"><%= cpData.getString("name")%> Position</th>
                    </tr>
                    <tr>
                        <th></th>
                        <th>Current Underlying Price</th>
                        <th>Delta</th>
                        <th>Gamma</th>
                        <th>Vega</th>
                        <th>Theta</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td size="20px"><b>Corn</b></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">November 2016</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">January 2017</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">March 2017</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">June 2017</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">August 2017</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    
                    <tr>
                        <td size="20px"><b>Wheat</b></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">September 2016</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">December 2016</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">March 2017</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">May 2017</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    
                    <tr>
                        <td size="20px"><b>Soybean Meal</b></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">September 2016</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">October 2016</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">December 2016</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">January 2017</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">March 2017</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">May 2017</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">July 2017</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    <tr>
                        <td id="positionMonth" size="20px">August 2017</td>
                        <td></td>
                        <td size="20px"><%= cpData.getString("delta")%></td>
                        <td size="20px"><%= cpData.getString("gamma")%></td>
                        <td size="20px"><%= cpData.getString("vega")%></td>
                        <td size="20px"><%= cpData.getString("theta")%></td>
                    </tr>
                    <% }} %>
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