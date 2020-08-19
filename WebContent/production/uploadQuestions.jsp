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
.amber-textarea
 
textarea
 
.md-textarea
:focus
:not
 
(
[
readonly
]
 
)
{
border-bottom
:
 
1
px
 
solid
 
#ffa000
;

	
box-shadow
:
 
0
1
px
 
0
0
#ffa000
;


}
.active-amber-textarea.md-form label.active {
	color: #ffa000;
}

.active-amber-textarea.md-form textarea.md-textarea:focus:not ([readonly]
	 )+label {
	color: #ffa000;
}

.active-amber-textarea-2 textarea.md-textarea {
	border-bottom: 1px solid #ffa000;
	box-shadow: 0 1px 0 0 #ffa000;
}

.active-amber-textarea-2.md-form label.active {
	color: #ffa000;
}

.active-amber-textarea-2.md-form label {
	color: #ffa000;
}

.active-amber-textarea-2.md-form textarea.md-textarea:focus:not ([readonly]
	 )+label {
	color: #ffa000;
}
</style>


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
							<h2><%=session.getAttribute("teacherName")%></h2>
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
										<li><a href="lecturers.jsp">UpComming Exams</a></li>
									</ul></li>
								<li><a><i class="fa fa-edit"></i> Upload Questions <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="uploadSelectSubject.jsp">Select Subject<span class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li class="sub_menu"><a href="uploadQuestions.jsp"><b>Upload
															Questions</b></a></li>
											</ul></li>

									</ul></li>

								<li><a><i class="fa fa-table"></i> Exam Evaluation <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="evalSelectSubject.jsp">Start Evaluation</a></li>
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
			
			String instuAddrDetails=session.getAttribute("instuName")+","+session.getAttribute("instuAddr")+"-"+session.getAttribute("instuZip");
			%>
				<h3 style="color: #FFFFFF"><%= instuAddrDetails   %></h3>
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
							aria-expanded="false"> <img src="data:image/jpeg;base64,${pic}" alt=""><%=session.getAttribute("teacherName")%>
						</a>
							<div class="dropdown-menu dropdown-usermenu pull-right"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="teacherProfile.jsp"> Profile</a> <a
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
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Upload Exam Questions</h3>
						</div>


					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12  ">
							<div class="x_panel">
								<div class="x_title">
									<h2>Current Upload Status</h2>
									<ul class="nav navbar-right panel_toolbox">

									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">

									<form action="../McqUploadServlet" method="post">
										<table id="customers">
											<tr>
												<th>Test ID</th>
												<th>Subject Code</th>
												<th>Max Marks</th>
												<th>Total Question Uploaded</th>
												<th>MCQ Uploaded</th>
												<th>Descriptive Uploaded</th>
												<th>Total Marks uploaded</th>
												<th>status</th>
											</tr>

											<%
												String status;
												int maxMarks = 0;
												int uploadedMarks = 0;
												try {

													String dbUrl = "jdbc:mysql://localhost/oep_db";
													String driverName = "com.mysql.jdbc.Driver";
													Class.forName(driverName);
													Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
													PreparedStatement ps2 = (PreparedStatement) connection
															.prepareStatement("SELECT * FROM exams WHERE examID=?");
													ps2.setString(1, request.getParameter("testID"));
													session.setAttribute("testID", request.getParameter("testID").toString());
													ResultSet rs2 = ps2.executeQuery();
													int rec = 0;
													while (rs2.next()) {
														rec++;
														maxMarks = rs2.getInt(8);
														status = rs2.getString(9);
											%>
											<tr>
												<td><%=rs2.getString(1)%></td>
												<td><%=rs2.getString(3)%></td>
												<td><%=maxMarks%></td>
												<%
													PreparedStatement ps3 = (PreparedStatement) connection.prepareStatement(
																	"SELECT (SELECT COUNT(examID) FROM questionmcq WHERE examID=?) + (SELECT COUNT(examID) FROM questiondescriptive WHERE examID=?) as totQ");
															ps3.setString(1, request.getParameter("testID"));
															ps3.setString(2, request.getParameter("testID"));
															ResultSet rs3 = ps3.executeQuery();

															rs3.next();
												%>

												<td><%=rs3.getInt(1)%></td>

												<%
													PreparedStatement ps4 = (PreparedStatement) connection.prepareStatement(
																	"SELECT (SELECT COUNT(examID) FROM questionmcq WHERE examID=?) as totMCQ");
															ps4.setString(1, request.getParameter("testID"));

															ResultSet rs4 = ps4.executeQuery();

															rs4.next();
												%>

												<td><%=rs4.getInt(1)%></td>

												<%
													PreparedStatement ps5 = (PreparedStatement) connection.prepareStatement(
																	"SELECT (SELECT COUNT(examID)  FROM questiondescriptive WHERE examID=?) as totDesc");
															ps5.setString(1, request.getParameter("testID"));

															ResultSet rs5 = ps5.executeQuery();

															rs5.next();
												%>
												<td><%=rs5.getInt(1)%></td>

												<%
													PreparedStatement ps6 = (PreparedStatement) connection.prepareStatement(
																	"SELECT SUM(marks) FROM questionmcq WHERE examID=?");
															ps6.setString(1, request.getParameter("testID"));
															ResultSet rs6 = ps6.executeQuery();
															rs6.next();
															uploadedMarks = rs6.getInt(1);
															System.out.println(uploadedMarks);
															
															PreparedStatement ps7 = (PreparedStatement) connection.prepareStatement(
																	"SELECT SUM(marks) FROM questiondescriptive WHERE examID=?");
															ps7.setString(1, request.getParameter("testID"));
															ResultSet rs7 = ps7.executeQuery();
															rs7.next();
															uploadedMarks += rs7.getInt(1);
															
															System.out.println(uploadedMarks);
												%>


												<td><%=uploadedMarks%></td>

												<td><%=status%></td>

											</tr>
											<%
												}
													if (rec == 0) {
											%>
											<tr>
												<td colspan="8"><center>No Exams Scheduled</center></td>
											</tr>
											<%
												}

												} catch (Exception e) {
													e.printStackTrace();

												}
											%>
										</table>


										<br> <br>

										<%
											if (uploadedMarks < maxMarks) {
										%>

										<div class="card">
											<center>
												<h2>Upload MCQ Question</h2>
											</center>

											<!--Material textarea-->
											<div class="md-form amber-textarea active-amber-textarea">
												<textarea id="form19" name="mcqQ"
													placeholder="Enter Question Here"
													class="md-textarea form-control" rows="3" required></textarea>

											</div>



											<div class="container">

												<br />
												<div class="panel panel-primary">
													<div class="panel-body">
														<h4>Answer Choices</h4>
													</div>

													<ul class="list-group">
														<div class="row">
															<li class="list-group-item"><label for="checkbox">
																	A) </label> <input type="text" id="checkbox" name="optA"
																required /></li>
															<li class="list-group-item"><label for="checkbox">
																	B) </label> <input type="text" id="checkbox" name="optB"
																required /></li>
															<li class="list-group-item"><label for="checkbox">
																	C) </label> <input type="text" id="checkbox" name="optC"
																required /></li>
															<li class="list-group-item"><label for="checkbox">
																	D) </label> <input type="text" id="checkbox" name="optD"
																required /></li>
															<li class="list-group-item"><label for="checkbox">
																	Answer Choice </label> <select name="optAns">
																	<option value="A">A</option>
																	<option value="B">B</option>
																	<option value="C">C</option>
																	<option value="D">D</option>

															</select></li>
															<li class="list-group-item"><label for="checkbox">
																	Marks </label> <select name="mcqMarks">
																	<option value="1">1</option>
																	<option value="2">2</option>
															</select></li>
															<li class="list-group-item"><input type="submit"
																class="btn btn-info" value="upload" name="mcq" /></li>
													</ul>

												</div>
											</div>
										</div>


									</form>





									<br> <br> <br> <br>
									<div class="card">
										<center>
											<h2>Upload Fill In The Blanks Question</h2>
										</center>
										<form action="../FillUploadServlet" method="post">
											<!--Material textarea-->
											<div class="md-form amber-textarea active-amber-textarea">
												<textarea id="form19" placeholder="Enter Question Here"
													class="md-textarea form-control" name="fillQ" rows="3"
													required></textarea>

											</div>
											<div class="container">

												<br />
												<div class="panel panel-primary">


													<ul class="list-group">
														<div class="row">
															<li class="list-group-item"><label for="checkbox">
																	Answer </label> <input type="text" name="fillAns" required /></li>

															<li class="list-group-item"><label for="checkbox">
																	Marks </label> <select name="fillMarks">
																	<option value="1">1</option>
																	<option value="2">2</option>
															</select></li>
															<li class="list-group-item"><input type="submit"
																class="btn btn-info" value="upload" name="mcq" /></li>
													</ul>
												</div>
											</div>
									</div>

									</form>







									<br> <br> <br> <br>
									<div class="card">
										<center>
											<h2>Upload Descriptive Questions</h2>
										</center>
										<form action="../DescriptiveUploadServlet" method="post">
											<!--Material textarea-->
											<div class="md-form amber-textarea active-amber-textarea">
												<textarea id="form19" placeholder="Enter Question Here"
													class="md-textarea form-control" name="descriptiveQ"
													rows="3" required></textarea>

											</div>
											<br>
											<div class="md-form amber-textarea active-amber-textarea">
												<textarea id="form19" placeholder="Enter Expected Answer"
													class="md-textarea form-control" name="descriptiveAns"
													rows="3" required></textarea>

											</div>
											<div class="container">

												<br />
												<div class="panel panel-primary">
													<ul class="list-group">
														<div class="row">
															<li class="list-group-item"><label for="checkbox">
																	Marks </label> <input type="number" name="descriptiveMark"
																max=20 min=1 value="1" required name="fillAns" /></li>


															<li class="list-group-item"><input type="submit"
																class="btn btn-info" value="upload" name="mcq" /></li>
													</ul>
												</div>
											</div>
									</div>

									</form>




									<%
										}
											else
											{
												%>
												<div>
												
												<center><h2>Adding Of Question is Completed</h2></center>
												</div>
												
												
												<%
											}
									%>



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