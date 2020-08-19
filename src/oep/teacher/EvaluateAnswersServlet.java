package oep.teacher;

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

import oep.student.AnswerAdder;

/**
 * Servlet implementation class EvaluateAnswersServlet
 */
@WebServlet("/EvaluateAnswersServlet")
public class EvaluateAnswersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EvaluateAnswersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		EvaluatedUpdating update=new EvaluatedUpdating();
		String examID= session.getAttribute("examID").toString() ;
		String stdReg=session.getAttribute("studID").toString();
		String comments = new String();
		int marks=0;

		try {
			String dbUrl = "jdbc:mysql://localhost/oep_db";
			String driverName = "com.mysql.jdbc.Driver";
			Class.forName(driverName);
			Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");

			

			
			
			
			PreparedStatement ps3 = (PreparedStatement) connection.prepareStatement(
					"SELECT qNo FROM questiondescriptive WHERE examID=? AND type='Fill' ORDER BY qNo");
			ps3.setString(1, examID);
			ResultSet fillQuest = ps3.executeQuery();

			while (fillQuest.next()) {
				marks = Integer.parseInt(request.getParameter(String.valueOf(fillQuest.getInt(1))));
				
				
				update.evaluateFill(stdReg, examID, fillQuest.getInt(1), marks);
				
			}

			
			
			
			
			PreparedStatement ps4 = (PreparedStatement) connection.prepareStatement(
					"SELECT qNo FROM questiondescriptive WHERE examID=? AND type='Descriptive' ORDER BY qNo");
			ps4.setString(1, examID);
			ResultSet descrQuest = ps4.executeQuery();

			while (descrQuest.next()) {
				comments = request.getParameter(String.valueOf(descrQuest.getInt(1)+"comments"));
				
				
				marks = Integer.parseInt(request.getParameter(String.valueOf(descrQuest.getInt(1))));
				
				if(comments.equals(""))
				{
					comments="No Comments";
				}
				
				update.evaluateDescriptive(stdReg, examID, descrQuest.getInt(1), marks, comments);
			}
			
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('Evaluation Submitted');");
			out.print("window.location.href='../OEP/production/selectStudentPaper.jsp?testID="+examID+"';");
			out.print("</script>");

		} catch (Exception e) {
			
			e.printStackTrace();
		}


	}

}
