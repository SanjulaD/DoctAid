
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page
    import="staff.modal.Staff, java.util.ArrayList, modal.Appointment, staff.modal.Doctor"%>
    <%
        if (request.getAttribute("receptionist") == null) {
            response.sendRedirect("receptionist");
        } else {
            Staff receptionist = (Staff) request.getAttribute("receptionist");
            ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>) request.getAttribute("appointments");
    %>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Edit Profile - Receptionist Dashboard - DoctAid</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="icon" type="image/png" href="media/favicon.ico"/>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link href="https://fonts.googleapis.com/css?family=Droid+Sans" rel="stylesheet" />
            <link rel="stylesheet" href="css/dashboard-new.css">
            <link rel="stylesheet" href="css/patient.css">
            <link rel="stylesheet" href="css/patient.css">
        </head>
        <body>
            <aside class="side-nav" id="show-side-navigation1">
                <i class="fa fa-bars close-aside hidden-sm hidden-md hidden-lg" data-close="show-side-navigation1"></i>
                <div class="heading">
                    <div class="col-md-12">
                        <div class="row" style="margin-bottom: 20px">
                            <img class="center-block"  src="media/receptionist.svg" alt="user-image" width="200px" />
                        </div>
                        <div class="row">
                            <div class="info">
                                <h3>
                                    <a href="#">
                                        <i class="fa fa-user user-icone" style="color:darkgrey" ></i> <%= receptionist.getFirstName() + " " + receptionist.getLastName()%>
                                    </a>
                                </h3>
                                <h3>
                                    <a href="#">
                                        <i class="fa fa-mars-stroke user-icone" style="color: greenyellow"></i> <%= receptionist.getGender() + ", " + receptionist.getAge()%>
                                    </a>
                                </h3>
                                <h3>
                                    <a href="#">
                                        <i class="fa fa-home user-icone" style="color: #ffc107"></i> <%= receptionist.getAddress()%>
                                    </a>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
                <ul class="categories">
                    <li>
                        <i class="fa fa-support fa-fw"></i
                        ><a href="#"> Unallocated Appointment</a>
                        <ul class="side-nav-dropdown">
                            <li>
                                <% ArrayList<Appointment> unallocatedAppointments = arrayList.get(0);
                                    for (int i = 0; i < unallocatedAppointments.size(); i++) {
                                        Appointment appointment = unallocatedAppointments.get(i);
                                %>
                                <form class="form-signin" action="receptionistAppointmentDetails"
                                      method="post">
                                    <input type="hidden" class="form-control" name="appointmentId"
                                           value="<%= appointment.getId()%>" />
                                    <ul>
                                        <li class="subtopic">
                                            <button class="btn btn-default" type="submit">
                                                <div class="row">
                                                    <div class="col-sm-12 text-left">
                                                        <div>
                                                            <b><%= appointment.getTitle()%> </b><br>
                                                            <% if (appointment.getDisease() != null) {%>
                                                            <%= appointment.getDisease() + " | "%>
                                                            <%  }%>
                                                            <%= appointment.getStringDateCreated()%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </button>
                                        </li>
                                    </ul>
                                </form>
                                <%  }

                                %>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <i class="fa fa-external-link fa-fw"></i
                        ><a href="#"> Allocated Appointment</a>
                        <ul class="side-nav-dropdown">
                            <li>
                                <% ArrayList<Appointment> allocatedAppointments = arrayList.get(1);
                                    for (int i = 0; i < allocatedAppointments.size(); i++) {
                                        Appointment appointment = allocatedAppointments.get(i);
                                %>
                                <form class="form-signin" action="receptionistAppointmentDetails"
                                      method="post">
                                    <input type="hidden" class="form-control" name="appointmentId"
                                           value="<%= appointment.getId()%>" /> 
                                    <ul>
                                        <li class="subtopic">
                                            <button class="btn btn-default" type="submit">
                                                <div class="row">
                                                    <div class="col-sm-12 text-left">
                                                        <b><%= appointment.getTitle()%> </b><br>
                                                        <% Doctor doctor = appointment.getDoctor();
                                                            if (doctor == null) {
                                                        %>Wating for doctor approval
                                                        <% } else {%>
                                                        <%= doctor.getFirstName()%>
                                                        <% }%>
                                                        |
                                                        <%= appointment.getStringDateCreated()%>
                                                    </div>
                                                </div>
                                            </button>
                                        </li>
                                    </ul>
                                </form>
                                <%  }
                                %>
                            </li>
                        </ul>
                    </li>
                </ul>
            </aside>
            <section id="contents">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button
                                type="button"
                                class="navbar-toggle collapsed"
                                data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1"
                                aria-expanded="false"
                                >
                                <i class="fa fa-align-right"></i>
                            </button>
                            <a class="navbar-brand" href="patient">
                                <img style="margin-top: 8px" src="media/Logo.png" alt="Logo" width="150">
                            </a>
                        </div>
                        <div
                            class="collapse navbar-collapse navbar-right"
                            id="bs-example-navbar-collapse-1"
                            >
                            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                                <li class="nav-item">
                                    <a href="updateReceptionistProfile"><i class="fa fa-user-o fa-fw"></i> Edit Profile</a>
                                </li>
                                <li class="nav-item">
                                    <a href="logout" ><i class="fa fa-sign-out fa-fw"></i> Log out</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="welcome">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="content">
                                    <h2>Hello <%= receptionist.getFirstName()%>, Edit your profile here</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <h4 class="imfo-header sub-header">Personal Information</h4>
                    <form class="form-contact form-horizontal" action="editReceptionistProfile"
                          method="post">
                        <div class="form-group">
                            <label for="firstName" class="col-sm-2 control-label">First
                                Name</label>
                            <div class="col-sm-10">
                                <p class="form-control-static"><%= receptionist.getFirstName()%></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="lastName" class="col-sm-2 control-label">Last
                                Name</label>
                            <div class="col-sm-10">
                                <p class="form-control-static"><%= receptionist.getLastName()%></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="gender" class="col-sm-2 control-label">Gender</label>
                            <div class="col-sm-10">
                                <p class="form-control-static"><%= receptionist.getGender()%></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="date" class="col-sm-2 control-label">Date Of
                                Birth</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" name="dob" id="date"
                                       placeholder="Date" value="<%= receptionist.getStringDob()%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phoneNumber" class="col-sm-2 control-label">Phone
                                Number</label>
                            <div class="col-sm-10">
                                <input type="tel" class="form-control"
                                       name="contactNumber" id="phoneNumber"
                                       placeholder="+91 9521113802"
                                       value="<%= receptionist.getContactNumber()%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="address" class="col-sm-2 control-label">Address</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="2" name="address"
                                          placeholder="BH-3, The LNMIIT"> <%= receptionist.getAddress()%></textarea>
                            </div>
                        </div>
                        <h4 class="sub-header">Account Information</h4>
                        <div class="form-group">
                            <label for="userName" class="col-sm-2 control-label">User
                                Name</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="userName"
                                       placeholder="rakeshsharma" value="<%= receptionist.getUserName()%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="password"
                                       id="password" placeholder="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-6 col-sm-2">
                                <button type="submit" class="btn btn-success">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <script src="http://code.jquery.com/jquery-latest.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
            <script>
                window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
            </script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
            <script src="js/dashboard.js"></script>
        </body>
    </html>
    <%
        }
    %>