<%-- 
    Document   : pendingFarmersAdmin
    Created on : Aug 11, 2016, 7:36:09 PM
    Author     : Lucas
--%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.ChannelPartner"%>
<%@page import="java.sql.*"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.Farmers" %>
<%@page import="java.util.Calendar"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="style.css" media="screen" rel="stylesheet" type="text/css"/>
        <title>Commodities Trading|View Pending Farmers</title>
        <script src="verifyAdmin.js"></script>
    </head>
    <body onload="verifyAdmin()">
        <div id="header" align="center">
            <h1>View Pending Farmers</h1>
        </div>
        <div id="central" align="center">
             <%
                Farmers farmers = new Farmers();
                ResultSet farmData = farmers.getFarmers();
                %>
            <form name="update" action="pendingFarmersAdmin.jsp" method="POST">
            <table border="1" cellpadding="10" style="width:50%">
            <thead>
                <tr>
                    <th>Channel Partner ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Status</th>
                    <th>Submit</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while(farmData.next()){
                        int farmCount = farmData.getRow();
                        if(farmData.getString("status").equals("pending")){
                            %>
                            <tr>
                                <td name=<%=("partnerID" + farmCount)%>><%=farmData.getString("partner_id")%></td>
                                <td name=<%=("firstName" + farmCount)%>><%=farmData.getString("first_name")%></td>
                                <td name=<%=("lastName" + farmCount)%>><%=farmData.getString("last_name")%></td>
                                <td>
                                    <select name=<%=("selector" + farmCount)%> id="approveChooser">
                                        <option value="pending">Pending</option>
                                        <option value="approve">Approve</option>
                                        <option value="decline">Decline</option>
                                    </select>
                                </td>
                                <td>
                                    <input type="submit" value="Submit" name=<%=("submitButton" + farmCount)%> />
                                </td>
                            </tr>   
                <%      }
                    } %>
                
            </tbody>
        </table>
        </form>
        <%
            int count=0;
            farmData = farmers.getFarmers();
            //String username = session.getAttribute("username").toString();
            //ChannelPartner partner = new ChannelPartner();
            //String pID = partner.getPartnerIDByUsername(username);
            //String id = 
            while (farmData.next()){
                count++;
                if(request.getParameter("submitButton" + count) != null){
                    if((request.getParameter("selector" + count).equals("approve"))){
                       farmers.updateFarmers(
                            farmData.getString("first_name"),
                            farmData.getString("last_name"),
                            new Farmers().generateFarmerID(farmData.getString("partner_id"),"approve"),
                            request.getParameter("selector" + count),
                            new Timestamp(Calendar.getInstance().getTime().getTime()),
                            farmData.getString("partner_id"),
                            farmData.getTimestamp("timestamp")); 
                    }else if((request.getParameter("selector" + count).equals("decline"))){
                        farmers.updateFarmers(
                            farmData.getString("first_name"),
                            farmData.getString("last_name"),
                            new Farmers().generateFarmerID(farmData.getString("partner_id"),"decline"),
                            request.getParameter("selector" + count),
                            new Timestamp(Calendar.getInstance().getTime().getTime()),
                            farmData.getString("partner_id"),
                            farmData.getTimestamp("timestamp")); 
                    }
                    
                    response.setHeader("Refresh", "0; URL=pendingFarmersAdmin.jsp");
                    
                }
            }
        %>            
        </div>
    </body>
</html>
