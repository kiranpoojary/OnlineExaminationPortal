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
 * Servlet implementation class CourseAddServlet
 */
@WebServlet("/CourseAddServlet")
public class CourseAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CourseAddServlet() {
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
		PrintWriter out = response.getWriter();
		String courseName = request.getParameter("courseName");
		String courseType = request.getParameter("cType");
		int totalSem = Integer.parseInt(request.getParameter("totalSems").toString());
		HttpSession session = request.getSession();
		int instuID = Integer.parseInt(session.getAttribute("instuID").toString());

		if (!add.getCourseExist(instuID, courseName)) {

			if (add.addCourse(courseName, courseType, request)) {
				int courseID = add.getCourseID(instuID, courseName);
				for (int sem = 1; sem <= totalSem; sem++) {
					if (!add.addCourseSem(courseID, courseName + "-SEM" + sem)) {
						out.print("<script>");
						out.print("alert('Something wrong while adding semesters');");
						out.print("window.location.href='../OEP/production/addCourses.jsp';");
						out.print("</script>");
					}
				}
				out.print("<script>");
				out.print("alert('Course And Semester Added Successfuly ');");
				out.print("window.location.href='../OEP/production/addCourses.jsp';");
				out.print("</script>");
			}else {
				out.print("<script>");
				out.print("alert('Something went wrong while adding course');");
				out.print(
						"window.location.href='../OEP/production/addCourses.jsp';");
				out.print("</script>");
			}
		} else {
			out.print("<script>");
			out.print("alert('The Course " + courseName + " is already added');");
			out.print("window.location.href='../OEP/production/addCourses.jsp';");
			out.print("</script>");
		}


	}

}
