<%-- 
    Document   : index
    Created on : Aug 7, 2016, 9:13:17 AM
    Author     : Lucas
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.dutchessdevelopers.commoditieswebsite.*" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Commodities Trading | Login</title>
        <link href="style.css" media="screen" rel="stylesheet" type="text/css" />
 
    </head>
    <body>
            <script type="text/javascript">
                var adminKey = 1;
                var userKey = 1;
                var accessPrivilege = 0;
                var sessionTimeout = 1; //hours
                
                function changeAction()
                {
                    //window.alert("Method Running.");
                    var adminUser = "admin";
                    var adminPass = "admin";
                    var CPUser = "partner";
                    var CPPass = "partner";
                    var username = document.getElementByName("hiddenUsername").value;
                    var password = document.getElementByName("hiddenPassword").value;
                    var verify = "login.jsp";
                    if(adminUser === username && adminPass === password)
                    {
                        window.alert("The username and password combination is correct.");
                        verify = "AdminHomePage.jsp";
                        document.cookie = "AdminSession=Valid; "+loginDuration.toGMTString()+"; path=/";
                    }
                    else if (CPUser === username && CPPass === password)
                    {
                        window.alert("The username and password combination is correct.");
                        verify = "channelpartnerhome.jsp";
                        
                    }
                    else{
                        window.alert("The username and password combination is incorrect.");
                    }
                    document.getElementById("submit").action = verify;
                }
            </script>    
                
        
        <form id="submit" name="submit" action="login.jsp" method="POST">
            <div align="center"> 
                <h1 style="padding: 0% 0% 15% 0%">Commodities Trading Login</h1>
            </div>

            <div align="center">
                <table border="0">
                    <tbody>
                        <tr style="padding-bottom: 20px">
                            <td>Username :</td>
                            <td><input id="username" type="text" name="username" value="" size="50" /></td>
                        </tr>
                        <tr>
                            <td>Password :</td>
                            <td><input id="password" type="password" name="password" value="" size="50" /></td>
                        </tr>
                    </tbody>
                </table>
               
             <input id="hidden" type="hidden" name="hidden" value="hidden" />
             <input  type="reset" value="Clear" name="clear" />
             <input  type="submit" value="Submit" name="submit" />
            </div>
        </form>
        <%
            String loginClicked = request.getParameter("submit");
            if(loginClicked!=null){
                String userVerify = "";
                String passwordVerify = "";
                ChannelPartner channelPartner = new ChannelPartner();
                ResultSet cpData = channelPartner.getChannelPartners();
                Employee employee = new Employee();
                ResultSet emData = employee.getEmployee();
                while(cpData.next()){
                    //Evaluate if the username and password entered are a match.
                    if(cpData.getString("username").equals(request.getParameter("username")) &&
                        cpData.getString("password").equals(request.getParameter("password"))){
                            %>
                            <script>
                                var loginDuration = new Date();
                                loginDuration.setTime(loginDuration.getTime()+(60*60*1000));
                                document.cookie = "ChannelPartnerSession=Valid; "+loginDuration.toGMTString()+"; path=/";
                            </script>
                        <%  session.setAttribute("username", request.getParameter("username"));
                            response.sendRedirect("channelpartnerhome.jsp");
                    }}
                while(emData.next()){
                    if(emData.getString("username").equals(request.getParameter("username")) &&
                             emData.getString("password").equals(request.getParameter("password"))){
                            %>
                            <script>
                                var loginDuration = new Date();
                                loginDuration.setTime(loginDuration.getTime()+(60*60*1000));
                                document.cookie = "AdminSession=Valid; "+loginDuration.toGMTString()+"; path=/";
                            </script>
                        <%  session.setAttribute("username", request.getParameter("username"));
                            response.sendRedirect("AdminHomePage.jsp");
                    }
                } %>
                <script>
                    window.alert("The username and password combination entered is incorrect.");
                </script>
        <%
            }    
        %>
       
    </body>
</html>