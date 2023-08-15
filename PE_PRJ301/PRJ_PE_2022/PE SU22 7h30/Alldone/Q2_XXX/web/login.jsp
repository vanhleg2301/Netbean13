<%-- 
    Document   : login
    Created on : Jul 16, 2022, 8:09:13 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form method="post" action="login">
            UserName: <input type="text" name="uname"><br>
            Password: <input type="password" name="pass"><br>
            <input type="submit" value="submit">
        </form>
        ${mess}
    </body>
</html>
