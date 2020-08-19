<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico" type="image/ico" />

<title>Online Exam Portal |</title>

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
html, body {
	overflow-x: hidden;
	font-family: 'Lato', sans-serif;
	width: 100%;
}

a {
	text-decoration: none;
}

ul {
	list-style-type: none;
}

a:hover, a:focus {
	text-decoration: none;
}

h1, h2, h3, h4, h5, h6 {
	text-transform: none;
	font-weight: 600;
	font-family: 'Lato', sans-serif;
	text-align: center;
}

hr {
	border-color: #ffc266;
	border-width: 5px;
	max-width: 100%;
}

.container-h1 {
	font-family: 'Lora', serif;
	text-align: center;
	font-size: 50px;
	font-weight: 700;
	margin: 50px auto;
	color: #333;
	font-family: 'Ubuntu', sans-serif;
}

.hr-h3s {
	border: 3px solid #E94B3C;
	width: 70px;
	margin: 0 auto 35px auto;
}

textarea {
	resize: none;
}

section {
	align-items: center;
	padding: 50px 60px;
}

.bg-section h2 {
	font-family: 'Montserrat', sans-serif;
	text-transform: none;
	color: #ffc266;
	background-color: #182c39;
	margin: 50px 0;
	padding: 25px 20px;
	border-radius: 50px;
}

.slideanim {
	visibility: hidden;
}

.slide {
	animation-name: slide;
	-webkit-animation-name: slide;
	-moz-animation-name: slide;
	animation-duration: 1.5s;
	-webkit-animation-duration: 1.5s;
	-moz-animation-duration: 1.5s;
	visibility: visible;
}

@
keyframes slide { 0% {
	opacity: 0;
	transform: translateX(50%);
}

100%
{
opacity:1;
transform


translateX(0%);
}
}
@
-webkit-keyframes slide { 0% {
	opacity: 0;
	-webkit-transform: translateX(50%);
	transform: translateX(50%);
}

100%
{
opacity

:


1;
-webkit-transform




:



translateX



(0%);
transform

:


translateX

(0%);
}
}

/*  ******* Header + Navigation ******* */
.jumbotron {
	margin-bottom: 0px;
	background-image:
		url('OEP/WebContent/images/configimages/indexImage.jpg');
	background-position: 0% 25%;
	background-size: cover;
	background-repeat: no-repeat;
	color: white;
	text-shadow: black 0.3em 0.3em 0.3em;
	height: 300px;
}

.jumbotron .header-content-inner {
	font-weight: 700;
	text-transform: none;
	font-family: 'Roboto', sans-serif;
}

.jumbotron h1 {
	font-size: 45px;
}

.jumbotron h3 {
	font-size: 25px;
}

/* ******* About ******* */
.bg-about {
	margin: auto 50px;
	background-color: white;
}

#about h3 {
	font-family: 'Roboto', sans-serif;
	color: #E94B3C;
}
</style>




<!-- Bootstrap CSS
        ============================================ -->
<link rel="stylesheet" href="/bootstrap.min.css">

<!-- normalize CSS
        ============================================ -->
<link rel="stylesheet"
	href="../vendors/table-design/bootstrap-table.css">

<!-- jquery
            ============================================ -->
<script src="../vendors/table-design/jquery-1.11.3.min.js"></script>
<!-- bootstrap JS
        ============================================ -->
<script src="../vendors/table-design/bootstrap.min.js"></script>

<!-- data table JS
        ============================================ -->
