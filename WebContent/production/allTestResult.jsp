<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- Bootstrap -->
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<!-- bootstrap-progressbar -->
<link
	href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link href="../vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="../build/css/custom.min.css" rel="stylesheet">

<style type="text/css">
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body class="nav-md">
<%
if(session.getAttribute("logedID").toString().equals("LOGOUT"))
{
	response.sendRedirect("index.jsp");
}
%>
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="index.html" class="site_title"><i class="fa fa-paw"></i>
							<span>O_E_P</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img src="data:image/jpeg;base64,${pic}" alt="..."
								class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<h2><%=session.getAttribute("logedID")%></h2>
						</div>
					</div>
					<%
					request.setAttribute("pic",session.getAttribute("pic").toString());

					%>
					
					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<h3>General</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-home"></i> Home <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="/OEP/production/indexCOE.jsp"><b>Home</b>
										</a></li>
									</ul></li>
								<li><a><i class="fa fa-edit"></i> Add New <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="addCourses.jsp">Add Course</a></li>
										<li><a href="addSubjects.jsp">Add Subject</a></li>
										<li><a href="addStudents.jsp">Add Students</a></li>
										<li><a href="addTeachers.jsp">Add Teachers</a></li>
									</ul></li>
								<li><a><i class="fa fa-desktop"></i> Exams<span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="newExam.jsp">Schedule Exams</a></li>
										<li><a href="uploadStatus.jsp">Upload Status</a></li>
										<li><a href="enableExams.jsp">Enable Exams</a></li>
										<li><a href="uploadScannedPaper.jsp">Upload Answer Sheets</a></li>
									</ul></li>
								<li><a><i class="fa fa-table"></i> Test Results <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="announceResult.jsp">Announce Result</a></li>
										<li><a href="closeResult.jsp">Close Result</a></li>

									</ul></li>
								<li><a><i class="fa fa-table"></i> Data Tables <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="allTestResult.jsp">Test Results</a></li>
										<li><a href="studentsInfo.jsp">Students</a></li>
										<li><a href="lecturersInfo.jsp">Lecturers</a></li>
									</ul></li>
								
								<li><a><i class="fa fa-laptop"></i>Upcomming service<span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="discission.jsp">Discusions</a></li>
										<li><a href="eLearning.jsp">E-Learning</a></li>
									</ul></li>
							</ul>
						</div>
						<div class="menu_section">
							<h3>Communication</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-bug"></i> Help <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="aboutOEP.jsp">About OEP</a></li>
										<li><a href="OEPContact.jsp">Contacts</a></li>

									</ul></li>
							</ul>
						</div>
					</div>
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->
					<div class="sidebar-footer hidden-small">
						<a data-toggle="tooltip" data-placement="top" title="Settings">
							<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="FullScreen">
							<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Lock"> <span
							class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Logout"
							href="index.jsp"> <span class="glyphicon glyphicon-off"
							aria-hidden="true"></span>
						</a>
					</div>
					<!-- /menu footer buttons -->
				</div>
			</div>
			<center>
				<%
				
					String instuAddrDetails = session.getAttribute("instuName") + "," + session.getAttribute("instuAddr") + "-"
							+ session.getAttribute("instuZip");
				%>
				<h3 style="color: #FFFFFF"><%=instuAddrDetails%></h3>
			</center>

			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<div class="nav toggle">
						<a id="menu_toggle"><i class="fa fa-bars"></i></a>
					</div>
					<nav class="nav navbar-nav">
					<ul class=" navbar-right">
						<li class="nav-item dropdown open" style="padding-left: 15px;">
							<a href="javascript:;" class="user-profile dropdown-toggle"
							aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown"
							aria-expanded="false"> <img src="data:image/jpeg;base64,${pic}" alt=""><%=session.getAttribute("logedID")%>
						</a>
							<div class="dropdown-menu dropdown-usermenu pull-right"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="coeProfile.jsp"> Profile</a> <a
									class="dropdown-item" href="javascript:;"> <span>Settings</span>
								</a> <a class="dropdown-item" href="javascript:;">Help</a> <a
									class="dropdown-item" href="index.jsp"><i
									class="fa fa-sign-out pull-right"></i> Log Out</a>
							</div>
						</li>

						<li role="presentation" class="nav-item dropdown open">
							<ul class="dropdown-menu list-unstyled msg_list" role="menu"
								aria-labelledby="navbarDropdown1">
								<li class="nav-item"><a class="dropdown-item"> <span
										class="image"><img src="images/img.jpg"
											alt="Profile Image" /></span> <span> <span>John Smith</span>
											<span class="time">3 mins ago</span>
									</span> <span class="message"> Film festivals used to be
											do-or-die moments for movie makers. They were where... </span>
								</a></li>
								<li class="nav-item"><a class="dropdown-item"> <span
										class="image"><img src="images/img.jpg"
											alt="Profile Image" /></span> <span> <span>John Smith</span>
											<span class="time">3 mins ago</span>
									</span> <span class="message"> Film festivals used to be
											do-or-die moments for movie makers. They were where... </span>
								</a></li>
								<li class="nav-item"><a class="dropdown-item"> <span
										class="image"><img src="images/img.jpg"
											alt="Profile Image" /></span> <span> <span>John Smith</span>
											<span class="time">3 mins ago</span>
									</span> <span class="message"> Film festivals used to be
											do-or-die moments for movie makers. They were where... </span>
								</a></li>
								<li class="nav-item"><a class="dropdown-item"> <span
										class="image"><img src="images/img.jpg"
											alt="Profile Image" /></span> <span> <span>John Smith</span>
											<span class="time">3 mins ago</span>
									</span> <span class="message"> Film festivals used to be
											do-or-die moments for movie makers. They were where... </span>
								</a></li>
								<li class="nav-item">
									<div class="text-center">
										<a class="dropdown-item"> <strong>See All Alerts</strong>
											<i class="fa fa-angle-right"></i>
										</a>
									</div>
								</li>
							</ul>
						</li>
					</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->
			
			
			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>All Exams Evaluation</h3>
						</div>


					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12  ">
							<div class="x_panel">
								<div class="x_title">
									<h2>Select Test To Evaluate</h2>
									<ul class="nav navbar-right panel_toolbox">

									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">


									<table id="customers">
										<tr>
											<th>Test ID</th>
											<th>Subject Code</th>
											<th>Subject Name</th>
											<th>Test Name</th>
											<th>Status</th>
											<th>Action</th>
										</tr>

										<%
											try {

												String dbUrl = "jdbc:mysql://localhost/oep_db";
												String driverName = "com.mysql.jdbc.Driver";
												Class.forName(driverName);
												Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
												PreparedStatement ps2 = (PreparedStatement) connection.prepareStatement(
														"SELECT * FROM exams LEFT JOIN subjects ON exams.subjectID=subjects.subjectID WHERE status='Result Announced' AND InstuID=?");
												ps2.setString(1, session.getAttribute("instuID").toString());
												ResultSet rs2 = ps2.executeQuery();
												int rec = 0;
												while (rs2.next()) {
													rec++;
										%>
										<tr>
											<td><%=rs2.getString(1)%></td>
											<td><%=rs2.getString(3)%></td>
											<td><%=rs2.getString(11)%></td>
											<td><%=rs2.getString(4)%></td>
											<td><%=rs2.getString(9)%></td>
											<td><a
												href="oneTestResult.jsp?testID=<%=rs2.getString(1)%>"
												class="btn btn-info">View</a>
												<a
												href="../TestBarChart?testID=<%=rs2.getString(1)%>"
												class="btn btn-info">View In Chart</a></td>
										</tr>
										<%
											}
												if (rec == 0) {
										%>
										<tr>
											<td colspan="6"><center>No Resultss Found</center></td>
										</tr>
										<%
											}

											} catch (Exception e) {
												e.printStackTrace();
											}
										%>
									</table>



								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->


			<!-- footer content -->
			<footer>
			<div class="pull-right">
				Online Examination Portal <a href="#">,(c) all rights
					reserved-2020</a>
			</div>
			<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>

	<!-- jQuery -->
	<script src="../vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- FastClick -->
	<script src="../vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="../vendors/nprogress/nprogress.js"></script>
	<!-- Chart.js -->
	<script src="../vendors/Chart.js/dist/Chart.min.js"></script>
	<!-- gauge.js -->
	<script src="../vendors/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="../vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script src="../vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script src="../vendors/Flot/jquery.flot.js"></script>
	<script src="../vendors/Flot/jquery.flot.pie.js"></script>
	<script src="../vendors/Flot/jquery.flot.time.js"></script>
	<script src="../vendors/Flot/jquery.flot.stack.js"></script>
	<script src="../vendors/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script src="../vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script src="../vendors/DateJS/build/date.js"></script>
	<!-- JQVMap -->
	<script src="../vendors/jqvmap/dist/jquery.vmap.js"></script>
	<script src="../vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script src="../vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="../vendors/moment/min/moment.min.js"></script>
	<script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="../build/js/custom.min.js"></script>
</html>