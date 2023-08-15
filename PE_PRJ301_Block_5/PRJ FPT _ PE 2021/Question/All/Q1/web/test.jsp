<%-- 
    Document   : display
    Created on : Aug 16, 2019, 10:05:19 AM
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
            .question{
                border: 1px solid #4CAF50;
                margin-top: 2px;
                width: 500px;
            }
            
            .answer{
                 padding-left: 70px;
            }
            .questioninfo
            {
                font-size: large;
            }
        </style>
    </head>
    <body>
        <c:forEach items="${sessionScope.data}" var="q" varStatus="loop" >
            <div class="question"> 
                <div class="questioninfo" >  Question ${loop.index+1} 
                    (${q.point} point${(q.point>1)?"s":""} )> ${q.content} </div>
                <div class="answer">
                    <c:forEach items="${q.answers}" var="a">
                        ${a.content} <input type="checkbox" ${a.isCorrect?"checked=\"checked\"":""} /> <br/>
                    </c:forEach>
                </div>
            </div>  
        </c:forEach>
    </body>
</html>
