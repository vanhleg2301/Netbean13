package controller;

import model.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     response.setContentType("text/html;charset=UTF-8");
     PrintWriter pr = response.getWriter();
     String xName = request.getParameter("name");
     String xPass = request.getParameter("pass");
     User x;
     UserDAO t = new UserDAO();
     x = t.getUser(xName, xPass);
     request.getSession().setAttribute("currUser", x);
     String logResult = "";
     if(x==null) { 
       logResult = "Sorry, username and/or password are/is invalid!";  
      }
      else {
       logResult = "Login is successful!";  
     }
     pr.print(logResult);  
     request.getRequestDispatcher("/index.html").include(request, response);  
  }
}
