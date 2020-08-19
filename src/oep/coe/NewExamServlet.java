package oep.coe;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

/**
 * Servlet implementation class NewExamServlet
 */
@WebServlet("/NewExamServlet")
public class NewExamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewExamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CoeAddOperation add=new CoeAddOperation();
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession(true);
		String instuID=session.getAttribute("instuID").toString();
		String testName=request.getParameter("testName");
		String subjectID=request.getParameter("subjectCode");
		String examDate=request.getParameter("examDate");
		String examTime=request.getParameter("examTime");
		int duration=Integer.parseInt(request.getParameter("duration").toString());
		int marks=Integer.parseInt(request.getParameter("marks").toString());
		
		if(add.scheduleExam(instuID,subjectID,testName,examDate,examTime,duration,marks,"Scheduled,No questions Uploaded",session.getAttribute("instuName").toString()))
		{
			out.print("<script>");
			out.print("alert('Exam Sceduled Successfuly ');");
			out.print("window.location.href='../OEP/production/newExam.jsp';");
			out.print("</script>");
	
		}
		else
		{
			out.print("<script>");
			out.print("alert('Something Went Wrong,Check if  exam is scheduled already');");
			out.print("window.location.href='../OEP/production/newExam.jsp';");
			out.print("</script>");
		}
		
		
		
		
	}

}
