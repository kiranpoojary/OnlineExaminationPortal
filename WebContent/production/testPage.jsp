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


function showHelp()
{
	 var mcqDiv = document.getElementById("mcq");
	 var fillDiv = document.getElementById("fill");
	 var descrDiv = document.getElementById("descriptive");
	 var help=document.getElementById("help");
	  if (help.style.display === "none") {
		  mcqDiv.style.display = "none";	  
		  fillDiv.style.display = "none";
		  descrDiv.style.display="none";
		  help.style.display="block";
	  } else {		  
		  //help.style.display="none";
		  
	  }
}


function showMCQ()
{
	 var fillDiv = document.getElementById("fill");
	 var descrDiv = document.getElementById("descriptive");
	 var help=document.getElementById("help");
	 var mcqDiv = document.getElementById("mcq");
	  if (mcqDiv.style.display === "none") {

		  fillDiv.style.display="none";
		  descrDiv.style.display="none";
		  help.style.display="none";
		  mcqDiv.style.display = "block";
	  } else {
		 // mcqDiv.style.display = "none";
		  
	  }
}

function showFill()
{
	 var mcqDiv = document.getElementById("mcq");
	 var descrDiv = document.getElementById("descriptive");
	 var help=document.getElementById("help");
	 var fillDiv = document.getElementById("fill");
	  if (fillDiv.style.display === "none") {
		  mcqDiv.style.display = "none";
		  descrDiv.style.display="none"; 
		  help.style.display="none";
		  fillDiv.style.display = "block";
		  
	  } else {		  
		 //fillDiv.style.display="none";
		  
	  }
}


function showDescriptive()
{
	 var mcqDiv = document.getElementById("mcq");
	 var fillDiv = document.getElementById("fill");
	 var descrDiv = document.getElementById("descriptive");
	 var help=document.getElementById("help");
	  if (descrDiv.style.display === "none") {
		  mcqDiv.style.display = "none";
		  fillDiv.style.display = "none";
		  help.style.display="none";
		  descrDiv.style.display="block";
	  } else {		  
		  //descrDiv.style.display="none";
		  
	  }
}


</script>


<script>
	//set minutes
	var hours = 0;
	var mins = 0;
	var secs = 0;

	//countdown function is evoked when page is loaded 
	function countdown(a) {
		secs = a * 60;
		setTimeout('Decrement()', 60);
	}

	//Decrement function decrement the value. 
	function Decrement() {
		if (document.getElementById) {
			hours = document.getElementById("hours");
			minutes = document.getElementById("minutes");
			seconds = document.getElementById("seconds");
			hours.value = gethours();
			minutes.value = getminutes();
			seconds.value = getseconds();

			if (secs == 300) {
				
				alert("5 Minutes Left");

			}

			if (secs == 0) {
				alert("timeUp");
			} else {
				setTimeout('Decrement()', 1000);

			}
			secs--;

		}
	}

	function gethours() {
		if (secs >= (60 * 60)) {
			hours = Math.floor(secs / (60 * 60));
		} else {
			hours = 0;
		}

		return hours;
	}

	function getminutes() {
		mins = Math.floor((secs - (hours * 60 * 60)) / 60);
		return mins;
	}

	function getseconds() {

		return (secs % 60);
	}
</script>
</head>
<!-- onload function is evoke when page is load -->
<!--countdown function is called when page is loaded -->




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
<%
	int maxTime = Integer.parseInt(session.getAttribute("examDuration").toString());
%>
<body onload="countdown(<%=maxTime%>);">
<%
if(session.getAttribute("logedID").toString().equals("LOGOUT"))
{
	response.sendRedirect("index.jsp");
}
%>

	<%
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
			ps2.setString(1, session.getAttribute("examID").toString());
			ResultSet mcqCount = ps2.executeQuery();
			mcqCount.next();
			totMCQ = mcqCount.getInt(1);

			PreparedStatement ps3 = (PreparedStatement) connection.prepareStatement(
					"SELECT (SELECT COUNT(qNo) FROM questiondescriptive WHERE examID=? AND type='Fill')");
			ps3.setString(1, session.getAttribute("examID").toString());
			ResultSet fillCount = ps3.executeQuery();
			fillCount.next();
			totFill = fillCount.getInt(1);

			PreparedStatement ps4 = (PreparedStatement) connection.prepareStatement(
					"SELECT (SELECT COUNT(qNo) FROM questiondescriptive WHERE examID=? AND type='Descriptive')");
			ps4.setString(1, session.getAttribute("examID").toString());
			ResultSet descripCount = ps4.executeQuery();
			descripCount.next();
			totDescr = descripCount.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
