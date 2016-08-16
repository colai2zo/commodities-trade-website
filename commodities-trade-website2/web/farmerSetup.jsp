<%-- 
    Document   : partnerSetup
    Created on : Aug 7, 2016, 2:06:58 PM
    Author     : Joey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading|Setup Farmer</title>
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
         <script src="verifyPartner.js"></script>
    </head>
    <body onload="verifyPartner()">
        <div id="header">
            <h1>Farmer Setup</h1>
            <h2>Enter the following information to setup a farmer:</h2>
        <div id="central" align="center">
            <form name="partnerInfoForm" method="post" action="farmerInfoPartner.jsp">
                <table border="0" cellpadding="15">
                    <tbody>
                        <tr>
                            <td>First Name: </td>
                            <td>
                                <input id="first" type="text" name="firstNameInput" value="" size="50" style="padding:10px 0px 10px 0px"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Last Name </td>
                            <td><input id="last" type="text" name="lastNameInput" value="" size="50" style="padding:10px 0px 10px 0px"/></td>
                        </tr>
                    </tbody>
                </table>
                <input id="button" type="submit" value="Submit Farmer for Approval" name="submitFarmerInfoButton" onclick="formSubmission()" />
            </form>
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

