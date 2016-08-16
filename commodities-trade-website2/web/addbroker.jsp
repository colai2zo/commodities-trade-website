<%-- 
    Document   : addbroker
    Created on : Aug 10, 2016, 3:06:56 PM
    Author     : Dino
--%>
<%@page import="java.sql.*"%>
<%@page import="com.dutchessdevelopers.commoditeswebsite.Brokers" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading|Add Broker</title>
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
         <script src="verifyAdmin.js"></script>
    </head>
    <body onload="">
	<div id="header">
	    <h1>Broker Setup</h1>
            <h2>Enter the following information to setup a broker:</h2>
	</div>
	<div id="central" align="center">
        <select name="partnerChooser" align="left">
            <option>Channel Partner 1</option>
        </select>
            <% Brokers brokers = new Brokers();
           ResultSet brokerData = brokers.getBroker(); 
           System.out.println(brokerData);%>
	    <form name="brokerInfoForm" action="brokeroptions.jsp" method="post">
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
                <input id="button" type="submit" value="Create Broker" name="submitBrokerInfoButton" onclick="formSubmision()"/>
            </form>
	</div>
                <%
                        if (request.getParameter("submitBrokerInfoButton") != null)
                            brokers.insertBroker(request.getParameter("firstInput"), request.getParameter("lastInput"));
                            System.out.println("INSERT BROKER TEST");
                    %>    
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
