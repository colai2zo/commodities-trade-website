<%-- 
    Document   : index
    Created on : Aug 7, 2016, 9:13:17 AM
    Author     : Lucas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                var loginDuration = new Date();
                loginDuration.setTime(loginDuration.getTime()+(sessionTimeout*60*60*1000));
                function changeAction()
                {
                    var adminUser = "admin";
                    var adminPass = "admin";
                    var CPUser = "partner";
                    var CPPass = "partner";
                    var username = document.getElementById("username").value;
                    var password = document.getElementById("password").value;
                    var verify = "login.jsp";
                    if(adminUser === username && adminPass === password)
                    {
                        verify = "AdminHomePage.jsp";
                        document.cookie = "AdminSession=Valid; "+loginDuration.toGMTString()+"; path=/";
                    }
                    else if (CPUser === username && CPPass === password)
                    {
                        verify = "channelpartnerhome.jsp";
                        document.cookie = "ChannelPartnerSession=Valid; "+loginDuration.toGMTString()+"; path=/";
                    }
                    else{
                        window.alert("The username and password combination is incorrect.");
                    }
                    document.getElementById("submit").action = verify;
                }
            </script>    
                
        
        <form id="submit" name="submit" action="" method="POST">
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
             <input  type="submit" value="Submit" name="submit" onClick="changeAction()"/>
            </div>
        </form>
    </body>
</html>