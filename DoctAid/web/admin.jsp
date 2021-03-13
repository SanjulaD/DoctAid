
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page
    import="staff.modal.Staff, patient.modal.Patient, staff.modal.Doctor, java.util.ArrayList, modal.Appointment"%>
    <%
        if (request.getAttribute("admin") == null || request.getAttribute("doctors") == null
                || request.getAttribute("patients") == null || request.getAttribute("appointments") == null
                || request.getAttribute("staffs") == null) {
            response.sendRedirect("admin");
        } else {
            Staff admin = (Staff) request.getAttribute("admin");
            ArrayList<Doctor> doctors = (ArrayList<Doctor>) request.getAttribute("doctors");
            ArrayList<Patient> patients = (ArrayList<Patient>) request.getAttribute("patients");
            ArrayList<Appointment> appointments = (ArrayList<Appointment>) request.getAttribute("appointments");
            ArrayList<Staff> staffs = (ArrayList<Staff>) request.getAttribute("staffs");
    %>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Admin Dashboard - DoctAid</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link href="https://fonts.googleapis.com/css?family=Droid+Sans" rel="stylesheet" />
            <link rel="stylesheet" href="css/dashboard-new.css">
            <link rel="stylesheet" href="css/patient.css">
            <link rel="stylesheet" href="css/lab.css">

        </head>
        <body>
            <aside class="side-nav" id="show-side-navigation1">
                <i class="fa fa-bars close-aside hidden-sm hidden-md hidden-lg" data-close="show-side-navigation1"></i>
                <div class="heading">
                    <div class="col-md-12">
                        <div class="row" style="margin-bottom: 20px">
                            <img class="center-block"  src="media/admin.svg" alt="user-image" width="250px" />
                        </div>
                        <div class="row">
                            <div class="info">
                                <h3>
                                    <a href="#">
                                        <i class="fa fa-user user-icone" style="color:darkgrey" ></i> <%= admin.getFirstName() + " " + admin.getLastName()%>
                                    </a>
                                </h3>
                                <h3>
                                    <a href="#">
                                        <i class="fa fa-mars-stroke user-icone" style="color: greenyellow"></i> <%= admin.getGender() + ", " + admin.getAge()%>
                                    </a>
                                </h3>
                                <h3>
                                    <a href="#">
                                        <i class="fa fa-home user-icone" style="color: #ffc107"></i> <%= admin.getAddress()%>
                                    </a>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
                <ul class="categories" >
                    <li class="labReports activeReports tag-name" id="openHome">
                        <i class="fa fa-plus fa-fw" aria-hidden="true" ></i>Dashboard
                    </li>
                    <li class="labReports tag-name" id="openPatients">
                        <i class="fa fa-plus fa-fw" aria-hidden="true" ></i>Patients
                    </li>
                    <li class="labReports tag-name" id="openDoctors">
                        <i class="fa fa-plus fa-fw" aria-hidden="true" ></i>Doctors
                    </li>
                    <li class="labReports tag-name" id="openStaff">
                        <i class="fa fa-plus fa-fw" aria-hidden="true" ></i>Staff
                    </li>
                    <li class="labReports tag-name" id="openAppointments">
                        <i class="fa fa-plus fa-fw" aria-hidden="true" ></i>Appointments
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
                                    <a href="updateAdminProfile"><i class="fa fa-user-o fa-fw"></i> Edit Profile</a>
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
                                    <h2>Hello <%= admin.getFirstName()%>, Welcome to Admin Dashboard</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <section class="statistics">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="" id="home">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="box">
                                            <i class="fa fa-envelope fa-fw bg-primary"></i>
                                            <div class="info">
                                                <h3>
                                                    <%=patients.size()%>
                                                </h3>
                                                <p>Patients</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="box">
                                            <i class="fa fa-line-chart fa-fw danger"></i>
                                            <div class="info">
                                                <h3>
                                                    <%=doctors.size()%>
                                                </h3>
                                                <p>Doctors</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="box">
                                            <i class="fa fa-medkit fa-fw success"></i>
                                            <div class="info">
                                                <h3>
                                                    <%=staffs.size()%>
                                                </h3>
                                                <p>Staffs</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="box">
                                            <i class="fa fa-user fa-fw bg-primary"></i>
                                            <div class="info">
                                                <h3>
                                                    <%=appointments.size()%>
                                                </h3>
                                                <p>Appointments</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
                            <div class="" id="patients" style="display: none;">
                                <table class="table table-hover">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>Id</th>
                                            <th>username</th>
                                            <th>First name</th>
                                            <th>last name</th>
                                            <th>Date of Birth</th>
                                            <th>Gender</th>
                                            <th>Address</th>
                                            <th>Contact Number</th>
                                            <th>Height</th>
                                            <th>Weight</th>
                                            <th>Blood Group</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (int i = 0; i < patients.size(); i++) {
                                                Patient person = patients.get(i);
                                        %>
                                        <tr>
                                            <td><%= person.getId()%></td>
                                            <td><%= person.getUserName()%></td>
                                            <td><%= person.getFirstName()%></td>
                                            <td><%= person.getLastName()%></td>
                                            <td><%= person.getStringDob()%></td>
                                            <td><%= person.getGender()%></td>
                                            <td><%= person.getAddress()%></td>
                                            <td><%= person.getContactNumber()%></td>
                                            <td><%= person.getHeight()%></td>
                                            <td><%= person.getWeight()%></td>
                                            <td><%= person.getBloodGroup()%></td>
                                        </tr>
                                        <%} %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="" id="doctors" style="display: none;">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>username</th>
                                            <th>First name</th>
                                            <th>last name</th>
                                            <th>Date of Birth</th>
                                            <th>Gender</th>
                                            <th>Address</th>
                                            <th>Contact Number</th>
                                            <th>Degree</th>
                                            <th>Specialization</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (int i = 0; i < doctors.size(); i++) {
                                                Doctor person = doctors.get(i);
                                        %>
                                        <tr>
                                            <td><%= person.getId()%></td>
                                            <td><%= person.getUserName()%></td>
                                            <td><%= person.getFirstName()%></td>
                                            <td><%= person.getLastName()%></td>
                                            <td><%= person.getStringDob()%></td>
                                            <td><%= person.getGender()%></td>
                                            <td><%= person.getAddress()%></td>
                                            <td><%= person.getContactNumber()%></td>
                                            <td><%= person.getDegree()%></td>
                                            <td><%= person.getSpecialization()%></td>
                                        </tr>
                                        <%} %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="" id="staffs" style="display: none;">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>username</th>
                                            <th>First name</th>
                                            <th>last name</th>
                                            <th>Date of Birth</th>
                                            <th>Gender</th>
                                            <th>Address</th>
                                            <th>Contact Number</th>
                                            <th>Designation</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (int i = 0; i < staffs.size(); i++) {
                                                Staff person = staffs.get(i);
                                        %>
                                        <tr>
                                            <td><%= person.getId()%></td>
                                            <td><%= person.getUserName()%></td>
                                            <td><%= person.getFirstName()%></td>
                                            <td><%= person.getLastName()%></td>
                                            <td><%= person.getStringDob()%></td>
                                            <td><%= person.getGender()%></td>
                                            <td><%= person.getAddress()%></td>
                                            <td><%= person.getContactNumber()%></td>
                                            <td>
                                                <% if (person.getUserType() == 3) { %>
                                                Admin
                                                <%} else if (person.getUserType() == 4) { %>
                                                Lab Person
                                                <%} else if (person.getUserType() == 5) { %>
                                                Receptionist
                                                <%} %>	
                                            </td>
                                        </tr>
                                        <%} %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="" id="appointments" style="display: none;">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Title</th>
                                            <th>Doctor</th>
                                            <th>Patient</th>
                                            <th>Status</th>
                                            <th>Preferred Date</th>
                                            <th>Allocated Date</th>
                                            <th>Date Created</th>
                                            <th>Symptons</th>
                                            <th>Disease</th>					    
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (int i = 0; i < appointments.size(); i++) {
                                                Appointment appointment = appointments.get(i);
                                        %>
                                        <tr>
                                            <td><%= appointment.getId()%></td>
                                            <td><%= appointment.getTitle()%></td>
                                            <% if (appointment.getDoctor() == null) { %>
                                            <td>Not Allocated</td>
                                            <%} else {%>
                                            <td><%= appointment.getDoctor().getFirstName()%></td>
                                            <%
                                                }%>

                                            <td><%= appointment.getPatient().getFirstName()%></td>
                                            <td>
                                                <% if (appointment.getIsClosed() == 1) { %>
                                                Closed
                                                <%} else { %>
                                                In progress
                                                <%}%>	
                                            </td>
                                            <td><%= appointment.getStringPreferredDate()%></td>
                                            <td><%= appointment.getStringAllocatedDate()%></td>
                                            <td><%= appointment.getStringDateCreated()%></td>
                                            <td><%= appointment.getSymptons()%></td>
                                            <td><%= appointment.getDisease()%></td>
                                        </tr>
                                        <%} %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </section>
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
                $('#openPatients').on('click', function () {
                    $("#patients").show();
                    $("#doctors").hide();
                    $("#staffs").hide();
                    $("#home").hide();
                    $("#appointments").hide();
                    $("#openPatients").addClass("activeReports");
                    $("#openDoctors").addClass("notActiveReports");
                    $("#openStaff").addClass("notActiveReports");
                    $("#openAppointments").addClass("notActiveReports");
                    $("#openHome").addClass("notActiveReports");
                });
            </script>
            <script type="text/javascript">
                $('#openDoctors').on('click', function () {
                    $("#patients").hide();
                    $("#doctors").show();
                    $("#staffs").hide();
                    $("#appointments").hide();
                    $("#home").hide();
                    $("#openPatients").addClass("notActiveReports");
                    $("#openDoctors").addClass("activeReports");
                    $("#openStaff").addClass("notActiveReports");
                    $("#openAppointments").addClass("notActiveReports");
                    $("#openHome").addClass("notActiveReports");
                });
            </script>
            <script type="text/javascript">
                $('#openStaff').on('click', function () {
                    $("#patients").hide();
                    $("#doctors").hide();
                    $("#staffs").show();
                    $("#appointments").hide();
                    $("#home").hide();
                    $("#openPatients").addClass("notActiveReports");
                    $("#openDoctors").addClass("notActiveReports");
                    $("#openStaff").addClass("activeReports");
                    $("#openAppointments").addClass("notActiveReports");
                    $("#openHome").addClass("notActiveReports");
                });
            </script>
            <script type="text/javascript">
                $('#openAppointments').on('click', function () {
                    $("#patients").hide();
                    $("#doctors").hide();
                    $("#staffs").hide();
                    $("#appointments").show();
                    $("#home").hide();
                    $("#openPatients").addClass("notActiveReports");
                    $("#openDoctors").addClass("notActiveReports");
                    $("#openStaff").addClass("notActiveReports");
                    $("#openAppointments").addClass("activeReports");
                    $("#openHome").addClass("notActiveReports");
                });
            </script>
            <script type="text/javascript">
                $('#openHome').on('click', function () {
                    $("#patients").hide();
                    $("#doctors").hide();
                    $("#staffs").hide();
                    $("#appointments").hide();
                    $("#home").show();
                    $("#openPatients").addClass("notActiveReports");
                    $("#openDoctors").addClass("notActiveReports");
                    $("#openStaff").addClass("notActiveReports");
                    $("#openAppointments").addClass("notActiveReports");
                    $("#openHome").addClass("activeReports");
                });
            </script>
        </body>
    </html>
    <%
        }
    %>