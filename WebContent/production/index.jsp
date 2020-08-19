<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login As</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico" type="image/ico" />

<title>Choose Account</title>

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
session.setAttribute("logedID","LOGOUT");
%>
	<div>
		<img alt="No Img" src="../images/configimages/Logo.PNG"
			style="padding-top: 10%; padding-left: 33%" />

	</div>
	<div class="form-row" style="padding-left: 30%;">
		<div class="col form-group" style="padding-top: 5%">
		
			<a href="../LoginCOE.jsp" class="btn btn-primary" style="width: 15%;border-radius: 10px">Am A COE</a> <a
				href="../Login.jsp" class="btn btn-primary" style="width: 15%;border-radius: 10px">Am A Teacher</a><a
				href="../LoginStudent.jsp" class="btn btn-primary" style="width: 15%;border-radius: 10px">Am A Student</a>
		</div>

	</div>
	<div class="form-row" style="padding-left: 40%">
	<label style="color: white">Want to register your institution click&nbsp;</label><b><a href="../InstitutionRegistration.jsp" style="color: cyan">Here</a></b>
	</div>
	</body>
</html>