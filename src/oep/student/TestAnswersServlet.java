package oep.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class TestAnswersServlet
 */
@WebServlet("/TestAnswersServlet")
public class TestAnswersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestAnswersServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		AnswerAdder add = new AnswerAdder();
		String examID= session.getAttribute("examID").toString() ;
		String stdReg=session.getAttribute("logedID").toString();

		String answer = new String();

		try {
			String dbUrl = "jdbc:mysql://localhost/oep_db";
			String driverName = "com.mysql.jdbc.Driver";
			Class.forName(driverName);
			Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");

			PreparedStatement ps2 = (PreparedStatement) connection
					.prepareStatement("SELECT qNo,ansChoice,marks FROM questionmcq WHERE examID=? ORDER BY qNo");
			ps2.setString(1, examID);
			ResultSet mcqQuest = ps2.executeQuery();
			int marks = 0;
			while (mcqQuest.next()) {
				marks = 0;
				answer = request.getParameter(String.valueOf(mcqQuest.getInt(1)));
				try {
					if (request.getParameter(String.valueOf(mcqQuest.getInt(1))).equals(null)) {
						answer = "Not Answered";
					} else {
						if (request.getParameter(String.valueOf(mcqQuest.getInt(1))).equals(mcqQuest.getString(2))) {
							answer = request.getParameter(String.valueOf(mcqQuest.getInt(1)));
							marks = mcqQuest.getInt(3);
						}

					}

				} catch (NullPointerException e) {

					answer = "Not Answered";
					marks = 0;

				}
				add.addMCQAnswer(stdReg, examID, mcqQuest.getInt(1), answer, marks);
				

			}

			
			
			
			PreparedStatement ps3 = (PreparedStatement) connection.prepareStatement(
					"SELECT qNo FROM questiondescriptive WHERE examID=? AND type='Fill' ORDER BY qNo");
			ps3.setString(1, examID);
			ResultSet fillQuest = ps3.executeQuery();

			while (fillQuest.next()) {
				answer = request.getParameter(String.valueOf(fillQuest.getInt(1)));
				marks = 0;
				try {
					if (answer.equals("")) {
						answer = "Not Answered";
						marks = 0;
					}
				} catch (NullPointerException e) {
					answer = "Not Answered";
					marks = 0;

				}

				/*
				System.out.println(stdReg + "  " + examID + "  "
						+ fillQuest.getInt(1) + "   " + answer + "  " + marks);
						*/
				add.addFillAnswer(stdReg, examID, fillQuest.getInt(1), answer, marks);

				
			}

			
			
			
			
			PreparedStatement ps4 = (PreparedStatement) connection.prepareStatement(
					"SELECT qNo FROM questiondescriptive WHERE examID=? AND type='Descriptive' ORDER BY qNo");
			ps4.setString(1, examID);
			ResultSet descrQuest = ps4.executeQuery();

			while (descrQuest.next()) {
				answer = request.getParameter(String.valueOf(descrQuest.getInt(1)));
				marks=0;
				try {
					if (answer.equals("")) {
						answer = "Not Answered";
						marks = 0;
					}
				} catch (NullPointerException e) {
					answer = "Not Answered";
					marks = 0;

				}
/*
				System.out.println(stdReg + "  " +examID + "  "
						+ descrQuest.getInt(1) + "   " + answer + "  " + marks);
*/
		
				add.addDescriptiveAnswer(stdReg, examID, descrQuest.getInt(1), answer, marks);

			}
			
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('Your Answers are Submitted Successfuly');");
			out.print("window.location.href='../OEP/production/indexStudent.jsp';");
			out.print("</script>");
			
			
			

		} catch (Exception e) {
			
			e.printStackTrace();
		}

	}

}
