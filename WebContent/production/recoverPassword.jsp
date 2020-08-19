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
<script src="../vendors/jquery/dist/jquery.min.js"></script>

</head>
<body>
<%
if(session.getAttribute("logedID").toString().equals("LOGOUT"))
{
	response.sendRedirect("index.jsp");
}
%>
	<div style="padding-top: 120px; padding-left: 550px">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="text-center">
							<h3>
								<i class="fa fa-lock fa-4x"></i>
							</h3>
							<h2 class="text-center">Forgot Password?</h2>
							<p>You can reset your password here.</p>
							<div class="panel-body">

								<form id="register-form" action="../RecoverPassword"
									method="post" autocomplete="off" class="form">

									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-envelope color-blue"></i></span> <input
												name="email" placeholder="Email ID" class="form-control"
												type="email" required>
										</div>
									</div>
									<b>Select Account Type</b> <br> COE&nbsp;<input
										type="radio" name="Utype" value="COE" checked>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Teacher&nbsp;<input type="radio"
										value="Teacher" name="Utype">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Student&nbsp;<input type="radio"
										value="Student" name="Utype"> <br> <br>
									<div class="form-group">
										<input name="recover-submit"
											class="btn btn-lg btn-primary btn-block"
											value="Request New Password" type="submit">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>