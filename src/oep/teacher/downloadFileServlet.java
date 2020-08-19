package oep.teacher;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class downloadFileServlet
 */
@WebServlet("/downloadFileServlet")
public class downloadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public downloadFileServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		try {
			
		

			String dbUrl = "jdbc:mysql://localhost/oep_db";
			String driverName = "com.mysql.jdbc.Driver";
			Class.forName(driverName);
			Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
			PreparedStatement ps2 = (PreparedStatement) connection
					.prepareStatement("SELECT scannedAns FROM answerdescriptive WHERE examID=? AND studID=?");
			ps2.setString(1, "PES12018101");
			ps2.setString(2, "100112UE17MC101ISA1");

			ResultSet rs = ps2.executeQuery();
		}catch (Exception e) {
			// TODO: handle exception
		}
		
	}
}
