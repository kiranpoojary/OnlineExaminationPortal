<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Registration</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!--Fontawesome CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">


</head>
<script type="text/javascript">
	function validateForm() {
		if (document.getElementById("psw").value != document
				.getElementById("cpsw").value) {
			swal("Warning!", "Password Mismatched", "warning");
			return false;
		} else {
			var e = document.getElementById("mylist");
			var x = e.options[e.selectedIndex].text;
			if (x == "Select a security Question") {
				swal("Warning!", "Select a valid security Question", "warning");
				return false;
			}
		}
	}
</script>

<style type="text/css">
body, html {
	background-image:
		url(../OEP/images/configimages/gray_bcg.png);
	background-size: cover;
	background-repeat: no-repeat;
	height: 100%;
	font-family: 'Numans', sans-serif;
	background-size: 100% 100vh;
}

.container {
	height: 100%;
	align-content: center;
}

.card {
	height: 650px;
	margin-top: 100px;
	margin-bottom: auto;
	width: 600px;
	background-color: rgba(0, 0, 0, 0.6) !important;
}

.social_icon span {
	font-size: 60px;
	margin-left: 10px;
	color: #81C922;
}

.social_icon span:hover {
	color: white;
	cursor: pointer;
}

.card-header h3 {
	color: white;
}

.social_icon {
	position: absolute;
	right: 20px;
	top: -45px;
}

.input-group-prepend span {
	width: 50px;
	background-color: #81C922;
	color: black;
	border: 0 !important;
}

input:focus {
	outline: 0 0 0 0 !important;
	box-shadow: 0 0 0 0 !important;
}

.remember {
	color: white;
}

.remember input {
	width: 20px;
	height: 20px;
	margin-left: 15px;
	margin-right: 5px;
}

.reg_btn {
	color: black;
	background-color: #81C922;
	width: 130px;
}

.reg_btn:hover {
	color: black;
	background-color: white;
}

.links {
	color: white;
}

.links a {
	margin-left: 4px;
}

.dropdown {
	background-color: white;
	color: black;
	width: 309px;
	padding: 7px;
	font-size: 16px;
	border: 0 !important;
}

.list {
	width: 300px;
	border: 0 !important;
}
</style>

<body>
	<form  action="InstitutionRegistration" method="post">
		<div class="container">
			<div class="d-flex justify-content-center h-100">
				<div class="card">
					<div class="card-header">
						<h3>Register Your Institution and Make Examination Process
							Easy</h3>
					</div>
					<div class="card-body">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" style="width: 100px" name="fname"
								class="form-control" placeholder="Institution Full Name"
								required>

						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i
									class="fa fa-address-book"></i></span>
							</div>
							<input type="text" name="addr" class="form-control"
								placeholder="Address" required>
						</div>

						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fa fa-flag"></i></span>
							</div>
							<input type="text" name="country" id="country" class="form-control"
								placeholder="Country" pattern="[A-Za-z]+" oninvalid="alert('Invalid country name');" required>
						</div>
						<!-- 
						oninvalid="setCustomValidity('Mandatory:Only characters are allowed')"
						 -->
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fa fa-flag"></i></span>
							</div>
							<input type="text" name="state" id="state" class="form-control"
								placeholder="State" pattern="[A-Za-z]+" oninvalid="alert('Invalid state name');" required>
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fa fa-snowflake"></i></span>
							</div>
							<input type="text" style="width: 100px" name="dist"
								class="form-control" pattern="[A-Za-z]+" oninvalid="alert('Invalid district name');" placeholder="District" required>
						</div>

						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fa fa-envelope"></i></span>
							</div>
							<input type="text" style="width: 100px" name="zip"
								class="form-control" pattern="[0-9]{6}" oninvalid="alert('Invalid ZIP code');" placeholder="Zip Code" maxlength="6" required>
						</div>


						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fa fa-link"></i></span>
							</div>
							<input type="url" style="width: 100px" name="site"
								class="form-control" placeholder="http://example.com" oninvalid="alert('Follow the url pattern');" required>
						</div>

						<div class="form-group ">
							<center>
								<input type="submit" value="Continue" class="btn reg_btn "><br><br>
								 	<label style="color:white">Already have registered with OEP.</label><a href="LoginCOE.jsp" >Login Now</a>
							</center>

							<center></center>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>

