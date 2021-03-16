<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page
    import="patient.modal.Patient, java.util.ArrayList, modal.Appointment, staff.modal.Doctor, patient.modal.DashBoard"%>
    <%
        if (request.getAttribute("doctor") == null || request.getAttribute("appointments") == null) {
            response.sendRedirect("doctor");
        } else {
            Doctor doctor = (Doctor) request.getAttribute("doctor");
            ArrayList<ArrayList<Appointment>> arrayList = (ArrayList<ArrayList<Appointment>>) request.getAttribute("appointments");
            DashBoard dashBoard = (DashBoard) request.getAttribute("dashBoard");
    %>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Doctor Dashboard - DoctAid</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link href="https://fonts.googleapis.com/css?family=Droid+Sans" rel="stylesheet" />
            <link rel="stylesheet" href="css/dashboard-new.css">
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
                                    <h2>Hello <%= doctor.getFirstName()%>, Welcome to Doctor Dashboard</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <section class="statistics">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="box">
                                    <i class="fa fa-envelope fa-fw bg-primary"></i>
                                    <div class="info">
                                        <h3>
                                            <%= dashBoard.getNoOfAppointment()%> 
                                        </h3>
                                        <p>Appointments</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="box">
                                    <i class="fa fa-line-chart fa-fw danger"></i>
                                    <div class="info">
                                        <h3>
                                            <%= dashBoard.getPatientCount()%> 
                                        </h3>
                                        <p>Patients Treated<s</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="box">
                                    <i class="fa fa-medkit fa-fw success"></i>
                                    <div class="info">
                                        <h3>
                                            <%= dashBoard.getPercentProfile()%>% 
                                        </h3>
                                        <p>Profile</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="statis text-center">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="panel">
                                <div class="panel-heading">
                                    Last Login
                                </div>
                                <div class="panel-body">
                                    <%= session.getAttribute("LastAccess")%>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
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