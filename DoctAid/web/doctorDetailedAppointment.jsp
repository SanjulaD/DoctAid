<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page
    import="patient.modal.Patient, java.util.ArrayList, modal.Appointment, modal.Appointment, modal.AppointmentItems, staff.modal.Doctor, prescription.Lab, prescription.Prescription "%>

    <%
        if (request.getAttribute("doctor") == null || request.getAttribute("appointments") == null || request.getAttribute("apointment") == null) {
            response.sendRedirect("doctor");
        } else {
            Doctor doctor = (Doctor) request.getAttribute("doctor");
            ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>) request.getAttribute("appointments");
            Appointment detailedAppointment = ((Appointment) request.getAttribute("apointment"));
            ArrayList<Prescription> prescriptions = (ArrayList<Prescription>) request.getAttribute("prescriptions");
            ArrayList<Lab> labs = (ArrayList<Lab>) request.getAttribute("labs");
    %>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Doctor Appointment Dashboard - DoctAid</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link href="https://fonts.googleapis.com/css?family=Droid+Sans" rel="stylesheet" />
            <link rel="stylesheet" href="css/dashboard-new.css">
            <link rel="stylesheet" href="css/appointment.css">
            <link rel="stylesheet" href="css/doctor.css">
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
                                        <i class="fa fa-user user-icone" style="color:darkgrey" ></i> <%= doctor.getFirstName() + " " + doctor.getLastName()%>
                                    </a>
                                </h3>
                                <h3>
                                    <a href="#">
                                        <i class="fa fa-mars-stroke user-icone" style="color: greenyellow"></i> <%= doctor.getGender() + ", " + doctor.getAge()%>
                                    </a>
                                </h3>
                                <h3>
                                    <a href="#">
                                        <i class="fa fa-graduation-cap user-icone" style="color: #ffc107"></i> <%= doctor.getDegree()%>
                                    </a>
                                </h3>
                                <h3>
                                    <a href="#">
                                        <i class="fa fa-stethoscope user-icone" style="color: #0275d8"></i> <%= doctor.getSpecialization()%>
                                    </a>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
                <ul class="categories">
                    <li>
                        <i class="fa fa-support fa-fw"></i
                        ><a href="#"> Upcoming Appointment</a>
                        <ul class="side-nav-dropdown">
                            <li>
                                <%
                                    ArrayList<Appointment> upcomingAppointments = arrayList.get(0);
                                    for (int i = 0; i < upcomingAppointments.size(); i++) {
                                        Appointment appointment = upcomingAppointments.get(i);
                                %>
                                <form class="form-signin" action="doctorAppointmentDetails"
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
                                                            <% Patient patient = appointment.getPatient();
                                                                if (patient == null) {
                                                            %>Wating for doctor approval
                                                            <% } else {%>
                                                            <%= patient.getFirstName()%>
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
                                <%                                    ArrayList<Appointment> appointments2 = arrayList.get(1);
                                    for (int i = 0; i < appointments2.size(); i++) {
                                        Appointment appointment = appointments2.get(i);
                                %>
                                <form class="form-signin" action="doctorAppointmentDetails"
                                      method="post">
                                    <input type="hidden" class="form-control" name="appointmentId"
                                           value="<%= appointment.getId()%>" />
                                    <ul>
                                        <li class="subtopic">
                                            <button class="btn btn-default" type="submit">
                                                <div class="row">
                                                    <div class="col-sm-12 text-left">
                                                        <b><%= appointment.getTitle()%> </b><br>
                                                        <% Patient patient = appointment.getPatient();
                                                            if (patient == null) {
                                                        %>Wating for doctor approval
                                                        <% } else {%>
                                                        <%= patient.getFirstName()%>
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
                                    <a href="updateDoctorProfile"><i class="fa fa-user-o fa-fw"></i> Edit Profile</a>
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
                            <div class="row ">
                                <div class="col-sm-4">
                                    <h3>Appointment ID: <%= detailedAppointment.getId()%></h3>
                                </div>
                                <div class="col-sm-4">
                                    <h3>Patient Name: </h3><b>
                                        <% if (detailedAppointment.getPatient() != null) {%>
                                        <%= detailedAppointment.getPatient().getFirstName() + " " + detailedAppointment.getPatient().getLastName()%>
                                        <% } else { %>
                                        Wating for doctor approval
                                        <% }%></b>
                                </div>
                                <div class="col-sm-4">
                                    <h3>Date Created:</h3><b>
                                        <%= detailedAppointment.getStringDateCreated()%></b>
                                </div>
                            </div>
                            <br>
                            <div class="row ">
                                <div class="col-sm-4">
                                    <h3>Symptons: </h3><b>
                                        <%= detailedAppointment.getSymptons()%></b>
                                </div>
                                <div class="col-sm-4">
                                    <h3>Suspected Disease </h3><b><%= detailedAppointment.getDisease()%></b>
                                </div>
                            </div>
                            <br><br>
                            <% if (detailedAppointment.getIsClosed() == 0) {%>
                            <div class="row">
                                <form method="post" action="closeAppointment">
                                    <input type="hidden" name="appointmentId" value="<%=detailedAppointment.getId()%>" >
                                    <input
                                        type="hidden" name="by"
                                        value="<%="By Doctor: - " + doctor.getFirstName()%>" /> 
                                    <input
                                        type="hidden" name="requestDispatcher"
                                        value="doctorAppointmentDetails" /> 
                                    <button type="submit" class="send btn btn-success">Close</button>
                                </form>
                            </div>
                            <%} else { %>
                            <h3 style="text-align:center">Closed</h3>
                            <% } %>
                        </div>
                        <% if (detailedAppointment.getItems() != null) {%>
                        <% for (int i = 0; i < detailedAppointment.getItems().size(); i++) {
                                AppointmentItems item = detailedAppointment.getItems().get(i);
                        %>
                        <div class="content" style="">
                            <div class="row ">
                                <div class="col-sm-2">
                                    <div class="messageFrom">
                                        <% if (item.getType() == 1) { 	%>
                                        You
                                        <%} else if (item.getType() == 2) {%>
                                        <%= detailedAppointment.getPatient().getFirstName()%>
                                        <% } else if (item.getType() == 3) { %>
                                        You -> Prescription 
                                        <%} else if (item.getType() == 4) {%>
                                        Lab Report -><% for (int k = 0; k < labs.size(); k++) {
                                                if (labs.get(k).getItemId() == item.getItemId()) {%>
                                        <%= labs.get(k).getLabName()%>											
                                        <%	}
                                            } %>
                                        <% } else if (item.getType() == 5) { %>
                                        You
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
                                        <div>Lab result for <b><%= labs.get(k).getTestFor()%></b> is <b><%= labs.get(k).getLabResult()%></b>.</div>											
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
                                        <%= item.getStringDate()%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% }
                            }%>
                        <% if (detailedAppointment.getIsClosed() == 0) {%>
                        <div class="">
                            <form class="form-inline" action="newAppointmentItem" method="post">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="radio">
                                            <label> <input type="radio" name="sendType"
                                                           id="optionsRadios" value="1" checked> Message
                                            </label> 
                                            <label> <input type="radio" name="sendType"
                                                           id="optionsRadios" value="5"> Lab Report
                                            </label> 
                                            <label> <input type="radio" name="sendType"
                                                           id="optionsRadios" value="3"> Prescription
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row ">
                                    <input type="hidden" name="requestDispatcher" value="doctorAppointmentDetails" />
                                    <input type="hidden" name="appointmentId" value="<%= detailedAppointment.getId()%>" />
                                    <input type="hidden" name="doctorId" value="<%= doctor.getId()%>" />
                                    <div class="col-sm-9 form-group" id="Message" >
                                        <textarea class="form-control textman" name="description"
                                                  rows="4" placeholder="Type your message here"></textarea>
                                    </div>
                                    <div class="col-sm-9 form-group" id="LabReport" style="display: none;" >
                                        <div class="row LabReportOptions">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <!--<label for="LabName">Lab Name</label>-->
                                                    <input type="text" class="form-control" name="labName" id="LabName" placeholder="Lab Name">
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <!--<label for="TestFor">Test For</label>-->
                                                    <input type="text" class="form-control" name="testFor" id="TestFor" placeholder="Test For">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-9 form-group" id="Prescription" style="display: none;" >
                                        <div class="row prescriptionOptions">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <!--<label for="MedicineName">Medicine Name</label>-->
                                                    <input type="text" class="form-control" name="medicineName" id="MedicineName" placeholder="Medicine Name">
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <select name="quantity" class="form-control">
                                                    <option value="" selected disabled>Choose Quantity</option>
                                                    <option value="0.5">0.5</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-4">
                                                <select name="times" class="form-control">
                                                    <option value="" selected disabled>Times A Day</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <button type="submit" class="send btn btn-success">Send</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <% } %>
                    </div>
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
            <script type="text/javascript">
                $('input[type="radio"]').on('click', function () {
                    var selection = $(this).val();
                    switch (selection) {
                        case "1":
                            $("#Message").show();
                            $("#LabReport").hide();
                            $("#Prescription").hide();
                            break;
                        case "5":
                            $("#Message").hide();
                            $("#LabReport").show();
                            $("#Prescription").hide();
                            break;
                        case "3":
                            $("#Message").hide();
                            $("#LabReport").hide();
                            $("#Prescription").show();
                            break;
                        default:
                            $("#Message").show();
                            $("#LabReport").hide();
                            $("#Prescription").hide();
                    }
                });
            </script>
            <!--<script>
                function addFields(){
                    var container = document.getElementById("Prescription");
                    // Clear previous contents of the container
                    //while (container.hasChildNodes()) {
                    //    container.removeChild(container.lastChild);
                    //}
                    // Append a node with a random text
                        container.appendChild(document.createTextNode("Member " + 1));
                        // Create an <input> element, set its type and name attributes
                        var input = document.createElement("input");
                        input.type = "text";
                        input.name = "member" + i;
                        container.appendChild(input);
                        // Append a line break 
                        container.appendChild(document.createElement("br"));
                }
                </script>-->
        </body>
    </html>
    <%
        }
    %>