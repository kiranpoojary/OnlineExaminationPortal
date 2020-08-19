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

/**
 * Servlet implementation class FillUploadServlet
 */
@WebServlet("/FillUploadServlet")
public class FillUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FillUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		String fillQ=request.getParameter("fillQ");
		String fillAns=request.getParameter("fillAns");
		int fillmark=Integer.parseInt(request.getParameter("fillMarks"));
		String testID=session.getAttribute("testID").toString();
		QuestionUpload upload=new QuestionUpload();
		PrintWriter out = response.getWriter();
		String url="window.location.href='../OEP/production/uploadQuestions.jsp?testID="+testID+"';";
		int uploadedMarks=0;
		int maxMarks=0;
		
		String dbUrl = "jdbc:mysql://localhost/oep_db";
		String driverName = "com.mysql.jdbc.Driver";
		try {
			getClass().forName(driverName);
			Connection connection = (Connection) DriverManager.getConnection(dbUrl, "root", "");
			
			PreparedStatement ps6 = (PreparedStatement) connection.prepareStatement(
					"SELECT (SELECT SUM(marks) FROM questionmcq WHERE examID=?) + (SELECT SUM(marks) FROM questiondescriptive WHERE examID=?) as totQ");
			ps6.setString(1, testID);
			ps6.setString(2, testID);
			ResultSet rs6 = ps6.executeQuery();

			rs6.next();
			uploadedMarks = rs6.getInt(1);
			
			
			
			PreparedStatement ps7 = (PreparedStatement) connection.prepareStatement("SELECT totMarks FROM exams WHERE examID=?");
			ps7.setString(1, testID);
			
			ResultSet rs7 = ps7.executeQuery();

			rs7.next();
			maxMarks = rs7.getInt(1);
;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		
		if((uploadedMarks+fillmark)>maxMarks)
		{
			out.print("<script>");
			out.print("alert('marks Exceeds Maximum test marks');");
			out.print(url);
			out.print("</script>");
			
		}
		else
		{
			if(upload.uploadFill(testID,fillQ,fillAns,fillmark,"Fill"))
			{
				out.print("<script>");
				out.print("alert('Question Uploaded Successfuly ');");
				out.print(url);
				out.print("</script>");
				
			}
			else
			{
				out.print("<script>");
				out.print("alert('Something Went Wrong! try again.');");
				out.print(url);
				out.print("</script>");
			}
		}
		
		
		
		
		
		
		
	}

}
