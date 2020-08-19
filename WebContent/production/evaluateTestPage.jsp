<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<script type="text/javascript">
	function showHelp() {
		var mcqDiv = document.getElementById("mcq");
		var fillDiv = document.getElementById("fill");
		var descrDiv = document.getElementById("descriptive");
		var help = document.getElementById("help");
		if (help.style.display === "none") {
			mcqDiv.style.display = "none";
			fillDiv.style.display = "none";
			descrDiv.style.display = "none";
			help.style.display = "block";
		} else {
			// help.style.display="none";

		}
	}

	function showMCQ() {
		var fillDiv = document.getElementById("fill");
		var descrDiv = document.getElementById("descriptive");
		var help = document.getElementById("help");
		var mcqDiv = document.getElementById("mcq");
		if (mcqDiv.style.display === "none") {

			fillDiv.style.display = "none";
			descrDiv.style.display = "none";
			help.style.display = "none";
			mcqDiv.style.display = "block";
		} else {
			// mcqDiv.style.display = "none";

		}
	}

	function showFill() {
		var mcqDiv = document.getElementById("mcq");
		var descrDiv = document.getElementById("descriptive");
		var help = document.getElementById("help");
		var fillDiv = document.getElementById("fill");
		if (fillDiv.style.display === "none") {
			mcqDiv.style.display = "none";
			descrDiv.style.display = "none";
			help.style.display = "none";
			fillDiv.style.display = "block";

		} else {
			//fillDiv.style.display="none";

		}
	}

	function showDescriptive() {
		var mcqDiv = document.getElementById("mcq");
		var fillDiv = document.getElementById("fill");
		var descrDiv = document.getElementById("descriptive");
		var help = document.getElementById("help");
		if (descrDiv.style.display === "none") {
			mcqDiv.style.display = "none";
			fillDiv.style.display = "none";
			help.style.display = "none";
			descrDiv.style.display = "block";
		} else {
			//descrDiv.style.display="none";

		}
	}
</script>



</head>


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

<script src="../vendors/jquery/dist/jquery.min.js"></script>
<link href="../vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<style type="text/css">
.paddingEle {
	padding-left: 200px;
	padding-right: 200px;
	padding-bottom: 40px;
}

@import
	url("//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css")
	;

.navbar-icon-top .navbar-nav .nav-link>.fa {
	position: relative;
	width: 36px;
	font-size: 24px;
}

.navbar-icon-top .navbar-nav .nav-link>.fa>.badge {
	font-size: 0.75rem;
	position: absolute;
	right: 0;
	font-family: sans-serif;
}

.navbar-icon-top .navbar-nav .nav-link>.fa {
	top: 3px;
	line-height: 12px;
}

.navbar-icon-top .navbar-nav .nav-link>.fa>.badge {
	top: -10px;
}

@media ( min-width : 576px) {
	.navbar-icon-top.navbar-expand-sm .navbar-nav .nav-link {
		text-align: center;
		display: table-cell;
		height: 70px;
		vertical-align: middle;
		padding-top: 0;
		padding-bottom: 0;
	}
	.navbar-icon-top.navbar-expand-sm .navbar-nav .nav-link>.fa {
		display: block;
		width: 48px;
		margin: 2px auto 4px auto;
		top: 0;
		line-height: 24px;
	}
	.navbar-icon-top.navbar-expand-sm .navbar-nav .nav-link>.fa>.badge {
		top: -7px;
	}
}

@media ( min-width : 768px) {
	.navbar-icon-top.navbar-expand-md .navbar-nav .nav-link {
		text-align: center;
		display: table-cell;
		height: 70px;
		vertical-align: middle;
		padding-top: 0;
		padding-bottom: 0;
	}
	.navbar-icon-top.navbar-expand-md .navbar-nav .nav-link>.fa {
		display: block;
		width: 48px;
		margin: 2px auto 4px auto;
		top: 0;
		line-height: 24px;
	}
	.navbar-icon-top.navbar-expand-md .navbar-nav .nav-link>.fa>.badge {
		top: -7px;
	}
}

