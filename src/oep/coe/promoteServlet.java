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
 * Servlet implementation class promoteServlet
 */
@WebServlet("/promoteServlet")
public class promoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public promoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("instuID"));
		int currentCourse = Integer.parseInt(request.getParameter("currentCourse").toString());
		int promoteCourse = Integer.parseInt(request.getParameter("promoteCourse").toString());
		int instuID=Integer.parseInt(session.getAttribute("instuID").toString());
		PrintWriter out = response.getWriter();
		CoeAddOperation promote = new CoeAddOperation();
		if (currentCourse == promoteCourse) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Courses are Same');");
			out.println("location='../OEP/production/promoteStudent.jsp';");
			out.println("</script>");
		} else {
			if(promote.promoteStudents(instuID,currentCourse, promoteCourse))
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Promoting of students by course Successful');");
				out.println("location='../OEP/production/promoteStudent.jsp';");
				out.println("</script>");
				
			}else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Something Went Wrong!.\\n\\n' \r\n" + 
						"								+ \"Possible Reasons are.\\n\"\r\n" + 
						"								+ \"1)Database Server is down.\\n\" \r\n" + 
						"								+ '2)Promote the higher courses first then try lower courses\\n\\n'  \r\n" + 
						"								+ '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\\n\\n' \r\n" + 
						"								+ 'Try again.');");
				out.println("location='../OEP/production/promoteStudent.jsp';");
				out.println("</script>");
				
			}

			

		}

	}

}
