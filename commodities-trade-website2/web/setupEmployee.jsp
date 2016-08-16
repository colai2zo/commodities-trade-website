<%-- 
    Document   : setupEmployee
    Created on : Aug 7, 2016, 12:18:14 PM
    Author     : Joey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading|Setup Employee</title>
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
         <script src="verifyAdmin.js"></script>
    </head>
    <body onload="verifyAdmin()">
        <div id="header">
            <h1>Employee Setup</h1>
            <h2>Enter the following information to setup an employee:</h2>
        </div>
        <div id="central" align="center">
            <form name="employeeInfoForm" action="AdminHomePage.jsp" method="post">
                <table border="0" cellpadding="5">
                    <tbody>
                        <tr>
                            <td>Name: </td>
                            <td>
                                <input type="text" name="nameInput" value="" size="50" style="padding:10px 0px 10px 0px"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Username: </td>
                            <td><input type="text" name="userNameInput" value="" size="50" style="padding:10px 0px 10px 0px"/></td>
                        </tr>
                        <tr>
                            <td>Password: </td>
                            <td><input type="text" name="passwordInput" value="" size="50" style="padding:10px 0px 10px 0px" /></td>
                        </tr>
                        <tr>
                            <td colspan="2"><b>Rights:</b> </td>
                        </tr>
                        <tr>
                            <td>All</td>
                            <td><input type="checkbox" name="adminCheckBox" value="ON" onchange="checkAll(this)" />
                        </tr>
                        <tr>
                            <td>Book Management</td>
                            <td><input type="checkbox" name="adminCheckBox" value="ON" />
                        </tr>
                        <tr>
                            <td>Reporting</td>
                            <td><input type="checkbox" name="adminCheckBox" value="ON" />
                        </tr>
                        <tr>
                            <td>Pricing</td>
                            <td><input type="checkbox" name="adminCheckBox" value="ON" />
                        </tr>
                    </tbody>
                </table>
                <input id="button" type="submit" value="Create Employee" name="submitEmployeeInfoButton" onclick="formSubmission()" />
            </form>
        </div>
    </body>
    <script>        
        function checkAll(ele) {
            var checkboxes = document.getElementsByName('adminCheckBox');
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].type === 'checkbox') {
                    checkboxes[i].checked = ele.checked;
                }
            }
        }
        function formSubmission(){
            if(document.getElementByName("nameInput").value === "" || document.getElementByName("userNameInput").value === "" || document.getElementByName("passwordInput").value === "")
            {
                window.alert("Please fill in all text fields to create employee.");
                document.getElementById("button").type = "";
                document.location.href = "partnerSetup.jsp";
            }
            else{
                window.alert("The employee has been added to the database.");
                document.getElementById("button").type = "submit";
                document.location.href = "partnerpage.jsp";
            }
        }   
    </script>
</html>
