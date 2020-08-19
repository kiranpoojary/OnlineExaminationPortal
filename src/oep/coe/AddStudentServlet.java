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
 * Servlet implementation class AddStudentServlet
 */
@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddStudentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CoeAddOperation add = new CoeAddOperation();
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
		String fName = request.getParameter("fName");
		String regNo = request.getParameter("regNo");
		String tmpPsw = request.getParameter("tmpPsw");
		int courseID = Integer.parseInt(request.getParameter("course"));
		String instuID = session.getAttribute("instuID").toString();
		String email = request.getParameter("stdEmail");
		int intInstuID = Integer.parseInt(session.getAttribute("instuID").toString());

		if (!add.getStudentExist(intInstuID, regNo)) {

			if (add.addStudent(instuID, regNo, fName, tmpPsw, courseID, email,
					session.getAttribute("instuName").toString())) {
				out.print("<script>");
				out.print("alert('Student Successfuly Registered ');");
				out.print("window.location.href='../OEP/production/addStudents.jsp';");
				out.print("</script>");

			}

			else {
				out.print("<script>");
				out.print("alert('Something Went Wrong,Try Again. ');");
				out.print("window.location.href='../OEP/production/addStudents.jsp';");
				out.print("</script>");

			}
		} else {
			out.print("<script>");
			out.print("alert('The Reg.No already exist.!');");
			out.print("window.location.href='../OEP/production/addStudents.jsp';");
			out.print("</script>");

		}
	}

}
