
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page
    import="staff.modal.Staff, java.util.ArrayList, modal.Appointment, staff.modal.Doctor, patient.modal.DashBoard"%>
    <%
        if (request.getAttribute("receptionist") == null || request.getAttribute("appointments") == null) {
            response.sendRedirect("receptionist");
        } else {
            Staff receptionist = (Staff) request.getAttribute("receptionist");
            ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>) request.getAttribute("appointments");
            DashBoard dashBoard = (DashBoard) request.getAttribute("dashBoard");

    %>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Receptionist Dashboard - Central Medic Center</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet"
                  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
                  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
                  crossorigin="anonymous">
            <link rel="stylesheet" href="css/dashboard.css">
            <link rel="stylesheet" href="css/patient.css">

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
                        <a class="navbar-brand" href="receptionist">Central Medic Center</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="#">Dashboard</a></li>
                            <li><a href="updateReceptionistProfile">Edit Profile</a>
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
                                        <img class="profilePic" src="media/receptionist.png">
                                    </div>
                                </div>
                                <div class="row intro">
                                    <h3 class="name"><%= receptionist.getFirstName() + " " + receptionist.getLastName()%></h3>
                                    <div class="details-set">
                                        <img src="media/gender.png"><span class="details">
                                            <%= receptionist.getGender() + ", " + receptionist.getAge()%></span><br> 
                                        <img src="media/degree.png"><span class="degree"> Receptionist</span><br>
                                        <img src="media/Location.png"><span class="location">
                                            <%= receptionist.getAddress()%></span>
                                    </div>
                                </div>
                            </li>
                            <li class="topic"><span class="upcoming">Unallocated
                                    Appointment</span> <% ArrayList<Appointment> unallocatedAppointments = arrayList.get(0);
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
                            <li class="topic">Allocated Appointment <% ArrayList<Appointment> allocatedAppointments = arrayList.get(1);
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
                    </div>
                    <div class="col-sm-9 col-sm-offset-3 main">
                        <h1 class="page-header">Dashboard</h1>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="card">
                                    <div class="cardImage">
                                        <img src="media/appointment.png">
                                    </div>
                                    <div class="cardText"><%= dashBoard.getNoOfAppointment()%> Appointment Request</div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="card">
                                    <div class="cardImage">
                                        <img src="media/bmi.png">
                                    </div>
                                    <div class="cardText"><%= dashBoard.getPatientCount()%> Total Appointments</div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="card">
                                    <div class="cardImage">
                                        <img src="media/edit.png">
                                    </div>
                                    <div class="cardText"><%= dashBoard.getPercentProfile()%>% Profile</div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="row text-center">
                            <div class="col-sm-12">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        Last Login
                                    </div>
                                    <div class="panel-body">
                                        <%= session.getAttribute("LastAccess")%>
                                    </div>
                                </div>
                            </div>
                        </div>
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