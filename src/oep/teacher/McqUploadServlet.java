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
 * Servlet implementation class McqUploadServlet
 */
@WebServlet("/McqUploadServlet")
public class McqUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public McqUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		String mcqQ=request.getParameter("mcqQ");
		String optA=request.getParameter("optA");
		String optB=request.getParameter("optB");
		String optC=request.getParameter("optC");
		String optD=request.getParameter("optD");
		String optAns=request.getParameter("optAns");
		int mcqMark=Integer.parseInt(request.getParameter("mcqMarks"));
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
		
		System.out.print((uploadedMarks+mcqMark)+" "+maxMarks);
		
		if((uploadedMarks+mcqMark)>maxMarks)
		{
			out.print("<script>");
			out.print("alert('marks Exceeds Maximum test marks');");
			out.print(url);
			//out.print("window.location.href='../OEP/production/uploadQuestions.jsp?testID=100112UE17MC125ISA1';");
			out.print("</script>");
			
		}
		else
		{
			if(upload.uploadMCQ(testID,mcqQ,optA,optB,optC,optD,optAns,mcqMark,"MCQ"))
			{
				
				out.print("<script>");
				out.print("alert('MCQ Question Uploaded Successfuly ');");
				out.print(url);
				//out.print("window.location.href='../OEP/production/uploadQuestions.jsp?testID=100112UE17MC125ISA1';");
				out.print("</script>");
				
				
			}
			else
			{
				
				
				out.print("<script>");
				out.print("alert('Something Went Wrong! try again.');");
				out.print(url);
				out.print("</script>");
			}
			//System.out.println(mcqQ+optA+optB+optC+optD+optAns+mcqMark);
		
			
		}
		
		
		
		
	}

}
