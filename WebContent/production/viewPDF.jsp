<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDate"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.zip.CheckedInputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico" type="image/ico" />

<title>OEP</title>

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


					<br />

	
				</div>
			</div>
			<center>
			<%
			
			String instuAddrDetails=session.getAttribute("instuName")+","+session.getAttribute("instuAddr")+"-"+session.getAttribute("instuZip");
			%>
				<h3 style="color: #FFFFFF"><%= instuAddrDetails   %></h3>
			</center>

			
			<!-- page content -->
			<form action="../ScannedUpload" method="post"
				enctype='multipart/form-data'>
				<div class="right_col" role="main">
					<div class="">
						<div class="page-title">
							<div class="title_left">
								<h3>View Scanned Answer Paper</h3>
							</div>
							<a href="evaluateTestPage.jsp?testID=<%=request.getParameter("testID")%>&studID=<%=request.getParameter("studID")%>" class="btn btn-primary">Back To Evaluation</a>
				

						</div>

						<div class="clearfix"></div>

						<div class="row">
							<div class="col-md-12 col-sm-12  ">
								<div class="x_panel">



									<%
									String testID=request.getParameter("testID");
									String studID=request.getParameter("studID");
									

									 Blob blob=null;
													
										try {
											
											String dbUrl = "jdbc:mysql://localhost/oep_db";
											String driverName = "com.mysql.jdbc.Driver";
											Class.forName(driverName);
											Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
											PreparedStatement ps2 = (PreparedStatement) connection
													.prepareStatement("SELECT scannedAns FROM answerdescriptive WHERE examID=? AND studID=? ORDER BY qNo DESC");
											ps2.setString(1, testID);
											ps2.setString(2, studID);
											ResultSet rs2 = ps2.executeQuery();
											int rec = 0;
											String encode;
											if (rs2.next()) {
												rec++;
												
												byte[] imgData1 = rs2.getBytes(1); // blob field 
												encode = Base64.getEncoder().encodeToString(imgData1);
												session.setAttribute("pdfData", encode);
												
												
											}
											
											
									%>
									
									<div class="x_title">
										<h2 style="color: red">Answer Sheet OF SRN&nbsp;:&nbsp;&nbsp;<%=studID %></h2>
										
										<iframe src="data:application/pdf;base64,${pdfData}" type="application/pdf"  style="width:100%; height:600px;overflow:auto;"></iframe>
										
										
									<%
									
										}
										 catch (Exception e) {
											e.printStackTrace();
											%>
											<script type="text/javascript">
											alert("No Answer Sheets Found");
											windows.location=""
											</script>
								
											<%
										}
										
									%>

								</div>
							</div>
						</div>
					</div>
				</div>
				</form>
			<!-- /page content -->


			<!-- footer content -->
			<footer>
			<div class="pull-right">
				Online Examination Portal
				<a href="https://colorlib.com">,(c) all rights reserved-2020</a>
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