@media ( min-width : 992px) {
	.navbar-icon-top.navbar-expand-lg .navbar-nav .nav-link {
		text-align: center;
		display: table-cell;
		height: 70px;
		vertical-align: middle;
		padding-top: 0;
		padding-bottom: 0;
	}
	.navbar-icon-top.navbar-expand-lg .navbar-nav .nav-link>.fa {
		display: block;
		width: 48px;
		margin: 2px auto 4px auto;
		top: 0;
		line-height: 24px;
	}
	.navbar-icon-top.navbar-expand-lg .navbar-nav .nav-link>.fa>.badge {
		top: -7px;
	}
}

@media ( min-width : 1200px) {
	.navbar-icon-top.navbar-expand-xl .navbar-nav .nav-link {
		text-align: center;
		display: table-cell;
		height: 70px;
		vertical-align: middle;
		padding-top: 0;
		padding-bottom: 0;
	}
	.navbar-icon-top.navbar-expand-xl .navbar-nav .nav-link>.fa {
		display: block;
		width: 48px;
		margin: 2px auto 4px auto;
		top: 0;
		line-height: 24px;
	}
	.navbar-icon-top.navbar-expand-xl .navbar-nav .nav-link>.fa>.badge {
		top: -7px;
	}
}
</style>
</head>

