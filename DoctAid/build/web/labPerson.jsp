<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="staff.modal.Staff, java.util.ArrayList, prescription.Lab" %>
<%
    if (request.getAttribute("labPerson") == null || request.getAttribute("labs") == null) {
        response.sendRedirect("labPerson");
    } else {
        Staff labPerson = (Staff) request.getAttribute("labPerson");
        ArrayList<ArrayList<Lab>> labs = (ArrayList<ArrayList<Lab>>) request.getAttribute("labs");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LabPerson Dashboard - DoctAidr</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Droid+Sans" rel="stylesheet" />
        <link rel="stylesheet" href="css/dashboard-new.css">
        <link rel="stylesheet" href="css/lab.css">
    </head>
    <body>
        <aside class="side-nav" id="show-side-navigation1">
            <i class="fa fa-bars close-aside hidden-sm hidden-md hidden-lg" data-close="show-side-navigation1"></i>
            <div class="heading">
                <div class="col-md-12">
                    <div class="row" style="margin-bottom: 20px">
                        <img class="center-block"  src="media/labPerson.svg" alt="user-image" width="200px" />
                    </div>
                    <div class="row">
                        <div class="info">
                            <h3>
                                <a href="#">
                                    <i class="fa fa-user user-icone" style="color:darkgrey" ></i> <%= labPerson.getFirstName() + " " + labPerson.getLastName()%>
                                </a>
                            </h3>
                            <h3>
                                <a href="#">
                                    <i class="fa fa-mars-stroke user-icone" style="color: greenyellow"></i> <%= labPerson.getGender() + ", " + labPerson.getAge()%>
                                </a>
                            </h3>
                            <h3>
                                <a href="#">
                                    <i class="fa fa-home user-icone" style="color: #ffc107"></i> <%= labPerson.getAddress()%>
                                </a>
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
            <ul class="categories">
                <li lass="labReports activeReports" id="openLabReports"> 
                    <i class="fa fa-plus fa-fw" aria-hidden="true" ></i>OpenLab Reports
                </li>
                <li class="labReports" id="closedLabReports">
                    <i class="fa fa-plus fa-fw" aria-hidden="true"></i>Closed Reports
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
                                <a href="updateLabPersonProfile"><i class="fa fa-user-o fw"></i> Edit Profile</a>
                            </li>
                            <li class="nav-item">
                                <a href="logout" ><i class="fa fa-sign-out"></i> Log out</a>
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
                                <h2>Hello <%= labPerson.getFirstName()%>, Welcome to Lab Dashboard</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <section class="statistics">
                <div class="container-fluid">
                    <div class="row tableHere">
                        <div id="openLabs">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Report Id</th>
                                        <th>Doctor Name</th>
                                        <th>Lab Name</th>
                                        <th>Test For</th>
                                        <th>Lab Result</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% ArrayList<Lab> openLabs = labs.get(0);
                                        for (int i = 0; i < openLabs.size(); i++) {
                                            Lab lab = openLabs.get(i);
                                    %>
                                    <tr>
                                        <td class="padding-up" style="color: #222222"><%=lab.getLabId()%></td>
                                        <td class="padding-up" style="color: #222222"><%=lab.getDoctor().getFirstName()%></td>
                                        <td class="padding-up" style="color: #222222"><%=lab.getLabName()%></td>
                                        <td class="padding-up" style="color: #222222"><%=lab.getTestFor()%></td>
                                <form action="submitLabReport" method="post">
                                    <input type="hidden" name="labId"
                                           value="<%= lab.getLabId()%>">
                                    <input type="hidden" name="itemId"
                                           value="<%= lab.getItemId()%>">
                                    <td><input type="text" class="form-control"
                                               placeholder="Result" name="result" required></td>
                                    <td><button type="submit" class="btn btn-default">Submit</button></td>
                                </form>
                                </tr>
                                <% } %>
                                </tbody>
                            </table>
                        </div>
                        <div id="closedLabs" style="display: none;">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Report Id</th>
                                        <th>Doctor Name</th>
                                        <th>Lab Name</th>
                                        <th>Test For</th>
                                        <th>Lab Result</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% ArrayList<Lab> closedLabs = labs.get(1);
                                        for (int i = 0; i < closedLabs.size(); i++) {
                                            Lab lab = closedLabs.get(i);
                                    %>
                                    <tr>
                                        <td class="padding-up" style="color: #222222"><%=lab.getLabId()%></td>
                                        <td class="padding-up" style="color: #222222"><%=lab.getDoctor().getFirstName()%></td>
                                        <td class="padding-up" style="color: #222222"><%=lab.getLabName()%></td>
                                        <td class="padding-up" style="color: #222222"><%=lab.getTestFor()%></td>
                                        <td class="padding-up" style="color: #222222"><%=lab.getLabResult()%></td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
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
            $('#closedLabReports').on('click', function () {
                $("#closedLabs").show();
                $("#openLabs").hide();
                $("#closedLabReports").toggleClass("activeReports");
                $("#openLabReports").toggleClass("notActiveReports");
            });
        </script>
        <script type="text/javascript">
            $('#openLabReports').on('click', function () {
                $("#closedLabs").hide();
                $("#openLabs").show();
                $("#closedLabReports").toggleClass("notActiveReports");
                $("#openLabReports").toggleClass("activeReports");
            });
        </script>
    </body>
</html>
<%
    }
%>