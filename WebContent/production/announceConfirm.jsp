<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDate"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("logedID").toString().equals("LOGOUT"))
{
	response.sendRedirect("index.jsp");
}
%>
	<%
		try {

			String dbUrl = "jdbc:mysql://localhost/oep_db";
			String driverName = "com.mysql.jdbc.Driver";
			Class.forName(driverName);
			Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
			PreparedStatement ps2 = (PreparedStatement) connection.prepareStatement(
					"UPDATE exams SET status='Result Announced' WHERE examID=? ");
			ps2.setString(1, request.getParameter("testID"));
			int effectedRow = ps2.executeUpdate();
			if(effectedRow>0)
			{
				%>
					<script type="text/javascript">
					alert("Result Announced");
					window.location.href='announceResult.jsp';
					</script>
				<%
			}
			
			
	
		} catch (Exception e) {

		}
	%>



</body>
</html>