<script src="../vendors/table-design/bootstrap-table.js"></script>
<script src="../vendors/table-design/tableExport.js"></script>
<script src="../vendors/table-design/data-table-active.js"></script>
<script src="../vendors/table-design/bootstrap-table-editable.js"></script>
<script src="../vendors/table-design/bootstrap-editable.js"></script>
<script src="../vendors/table-design/bootstrap-table-resizable.js"></script>
<script src="../vendors/table-design/colResizable-1.5.source.js"></script>
<script src="../vendors/table-design/bootstrap-table-export.js"></script>



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
						//request.setAttribute("pic", session.getAttribute("pic").toString());
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
										<li><a href="uploadScannedPaper.jsp">Upload Answer
												Sheets</a></li>
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
							href="../LoginCOE.jsp"> <span class="glyphicon glyphicon-off"
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
							aria-expanded="false"> <img
								src="data:image/jpeg;base64,${pic}" alt=""><%=session.getAttribute("logedID")%>
						</a>
							<div class="dropdown-menu dropdown-usermenu pull-right"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="coeProfile.jsp"> Profile</a> <a
									class="dropdown-item" href="javascript:;"> <span>Settings</span>
								</a> <a class="dropdown-item" href="javascript:;">Help</a> <a
									class="dropdown-item" href="../LoginCOE.jsp"><i
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
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12  ">
							<div class="x_panel">
								<div class="x_content">
									<div class="container">
										<div class="row justify-content-center">
											<div class="col-md-6">
												<div class="card">
													<header class="card-header">
													<h4 class="card-title mt-2">Promote Students</h4>
													</header>
													<article class="card-body">
													<form action="../promoteServlet" method="post">

														<!-- form-group end.// -->
														<div class="form-row">
															<div class="form-group col-md-6">
																<label>Student Course</label><select id="inputType"
																	name="currentCourse" class="form-control">
																	<%
																		try {

																			String dbUrl = "jdbc:mysql://localhost/oep_db";
																			String driverName = "com.mysql.jdbc.Driver";
																			Class.forName(driverName);
																			Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
																			PreparedStatement ps2 = (PreparedStatement) connection
																					.prepareStatement("SELECT semName,semID FROM coursesemister cs,courses c WHERE cs.courseID=c.courseID AND c.InstuID=?");
																			//Integer num=(Integer)session.getAttribute("instuID");
																			ps2.setInt(1, Integer.parseInt(session.getAttribute("instuID").toString()));
																			ResultSet rs2 = ps2.executeQuery();
																			int rec = 0;
																			while (rs2.next()) {
																				rec++;
																	%>

																	<option value=<%=rs2.getString(2)%>><%=rs2.getString(1)%></option>
																	<%
																		}
																	%>

																</select>
															</div>

															<%
																if (rec == 0) {
															%>
															<h3>No Pending Uploads</h3>

															<%
																}
																} catch (

																Exception e) {
																	e.printStackTrace();
																}
															%>
															<!-- form-group end.// -->
															<div class="form-group col-md-6">
																<label>Promote To</label> <select id="inputType"
																	name="promoteCourse" class="form-control">
																	<%
																		try {

																			String dbUrl = "jdbc:mysql://localhost/oep_db";
																			String driverName = "com.mysql.jdbc.Driver";
																			Class.forName(driverName);
																			Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
																			PreparedStatement ps3 = (PreparedStatement) connection
																					.prepareStatement("SELECT semName,semID FROM coursesemister cs,courses c WHERE cs.courseID=c.courseID AND c.InstuID=?");

																			//(Integer)session.getAttribute("instuID");
																			ps3.setInt(1, Integer.parseInt(session.getAttribute("instuID").toString()));
																			ResultSet rs3 = ps3.executeQuery();
																			int rec = 0;
																			while (rs3.next()) {
																				rec++;
																	%>
																	<option value=<%=rs3.getString(2)%>><%=rs3.getString(1)%></option>
																	<%
																		}
																	%>

																</select>
															</div>

															<%
																if (rec == 0) {
															%>
															<h3>No Pending Uploads</h3>

															<%
																}
																} catch (Exception e) {
																	e.printStackTrace();
																}
															%>
															<!-- form-group end.// -->
														</div>
														<br> <br>
														<!-- form-group end.// -->
														<div class="form-group">
															<button type="submit" class="btn btn-primary btn-block">
																Promote All Students</button>
														</div>
														<!-- form-group// -->

													</form>
													</article>
													<!-- card-body end .// -->
													<div class="border-top card-body text-center">
														FAQ about Promote Students? <a href="">Click Here</a>
													</div>
												</div>
												<!-- card.// -->
											</div>
											<!-- col.//-->

										</div>
										<!-- row.//-->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				
				
				<table id="table" data-toggle="table" data-pagination="true"
					data-search="true" data-show-columns="true"
					data-show-pagination-switch="true"
				    data-cookie="true"
					data-cookie-id-table="saveId">

					<thead>

						<tr>
							<th data-field="state" data-checkbox="true"></th>
							<th data-field="sl">Sl</th>
							<th data-field="name" data-editable="false">Name</th>
							<th data-field="reg" data-editable="false">Reg No.</th>
							<th data-field="email" data-editable="false">EmailID</th>
							<th data-field="course" data-editable="false">Course</th>
							<th data-field="update" data-editable="false">Update</th>
							<th data-field="delete" data-editable="false">Delete</th>
							

						</tr>
					</thead>
					<tbody>


						<%
							int sl=0;
							try {

								String dbUrl = "jdbc:mysql://localhost/oep_db";
								String driverName = "com.mysql.jdbc.Driver";
								Class.forName(driverName);
								Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
								PreparedStatement ps3 = (PreparedStatement) connection.prepareStatement(
										"SELECT * FROM students WHERE instuID=? ORDER BY courseSemID");
								ps3.setString(1, session.getAttribute("instuID").toString());
								ResultSet rs3 = ps3.executeQuery();
								while (rs3.next()) {
									++sl;
									PreparedStatement ps4 = (PreparedStatement) connection.prepareStatement(
											"SELECT semName FROM coursesemister WHERE semId=?");
									ps4.setInt(1, rs3.getInt(5));
									ResultSet rs4 = ps4.executeQuery();
									rs4.next();
									
									
						%>


						<tr>
							<td></td>
							<td><%=sl%></td>
							<td><%=rs3.getString(3)%></td>
							<td><%=rs3.getString(2)%></td>
							<td><%=rs3.getString(8)%></td>
							<td><%=rs4.getString(1)%></td>
							<td><a href="updateStudent.jsp?instuID=<%=session.getAttribute("instuID").toString() %>&studID=<%=rs3.getString(2)%>&studName=<%=rs3.getString(3)%>&studEmail=<%=rs3.getString(8)%>&studCourse=<%=rs4.getString(1)%>&op=update" class="btn btn-primary">Update Student</a></td>
							<td><a href="updateStudent.jsp?instuID=<%=session.getAttribute("instuID").toString() %>&studID=<%=rs3.getString(2)%>&op=delete" class="btn btn-primary">Delete Student</a></td>
						</tr>
						<%
							}

								
							} catch (Exception e) {
								e.printStackTrace();
							}
						%>

					</tbody>
				</table>
				
				
				
				
				
			</div>
















			<!-- /page content -->

			<!-- footer content -->
			<footer>
			<div class="pull-right">Online Examination Portal - 2020</div>
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

</body>
</html>