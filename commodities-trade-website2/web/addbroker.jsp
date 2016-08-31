<%-- 
    Document   : addbroker
    Created on : Aug 10, 2016, 3:06:56 PM
    Author     : Dino
--%>
<%@page import="java.sql.*"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.Brokers" %>
<%@page import="com.dutchessdevelopers.commoditieswebsite.ChannelPartner" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading|Add Broker</title>
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
         <script src="verifyAdmin.js"></script>
    </head>
    <body onload="">
        <%
            ChannelPartner channelPartner = new ChannelPartner();
            ResultSet cpData = channelPartner.getChannelPartners();
        %>
	<div id="header">
	    <h1>Broker Setup</h1>
            <h2>Enter the following information to setup a broker:</h2>
	</div>
	<div id="central" align="center">
        <select id="partnerChooser" name="partnerChooser" align="left">
            <option>Select A Channel Partner</option>
            <% while(cpData.next()){ %>
                <option value="<%= cpData.getString("name") %>"><%= cpData.getString("name") %></option>    
            <% } %>
        </select>
        <%Brokers brokers = new Brokers();%>
	    <form name="brokerInfoForm" action="addbroker.jsp" method="post">
                <table border="0" cellpadding="15">
                    <tbody>
                        <tr>
                            <td>First Name: </td>
                            <td><input type="text" name="firstInput" value="" size="50" style="padding:10px 0px 10px 0px" /></td>
                        </tr>
                        <tr>
                            <td>Last Name: </td>
                            <td><input type="text" name="lastInput" value="" size="50" style="padding:10px 0px 10px 0px" /></td>
                        </tr>
                    </tbody>
                </table>
                <input id="button" type="submit" value="Submit" name="submitButton" onclick="formSubmission()"/>
            </form>
            <form name="returnForm" action="brokeroptions.jsp" method="post">
                <input id="button" type="submit" value="Back to Broker Options" name="returnButton"/>
            </form>
            
            <%
            if(request.getParameter("submitButton") != null){
                //This does not pass in the channel partner like it is supposed to
                brokers.insertBroker(request.getParameter("firstInput"), request.getParameter("lastInput"), request.getParameter("partnerChooser"));
            }
        %>
	</div>
        <div class="fixed">
            <table border="0">
                <tbody>
                    <tr>
                        <td>
                            <form name="homeForm" action="AdminHomePage.jsp" method="POST">
                                <input id="backAndHome" type="submit" value="Return to Home Screen" name="homeButton" />
                            </form>
                        </td>
                        <td>
                            <form name="backForm" action="brokeroptions.jsp" method="POST">
                                <input id="backAndHome" type="submit" value="Go Back" name="backButton" />
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
    <script> 
        function formSubmission(){
            if(document.getElementById("firstInput").value === "" || document.getElementById("lastInput").value === "")
            {
                window.alert("Please fill in all text fields to submit.");
                document.getElementById("button").type = "";
                document.location.href = "addbroker.jsp";
            }
            else{
                window.alert("Your broker has been added to the database.");
                document.getElementById("button").type = "submit";
                document.location.href= "brokeroptions.jsp"
            }
        }
    </script>
</html>
