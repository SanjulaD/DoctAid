<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.io.*,java.util.*"%>
<%

    if (!session.isNew() && session.getAttribute("UserID") != null) {
        Date lastAccessTime = new Date(session.getLastAccessedTime());
        session.setAttribute("LastAccess", lastAccessTime);
        String type = (String) session.getAttribute("UserType");

        if (type.equals("patient")) {
            response.sendRedirect("patient");
        } else if (type.equals("doctor")) {
            response.sendRedirect("doctor");
        } else if (type.equals("admin")) {
            response.sendRedirect("admin");
        } else if (type.equals("labPerson")) {
            response.sendRedirect("labPerson");
        } else if (type.equals("receptionist")) {
            response.sendRedirect("receptionist");
        }

    } else {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - DoctAid</title>
        <link rel="icon" type="image/png" href="media/favicon.ico"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
              crossorigin="anonymous">
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div class="container" id="container">
            <div class="form-container sign-in-container">
                <form class="form-signin" action="login" method="post" id="loginForm">
                    <h1>Sign in</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <span>or use your account</span>
                    <input type="text" name="username"
                           placeholder="Username" required autofocus/> <br> 
                    <input type="password" name="password"
                           placeholder="Password" required/>
                    <%
                        String message = (String) request.getAttribute("error");
                        if (message != null) {
                    %>
                    <h4><%= message%></h4>
                    <%
                        }
                    %>
                    <a href="#">Forgot your password?</a>
                    <button>Sign In</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-right">
                        <h2>Welcome to DoctAid</h2>
                        <p>You can stay connected to your healthcare team though virtual visits, using your smartphone, tablet or computer. Ask your provider about what options are available</p>
                        <a href="signup"><button class="ghost" id="signUp">Sign Up</button></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%
    }
%>