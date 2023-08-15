<%-- 
    Document   : subject
    Created on : Sep 22, 2019, 8:14:44 PM
    Author     : sonnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .subject{
                border: 1px solid #4CAF50;
                margin-top: 2px;
                width: 500px;
            }
            
            .material{
                 padding-left: 70px;
            }
            .subjectinfo
            {
                font-size: large;
            }
        </style>
    </head>
    <body>
    <c:forEach items="${sessionScope.data}" var="s" varStatus="loop" >
            <div class="subject"> 
                <div class="subjectinfo" > 
                    Level:${s.level} - ${s.title} </div>
                <div class="material">
                    <c:forEach items="${s.materials}" var="a">
                        ${a.content} ${a.inCurriculum?" is in Curriculum ":""} <br/>
                    </c:forEach>
                </div>
            </div>  
        </c:forEach>
    </body>
</html>
