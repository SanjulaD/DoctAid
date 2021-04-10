<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.io.*,java.util.*"%>
<%

    if (!session.isNew() && session.getAttribute("UserID") != null) {
        Date lastAccessTime = new Date(session.getLastAccessedTime());
        session.setAttribute("LastAccess", lastAccessTime);
        String type = (String) session.getAttribute("UserType");

        if (type.equals("patient")) {
            response.sendRedirect("patient");
        } else if (type.equals("doctor")) {
            response.sendRedirect("doctor");
        }

    } else {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up - DoctAid</title>
        <link rel="icon" type="image/png" href="media/favicon.ico"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
              crossorigin="anonymous">
        <link type="text/css" rel="stylesheet" href="css/signup.css" />
            

    </head>
    <body>
        <div class="container" id="container">
            <div class="form-container sign-in-container">
                <form class="form-signin" action="signup" method="post" id="loginForm">
                    <h1>Sign up</h1>
                  
                    <input type="text" name="firstName"
                           placeholder="firstName" required autofocus/>
                    <input type="text" name="lastName"
                           placeholder="lastName" required/>
                   
                    <input type="text" name="Username"
                           placeholder="Username" required/>
                   
                    <input type="Password" name="Password"
                           placeholder="Password" required/>
                     <input type="date" name="birthDate"
                           placeholder="Date
                            of Birth" required/>
                      <input type="address" name="address"
                           placeholder="address
                           " required/>
                        <input type="text" name="tel"
                           placeholder="phone number
                           " required/>
                  
                        
                        <div class="col-sm-9">
                            <select id="userType" name="userType" class="form-control" required>
                                <option value="" selected disabled>User type</option>
                                <option value="1">Patient</option>
                                <option value="2">Doctor</option>
                            </select>
                        </div>
                        
                               <input type="number" name="Height"
                           placeholder="in cms
                           " required/>
                                <input type="number" name="weight"
                           placeholder="in kgs
                           " required/>
                                   <input type="text" name="Degree"
                           placeholder="MBBS
                           " required/>
                                      <input type="text" name="Degree"
                           placeholder="MBBS
                           " required/>
                                      <input type="text" name="Specialization"
                           placeholder="Specialization
                           " required/>
                    <%
                        String message = (String) request.getAttribute("error");
                        if (message != null) {
                    %>
                    <h4><%= message%></h4>
                    <%
                        }
                    %>
                  
                    <button>Sign Up</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-right">
                        <h2>Welcome to DoctAid</h2>
                        <p>You can stay connected to your healthcare team though virtual visits, using your smartphone, tablet or computer. Ask your provider about what options are available</p>
                        <a href="signin"><button class="ghost" id="signUp">Sign In</button></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
        <!-- ./container -->

        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $('#userType').on('click', function () {
                var selection = $(this).val();
                switch (selection) {
                    case "1":
                        $("#Patient").show();
                        $("#Doctor").hide();
                        break;
                    case "2":
                        $("#Patient").hide();
                        $("#Doctor").show();
                        break;
                    default:
                        $("#Patient").hide();
                        $("#Doctor").hide();
                }
            });
        </script>
    </body>
</html>
<%
    }
%>