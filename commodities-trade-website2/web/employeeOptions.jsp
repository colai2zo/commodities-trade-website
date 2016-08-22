<%-- 
    Document   : employeeOptions
    Created on : Aug 20, 2016, 2:18:49 PM
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading|Employee Options</title>
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
         <script src="verifyAdmin.js"></script>
    </head>
    <body onload="">
	<div id="header">
	    <h1>Employee Options</h1>
	    <h2>Please Select From One of The Following Options</h2>
	</div>
	<div id="central" align="center">
 	    <form name="addEmployeeForm" action="setupEmployee.jsp" method="POST">
                <input id="button" type="submit" value="Add an Employee" name="addEmployeeButton"/>
            </form>

 	    <form name="deleteAndViewEmployeeForm" action="viewEmployee.jsp" method="POST">
                <input id="button" type="submit" value="View or Delete an Employee" name="deletetAndViewButton"/>
            </form>
	</div>
    </body>

</html>