<form action="../TestAnswersServlet" method="post">

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
				href="javascript:showHelp()"> <i class="fa fa-question-circle"></i> HELP <span
					class="sr-only">(current)</span>
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
				value="submit and End Test">
		</div>

		<div style="color: white;" class="navbar-dark bg-dark">
			<label>Time Left :- </label> <font size="5"> <input id="hours"
				type="text" readonly
				style="width: 10px; border: none; background-color: #343a40 !important; font-size: 16px; font-weight: bold; color: white;">
				:<input id="minutes" type="text" readonly
				style="width: 20px; border: none; background-color: #343a40 !important; font-size: 16px; font-weight: bold; color: white;">
				:<input id="seconds" readonly type="text"
				style="width: 20px; border: none; background-color: #343a40 !important; font-size: 16px; font-weight: bold; color: white;">
			</font>
		</div>
		<!-- menu profile quick info -->
		<div class="profile clearfix">
			<div class="profile_pic">
				<img src="images/user.png" alt="..." class="img-circle profile_img">
			</div>
			<div class="profile_info">
				<span>Welcome <%=session.getAttribute("stdName")%></span>
				<h2>
					Reg:<%=session.getAttribute("logedID")%></h2>
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
						ps2.setString(1, session.getAttribute("examID").toString());
						ResultSet mcqQuest = ps2.executeQuery();

						while (mcqQuest.next()) {
							mcqQNo++;
				%>

				<h6 style="padding-top: 50px;">
					<%=mcqQNo%>).<%=mcqQuest.getString(3)%></h6>


				<li class="list-group-item">
					<div class="checkbox">
						<input type="radio" value="A" name="<%=mcqQuest.getInt(2)%>" />
						<%=mcqQuest.getString(4)%>

					</div>
				</li>
				<li class="list-group-item">
					<div class="checkbox">
						<input type="radio" value="B" name="<%=mcqQuest.getInt(2)%>"
							id="checkbox" /><%=mcqQuest.getString(5)%>

					</div>
				</li>
				<li class="list-group-item">
					<div class="checkbox">
						<input type="radio" value="C" name="<%=mcqQuest.getInt(2)%>"
							id="checkbox" />
						<%=mcqQuest.getString(6)%>

					</div>
				</li>
				<li class="list-group-item">
					<div class="checkbox">
						<input type="radio" value="D" name="<%=mcqQuest.getInt(2)%>" />
						<%=mcqQuest.getString(7)%>
					</div>
				</li>
				<br>
				<br>

				<%
					}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</ul>
		</div>

		<div id="fill" style="display: none" class="paddingEle">
			<h4>Fill in The Blanks Section</h4>
			<br>
			<br>
			<br>
			<ul class="list-group">

				<%
					int fillQNo = 0;
					try {

						Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
						PreparedStatement ps3 = (PreparedStatement) connection
								.prepareStatement("SELECT * FROM questiondescriptive WHERE examID=? AND type='Fill' ORDER BY qNo");
						ps3.setString(1, session.getAttribute("examID").toString());
						ResultSet fillQuest = ps3.executeQuery();

						while (fillQuest.next()) {
							fillQNo++;
				%>

				<li class="list-group-item">
					<div class="checkbox">
						<label style="padding-right: 30px;"><%=fillQNo%>).<%=fillQuest.getString(3)%></label><br>
						<input type="text" name="<%=fillQuest.getInt(2)%>"
							placeholder="your answer" />

					</div>
				</li>
				<div style="padding-bottom: 30px;"></div>
				<%
					}
					} catch (Exception e) {
						e.printStackTrace();

					}
				%>
			</ul>
		</div>

		<div id="descriptive" style="display: none" class="paddingEle">
			<h4>Descriptive Section</h4>
			<br>
			<br>
			<br>
			<ul class="list-group">

				<%
					try {

						int descrQNo = 0;
						Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
						PreparedStatement ps4 = (PreparedStatement) connection
								.prepareStatement("SELECT * FROM questiondescriptive WHERE examID=? AND type='Descriptive' ORDER BY qNo");
						ps4.setString(1, session.getAttribute("examID").toString());
						ResultSet descrQuest = ps4.executeQuery();
						while (descrQuest.next()) {
							descrQNo++;
				%>

				<li class="list-group-item">
					<div class="checkbox">
						<%=descrQNo%>.)<%=descrQuest.getString(3)%>
						<br> <br>
						<textarea name="<%=descrQuest.getInt(2) %>" style="width: 800px; height: 90px"
							placeholder="Type Answer Here" class="widgEditor nothing"></textarea>
					</div>
				</li>
				<div style="padding-bottom: 30px;"></div>
				<%
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
			<li>Test may contains 3 section</li>
			<li>use navigation bar link to navigate to different section</li>
		</ol>
	</div>


</body>
</html>