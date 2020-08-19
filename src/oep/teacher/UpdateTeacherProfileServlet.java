package oep.teacher;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UpdateTeacherProfileServlet
 */

@MultipartConfig(maxFileSize = 16177216) // 1.5MB
@WebServlet("/UpdateTeacherProfileServlet")
public class UpdateTeacherProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTeacherProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			Part picture = request.getPart("pictureFile");
			InputStream image = null;
			HttpSession session=request.getSession(true);
			System.out.println("Helloooo"+picture+"bolo");
			oep.regandlog.Registration update= new oep.regandlog.Registration();
			if (picture != null) {
				image = picture.getInputStream();
			
			
			if (update.updateTeacher(image, session.getAttribute("logedID").toString()))
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Profile Updated Successfuly');");
				out.print("window.location.href='/OEP/production/lecturers.jsp';");
				out.println("</script>");
			} else {
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Something went Wrong!Try Again');");
				out.println("location='/OEP/production/teacherProfile.jsp';");
				out.println("</script>");

			}
			
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('No Changes Made');");
				out.println("location='/OEP/production/teacherProfile.jsp';");
				out.println("</script>");
			}


		} 
			catch (Exception e) {
				e.printStackTrace();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Something went Wrong!Try again');");
				out.println("location='/OEP/production/teacherProfile.jsp';");
				out.println("</script>");
			} finally {

			}
	}
	

}
