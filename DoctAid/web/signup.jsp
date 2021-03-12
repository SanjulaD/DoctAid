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
        <title>Sign Up - Central Medic Center</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
              crossorigin="anonymous">
        <link type="text/css" rel="stylesheet" href="css/signup.css" />
    </head>
    <body>
        <div style="background-image: url(https://images.unsplash.com/photo-1579684385127-1ef15d508118?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80); background-repeat: no-repeat; background-size: cover; ">
            <br>
            <div class="container">
                <h1 class="heading" style="text-align: center; margin-top: 10px; margin-bottom: 50px; color: #007bfe">
                    DoctAid
                </h1>
                <form class="form-horizontal form-signup" id="mainForm" role="form"
                      action="signup" method="post" autocomplete="off" style="margin-bottom: 100px; box-shadow: 2px 2px 20px 2px #888888;">
                    <h2 class="form-signin-heading" style="text-align: center">
                        Please register
                    </h2>
                    <br>
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
                                <div class="radio col-sm-4">
                                    <label class="radio-inline"> <input name="gender"
                                                                        type="radio" id="femaleRadio" value="F">Female
                                    </label>
                                </div>
                                <div class="radio col-sm-4">
                                    <label class="radio-inline"> <input name="gender"
                                                                        type="radio" id="maleRadio" value="M" checked>Male
                                    </label>
                                </div>
                                <div class="radio col-sm-4">
                                    <label class="radio-inline"> <input name="gender"
                                                                        type="radio" id="unknownRadio" value="U">Unknown
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
                        <div class="col-sm-9 col-sm-offset-3">
                            <%
                                String message = (String) request.getAttribute("error");
                                if (message != null) {
                            %>
                            <h4><%= message%></h4>
                            <%
                                }
                            %>
                            <button type="submit" class="btn btn-primary btn-block">Register</button>
                        </div>
                    </div>

                    <div style="text-align: center">
                        <a href="login">Already Signup? Login Here</a>
                    </div>
                </form>
                <!-- /form -->
            </div>
        </div>
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