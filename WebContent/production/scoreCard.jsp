<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Bootstrap -->
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="../vendors/jquery/dist/jquery.min.js"></script>
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" href="images/favicon.ico" type="image/ico" />

<title>Score Card</title>

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
							<img src="images/user.png" alt="..."
								class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<h2><%=session.getAttribute("stdName")%></h2>
						</div>
					</div>
					<!-- /menu profile quick info -->

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
										<li><a href="indexStudent.jsp">UpComming Exams</a></li>
									</ul></li>
								<li><a><i class="fa fa-edit"></i> Attend Test<span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="AttendTestConfirm.jsp">Go To Test</a></li>


									</ul></li>



								<li><a><i class="fa fa-sitemap"></i> Test Result <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="studentAllResult.jsp">All Test Result<span
												class="fa fa-chevron"></span></a>
											<ul class="nav child_menu">
												<li><a href="scoreCard.jsp">Score Card<span
														class="fa fa-chevron"></span></a>
													<ul class="nav child_menu">
													</ul></li>
											</ul></li></li>
							</ul>
							</li>


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
							href="index.jsp"> <span
							class="glyphicon glyphicon-off" aria-hidden="true"></span>
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
							aria-expanded="false"> <img src="images/user.png" alt=""><%=session.getAttribute("stdName")%>
						</a>
							<div class="dropdown-menu dropdown-usermenu pull-right"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="javascript:;"> Profile</a> <a
									class="dropdown-item" href="javascript:;"> <span
									class="badge bg-red pull-right">50%</span> <span>Settings</span>
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

<%
String courseSemName = new String();
try {

	String dbUrl = "jdbc:mysql://localhost/oep_db";
	String driverName = "com.mysql.jdbc.Driver";
	Class.forName(driverName);
	
	
	Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
	PreparedStatement ps1 = (PreparedStatement) connection.prepareStatement(
			"SELECT semName from coursesemister WHERE semId=?");
	ps1.setInt(1, Integer.parseInt(session.getAttribute("stdCourseID").toString()));
	ResultSet rs1 = ps1.executeQuery();
	if(rs1.next()) {
		courseSemName=rs1.getString(1);
	}
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
			<div class="container">
				<br> <br>
				<center>
					<table class="table table-bordered"
						style="border: 3px solid black; background-color: white; width: 40%">
						<thead>
							<tr>
								<td class="bg-success"
									style="border: 2px solid black; text-align: center; color: white"
									colspan="4"><h3><%=instuAddrDetails%></h3></td>

							</tr>
							<tr>
								<td class="bg-success"
									style="border: none; text-align: right; color: white"><b>Full
										Name</b></td>
								<td class="bg-success" style="border: none; color: white"
									colspan="3">:&nbsp;&nbsp;<%=session.getAttribute("stdFullName") %></td>

							</tr>
							<tr>
								<td class="bg-success"
									style="border: none; text-align: right; color: white"><b>Register
										No.</b></td>
								<td class="bg-success" style="border: none; color: white"
									colspan="3">:&nbsp;&nbsp;<%=session.getAttribute("logedID") %></td>
							</tr>
							<tr>
								<td class="bg-success"
									style="border: none; text-align: right; color: white"><b>Course</b></td>
								<td class="bg-success" style="border: none; color: white"
									colspan="3">:&nbsp;&nbsp;<%=courseSemName %></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th style="border-top: 2px solid black;"><b>SUBJECT
										NAME</b></th>
								<th style="border-top: 2px solid black;"><b>SUBJECT
										CODE</b></th>
								<th style="border-top: 2px solid black;"><b>MAXIMUM
										MARKS</b></th>
								<th style="border-top: 2px solid black;"><b>OBTAINED
										MARKS</b></th>
							</tr>


							<%
								try {

									String dbUrl = "jdbc:mysql://localhost/oep_db";
									String driverName = "com.mysql.jdbc.Driver";
									Class.forName(driverName);
									String subject = new String();
									String subjecID = new String();
									int maxMark;
									int obtainedMarks = 0;
									int totMax = 0;
									int totobtain = 0;
									boolean absent = false;
									Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
									PreparedStatement ps3 = (PreparedStatement) connection.prepareStatement(
											"SELECT e.examID,s.subjectName,s.subjectID,e.totMarks FROM exams e,subjects s WHERE s.semID=? AND s.subjectID=e.subjectID AND e.status='Result Announced'");
									ps3.setString(1, session.getAttribute("stdCourseID").toString());
									ResultSet rs3 = ps3.executeQuery();
									while (rs3.next()) {
										subject = rs3.getString(2);
										subjecID = rs3.getString(3);
										maxMark = (int) rs3.getInt(4);
										totMax += maxMark;
										absent = false;

										PreparedStatement ps5 = (PreparedStatement) connection.prepareStatement(
												"SELECT (SELECT (SELECT COUNT(studID) FROM answermcq WHERE studID=? AND examID=?) + (SELECT COUNT(studID) FROM answerdescriptive WHERE studID=? AND examID=?)) as result");
										ps5.setString(1, session.getAttribute("logedID").toString());
										ps5.setString(2, rs3.getString(1));
										ps5.setString(3, session.getAttribute("logedID").toString());
										ps5.setString(4, rs3.getString(1));
										ResultSet rs5 = ps5.executeQuery();
										if (rs5.next()) {
											if (rs5.getInt(1) == 0) {
												absent = true;
											}
										}

										if (!absent) {
											PreparedStatement ps4 = (PreparedStatement) connection.prepareStatement(
													"SELECT (SELECT (SELECT SUM(marks) FROM answermcq WHERE studID=? AND examID=?) + (SELECT SUM(marks) FROM answerdescriptive WHERE studID=? AND examID=?)) as result ");
											ps4.setString(1, session.getAttribute("logedID").toString());
											ps4.setString(2, rs3.getString(1));
											ps4.setString(3, session.getAttribute("logedID").toString());
											ps4.setString(4, rs3.getString(1));
											ResultSet rs4 = ps4.executeQuery();
											if (rs4.next()) {
												obtainedMarks = rs4.getInt(1);
												totobtain += obtainedMarks;
											}
							%>


							<tr class="success">
								<td><%=subject%></td>
								<td><%=subjecID%></td>
								<td><%=maxMark%></td>
								<td><%=obtainedMarks%></td>
							</tr>

							<%
								}else
								{
									%>
									<tr class="success">
								<td><%=subject%></td>
								<td><%=subjecID%></td>
								<td><%=maxMark%></td>
								<td>ABSENT</td>
							</tr>
									<%
								}
										absent=false;
									}
							%>
							<tr class="active">
								<th colspan="2" style="border: 2px solid black;"><b>TOTAL</b>
								</td>
								<td style="border: 2px solid black;"><b><%=totMax%></b></td>
								<td style="border: 2px solid black;"><b><%=totobtain%></b></td>
							</tr>
						</tbody>
					</table>
					<%
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				</center>
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
</body>
</html>



