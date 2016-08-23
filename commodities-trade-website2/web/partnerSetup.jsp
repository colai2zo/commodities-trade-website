<%-- 
    Document   : partnerSetup
    Created on : Aug 7, 2016, 2:06:58 PM
    Author     : Joey
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
        <title>Commodities Trading|Setup Partner</title>
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
         <script src="verifyPartner.js"></script>
    </head>
    <body onload="verifyAdmin()">
        <div id="header">
            <h1>Channel Partner Setup</h1>
            <h2>Enter the following information to setup a channel partner:</h2>
        </div>
        <div id="central" align="center">
            <%ChannelPartner partners = new ChannelPartner();
            %>
            <form name="partnerInfoForm" action="partnerSetup.jsp" method="post">
                <table border="0" cellpadding="15">
                    <tbody>
                        <tr>
                            <td>Name: </td>
                            <td>
                                <input id="name" type="text" name="nameInput" value="" size="50" style="padding:10px 0px 10px 0px"/>
                            </td>
                        </tr>
                        <tr>
                            <td>ID Code: </td>
                            <td>
                                <input id="IDCode" type="text" name="IDInput" value="" size="50" style="padding:10px 0px 10px 0px"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Username: </td>
                            <td><input id="user" type="text" name="userNameInput" value="" size="50" style="padding:10px 0px 10px 0px"/></td>
                        </tr>
                        <tr>
                            <td>Password: </td>
                            <td><input id="pass" type="text" name="passwordInput" value="<%=partners.createPassword()%>" size="50" style="padding:10px 0px 10px 0px" /></td>
                        </tr>
                    </tbody>
                </table>
                <input id="button" type="submit" value="Create Channel Partner" name="submitChannelInfoButton" onclick="formSubmission()"/>
                 
            </form>
            <form name="returnForm" action="AdminHomePage.jsp" method="post">
                <input id="button" type="submit" value="Back to Admin Home Page" name="returnButton" />
            </form>
            <%            
            if(request.getParameter("submitChannelInfoButton") != null){
                Timestamp currentTimestamp = new Timestamp(Calendar.getInstance().getTime().getTime());
                partners.insertChannelPartners(request.getParameter("IDInput"), request.getParameter("nameInput"), request.getParameter("userNameInput"), request.getParameter("passwordInput"), 0,0,0,0, currentTimestamp);
                System.out.println("INSERTION");
            }
        %>
        </div>
        
    </body>
    <script>        
        function formSubmission(){
            if(document.getElementById("name").value === "" || document.getElementById("user").value === "" || document.getElementById("pass").value === "")
            {
                window.alert("Please fill in all text fields to create partner.");
                document.getElementById("button").type = "";
                document.location.href = "partnerSetup.jsp";
            }
            else{
                window.alert("The channel partner has been added to the database.");
                document.getElementById("button").type = "submit";
                document.location.href = "partnerpage.jsp";
            }
        }
    </script>
</html>

