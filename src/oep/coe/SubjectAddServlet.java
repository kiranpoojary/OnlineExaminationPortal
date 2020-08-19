package oep.coe;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SubjectAddServlet
 */
@WebServlet("/SubjectAddServlet")
public class SubjectAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CoeAddOperation add=new CoeAddOperation();
		PrintWriter out = response.getWriter();
		String subjectCode=request.getParameter("subCode");
		String subjectName=request.getParameter("subName");
		int courseID=Integer.parseInt(request.getParameter("course").toString());
		String subjectLecture=request.getParameter("subLecture");
		String subjectType="Major";
		
		
		HttpSession session=request.getSession(true);
		if(add.addSubject(subjectCode,subjectName,courseID,subjectLecture,subjectType,request))
		{
			out.print("<script>");
			out.print("alert('Subject Added Successful ');");
			out.print("window.location.href='../OEP/production/addSubjects.jsp';");
			out.print("</script>");

		}

		else
		{
			out.print("<script>");
			out.print("alert('Something Went Wrong ');");
			out.print("window.location.href='../OEP/production/addSubjects.jsp';");
			out.print("</script>");
			
		}	
		
	}

}
