<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page
    import="staff.modal.Staff"%>
    <%
        if (request.getAttribute("labPerson") == null) {
            response.sendRedirect("labPerson");
        } else {
            Staff labPerson = (Staff) request.getAttribute("labPerson");
    %>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Edit Profile - LabPerson Dashboard - Central Medic Center</title>
            <link rel="stylesheet"
                  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
                  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
                  crossorigin="anonymous">
            <link rel="stylesheet" href="css/dashboard.css">

        </head>
        <body>

            <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed"
                                data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                                aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span> <span
                                class="icon-bar"></span> <span class="icon-bar"></span> <span
                                class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="labPerson">Central Medic Center</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="labPerson">Dashboard</a></li>
                            <li class="active"><a href="#">Edit Profile</a></li>
                            <li><a href="logout">Logout</a></li>
                        </ul>
                        <form class="navbar-form navbar-right">
                            <input type="text" class="form-control" placeholder="Search...">
                        </form>
                    </div>
                </div>
            </nav>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-3 sidebar">
                        <ul class="nav nav-sidebar">
                            <li class="active">
                                <div class="row intro">
                                    <div class="">
                                        <img class="profilePic" src="media/labPerson.png">
                                    </div>
                                </div>
                                <div class="row intro">
                                    <h3 class="name"><%= labPerson.getFirstName() + " " + labPerson.getLastName()%></h3>
                                    <div class="details-set">
                                        <img src="media/gender.png"><span class="details">
                                            <%= labPerson.getGender() + ", " + labPerson.getAge()%></span><br> 
                                        <img src="media/degree.png"><span class="degree"> Lab Person</span><br>
                                        <img src="media/Location.png"><span class="location">
                                            <%= labPerson.getAddress()%></span>
                                    </div>
                                </div>
                            </li>
                            <li class="labReports"><a href="labPerson">Lab Reports</a></li>
                        </ul>
                    </div>

                    <div class="col-sm-9 col-sm-offset-3 main">
                        <h1 class="page-header" style="text-align: center">
                            Edit Profile 
                        </h1>
                        <h4 class="sub-header">Personal Information</h4>
                        <form class="form-horizontal" action="editLabPersonProfile"
                              method="post">
                            <div class="form-group">
                                <label for="firstName" class="col-sm-2 control-label">First
                                    Name</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static"><%= labPerson.getFirstName()%></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="lastName" class="col-sm-2 control-label">Last
                                    Name</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static"><%= labPerson.getLastName()%></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="gender" class="col-sm-2 control-label">Gender</label>
                                <div class="col-sm-10">
                                    <p class="form-control-static"><%= labPerson.getGender()%></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="date" class="col-sm-2 control-label">Date Of
                                    Birth</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control" name="dob" id="date"
                                           placeholder="Date" value="<%= labPerson.getStringDob()%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="phoneNumber" class="col-sm-2 control-label">Phone
                                    Number</label>
                                <div class="col-sm-10">
                                    <input type="tel" class="form-control"
                                           name="contactNumber" id="phoneNumber"
                                           placeholder="+91 9521113802"
                                           value="<%= labPerson.getContactNumber()%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address" class="col-sm-2 control-label">Address</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" rows="2" name="address"
                                              placeholder="BH-3, The LNMIIT"> <%= labPerson.getAddress()%></textarea>
                                </div>
                            </div>
                            <h4 class="sub-header">Account Information</h4>
                            <div class="form-group">
                                <label for="userName" class="col-sm-2 control-label">User
                                    Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="userName"
                                           placeholder="rakeshsharma" value="<%= labPerson.getUserName()%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="password"
                                           id="password" placeholder="password">
                                </div>
                            </div>
                            <!-- 	<div class="form-group">
                                    <label for="emailAddress" class="col-sm-2 control-label">Email
                                            Address</label>
                                    <div class="col-sm-10">
                                            <input type="string" class="form-control" id="emailAddress"
                                                    placeholder="rakeshsharma.y15@gmail.com" value="">
                                    </div>
                            </div>-->
                            <div class="form-group">
                                <div class="col-sm-offset-6 col-sm-2">
                                    <button type="submit" class="btn btn-success">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Bootstrap core JavaScript
    ================================================== -->
            <!-- Placed at the end of the document so the pages load faster -->
            <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
            <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
            <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        </body>
    </html>
    <%
        }
    %>