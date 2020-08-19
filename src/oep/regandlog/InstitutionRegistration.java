package oep.regandlog;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class InstitutionRegistration
 */
@WebServlet("/InstitutionRegistration")
public class InstitutionRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InstitutionRegistration() {
        super();
        
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession(true);
			
			String iname = request.getParameter("fname");
	        String addr = request.getParameter("addr");
	        String country = request.getParameter("country");
	        String state = request.getParameter("state");
	        String district = request.getParameter("dist");
	        int zip = Integer.parseInt(request.getParameter("zip"));
	        String site = request.getParameter("site");
			session.setAttribute("iname", iname);
			session.setAttribute("addr", addr);
			session.setAttribute("country", country);
			session.setAttribute("state", state);
			session.setAttribute("district", district);
			session.setAttribute("zip", zip);
			session.setAttribute("site", site);
			
			response.sendRedirect("COERegistration.jsp");

		} catch (Exception e) {
			// TODO: handle exception
		} finally {

		}
		
	}

}
