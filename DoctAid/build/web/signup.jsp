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
                <form class="form-signup" action="signup" method="post"
                      id="mainForm" role="form" autocomplete="off" >
                    <br /><br /><br /><br /><br /><br /><br /><br />
                    <h1>Sign up</h1>
                    <br />
                    <div class="form-group">
                        <label for="firstName" class="col-sm-3 control-label">First
                            Name</label>
                        <div class="col-sm-9">
                            <input type="text" name="firstName" placeholder="First Name"
                                   class="form-control" maxlength="10" autofocus required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="lastName" class="col-sm-3 control-label">Last
                            Name</label>
                        <div class="col-sm-9">
                            <input type="text" name="lastName" placeholder="Last Name"
                                   class="form-control" maxlength="10" autofocus required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="col-sm-3 control-label ">Username</label>
                        <div class="col-sm-9">
                            <input type="text" name="userName" placeholder="Username"
                                   class="form-control" maxlength="20" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-3 control-label">Password</label>
                        <div class="col-sm-9">
                            <input type="password" name="password" placeholder="Password"
                                   class="form-control" maxlength="20" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="birthDate" class="col-sm-3 control-label">Date
                            of Birth</label>
                        <div class="col-sm-9">
                            <input type="date" name="dob" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Gender</label>
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="radio col-sm-3">
                                    <label class="radio-inline"> <input name="gender"
                                                                        type="radio" id="femaleRadio" value="F">Female
                                    </label>
                                </div>
                                <div class="radio col-sm-3">
                                    <label class="radio-inline"> <input name="gender"
                                                                        type="radio" id="maleRadio" value="M" checked>Male
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address" class="col-sm-3 control-label">Address</label>
                        <div class="col-sm-9">
                            <input type="text" name="address"
                                   placeholder="BH3, The LNMIIT, Jaipur" class="form-control"
                                   maxlength="40" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="number" class="col-sm-3 control-label">Phone
                            Number</label>
                        <div class="col-sm-9">
                            <input type="tel" name="contactNumber" placeholder="+94771234567"
                                   class="form-control" maxlength="13" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userType" class="col-sm-3 control-label">User
                            Type</label>
                        <div class="col-sm-9">
                            <select id="userType" name="userType" class="form-control" required>
                                <option value="" selected disabled>Choose One</option>
                                <option value="1">Patient</option>
                                <option value="2">Doctor</option>
                            </select>
                        </div>
                    </div>

                    <div id="Patient" style="display: none;">
                        <div class="form-group">
                            <label for="Height" class="col-sm-3 control-label">Height</label>
                            <div class="col-sm-9">
                                <input type="number" name="height" placeholder="in cms"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Weight" class="col-sm-3 control-label">Weight</label>
                            <div class="col-sm-9">
                                <input type="number" name="weight" placeholder="in kgs"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="BloodGroup" class="col-sm-3 control-label">Blood
                                Group</label>
                            <div class="col-sm-9">
                                <input type="text" name="bloodGroup" placeholder="A+"
                                       class="form-control" maxlength="3">
                            </div>
                        </div>
                    </div>
                    <div id="Doctor" style="display: none;">
                        <div class="form-group">
                            <label for="Degree" class="col-sm-3 control-label">Degree</label>
                            <div class="col-sm-9">
                                <input type="text" name="degree" placeholder="MBBS"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Specialization" class="col-sm-3 control-label">Specialization</label>
                            <div class="col-sm-9">
                                <input type="text" name="specialization"
                                       placeholder="Cardiologist" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9 ">
                            <%
                                String message = (String) request.getAttribute("error");
                                if (message != null) {
                            %>
                            <h4><%= message%></h4>
                            <%
                                }
                            %>
                            <button type="submit">Register</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-right">
                        <h2>Welcome to DoctAid</h2>
                        <p>You can stay connected to your healthcare team though virtual visits, using your smartphone, tablet or computer. Ask your provider about what options are available</p>
                        <a href="login"><button class="ghost" id="signUp">Sign In</button></a>
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