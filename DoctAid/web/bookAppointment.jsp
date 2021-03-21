<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page
    import="patient.modal.Patient, java.util.ArrayList, modal.Appointment, staff.modal.Doctor, utils.DateUtils"%>

    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Book Appointment - Patient Dashboard - DoctAid</title>
            <link rel="icon" type="image/png" href="media/favicon.ico"/>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link href="https://fonts.googleapis.com/css?family=Droid+Sans" rel="stylesheet" />
            <link rel="stylesheet" href="css/dashboard-new.css">
        </head>
        <body>
            <% Patient patient = (Patient) request.getAttribute("patient");%>
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
                    <% ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>) request.getAttribute("appointments"); %>
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
                                    <h2>Hello <%= patient.getFirstName()%>, Book an appointment</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><br>
                <div class="container-fluid">
                    <h4 class="imfo-header sub-header">Book Appointment</h4>
                    <form class="form-contact form-horizontal" method="post" action="bookAppointment">
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">Patient
                                Name</label>
                            <div class="col-sm-10">
                                <p class="form-control-static"><%= patient.getFirstName() + " " + patient.getLastName()%></p>
                                <input type="hidden" name="patientId" value="1">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="title" class="col-sm-2 control-label">Appointment
                                Title</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="date"
                                       placeholder="Acute Stomach Ache" name="title" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="date" class="col-sm-2 control-label">Preferred
                                Date of Appointment</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" id="date"
                                       placeholder="Date" name="preferredDate"
                                       value="<%= DateUtils.getStringFromDate(System.currentTimeMillis())%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="symptons" class="col-sm-2 control-label">Symptoms</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="2"
                                          placeholder="chest pain, fatigue, hallucination, swelling"
                                          name="symptons"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="disease" class="col-sm-2 control-label">Suspected
                                Disease</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="disease"
                                       placeholder="Tuberculosis, Malaria, Acne, Diarrhea"
                                       name="disease">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Documents" class="col-sm-2 control-label">Medical
                                Documents</label>
                            <div class="col-sm-10">
                                <input type="file" id="Documents">
                                <p class="help-block">Upload relevant documents here for
                                    better care.</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-6 col-sm-2">
                                <button type="submit" class="btn btn-default">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <script src="http://code.jquery.com/jquery-latest.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
            <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
            <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
            <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
            <script src="js/dashboard.js"></script>
        </body>
    </html>