<body>
	<%
		if (session.getAttribute("logedID").toString().equals("LOGOUT")) {
			response.sendRedirect("index.jsp");
		}
	%>
	<%
		session.setAttribute("examID", request.getParameter("testID"));
		session.setAttribute("studID", request.getParameter("studID"));

		String dbUrl = "jdbc:mysql://localhost/oep_db";
		String driverName = "com.mysql.jdbc.Driver";
		Class.forName(driverName);

		int totMCQ = 0;
		int totFill = 0;
		int totDescr = 0;

		try {

			Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");

			PreparedStatement ps2 = (PreparedStatement) connection
					.prepareStatement("SELECT (SELECT COUNT(qNo) FROM questionmcq WHERE examID=?)");
			ps2.setString(1, request.getParameter("testID"));
			ResultSet mcqCount = ps2.executeQuery();
			mcqCount.next();
			totMCQ = mcqCount.getInt(1);

			PreparedStatement ps3 = (PreparedStatement) connection.prepareStatement(
					"SELECT (SELECT COUNT(qNo) FROM questiondescriptive WHERE examID=? AND type='Fill')");
			ps3.setString(1, request.getParameter("testID"));
			ResultSet fillCount = ps3.executeQuery();
			fillCount.next();
			totFill = fillCount.getInt(1);

			PreparedStatement ps4 = (PreparedStatement) connection.prepareStatement(
					"SELECT (SELECT COUNT(qNo) FROM questiondescriptive WHERE examID=? AND type='Descriptive')");
			ps4.setString(1, request.getParameter("testID"));
			ResultSet descripCount = ps4.executeQuery();
			descripCount.next();
			totDescr = descripCount.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	<form action="../EvaluateAnswersServlet" method="post">

		<nav
			class="navbar navbar-icon-top navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Online Examination Portal</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>


		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="javascript:showHelp()"> <i class="fa fa-question-circle"></i>
						HELP <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="javascript:showMCQ()"> <i class=""> <span
							class="badge badge-danger"><%=totMCQ%></span>
					</i> MCQ
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="javascript:showFill()"> <i class=""> <span
							class="badge badge-warning"><%=totFill%></span>
					</i> Fill in The Blanks
				</a></li>
				<li class="nav-item"><a class="nav-link "
					href="javascript:showDescriptive()"> <i class=""> <span
							class="badge badge-primary"><%=totDescr%></span>
					</i>Descriptive
				</a></li>
			</ul>

			<div style="color: white;" class="navbar-dark bg-dark">
				<input class="btn btn-primary" type="submit"
					value="Submit Evaluation">
			</div>


			<!-- menu profile quick info -->
			<div class="profile clearfix">
				<div class="profile_pic">
					<img src="images/user.png" alt="..." class="img-circle profile_img">
				</div>
				<div class="profile_info">
					<span>Welcome <%=session.getAttribute("teacherName")%></span>
					<h2>
						ID:<%=session.getAttribute("logedID")%></h2>
					<a
						href="viewPDF.jsp?testID=<%=request.getParameter("testID")%>&studID=<%=request.getParameter("studID").toString()%>"
						class="btn btn-primary">View Answer Sheet</a>
				</div>
			</div>
		</div>
		</nav>
		<br>

		<hr style="border: 1px solid blue;">
		<div id="mcq" class="paddingEle">
			<h4>Multiple Choice Section</h4>
			<ul class="list-group">
				<%
					int mcqQNo = 0;
					try {

						Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
						PreparedStatement ps2 = (PreparedStatement) connection
								.prepareStatement("SELECT * FROM questionmcq WHERE examID=? ORDER BY qNo");
						ps2.setString(1, request.getParameter("testID"));
						ResultSet mcqQuest = ps2.executeQuery();

						while (mcqQuest.next()) {
							mcqQNo++;
							PreparedStatement psAns2 = (PreparedStatement) connection
									.prepareStatement("SELECT * FROM answermcq WHERE qNo=? AND studID=?");
							psAns2.setInt(1, mcqQuest.getInt(2));
							psAns2.setString(2, request.getParameter("studID"));
							ResultSet mcqAns = psAns2.executeQuery();
							while (mcqAns.next()) {
				%>

				<h6 style="padding-top: 50px;">
					<%=mcqQNo%>).<%=mcqQuest.getString(3)%></h6>
				<%
					if (mcqAns.getString(4).equals("A")) {
				%>

				<li class="list-group-item" style="border: 3px solid black">
					<div class="checkbox">
						<input type="radio" value="A" name="<%=mcqQuest.getInt(2)%>"
							id="checkbox" checked disabled />
						<%=mcqQuest.getString(4)%>

					</div>
				</li>

				<%
					} else {
				%>
				<li class="list-group-item">
					<div class="checkbox">
						<input type="radio" value="A" name="<%=mcqQuest.getInt(2)%>"
							id="checkbox" disabled />
						<%=mcqQuest.getString(4)%>

					</div>
				</li>

				<%
					}
				%>





				<%
					if (mcqAns.getString(4).equals("B")) {
				%>
				<li class="list-group-item" style="border: 3px solid black">
					<div class="checkbox">
						<input type="radio" value="B" name="<%=mcqQuest.getInt(2)%>"
							id="checkbox" checked disabled /><%=mcqQuest.getString(5)%>

					</div>
				</li>

				<%
					} else {
				%>
				<li class="list-group-item">
					<div class="checkbox">
						<input type="radio" value="B" name="<%=mcqQuest.getInt(2)%>"
							id="checkbox" disabled /><%=mcqQuest.getString(5)%>

					</div>
				</li>
				<%
					}
				%>






				<%
					if (mcqAns.getString(4).equals("C")) {
				%>
				<li class="list-group-item" style="border: 3px solid black">
					<div class="checkbox">
						<input type="radio" value="C" name="<%=mcqQuest.getInt(2)%>"
							id="checkbox" checked disabled />
						<%=mcqQuest.getString(6)%>

					</div>
				</li>

				<%
					} else {
				%>
				<li class="list-group-item">
					<div class="checkbox">
						<input type="radio" value="C" name="<%=mcqQuest.getInt(2)%>"
							id="checkbox" disabled />
						<%=mcqQuest.getString(6)%>

					</div>
				</li>
				<%
					}
				%>






				<%
					if (mcqAns.getString(4).equals("D")) {
				%>
				<li class="list-group-item" style="border: 3px solid black">
					<div class="checkbox">
						<input type="radio" value="D" name="<%=mcqQuest.getInt(2)%>"
							checked disabled />
						<%=mcqQuest.getString(7)%>
					</div>
				</li>

				<%
					} else {
				%>
				<li class="list-group-item">
					<div class="checkbox">
						<input type="radio" value="D" name="<%=mcqQuest.getInt(2)%>"
							disabled />
						<%=mcqQuest.getString(7)%>
					</div>
				</li>
				<%
					}
				%>






				<br>
				<br>

				<%
					}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</ul>
		</div>

		<div id="fill" style="display: none" class="paddingEle">
			<h4>Fill in The Blanks Section</h4>
			<br> <br> <br>
			<ul class="list-group">

				<%
					int fillQNo = 0;
					try {

						Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
						PreparedStatement ps3 = (PreparedStatement) connection.prepareStatement(
								"SELECT * FROM questiondescriptive WHERE examID=? AND type='Fill' ORDER BY qNo");
						ps3.setString(1, request.getParameter("testID").toString());
						ResultSet fillQuest = ps3.executeQuery();

						while (fillQuest.next()) {
							fillQNo++;
							PreparedStatement psAns3 = (PreparedStatement) connection
									.prepareStatement("SELECT * FROM answerdescriptive WHERE qNo=? AND studID=?");
							psAns3.setInt(1, fillQuest.getInt(2));
							psAns3.setString(2, request.getParameter("studID"));
							ResultSet fillAns = psAns3.executeQuery();
							while (fillAns.next()) {
				%>

				<li class="list-group-item">
					<div class="checkbox">
						<label style="padding-right: 30px;"><%=fillQNo%>).<%=fillQuest.getString(3)%></label><br>
						<div class="row">
							<input type="text" name="" value="<%=fillAns.getString(4)%>"
								readonly />&nbsp;&nbsp; <input type="radio"
								name="<%=fillQuest.getInt(2)%>" value="<%=fillQuest.getInt(5)%>"
								required>Right &nbsp;&nbsp;&nbsp;&nbsp; <input
								type="radio" name="<%=fillQuest.getInt(2)%>" value="0" required>Wrong
						</div>
					</div>
				</li>
				<div style="padding-bottom: 30px;"></div>
				<%
					}
						}
					} catch (Exception e) {
						e.printStackTrace();

					}
				%>
			</ul>
		</div>

		<div id="descriptive" style="display: none" class="paddingEle">
			<h4>Descriptive Section</h4>
			<br> <br> <br>
			<ul class="list-group">

				<%
					try {

						int descrQNo = 0;
						Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
						PreparedStatement ps4 = (PreparedStatement) connection.prepareStatement(
								"SELECT * FROM questiondescriptive WHERE examID=? AND type='Descriptive' ORDER BY qNo");
						ps4.setString(1, request.getParameter("testID").toString());
						ResultSet descrQuest = ps4.executeQuery();
						while (descrQuest.next()) {
							descrQNo++;
							PreparedStatement psAns4 = (PreparedStatement) connection
									.prepareStatement("SELECT * FROM answerdescriptive WHERE qNo=? AND studID=?");
							psAns4.setInt(1, descrQuest.getInt(2));
							psAns4.setString(2, request.getParameter("studID"));
							ResultSet descrAns = psAns4.executeQuery();
							while (descrAns.next()) {
				%>

				<li class="list-group-item">
					<div class="checkbox">
						<%=descrQNo%>.)<%=descrQuest.getString(3)%>
						<br> <br>
						<textarea name="no" style="width: 800px; height: 90px"
							class="widgEditor nothing" readonly><%=descrAns.getString(4)%></textarea>
						<br> <br>
						<div class="row">
							Maximum Marks:
							<%=descrQuest.getInt(5)%>&nbsp;&nbsp;&nbsp;&nbsp; Obtained Marks:<input
								type="number" name="<%=descrQuest.getInt(2)%>" value=0 min=0
								max="<%=descrQuest.getInt(5)%>"> <br> <br>
						</div>
						Comments:
						<textarea name="<%=descrQuest.getInt(2) + "comments"%>"
							style="width: 250px; height: 130px" class="form-control"></textarea>

					</div>
				</li>
				<div style="padding-bottom: 30px;"></div>
				<%
					}
						}
					} catch (Exception e) {
						e.printStackTrace();

					}
				%>
			</ul>
		</div>
	</form>

	<div id="help" style="display: none;" class="paddingEle">
		<h2>Important Points</h2>
		<ol>
			<li>Test evaluation may contains 3 section.</li>
			<li>use navigation bar to navigate to different section.</li>
			<li>MCQs are evaluated automatically.</li>
			<li>"submit evaluation" at right top after all section
				evaluation complete.</li>
		</ol>
	</div>


</body>
</html>