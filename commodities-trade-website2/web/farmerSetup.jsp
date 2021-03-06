<%-- 
    Document   : partnerSetup
    Created on : Aug 7, 2016, 2:06:58 PM
    Author     : Joey
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.*" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading|Add Farm</title>
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
         <script src="verifyPartner.js"></script>
    </head>
    <body onload="verifyPartner()">
        <div id="header">
            <h1>Farm Setup</h1>
            <h2>Enter the following information to add a farm to the database:</h2>
        </div>
        <%Farmers farmers = new Farmers();%>
        <div id="central" align="center">
            <form name="partnerInfoForm" method="post" action="farmerSetup.jsp">
                <table border="0" cellpadding="15">
                    <tbody>
                        <tr>
                            <td>Farm Name: </td>
                            <td>
                                <input id="first" type="text" name="farmNameInput" value="" size="50" style="padding:10px 0px 10px 0px"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <input id="button" type="submit" value="Add Farm" name="submitFarmerInfoButton" onclick="formSubmission()" />
            </form>
            <%
            if(request.getParameter("submitFarmerInfoButton") != null){
                Timestamp currentTimestamp = new Timestamp(Calendar.getInstance().getTime().getTime());
                String username = session.getAttribute("username").toString();
                String id = new ChannelPartner().getPartnerIDByUsername(username);
                farmers.insertFarmers(request.getParameter("firstNameInput"), request.getParameter("lastNameInput"), new Farmers().generateFarmerID(id,"pending"), "pending", currentTimestamp, id);
                System.out.println("INSERTION");
            }
            %>
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
                            <form name="backForm" action="farmerInfoPartner.jsp" method="POST">
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
            if(document.getElementById("first").value === "" || document.getElementById("last").value === "")
            {
                window.alert("Please fill in all text fields to submit for approval.");
                document.getElementById("button").type = "";
                document.location.href = "farmerSetup.jsp";
            }
            else{
                window.alert("Your farmer has been submitted for approval by the administrator." +
                        " Check the Pending Farmers page to see status.");
                document.getElementById("button").type = "submit";
                document.location.href = "farmerInfoPartner.jsp";
            }
        }
    </script>
</html>

