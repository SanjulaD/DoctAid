<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page
    import="patient.modal.Patient, java.util.ArrayList, modal.Appointment, modal.Appointment, modal.AppointmentItems, staff.modal.Doctor, prescription.Lab, prescription.Prescription"%>

    <%
        if (request.getAttribute("patient") == null || request.getAttribute("appointments") == null
                || request.getAttribute("apointment") == null) {
            response.sendRedirect("patient");
        } else {
            Patient patient = (Patient) request.getAttribute("patient");
            ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>) request
                    .getAttribute("appointments");
            Appointment detailedAppointment = ((Appointment) request.getAttribute("apointment"));
            ArrayList<Prescription> prescriptions = (ArrayList<Prescription>) request.getAttribute("prescriptions");
            ArrayList<Lab> labs = (ArrayList<Lab>) request.getAttribute("labs");
    %>

    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Patient Appointment Dashboard - DoctAid</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link href="https://fonts.googleapis.com/css?family=Droid+Sans" rel="stylesheet" />
            <link rel="stylesheet" href="css/dashboard-new.css">
            <link rel="stylesheet" href="css/appointment.css">
        </head>
        <body>
            <aside class="side-nav" id="show-side-navigation1">
                <i class="fa fa-bars close-aside hidden-sm hidden-md hidden-lg" data-close="show-side-navigation1"></i>
                <div class="heading">
                    <div class="col-md-12">
                        <div class="row" style="margin-bottom: 20px">
                            <img class="center-block"  src="media/avatar.svg" alt="user-image" width="150px" />
                        </div>
                        <div class="row">
                            <div class="info">
                                <h3>
                                    <a href="#">
                                        <i class="fa fa-user user-icone" style="color:darkgrey" ></i> <%= patient.getFirstName() + " " + patient.getLastName()%>
                                    </a>
                                </h3>
                                <h3>
                                    <a href="#">
                                        <i class="fa fa-mars-stroke user-icone" style="color: greenyellow"></i> <%= patient.getGender() + ", " + patient.getAge()%>
                                    </a>
                                </h3>
                                <h3>
                                    <a href="#">
                                        <i class="fa fa-tint user-icone" style="color: red"></i> <%= patient.getBloodGroup()%>
                                    </a>
                                </h3>
                                <h3>
                                    <a href="#">
                                        <i class="fa fa-home user-icone" style="color: #ffc107"></i> <%= patient.getAddress()%>
                                    </a>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
                <ul class="categories">
                    <li>
                        <i class="fa fa-plus fa-fw" aria-hidden="true"> </i
                        ><a href="openBookAppointment"> Book Appointment</a>
                    </li>
                    <li>
                        <i class="fa fa-support fa-fw"></i
                        ><a href="#"> Upcoming Appointment</a>
                        <ul class="side-nav-dropdown">
                            <li>
                                <% ArrayList<Appointment> appointments = arrayList.get(0);
                                    for (int i = 0; i < appointments.size(); i++) {
                                        Appointment appointment = appointments.get(i);
                                %>
                                <form class="form-signin" action="patientAppointmentDetails"
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
                        ><a href="#"> Recent Appointment</a>
                        <ul class="side-nav-dropdown">
                            <li>
                                <% ArrayList<Appointment> appointments2 = arrayList.get(1);
                                    for (int i = 0; i < appointments2.size(); i++) {
                                        Appointment appointment = appointments2.get(i);
                                %>
                                <form class="form-signin" action="patientAppointmentDetails"
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
                            <a class="navbar-brand" href="patient">Doct<span class="main-color">Aid</span></a
                            >
                        </div>
                        <div
                            class="collapse navbar-collapse navbar-right"
                            id="bs-example-navbar-collapse-1"
                            >
                            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                                <li class="nav-item">
                                    <a href="updatePatientProfile"><i class="fa fa-user-o fa-fw"></i> Edit Profile</a>
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
                                    <h2>Appointment : <%=detailedAppointment.getTitle()%></h2>
                                </div>
                            </div>
                        </div>
                        <div class="content">
                            <div class="row">
                                <div class="col-sm-3">
                                    <b>Appointment ID: <%=detailedAppointment.getId()%></b>
                                </div>
                                <div class="col-sm-5">
                                    <b>Doctor Name: </b>
                                    <%
                                        if (detailedAppointment.getDoctor() != null) {
                                    %>
                                    <%=detailedAppointment.getDoctor().getFirstName() + " "
                                            + detailedAppointment.getDoctor().getLastName()%>
                                    <%
                                    } else {
                                    %>
                                    Wating for doctor approval
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="col-sm-4">
                                    <b>Date Created:</b>
                                    <%=detailedAppointment.getStringDateCreated()%>
                                </div>
                            </div>
                            <br>
                            <div class="row ">
                                <div class="col-sm-8">
                                    <b>Symptons: </b>
                                    <%=detailedAppointment.getSymptons()%>
                                </div>
                                <div class="col-sm-4">
                                    <b>Suspected Disease </b><%=detailedAppointment.getDisease()%>
                                </div>
                            </div>
                            <br>
                            <% if (detailedAppointment.getIsClosed() == 0) {%>
                            <div class="row">
                                <form method="post" action="closeAppointment">
                                    <input type="hidden" name="appointmentId" value="<%=detailedAppointment.getId()%>" >
                                    <input
                                        type="hidden" name="by"
                                        value="<%="By patient: - " + patient.getFirstName()%>" /> 
                                    <input
                                        type="hidden" name="requestDispatcher"
                                        value="patientAppointmentDetails" /> 
                                    <button type="submit" class="send btn btn-success">Close</button>
                                </form>
                            </div>
                            <%} else { %>
                            <h3 style="text-align:center">Closed</h3>
                            <% } %>
                        </div>
                        <%
                            if (detailedAppointment.getItems() != null) {
                        %>
                        <%
                            for (int i = 0; i < detailedAppointment.getItems().size(); i++) {
                                AppointmentItems item = detailedAppointment.getItems().get(i);
                        %>
                        <div class="content" style="">
                            <div class="row ">
                                <div class="col-sm-2">
                                    <div class="messageFrom">
                                        <% if (item.getType() == 1) {%>
                                        <%= detailedAppointment.getDoctor().getFirstName()%>
                                        <%} else if (item.getType() == 2) {%>
                                        You
                                        <% } else if (item.getType() == 3) {%>
                                        <%= detailedAppointment.getDoctor().getFirstName()%> -> Prescription 
                                        <%} else if (item.getType() == 4) {%>
                                        Lab Report -><% for (int k = 0; k < labs.size(); k++) {
                                        if (labs.get(k).getItemId() == item.getItemId()) {%>
                                        <%= labs.get(k).getLabName()%>											
                                        <%	}
                                    } %>
                                        <% } else if (item.getType() == 5) {%>
                                        <%= detailedAppointment.getDoctor().getFirstName()%>
                                        <%} else if (item.getType() == 6) {%>
                                        System
                                        <% } %>
                                    </div>
                                </div>
                                <div class="col-sm-10">
                                    <div class="message">
                                        <%if (item.getType() == 1 || item.getType() == 2 || item.getType() == 5 || item.getType() == 6) {%>
                                        <%= item.getDescription()%>
                                        <%} else if (item.getType() == 3) {%>
                                        <% for (int k = 0; k < prescriptions.size(); k++) {
                                        if (prescriptions.get(k).getItemId() == item.getItemId()) {%>
                                        <div>Take <%= prescriptions.get(k).getQuantity()%> <b><%= prescriptions.get(k).getMedicineName()%></b> <%= prescriptions.get(k).getTimes()%> times a day.</div>											
                                        <%	}
                                    } %>
                                        <%} else if (item.getType() == 4) {%>
                                        <% for (int k = 0; k < labs.size(); k++) {
                                        if (labs.get(k).getItemId() == item.getItemId()) {%>
                                        <div>Your lab result for <b><%= labs.get(k).getTestFor()%></b> is <b><%= labs.get(k).getLabResult()%></b>.</div>											
                                        <%	}
                                    } %>
                                        <%}%>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-10"></div>
                                <div class="col-sm-2">
                                    <div class="" style="font-size: 11px;">
                                        <%=item.getStringDate()%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                        <% if (detailedAppointment.getIsClosed() == 0) {%>
                        <div class="">
                            <form class="form-inline" action="newAppointmentItem" method="post">
                                <div class="row">
                                    <input type="hidden" name="sendType" value="2" /> 
                                    <input
                                        type="hidden" name="requestDispatcher"
                                        value="patientAppointmentDetails" /> 
                                    <input type="hidden"
                                           name="appointmentId" value="<%=detailedAppointment.getId()%>" />
                                    <div class="col-sm-9 form-group">
                                        <textarea class="form-control textman" name="description"
                                                  rows="3" placeholder="Type your message here"></textarea>
                                    </div>
                                    <div class="col-sm-3">
                                        <button type="submit" class="send btn btn-success">Send</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
            <%} %>
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