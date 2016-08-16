<%-- 
    Document   : viewCP
    Created on : Aug 10, 2016, 2:43:14 PM
    Author     : Dino martinez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading|Channel Partner Page</title>
        <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <script src="verifyAdmin.js"></script>
    </head>
    <body onload="verifyAdmin()">
	<div id="header">
	<h1>View And Edit Channel Partner</h1>
	</div>
        <div id="central" align="center">
	<table id="cpTable" border="1" cellpadding="15%" style="width:90%">
	<thead>
	    <th>Channel Partner Number</th>
	    <th>Channel Partner Name</th>
	    <th>Username</th>
	    <th>Delta</th>
	    <th>Vega</th>
	    <th>Gamma</th>
	    <th>Theta</th>
	    <th>View Farmers</th>
	    <th>Delete</th>
	</thead>
	<tbody>
	    <tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
                <td><input type="submit" value="Delete" name="delete" /></td>
	    </tr>
	</tbody>
	</table>
        </div>
    </body>
</html>
