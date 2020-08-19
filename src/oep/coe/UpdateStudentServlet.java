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
 * Servlet implementation class UpdateStudentServlet
 */
@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String oldreg=session.getAttribute("oldReg").toString();
		String fullName=request.getParameter("fName").toString();
		String reg=request.getParameter("regNo").toString();
		int course =Integer.parseInt(request.getParameter("course").toString());
		String email=request.getParameter("stdEmail").toString();
		int instuID=Integer.parseInt(session.getAttribute("instuID").toString());
		//System.out.println(session.getAttribute("instuID")+" "+fullName+"  "+reg+"  "+course+"  "+email+"  "+oldreg);
		PrintWriter out = response.getWriter();
		CoeAddOperation update = new CoeAddOperation();
		
	
			if(update.updateStudentInfo(instuID,reg,fullName,course,email,oldreg))
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Student details updated Successful');");
				out.println("location='../OEP/production/promoteStudent.jsp';");
				out.println("</script>");
				
			}else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Something Went Wrong!.\\n\\n' \r\n" + 
						"								+ \"Possible Reasons are.\\n\"\r\n" + 
						"								+ \"1)Database Server is down.\\n\" \r\n" + 
						"								+ '2)No Network\\n\\n'  \r\n" + 
						"								+ '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\\n\\n' \r\n" + 
						"								+ 'Try again.');");
				out.println("location='../OEP/production/promoteStudent.jsp';");
				out.println("</script>");
				
			}
			
			
	}

}
