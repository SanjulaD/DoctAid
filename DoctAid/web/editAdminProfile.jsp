
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page
    import="staff.modal.Staff"%>
    <%
        if (request.getAttribute("admin") == null) {
            response.sendRedirect("admin");
        } else {
            Staff admin = (Staff) request.getAttribute("admin");
    %>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Edit Profile - Admin Dashboard - DoctAid</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
            <link href="https://fonts.googleapis.com/css?family=Droid+Sans" rel="stylesheet" />
            <link rel="stylesheet" href="css/dashboard-new.css">
            <link rel="stylesheet" href="css/patient.css">
            <link rel="stylesheet" href="css/lab.css">
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
                        <i class="fa fa-plus fa-fw" aria-hidden="true" ></i><a href="admin">Home</a>
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
                <div class="container-fluid">
                    <div class="welcome">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="content">
                                        <h2>Hello <%= admin.getFirstName()%>, Edit your profile here</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <h4 class="imfo-header sub-header">Personal Information</h4>
                            <form class="form-contact form-horizontal" action="editAdminProfile"
                                  method="post">
                                <div class="form-group">
                                    <label for="firstName" class="col-sm-2 control-label">First
                                        Name</label>
                                    <div class="col-sm-10">
                                        <p class="form-control-static"><%= admin.getFirstName()%></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="lastName" class="col-sm-2 control-label">Last
                                        Name</label>
                                    <div class="col-sm-10">
                                        <p class="form-control-static"><%= admin.getLastName()%></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="gender" class="col-sm-2 control-label">Gender</label>
                                    <div class="col-sm-10">
                                        <p class="form-control-static"><%= admin.getGender()%></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="date" class="col-sm-2 control-label">Date Of
                                        Birth</label>
                                    <div class="col-sm-10">
                                        <input type="date" class="form-control" name="dob" id="date"
                                               placeholder="Date" value="<%= admin.getStringDob()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="phoneNumber" class="col-sm-2 control-label">Phone
                                        Number</label>
                                    <div class="col-sm-10">
                                        <input type="tel" class="form-control"
                                               name="contactNumber" id="phoneNumber"
                                               placeholder="+91 9521113802"
                                               value="<%= admin.getContactNumber()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="address" class="col-sm-2 control-label">Address</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" rows="2" name="address"
                                                  placeholder="BH-3, The LNMIIT"> <%= admin.getAddress()%></textarea>
                                    </div>
                                </div>
                                <h4 class="sub-header">Account Information</h4>
                                <div class="form-group">
                                    <label for="userName" class="col-sm-2 control-label">User
                                        Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="userName"
                                               placeholder="rakeshsharma" value="<%= admin.getUserName()%>">
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
                                        <button type="submit" class="btn btn-default">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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