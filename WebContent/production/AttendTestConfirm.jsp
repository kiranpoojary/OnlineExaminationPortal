<%@page import="java.time.LocalDate"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>DataTables | Gentelella</title>

<!-- Bootstrap -->
<link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="../vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<!-- Datatables -->
<link
	href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
	rel="stylesheet">
<link
	href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="../build/css/custom.min.css" rel="stylesheet">


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



<title>Insert title here</title>
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
							<h2><%=session.getAttribute("stdName")%></h2>
						</div>
					</div>

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

								<li><a><i class="fa fa-table"></i> Test Results<span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="evalSelectSubject.jsp">Go To Test Result</a></li>


									</ul></li>
								<li><a><i class="fa fa-bar-chart-o"></i> Data
										Presentation <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="subjectResult.jsp">Subject Result</a></li>
										<li><a href="studentResult.jsp">Student Result</a></li>
										<li><a href="subjectResultChart.jsp">Subject result
												Charts</a></li>
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

			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Take Test</h3>
						</div>

					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 ">
							<div class="x_panel">
								<div class="x_title">

									<%
										LocalDate today = LocalDate.now();
										int found = 0;
										try {

											String dbUrl = "jdbc:mysql://localhost/oep_db";
											String driverName = "com.mysql.jdbc.Driver";
											Class.forName(driverName);
											Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
											PreparedStatement ps2 = (PreparedStatement) connection.prepareStatement(
													"SELECT * FROM exams e,subjects s,courses c WHERE e.subjectID=s.subjectID AND e.date=? AND e.status='Enabled' AND s.semID=? GROUP BY e.examID;");
											ps2.setString(1, today.toString());
											ps2.setInt(2, Integer.parseInt(session.getAttribute("courseID").toString()));
											ResultSet examDetails = ps2.executeQuery();
											if (examDetails.next()) {
												session.setAttribute("examID", examDetails.getString(1));
												session.setAttribute("examDuration", examDetails.getString(7));

												PreparedStatement ps6 = (PreparedStatement) connection.prepareStatement(
														"SELECT (SELECT COUNT(examID) FROM answermcq WHERE examID=? AND studID=?) + (SELECT COUNT(examID) FROM answerdescriptive WHERE examID=? AND studID=?) as tot");
												ps6.setString(1, examDetails.getString(1));
												ps6.setString(2, session.getAttribute("logedID").toString());
												ps6.setString(3, examDetails.getString(1));
												ps6.setString(4, session.getAttribute("logedID").toString());
												ResultSet attended = ps6.executeQuery();
												attended.next();
												found = attended.getInt(1);
												if (found == 0) {
									%>


									<h2>
										Test Details<small></small>
									</h2>








									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#">Settings 1</a> <a
													class="dropdown-item" href="#">Settings 2</a>
											</div></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									
									<%
					request.setAttribute("pic",session.getAttribute("pic").toString());

					%>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="col-md-3 col-sm-3  profile_left">
										<div class="profile_img">
											<div id="crop-avatar">
												<!-- Current avatar -->
												<img class="img-responsive avatar-view"
													src="data:image/jpeg;base64,${pic}" alt="Avatar"
													title="Change the avatar">
											</div>
										</div>
										
										<h3><%=session.getAttribute("stdName") %></h3>

										<ul class="list-unstyled user_data">

											<li><i class="fa fa-briefcase user-profile-icon"></i> <%=session.getAttribute("logedID")%></li>


											<li><i class="fa fa-briefcase user-profile-icon"></i> <%=session.getAttribute("instuName")%></li>

										</ul>



									</div>
									<div class="col-md-9 col-sm-9 ">

										<div class="profile_title">
											<div class="col-md-6">
												<h2><%=examDetails.getString(11)%></h2>
												<span><%=examDetails.getString(3)%></span>

											</div>
											<div class="col-md-6">
												<div id="" class="pull-right"
													style="margin-top: 5px; background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #E6E9ED">
													<a href="testPage.jsp" class="btn btn-primary">Attend
														Test Now</a>
												</div>
											</div>
										</div>
									</div>
								</div>


								<%
									} else {
								%>

								<div class="row">
									<h2>No Pending Exams</h2>
								</div>

								<%
									}

										} else {
								%>

								<div class="row">
									<h2>No Exams Scheduled Now</h2>
								</div>
								<%
									}

									} catch (Exception e) {
										e.printStackTrace();

									}
								%>








							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->


			<!-- footer content -->
			<footer>
			<div class="pull-right">
				Online Examination Portal <a href="https://colorlib.com">,(c)
					all rights reserved-2020</a>
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