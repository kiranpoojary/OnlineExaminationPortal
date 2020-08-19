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
 * Servlet implementation class AddTeacherServlet
 */
@WebServlet("/AddTeacherServlet")
public class AddTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddTeacherServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		CoeAddOperation add = new CoeAddOperation();
		String TID = request.getParameter("tID");
		String instuID = request.getParameter("instuID");
		String fName = request.getParameter("fullName");
		String tmpPsw = request.getParameter("tmpPsw");
		String mobile = request.getParameter("mob");
		HttpSession session = request.getSession(true);

		if (!add.getTeacherExist(TID)) {
			if (add.addTeacher(TID, instuID, fName, tmpPsw, mobile, session.getAttribute("instuName").toString())) {
				out.print("<script>");
				out.print("alert('Teacher Successfuly Registered ');");
				out.print("window.location.href='../OEP/production/addTeachers.jsp';");
				out.print("</script>");

			}

			else {
				out.print("<script>");
				out.print("alert('Something Went Wrong ');");
				out.print("window.location.href='../OEP/production/addTeachers.jsp';");
				out.print("</script>");

			}

		} else {
			out.print("<script>");
			out.print("alert('The lecture email Id :"+TID+" already registered');");
			out.print("window.location.href='../OEP/production/addTeachers.jsp';");
			out.print("</script>");
		}

	}

}
